import kaitai_struct_nim_runtime
import options

type
  GettextMo* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `mo`*: GettextMo_Mo
    `parent`*: KaitaiStruct
  GettextMo_HashLookupIteration* = ref object of KaitaiStruct
    `idx`*: uint32
    `collisionStep`*: uint32
    `parent`*: KaitaiStruct
    `originalInst`: string
    `originalInstFlag`: bool
    `translationInst`: string
    `translationInstFlag`: bool
    `nextIdxInst`: int
    `nextIdxInstFlag`: bool
    `nextInst`: GettextMo_HashLookupIteration
    `nextInstFlag`: bool
  GettextMo_LookupIteration* = ref object of KaitaiStruct
    `current`*: GettextMo_HashLookupIteration
    `query`*: string
    `parent`*: KaitaiStruct
    `foundInst`: bool
    `foundInstFlag`: bool
    `nextInst`: GettextMo_LookupIteration
    `nextInstFlag`: bool
  GettextMo_HashtableLookup* = ref object of KaitaiStruct
    `query`*: string
    `hash`*: uint32
    `parent`*: KaitaiStruct
    `collisionStepInst`: int
    `collisionStepInstFlag`: bool
    `idxInst`: int
    `idxInstFlag`: bool
    `hashLookupIterationInst`: GettextMo_HashLookupIteration
    `hashLookupIterationInstFlag`: bool
    `entryInst`: GettextMo_LookupIteration
    `entryInstFlag`: bool
  GettextMo_Mo* = ref object of KaitaiStruct
    `version`*: GettextMo_Mo_Version
    `numTranslations`*: uint32
    `ofsOriginals`*: uint32
    `ofsTranslations`*: uint32
    `numHashtableItems`*: uint32
    `ofsHashtableItems`*: uint32
    `parent`*: GettextMo
    `originalsInst`: seq[GettextMo_Mo_Descriptor]
    `originalsInstFlag`: bool
    `translationsInst`: seq[GettextMo_Mo_Descriptor]
    `translationsInstFlag`: bool
    `hashtableItemsInst`: seq[GettextMo_Mo_HashtableItem]
    `hashtableItemsInstFlag`: bool
    isLe: bool
  GettextMo_Mo_Version* = ref object of KaitaiStruct
    `versionRaw`*: uint32
    `parent`*: GettextMo_Mo
    `majorInst`: int
    `majorInstFlag`: bool
    `minorInst`: int
    `minorInstFlag`: bool
    isLe: bool
  GettextMo_Mo_HashtableItem* = ref object of KaitaiStruct
    `rawVal`*: uint32
    `parent`*: GettextMo_Mo
    `maskInst`: int
    `maskInstFlag`: bool
    `val1Inst`: int
    `val1InstFlag`: bool
    `isSystemDependentInst`: bool
    `isSystemDependentInstFlag`: bool
    `valInst`: int
    `valInstFlag`: bool
    isLe: bool
  GettextMo_Mo_Descriptor* = ref object of KaitaiStruct
    `lenStr`*: uint32
    `ofsStr`*: uint32
    `parent`*: GettextMo_Mo
    `strInst`: string
    `strInstFlag`: bool
    isLe: bool

