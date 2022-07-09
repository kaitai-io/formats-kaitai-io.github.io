import kaitai_struct_nim_runtime
import options

type
  MinecraftNbt* = ref object of KaitaiStruct
    `rootCheck`*: seq[byte]
    `root`*: MinecraftNbt_NamedTag
    `parent`*: KaitaiStruct
    `rootTypeInst`: MinecraftNbt_Tag
    `rootTypeInstFlag`: bool
  MinecraftNbt_Tag* = enum
    end = 0
    byte = 1
    short = 2
    int = 3
    long = 4
    float = 5
    double = 6
    byte_array = 7
    string = 8
    list = 9
    compound = 10
    int_array = 11
    long_array = 12
  MinecraftNbt_TagLongArray* = ref object of KaitaiStruct
    `numTags`*: int32
    `tags`*: seq[int64]
    `parent`*: KaitaiStruct
    `tagsTypeInst`: MinecraftNbt_Tag
    `tagsTypeInstFlag`: bool
  MinecraftNbt_TagByteArray* = ref object of KaitaiStruct
    `lenData`*: int32
    `data`*: seq[byte]
    `parent`*: KaitaiStruct
  MinecraftNbt_TagIntArray* = ref object of KaitaiStruct
    `numTags`*: int32
    `tags`*: seq[int32]
    `parent`*: KaitaiStruct
    `tagsTypeInst`: MinecraftNbt_Tag
    `tagsTypeInstFlag`: bool
  MinecraftNbt_TagList* = ref object of KaitaiStruct
    `tagsType`*: MinecraftNbt_Tag
    `numTags`*: int32
    `tags`*: seq[KaitaiStruct]
    `parent`*: KaitaiStruct
  MinecraftNbt_TagString* = ref object of KaitaiStruct
    `lenData`*: uint16
    `data`*: string
    `parent`*: KaitaiStruct
  MinecraftNbt_TagCompound* = ref object of KaitaiStruct
    `tags`*: seq[MinecraftNbt_NamedTag]
    `parent`*: KaitaiStruct
    `dumpNumTagsInst`: int
    `dumpNumTagsInstFlag`: bool
  MinecraftNbt_NamedTag* = ref object of KaitaiStruct
    `type`*: MinecraftNbt_Tag
    `name`*: MinecraftNbt_TagString
    `payload`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `isTagEndInst`: bool
    `isTagEndInstFlag`: bool

