import kaitai_struct_nim_runtime
import options

type
  DnsPacket* = ref object of KaitaiStruct
    `transactionId`*: uint16
    `flags`*: DnsPacket_PacketFlags
    `qdcount`*: uint16
    `ancount`*: uint16
    `nscount`*: uint16
    `arcount`*: uint16
    `queries`*: seq[DnsPacket_Query]
    `answers`*: seq[DnsPacket_Answer]
    `authorities`*: seq[DnsPacket_Answer]
    `additionals`*: seq[DnsPacket_Answer]
    `parent`*: KaitaiStruct
  DnsPacket_ClassType* = enum
    in_class = 1
    cs = 2
    ch = 3
    hs = 4
  DnsPacket_TypeType* = enum
    a = 1
    ns = 2
    md = 3
    mf = 4
    cname = 5
    soa = 6
    mb = 7
    mg = 8
    mr = 9
    null = 10
    wks = 11
    ptr = 12
    hinfo = 13
    minfo = 14
    mx = 15
    txt = 16
    aaaa = 28
    srv = 33
  DnsPacket_MxInfo* = ref object of KaitaiStruct
    `preference`*: uint16
    `mx`*: DnsPacket_DomainName
    `parent`*: DnsPacket_Answer
  DnsPacket_PointerStruct* = ref object of KaitaiStruct
    `value`*: uint8
    `parent`*: DnsPacket_Label
    `contentsInst`*: DnsPacket_DomainName
  DnsPacket_Label* = ref object of KaitaiStruct
    `length`*: uint8
    `pointer`*: DnsPacket_PointerStruct
    `name`*: string
    `parent`*: DnsPacket_DomainName
    `isPointerInst`*: bool
  DnsPacket_Query* = ref object of KaitaiStruct
    `name`*: DnsPacket_DomainName
    `type`*: DnsPacket_TypeType
    `queryClass`*: DnsPacket_ClassType
    `parent`*: DnsPacket
  DnsPacket_DomainName* = ref object of KaitaiStruct
    `name`*: seq[DnsPacket_Label]
    `parent`*: KaitaiStruct
  DnsPacket_AddressV6* = ref object of KaitaiStruct
    `ipV6`*: seq[byte]
    `parent`*: DnsPacket_Answer
  DnsPacket_Service* = ref object of KaitaiStruct
    `priority`*: uint16
    `weight`*: uint16
    `port`*: uint16
    `target`*: DnsPacket_DomainName
    `parent`*: DnsPacket_Answer
  DnsPacket_Txt* = ref object of KaitaiStruct
    `length`*: uint8
    `text`*: string
    `parent`*: DnsPacket_TxtBody
  DnsPacket_TxtBody* = ref object of KaitaiStruct
    `data`*: seq[DnsPacket_Txt]
    `parent`*: DnsPacket_Answer
  DnsPacket_Address* = ref object of KaitaiStruct
    `ip`*: seq[byte]
    `parent`*: DnsPacket_Answer
  DnsPacket_Answer* = ref object of KaitaiStruct
    `name`*: DnsPacket_DomainName
    `type`*: DnsPacket_TypeType
    `answerClass`*: DnsPacket_ClassType
    `ttl`*: int32
    `rdlength`*: uint16
    `payload`*: KaitaiStruct
    `parent`*: DnsPacket
    `rawPayload`*: seq[byte]
  DnsPacket_PacketFlags* = ref object of KaitaiStruct
    `flag`*: uint16
    `parent`*: DnsPacket
    `qrInst`*: int
    `raInst`*: int
    `tcInst`*: int
    `isOpcodeValidInst`*: bool
    `rcodeInst`*: int
    `opcodeInst`*: int
    `aaInst`*: int
    `zInst`*: int
    `rdInst`*: int
    `cdInst`*: int
    `adInst`*: int
  DnsPacket_AuthorityInfo* = ref object of KaitaiStruct
    `primaryNs`*: DnsPacket_DomainName
    `resoponsibleMailbox`*: DnsPacket_DomainName
    `serial`*: uint32
    `refreshInterval`*: uint32
    `retryInterval`*: uint32
    `expireLimit`*: uint32
    `minTtl`*: uint32
    `parent`*: DnsPacket_Answer

