import kaitai_struct_nim_runtime
import options

type
  AndroidSparse* = ref object of KaitaiStruct
    `headerPrefix`*: AndroidSparse_FileHeaderPrefix
    `header`*: AndroidSparse_FileHeader
    `chunks`*: seq[AndroidSparse_Chunk]
    `parent`*: KaitaiStruct
    `rawHeader`*: seq[byte]
  AndroidSparse_ChunkTypes* = enum
    raw = 51905
    fill = 51906
    dont_care = 51907
    crc32 = 51908
  AndroidSparse_FileHeaderPrefix* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: AndroidSparse_Version
    `lenHeader`*: uint16
    `parent`*: AndroidSparse
  AndroidSparse_FileHeader* = ref object of KaitaiStruct
    `lenChunkHeader`*: uint16
    `blockSize`*: uint32
    `numBlocks`*: uint32
    `numChunks`*: uint32
    `checksum`*: uint32
    `parent`*: AndroidSparse
    `versionInst`*: AndroidSparse_Version
    `lenHeaderInst`*: uint16
  AndroidSparse_Chunk* = ref object of KaitaiStruct
    `header`*: AndroidSparse_Chunk_ChunkHeader
    `body`*: KaitaiStruct
    `parent`*: AndroidSparse
    `rawHeader`*: seq[byte]
  AndroidSparse_Chunk_ChunkHeader* = ref object of KaitaiStruct
    `chunkType`*: AndroidSparse_ChunkTypes
    `reserved1`*: uint16
    `numBodyBlocks`*: uint32
    `lenChunk`*: uint32
    `parent`*: AndroidSparse_Chunk
    `lenBodyInst`*: int
    `lenBodyExpectedInst`*: int
  AndroidSparse_Version* = ref object of KaitaiStruct
    `major`*: uint16
    `minor`*: uint16
    `parent`*: AndroidSparse_FileHeaderPrefix

