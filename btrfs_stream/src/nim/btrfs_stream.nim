import kaitai_struct_nim_runtime
import options

type
  BtrfsStream* = ref object of KaitaiStruct
    `header`*: BtrfsStream_SendStreamHeader
    `commands`*: seq[BtrfsStream_SendCommand]
    `parent`*: KaitaiStruct
  BtrfsStream_Command* = enum
    unspec = 0
    subvol = 1
    snapshot = 2
    mkfile = 3
    mkdir = 4
    mknod = 5
    mkfifo = 6
    mksock = 7
    symlink = 8
    rename = 9
    link = 10
    unlink = 11
    rmdir = 12
    set_xattr = 13
    remove_xattr = 14
    write = 15
    clone = 16
    truncate = 17
    chmod = 18
    chown = 19
    utimes = 20
    end = 21
    update_extent = 22
  BtrfsStream_Attribute* = enum
    unspec = 0
    uuid = 1
    ctransid = 2
    ino = 3
    size = 4
    mode = 5
    uid = 6
    gid = 7
    rdev = 8
    ctime = 9
    mtime = 10
    atime = 11
    otime = 12
    xattr_name = 13
    xattr_data = 14
    path = 15
    path_to = 16
    path_link = 17
    file_offset = 18
    data = 19
    clone_uuid = 20
    clone_ctransid = 21
    clone_path = 22
    clone_offset = 23
    clone_len = 24
  BtrfsStream_SendStreamHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: uint32
    `parent`*: BtrfsStream
  BtrfsStream_SendCommand* = ref object of KaitaiStruct
    `lenData`*: uint32
    `type`*: BtrfsStream_Command
    `checksum`*: seq[byte]
    `data`*: BtrfsStream_SendCommand_Tlvs
    `parent`*: BtrfsStream
    `rawData`*: seq[byte]
  BtrfsStream_SendCommand_Tlv* = ref object of KaitaiStruct
    `type`*: BtrfsStream_Attribute
    `length`*: uint16
    `value`*: KaitaiStruct
    `parent`*: BtrfsStream_SendCommand_Tlvs
    `rawValue`*: seq[byte]
  BtrfsStream_SendCommand_Uuid* = ref object of KaitaiStruct
    `uuid`*: seq[byte]
    `parent`*: BtrfsStream_SendCommand_Tlv
  BtrfsStream_SendCommand_Tlvs* = ref object of KaitaiStruct
    `tlv`*: seq[BtrfsStream_SendCommand_Tlv]
    `parent`*: BtrfsStream_SendCommand
  BtrfsStream_SendCommand_String* = ref object of KaitaiStruct
    `string`*: string
    `parent`*: BtrfsStream_SendCommand_Tlv
  BtrfsStream_SendCommand_Timespec* = ref object of KaitaiStruct
    `tsSec`*: int64
    `tsNsec`*: int32
    `parent`*: BtrfsStream_SendCommand_Tlv

proc read*(_: typedesc[BtrfsStream], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BtrfsStream
proc read*(_: typedesc[BtrfsStream_SendStreamHeader], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream): BtrfsStream_SendStreamHeader
proc read*(_: typedesc[BtrfsStream_SendCommand], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream): BtrfsStream_SendCommand
proc read*(_: typedesc[BtrfsStream_SendCommand_Tlv], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand_Tlvs): BtrfsStream_SendCommand_Tlv
proc read*(_: typedesc[BtrfsStream_SendCommand_Uuid], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand_Tlv): BtrfsStream_SendCommand_Uuid
proc read*(_: typedesc[BtrfsStream_SendCommand_Tlvs], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand): BtrfsStream_SendCommand_Tlvs
proc read*(_: typedesc[BtrfsStream_SendCommand_String], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand_Tlv): BtrfsStream_SendCommand_String
proc read*(_: typedesc[BtrfsStream_SendCommand_Timespec], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand_Tlv): BtrfsStream_SendCommand_Timespec



##[
Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
integral multi-device spanning in Linux file systems.
Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
different Btrfs file system. The `btrfs send` command creates a set of data modifications required
for converting one subvolume into another.
This spec can be used to disassemble the binary diff created by the `btrfs send` command.
If you want a text representation you may want to checkout `btrfs receive --dump` instead.

@see <a href="https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive.html">Source</a>
]##
proc read*(_: typedesc[BtrfsStream], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BtrfsStream =
  template this: untyped = result
  this = new(BtrfsStream)
  let root = if root == nil: cast[BtrfsStream](this) else: cast[BtrfsStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = BtrfsStream_SendStreamHeader.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = BtrfsStream_SendCommand.read(this.io, this.root, this)
      this.commands.add(it)
      inc i

proc fromFile*(_: typedesc[BtrfsStream], filename: string): BtrfsStream =
  BtrfsStream.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BtrfsStream_SendStreamHeader], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream): BtrfsStream_SendStreamHeader =
  template this: untyped = result
  this = new(BtrfsStream_SendStreamHeader)
  let root = if root == nil: cast[BtrfsStream](this) else: cast[BtrfsStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(13))
  this.magic = magicExpr
  let versionExpr = this.io.readU4le()
  this.version = versionExpr