proc read*(_: typedesc[DnsPacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DnsPacket
proc read*(_: typedesc[DnsPacket_MxInfo], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_MxInfo
proc read*(_: typedesc[DnsPacket_PointerStruct], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Label): DnsPacket_PointerStruct
proc read*(_: typedesc[DnsPacket_Label], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_DomainName): DnsPacket_Label
proc read*(_: typedesc[DnsPacket_Query], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket): DnsPacket_Query
proc read*(_: typedesc[DnsPacket_DomainName], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DnsPacket_DomainName
proc read*(_: typedesc[DnsPacket_AddressV6], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_AddressV6
proc read*(_: typedesc[DnsPacket_Service], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_Service
proc read*(_: typedesc[DnsPacket_Txt], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_TxtBody): DnsPacket_Txt
proc read*(_: typedesc[DnsPacket_TxtBody], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_TxtBody
proc read*(_: typedesc[DnsPacket_Address], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_Address
proc read*(_: typedesc[DnsPacket_Answer], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket): DnsPacket_Answer
proc read*(_: typedesc[DnsPacket_PacketFlags], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket): DnsPacket_PacketFlags
proc read*(_: typedesc[DnsPacket_AuthorityInfo], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_AuthorityInfo

proc contents*(this: DnsPacket_PointerStruct): DnsPacket_DomainName
proc isPointer*(this: DnsPacket_Label): bool
proc qr*(this: DnsPacket_PacketFlags): int
proc ra*(this: DnsPacket_PacketFlags): int
proc tc*(this: DnsPacket_PacketFlags): int
proc isOpcodeValid*(this: DnsPacket_PacketFlags): bool
proc rcode*(this: DnsPacket_PacketFlags): int
proc opcode*(this: DnsPacket_PacketFlags): int
proc aa*(this: DnsPacket_PacketFlags): int
proc z*(this: DnsPacket_PacketFlags): int
proc rd*(this: DnsPacket_PacketFlags): int
proc cd*(this: DnsPacket_PacketFlags): int
proc ad*(this: DnsPacket_PacketFlags): int


##[
(No support for Auth-Name + Add-Name for simplicity)

]##
proc read*(_: typedesc[DnsPacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DnsPacket =
  template this: untyped = result
  this = new(DnsPacket)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  ID to keep track of request/responces
  ]##
  let transactionIdExpr = this.io.readU2be()
  this.transactionId = transactionIdExpr
  let flagsExpr = DnsPacket_PacketFlags.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  How many questions are there
  ]##
  if this.flags.isOpcodeValid:
    let qdcountExpr = this.io.readU2be()
    this.qdcount = qdcountExpr

  ##[
  Number of resource records answering the question
  ]##
  if this.flags.isOpcodeValid:
    let ancountExpr = this.io.readU2be()
    this.ancount = ancountExpr

  ##[
  Number of resource records pointing toward an authority
  ]##
  if this.flags.isOpcodeValid:
    let nscountExpr = this.io.readU2be()
    this.nscount = nscountExpr

  ##[
  Number of resource records holding additional information
  ]##
  if this.flags.isOpcodeValid:
    let arcountExpr = this.io.readU2be()
    this.arcount = arcountExpr
  if this.flags.isOpcodeValid:
    for i in 0 ..< int(this.qdcount):
      let it = DnsPacket_Query.read(this.io, this.root, this)
      this.queries.add(it)
  if this.flags.isOpcodeValid:
    for i in 0 ..< int(this.ancount):
      let it = DnsPacket_Answer.read(this.io, this.root, this)
      this.answers.add(it)
  if this.flags.isOpcodeValid:
    for i in 0 ..< int(this.nscount):
      let it = DnsPacket_Answer.read(this.io, this.root, this)
      this.authorities.add(it)
  if this.flags.isOpcodeValid:
    for i in 0 ..< int(this.arcount):
      let it = DnsPacket_Answer.read(this.io, this.root, this)
      this.additionals.add(it)

proc fromFile*(_: typedesc[DnsPacket], filename: string): DnsPacket =
  DnsPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_MxInfo], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_MxInfo =
  template this: untyped = result
  this = new(DnsPacket_MxInfo)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let preferenceExpr = this.io.readU2be()
  this.preference = preferenceExpr
  let mxExpr = DnsPacket_DomainName.read(this.io, this.root, this)
  this.mx = mxExpr

proc fromFile*(_: typedesc[DnsPacket_MxInfo], filename: string): DnsPacket_MxInfo =
  DnsPacket_MxInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_PointerStruct], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Label): DnsPacket_PointerStruct =
  template this: untyped = result
  this = new(DnsPacket_PointerStruct)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Read one byte, then offset to that position, read one domain-name and return
  ]##
  let valueExpr = this.io.readU1()
  this.value = valueExpr

proc contents(this: DnsPacket_PointerStruct): DnsPacket_DomainName = 
  if this.contentsInst != nil:
    return this.contentsInst
  let io = DnsPacket(this.root).io
  let pos = io.pos()
  io.seek(int((this.value + ((this.parent.length - 192) shl 8))))
  let contentsInstExpr = DnsPacket_DomainName.read(io, this.root, this)
  this.contentsInst = contentsInstExpr
  io.seek(pos)
  if this.contentsInst != nil:
    return this.contentsInst

proc fromFile*(_: typedesc[DnsPacket_PointerStruct], filename: string): DnsPacket_PointerStruct =
  DnsPacket_PointerStruct.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_Label], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_DomainName): DnsPacket_Label =
  template this: untyped = result
  this = new(DnsPacket_Label)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
  ]##
  let lengthExpr = this.io.readU1()
  this.length = lengthExpr
  if this.isPointer:
    let pointerExpr = DnsPacket_PointerStruct.read(this.io, this.root, this)
    this.pointer = pointerExpr

  ##[
  Otherwise its a string the length of the length value
  ]##
  if not(this.isPointer):
    let nameExpr = encode(this.io.readBytes(int(this.length)), "utf-8")
    this.name = nameExpr