proc read*(_: typedesc[GettextMo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GettextMo
proc read*(_: typedesc[GettextMo_HashLookupIteration], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, idx: any, collisionStep: any): GettextMo_HashLookupIteration
proc read*(_: typedesc[GettextMo_LookupIteration], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, current: any, query: any): GettextMo_LookupIteration
proc read*(_: typedesc[GettextMo_HashtableLookup], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, query: any, hash: any): GettextMo_HashtableLookup
proc read*(_: typedesc[GettextMo_Mo], io: KaitaiStream, root: KaitaiStruct, parent: GettextMo): GettextMo_Mo
proc read*(_: typedesc[GettextMo_Mo_Version], io: KaitaiStream, root: KaitaiStruct, parent: GettextMo_Mo): GettextMo_Mo_Version
proc read*(_: typedesc[GettextMo_Mo_HashtableItem], io: KaitaiStream, root: KaitaiStruct, parent: GettextMo_Mo): GettextMo_Mo_HashtableItem
proc read*(_: typedesc[GettextMo_Mo_Descriptor], io: KaitaiStream, root: KaitaiStruct, parent: GettextMo_Mo): GettextMo_Mo_Descriptor

proc original*(this: GettextMo_HashLookupIteration): string
proc translation*(this: GettextMo_HashLookupIteration): string
proc nextIdx*(this: GettextMo_HashLookupIteration): int
proc next*(this: GettextMo_HashLookupIteration): GettextMo_HashLookupIteration
proc found*(this: GettextMo_LookupIteration): bool
proc next*(this: GettextMo_LookupIteration): GettextMo_LookupIteration
proc collisionStep*(this: GettextMo_HashtableLookup): int
proc idx*(this: GettextMo_HashtableLookup): int
proc hashLookupIteration*(this: GettextMo_HashtableLookup): GettextMo_HashLookupIteration
proc entry*(this: GettextMo_HashtableLookup): GettextMo_LookupIteration
proc originals*(this: GettextMo_Mo): seq[GettextMo_Mo_Descriptor]
proc translations*(this: GettextMo_Mo): seq[GettextMo_Mo_Descriptor]
proc hashtableItems*(this: GettextMo_Mo): seq[GettextMo_Mo_HashtableItem]
proc major*(this: GettextMo_Mo_Version): int
proc minor*(this: GettextMo_Mo_Version): int
proc mask*(this: GettextMo_Mo_HashtableItem): int
proc val1*(this: GettextMo_Mo_HashtableItem): int
proc isSystemDependent*(this: GettextMo_Mo_HashtableItem): bool
proc val*(this: GettextMo_Mo_HashtableItem): int
proc str*(this: GettextMo_Mo_Descriptor): string


##[
[GNU gettext](https://www.gnu.org/software/gettext/) is a popular
solution in free/open source software world to do i18n/l10n of
software, by providing translated strings that will substitute
strings in original language (typically, English).

gettext .mo is a binary database format which stores these string
translation pairs in an efficient binary format, ready to be used by
gettext-enabled software. .mo format is a result of compilation of
text-based .po files using
[msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
utility. The reverse conversion (.mo -> .po) is also possible using
[msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
decompiler utility.

@see <a href="https://gitlab.com/worr/libintl">Source</a>
]##
proc read*(_: typedesc[GettextMo], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GettextMo =
  template this: untyped = result
  this = new(GettextMo)
  let root = if root == nil: cast[GettextMo](this) else: cast[GettextMo](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(4))
  this.signature = signatureExpr
  let moExpr = GettextMo_Mo.read(this.io, this.root, this)
  this.mo = moExpr

proc fromFile*(_: typedesc[GettextMo], filename: string): GettextMo =
  GettextMo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GettextMo_HashLookupIteration], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, idx: any, collisionStep: any): GettextMo_HashLookupIteration =
  template this: untyped = result
  this = new(GettextMo_HashLookupIteration)
  let root = if root == nil: cast[GettextMo](this) else: cast[GettextMo](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint32(idx)
  this.idx = idxExpr
  let collisionStepExpr = uint32(collisionStep)
  this.collisionStep = collisionStepExpr


proc original(this: GettextMo_HashLookupIteration): string = 
  if this.originalInstFlag:
    return this.originalInst
  let originalInstExpr = string(GettextMo(this.root).mo.originals[this.idx].str)
  this.originalInst = originalInstExpr
  this.originalInstFlag = true
  return this.originalInst

proc translation(this: GettextMo_HashLookupIteration): string = 
  if this.translationInstFlag:
    return this.translationInst
  let translationInstExpr = string(GettextMo(this.root).mo.translations[this.idx].str)
  this.translationInst = translationInstExpr
  this.translationInstFlag = true
  return this.translationInst

proc nextIdx(this: GettextMo_HashLookupIteration): int = 
  if this.nextIdxInstFlag:
    return this.nextIdxInst
  let nextIdxInstExpr = int(((this.idx + this.collisionStep) - (if this.idx >= (GettextMo(this.root).mo.numHashtableItems - this.collisionStep): GettextMo(this.root).mo.numHashtableItems else: 0)))
  this.nextIdxInst = nextIdxInstExpr
  this.nextIdxInstFlag = true
  return this.nextIdxInst

proc next(this: GettextMo_HashLookupIteration): GettextMo_HashLookupIteration = 
  if this.nextInstFlag:
    return this.nextInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let nextInstExpr = GettextMo_HashLookupIteration.read(this.io, this.root, this, GettextMo(this.root).mo.hashtableItems[this.nextIdx].val, this.collisionStep)
  this.nextInst = nextInstExpr
  this.io.seek(pos)
  this.nextInstFlag = true
  return this.nextInst

proc fromFile*(_: typedesc[GettextMo_HashLookupIteration], filename: string): GettextMo_HashLookupIteration =
  GettextMo_HashLookupIteration.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GettextMo_LookupIteration], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, current: any, query: any): GettextMo_LookupIteration =
  template this: untyped = result
  this = new(GettextMo_LookupIteration)
  let root = if root == nil: cast[GettextMo](this) else: cast[GettextMo](root)
  this.io = io
  this.root = root
  this.parent = parent
  let currentExpr = GettextMo_HashLookupIteration(current)
  this.current = currentExpr
  let queryExpr = string(query)
  this.query = queryExpr


proc found(this: GettextMo_LookupIteration): bool = 
  if this.foundInstFlag:
    return this.foundInst
  let foundInstExpr = bool(this.query == this.current.original)
  this.foundInst = foundInstExpr
  this.foundInstFlag = true
  return this.foundInst

proc next(this: GettextMo_LookupIteration): GettextMo_LookupIteration = 
  if this.nextInstFlag:
    return this.nextInst
  if not(this.found):
    let pos = this.io.pos()
    this.io.seek(int(0))
    let nextInstExpr = GettextMo_LookupIteration.read(this.io, this.root, this, this.current.next, this.query)
    this.nextInst = nextInstExpr
    this.io.seek(pos)
  this.nextInstFlag = true
  return this.nextInst

proc fromFile*(_: typedesc[GettextMo_LookupIteration], filename: string): GettextMo_LookupIteration =
  GettextMo_LookupIteration.read(newKaitaiFileStream(filename), nil, nil)


##[
def lookup(s:str, t:gettext_mo.GettextMo):
  try:
    l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
    e=l.entry
    while(not e.found):
      e=e.next
    return e.current
  except:
    raise Exception("Not found "+s+" in the hashtable!")

lookup(t.mo.originals[145].str, t)

@see <a href="https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c">Source</a>
]##
proc read*(_: typedesc[GettextMo_HashtableLookup], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, query: any, hash: any): GettextMo_HashtableLookup =
  template this: untyped = result
  this = new(GettextMo_HashtableLookup)
  let root = if root == nil: cast[GettextMo](this) else: cast[GettextMo](root)
  this.io = io
  this.root = root
  this.parent = parent
  let queryExpr = string(query)
  this.query = queryExpr
  let hashExpr = uint32(hash)
  this.hash = hashExpr


proc collisionStep(this: GettextMo_HashtableLookup): int = 
  if this.collisionStepInstFlag:
    return this.collisionStepInst
  let collisionStepInstExpr = int(((this.hash %%% (GettextMo(this.root).mo.numHashtableItems - 2)) + 1))
  this.collisionStepInst = collisionStepInstExpr
  this.collisionStepInstFlag = true
  return this.collisionStepInst

proc idx(this: GettextMo_HashtableLookup): int = 
  if this.idxInstFlag:
    return this.idxInst
  let idxInstExpr = int((this.hash %%% GettextMo(this.root).mo.numHashtableItems))
  this.idxInst = idxInstExpr
  this.idxInstFlag = true
  return this.idxInst

proc hashLookupIteration(this: GettextMo_HashtableLookup): GettextMo_HashLookupIteration = 
  if this.hashLookupIterationInstFlag:
    return this.hashLookupIterationInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let hashLookupIterationInstExpr = GettextMo_HashLookupIteration.read(this.io, this.root, this, GettextMo(this.root).mo.hashtableItems[this.idx].val, this.collisionStep)
  this.hashLookupIterationInst = hashLookupIterationInstExpr
  this.io.seek(pos)
  this.hashLookupIterationInstFlag = true
  return this.hashLookupIterationInst

proc entry(this: GettextMo_HashtableLookup): GettextMo_LookupIteration = 
  if this.entryInstFlag:
    return this.entryInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let entryInstExpr = GettextMo_LookupIteration.read(this.io, this.root, this, this.hashLookupIteration, this.query)
  this.entryInst = entryInstExpr
  this.io.seek(pos)
  this.entryInstFlag = true
  return this.entryInst

proc fromFile*(_: typedesc[GettextMo_HashtableLookup], filename: string): GettextMo_HashtableLookup =
  GettextMo_HashtableLookup.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: GettextMo_Mo) =
  let versionExpr = GettextMo_Mo_Version.read(this.io, this.root, this)
  this.version = versionExpr
  let numTranslationsExpr = this.io.readU4le()
  this.numTranslations = numTranslationsExpr
  let ofsOriginalsExpr = this.io.readU4le()
  this.ofsOriginals = ofsOriginalsExpr
  let ofsTranslationsExpr = this.io.readU4le()
  this.ofsTranslations = ofsTranslationsExpr
  let numHashtableItemsExpr = this.io.readU4le()
  this.numHashtableItems = numHashtableItemsExpr
  let ofsHashtableItemsExpr = this.io.readU4le()
  this.ofsHashtableItems = ofsHashtableItemsExpr


