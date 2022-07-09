import kaitai_struct_nim_runtime
import options

type
  Riff* = ref object of KaitaiStruct
    `chunk`*: Riff_Chunk
    `parent`*: KaitaiStruct
    `chunkIdInst`: Riff_Fourcc
    `chunkIdInstFlag`: bool
    `isRiffChunkInst`: bool
    `isRiffChunkInstFlag`: bool
    `parentChunkDataInst`: Riff_ParentChunkData
    `parentChunkDataInstFlag`: bool
    `subchunksInst`: seq[Riff_ChunkType]
    `subchunksInstFlag`: bool
  Riff_Fourcc* = enum
    riff = 1179011410
    info = 1330007625
    list = 1414744396
  Riff_ListChunkData* = ref object of KaitaiStruct
    `saveParentChunkDataOfs`*: seq[byte]
    `parentChunkData`*: Riff_ParentChunkData
    `parent`*: Riff_ChunkType
    `parentChunkDataOfsInst`: int
    `parentChunkDataOfsInstFlag`: bool
    `formTypeInst`: Riff_Fourcc
    `formTypeInstFlag`: bool
    `formTypeReadableInst`: string
    `formTypeReadableInstFlag`: bool
    `subchunksInst`: seq[KaitaiStruct]
    `subchunksInstFlag`: bool
  Riff_Chunk* = ref object of KaitaiStruct
    `id`*: uint32
    `len`*: uint32
    `dataSlot`*: Riff_Chunk_Slot
    `padByte`*: seq[byte]
    `parent`*: KaitaiStruct
    `rawDataSlot`*: seq[byte]
  Riff_Chunk_Slot* = ref object of KaitaiStruct
    `parent`*: Riff_Chunk
  Riff_ParentChunkData* = ref object of KaitaiStruct
    `formType`*: uint32
    `subchunksSlot`*: Riff_ParentChunkData_Slot
    `parent`*: KaitaiStruct
    `rawSubchunksSlot`*: seq[byte]
  Riff_ParentChunkData_Slot* = ref object of KaitaiStruct
    `parent`*: Riff_ParentChunkData
  Riff_InfoSubchunk* = ref object of KaitaiStruct
    `saveChunkOfs`*: seq[byte]
    `chunk`*: Riff_Chunk
    `parent`*: Riff_ListChunkData
    `chunkDataInst`: string
    `chunkDataInstFlag`: bool
    `isUnregisteredTagInst`: bool
    `isUnregisteredTagInstFlag`: bool
    `idCharsInst`: seq[byte]
    `idCharsInstFlag`: bool
    `chunkIdReadableInst`: string
    `chunkIdReadableInstFlag`: bool
    `chunkOfsInst`: int
    `chunkOfsInstFlag`: bool
  Riff_ChunkType* = ref object of KaitaiStruct
    `saveChunkOfs`*: seq[byte]
    `chunk`*: Riff_Chunk
    `parent`*: KaitaiStruct
    `chunkOfsInst`: int
    `chunkOfsInstFlag`: bool
    `chunkIdInst`: Riff_Fourcc
    `chunkIdInstFlag`: bool
    `chunkIdReadableInst`: string
    `chunkIdReadableInstFlag`: bool
    `chunkDataInst`: Riff_ListChunkData
    `chunkDataInstFlag`: bool

