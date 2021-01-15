import kaitai_struct_nim_runtime
import options

type
  Hccapx* = ref object of KaitaiStruct
    `records`*: seq[Hccapx_HccapxRecord]
    `parent`*: KaitaiStruct
  Hccapx_HccapxRecord* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: uint32
    `ignoreReplayCounter`*: bool
    `messagePair`*: uint64
    `lenEssid`*: uint8
    `essid`*: seq[byte]
    `padding1`*: seq[byte]
    `keyver`*: uint8
    `keymic`*: seq[byte]
    `macAp`*: seq[byte]
    `nonceAp`*: seq[byte]
    `macStation`*: seq[byte]
    `nonceStation`*: seq[byte]
    `lenEapol`*: uint16
    `eapol`*: seq[byte]
    `padding2`*: seq[byte]
    `parent`*: Hccapx

proc read*(_: typedesc[Hccapx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Hccapx
proc read*(_: typedesc[Hccapx_HccapxRecord], io: KaitaiStream, root: KaitaiStruct, parent: Hccapx): Hccapx_HccapxRecord



##[
Native format of Hashcat password "recovery" utility

@see <a href="https://hashcat.net/wiki/doku.php?id=hccapx">Source</a>
]##
proc read*(_: typedesc[Hccapx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Hccapx =
  template this: untyped = result
  this = new(Hccapx)
  let root = if root == nil: cast[Hccapx](this) else: cast[Hccapx](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Hccapx_HccapxRecord.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[Hccapx], filename: string): Hccapx =
  Hccapx.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Hccapx_HccapxRecord], io: KaitaiStream, root: KaitaiStruct, parent: Hccapx): Hccapx_HccapxRecord =
  template this: untyped = result
  this = new(Hccapx_HccapxRecord)
  let root = if root == nil: cast[Hccapx](this) else: cast[Hccapx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  The version number of the .hccapx file format.
  ]##
  let versionExpr = this.io.readU4le()
  this.version = versionExpr

  ##[
  Indicates if the message pair matching was done based on
replay counter or not.

Whenever it was set to 1 it means that the replay counter
was ignored (i.e. it was not considered at all by the
matching algorithm).

Hashcat currently does not perform any particular action
based on this bit, but nonetheless this information could be
crucial for some 3th party tools and for
analysis/statistics. There could be some opportunity to
implement some further logic based on this particular
information also within hashcat (in the future).

  ]##
  let ignoreReplayCounterExpr = this.io.readBitsIntBe(1) != 0
  this.ignoreReplayCounter = ignoreReplayCounterExpr

  ##[
  The message_pair value describes which messages of the 4-way
handshake were combined to form the .hccapx structure. It is
always a pair of 2 messages: 1 from the AP (access point)
and 1 from the STA (client).

Furthermore, the message_pair value also gives a hint from
which of the 2 messages the EAPOL origins. This is
interesting data, but not necessarily needed for hashcat to
be able to crack the hash.

On the other hand, it could be very important to know if
"only" message 1 and message 2 were captured or if for
instance message 3 and/or message 4 were captured too. If
message 3 and/or message 4 were captured it should be a hard
evidence that the connection was established and that the
password the client used was the correct one.

  ]##
  let messagePairExpr = this.io.readBitsIntBe(7)
  this.messagePair = messagePairExpr
  alignToByte(this.io)
  let lenEssidExpr = this.io.readU1()
  this.lenEssid = lenEssidExpr
  let essidExpr = this.io.readBytes(int(this.lenEssid))
  this.essid = essidExpr
  let padding1Expr = this.io.readBytes(int((32 - this.lenEssid)))
  this.padding1 = padding1Expr

  ##[
  The flag used to distinguish WPA from WPA2 ciphers. Value of
1 means WPA, other - WPA2.

  ]##
  let keyverExpr = this.io.readU1()
  this.keyver = keyverExpr

  ##[
  The final hash value. MD5 for WPA and SHA-1 for WPA2
(truncated to 128 bit).

  ]##
  let keymicExpr = this.io.readBytes(int(16))
  this.keymic = keymicExpr

  ##[
  The BSSID (MAC address) of the access point.
  ]##
  let macApExpr = this.io.readBytes(int(6))
  this.macAp = macApExpr

  ##[
  Nonce (random salt) generated by the access point.
  ]##
  let nonceApExpr = this.io.readBytes(int(32))
  this.nonceAp = nonceApExpr

  ##[
  The MAC address of the client connecting to the access point.
  ]##
  let macStationExpr = this.io.readBytes(int(6))
  this.macStation = macStationExpr

  ##[
  Nonce (random salt) generated by the client connecting to the access point.
  ]##
  let nonceStationExpr = this.io.readBytes(int(32))
  this.nonceStation = nonceStationExpr

  ##[
  The length of the EAPOL data.
  ]##
  let lenEapolExpr = this.io.readU2le()
  this.lenEapol = lenEapolExpr
  let eapolExpr = this.io.readBytes(int(this.lenEapol))
  this.eapol = eapolExpr
  let padding2Expr = this.io.readBytes(int((256 - this.lenEapol)))
  this.padding2 = padding2Expr

proc fromFile*(_: typedesc[Hccapx_HccapxRecord], filename: string): Hccapx_HccapxRecord =
  Hccapx_HccapxRecord.read(newKaitaiFileStream(filename), nil, nil)