proc readBe(this: GettextMo_Mo) =
  let versionExpr = GettextMo_Mo_Version.read(this.io, this.root, this)
  this.version = versionExpr
  let numTranslationsExpr = this.io.readU4be()
  this.numTranslations = numTranslationsExpr
  let ofsOriginalsExpr = this.io.readU4be()
  this.ofsOriginals = ofsOriginalsExpr
  let ofsTranslationsExpr = this.io.readU4be()
  this.ofsTranslations = ofsTranslationsExpr
  let numHashtableItemsExpr = this.io.readU4be()
  this.numHashtableItems = numHashtableItemsExpr
  let ofsHashtableItemsExpr = this.io.readU4be()
  this.ofsHashtableItems = ofsHashtableItemsExpr

proc read*(_: typedesc[GettextMo_Mo], io: KaitaiStream, root: KaitaiStruct, parent: GettextMo): GettextMo_Mo =
  template this: untyped = result
  this = new(GettextMo_Mo)
  let root = if root == nil: cast[GettextMo](this) else: cast[GettextMo](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = false

  block:
    let on = GettextMo(this.root).signature
    if on == @[222'u8, 18'u8, 4'u8, 149'u8]:
      let isLeExpr = bool(true)
      this.isLe = isLeExpr
    elif on == @[149'u8, 4'u8, 18'u8, 222'u8]:
      let isLeExpr = bool(false)
      this.isLe = isLeExpr

  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc originals(this: GettextMo_Mo): seq[GettextMo_Mo_Descriptor] = 
  if this.originalsInstFlag:
    return this.originalsInst
  let io = GettextMo(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsOriginals))
  if this.isLe:
    for i in 0 ..< int(this.numTranslations):
      let it = GettextMo_Mo_Descriptor.read(io, this.root, this)
      this.originalsInst.add(it)
  else:
    for i in 0 ..< int(this.numTranslations):
      let it = GettextMo_Mo_Descriptor.read(io, this.root, this)
      this.originalsInst.add(it)
  io.seek(pos)
  this.originalsInstFlag = true
  return this.originalsInst