proc read*(_: typedesc[Riff], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Riff
proc read*(_: typedesc[Riff_ListChunkData], io: KaitaiStream, root: KaitaiStruct, parent: Riff_ChunkType): Riff_ListChunkData
proc read*(_: typedesc[Riff_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Riff_Chunk
proc read*(_: typedesc[Riff_Chunk_Slot], io: KaitaiStream, root: KaitaiStruct, parent: Riff_Chunk): Riff_Chunk_Slot
proc read*(_: typedesc[Riff_ParentChunkData], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Riff_ParentChunkData
proc read*(_: typedesc[Riff_ParentChunkData_Slot], io: KaitaiStream, root: KaitaiStruct, parent: Riff_ParentChunkData): Riff_ParentChunkData_Slot
proc read*(_: typedesc[Riff_InfoSubchunk], io: KaitaiStream, root: KaitaiStruct, parent: Riff_ListChunkData): Riff_InfoSubchunk
proc read*(_: typedesc[Riff_ChunkType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Riff_ChunkType

proc chunkId*(this: Riff): Riff_Fourcc
proc isRiffChunk*(this: Riff): bool
proc parentChunkData*(this: Riff): Riff_ParentChunkData
proc subchunks*(this: Riff): seq[Riff_ChunkType]
proc parentChunkDataOfs*(this: Riff_ListChunkData): int
proc formType*(this: Riff_ListChunkData): Riff_Fourcc
proc formTypeReadable*(this: Riff_ListChunkData): string
proc subchunks*(this: Riff_ListChunkData): seq[KaitaiStruct]
proc chunkData*(this: Riff_InfoSubchunk): string
proc isUnregisteredTag*(this: Riff_InfoSubchunk): bool
proc idChars*(this: Riff_InfoSubchunk): seq[byte]
proc chunkIdReadable*(this: Riff_InfoSubchunk): string
proc chunkOfs*(this: Riff_InfoSubchunk): int
proc chunkOfs*(this: Riff_ChunkType): int
proc chunkId*(this: Riff_ChunkType): Riff_Fourcc
proc chunkIdReadable*(this: Riff_ChunkType): string
proc chunkData*(this: Riff_ChunkType): Riff_ListChunkData


##[
The Resource Interchange File Format (RIFF) is a generic file container format
for storing data in tagged chunks. It is primarily used to store multimedia
such as sound and video, though it may also be used to store any arbitrary data.

The Microsoft implementation is mostly known through container formats
like AVI, ANI and WAV, which use RIFF as their basis.

@see <a href="https://www.johnloomis.org/cpe102/asgn/asgn1/riff.html">Source</a>
]##
proc read*(_: typedesc[Riff], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Riff =
  template this: untyped = result
  this = new(Riff)
  let root = if root == nil: cast[Riff](this) else: cast[Riff](root)
  this.io = io
  this.root = root
  this.parent = parent

  let chunkExpr = Riff_Chunk.read(this.io, this.root, this)
  this.chunk = chunkExpr

proc chunkId(this: Riff): Riff_Fourcc = 
  if this.chunkIdInstFlag:
    return this.chunkIdInst
  let chunkIdInstExpr = Riff_Fourcc(Riff_Fourcc(this.chunk.id))
  this.chunkIdInst = chunkIdInstExpr
  this.chunkIdInstFlag = true
  return this.chunkIdInst

proc isRiffChunk(this: Riff): bool = 
  if this.isRiffChunkInstFlag:
    return this.isRiffChunkInst
  let isRiffChunkInstExpr = bool(this.chunkId == riff.riff)
  this.isRiffChunkInst = isRiffChunkInstExpr
  this.isRiffChunkInstFlag = true
  return this.isRiffChunkInst

proc parentChunkData(this: Riff): Riff_ParentChunkData = 
  if this.parentChunkDataInstFlag:
    return this.parentChunkDataInst
  if this.isRiffChunk:
    let io = this.chunk.dataSlot.io
    let pos = io.pos()
    io.seek(int(0))
    let parentChunkDataInstExpr = Riff_ParentChunkData.read(io, this.root, this)
    this.parentChunkDataInst = parentChunkDataInstExpr
    io.seek(pos)
  this.parentChunkDataInstFlag = true
  return this.parentChunkDataInst

proc subchunks(this: Riff): seq[Riff_ChunkType] = 
  if this.subchunksInstFlag:
    return this.subchunksInst
  if this.isRiffChunk:
    let io = this.parentChunkData.subchunksSlot.io
    let pos = io.pos()
    io.seek(int(0))
    block:
      var i: int
      while not io.isEof:
        let it = Riff_ChunkType.read(io, this.root, this)
        this.subchunksInst.add(it)
        inc i
    io.seek(pos)
  this.subchunksInstFlag = true
  return this.subchunksInst

proc fromFile*(_: typedesc[Riff], filename: string): Riff =
  Riff.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Riff_ListChunkData], io: KaitaiStream, root: KaitaiStruct, parent: Riff_ChunkType): Riff_ListChunkData =
  template this: untyped = result
  this = new(Riff_ListChunkData)
  let root = if root == nil: cast[Riff](this) else: cast[Riff](root)
  this.io = io
  this.root = root
  this.parent = parent

  if this.parentChunkDataOfs < 0:
    let saveParentChunkDataOfsExpr = this.io.readBytes(int(0))
    this.saveParentChunkDataOfs = saveParentChunkDataOfsExpr
  let parentChunkDataExpr = Riff_ParentChunkData.read(this.io, this.root, this)
  this.parentChunkData = parentChunkDataExpr

proc parentChunkDataOfs(this: Riff_ListChunkData): int = 
  if this.parentChunkDataOfsInstFlag:
    return this.parentChunkDataOfsInst
  let parentChunkDataOfsInstExpr = int(this.io.pos)
  this.parentChunkDataOfsInst = parentChunkDataOfsInstExpr
  this.parentChunkDataOfsInstFlag = true
  return this.parentChunkDataOfsInst

proc formType(this: Riff_ListChunkData): Riff_Fourcc = 
  if this.formTypeInstFlag:
    return this.formTypeInst
  let formTypeInstExpr = Riff_Fourcc(Riff_Fourcc(this.parentChunkData.formType))
  this.formTypeInst = formTypeInstExpr
  this.formTypeInstFlag = true
  return this.formTypeInst

proc formTypeReadable(this: Riff_ListChunkData): string = 
  if this.formTypeReadableInstFlag:
    return this.formTypeReadableInst
  let pos = this.io.pos()
  this.io.seek(int(this.parentChunkDataOfs))
  let formTypeReadableInstExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.formTypeReadableInst = formTypeReadableInstExpr
  this.io.seek(pos)
  this.formTypeReadableInstFlag = true
  return this.formTypeReadableInst

proc subchunks(this: Riff_ListChunkData): seq[KaitaiStruct] = 
  if this.subchunksInstFlag:
    return this.subchunksInst
  let io = this.parentChunkData.subchunksSlot.io
  let pos = io.pos()
  io.seek(int(0))
  block:
    var i: int
    while not io.isEof:
      block:
        let on = this.formType
        if on == riff.info:
          let it = Riff_InfoSubchunk.read(io, this.root, this)
          this.subchunksInst.add(it)
        else:
          let it = Riff_ChunkType.read(io, this.root, this)
          this.subchunksInst.add(it)
      inc i
  io.seek(pos)
  this.subchunksInstFlag = true
  return this.subchunksInst

proc fromFile*(_: typedesc[Riff_ListChunkData], filename: string): Riff_ListChunkData =
  Riff_ListChunkData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Riff_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Riff_Chunk =
  template this: untyped = result
  this = new(Riff_Chunk)
  let root = if root == nil: cast[Riff](this) else: cast[Riff](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readU4le()
  this.id = idExpr
  let lenExpr = this.io.readU4le()
  this.len = lenExpr
  let rawDataSlotExpr = this.io.readBytes(int(this.len))
  this.rawDataSlot = rawDataSlotExpr
  let rawDataSlotIo = newKaitaiStream(rawDataSlotExpr)
  let dataSlotExpr = Riff_Chunk_Slot.read(rawDataSlotIo, this.root, this)
  this.dataSlot = dataSlotExpr
  let padByteExpr = this.io.readBytes(int((this.len %%% 2)))
  this.padByte = padByteExpr

proc fromFile*(_: typedesc[Riff_Chunk], filename: string): Riff_Chunk =
  Riff_Chunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Riff_Chunk_Slot], io: KaitaiStream, root: KaitaiStruct, parent: Riff_Chunk): Riff_Chunk_Slot =
  template this: untyped = result
  this = new(Riff_Chunk_Slot)
  let root = if root == nil: cast[Riff](this) else: cast[Riff](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[Riff_Chunk_Slot], filename: string): Riff_Chunk_Slot =
  Riff_Chunk_Slot.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Riff_ParentChunkData], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Riff_ParentChunkData =
  template this: untyped = result
  this = new(Riff_ParentChunkData)
  let root = if root == nil: cast[Riff](this) else: cast[Riff](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formTypeExpr = this.io.readU4le()
  this.formType = formTypeExpr
  let rawSubchunksSlotExpr = this.io.readBytesFull()
  this.rawSubchunksSlot = rawSubchunksSlotExpr
  let rawSubchunksSlotIo = newKaitaiStream(rawSubchunksSlotExpr)
  let subchunksSlotExpr = Riff_ParentChunkData_Slot.read(rawSubchunksSlotIo, this.root, this)
  this.subchunksSlot = subchunksSlotExpr

proc fromFile*(_: typedesc[Riff_ParentChunkData], filename: string): Riff_ParentChunkData =
  Riff_ParentChunkData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Riff_ParentChunkData_Slot], io: KaitaiStream, root: KaitaiStruct, parent: Riff_ParentChunkData): Riff_ParentChunkData_Slot =
  template this: untyped = result
  this = new(Riff_ParentChunkData_Slot)
  let root = if root == nil: cast[Riff](this) else: cast[Riff](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[Riff_ParentChunkData_Slot], filename: string): Riff_ParentChunkData_Slot =
  Riff_ParentChunkData_Slot.read(newKaitaiFileStream(filename), nil, nil)


##[
All registered subchunks in the INFO chunk are NULL-terminated strings,
but the unregistered might not be. By convention, the registered
chunk IDs are in uppercase and the unregistered IDs are in lowercase.

If the chunk ID of an INFO subchunk contains a lowercase
letter, this chunk is considered as unregistered and thus we can make
no assumptions about the type of data.

]##
proc read*(_: typedesc[Riff_InfoSubchunk], io: KaitaiStream, root: KaitaiStruct, parent: Riff_ListChunkData): Riff_InfoSubchunk =
  template this: untyped = result
  this = new(Riff_InfoSubchunk)
  let root = if root == nil: cast[Riff](this) else: cast[Riff](root)
  this.io = io
  this.root = root
  this.parent = parent

  if this.chunkOfs < 0:
    let saveChunkOfsExpr = this.io.readBytes(int(0))
    this.saveChunkOfs = saveChunkOfsExpr
  let chunkExpr = Riff_Chunk.read(this.io, this.root, this)
  this.chunk = chunkExpr

