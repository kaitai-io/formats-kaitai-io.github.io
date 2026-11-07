import kaitai_struct_nim_runtime
import options

type
  TplinkMinifs* = ref object of KaitaiStruct
    `header`*: TplinkMinifs_MinifsHeader
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
  TplinkMinifs_CompressionType* = enum
    lzma = 0
    raw = 2
    lzma_2014 = 4
  TplinkMinifs_BodyV1* = ref object of KaitaiStruct
    `inodes`*: seq[TplinkMinifs_InodeV1]
    `blobsArea`*: TplinkMinifs_Dummy
    `parent`*: TplinkMinifs
    `rawBlobsArea`*: seq[byte]
  TplinkMinifs_BodyV2* = ref object of KaitaiStruct
    `lenFilesArea`*: uint32
    `filesArea`*: TplinkMinifs_FilesAreaV2
    `parent`*: TplinkMinifs
    `rawFilesArea`*: seq[byte]
  TplinkMinifs_BodyV3* = ref object of KaitaiStruct
    `lenNameTable`*: uint32
    `nameTable`*: TplinkMinifs_NameTable
    `inodes`*: seq[TplinkMinifs_Inode]
    `unnamed3`*: seq[byte]
    `lzmaMetas`*: seq[TplinkMinifs_LzmaMeta]
    `lzmaBlobsArea`*: TplinkMinifs_Dummy
    `parent`*: TplinkMinifs
    `rawNameTable`*: seq[byte]
    `rawLzmaBlobsArea`*: seq[byte]
    `has8ByteLzmaMetasInst`: bool
    `has8ByteLzmaMetasInstFlag`: bool
    `lenFirstBlobUncompressedIf8ByteMetasInst`: uint64
    `lenFirstBlobUncompressedIf8ByteMetasInstFlag`: bool
    `lenLzmaMetaInst`: int8
    `lenLzmaMetaInstFlag`: bool
    `numLzmaBlobsInst`: int
    `numLzmaBlobsInstFlag`: bool
    `ofsLzmaMetasInst`: int
    `ofsLzmaMetasInstFlag`: bool
  TplinkMinifs_Dummy* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
  TplinkMinifs_FileV2* = ref object of KaitaiStruct
    `pathMd5`*: seq[byte]
    `lenData`*: uint32
    `ofsData`*: uint32
    `lenDataUncompressed`*: uint32
    `compression`*: TplinkMinifs_CompressionType
    `data`*: seq[byte]
    `parent`*: TplinkMinifs_FilesAreaV2
  TplinkMinifs_FilesAreaV2* = ref object of KaitaiStruct
    `files`*: seq[TplinkMinifs_FileV2]
    `parent`*: TplinkMinifs_BodyV2
  TplinkMinifs_Inode* = ref object of KaitaiStruct
    `ofsDirectoryPath`*: uint32
    `ofsFileName`*: uint32
    `lzmaBlob`*: uint32
    `ofsFile`*: uint32
    `lenFile`*: uint32
    `prevMaxLzmaBlob`*: uint32
    `parent`*: TplinkMinifs_BodyV3
    `curMaxLzmaBlobInst`: int
    `curMaxLzmaBlobInstFlag`: bool
    `directoryPathInst`: string
    `directoryPathInstFlag`: bool
    `fileNameInst`: string
    `fileNameInstFlag`: bool
  TplinkMinifs_InodeV1* = ref object of KaitaiStruct
    `path`*: string
    `lenBlob`*: uint32
    `ofsBlob`*: uint32
    `prevOfsEnd`*: uint32
    `parent`*: TplinkMinifs_BodyV1
    `blobInst`: seq[byte]
    `blobInstFlag`: bool
    `ofsEndInst`: int
    `ofsEndInstFlag`: bool
  TplinkMinifs_LzmaMeta* = ref object of KaitaiStruct
    `ofsBlob`*: uint32
    `lenBlob`*: uint32
    `lenBlobUncompressed`*: uint32
    `prevOfsEnd`*: uint32
    `parent`*: TplinkMinifs_BodyV3
    `blobInst`: seq[byte]
    `blobInstFlag`: bool
    `ofsEndInst`: int
    `ofsEndInstFlag`: bool
  TplinkMinifs_MinifsHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: uint32
    `numFiles`*: uint32
    `lenLargestFile`*: uint32
    `parent`*: TplinkMinifs
  TplinkMinifs_NameTable* = ref object of KaitaiStruct
    `names`*: seq[string]
    `parent`*: TplinkMinifs_BodyV3

