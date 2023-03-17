import kaitai_struct_nim_runtime
import options

type
  Au* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `ofsData`*: uint32
    `header`*: Au_Header
    `parent`*: KaitaiStruct
    `rawHeader`*: seq[byte]
    `lenDataInst`: int
    `lenDataInstFlag`: bool
  Au_Encodings* = enum
    mulaw_8 = 1
    linear_8 = 2
    linear_16 = 3
    linear_24 = 4
    linear_32 = 5
    float = 6
    double = 7
    fragmented = 8
    nested = 9
    dsp_core = 10
    fixed_point_8 = 11
    fixed_point_16 = 12
    fixed_point_24 = 13
    fixed_point_32 = 14
    display = 16
    mulaw_squelch = 17
    emphasized = 18
    compressed = 19
    compressed_emphasized = 20
    dsp_commands = 21
    dsp_commands_samples = 22
    adpcm_g721 = 23
    adpcm_g722 = 24
    adpcm_g723_3 = 25
    adpcm_g723_5 = 26
    alaw_8 = 27
    aes = 28
    delta_mulaw_8 = 29
  Au_Header* = ref object of KaitaiStruct
    `dataSize`*: uint32
    `encoding`*: Au_Encodings
    `sampleRate`*: uint32
    `numChannels`*: uint32
    `comment`*: string
    `parent`*: Au

proc read*(_: typedesc[Au], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Au
proc read*(_: typedesc[Au_Header], io: KaitaiStream, root: KaitaiStruct, parent: Au): Au_Header

proc lenData*(this: Au): int


##[
The NeXT/Sun audio file format.

Sample files:

* <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
* <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
* <https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>

@see <a href="https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html">Source</a>
@see <a href="http://soundfile.sapp.org/doc/NextFormat/">Source</a>
@see <a href="http://soundfile.sapp.org/doc/NextFormat/soundstruct.h">Source</a>
@see <a href="https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112">Source</a>
@see <a href="https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74">Source</a>
@see <a href="https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49">Source</a>
@see <a href="https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96">Source</a>
]##
proc read*(_: typedesc[Au], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Au =
  template this: untyped = result
  this = new(Au)
  let root = if root == nil: cast[Au](this) else: cast[Au](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let ofsDataExpr = this.io.readU4be()
  this.ofsData = ofsDataExpr
  let rawHeaderExpr = this.io.readBytes(int(((this.ofsData - 4) - 4)))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = Au_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr

proc lenData(this: Au): int = 
  if this.lenDataInstFlag:
    return this.lenDataInst
  let lenDataInstExpr = int((if this.header.dataSize == 4294967295'i64: (this.io.size - this.ofsData) else: this.header.dataSize))
  this.lenDataInst = lenDataInstExpr
  this.lenDataInstFlag = true
  return this.lenDataInst

proc fromFile*(_: typedesc[Au], filename: string): Au =
  Au.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Au_Header], io: KaitaiStream, root: KaitaiStruct, parent: Au): Au_Header =
  template this: untyped = result
  this = new(Au_Header)
  let root = if root == nil: cast[Au](this) else: cast[Au](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  don't read this field, access `_root.len_data` instead

value `0xffff_ffff` means unspecified size

  ]##
  let dataSizeExpr = this.io.readU4be()
  this.dataSize = dataSizeExpr
  let encodingExpr = Au_Encodings(this.io.readU4be())
  this.encoding = encodingExpr
  let sampleRateExpr = this.io.readU4be()
  this.sampleRate = sampleRateExpr

  ##[
  number of interleaved channels
  ]##
  let numChannelsExpr = this.io.readU4be()
  this.numChannels = numChannelsExpr

  ##[
  Most resources claim that this field must be at least 4 bytes long.
However, most programs don't enforce it, and [Audacity](
https://www.audacityteam.org/) even generates .au files with this field
being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
"NeXT files require that this chunk be at least 4 bytes (chars) long,
whereas this chunk may be zerolength in a Sun .au file."

By convention, size should be a multiple of 4 -
see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
sound playing programs, this field must have an even byte size. So a multiple
of 4 is probably best for compatibility.

Must be null-terminated. It is usually an ASCII text string, but this space
might be also used to store application-specific binary (i.e. non-ASCII) data.

  ]##
  let commentExpr = encode(this.io.readBytesFull().bytesTerminate(0, false), "ASCII")
  this.comment = commentExpr

proc fromFile*(_: typedesc[Au_Header], filename: string): Au_Header =
  Au_Header.read(newKaitaiFileStream(filename), nil, nil)