proc chunkData(this: Riff_InfoSubchunk): string = 
  if this.chunkDataInstFlag:
    return this.chunkDataInst
  let io = this.chunk.dataSlot.io
  let pos = io.pos()
  io.seek(int(0))
  block:
    let on = this.isUnregisteredTag
    if on == false:
      let chunkDataInstExpr = encode(io.readBytesTerm(0, false, true, true), "UTF-8")
      this.chunkDataInst = chunkDataInstExpr
  io.seek(pos)
  this.chunkDataInstFlag = true
  return this.chunkDataInst

proc isUnregisteredTag(this: Riff_InfoSubchunk): bool = 

  ##[
  Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).

  ]##
  if this.isUnregisteredTagInstFlag:
    return this.isUnregisteredTagInst
  let isUnregisteredTagInstExpr = bool( (( ((this.idChars[0] >= 97) and (this.idChars[0] <= 122)) ) or ( ((this.idChars[1] >= 97) and (this.idChars[1] <= 122)) ) or ( ((this.idChars[2] >= 97) and (this.idChars[2] <= 122)) ) or ( ((this.idChars[3] >= 97) and (this.idChars[3] <= 122)) )) )
  this.isUnregisteredTagInst = isUnregisteredTagInstExpr
  this.isUnregisteredTagInstFlag = true
  return this.isUnregisteredTagInst