proc read*(_: typedesc[TplinkMinifs], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TplinkMinifs
proc read*(_: typedesc[TplinkMinifs_BodyV1], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs): TplinkMinifs_BodyV1
proc read*(_: typedesc[TplinkMinifs_BodyV2], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs): TplinkMinifs_BodyV2
proc read*(_: typedesc[TplinkMinifs_BodyV3], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs): TplinkMinifs_BodyV3
proc read*(_: typedesc[TplinkMinifs_Dummy], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TplinkMinifs_Dummy
proc read*(_: typedesc[TplinkMinifs_FileV2], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_FilesAreaV2): TplinkMinifs_FileV2
proc read*(_: typedesc[TplinkMinifs_FilesAreaV2], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV2): TplinkMinifs_FilesAreaV2
proc read*(_: typedesc[TplinkMinifs_Inode], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV3, prevMaxLzmaBlob: any): TplinkMinifs_Inode
proc read*(_: typedesc[TplinkMinifs_InodeV1], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV1, prevOfsEnd: any): TplinkMinifs_InodeV1
proc read*(_: typedesc[TplinkMinifs_LzmaMeta], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV3, prevOfsEnd: any): TplinkMinifs_LzmaMeta
proc read*(_: typedesc[TplinkMinifs_MinifsHeader], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs): TplinkMinifs_MinifsHeader
proc read*(_: typedesc[TplinkMinifs_NameTable], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV3): TplinkMinifs_NameTable

proc has8ByteLzmaMetas*(this: TplinkMinifs_BodyV3): bool
proc lenFirstBlobUncompressedIf8ByteMetas*(this: TplinkMinifs_BodyV3): uint64
proc lenLzmaMeta*(this: TplinkMinifs_BodyV3): int8
proc numLzmaBlobs*(this: TplinkMinifs_BodyV3): int
proc ofsLzmaMetas*(this: TplinkMinifs_BodyV3): int
proc curMaxLzmaBlob*(this: TplinkMinifs_Inode): int
proc directoryPath*(this: TplinkMinifs_Inode): string
proc fileName*(this: TplinkMinifs_Inode): string
proc blob*(this: TplinkMinifs_InodeV1): seq[byte]
proc ofsEnd*(this: TplinkMinifs_InodeV1): int
proc blob*(this: TplinkMinifs_LzmaMeta): seq[byte]
proc ofsEnd*(this: TplinkMinifs_LzmaMeta): int


##[
MiniFS is a file system found in certain firmware files from TP-Link
(including its Mercusys brand) and Mercury. Such firmware contains an RTOS
kernel, e.g. VxWorks in
[`RE450(V4)_210531.zip`](https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip)
([archived](https://web.archive.org/web/20261105175157/https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip))
or TPOS, TP-Link's RTOS, in
[`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).

According to a TP-Link manager quoted in a
[2021 article](https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)
([archived](https://web.archive.org/web/20230513175833/https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)),
Mercusys has been sold in China as Mercury since 2001. All Mercury images
examined contain a certificate with `O=tplink` in its issuer and subject.

All versions share the same header, and its `version` field determines the
layout of the rest of the image.

In version 3, the header is followed by a table of directory paths and file
names, followed by meta information for each file, meta information about
the LZMA compressed blobs including length, offset and uncompressed length,
and then a number of LZMA compressed blobs.

The LZMA blobs can contain the concatenated contents of multiple files.
The meta information of a file contains the offsets of its directory path
and file name, the LZMA blob (numbering starts at 0), the offset of the file
in the uncompressed data and the size of the uncompressed file.

Some version 3 images have no uncompressed length in the meta information
about the blobs (see `has_8_byte_lzma_metas` in `body_v3`).

In version 2, the header is followed by the length of the files area and a
meta information record for each file, each followed directly by the file's
data. Unlike versions 1 and 3, version 2 stores no paths or file names at
all, only the MD5 hash of each file's path.

In version 1, the header is followed by a record with the path, the compressed
length and the offset of each file, and then one LZMA blob per file.

This Kaitai Struct implementation was written independently of the paper
[Reverse Engineered MiniFS File System](https://arxiv.org/abs/2407.05064v1).
It was started in the firmware analysis project
[BANG](https://github.com/armijnhemel/binaryanalysis-ng) (Binary Analysis
Next Generation) in
[2021](https://github.com/armijnhemel/binaryanalysis-ng/commit/531203a076e3761116320b77b2b9c64a9dca6186)
and submitted to the Kaitai Struct format gallery in
[September 2023](https://github.com/kaitai-io/kaitai_struct_formats/pull/682),
whereas the paper was published in July 2024.

@see <a href="https://arxiv.org/html/2407.05064v1#S4">The paper, section 4 (version 3)</a>
@see <a href="https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py">tp_research's `Minifs.py` (version 2)</a>
@see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py">unblob's MiniFS handler (version 3)</a>
]##
proc read*(_: typedesc[TplinkMinifs], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TplinkMinifs =
  template this: untyped = result
  this = new(TplinkMinifs)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = TplinkMinifs_MinifsHeader.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    let on = this.header.version
    if on == 1:
      let bodyExpr = TplinkMinifs_BodyV1.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 2:
      let bodyExpr = TplinkMinifs_BodyV2.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 3:
      let bodyExpr = TplinkMinifs_BodyV3.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[TplinkMinifs], filename: string): TplinkMinifs =
  TplinkMinifs.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://arxiv.org/html/2407.05064v1#S2.SS2">Source</a>
]##
proc read*(_: typedesc[TplinkMinifs_BodyV1], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs): TplinkMinifs_BodyV1 =
  template this: untyped = result
  this = new(TplinkMinifs_BodyV1)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(TplinkMinifs(this.root).header.numFiles):
    let it = TplinkMinifs_InodeV1.read(this.io, this.root, this, (uint32((if i != 0: this.inodes[i - 1].ofsEnd else: 0))))
    this.inodes.add(it)
  let rawBlobsAreaExpr = this.io.readBytes(int(this.inodes[^1].ofsEnd))
  this.rawBlobsArea = rawBlobsAreaExpr
  let rawBlobsAreaIo = newKaitaiStream(rawBlobsAreaExpr)
  let blobsAreaExpr = TplinkMinifs_Dummy.read(rawBlobsAreaIo, this.root, this)
  this.blobsArea = blobsAreaExpr

proc fromFile*(_: typedesc[TplinkMinifs_BodyV1], filename: string): TplinkMinifs_BodyV1 =
  TplinkMinifs_BodyV1.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TplinkMinifs_BodyV2], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs): TplinkMinifs_BodyV2 =
  template this: untyped = result
  this = new(TplinkMinifs_BodyV2)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenFilesAreaExpr = this.io.readU4be()
  this.lenFilesArea = lenFilesAreaExpr
  let rawFilesAreaExpr = this.io.readBytes(int(this.lenFilesArea))
  this.rawFilesArea = rawFilesAreaExpr
  let rawFilesAreaIo = newKaitaiStream(rawFilesAreaExpr)
  let filesAreaExpr = TplinkMinifs_FilesAreaV2.read(rawFilesAreaIo, this.root, this)
  this.filesArea = filesAreaExpr

proc fromFile*(_: typedesc[TplinkMinifs_BodyV2], filename: string): TplinkMinifs_BodyV2 =
  TplinkMinifs_BodyV2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TplinkMinifs_BodyV3], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs): TplinkMinifs_BodyV3 =
  template this: untyped = result
  this = new(TplinkMinifs_BodyV3)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenNameTableExpr = this.io.readU4be()
  this.lenNameTable = lenNameTableExpr
  let rawNameTableExpr = this.io.readBytes(int(this.lenNameTable))
  this.rawNameTable = rawNameTableExpr
  let rawNameTableIo = newKaitaiStream(rawNameTableExpr)
  let nameTableExpr = TplinkMinifs_NameTable.read(rawNameTableIo, this.root, this)
  this.nameTable = nameTableExpr
  for i in 0 ..< int(TplinkMinifs(this.root).header.numFiles):
    let it = TplinkMinifs_Inode.read(this.io, this.root, this, (uint32((if i != 0: this.inodes[i - 1].curMaxLzmaBlob else: 0))))
    this.inodes.add(it)
  if this.ofsLzmaMetas < 0:
    let unnamed3Expr = this.io.readBytes(int(0))
    this.unnamed3 = unnamed3Expr
  for i in 0 ..< int(this.numLzmaBlobs):
    let it = TplinkMinifs_LzmaMeta.read(this.io, this.root, this, (uint32((if i != 0: this.lzmaMetas[i - 1].ofsEnd else: 0))))
    this.lzmaMetas.add(it)
  let rawLzmaBlobsAreaExpr = this.io.readBytes(int(this.lzmaMetas[^1].ofsEnd))
  this.rawLzmaBlobsArea = rawLzmaBlobsAreaExpr
  let rawLzmaBlobsAreaIo = newKaitaiStream(rawLzmaBlobsAreaExpr)
  let lzmaBlobsAreaExpr = TplinkMinifs_Dummy.read(rawLzmaBlobsAreaIo, this.root, this)
  this.lzmaBlobsArea = lzmaBlobsAreaExpr

proc has8ByteLzmaMetas(this: TplinkMinifs_BodyV3): bool = 

  ##[
  Whether each record in `lzma_metas` lacks `len_blob_uncompressed` and
is therefore 8 bytes in size instead of 12.

The MiniFS header doesn't say which size is used (both use version 3),
so this Kaitai Struct implementation infers it using a heuristic based
on the `.lzma` header of the first blob. Bytes 5 to 12 of that header
are the uncompressed size, which was unknown (all bits set) for all
blobs in all version 3 images examined. So with 8-byte records,
`len_first_blob_uncompressed_if_8_byte_metas` has all bits set. With
12-byte records, the same 8 bytes aren't the uncompressed size. With 3
or more blobs, they include a whole offset or length in `lzma_metas`,
which would have to be 4 GiB. With 1 or 2 blobs, they include the
first blob's dictionary size, which is 8 MiB in all images examined.

An image with 8-byte records and a known uncompressed size would be
rejected, or misparsed if it has a single blob and other data follows it.

In the images examined, 8-byte records occur in firmware files with
modification times from 2018 to 2022 (as stored in their ZIPs), e.g. in
[`MW301R(EU)_V2_180821.zip`](https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)
([archived](https://web.archive.org/web/20261105093950/https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)),
listed on <https://www.mercusys.com/en/download/mw301r/v2/>
([archived](https://web.archive.org/web/20261105142659/https://www.mercusys.com/en/download/mw301r/v2/)).

As far as we know, this implementation is the first description of
8-byte records. The other descriptions and tools found either assume
12 bytes or don't read `lzma_metas` at all. So there is no reference
to compare it with, and the evidence comes from the images. In all 49
distinct images examined with 8-byte records, the bytes at each
record's offset and length are exactly one complete LZMA stream. Each
such stream decompresses to exactly the length that the files packed
into it need. The file that ends last in it ends exactly where the
decompressed data ends. In addition:

* 2614 of the 7230 files in these 49 images have the same path and
  contents as a file in an image with 12-byte records. For example,
  49 files are the same in the image with 8-byte records in
  [`TL-WA850RE(EU)_V7_201029.zip`](https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip)
  ([archived](https://web.archive.org/web/20220326032207/https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip))
  and the image with 12-byte records in
  [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
  ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
* The repository
  [NurMohammadDuari/mw325r-hack-lab](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45)
  has the [files](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45/extracted-minifs)
  of the image with 8-byte records in
  [`MW325R(EU)_V2_20111620201211065426.zip`](https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)
  ([archived](https://web.archive.org/web/20261105093427/https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)).
  They match the files parsed by this implementation in all 92 files
  that can be compared. Its
  [extractor](https://github.com/NurMohammadDuari/mw325r-hack-lab/blob/024da680dbf4f9ca287d562622f02d7d8875bd45/analysis/minifs_extract.py)
  finds the blobs by searching for LZMA headers instead of reading
  `lzma_metas`.

  ]##
  if this.has8ByteLzmaMetasInstFlag:
    return this.has8ByteLzmaMetasInst
  let has8ByteLzmaMetasInstExpr = bool(this.lenFirstBlobUncompressedIf8ByteMetas == 18446744073709551615'u64)
  this.has8ByteLzmaMetasInst = has8ByteLzmaMetasInstExpr
  this.has8ByteLzmaMetasInstFlag = true
  return this.has8ByteLzmaMetasInst

proc lenFirstBlobUncompressedIf8ByteMetas(this: TplinkMinifs_BodyV3): uint64 = 

  ##[
  The uncompressed size in the `.lzma` header of the first blob, if
`lzma_metas` have 8-byte records. It follows the properties byte and the
4-byte dictionary size.

  ]##
  if this.lenFirstBlobUncompressedIf8ByteMetasInstFlag:
    return this.lenFirstBlobUncompressedIf8ByteMetasInst
  let pos = this.io.pos()
  this.io.seek(int((this.ofsLzmaMetas + 8 * this.numLzmaBlobs) + 5))
  let lenFirstBlobUncompressedIf8ByteMetasInstExpr = this.io.readU8le()
  this.lenFirstBlobUncompressedIf8ByteMetasInst = lenFirstBlobUncompressedIf8ByteMetasInstExpr
  this.io.seek(pos)
  this.lenFirstBlobUncompressedIf8ByteMetasInstFlag = true
  return this.lenFirstBlobUncompressedIf8ByteMetasInst

proc lenLzmaMeta(this: TplinkMinifs_BodyV3): int8 = 

  ##[
  The size of each record in `lzma_metas` (8 or 12 bytes).
  ]##
  if this.lenLzmaMetaInstFlag:
    return this.lenLzmaMetaInst
  let lenLzmaMetaInstExpr = int8((if this.has8ByteLzmaMetas: 8 else: 12))
  this.lenLzmaMetaInst = lenLzmaMetaInstExpr
  this.lenLzmaMetaInstFlag = true
  return this.lenLzmaMetaInst

proc numLzmaBlobs(this: TplinkMinifs_BodyV3): int = 

  ##[
  Count starts at 0, so there is one more blob than the highest blob number
  @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L129-L130">Source</a>
  ]##
  if this.numLzmaBlobsInstFlag:
    return this.numLzmaBlobsInst
  let numLzmaBlobsInstExpr = int(this.inodes[^1].curMaxLzmaBlob + 1)
  this.numLzmaBlobsInst = numLzmaBlobsInstExpr
  this.numLzmaBlobsInstFlag = true
  return this.numLzmaBlobsInst

proc ofsLzmaMetas(this: TplinkMinifs_BodyV3): int = 
  if this.ofsLzmaMetasInstFlag:
    return this.ofsLzmaMetasInst
  let ofsLzmaMetasInstExpr = int(this.io.pos)
  this.ofsLzmaMetasInst = ofsLzmaMetasInstExpr
  this.ofsLzmaMetasInstFlag = true
  return this.ofsLzmaMetasInst

proc fromFile*(_: typedesc[TplinkMinifs_BodyV3], filename: string): TplinkMinifs_BodyV3 =
  TplinkMinifs_BodyV3.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TplinkMinifs_Dummy], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TplinkMinifs_Dummy =
  template this: untyped = result
  this = new(TplinkMinifs_Dummy)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[TplinkMinifs_Dummy], filename: string): TplinkMinifs_Dummy =
  TplinkMinifs_Dummy.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52">Source</a>
]##
proc read*(_: typedesc[TplinkMinifs_FileV2], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_FilesAreaV2): TplinkMinifs_FileV2 =
  template this: untyped = result
  this = new(TplinkMinifs_FileV2)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The MD5 hash of the absolute path of the file, e.g. of
`/conf/priv-key.pem`.

Version 2 images store only these hashes, not the paths, so a path can
only be found by hashing candidate paths and comparing.
[`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
takes the candidates from path-like strings in the files' contents.

  ]##
  let pathMd5Expr = this.io.readBytes(int(16))
  this.pathMd5 = pathMd5Expr
  let lenDataExpr = this.io.readU4be()
  this.lenData = lenDataExpr

  ##[
  Offset of `data` relative to the start of `<body_v2>.files_area`.
  ]##
  let ofsDataExpr = this.io.readU4be()
  this.ofsData = ofsDataExpr
  let lenDataUncompressedExpr = this.io.readU4be()
  this.lenDataUncompressed = lenDataUncompressedExpr
  let compressionExpr = TplinkMinifs_CompressionType(this.io.readU4be())
  this.compression = compressionExpr

  ##[
  With `compression_type::lzma`, an LZMA stream in the `.lzma` format
(also known as LZMA_Alone). Decompress it in the same way as
`<lzma_meta>.blob`.

In all images examined, the `.lzma` header specifies the properties
lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
stream, and there is no end-of-payload marker.

  ]##
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr

proc fromFile*(_: typedesc[TplinkMinifs_FileV2], filename: string): TplinkMinifs_FileV2 =
  TplinkMinifs_FileV2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TplinkMinifs_FilesAreaV2], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV2): TplinkMinifs_FilesAreaV2 =
  template this: untyped = result
  this = new(TplinkMinifs_FilesAreaV2)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(TplinkMinifs(this.root).header.numFiles):
    let it = TplinkMinifs_FileV2.read(this.io, this.root, this)
    this.files.add(it)