proc isPointer(this: DnsPacket_Label): bool = 
  if this.isPointerInst != nil:
    return this.isPointerInst
  let isPointerInstExpr = bool(this.length >= 192)
  this.isPointerInst = isPointerInstExpr
  if this.isPointerInst != nil:
    return this.isPointerInst

proc fromFile*(_: typedesc[DnsPacket_Label], filename: string): DnsPacket_Label =
  DnsPacket_Label.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_Query], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket): DnsPacket_Query =
  template this: untyped = result
  this = new(DnsPacket_Query)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = DnsPacket_DomainName.read(this.io, this.root, this)
  this.name = nameExpr
  let typeExpr = DnsPacket_TypeType(this.io.readU2be())
  this.type = typeExpr
  let queryClassExpr = DnsPacket_ClassType(this.io.readU2be())
  this.queryClass = queryClassExpr

proc fromFile*(_: typedesc[DnsPacket_Query], filename: string): DnsPacket_Query =
  DnsPacket_Query.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_DomainName], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DnsPacket_DomainName =
  template this: untyped = result
  this = new(DnsPacket_DomainName)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
  ]##
  block:
    var i: int
    while true:
      let it = DnsPacket_Label.read(this.io, this.root, this)
      this.name.add(it)
      if  ((it.length == 0) or (it.length >= 192)) :
        break
      inc i

proc fromFile*(_: typedesc[DnsPacket_DomainName], filename: string): DnsPacket_DomainName =
  DnsPacket_DomainName.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_AddressV6], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_AddressV6 =
  template this: untyped = result
  this = new(DnsPacket_AddressV6)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ipV6Expr = this.io.readBytes(int(16))
  this.ipV6 = ipV6Expr

