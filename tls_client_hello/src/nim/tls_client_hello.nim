import kaitai_struct_nim_runtime
import options

type
  TlsClientHello* = ref object of KaitaiStruct
    `version`*: TlsClientHello_Version
    `random`*: TlsClientHello_Random
    `sessionId`*: TlsClientHello_SessionId
    `cipherSuites`*: TlsClientHello_CipherSuites
    `compressionMethods`*: TlsClientHello_CompressionMethods
    `extensions`*: TlsClientHello_Extensions
    `parent`*: KaitaiStruct
  TlsClientHello_ServerName* = ref object of KaitaiStruct
    `nameType`*: uint8
    `length`*: uint16
    `hostName`*: seq[byte]
    `parent`*: TlsClientHello_Sni
  TlsClientHello_Random* = ref object of KaitaiStruct
    `gmtUnixTime`*: uint32
    `random`*: seq[byte]
    `parent`*: TlsClientHello
  TlsClientHello_SessionId* = ref object of KaitaiStruct
    `len`*: uint8
    `sid`*: seq[byte]
    `parent`*: TlsClientHello
  TlsClientHello_Sni* = ref object of KaitaiStruct
    `listLength`*: uint16
    `serverNames`*: seq[TlsClientHello_ServerName]
    `parent`*: TlsClientHello_Extension
  TlsClientHello_CipherSuites* = ref object of KaitaiStruct
    `len`*: uint16
    `cipherSuites`*: seq[uint16]
    `parent`*: TlsClientHello
  TlsClientHello_CompressionMethods* = ref object of KaitaiStruct
    `len`*: uint8
    `compressionMethods`*: seq[byte]
    `parent`*: TlsClientHello
  TlsClientHello_Alpn* = ref object of KaitaiStruct
    `extLen`*: uint16
    `alpnProtocols`*: seq[TlsClientHello_Protocol]
    `parent`*: TlsClientHello_Extension
  TlsClientHello_Extensions* = ref object of KaitaiStruct
    `len`*: uint16
    `extensions`*: seq[TlsClientHello_Extension]
    `parent`*: TlsClientHello
  TlsClientHello_Version* = ref object of KaitaiStruct
    `major`*: uint8
    `minor`*: uint8
    `parent`*: TlsClientHello
  TlsClientHello_Protocol* = ref object of KaitaiStruct
    `strlen`*: uint8
    `name`*: seq[byte]
    `parent`*: TlsClientHello_Alpn
  TlsClientHello_Extension* = ref object of KaitaiStruct
    `type`*: uint16
    `len`*: uint16
    `body`*: KaitaiStruct
    `parent`*: TlsClientHello_Extensions
    `rawBody`*: seq[byte]

proc read*(_: typedesc[TlsClientHello], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TlsClientHello
proc read*(_: typedesc[TlsClientHello_ServerName], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Sni): TlsClientHello_ServerName
proc read*(_: typedesc[TlsClientHello_Random], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_Random
proc read*(_: typedesc[TlsClientHello_SessionId], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_SessionId
proc read*(_: typedesc[TlsClientHello_Sni], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Extension): TlsClientHello_Sni
proc read*(_: typedesc[TlsClientHello_CipherSuites], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_CipherSuites
proc read*(_: typedesc[TlsClientHello_CompressionMethods], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_CompressionMethods
proc read*(_: typedesc[TlsClientHello_Alpn], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Extension): TlsClientHello_Alpn
proc read*(_: typedesc[TlsClientHello_Extensions], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_Extensions
proc read*(_: typedesc[TlsClientHello_Version], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_Version
proc read*(_: typedesc[TlsClientHello_Protocol], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Alpn): TlsClientHello_Protocol
proc read*(_: typedesc[TlsClientHello_Extension], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Extensions): TlsClientHello_Extension


proc read*(_: typedesc[TlsClientHello], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TlsClientHello =
  template this: untyped = result
  this = new(TlsClientHello)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = TlsClientHello_Version.read(this.io, this.root, this)
  this.version = versionExpr
  let randomExpr = TlsClientHello_Random.read(this.io, this.root, this)
  this.random = randomExpr
  let sessionIdExpr = TlsClientHello_SessionId.read(this.io, this.root, this)
  this.sessionId = sessionIdExpr
  let cipherSuitesExpr = TlsClientHello_CipherSuites.read(this.io, this.root, this)
  this.cipherSuites = cipherSuitesExpr
  let compressionMethodsExpr = TlsClientHello_CompressionMethods.read(this.io, this.root, this)
  this.compressionMethods = compressionMethodsExpr
  if this.io.isEof == false:
    let extensionsExpr = TlsClientHello_Extensions.read(this.io, this.root, this)
    this.extensions = extensionsExpr

proc fromFile*(_: typedesc[TlsClientHello], filename: string): TlsClientHello =
  TlsClientHello.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_ServerName], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Sni): TlsClientHello_ServerName =
  template this: untyped = result
  this = new(TlsClientHello_ServerName)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameTypeExpr = this.io.readU1()
  this.nameType = nameTypeExpr
  let lengthExpr = this.io.readU2be()
  this.length = lengthExpr
  let hostNameExpr = this.io.readBytes(int(this.length))
  this.hostName = hostNameExpr

proc fromFile*(_: typedesc[TlsClientHello_ServerName], filename: string): TlsClientHello_ServerName =
  TlsClientHello_ServerName.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_Random], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_Random =
  template this: untyped = result
  this = new(TlsClientHello_Random)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gmtUnixTimeExpr = this.io.readU4be()
  this.gmtUnixTime = gmtUnixTimeExpr
  let randomExpr = this.io.readBytes(int(28))
  this.random = randomExpr

proc fromFile*(_: typedesc[TlsClientHello_Random], filename: string): TlsClientHello_Random =
  TlsClientHello_Random.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_SessionId], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_SessionId =
  template this: untyped = result
  this = new(TlsClientHello_SessionId)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU1()
  this.len = lenExpr
  let sidExpr = this.io.readBytes(int(this.len))
  this.sid = sidExpr

proc fromFile*(_: typedesc[TlsClientHello_SessionId], filename: string): TlsClientHello_SessionId =
  TlsClientHello_SessionId.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_Sni], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Extension): TlsClientHello_Sni =
  template this: untyped = result
  this = new(TlsClientHello_Sni)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let listLengthExpr = this.io.readU2be()
  this.listLength = listLengthExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = TlsClientHello_ServerName.read(this.io, this.root, this)
      this.serverNames.add(it)
      inc i

proc fromFile*(_: typedesc[TlsClientHello_Sni], filename: string): TlsClientHello_Sni =
  TlsClientHello_Sni.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_CipherSuites], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_CipherSuites =
  template this: untyped = result
  this = new(TlsClientHello_CipherSuites)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU2be()
  this.len = lenExpr
  for i in 0 ..< int((this.len div 2)):
    let it = this.io.readU2be()
    this.cipherSuites.add(it)

proc fromFile*(_: typedesc[TlsClientHello_CipherSuites], filename: string): TlsClientHello_CipherSuites =
  TlsClientHello_CipherSuites.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_CompressionMethods], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_CompressionMethods =
  template this: untyped = result
  this = new(TlsClientHello_CompressionMethods)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU1()
  this.len = lenExpr
  let compressionMethodsExpr = this.io.readBytes(int(this.len))
  this.compressionMethods = compressionMethodsExpr

