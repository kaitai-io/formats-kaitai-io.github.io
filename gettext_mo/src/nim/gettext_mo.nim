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
    `originalInst`*: string
    `translationInst`*: string
    `nextIdxInst`*: int
    `nextInst`*: GettextMo_HashLookupIteration
  GettextMo_LookupIteration* = ref object of KaitaiStruct
    `current`*: GettextMo_HashLookupIteration
    `query`*: string
    `parent`*: KaitaiStruct
    `foundInst`*: bool
    `nextInst`*: GettextMo_LookupIteration
  GettextMo_HashtableLookup* = ref object of KaitaiStruct
    `query`*: string
    `hash`*: uint32
    `parent`*: KaitaiStruct
    `collisionStepInst`*: int
    `idxInst`*: int
    `hashLookupIterationInst`*: GettextMo_HashLookupIteration
    `entryInst`*: GettextMo_LookupIteration
  GettextMo_Mo* = ref object of KaitaiStruct
    `version`*: GettextMo_Mo_Version
    `numTranslations`*: uint32
    `ofsOriginals`*: uint32
    `ofsTranslations`*: uint32
    `numHashtableItems`*: uint32
    `ofsHashtableItems`*: uint32
    `parent`*: GettextMo
    `originalsInst`*: seq[GettextMo_Mo_Descriptor]
    `translationsInst`*: seq[GettextMo_Mo_Descriptor]
    `hashtableItemsInst`*: seq[GettextMo_Mo_HashtableItem]
    isLe: bool
  GettextMo_Mo_Version* = ref object of KaitaiStruct
    `versionRaw`*: uint32
    `parent`*: GettextMo_Mo
    `majorInst`*: int
    `minorInst`*: int
    isLe: bool
  GettextMo_Mo_HashtableItem* = ref object of KaitaiStruct
    `rawVal`*: uint32
    `parent`*: GettextMo_Mo
    `maskInst`*: int
    `val1Inst`*: int
    `isSystemDependentInst`*: bool
    `valInst`*: int
    isLe: bool
  GettextMo_Mo_Descriptor* = ref object of KaitaiStruct
    `lenStr`*: uint32
    `ofsStr`*: uint32
    `parent`*: GettextMo_Mo
    `strInst`*: string
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
  if this.originalInst.len != 0:
    return this.originalInst
  let originalInstExpr = string(GettextMo(this.root).mo.originals[this.idx].str)
  this.originalInst = originalInstExpr
  if this.originalInst.len != 0:
    return this.originalInst

proc translation(this: GettextMo_HashLookupIteration): string = 
  if this.translationInst.len != 0:
    return this.translationInst
  let translationInstExpr = string(GettextMo(this.root).mo.translations[this.idx].str)
  this.translationInst = translationInstExpr
  if this.translationInst.len != 0:
    return this.translationInst

proc nextIdx(this: GettextMo_HashLookupIteration): int = 
  if this.nextIdxInst != nil:
    return this.nextIdxInst
  let nextIdxInstExpr = int(((this.idx + this.collisionStep) - (if this.idx >= (GettextMo(this.root).mo.numHashtableItems - this.collisionStep): GettextMo(this.root).mo.numHashtableItems else: 0)))
  this.nextIdxInst = nextIdxInstExpr
  if this.nextIdxInst != nil:
    return this.nextIdxInst

proc next(this: GettextMo_HashLookupIteration): GettextMo_HashLookupIteration = 
  if this.nextInst != nil:
    return this.nextInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let nextInstExpr = GettextMo_HashLookupIteration.read(this.io, this.root, this, GettextMo(this.root).mo.hashtableItems[this.nextIdx].val, this.collisionStep)
  this.nextInst = nextInstExpr
  this.io.seek(pos)
  if this.nextInst != nil:
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
  if this.foundInst != nil:
    return this.foundInst
  let foundInstExpr = bool(this.query == this.current.original)
  this.foundInst = foundInstExpr
  if this.foundInst != nil:
    return this.foundInst

proc next(this: GettextMo_LookupIteration): GettextMo_LookupIteration = 
  if this.nextInst != nil:
    return this.nextInst
  if not(this.found):
    let pos = this.io.pos()
    this.io.seek(int(0))
    let nextInstExpr = GettextMo_LookupIteration.read(this.io, this.root, this, this.current.next, this.query)
    this.nextInst = nextInstExpr
    this.io.seek(pos)
  if this.nextInst != nil:
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
  if this.collisionStepInst != nil:
    return this.collisionStepInst
  let collisionStepInstExpr = int(((this.hash %%% (GettextMo(this.root).mo.numHashtableItems - 2)) + 1))
  this.collisionStepInst = collisionStepInstExpr
  if this.collisionStepInst != nil:
    return this.collisionStepInst