proc read*(_: typedesc[MinecraftNbt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt
proc read*(_: typedesc[MinecraftNbt_TagLongArray], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagLongArray
proc read*(_: typedesc[MinecraftNbt_TagByteArray], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagByteArray
proc read*(_: typedesc[MinecraftNbt_TagIntArray], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagIntArray
proc read*(_: typedesc[MinecraftNbt_TagList], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagList
proc read*(_: typedesc[MinecraftNbt_TagString], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagString
proc read*(_: typedesc[MinecraftNbt_TagCompound], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagCompound
proc read*(_: typedesc[MinecraftNbt_NamedTag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_NamedTag

proc rootType*(this: MinecraftNbt): MinecraftNbt_Tag
proc tagsType*(this: MinecraftNbt_TagLongArray): MinecraftNbt_Tag
proc tagsType*(this: MinecraftNbt_TagIntArray): MinecraftNbt_Tag
proc dumpNumTags*(this: MinecraftNbt_TagCompound): int
proc isTagEnd*(this: MinecraftNbt_NamedTag): bool


##[
A structured binary format native to Minecraft for saving game data and transferring
it over the network (in multiplayer), such as player data
([`<player>.dat`](https://minecraft.gamepedia.com/Player.dat_format); contains
e.g. player's inventory and location), saved worlds
([`level.dat`](
  https://minecraft.gamepedia.com/Java_Edition_level_format#level.dat_format
) and [Chunk format](https://minecraft.gamepedia.com/Chunk_format#NBT_structure)),
list of saved multiplayer servers
([`servers.dat`](https://minecraft.gamepedia.com/Servers.dat_format)) and so on -
see <https://minecraft.gamepedia.com/NBT_format#Uses>.

The entire file should be _gzip_-compressed (in accordance with the original
specification [NBT.txt](
  https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt
) by Notch), but can also be compressed with _zlib_ or uncompressed.

This spec can only handle uncompressed NBT data, so be sure to first detect
what type of data you are dealing with. You can use the Unix `file` command
to do this (`file-5.20` or later is required; older versions do not recognize
_zlib_-compressed data and return `application/octet-stream` instead):

```shell
file --brief --mime-type input-unknown.nbt
```

If it says:

  * `application/x-gzip` or `application/gzip` (since `file-5.37`), you can decompress it by
    * `gunzip -c input-gzip.nbt > output.nbt` or
    * `python3 -c "import sys, gzip; sys.stdout.buffer.write(
      gzip.decompress(sys.stdin.buffer.read()) )" < input-gzip.nbt > output.nbt`
  * `application/zlib`, you can use
    * `openssl zlib -d -in input-zlib.nbt -out output.nbt` (does not work on most systems)
    * `python3 -c "import sys, zlib; sys.stdout.buffer.write(
      zlib.decompress(sys.stdin.buffer.read()) )" < input-zlib.nbt > output.nbt`
  * something else (especially `image/x-pcx` and `application/octet-stream`),
    it is most likely already uncompressed.

The file `output.nbt` generated by one of the above commands can already be
processed with this Kaitai Struct specification.

This spec **only** implements the Java edition format. There is also
a [Bedrock edition](https://wiki.vg/NBT#Bedrock_edition) NBT format,
which uses little-endian encoding and has a few other differences, but it isn't
as popular as the Java edition format.

**Implementation note:** strings in `TAG_String` are incorrectly decoded with
standard UTF-8, while they are encoded in [**Modified UTF-8**](
  https://docs.oracle.com/javase/8/docs/api/java/io/DataInput.html#modified-utf-8
) (MUTF-8). That's because MUTF-8 is not supported natively by most target
languages, and thus one must use external libraries to achieve a fully-compliant
decoder. But decoding in standard UTF-8 is still better than nothing, and
it usually works fine.

All Unicode code points with incompatible representations in MUTF-8 and UTF-8 are
U+0000 (_NUL_), U+D800-U+DFFF (_High_ and _Low Surrogates_) and U+10000-U+10FFFF
(all _Supplementary_ Planes; includes e.g. emoticons, pictograms).
A _MUTF-8_-encoded string containing these code points cannot be successfully
decoded as UTF-8. The behavior in this case depends on the target language -
usually an exception is thrown, or the bytes that are not valid UTF-8
are replaced or ignored.

**Sample files:**

  * <https://wiki.vg/NBT#Download>
  * <https://github.com/twoolie/NBT/blob/f9e892e/tests/world_test/data/scoreboard.dat>
  * <https://github.com/chmod222/cNBT/tree/3f74b69/testdata>
  * <https://github.com/PistonDevelopers/hematite_nbt/tree/0b85f89/tests>

@see <a href="https://wiki.vg/NBT">Source</a>
@see <a href="https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt">Source</a>
@see <a href="https://minecraft.gamepedia.com/NBT_format">Source</a>
]##
proc read*(_: typedesc[MinecraftNbt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt =
  template this: untyped = result
  this = new(MinecraftNbt)
  let root = if root == nil: cast[MinecraftNbt](this) else: cast[MinecraftNbt](root)
  this.io = io
  this.root = root
  this.parent = parent

  if  ((this.rootType == minecraft_nbt.end) and (false)) :
    let rootCheckExpr = this.io.readBytes(int(0))
    this.rootCheck = rootCheckExpr
  let rootExpr = MinecraftNbt_NamedTag.read(this.io, this.root, this)
  this.root = rootExpr

proc rootType(this: MinecraftNbt): MinecraftNbt_Tag = 
  if this.rootTypeInstFlag:
    return this.rootTypeInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let rootTypeInstExpr = MinecraftNbt_Tag(this.io.readU1())
  this.rootTypeInst = rootTypeInstExpr
  this.io.seek(pos)
  this.rootTypeInstFlag = true
  return this.rootTypeInst

proc fromFile*(_: typedesc[MinecraftNbt], filename: string): MinecraftNbt =
  MinecraftNbt.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MinecraftNbt_TagLongArray], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagLongArray =
  template this: untyped = result
  this = new(MinecraftNbt_TagLongArray)
  let root = if root == nil: cast[MinecraftNbt](this) else: cast[MinecraftNbt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numTagsExpr = this.io.readS4be()
  this.numTags = numTagsExpr
  for i in 0 ..< int(this.numTags):
    let it = this.io.readS8be()
    this.tags.add(it)

proc tagsType(this: MinecraftNbt_TagLongArray): MinecraftNbt_Tag = 
  if this.tagsTypeInstFlag:
    return this.tagsTypeInst
  let tagsTypeInstExpr = MinecraftNbt_Tag(minecraft_nbt.long)
  this.tagsTypeInst = tagsTypeInstExpr
  this.tagsTypeInstFlag = true
  return this.tagsTypeInst

proc fromFile*(_: typedesc[MinecraftNbt_TagLongArray], filename: string): MinecraftNbt_TagLongArray =
  MinecraftNbt_TagLongArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MinecraftNbt_TagByteArray], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagByteArray =
  template this: untyped = result
  this = new(MinecraftNbt_TagByteArray)
  let root = if root == nil: cast[MinecraftNbt](this) else: cast[MinecraftNbt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenDataExpr = this.io.readS4be()
  this.lenData = lenDataExpr
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr

proc fromFile*(_: typedesc[MinecraftNbt_TagByteArray], filename: string): MinecraftNbt_TagByteArray =
  MinecraftNbt_TagByteArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MinecraftNbt_TagIntArray], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagIntArray =
  template this: untyped = result
  this = new(MinecraftNbt_TagIntArray)
  let root = if root == nil: cast[MinecraftNbt](this) else: cast[MinecraftNbt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numTagsExpr = this.io.readS4be()
  this.numTags = numTagsExpr
  for i in 0 ..< int(this.numTags):
    let it = this.io.readS4be()
    this.tags.add(it)

proc tagsType(this: MinecraftNbt_TagIntArray): MinecraftNbt_Tag = 
  if this.tagsTypeInstFlag:
    return this.tagsTypeInst
  let tagsTypeInstExpr = MinecraftNbt_Tag(minecraft_nbt.int)
  this.tagsTypeInst = tagsTypeInstExpr
  this.tagsTypeInstFlag = true
  return this.tagsTypeInst

proc fromFile*(_: typedesc[MinecraftNbt_TagIntArray], filename: string): MinecraftNbt_TagIntArray =
  MinecraftNbt_TagIntArray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MinecraftNbt_TagList], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagList =
  template this: untyped = result
  this = new(MinecraftNbt_TagList)
  let root = if root == nil: cast[MinecraftNbt](this) else: cast[MinecraftNbt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagsTypeExpr = MinecraftNbt_Tag(this.io.readU1())
  this.tagsType = tagsTypeExpr
  let numTagsExpr = this.io.readS4be()
  this.numTags = numTagsExpr
  for i in 0 ..< int(this.numTags):
    block:
      let on = this.tagsType
      if on == minecraft_nbt.long_array:
        let it = MinecraftNbt_TagLongArray.read(this.io, this.root, this)
        this.tags.add(it)
      elif on == minecraft_nbt.compound:
        let it = MinecraftNbt_TagCompound.read(this.io, this.root, this)
        this.tags.add(it)
      elif on == minecraft_nbt.double:
        let it = KaitaiStruct(this.io.readF8be())
        this.tags.add(it)
      elif on == minecraft_nbt.list:
        let it = MinecraftNbt_TagList.read(this.io, this.root, this)
        this.tags.add(it)
      elif on == minecraft_nbt.float:
        let it = KaitaiStruct(this.io.readF4be())
        this.tags.add(it)
      elif on == minecraft_nbt.short:
        let it = KaitaiStruct(this.io.readS2be())
        this.tags.add(it)
      elif on == minecraft_nbt.int:
        let it = KaitaiStruct(this.io.readS4be())
        this.tags.add(it)
      elif on == minecraft_nbt.byte_array:
        let it = MinecraftNbt_TagByteArray.read(this.io, this.root, this)
        this.tags.add(it)
      elif on == minecraft_nbt.byte:
        let it = KaitaiStruct(this.io.readS1())
        this.tags.add(it)
      elif on == minecraft_nbt.int_array:
        let it = MinecraftNbt_TagIntArray.read(this.io, this.root, this)
        this.tags.add(it)
      elif on == minecraft_nbt.string:
        let it = MinecraftNbt_TagString.read(this.io, this.root, this)
        this.tags.add(it)
      elif on == minecraft_nbt.long:
        let it = KaitaiStruct(this.io.readS8be())
        this.tags.add(it)

proc fromFile*(_: typedesc[MinecraftNbt_TagList], filename: string): MinecraftNbt_TagList =
  MinecraftNbt_TagList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MinecraftNbt_TagString], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagString =
  template this: untyped = result
  this = new(MinecraftNbt_TagString)
  let root = if root == nil: cast[MinecraftNbt](this) else: cast[MinecraftNbt](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  unsigned according to https://wiki.vg/NBT#Specification
  ]##
  let lenDataExpr = this.io.readU2be()
  this.lenData = lenDataExpr
  let dataExpr = encode(this.io.readBytes(int(this.lenData)), "utf-8")
  this.data = dataExpr

proc fromFile*(_: typedesc[MinecraftNbt_TagString], filename: string): MinecraftNbt_TagString =
  MinecraftNbt_TagString.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MinecraftNbt_TagCompound], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_TagCompound =
  template this: untyped = result
  this = new(MinecraftNbt_TagCompound)
  let root = if root == nil: cast[MinecraftNbt](this) else: cast[MinecraftNbt](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = MinecraftNbt_NamedTag.read(this.io, this.root, this)
      this.tags.add(it)
      if it.isTagEnd:
        break
      inc i

proc dumpNumTags(this: MinecraftNbt_TagCompound): int = 
  if this.dumpNumTagsInstFlag:
    return this.dumpNumTagsInst
  let dumpNumTagsInstExpr = int((len(this.tags) - (if  ((len(this.tags) >= 1) and (this.tags[^1].isTagEnd)) : 1 else: 0)))
  this.dumpNumTagsInst = dumpNumTagsInstExpr
  this.dumpNumTagsInstFlag = true
  return this.dumpNumTagsInst

proc fromFile*(_: typedesc[MinecraftNbt_TagCompound], filename: string): MinecraftNbt_TagCompound =
  MinecraftNbt_TagCompound.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MinecraftNbt_NamedTag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MinecraftNbt_NamedTag =
  template this: untyped = result
  this = new(MinecraftNbt_NamedTag)
  let root = if root == nil: cast[MinecraftNbt](this) else: cast[MinecraftNbt](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = MinecraftNbt_Tag(this.io.readU1())
  this.type = typeExpr
  if not(this.isTagEnd):
    let nameExpr = MinecraftNbt_TagString.read(this.io, this.root, this)
    this.name = nameExpr
  if not(this.isTagEnd):
    block:
      let on = this.type
      if on == minecraft_nbt.long_array:
        let payloadExpr = MinecraftNbt_TagLongArray.read(this.io, this.root, this)
        this.payload = payloadExpr
      elif on == minecraft_nbt.compound:
        let payloadExpr = MinecraftNbt_TagCompound.read(this.io, this.root, this)
        this.payload = payloadExpr
      elif on == minecraft_nbt.double:
        let payloadExpr = KaitaiStruct(this.io.readF8be())
        this.payload = payloadExpr
      elif on == minecraft_nbt.list:
        let payloadExpr = MinecraftNbt_TagList.read(this.io, this.root, this)
        this.payload = payloadExpr
      elif on == minecraft_nbt.float:
        let payloadExpr = KaitaiStruct(this.io.readF4be())
        this.payload = payloadExpr
      elif on == minecraft_nbt.short:
        let payloadExpr = KaitaiStruct(this.io.readS2be())
        this.payload = payloadExpr
      elif on == minecraft_nbt.int:
        let payloadExpr = KaitaiStruct(this.io.readS4be())
        this.payload = payloadExpr
      elif on == minecraft_nbt.byte_array:
        let payloadExpr = MinecraftNbt_TagByteArray.read(this.io, this.root, this)
        this.payload = payloadExpr
      elif on == minecraft_nbt.byte:
        let payloadExpr = KaitaiStruct(this.io.readS1())
        this.payload = payloadExpr
      elif on == minecraft_nbt.int_array:
        let payloadExpr = MinecraftNbt_TagIntArray.read(this.io, this.root, this)
        this.payload = payloadExpr
      elif on == minecraft_nbt.string:
        let payloadExpr = MinecraftNbt_TagString.read(this.io, this.root, this)
        this.payload = payloadExpr
      elif on == minecraft_nbt.long:
        let payloadExpr = KaitaiStruct(this.io.readS8be())
        this.payload = payloadExpr

proc isTagEnd(this: MinecraftNbt_NamedTag): bool = 
  if this.isTagEndInstFlag:
    return this.isTagEndInst
  let isTagEndInstExpr = bool(this.type == minecraft_nbt.end)
  this.isTagEndInst = isTagEndInstExpr
  this.isTagEndInstFlag = true
  return this.isTagEndInst

proc fromFile*(_: typedesc[MinecraftNbt_NamedTag], filename: string): MinecraftNbt_NamedTag =
  MinecraftNbt_NamedTag.read(newKaitaiFileStream(filename), nil, nil)