proc idChars(this: Riff_InfoSubchunk): seq[byte] = 
  if this.idCharsInstFlag:
    return this.idCharsInst
  let pos = this.io.pos()
  this.io.seek(int(this.chunkOfs))
  let idCharsInstExpr = this.io.readBytes(int(4))
  this.idCharsInst = idCharsInstExpr
  this.io.seek(pos)
  this.idCharsInstFlag = true
  return this.idCharsInst

proc chunkIdReadable(this: Riff_InfoSubchunk): string = 
  if this.chunkIdReadableInstFlag:
    return this.chunkIdReadableInst
  let chunkIdReadableInstExpr = string(encode(this.idChars, "ASCII"))
  this.chunkIdReadableInst = chunkIdReadableInstExpr
  this.chunkIdReadableInstFlag = true
  return this.chunkIdReadableInst

proc chunkOfs(this: Riff_InfoSubchunk): int = 
  if this.chunkOfsInstFlag:
    return this.chunkOfsInst
  let chunkOfsInstExpr = int(this.io.pos)
  this.chunkOfsInst = chunkOfsInstExpr
  this.chunkOfsInstFlag = true
  return this.chunkOfsInst

proc fromFile*(_: typedesc[Riff_InfoSubchunk], filename: string): Riff_InfoSubchunk =
  Riff_InfoSubchunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Riff_ChunkType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Riff_ChunkType =
  template this: untyped = result
  this = new(Riff_ChunkType)
  let root = if root == nil: cast[Riff](this) else: cast[Riff](root)
  this.io = io
  this.root = root
  this.parent = parent

  if this.chunkOfs < 0:
    let saveChunkOfsExpr = this.io.readBytes(int(0))
    this.saveChunkOfs = saveChunkOfsExpr
  let chunkExpr = Riff_Chunk.read(this.io, this.root, this)
  this.chunk = chunkExpr