proc idx(this: GettextMo_HashtableLookup): int = 
  if this.idxInst != nil:
    return this.idxInst
  let idxInstExpr = int((this.hash %%% GettextMo(this.root).mo.numHashtableItems))
  this.idxInst = idxInstExpr
  if this.idxInst != nil:
    return this.idxInst

proc hashLookupIteration(this: GettextMo_HashtableLookup): GettextMo_HashLookupIteration = 
  if this.hashLookupIterationInst != nil:
    return this.hashLookupIterationInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let hashLookupIterationInstExpr = GettextMo_HashLookupIteration.read(this.io, this.root, this, GettextMo(this.root).mo.hashtableItems[this.idx].val, this.collisionStep)
  this.hashLookupIterationInst = hashLookupIterationInstExpr
  this.io.seek(pos)
  if this.hashLookupIterationInst != nil:
    return this.hashLookupIterationInst

proc entry(this: GettextMo_HashtableLookup): GettextMo_LookupIteration = 
  if this.entryInst != nil:
    return this.entryInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let entryInstExpr = GettextMo_LookupIteration.read(this.io, this.root, this, this.hashLookupIteration, this.query)
  this.entryInst = entryInstExpr
  this.io.seek(pos)
  if this.entryInst != nil:
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
    if on == @[-34'u8, 18'u8, 4'u8, -107'u8]:
      let isLeExpr = bool(true)
      this.isLe = isLeExpr
    elif on == @[-107'u8, 4'u8, 18'u8, -34'u8]:
      let isLeExpr = bool(false)
      this.isLe = isLeExpr

  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc originals(this: GettextMo_Mo): seq[GettextMo_Mo_Descriptor] = 
  if this.originalsInst.len != 0:
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
  if this.originalsInst.len != 0:
    return this.originalsInst

proc translations(this: GettextMo_Mo): seq[GettextMo_Mo_Descriptor] = 
  if this.translationsInst.len != 0:
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
  if this.translationsInst.len != 0:
    return this.translationsInst

proc hashtableItems(this: GettextMo_Mo): seq[GettextMo_Mo_HashtableItem] = 
  if this.hashtableItemsInst.len != 0:
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
  if this.hashtableItemsInst.len != 0:
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
  if this.majorInst != nil:
    return this.majorInst
  let majorInstExpr = int((this.versionRaw shr 16))
  this.majorInst = majorInstExpr
  if this.majorInst != nil:
    return this.majorInst

proc minor(this: GettextMo_Mo_Version): int = 
  if this.minorInst != nil:
    return this.minorInst
  let minorInstExpr = int((this.versionRaw and 65535))
  this.minorInst = minorInstExpr
  if this.minorInst != nil:
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
  if this.maskInst != nil:
    return this.maskInst
  let maskInstExpr = int(2147483648'i64)
  this.maskInst = maskInstExpr
  if this.maskInst != nil:
    return this.maskInst

proc val1(this: GettextMo_Mo_HashtableItem): int = 
  if this.val1Inst != nil:
    return this.val1Inst
  if this.rawVal != 0:
    let val1InstExpr = int((this.rawVal - 1))
    this.val1Inst = val1InstExpr
  if this.val1Inst != nil:
    return this.val1Inst

proc isSystemDependent(this: GettextMo_Mo_HashtableItem): bool = 
  if this.isSystemDependentInst != nil:
    return this.isSystemDependentInst
  if this.rawVal != 0:
    let isSystemDependentInstExpr = bool((this.val1 and this.mask) == 1)
    this.isSystemDependentInst = isSystemDependentInstExpr
  if this.isSystemDependentInst != nil:
    return this.isSystemDependentInst

proc val(this: GettextMo_Mo_HashtableItem): int = 
  if this.valInst != nil:
    return this.valInst
  if this.rawVal != 0:
    let valInstExpr = int((this.val1 and not(this.mask)))
    this.valInst = valInstExpr
  if this.valInst != nil:
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
  if this.strInst.len != 0:
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
  if this.strInst.len != 0:
    return this.strInst

proc fromFile*(_: typedesc[GettextMo_Mo_Descriptor], filename: string): GettextMo_Mo_Descriptor =
  GettextMo_Mo_Descriptor.read(newKaitaiFileStream(filename), nil, nil)