proc fromFile*(_: typedesc[TplinkMinifs_FilesAreaV2], filename: string): TplinkMinifs_FilesAreaV2 =
  TplinkMinifs_FilesAreaV2.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://arxiv.org/html/2407.05064v1#S4.SS3">Source</a>
@see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42">Source</a>
]##
proc read*(_: typedesc[TplinkMinifs_Inode], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV3, prevMaxLzmaBlob: any): TplinkMinifs_Inode =
  template this: untyped = result
  this = new(TplinkMinifs_Inode)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent
  let prevMaxLzmaBlobExpr = uint32(prevMaxLzmaBlob)
  this.prevMaxLzmaBlob = prevMaxLzmaBlobExpr

  let ofsDirectoryPathExpr = this.io.readU4be()
  this.ofsDirectoryPath = ofsDirectoryPathExpr
  let ofsFileNameExpr = this.io.readU4be()
  this.ofsFileName = ofsFileNameExpr
  let lzmaBlobExpr = this.io.readU4be()
  this.lzmaBlob = lzmaBlobExpr
  let ofsFileExpr = this.io.readU4be()
  this.ofsFile = ofsFileExpr
  let lenFileExpr = this.io.readU4be()
  this.lenFile = lenFileExpr

proc curMaxLzmaBlob(this: TplinkMinifs_Inode): int = 
  if this.curMaxLzmaBlobInstFlag:
    return this.curMaxLzmaBlobInst
  let curMaxLzmaBlobInstExpr = int((if this.lzmaBlob > this.prevMaxLzmaBlob: this.lzmaBlob else: this.prevMaxLzmaBlob))
  this.curMaxLzmaBlobInst = curMaxLzmaBlobInstExpr
  this.curMaxLzmaBlobInstFlag = true
  return this.curMaxLzmaBlobInst