proc fromFile*(_: typedesc[DnsPacket_AddressV6], filename: string): DnsPacket_AddressV6 =
  DnsPacket_AddressV6.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_Service], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_Service =
  template this: untyped = result
  this = new(DnsPacket_Service)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let priorityExpr = this.io.readU2be()
  this.priority = priorityExpr
  let weightExpr = this.io.readU2be()
  this.weight = weightExpr
  let portExpr = this.io.readU2be()
  this.port = portExpr
  let targetExpr = DnsPacket_DomainName.read(this.io, this.root, this)
  this.target = targetExpr

proc fromFile*(_: typedesc[DnsPacket_Service], filename: string): DnsPacket_Service =
  DnsPacket_Service.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_Txt], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_TxtBody): DnsPacket_Txt =
  template this: untyped = result
  this = new(DnsPacket_Txt)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU1()
  this.length = lengthExpr
  let textExpr = encode(this.io.readBytes(int(this.length)), "utf-8")
  this.text = textExpr

proc fromFile*(_: typedesc[DnsPacket_Txt], filename: string): DnsPacket_Txt =
  DnsPacket_Txt.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_TxtBody], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_TxtBody =
  template this: untyped = result
  this = new(DnsPacket_TxtBody)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = DnsPacket_Txt.read(this.io, this.root, this)
      this.data.add(it)
      inc i

proc fromFile*(_: typedesc[DnsPacket_TxtBody], filename: string): DnsPacket_TxtBody =
  DnsPacket_TxtBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_Address], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_Address =
  template this: untyped = result
  this = new(DnsPacket_Address)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ipExpr = this.io.readBytes(int(4))
  this.ip = ipExpr

proc fromFile*(_: typedesc[DnsPacket_Address], filename: string): DnsPacket_Address =
  DnsPacket_Address.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_Answer], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket): DnsPacket_Answer =
  template this: untyped = result
  this = new(DnsPacket_Answer)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = DnsPacket_DomainName.read(this.io, this.root, this)
  this.name = nameExpr
  let typeExpr = DnsPacket_TypeType(this.io.readU2be())
  this.type = typeExpr
  let answerClassExpr = DnsPacket_ClassType(this.io.readU2be())
  this.answerClass = answerClassExpr

  ##[
  Time to live (in seconds)
  ]##
  let ttlExpr = this.io.readS4be()
  this.ttl = ttlExpr

  ##[
  Length in octets of the following payload
  ]##
  let rdlengthExpr = this.io.readU2be()
  this.rdlength = rdlengthExpr
  block:
    let on = this.type
    if on == dns_packet.srv:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_Service.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == dns_packet.a:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_Address.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == dns_packet.cname:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_DomainName.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == dns_packet.ns:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_DomainName.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == dns_packet.soa:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_AuthorityInfo.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == dns_packet.mx:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_MxInfo.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == dns_packet.txt:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_TxtBody.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == dns_packet.ptr:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_DomainName.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    elif on == dns_packet.aaaa:
      let rawPayloadExpr = this.io.readBytes(int(this.rdlength))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = DnsPacket_AddressV6.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    else:
      let payloadExpr = this.io.readBytes(int(this.rdlength))
      this.payload = payloadExpr

proc fromFile*(_: typedesc[DnsPacket_Answer], filename: string): DnsPacket_Answer =
  DnsPacket_Answer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_PacketFlags], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket): DnsPacket_PacketFlags =
  template this: untyped = result
  this = new(DnsPacket_PacketFlags)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagExpr = this.io.readU2be()
  this.flag = flagExpr

proc qr(this: DnsPacket_PacketFlags): int = 
  if this.qrInst != nil:
    return this.qrInst
  let qrInstExpr = int(((this.flag and 32768) shr 15))
  this.qrInst = qrInstExpr
  if this.qrInst != nil:
    return this.qrInst

proc ra(this: DnsPacket_PacketFlags): int = 
  if this.raInst != nil:
    return this.raInst
  let raInstExpr = int(((this.flag and 128) shr 7))
  this.raInst = raInstExpr
  if this.raInst != nil:
    return this.raInst

proc tc(this: DnsPacket_PacketFlags): int = 
  if this.tcInst != nil:
    return this.tcInst
  let tcInstExpr = int(((this.flag and 512) shr 9))
  this.tcInst = tcInstExpr
  if this.tcInst != nil:
    return this.tcInst

