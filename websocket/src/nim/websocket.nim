import kaitai_struct_nim_runtime
import options

type
  Websocket* = ref object of KaitaiStruct
    `initialFrame`*: Websocket_InitialFrame
    `trailingFrames`*: seq[Websocket_Dataframe]
    `parent`*: KaitaiStruct
  Websocket_Opcode* = enum
    continuation = 0
    text = 1
    binary = 2
    reserved_3 = 3
    reserved_4 = 4
    reserved_5 = 5
    reserved_6 = 6
    reserved_7 = 7
    close = 8
    ping = 9
    pong = 10
    reserved_control_b = 11
    reserved_control_c = 12
    reserved_control_d = 13
    reserved_control_e = 14
    reserved_control_f = 15
  Websocket_FrameHeader* = ref object of KaitaiStruct
    `finished`*: bool
    `reserved`*: uint64
    `opcode`*: Websocket_Opcode
    `isMasked`*: bool
    `lenPayloadPrimary`*: uint64
    `lenPayloadExtended1`*: uint16
    `lenPayloadExtended2`*: uint32
    `maskKey`*: uint32
    `parent`*: KaitaiStruct
    `lenPayloadInst`*: int
  Websocket_InitialFrame* = ref object of KaitaiStruct
    `header`*: Websocket_FrameHeader
    `payloadBytes`*: seq[byte]
    `payloadText`*: string
    `parent`*: Websocket
  Websocket_Dataframe* = ref object of KaitaiStruct
    `header`*: Websocket_FrameHeader
    `payloadBytes`*: seq[byte]
    `payloadText`*: string
    `parent`*: Websocket

proc read*(_: typedesc[Websocket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Websocket
proc read*(_: typedesc[Websocket_FrameHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Websocket_FrameHeader
proc read*(_: typedesc[Websocket_InitialFrame], io: KaitaiStream, root: KaitaiStruct, parent: Websocket): Websocket_InitialFrame
proc read*(_: typedesc[Websocket_Dataframe], io: KaitaiStream, root: KaitaiStruct, parent: Websocket): Websocket_Dataframe

proc lenPayload*(this: Websocket_FrameHeader): int


##[
The WebSocket protocol establishes a two-way communication channel via TCP.
Messages are made up of one or more dataframes, and are delineated by
frames with the `fin` bit set.

]##
proc read*(_: typedesc[Websocket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Websocket =
  template this: untyped = result
  this = new(Websocket)
  let root = if root == nil: cast[Websocket](this) else: cast[Websocket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let initialFrameExpr = Websocket_InitialFrame.read(this.io, this.root, this)
  this.initialFrame = initialFrameExpr
  if this.initialFrame.header.finished != true:
    block:
      var i: int
      while true:
        let it = Websocket_Dataframe.read(this.io, this.root, this)
        this.trailingFrames.add(it)
        if it.header.finished:
          break
        inc i

proc fromFile*(_: typedesc[Websocket], filename: string): Websocket =
  Websocket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Websocket_FrameHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Websocket_FrameHeader =
  template this: untyped = result
  this = new(Websocket_FrameHeader)
  let root = if root == nil: cast[Websocket](this) else: cast[Websocket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let finishedExpr = this.io.readBitsIntBe(1) != 0
  this.finished = finishedExpr
  let reservedExpr = this.io.readBitsIntBe(3)
  this.reserved = reservedExpr
  let opcodeExpr = Websocket_Opcode(this.io.readBitsIntBe(4))
  this.opcode = opcodeExpr
  let isMaskedExpr = this.io.readBitsIntBe(1) != 0
  this.isMasked = isMaskedExpr
  let lenPayloadPrimaryExpr = this.io.readBitsIntBe(7)
  this.lenPayloadPrimary = lenPayloadPrimaryExpr
  alignToByte(this.io)
  if this.lenPayloadPrimary == 126:
    let lenPayloadExtended1Expr = this.io.readU2be()
    this.lenPayloadExtended1 = lenPayloadExtended1Expr
  if this.lenPayloadPrimary == 127:
    let lenPayloadExtended2Expr = this.io.readU4be()
    this.lenPayloadExtended2 = lenPayloadExtended2Expr
  if this.isMasked:
    let maskKeyExpr = this.io.readU4be()
    this.maskKey = maskKeyExpr

proc lenPayload(this: Websocket_FrameHeader): int = 
  if this.lenPayloadInst != nil:
    return this.lenPayloadInst
  let lenPayloadInstExpr = int((if this.lenPayloadPrimary <= 125: this.lenPayloadPrimary else: (if this.lenPayloadPrimary == 126: this.lenPayloadExtended1 else: this.lenPayloadExtended2)))
  this.lenPayloadInst = lenPayloadInstExpr
  if this.lenPayloadInst != nil:
    return this.lenPayloadInst

proc fromFile*(_: typedesc[Websocket_FrameHeader], filename: string): Websocket_FrameHeader =
  Websocket_FrameHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Websocket_InitialFrame], io: KaitaiStream, root: KaitaiStruct, parent: Websocket): Websocket_InitialFrame =
  template this: untyped = result
  this = new(Websocket_InitialFrame)
  let root = if root == nil: cast[Websocket](this) else: cast[Websocket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Websocket_FrameHeader.read(this.io, this.root, this)
  this.header = headerExpr
  if this.header.opcode != websocket.text:
    let payloadBytesExpr = this.io.readBytes(int(this.header.lenPayload))
    this.payloadBytes = payloadBytesExpr
  if this.header.opcode == websocket.text:
    let payloadTextExpr = encode(this.io.readBytes(int(this.header.lenPayload)), "UTF-8")
    this.payloadText = payloadTextExpr

proc fromFile*(_: typedesc[Websocket_InitialFrame], filename: string): Websocket_InitialFrame =
  Websocket_InitialFrame.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Websocket_Dataframe], io: KaitaiStream, root: KaitaiStruct, parent: Websocket): Websocket_Dataframe =
  template this: untyped = result
  this = new(Websocket_Dataframe)
  let root = if root == nil: cast[Websocket](this) else: cast[Websocket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Websocket_FrameHeader.read(this.io, this.root, this)
  this.header = headerExpr
  if Websocket(this.root).initialFrame.header.opcode != websocket.text:
    let payloadBytesExpr = this.io.readBytes(int(this.header.lenPayload))
    this.payloadBytes = payloadBytesExpr
  if Websocket(this.root).initialFrame.header.opcode == websocket.text:
    let payloadTextExpr = encode(this.io.readBytes(int(this.header.lenPayload)), "UTF-8")
    this.payloadText = payloadTextExpr

proc fromFile*(_: typedesc[Websocket_Dataframe], filename: string): Websocket_Dataframe =
  Websocket_Dataframe.read(newKaitaiFileStream(filename), nil, nil)