proc directoryPath(this: TplinkMinifs_Inode): string = 
  if this.directoryPathInstFlag:
    return this.directoryPathInst
  let io = this.parent.nameTable.io
  let pos = io.pos()
  io.seek(int(this.ofsDirectoryPath))
  let directoryPathInstExpr = encode(io.readBytesTerm(0, false, true, true), "ASCII")
  this.directoryPathInst = directoryPathInstExpr
  io.seek(pos)
  this.directoryPathInstFlag = true
  return this.directoryPathInst

proc fileName(this: TplinkMinifs_Inode): string = 
  if this.fileNameInstFlag:
    return this.fileNameInst
  let io = this.parent.nameTable.io
  let pos = io.pos()
  io.seek(int(this.ofsFileName))
  let fileNameInstExpr = encode(io.readBytesTerm(0, false, true, true), "ASCII")
  this.fileNameInst = fileNameInstExpr
  io.seek(pos)
  this.fileNameInstFlag = true
  return this.fileNameInst

proc fromFile*(_: typedesc[TplinkMinifs_Inode], filename: string): TplinkMinifs_Inode =
  TplinkMinifs_Inode.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TplinkMinifs_InodeV1], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV1, prevOfsEnd: any): TplinkMinifs_InodeV1 =
  template this: untyped = result
  this = new(TplinkMinifs_InodeV1)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent
  let prevOfsEndExpr = uint32(prevOfsEnd)
  this.prevOfsEnd = prevOfsEndExpr

  let pathExpr = encode(this.io.readBytes(int(80)).bytesTerminate(0, false), "ASCII")
  this.path = pathExpr
  let lenBlobExpr = this.io.readU4be()
  this.lenBlob = lenBlobExpr

  ##[
  Relative to the start of `<body_v1>.blobs_area`.
  ]##
  let ofsBlobExpr = this.io.readU4be()
  this.ofsBlob = ofsBlobExpr