proc translations(this: GettextMo_Mo): seq[GettextMo_Mo_Descriptor] = 
  if this.translationsInstFlag:
    return this.translationsInst
  let io = GettextMo(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsTranslations))
  if this.isLe:
    for i in 0 ..< int(this.numTranslations):
      let it = GettextMo_Mo_Descriptor.read(io, this.root, this)
      this.translationsInst.add(it)
  else:
    for i in 0 ..< int(this.numTranslations):
      let it = GettextMo_Mo_Descriptor.read(io, this.root, this)
      this.translationsInst.add(it)
  io.seek(pos)
  this.translationsInstFlag = true
  return this.translationsInst

proc hashtableItems(this: GettextMo_Mo): seq[GettextMo_Mo_HashtableItem] = 
  if this.hashtableItemsInstFlag:
    return this.hashtableItemsInst
  if this.ofsHashtableItems != 0:
    let io = GettextMo(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsHashtableItems))
    if this.isLe:
      for i in 0 ..< int(this.numHashtableItems):
        let it = GettextMo_Mo_HashtableItem.read(io, this.root, this)
        this.hashtableItemsInst.add(it)
    else:
      for i in 0 ..< int(this.numHashtableItems):
        let it = GettextMo_Mo_HashtableItem.read(io, this.root, this)
        this.hashtableItemsInst.add(it)
    io.seek(pos)
  this.hashtableItemsInstFlag = true
  return this.hashtableItemsInst

proc fromFile*(_: typedesc[GettextMo_Mo], filename: string): GettextMo_Mo =
  GettextMo_Mo.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: GettextMo_Mo_Version) =
  let versionRawExpr = this.io.readU4le()
  this.versionRaw = versionRawExpr


proc readBe(this: GettextMo_Mo_Version) =
  let versionRawExpr = this.io.readU4be()
  this.versionRaw = versionRawExpr