proc read*(_: typedesc[AndroidSparse], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidSparse
proc read*(_: typedesc[AndroidSparse_FileHeaderPrefix], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse): AndroidSparse_FileHeaderPrefix
proc read*(_: typedesc[AndroidSparse_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse): AndroidSparse_FileHeader
proc read*(_: typedesc[AndroidSparse_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse): AndroidSparse_Chunk
proc read*(_: typedesc[AndroidSparse_Chunk_ChunkHeader], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse_Chunk): AndroidSparse_Chunk_ChunkHeader
proc read*(_: typedesc[AndroidSparse_Version], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse_FileHeaderPrefix): AndroidSparse_Version

proc version*(this: AndroidSparse_FileHeader): AndroidSparse_Version
proc lenHeader*(this: AndroidSparse_FileHeader): uint16
proc lenBody*(this: AndroidSparse_Chunk_ChunkHeader): int
proc lenBodyExpected*(this: AndroidSparse_Chunk_ChunkHeader): int


##[
The Android sparse format is a format to more efficiently store files
for for example firmware updates to save on bandwidth. Files in sparse
format first have to be converted back to their original format.

A tool to create images for testing can be found in the Android source code tree:

<https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`

Note: this is not the same as the Android sparse data image format.

@see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_format.h">Source</a>
@see <a href="https://source.android.com/devices/bootloader/images#sparse-image-format">Source</a>
]##
proc read*(_: typedesc[AndroidSparse], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidSparse =
  template this: untyped = result
  this = new(AndroidSparse)
  let root = if root == nil: cast[AndroidSparse](this) else: cast[AndroidSparse](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  internal; access `_root.header` instead
  ]##
  let headerPrefixExpr = AndroidSparse_FileHeaderPrefix.read(this.io, this.root, this)
  this.headerPrefix = headerPrefixExpr
  let rawHeaderExpr = this.io.readBytes(int((this.headerPrefix.lenHeader - 10)))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = AndroidSparse_FileHeader.read(rawHeaderIo, this.root, this)
  this.header = headerExpr
  for i in 0 ..< int(this.header.numChunks):
    let it = AndroidSparse_Chunk.read(this.io, this.root, this)
    this.chunks.add(it)

proc fromFile*(_: typedesc[AndroidSparse], filename: string): AndroidSparse =
  AndroidSparse.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSparse_FileHeaderPrefix], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse): AndroidSparse_FileHeaderPrefix =
  template this: untyped = result
  this = new(AndroidSparse_FileHeaderPrefix)
  let root = if root == nil: cast[AndroidSparse](this) else: cast[AndroidSparse](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  internal; access `_root.header.version` instead
  ]##
  let versionExpr = AndroidSparse_Version.read(this.io, this.root, this)
  this.version = versionExpr

  ##[
  internal; access `_root.header.len_header` instead
  ]##
  let lenHeaderExpr = this.io.readU2le()
  this.lenHeader = lenHeaderExpr

proc fromFile*(_: typedesc[AndroidSparse_FileHeaderPrefix], filename: string): AndroidSparse_FileHeaderPrefix =
  AndroidSparse_FileHeaderPrefix.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSparse_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse): AndroidSparse_FileHeader =
  template this: untyped = result
  this = new(AndroidSparse_FileHeader)
  let root = if root == nil: cast[AndroidSparse](this) else: cast[AndroidSparse](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  size of chunk header, should be 12
  ]##
  let lenChunkHeaderExpr = this.io.readU2le()
  this.lenChunkHeader = lenChunkHeaderExpr

  ##[
  block size in bytes, must be a multiple of 4
  ]##
  let blockSizeExpr = this.io.readU4le()
  this.blockSize = blockSizeExpr

  ##[
  blocks in the original data
  ]##
  let numBlocksExpr = this.io.readU4le()
  this.numBlocks = numBlocksExpr
  let numChunksExpr = this.io.readU4le()
  this.numChunks = numChunksExpr

  ##[
  CRC32 checksum of the original data

In practice always 0; if checksum writing is requested, a CRC32 chunk is written
at the end of the file instead. The canonical `libsparse` implementation does this
and other implementations tend to follow it, see
<https://gitlab.com/ra_kete/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>

  ]##
  let checksumExpr = this.io.readU4le()
  this.checksum = checksumExpr

proc version(this: AndroidSparse_FileHeader): AndroidSparse_Version = 
  if this.versionInst != nil:
    return this.versionInst
  let versionInstExpr = AndroidSparse_Version(AndroidSparse(this.root).headerPrefix.version)
  this.versionInst = versionInstExpr
  if this.versionInst != nil:
    return this.versionInst

proc lenHeader(this: AndroidSparse_FileHeader): uint16 = 

  ##[
  size of file header, should be 28
  ]##
  if this.lenHeaderInst != nil:
    return this.lenHeaderInst
  let lenHeaderInstExpr = uint16(AndroidSparse(this.root).headerPrefix.lenHeader)
  this.lenHeaderInst = lenHeaderInstExpr
  if this.lenHeaderInst != nil:
    return this.lenHeaderInst

proc fromFile*(_: typedesc[AndroidSparse_FileHeader], filename: string): AndroidSparse_FileHeader =
  AndroidSparse_FileHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSparse_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse): AndroidSparse_Chunk =
  template this: untyped = result
  this = new(AndroidSparse_Chunk)
  let root = if root == nil: cast[AndroidSparse](this) else: cast[AndroidSparse](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawHeaderExpr = this.io.readBytes(int(AndroidSparse(this.root).header.lenChunkHeader))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = AndroidSparse_Chunk_ChunkHeader.read(rawHeaderIo, this.root, this)
  this.header = headerExpr
  block:
    let on = this.header.chunkType
    if on == android_sparse.crc32:
      let bodyExpr = KaitaiStruct(this.io.readU4le())
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.header.lenBody))
      this.body = bodyExpr

proc fromFile*(_: typedesc[AndroidSparse_Chunk], filename: string): AndroidSparse_Chunk =
  AndroidSparse_Chunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSparse_Chunk_ChunkHeader], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse_Chunk): AndroidSparse_Chunk_ChunkHeader =
  template this: untyped = result
  this = new(AndroidSparse_Chunk_ChunkHeader)
  let root = if root == nil: cast[AndroidSparse](this) else: cast[AndroidSparse](root)
  this.io = io
  this.root = root
  this.parent = parent

  let chunkTypeExpr = AndroidSparse_ChunkTypes(this.io.readU2le())
  this.chunkType = chunkTypeExpr
  let reserved1Expr = this.io.readU2le()
  this.reserved1 = reserved1Expr

  ##[
  size of the chunk body in blocks in output image
  ]##
  let numBodyBlocksExpr = this.io.readU4le()
  this.numBodyBlocks = numBodyBlocksExpr

  ##[
  in bytes of chunk input file including chunk header and data
  ]##
  let lenChunkExpr = this.io.readU4le()
  this.lenChunk = lenChunkExpr

proc lenBody(this: AndroidSparse_Chunk_ChunkHeader): int = 
  if this.lenBodyInst != nil:
    return this.lenBodyInst
  let lenBodyInstExpr = int((this.lenChunk - AndroidSparse(this.root).header.lenChunkHeader))
  this.lenBodyInst = lenBodyInstExpr
  if this.lenBodyInst != nil:
    return this.lenBodyInst

proc lenBodyExpected(this: AndroidSparse_Chunk_ChunkHeader): int = 

  ##[
  @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#184">Source</a>
  @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#215">Source</a>
  @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#249">Source</a>
  @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#270">Source</a>
  ]##
  if this.lenBodyExpectedInst != nil:
    return this.lenBodyExpectedInst
  let lenBodyExpectedInstExpr = int((if this.chunkType == android_sparse.raw: (AndroidSparse(this.root).header.blockSize * this.numBodyBlocks) else: (if this.chunkType == android_sparse.fill: 4 else: (if this.chunkType == android_sparse.dont_care: 0 else: (if this.chunkType == android_sparse.crc32: 4 else: -1)))))
  this.lenBodyExpectedInst = lenBodyExpectedInstExpr
  if this.lenBodyExpectedInst != nil:
    return this.lenBodyExpectedInst

proc fromFile*(_: typedesc[AndroidSparse_Chunk_ChunkHeader], filename: string): AndroidSparse_Chunk_ChunkHeader =
  AndroidSparse_Chunk_ChunkHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSparse_Version], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSparse_FileHeaderPrefix): AndroidSparse_Version =
  template this: untyped = result
  this = new(AndroidSparse_Version)
  let root = if root == nil: cast[AndroidSparse](this) else: cast[AndroidSparse](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readU2le()
  this.major = majorExpr
  let minorExpr = this.io.readU2le()
  this.minor = minorExpr

proc fromFile*(_: typedesc[AndroidSparse_Version], filename: string): AndroidSparse_Version =
  AndroidSparse_Version.read(newKaitaiFileStream(filename), nil, nil)