proc chunkOfs(this: Riff_ChunkType): int = 
  if this.chunkOfsInstFlag:
    return this.chunkOfsInst
  let chunkOfsInstExpr = int(this.io.pos)
  this.chunkOfsInst = chunkOfsInstExpr
  this.chunkOfsInstFlag = true
  return this.chunkOfsInst

proc chunkId(this: Riff_ChunkType): Riff_Fourcc = 
  if this.chunkIdInstFlag:
    return this.chunkIdInst
  let chunkIdInstExpr = Riff_Fourcc(Riff_Fourcc(this.chunk.id))
  this.chunkIdInst = chunkIdInstExpr
  this.chunkIdInstFlag = true
  return this.chunkIdInst

proc chunkIdReadable(this: Riff_ChunkType): string = 
  if this.chunkIdReadableInstFlag:
    return this.chunkIdReadableInst
  let pos = this.io.pos()
  this.io.seek(int(this.chunkOfs))
  let chunkIdReadableInstExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.chunkIdReadableInst = chunkIdReadableInstExpr
  this.io.seek(pos)
  this.chunkIdReadableInstFlag = true
  return this.chunkIdReadableInst

proc chunkData(this: Riff_ChunkType): Riff_ListChunkData = 
  if this.chunkDataInstFlag:
    return this.chunkDataInst
  let io = this.chunk.dataSlot.io
  let pos = io.pos()
  io.seek(int(0))
  block:
    let on = this.chunkId
    if on == riff.list:
      let chunkDataInstExpr = Riff_ListChunkData.read(io, this.root, this)
      this.chunkDataInst = chunkDataInstExpr
  io.seek(pos)
  this.chunkDataInstFlag = true
  return this.chunkDataInst

proc fromFile*(_: typedesc[Riff_ChunkType], filename: string): Riff_ChunkType =
  Riff_ChunkType.read(newKaitaiFileStream(filename), nil, nil)