proc blob(this: TplinkMinifs_InodeV1): seq[byte] = 

  ##[
  An LZMA stream in the `.lzma` format (also known as LZMA_Alone) with
the contents of the file. Decompress it in the same way as
`<lzma_meta>.blob`.

In all images examined, the `.lzma` header specifies the properties
lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
stream, and there is no end-of-payload marker.

  ]##
  if this.blobInstFlag:
    return this.blobInst
  let io = this.parent.blobsArea.io
  let pos = io.pos()
  io.seek(int(this.ofsBlob))
  let blobInstExpr = io.readBytes(int(this.lenBlob))
  this.blobInst = blobInstExpr
  io.seek(pos)
  this.blobInstFlag = true
  return this.blobInst

proc ofsEnd(this: TplinkMinifs_InodeV1): int = 
  if this.ofsEndInstFlag:
    return this.ofsEndInst
  let ofsEndInstExpr = int(this.ofsBlob + this.lenBlob)
  this.ofsEndInst = ofsEndInstExpr
  this.ofsEndInstFlag = true
  return this.ofsEndInst

proc fromFile*(_: typedesc[TplinkMinifs_InodeV1], filename: string): TplinkMinifs_InodeV1 =
  TplinkMinifs_InodeV1.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://arxiv.org/html/2407.05064v1#S4.SS4">Source</a>
