import kaitai_struct_nim_runtime
import options

type
  GenmidiOp2* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `instruments`*: seq[GenmidiOp2_InstrumentEntry]
    `instrumentNames`*: seq[string]
    `parent`*: KaitaiStruct
  GenmidiOp2_InstrumentEntry* = ref object of KaitaiStruct
    `flags`*: uint16
    `finetune`*: uint8
    `note`*: uint8
    `instruments`*: seq[GenmidiOp2_Instrument]
    `parent`*: GenmidiOp2
  GenmidiOp2_Instrument* = ref object of KaitaiStruct
    `op1`*: GenmidiOp2_OpSettings
    `feedback`*: uint8
    `op2`*: GenmidiOp2_OpSettings
    `unused`*: uint8
    `baseNote`*: int16
    `parent`*: GenmidiOp2_InstrumentEntry
  GenmidiOp2_OpSettings* = ref object of KaitaiStruct
    `tremVibr`*: uint8
    `attDec`*: uint8
    `sustRel`*: uint8
    `wave`*: uint8
    `scale`*: uint8
    `level`*: uint8
    `parent`*: GenmidiOp2_Instrument

proc read*(_: typedesc[GenmidiOp2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GenmidiOp2
proc read*(_: typedesc[GenmidiOp2_InstrumentEntry], io: KaitaiStream, root: KaitaiStruct, parent: GenmidiOp2): GenmidiOp2_InstrumentEntry
proc read*(_: typedesc[GenmidiOp2_Instrument], io: KaitaiStream, root: KaitaiStruct, parent: GenmidiOp2_InstrumentEntry): GenmidiOp2_Instrument
proc read*(_: typedesc[GenmidiOp2_OpSettings], io: KaitaiStream, root: KaitaiStruct, parent: GenmidiOp2_Instrument): GenmidiOp2_OpSettings



##[
GENMIDI.OP2 is a sound bank file used by players based on DMX sound
library to play MIDI files with General MIDI instruments using OPL2
sound chip (which was commonly installed on popular AdLib and Sound
Blaster sound cards).

Major users of DMX sound library include:

* Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
* Raptor: Call of the Shadows

@see <a href="http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip">Source</a>
@see <a href="https://doom.fandom.com/wiki/GENMIDI">Source</a>
@see <a href="https://moddingwiki.shikadi.net/wiki/OP2_Bank_Format">Source</a>
]##
proc read*(_: typedesc[GenmidiOp2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GenmidiOp2 =
  template this: untyped = result
  this = new(GenmidiOp2)
  let root = if root == nil: cast[GenmidiOp2](this) else: cast[GenmidiOp2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(8))
  this.magic = magicExpr
  for i in 0 ..< int(175):
    let it = GenmidiOp2_InstrumentEntry.read(this.io, this.root, this)
    this.instruments.add(it)
  for i in 0 ..< int(175):
    let it = encode(this.io.readBytes(int(32)).bytesStripRight(0).bytesTerminate(0, false), "ASCII")
    this.instrumentNames.add(it)

proc fromFile*(_: typedesc[GenmidiOp2], filename: string): GenmidiOp2 =
  GenmidiOp2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GenmidiOp2_InstrumentEntry], io: KaitaiStream, root: KaitaiStruct, parent: GenmidiOp2): GenmidiOp2_InstrumentEntry =
  template this: untyped = result
  this = new(GenmidiOp2_InstrumentEntry)
  let root = if root == nil: cast[GenmidiOp2](this) else: cast[GenmidiOp2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr
  let finetuneExpr = this.io.readU1()
  this.finetune = finetuneExpr

  ##[
  MIDI note for fixed instruments, 0 otherwise
  ]##
  let noteExpr = this.io.readU1()
  this.note = noteExpr
  for i in 0 ..< int(2):
    let it = GenmidiOp2_Instrument.read(this.io, this.root, this)
    this.instruments.add(it)

proc fromFile*(_: typedesc[GenmidiOp2_InstrumentEntry], filename: string): GenmidiOp2_InstrumentEntry =
  GenmidiOp2_InstrumentEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GenmidiOp2_Instrument], io: KaitaiStream, root: KaitaiStruct, parent: GenmidiOp2_InstrumentEntry): GenmidiOp2_Instrument =
  template this: untyped = result
  this = new(GenmidiOp2_Instrument)
  let root = if root == nil: cast[GenmidiOp2](this) else: cast[GenmidiOp2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let op1Expr = GenmidiOp2_OpSettings.read(this.io, this.root, this)
  this.op1 = op1Expr

  ##[
  Feedback/AM-FM (both operators)
  ]##
  let feedbackExpr = this.io.readU1()
  this.feedback = feedbackExpr
  let op2Expr = GenmidiOp2_OpSettings.read(this.io, this.root, this)
  this.op2 = op2Expr
  let unusedExpr = this.io.readU1()
  this.unused = unusedExpr

  ##[
  Base note offset
  ]##
  let baseNoteExpr = this.io.readS2le()
  this.baseNote = baseNoteExpr

proc fromFile*(_: typedesc[GenmidiOp2_Instrument], filename: string): GenmidiOp2_Instrument =
  GenmidiOp2_Instrument.read(newKaitaiFileStream(filename), nil, nil)


##[
OPL2 settings for one operator (carrier or modulator)

]##
proc read*(_: typedesc[GenmidiOp2_OpSettings], io: KaitaiStream, root: KaitaiStruct, parent: GenmidiOp2_Instrument): GenmidiOp2_OpSettings =
  template this: untyped = result
  this = new(GenmidiOp2_OpSettings)
  let root = if root == nil: cast[GenmidiOp2](this) else: cast[GenmidiOp2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Tremolo/vibrato/sustain/KSR/multi
  ]##
  let tremVibrExpr = this.io.readU1()
  this.tremVibr = tremVibrExpr

  ##[
  Attack rate/decay rate
  ]##
  let attDecExpr = this.io.readU1()
  this.attDec = attDecExpr

  ##[
  Sustain level/release rate
  ]##
  let sustRelExpr = this.io.readU1()
  this.sustRel = sustRelExpr

  ##[
  Waveform select
  ]##
  let waveExpr = this.io.readU1()
  this.wave = waveExpr

  ##[
  Key scale level
  ]##
  let scaleExpr = this.io.readU1()
  this.scale = scaleExpr

  ##[
  Output level
  ]##
  let levelExpr = this.io.readU1()
  this.level = levelExpr

proc fromFile*(_: typedesc[GenmidiOp2_OpSettings], filename: string): GenmidiOp2_OpSettings =
  GenmidiOp2_OpSettings.read(newKaitaiFileStream(filename), nil, nil)

