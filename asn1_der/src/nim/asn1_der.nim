import kaitai_struct_nim_runtime
import options

type
  Asn1Der* = ref object of KaitaiStruct
    `typeTag`*: Asn1Der_TypeTag
    `len`*: Asn1Der_LenEncoded
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawBody`*: seq[byte]
  Asn1Der_TypeTag* = enum
    end_of_content = 0
    boolean = 1
    integer = 2
    bit_string = 3
    octet_string = 4
    null_value = 5
    object_id = 6
    object_descriptor = 7
    external = 8
    real = 9
    enumerated = 10
    embedded_pdv = 11
    utf8string = 12
    relative_oid = 13
    sequence_10 = 16
    printable_string = 19
    ia5string = 22
    sequence_30 = 48
    set = 49
  Asn1Der_BodySequence* = ref object of KaitaiStruct
    `entries`*: seq[Asn1Der]
    `parent`*: Asn1Der
  Asn1Der_BodyUtf8string* = ref object of KaitaiStruct
    `str`*: string
    `parent`*: Asn1Der
  Asn1Der_BodyObjectId* = ref object of KaitaiStruct
    `firstAndSecond`*: uint8
    `rest`*: seq[byte]
    `parent`*: Asn1Der
    `firstInst`: int
    `firstInstFlag`: bool
    `secondInst`: int
    `secondInstFlag`: bool
  Asn1Der_LenEncoded* = ref object of KaitaiStruct
    `b1`*: uint8
    `int2`*: uint16
    `int1`*: uint8
    `parent`*: Asn1Der
    `resultInst`: uint16
    `resultInstFlag`: bool
  Asn1Der_BodyPrintableString* = ref object of KaitaiStruct
    `str`*: string
    `parent`*: Asn1Der

proc read*(_: typedesc[Asn1Der], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Asn1Der
proc read*(_: typedesc[Asn1Der_BodySequence], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_BodySequence
proc read*(_: typedesc[Asn1Der_BodyUtf8string], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_BodyUtf8string
proc read*(_: typedesc[Asn1Der_BodyObjectId], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_BodyObjectId
proc read*(_: typedesc[Asn1Der_LenEncoded], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_LenEncoded
proc read*(_: typedesc[Asn1Der_BodyPrintableString], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_BodyPrintableString

proc first*(this: Asn1Der_BodyObjectId): int
proc second*(this: Asn1Der_BodyObjectId): int
proc result*(this: Asn1Der_LenEncoded): uint16


##[
ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
Rules) is a standard-backed serialization scheme used in many
different use-cases. Particularly popular usage scenarios are X.509
certificates and some telecommunication / networking protocols.

DER is self-describing encoding scheme which allows representation
of simple, atomic data elements, such as strings and numbers, and
complex objects, such as sequences of other elements.

DER is a subset of BER (Basic Encoding Rules), with an emphasis on
being non-ambiguous: there's always exactly one canonical way to
encode a data structure defined in terms of ASN.1 using DER.

This spec allows full parsing of format syntax, but to understand
the semantics, one would typically require a dictionary of Object
Identifiers (OIDs), to match OID bodies against some human-readable
list of constants. OIDs are covered by many different standards,
so typically it's simpler to use a pre-compiled list of them, such
as:

* https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg
* http://oid-info.com/
* https://www.alvestrand.no/objectid/top.html

@see <a href="https://www.itu.int/itu-t/recommendations/rec.aspx?rec=12483&amp;lang=en">Source</a>
]##
proc read*(_: typedesc[Asn1Der], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Asn1Der =
  template this: untyped = result
  this = new(Asn1Der)
  let root = if root == nil: cast[Asn1Der](this) else: cast[Asn1Der](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeTagExpr = Asn1Der_TypeTag(this.io.readU1())
  this.typeTag = typeTagExpr
  let lenExpr = Asn1Der_LenEncoded.read(this.io, this.root, this)
  this.len = lenExpr
  block:
    let on = this.typeTag
    if on == asn1_der.printable_string:
      let rawBodyExpr = this.io.readBytes(int(this.len.result))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Asn1Der_BodyPrintableString.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == asn1_der.sequence_10:
      let rawBodyExpr = this.io.readBytes(int(this.len.result))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Asn1Der_BodySequence.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == asn1_der.set:
      let rawBodyExpr = this.io.readBytes(int(this.len.result))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Asn1Der_BodySequence.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == asn1_der.sequence_30:
      let rawBodyExpr = this.io.readBytes(int(this.len.result))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Asn1Der_BodySequence.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == asn1_der.utf8string:
      let rawBodyExpr = this.io.readBytes(int(this.len.result))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Asn1Der_BodyUtf8string.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == asn1_der.object_id:
      let rawBodyExpr = this.io.readBytes(int(this.len.result))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Asn1Der_BodyObjectId.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.len.result))
      this.body = bodyExpr

proc fromFile*(_: typedesc[Asn1Der], filename: string): Asn1Der =
  Asn1Der.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Asn1Der_BodySequence], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_BodySequence =
  template this: untyped = result
  this = new(Asn1Der_BodySequence)
  let root = if root == nil: cast[Asn1Der](this) else: cast[Asn1Der](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Asn1Der.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Asn1Der_BodySequence], filename: string): Asn1Der_BodySequence =
  Asn1Der_BodySequence.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Asn1Der_BodyUtf8string], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_BodyUtf8string =
  template this: untyped = result
  this = new(Asn1Der_BodyUtf8string)
  let root = if root == nil: cast[Asn1Der](this) else: cast[Asn1Der](root)
  this.io = io
  this.root = root
  this.parent = parent

  let strExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.str = strExpr

proc fromFile*(_: typedesc[Asn1Der_BodyUtf8string], filename: string): Asn1Der_BodyUtf8string =
  Asn1Der_BodyUtf8string.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://learn.microsoft.com/en-us/windows/win32/seccertenroll/about-object-identifier">Source</a>
]##
proc read*(_: typedesc[Asn1Der_BodyObjectId], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_BodyObjectId =
  template this: untyped = result
  this = new(Asn1Der_BodyObjectId)
  let root = if root == nil: cast[Asn1Der](this) else: cast[Asn1Der](root)
  this.io = io
  this.root = root
  this.parent = parent

  let firstAndSecondExpr = this.io.readU1()
  this.firstAndSecond = firstAndSecondExpr
  let restExpr = this.io.readBytesFull()
  this.rest = restExpr

proc first(this: Asn1Der_BodyObjectId): int = 
  if this.firstInstFlag:
    return this.firstInst
  let firstInstExpr = int((this.firstAndSecond div 40))
  this.firstInst = firstInstExpr
  this.firstInstFlag = true
  return this.firstInst

proc second(this: Asn1Der_BodyObjectId): int = 
  if this.secondInstFlag:
    return this.secondInst
  let secondInstExpr = int((this.firstAndSecond %%% 40))
  this.secondInst = secondInstExpr
  this.secondInstFlag = true
  return this.secondInst

proc fromFile*(_: typedesc[Asn1Der_BodyObjectId], filename: string): Asn1Der_BodyObjectId =
  Asn1Der_BodyObjectId.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Asn1Der_LenEncoded], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_LenEncoded =
  template this: untyped = result
  this = new(Asn1Der_LenEncoded)
  let root = if root == nil: cast[Asn1Der](this) else: cast[Asn1Der](root)
  this.io = io
  this.root = root
  this.parent = parent

  let b1Expr = this.io.readU1()
  this.b1 = b1Expr
  if this.b1 == 130:
    let int2Expr = this.io.readU2be()
    this.int2 = int2Expr
  if this.b1 == 129:
    let int1Expr = this.io.readU1()
    this.int1 = int1Expr

proc result(this: Asn1Der_LenEncoded): uint16 = 
  if this.resultInstFlag:
    return this.resultInst
  let resultInstExpr = uint16((if this.b1 == 129: this.int1 else: (if this.b1 == 130: this.int2 else: this.b1)))
  this.resultInst = resultInstExpr
  this.resultInstFlag = true
  return this.resultInst

proc fromFile*(_: typedesc[Asn1Der_LenEncoded], filename: string): Asn1Der_LenEncoded =
  Asn1Der_LenEncoded.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Asn1Der_BodyPrintableString], io: KaitaiStream, root: KaitaiStruct, parent: Asn1Der): Asn1Der_BodyPrintableString =
  template this: untyped = result
  this = new(Asn1Der_BodyPrintableString)
  let root = if root == nil: cast[Asn1Der](this) else: cast[Asn1Der](root)
  this.io = io
  this.root = root
  this.parent = parent

  let strExpr = encode(this.io.readBytesFull(), "ASCII")
  this.str = strExpr

proc fromFile*(_: typedesc[Asn1Der_BodyPrintableString], filename: string): Asn1Der_BodyPrintableString =
  Asn1Der_BodyPrintableString.read(newKaitaiFileStream(filename), nil, nil)

