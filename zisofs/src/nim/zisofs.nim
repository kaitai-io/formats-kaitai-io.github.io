import kaitai_struct_nim_runtime
import options

type
  Zisofs* = ref object of KaitaiStruct
    `header`*: Zisofs_Header
    `blockPointers`*: seq[uint32]
    `parent`*: KaitaiStruct
    `rawHeader`*: seq[byte]
    `blocksInst`*: seq[Zisofs_Block]
  Zisofs_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `uncompressedSize`*: uint32
    `lenHeader`*: uint8
    `blockSizeLog2`*: uint8
    `reserved`*: seq[byte]
    `parent`*: Zisofs
    `blockSizeInst`*: int
    `numBlocksInst`*: int
  Zisofs_Block* = ref object of KaitaiStruct
    `ofsStart`*: uint32
    `ofsEnd`*: uint32
    `parent`*: Zisofs
    `lenDataInst`*: int
    `dataInst`*: seq[byte]

proc read*(_: typedesc[Zisofs], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zisofs
proc read*(_: typedesc[Zisofs_Header], io: KaitaiStream, root: KaitaiStruct, parent: Zisofs): Zisofs_Header
proc read*(_: typedesc[Zisofs_Block], io: KaitaiStream, root: KaitaiStruct, parent: Zisofs, ofsStart: any, ofsEnd: any): Zisofs_Block

proc blocks*(this: Zisofs): seq[Zisofs_Block]
proc blockSize*(this: Zisofs_Header): int
proc numBlocks*(this: Zisofs_Header): int
proc lenData*(this: Zisofs_Block): int
proc data*(this: Zisofs_Block): seq[byte]


##[
zisofs is a compression format for files on ISO9660 file system. It has
limited support across operating systems, mainly Linux kernel. Typically a
directory tree is first preprocessed by mkzftree (from the zisofs-tools
package before being turned into an ISO9660 image by mkisofs, genisoimage
or similar tool. The data is zlib compressed.

The specification here describes the structure of a file that has been
preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
decompressed, as blocks with length 0 have a special meaning. Decompression
and deconstruction of this data should be done outside of Kaitai Struct.

@see <a href="https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs">Source</a>
]##
proc read*(_: typedesc[Zisofs], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zisofs =
  template this: untyped = result
  this = new(Zisofs)
  let root = if root == nil: cast[Zisofs](this) else: cast[Zisofs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawHeaderExpr = this.io.readBytes(int(16))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = Zisofs_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr

  ##[
  The final pointer (`block_pointers[header.num_blocks]`) indicates the end
of the last block. Typically this is also the end of the file data.

  ]##
  for i in 0 ..< int((this.header.numBlocks + 1)):
    let it = this.io.readU4le()
    this.blockPointers.add(it)

proc blocks(this: Zisofs): seq[Zisofs_Block] = 
  if this.blocksInst.len != 0:
    return this.blocksInst
  for i in 0 ..< int(this.header.numBlocks):
    let it = Zisofs_Block.read(this.io, this.root, this, this.blockPointers[i], this.blockPointers[(i + 1)])
    this.blocksInst.add(it)
  if this.blocksInst.len != 0:
    return this.blocksInst

proc fromFile*(_: typedesc[Zisofs], filename: string): Zisofs =
  Zisofs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zisofs_Header], io: KaitaiStream, root: KaitaiStruct, parent: Zisofs): Zisofs_Header =
  template this: untyped = result
  this = new(Zisofs_Header)
  let root = if root == nil: cast[Zisofs](this) else: cast[Zisofs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(8))
  this.magic = magicExpr

  ##[
  Size of the original uncompressed file
  ]##
  let uncompressedSizeExpr = this.io.readU4le()
  this.uncompressedSize = uncompressedSizeExpr

  ##[
  header_size >> 2 (currently 4)
  ]##
  let lenHeaderExpr = this.io.readU1()
  this.lenHeader = lenHeaderExpr
  let blockSizeLog2Expr = this.io.readU1()
  this.blockSizeLog2 = blockSizeLog2Expr
  let reservedExpr = this.io.readBytes(int(2))
  this.reserved = reservedExpr

proc blockSize(this: Zisofs_Header): int = 
  if this.blockSizeInst != nil:
    return this.blockSizeInst
  let blockSizeInstExpr = int((1 shl this.blockSizeLog2))
  this.blockSizeInst = blockSizeInstExpr
  if this.blockSizeInst != nil:
    return this.blockSizeInst

proc numBlocks(this: Zisofs_Header): int = 

  ##[
  ceil(uncompressed_size / block_size)
  ]##
  if this.numBlocksInst != nil:
    return this.numBlocksInst
  let numBlocksInstExpr = int(((this.uncompressedSize div this.blockSize) + (if (this.uncompressedSize %%% this.blockSize) != 0: 1 else: 0)))
  this.numBlocksInst = numBlocksInstExpr
  if this.numBlocksInst != nil:
    return this.numBlocksInst

proc fromFile*(_: typedesc[Zisofs_Header], filename: string): Zisofs_Header =
  Zisofs_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zisofs_Block], io: KaitaiStream, root: KaitaiStruct, parent: Zisofs, ofsStart: any, ofsEnd: any): Zisofs_Block =
  template this: untyped = result
  this = new(Zisofs_Block)
  let root = if root == nil: cast[Zisofs](this) else: cast[Zisofs](root)
  this.io = io
  this.root = root
  this.parent = parent
  let ofsStartExpr = uint32(ofsStart)
  this.ofsStart = ofsStartExpr
  let ofsEndExpr = uint32(ofsEnd)
  this.ofsEnd = ofsEndExpr


proc lenData(this: Zisofs_Block): int = 
  if this.lenDataInst != nil:
    return this.lenDataInst
  let lenDataInstExpr = int((this.ofsEnd - this.ofsStart))
  this.lenDataInst = lenDataInstExpr
  if this.lenDataInst != nil:
    return this.lenDataInst

proc data(this: Zisofs_Block): seq[byte] = 
  if this.dataInst.len != 0:
    return this.dataInst
  let io = Zisofs(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsStart))
  let dataInstExpr = io.readBytes(int(this.lenData))
  this.dataInst = dataInstExpr
  io.seek(pos)
  if this.dataInst.len != 0:
    return this.dataInst

proc fromFile*(_: typedesc[Zisofs_Block], filename: string): Zisofs_Block =
  Zisofs_Block.read(newKaitaiFileStream(filename), nil, nil)