proc read*(_: typedesc[GettextMo_Mo_Version], io: KaitaiStream, root: KaitaiStruct, parent: GettextMo_Mo): GettextMo_Mo_Version =
  template this: untyped = result
  this = new(GettextMo_Mo_Version)
  let root = if root == nil: cast[GettextMo](this) else: cast[GettextMo](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc major(this: GettextMo_Mo_Version): int = 
  if this.majorInstFlag:
    return this.majorInst
  let majorInstExpr = int((this.versionRaw shr 16))
  this.majorInst = majorInstExpr
  this.majorInstFlag = true
  return this.majorInst

proc minor(this: GettextMo_Mo_Version): int = 
  if this.minorInstFlag:
    return this.minorInst
  let minorInstExpr = int((this.versionRaw and 65535))
  this.minorInst = minorInstExpr
  this.minorInstFlag = true
  return this.minorInst

proc fromFile*(_: typedesc[GettextMo_Mo_Version], filename: string): GettextMo_Mo_Version =
  GettextMo_Mo_Version.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: GettextMo_Mo_HashtableItem) =
  let rawValExpr = this.io.readU4le()
  this.rawVal = rawValExpr


proc readBe(this: GettextMo_Mo_HashtableItem) =
  let rawValExpr = this.io.readU4be()
  this.rawVal = rawValExpr

proc read*(_: typedesc[GettextMo_Mo_HashtableItem], io: KaitaiStream, root: KaitaiStruct, parent: GettextMo_Mo): GettextMo_Mo_HashtableItem =
  template this: untyped = result
  this = new(GettextMo_Mo_HashtableItem)
  let root = if root == nil: cast[GettextMo](this) else: cast[GettextMo](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc mask(this: GettextMo_Mo_HashtableItem): int = 
  if this.maskInstFlag:
    return this.maskInst
  let maskInstExpr = int(2147483648'i64)
  this.maskInst = maskInstExpr
  this.maskInstFlag = true
  return this.maskInst

proc val1(this: GettextMo_Mo_HashtableItem): int = 
  if this.val1InstFlag:
    return this.val1Inst
  if this.rawVal != 0:
    let val1InstExpr = int((this.rawVal - 1))
    this.val1Inst = val1InstExpr
  this.val1InstFlag = true
  return this.val1Inst

proc isSystemDependent(this: GettextMo_Mo_HashtableItem): bool = 
  if this.isSystemDependentInstFlag:
    return this.isSystemDependentInst
  if this.rawVal != 0:
    let isSystemDependentInstExpr = bool((this.val1 and this.mask) == 1)
    this.isSystemDependentInst = isSystemDependentInstExpr
  this.isSystemDependentInstFlag = true
  return this.isSystemDependentInst

proc val(this: GettextMo_Mo_HashtableItem): int = 
  if this.valInstFlag:
    return this.valInst
  if this.rawVal != 0:
    let valInstExpr = int((this.val1 and not(this.mask)))
    this.valInst = valInstExpr
  this.valInstFlag = true
  return this.valInst

proc fromFile*(_: typedesc[GettextMo_Mo_HashtableItem], filename: string): GettextMo_Mo_HashtableItem =
  GettextMo_Mo_HashtableItem.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: GettextMo_Mo_Descriptor) =
  let lenStrExpr = this.io.readU4le()
  this.lenStr = lenStrExpr
  let ofsStrExpr = this.io.readU4le()
  this.ofsStr = ofsStrExpr


proc readBe(this: GettextMo_Mo_Descriptor) =
  let lenStrExpr = this.io.readU4be()
  this.lenStr = lenStrExpr
  let ofsStrExpr = this.io.readU4be()
  this.ofsStr = ofsStrExpr

proc read*(_: typedesc[GettextMo_Mo_Descriptor], io: KaitaiStream, root: KaitaiStruct, parent: GettextMo_Mo): GettextMo_Mo_Descriptor =
  template this: untyped = result
  this = new(GettextMo_Mo_Descriptor)
  let root = if root == nil: cast[GettextMo](this) else: cast[GettextMo](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc str(this: GettextMo_Mo_Descriptor): string = 
  if this.strInstFlag:
    return this.strInst
  let io = GettextMo(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsStr))
  if this.isLe:
    let strInstExpr = encode(io.readBytes(int(this.lenStr)).bytesTerminate(0, false), "UTF-8")
    this.strInst = strInstExpr
  else:
    let strInstExpr = encode(io.readBytes(int(this.lenStr)).bytesTerminate(0, false), "UTF-8")
    this.strInst = strInstExpr
  io.seek(pos)
  this.strInstFlag = true
  return this.strInst

proc fromFile*(_: typedesc[GettextMo_Mo_Descriptor], filename: string): GettextMo_Mo_Descriptor =
  GettextMo_Mo_Descriptor.read(newKaitaiFileStream(filename), nil, nil)

