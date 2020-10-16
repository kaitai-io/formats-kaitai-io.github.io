import kaitai_struct_nim_runtime
import options

type
  Ogg* = ref object of KaitaiStruct
    `pages`*: seq[Ogg_Page]
    `parent`*: KaitaiStruct
  Ogg_Page* = ref object of KaitaiStruct
    `syncCode`*: seq[byte]
    `version`*: seq[byte]
    `reserved1`*: uint64
    `isEndOfStream`*: bool
    `isBeginningOfStream`*: bool
    `isContinuation`*: bool
    `granulePos`*: uint64
    `bitstreamSerial`*: uint32
    `pageSeqNum`*: uint32
    `crc32`*: uint32
    `numSegments`*: uint8
    `lenSegments`*: seq[uint8]
    `segments`*: seq[seq[byte]]
    `parent`*: Ogg

proc read*(_: typedesc[Ogg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ogg
proc read*(_: typedesc[Ogg_Page], io: KaitaiStream, root: KaitaiStruct, parent: Ogg): Ogg_Page



##[
Ogg is a popular media container format, which provides basic
streaming / buffering mechanisms and is content-agnostic. Most
popular codecs that are used within Ogg streams are Vorbis (thus
making Ogg/Vorbis streams) and Theora (Ogg/Theora).

Ogg stream is a sequence Ogg pages. They can be read sequentially,
or one can jump into arbitrary stream location and scan for "OggS"
sync code to find the beginning of a new Ogg page and continue
decoding the stream contents from that one.

]##
proc read*(_: typedesc[Ogg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ogg =
  template this: untyped = result
  this = new(Ogg)
  let root = if root == nil: cast[Ogg](this) else: cast[Ogg](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Ogg_Page.read(this.io, this.root, this)
      this.pages.add(it)
      inc i

proc fromFile*(_: typedesc[Ogg], filename: string): Ogg =
  Ogg.read(newKaitaiFileStream(filename), nil, nil)


##[
Ogg page is a basic unit of data in an Ogg bitstream, usually
it's around 4-8 KB, with a maximum size of 65307 bytes.

]##
proc read*(_: typedesc[Ogg_Page], io: KaitaiStream, root: KaitaiStruct, parent: Ogg): Ogg_Page =
  template this: untyped = result
  this = new(Ogg_Page)
  let root = if root == nil: cast[Ogg](this) else: cast[Ogg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let syncCodeExpr = this.io.readBytes(int(4))
  this.syncCode = syncCodeExpr

  ##[
  Version of the Ogg bitstream format. Currently must be 0.
  ]##
  let versionExpr = this.io.readBytes(int(1))
  this.version = versionExpr
  let reserved1Expr = this.io.readBitsIntBe(5)
  this.reserved1 = reserved1Expr

  ##[
  EOS (End Of Stream) mark. This page is the last page in the
logical bitstream. The EOS flag must be set on the final page of
every logical bitstream, and must not be set on any other page.

  ]##
  let isEndOfStreamExpr = this.io.readBitsIntBe(1) != 0
  this.isEndOfStream = isEndOfStreamExpr

  ##[
  BOS (Beginning Of Stream) mark. This page is the first page in
the logical bitstream. The BOS flag must be set on the first
page of every logical bitstream, and must not be set on any
other page.    

  ]##
  let isBeginningOfStreamExpr = this.io.readBitsIntBe(1) != 0
  this.isBeginningOfStream = isBeginningOfStreamExpr

  ##[
  The first packet on this page is a continuation of the previous
packet in the logical bitstream.

  ]##
  let isContinuationExpr = this.io.readBitsIntBe(1) != 0
  this.isContinuation = isContinuationExpr
  alignToByte(this.io)

  ##[
  "Granule position" is the time marker in Ogg files. It is an
abstract value, whose meaning is determined by the codec. It
may, for example, be a count of the number of samples, the
number of frames or a more complex scheme.

  ]##
  let granulePosExpr = this.io.readU8le()
  this.granulePos = granulePosExpr

  ##[
  Serial number that identifies a page as belonging to a
particular logical bitstream. Each logical bitstream in a file
has a unique value, and this field allows implementations to
deliver the pages to the appropriate decoder. In a typical
Vorbis and Theora file, one stream is the audio (Vorbis), and
the other is the video (Theora).

  ]##
  let bitstreamSerialExpr = this.io.readU4le()
  this.bitstreamSerial = bitstreamSerialExpr

  ##[
  Sequential number of page, guaranteed to be monotonically
increasing for each logical bitstream. The first page is 0, the
second 1, etc. This allows implementations to detect when data
has been lost.

  ]##
  let pageSeqNumExpr = this.io.readU4le()
  this.pageSeqNum = pageSeqNumExpr

  ##[
  This field provides a CRC32 checksum of the data in the entire
page (including the page header, calculated with the checksum
field set to 0). This allows verification that the data has not
been corrupted since it was created. Pages that fail the
checksum should be discarded. The checksum is generated using a
polynomial value of 0x04C11DB7.

  ]##
  let crc32Expr = this.io.readU4le()
  this.crc32 = crc32Expr

  ##[
  The number of segments that exist in this page. There can be a
maximum of 255 segments in any one page.

  ]##
  let numSegmentsExpr = this.io.readU1()
  this.numSegments = numSegmentsExpr

  ##[
  Table of lengths of segments.

  ]##
  for i in 0 ..< int(this.numSegments):
    let it = this.io.readU1()
    this.lenSegments.add(it)

  ##[
  Segment content bytes make up the rest of the Ogg page.
  ]##
  for i in 0 ..< int(this.numSegments):
    let it = this.io.readBytes(int(this.lenSegments[i]))
    this.segments.add(it)

proc fromFile*(_: typedesc[Ogg_Page], filename: string): Ogg_Page =
  Ogg_Page.read(newKaitaiFileStream(filename), nil, nil)