proc fromFile*(_: typedesc[BtrfsStream_SendStreamHeader], filename: string): BtrfsStream_SendStreamHeader =
  BtrfsStream_SendStreamHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BtrfsStream_SendCommand], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream): BtrfsStream_SendCommand =
  template this: untyped = result
  this = new(BtrfsStream_SendCommand)
  let root = if root == nil: cast[BtrfsStream](this) else: cast[BtrfsStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let typeExpr = BtrfsStream_Command(this.io.readU2le())
  this.type = typeExpr

  ##[
  CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
  ]##
  let checksumExpr = this.io.readBytes(int(4))
  this.checksum = checksumExpr
  let rawDataExpr = this.io.readBytes(int(this.lenData))
  this.rawData = rawDataExpr
  let rawDataIo = newKaitaiStream(rawDataExpr)
  let dataExpr = BtrfsStream_SendCommand_Tlvs.read(rawDataIo, this.root, this)
  this.data = dataExpr

proc fromFile*(_: typedesc[BtrfsStream_SendCommand], filename: string): BtrfsStream_SendCommand =
  BtrfsStream_SendCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BtrfsStream_SendCommand_Tlv], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand_Tlvs): BtrfsStream_SendCommand_Tlv =
  template this: untyped = result
  this = new(BtrfsStream_SendCommand_Tlv)
  let root = if root == nil: cast[BtrfsStream](this) else: cast[BtrfsStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = BtrfsStream_Attribute(this.io.readU2le())
  this.type = typeExpr
  let lengthExpr = this.io.readU2le()
  this.length = lengthExpr
  block:
    let on = this.type
    if on == btrfs_stream.ctransid:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.size:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.clone_uuid:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_Uuid.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.file_offset:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.otime:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_Timespec.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.uid:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.atime:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_Timespec.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.ctime:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_Timespec.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.uuid:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_Uuid.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.clone_len:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.xattr_name:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_String.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.clone_ctransid:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.mode:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.mtime:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_Timespec.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.path_link:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_String.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.rdev:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.path_to:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_String.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.path:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_String.read(rawValueIo, this.root, this)
      this.value = valueExpr
    elif on == btrfs_stream.clone_offset:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.gid:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == btrfs_stream.clone_path:
      let rawValueExpr = this.io.readBytes(int(this.length))
      this.rawValue = rawValueExpr
      let rawValueIo = newKaitaiStream(rawValueExpr)
      let valueExpr = BtrfsStream_SendCommand_String.read(rawValueIo, this.root, this)
      this.value = valueExpr
    else:
      let valueExpr = this.io.readBytes(int(this.length))
      this.value = valueExpr

proc fromFile*(_: typedesc[BtrfsStream_SendCommand_Tlv], filename: string): BtrfsStream_SendCommand_Tlv =
  BtrfsStream_SendCommand_Tlv.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BtrfsStream_SendCommand_Uuid], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand_Tlv): BtrfsStream_SendCommand_Uuid =
  template this: untyped = result
  this = new(BtrfsStream_SendCommand_Uuid)
  let root = if root == nil: cast[BtrfsStream](this) else: cast[BtrfsStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let uuidExpr = this.io.readBytes(int(16))
  this.uuid = uuidExpr

proc fromFile*(_: typedesc[BtrfsStream_SendCommand_Uuid], filename: string): BtrfsStream_SendCommand_Uuid =
  BtrfsStream_SendCommand_Uuid.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BtrfsStream_SendCommand_Tlvs], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand): BtrfsStream_SendCommand_Tlvs =
  template this: untyped = result
  this = new(BtrfsStream_SendCommand_Tlvs)
  let root = if root == nil: cast[BtrfsStream](this) else: cast[BtrfsStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = BtrfsStream_SendCommand_Tlv.read(this.io, this.root, this)
      this.tlv.add(it)
      inc i

proc fromFile*(_: typedesc[BtrfsStream_SendCommand_Tlvs], filename: string): BtrfsStream_SendCommand_Tlvs =
  BtrfsStream_SendCommand_Tlvs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BtrfsStream_SendCommand_String], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand_Tlv): BtrfsStream_SendCommand_String =
  template this: untyped = result
  this = new(BtrfsStream_SendCommand_String)
  let root = if root == nil: cast[BtrfsStream](this) else: cast[BtrfsStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let stringExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.string = stringExpr

proc fromFile*(_: typedesc[BtrfsStream_SendCommand_String], filename: string): BtrfsStream_SendCommand_String =
  BtrfsStream_SendCommand_String.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BtrfsStream_SendCommand_Timespec], io: KaitaiStream, root: KaitaiStruct, parent: BtrfsStream_SendCommand_Tlv): BtrfsStream_SendCommand_Timespec =
  template this: untyped = result
  this = new(BtrfsStream_SendCommand_Timespec)
  let root = if root == nil: cast[BtrfsStream](this) else: cast[BtrfsStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tsSecExpr = this.io.readS8le()
  this.tsSec = tsSecExpr
  let tsNsecExpr = this.io.readS4le()
  this.tsNsec = tsNsecExpr

proc fromFile*(_: typedesc[BtrfsStream_SendCommand_Timespec], filename: string): BtrfsStream_SendCommand_Timespec =
  BtrfsStream_SendCommand_Timespec.read(newKaitaiFileStream(filename), nil, nil)

