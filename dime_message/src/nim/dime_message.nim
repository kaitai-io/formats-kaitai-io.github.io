import kaitai_struct_nim_runtime
import options

type
  DimeMessage* = ref object of KaitaiStruct
    `records`*: seq[DimeMessage_Record]
    `parent`*: KaitaiStruct
  DimeMessage_TypeFormats* = enum
    unchanged = 0
    media_type = 1
    absolute_uri = 2
    unknown = 3
    none = 4
  DimeMessage_Padding* = ref object of KaitaiStruct
    `boundaryPadding`*: seq[byte]
    `parent`*: DimeMessage_Record
  DimeMessage_OptionField* = ref object of KaitaiStruct
    `optionElements`*: seq[DimeMessage_OptionElement]
    `parent`*: DimeMessage_Record
  DimeMessage_OptionElement* = ref object of KaitaiStruct
    `elementFormat`*: uint16
    `lenElement`*: uint16
    `elementData`*: seq[byte]
    `parent`*: DimeMessage_OptionField
  DimeMessage_Record* = ref object of KaitaiStruct
    `version`*: uint64
    `isFirstRecord`*: bool
    `isLastRecord`*: bool
    `isChunkRecord`*: bool
    `typeFormat`*: DimeMessage_TypeFormats
    `reserved`*: uint64
    `lenOptions`*: uint16
    `lenId`*: uint16
    `lenType`*: uint16
    `lenData`*: uint32
    `options`*: DimeMessage_OptionField
    `optionsPadding`*: DimeMessage_Padding
    `id`*: string
    `idPadding`*: DimeMessage_Padding
    `type`*: string
    `typePadding`*: DimeMessage_Padding
    `data`*: seq[byte]
    `dataPadding`*: DimeMessage_Padding
    `parent`*: DimeMessage
    `rawOptions`*: seq[byte]