proc isOpcodeValid(this: DnsPacket_PacketFlags): bool = 
  if this.isOpcodeValidInst != nil:
    return this.isOpcodeValidInst
  let isOpcodeValidInstExpr = bool( ((this.opcode == 0) or (this.opcode == 1) or (this.opcode == 2)) )
  this.isOpcodeValidInst = isOpcodeValidInstExpr
  if this.isOpcodeValidInst != nil:
    return this.isOpcodeValidInst

proc rcode(this: DnsPacket_PacketFlags): int = 
  if this.rcodeInst != nil:
    return this.rcodeInst
  let rcodeInstExpr = int(((this.flag and 15) shr 0))
  this.rcodeInst = rcodeInstExpr
  if this.rcodeInst != nil:
    return this.rcodeInst

proc opcode(this: DnsPacket_PacketFlags): int = 
  if this.opcodeInst != nil:
    return this.opcodeInst
  let opcodeInstExpr = int(((this.flag and 30720) shr 11))
  this.opcodeInst = opcodeInstExpr
  if this.opcodeInst != nil:
    return this.opcodeInst

proc aa(this: DnsPacket_PacketFlags): int = 
  if this.aaInst != nil:
    return this.aaInst
  let aaInstExpr = int(((this.flag and 1024) shr 10))
  this.aaInst = aaInstExpr
  if this.aaInst != nil:
    return this.aaInst

proc z(this: DnsPacket_PacketFlags): int = 
  if this.zInst != nil:
    return this.zInst
  let zInstExpr = int(((this.flag and 64) shr 6))
  this.zInst = zInstExpr
  if this.zInst != nil:
    return this.zInst

proc rd(this: DnsPacket_PacketFlags): int = 
  if this.rdInst != nil:
    return this.rdInst
  let rdInstExpr = int(((this.flag and 256) shr 8))
  this.rdInst = rdInstExpr
  if this.rdInst != nil:
    return this.rdInst

proc cd(this: DnsPacket_PacketFlags): int = 
  if this.cdInst != nil:
    return this.cdInst
  let cdInstExpr = int(((this.flag and 16) shr 4))
  this.cdInst = cdInstExpr
  if this.cdInst != nil:
    return this.cdInst

proc ad(this: DnsPacket_PacketFlags): int = 
  if this.adInst != nil:
    return this.adInst
  let adInstExpr = int(((this.flag and 32) shr 5))
  this.adInst = adInstExpr
  if this.adInst != nil:
    return this.adInst

proc fromFile*(_: typedesc[DnsPacket_PacketFlags], filename: string): DnsPacket_PacketFlags =
  DnsPacket_PacketFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DnsPacket_AuthorityInfo], io: KaitaiStream, root: KaitaiStruct, parent: DnsPacket_Answer): DnsPacket_AuthorityInfo =
  template this: untyped = result
  this = new(DnsPacket_AuthorityInfo)
  let root = if root == nil: cast[DnsPacket](this) else: cast[DnsPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let primaryNsExpr = DnsPacket_DomainName.read(this.io, this.root, this)
  this.primaryNs = primaryNsExpr
  let resoponsibleMailboxExpr = DnsPacket_DomainName.read(this.io, this.root, this)
  this.resoponsibleMailbox = resoponsibleMailboxExpr
  let serialExpr = this.io.readU4be()
  this.serial = serialExpr
  let refreshIntervalExpr = this.io.readU4be()
  this.refreshInterval = refreshIntervalExpr
  let retryIntervalExpr = this.io.readU4be()
  this.retryInterval = retryIntervalExpr
  let expireLimitExpr = this.io.readU4be()
  this.expireLimit = expireLimitExpr
  let minTtlExpr = this.io.readU4be()
  this.minTtl = minTtlExpr

proc fromFile*(_: typedesc[DnsPacket_AuthorityInfo], filename: string): DnsPacket_AuthorityInfo =
  DnsPacket_AuthorityInfo.read(newKaitaiFileStream(filename), nil, nil)