@see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48">Source</a>
]##
proc read*(_: typedesc[TplinkMinifs_LzmaMeta], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV3, prevOfsEnd: any): TplinkMinifs_LzmaMeta =
  template this: untyped = result
  this = new(TplinkMinifs_LzmaMeta)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent
  let prevOfsEndExpr = uint32(prevOfsEnd)
  this.prevOfsEnd = prevOfsEndExpr

  let ofsBlobExpr = this.io.readU4be()
  this.ofsBlob = ofsBlobExpr
  let lenBlobExpr = this.io.readU4be()
  this.lenBlob = lenBlobExpr
  if not(this.parent.has8ByteLzmaMetas):
    let lenBlobUncompressedExpr = this.io.readU4be()
    this.lenBlobUncompressed = lenBlobUncompressedExpr

proc blob(this: TplinkMinifs_LzmaMeta): seq[byte] = 

  ##[
  An LZMA stream in the `.lzma` format (also known as LZMA_Alone):
a 13-byte header followed by the compressed data. Decompress it
with a ready-made LZMA decoder that reads this header, e.g. in
Python with `lzma.decompress(blob, format=lzma.FORMAT_ALONE)`. The
size of the decompressed data is `len_blob_uncompressed`, if present.

In all images examined with `header.version` = 3, the `.lzma` header
specifies the properties lc = 3, lp = 0, pb = 2 and an 8 MiB
dictionary, so it starts with the bytes `5D 00 00 80 00`. The
uncompressed size in the header is unknown (`0xFFFF_FFFF_FFFF_FFFF`),
so the stream ends with an end-of-payload marker.

  @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS5">Source</a>
  @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L175-L187">Source</a>
  ]##
  if this.blobInstFlag:
    return this.blobInst
  let io = this.parent.lzmaBlobsArea.io
  let pos = io.pos()
  io.seek(int(this.ofsBlob))
  let blobInstExpr = io.readBytes(int(this.lenBlob))
  this.blobInst = blobInstExpr
  io.seek(pos)
  this.blobInstFlag = true
  return this.blobInst