proc fromFile*(_: typedesc[TlsClientHello_CompressionMethods], filename: string): TlsClientHello_CompressionMethods =
  TlsClientHello_CompressionMethods.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_Alpn], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Extension): TlsClientHello_Alpn =
  template this: untyped = result
  this = new(TlsClientHello_Alpn)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let extLenExpr = this.io.readU2be()
  this.extLen = extLenExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = TlsClientHello_Protocol.read(this.io, this.root, this)
      this.alpnProtocols.add(it)
      inc i

proc fromFile*(_: typedesc[TlsClientHello_Alpn], filename: string): TlsClientHello_Alpn =
  TlsClientHello_Alpn.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_Extensions], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_Extensions =
  template this: untyped = result
  this = new(TlsClientHello_Extensions)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU2be()
  this.len = lenExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = TlsClientHello_Extension.read(this.io, this.root, this)
      this.extensions.add(it)
      inc i

proc fromFile*(_: typedesc[TlsClientHello_Extensions], filename: string): TlsClientHello_Extensions =
  TlsClientHello_Extensions.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_Version], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello): TlsClientHello_Version =
  template this: untyped = result
  this = new(TlsClientHello_Version)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readU1()
  this.major = majorExpr
  let minorExpr = this.io.readU1()
  this.minor = minorExpr

proc fromFile*(_: typedesc[TlsClientHello_Version], filename: string): TlsClientHello_Version =
  TlsClientHello_Version.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_Protocol], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Alpn): TlsClientHello_Protocol =
  template this: untyped = result
  this = new(TlsClientHello_Protocol)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let strlenExpr = this.io.readU1()
  this.strlen = strlenExpr
  let nameExpr = this.io.readBytes(int(this.strlen))
  this.name = nameExpr

proc fromFile*(_: typedesc[TlsClientHello_Protocol], filename: string): TlsClientHello_Protocol =
  TlsClientHello_Protocol.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TlsClientHello_Extension], io: KaitaiStream, root: KaitaiStruct, parent: TlsClientHello_Extensions): TlsClientHello_Extension =
  template this: untyped = result
  this = new(TlsClientHello_Extension)
  let root = if root == nil: cast[TlsClientHello](this) else: cast[TlsClientHello](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = this.io.readU2be()
  this.type = typeExpr
  let lenExpr = this.io.readU2be()
  this.len = lenExpr
  block:
    let on = this.type
    if on == 0:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = TlsClientHello_Sni.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == 16:
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = TlsClientHello_Alpn.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.len))
      this.body = bodyExpr

proc fromFile*(_: typedesc[TlsClientHello_Extension], filename: string): TlsClientHello_Extension =
  TlsClientHello_Extension.read(newKaitaiFileStream(filename), nil, nil)