proc read*(_: typedesc[DimeMessage], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DimeMessage
proc read*(_: typedesc[DimeMessage_Padding], io: KaitaiStream, root: KaitaiStruct, parent: DimeMessage_Record): DimeMessage_Padding
proc read*(_: typedesc[DimeMessage_OptionField], io: KaitaiStream, root: KaitaiStruct, parent: DimeMessage_Record): DimeMessage_OptionField
proc read*(_: typedesc[DimeMessage_OptionElement], io: KaitaiStream, root: KaitaiStruct, parent: DimeMessage_OptionField): DimeMessage_OptionElement
proc read*(_: typedesc[DimeMessage_Record], io: KaitaiStream, root: KaitaiStruct, parent: DimeMessage): DimeMessage_Record



##[
Direct Internet Message Encapsulation (DIME)
is an old Microsoft specification for sending and receiving
SOAP messages along with additional attachments,
like binary files, XML fragments, and even other
SOAP messages, using standard transport protocols like HTTP.

Sample file: `curl -LO
https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
&& gunzip scanner_withoptions.dump.gz`

@see <a href="https://datatracker.ietf.org/doc/html/draft-nielsen-dime-02">Source</a>
@see <a href="https://learn.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime">Source</a>
@see <a href="http://imrannazar.com/Parsing-the-DIME-Message-Format">Source</a>
]##
proc read*(_: typedesc[DimeMessage], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DimeMessage =
  template this: untyped = result
  this = new(DimeMessage)
  let root = if root == nil: cast[DimeMessage](this) else: cast[DimeMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = DimeMessage_Record.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[DimeMessage], filename: string): DimeMessage =
  DimeMessage.read(newKaitaiFileStream(filename), nil, nil)


##[
padding to the next 4-byte boundary
]##
proc read*(_: typedesc[DimeMessage_Padding], io: KaitaiStream, root: KaitaiStruct, parent: DimeMessage_Record): DimeMessage_Padding =
  template this: untyped = result
  this = new(DimeMessage_Padding)
  let root = if root == nil: cast[DimeMessage](this) else: cast[DimeMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundaryPaddingExpr = this.io.readBytes(int((-(this.io.pos) %%% 4)))
  this.boundaryPadding = boundaryPaddingExpr

proc fromFile*(_: typedesc[DimeMessage_Padding], filename: string): DimeMessage_Padding =
  DimeMessage_Padding.read(newKaitaiFileStream(filename), nil, nil)


##[
the option field of the record
]##
proc read*(_: typedesc[DimeMessage_OptionField], io: KaitaiStream, root: KaitaiStruct, parent: DimeMessage_Record): DimeMessage_OptionField =
  template this: untyped = result
  this = new(DimeMessage_OptionField)
  let root = if root == nil: cast[DimeMessage](this) else: cast[DimeMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = DimeMessage_OptionElement.read(this.io, this.root, this)
      this.optionElements.add(it)
      inc i

proc fromFile*(_: typedesc[DimeMessage_OptionField], filename: string): DimeMessage_OptionField =
  DimeMessage_OptionField.read(newKaitaiFileStream(filename), nil, nil)


##[
one element of the option field
]##
proc read*(_: typedesc[DimeMessage_OptionElement], io: KaitaiStream, root: KaitaiStruct, parent: DimeMessage_OptionField): DimeMessage_OptionElement =
  template this: untyped = result
  this = new(DimeMessage_OptionElement)
  let root = if root == nil: cast[DimeMessage](this) else: cast[DimeMessage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let elementFormatExpr = this.io.readU2be()
  this.elementFormat = elementFormatExpr
  let lenElementExpr = this.io.readU2be()
  this.lenElement = lenElementExpr
  let elementDataExpr = this.io.readBytes(int(this.lenElement))
  this.elementData = elementDataExpr

proc fromFile*(_: typedesc[DimeMessage_OptionElement], filename: string): DimeMessage_OptionElement =
  DimeMessage_OptionElement.read(newKaitaiFileStream(filename), nil, nil)


##[
each individual fragment of the message
]##
proc read*(_: typedesc[DimeMessage_Record], io: KaitaiStream, root: KaitaiStruct, parent: DimeMessage): DimeMessage_Record =
  template this: untyped = result
  this = new(DimeMessage_Record)
  let root = if root == nil: cast[DimeMessage](this) else: cast[DimeMessage](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  DIME format version (always 1)
  ]##
  let versionExpr = this.io.readBitsIntBe(5)
  this.version = versionExpr

  ##[
  Set if this is the first record in the message
  ]##
  let isFirstRecordExpr = this.io.readBitsIntBe(1) != 0
  this.isFirstRecord = isFirstRecordExpr

  ##[
  Set if this is the last record in the message
  ]##
  let isLastRecordExpr = this.io.readBitsIntBe(1) != 0
  this.isLastRecord = isLastRecordExpr

  ##[
  Set if the file contained in this record is chunked into multiple records
  ]##
  let isChunkRecordExpr = this.io.readBitsIntBe(1) != 0
  this.isChunkRecord = isChunkRecordExpr

  ##[
  Indicates the structure and format of the value of the TYPE field
  ]##
  let typeFormatExpr = DimeMessage_TypeFormats(this.io.readBitsIntBe(4))
  this.typeFormat = typeFormatExpr

  ##[
  Reserved for future use
  ]##
  let reservedExpr = this.io.readBitsIntBe(4)
  this.reserved = reservedExpr
  alignToByte(this.io)

  ##[
  Length of the Options field
  ]##
  let lenOptionsExpr = this.io.readU2be()
  this.lenOptions = lenOptionsExpr

  ##[
  Length of the ID field
  ]##
  let lenIdExpr = this.io.readU2be()
  this.lenId = lenIdExpr

  ##[
  Length of the Type field
  ]##
  let lenTypeExpr = this.io.readU2be()
  this.lenType = lenTypeExpr

  ##[
  Length of the Data field
  ]##
  let lenDataExpr = this.io.readU4be()
  this.lenData = lenDataExpr
  let rawOptionsExpr = this.io.readBytes(int(this.lenOptions))
  this.rawOptions = rawOptionsExpr
  let rawOptionsIo = newKaitaiStream(rawOptionsExpr)
  let optionsExpr = DimeMessage_OptionField.read(rawOptionsIo, this.root, this)
  this.options = optionsExpr
  let optionsPaddingExpr = DimeMessage_Padding.read(this.io, this.root, this)
  this.optionsPadding = optionsPaddingExpr

  ##[
  Unique identifier of the file (set in the first record of file)
  ]##
  let idExpr = encode(this.io.readBytes(int(this.lenId)), "ASCII")
  this.id = idExpr
  let idPaddingExpr = DimeMessage_Padding.read(this.io, this.root, this)
  this.idPadding = idPaddingExpr

  ##[
  Specified type in the format set with type_format
  ]##
  let typeExpr = encode(this.io.readBytes(int(this.lenType)), "ASCII")
  this.type = typeExpr
  let typePaddingExpr = DimeMessage_Padding.read(this.io, this.root, this)
  this.typePadding = typePaddingExpr

  ##[
  The file data
  ]##
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr
  let dataPaddingExpr = DimeMessage_Padding.read(this.io, this.root, this)
  this.dataPadding = dataPaddingExpr

proc fromFile*(_: typedesc[DimeMessage_Record], filename: string): DimeMessage_Record =
  DimeMessage_Record.read(newKaitaiFileStream(filename), nil, nil)