proc ofsEnd(this: TplinkMinifs_LzmaMeta): int = 
  if this.ofsEndInstFlag:
    return this.ofsEndInst
  let ofsEndInstExpr = int(this.ofsBlob + this.lenBlob)
  this.ofsEndInst = ofsEndInstExpr
  this.ofsEndInstFlag = true
  return this.ofsEndInst

proc fromFile*(_: typedesc[TplinkMinifs_LzmaMeta], filename: string): TplinkMinifs_LzmaMeta =
  TplinkMinifs_LzmaMeta.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://arxiv.org/html/2407.05064v1#S4.SS1">Source</a>
@see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34">Source</a>
]##
proc read*(_: typedesc[TplinkMinifs_MinifsHeader], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs): TplinkMinifs_MinifsHeader =
  template this: untyped = result
  this = new(TplinkMinifs_MinifsHeader)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(16))
  this.magic = magicExpr
  let versionExpr = this.io.readU4be()
  this.version = versionExpr
  let numFilesExpr = this.io.readU4be()
  this.numFiles = numFilesExpr

  ##[
  The uncompressed size of the largest file. In all images examined with
version 3, the inodes are sorted by size in descending order, so it is
also the size of the first file. In all images examined with versions
1 and 2, the value is rounded up to a multiple of 4.

  ]##
  let lenLargestFileExpr = this.io.readU4be()
  this.lenLargestFile = lenLargestFileExpr

proc fromFile*(_: typedesc[TplinkMinifs_MinifsHeader], filename: string): TplinkMinifs_MinifsHeader =
  TplinkMinifs_MinifsHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
Table of null-terminated directory paths and file names, referenced by
`<inode>.ofs_directory_path` and `<inode>.ofs_file_name`. In all images
examined, each non-empty string occurs only once, which saves space in
flash memory, as many files share a directory or a name.

In all images examined, the table is padded with null bytes to a multiple
of 4 bytes, so `names` can end with up to 3 empty strings (one for each
padding byte).

@see <a href="https://arxiv.org/html/2407.05064v1#S4.SS2">Source</a>
]##
proc read*(_: typedesc[TplinkMinifs_NameTable], io: KaitaiStream, root: KaitaiStruct, parent: TplinkMinifs_BodyV3): TplinkMinifs_NameTable =
  template this: untyped = result
  this = new(TplinkMinifs_NameTable)
  let root = if root == nil: cast[TplinkMinifs](this) else: cast[TplinkMinifs](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
      this.names.add(it)
      inc i

proc fromFile*(_: typedesc[TplinkMinifs_NameTable], filename: string): TplinkMinifs_NameTable =
  TplinkMinifs_NameTable.read(newKaitaiFileStream(filename), nil, nil)

