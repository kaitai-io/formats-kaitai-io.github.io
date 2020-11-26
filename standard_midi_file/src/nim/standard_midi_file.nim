import kaitai_struct_nim_runtime
import options
import /common/vlq_base128_be

import "vlq_base128_be"
type
  StandardMidiFile* = ref object of KaitaiStruct
    `hdr`*: StandardMidiFile_Header
    `tracks`*: seq[StandardMidiFile_Track]
    `parent`*: KaitaiStruct
  StandardMidiFile_TrackEvents* = ref object of KaitaiStruct
    `event`*: seq[StandardMidiFile_TrackEvent]
    `parent`*: StandardMidiFile_Track
  StandardMidiFile_TrackEvent* = ref object of KaitaiStruct
    `vTime`*: VlqBase128Be
    `eventHeader`*: uint8
    `metaEventBody`*: StandardMidiFile_MetaEventBody
    `sysexBody`*: StandardMidiFile_SysexEventBody
    `eventBody`*: KaitaiStruct
    `parent`*: StandardMidiFile_TrackEvents
    `eventTypeInst`*: int
    `channelInst`*: int
  StandardMidiFile_PitchBendEvent* = ref object of KaitaiStruct
    `b1`*: uint8
    `b2`*: uint8
    `parent`*: StandardMidiFile_TrackEvent
    `bendValueInst`*: int
    `adjBendValueInst`*: int
  StandardMidiFile_ProgramChangeEvent* = ref object of KaitaiStruct
    `program`*: uint8
    `parent`*: StandardMidiFile_TrackEvent
  StandardMidiFile_NoteOnEvent* = ref object of KaitaiStruct
    `note`*: uint8
    `velocity`*: uint8
    `parent`*: StandardMidiFile_TrackEvent
  StandardMidiFile_PolyphonicPressureEvent* = ref object of KaitaiStruct
    `note`*: uint8
    `pressure`*: uint8
    `parent`*: StandardMidiFile_TrackEvent
  StandardMidiFile_Track* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `lenEvents`*: uint32
    `events`*: StandardMidiFile_TrackEvents
    `parent`*: StandardMidiFile
    `rawEvents`*: seq[byte]
  StandardMidiFile_MetaEventBody* = ref object of KaitaiStruct
    `metaType`*: StandardMidiFile_MetaEventBody_MetaTypeEnum
    `len`*: VlqBase128Be
    `body`*: seq[byte]
    `parent`*: StandardMidiFile_TrackEvent
  StandardMidiFile_MetaEventBody_MetaTypeEnum* = enum
    sequence_number = 0
    text_event = 1
    copyright = 2
    sequence_track_name = 3
    instrument_name = 4
    lyric_text = 5
    marker_text = 6
    cue_point = 7
    midi_channel_prefix_assignment = 32
    end_of_track = 47
    tempo = 81
    smpte_offset = 84
    time_signature = 88
    key_signature = 89
    sequencer_specific_event = 127
  StandardMidiFile_ControllerEvent* = ref object of KaitaiStruct
    `controller`*: uint8
    `value`*: uint8
    `parent`*: StandardMidiFile_TrackEvent
  StandardMidiFile_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `lenHeader`*: uint32
    `format`*: uint16
    `numTracks`*: uint16
    `division`*: int16
    `parent`*: StandardMidiFile
  StandardMidiFile_SysexEventBody* = ref object of KaitaiStruct
    `len`*: VlqBase128Be
    `data`*: seq[byte]
    `parent`*: StandardMidiFile_TrackEvent
  StandardMidiFile_NoteOffEvent* = ref object of KaitaiStruct
    `note`*: uint8
    `velocity`*: uint8
    `parent`*: StandardMidiFile_TrackEvent
  StandardMidiFile_ChannelPressureEvent* = ref object of KaitaiStruct
    `pressure`*: uint8
    `parent`*: StandardMidiFile_TrackEvent

proc read*(_: typedesc[StandardMidiFile], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): StandardMidiFile
proc read*(_: typedesc[StandardMidiFile_TrackEvents], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_Track): StandardMidiFile_TrackEvents
proc read*(_: typedesc[StandardMidiFile_TrackEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvents): StandardMidiFile_TrackEvent
proc read*(_: typedesc[StandardMidiFile_PitchBendEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_PitchBendEvent
proc read*(_: typedesc[StandardMidiFile_ProgramChangeEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_ProgramChangeEvent
proc read*(_: typedesc[StandardMidiFile_NoteOnEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_NoteOnEvent
proc read*(_: typedesc[StandardMidiFile_PolyphonicPressureEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_PolyphonicPressureEvent
proc read*(_: typedesc[StandardMidiFile_Track], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile): StandardMidiFile_Track
proc read*(_: typedesc[StandardMidiFile_MetaEventBody], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_MetaEventBody
proc read*(_: typedesc[StandardMidiFile_ControllerEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_ControllerEvent
proc read*(_: typedesc[StandardMidiFile_Header], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile): StandardMidiFile_Header
proc read*(_: typedesc[StandardMidiFile_SysexEventBody], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_SysexEventBody
proc read*(_: typedesc[StandardMidiFile_NoteOffEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_NoteOffEvent
proc read*(_: typedesc[StandardMidiFile_ChannelPressureEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_ChannelPressureEvent

proc eventType*(this: StandardMidiFile_TrackEvent): int
proc channel*(this: StandardMidiFile_TrackEvent): int
proc bendValue*(this: StandardMidiFile_PitchBendEvent): int
proc adjBendValue*(this: StandardMidiFile_PitchBendEvent): int


##[
Standard MIDI file, typically known just as "MID", is a standard way
to serialize series of MIDI events, which is a protocol used in many
music synthesizers to transfer music data: notes being played,
effects being applied, etc.

Internally, file consists of a header and series of tracks, every
track listing MIDI events with certain header designating time these
events are happening.

NOTE: Rarely, MIDI files employ certain stateful compression scheme
to avoid storing certain elements of further elements, instead
reusing them from events which happened earlier in the
stream. Kaitai Struct (as of v0.9) is currently unable to parse
these, but files employing this mechanism are relatively rare.

]##
proc read*(_: typedesc[StandardMidiFile], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): StandardMidiFile =
  template this: untyped = result
  this = new(StandardMidiFile)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hdrExpr = StandardMidiFile_Header.read(this.io, this.root, this)
  this.hdr = hdrExpr
  for i in 0 ..< int(this.hdr.numTracks):
    let it = StandardMidiFile_Track.read(this.io, this.root, this)
    this.tracks.add(it)

proc fromFile*(_: typedesc[StandardMidiFile], filename: string): StandardMidiFile =
  StandardMidiFile.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_TrackEvents], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_Track): StandardMidiFile_TrackEvents =
  template this: untyped = result
  this = new(StandardMidiFile_TrackEvents)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = StandardMidiFile_TrackEvent.read(this.io, this.root, this)
      this.event.add(it)
      inc i

proc fromFile*(_: typedesc[StandardMidiFile_TrackEvents], filename: string): StandardMidiFile_TrackEvents =
  StandardMidiFile_TrackEvents.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_TrackEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvents): StandardMidiFile_TrackEvent =
  template this: untyped = result
  this = new(StandardMidiFile_TrackEvent)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let vTimeExpr = VlqBase128Be.read(this.io, this.root, this)
  this.vTime = vTimeExpr
  let eventHeaderExpr = this.io.readU1()
  this.eventHeader = eventHeaderExpr
  if this.eventHeader == 255:
    let metaEventBodyExpr = StandardMidiFile_MetaEventBody.read(this.io, this.root, this)
    this.metaEventBody = metaEventBodyExpr
  if this.eventHeader == 240:
    let sysexBodyExpr = StandardMidiFile_SysexEventBody.read(this.io, this.root, this)
    this.sysexBody = sysexBodyExpr
  block:
    let on = this.eventType
    if on == 224:
      let eventBodyExpr = StandardMidiFile_PitchBendEvent.read(this.io, this.root, this)
      this.eventBody = eventBodyExpr
    elif on == 144:
      let eventBodyExpr = StandardMidiFile_NoteOnEvent.read(this.io, this.root, this)
      this.eventBody = eventBodyExpr
    elif on == 208:
      let eventBodyExpr = StandardMidiFile_ChannelPressureEvent.read(this.io, this.root, this)
      this.eventBody = eventBodyExpr
    elif on == 192:
      let eventBodyExpr = StandardMidiFile_ProgramChangeEvent.read(this.io, this.root, this)
      this.eventBody = eventBodyExpr
    elif on == 160:
      let eventBodyExpr = StandardMidiFile_PolyphonicPressureEvent.read(this.io, this.root, this)
      this.eventBody = eventBodyExpr
    elif on == 176:
      let eventBodyExpr = StandardMidiFile_ControllerEvent.read(this.io, this.root, this)
      this.eventBody = eventBodyExpr
    elif on == 128:
      let eventBodyExpr = StandardMidiFile_NoteOffEvent.read(this.io, this.root, this)
      this.eventBody = eventBodyExpr

proc eventType(this: StandardMidiFile_TrackEvent): int = 
  if this.eventTypeInst != nil:
    return this.eventTypeInst
  let eventTypeInstExpr = int((this.eventHeader and 240))
  this.eventTypeInst = eventTypeInstExpr
  if this.eventTypeInst != nil:
    return this.eventTypeInst

proc channel(this: StandardMidiFile_TrackEvent): int = 
  if this.channelInst != nil:
    return this.channelInst
  if this.eventType != 240:
    let channelInstExpr = int((this.eventHeader and 15))
    this.channelInst = channelInstExpr
  if this.channelInst != nil:
    return this.channelInst

proc fromFile*(_: typedesc[StandardMidiFile_TrackEvent], filename: string): StandardMidiFile_TrackEvent =
  StandardMidiFile_TrackEvent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_PitchBendEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_PitchBendEvent =
  template this: untyped = result
  this = new(StandardMidiFile_PitchBendEvent)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let b1Expr = this.io.readU1()
  this.b1 = b1Expr
  let b2Expr = this.io.readU1()
  this.b2 = b2Expr

proc bendValue(this: StandardMidiFile_PitchBendEvent): int = 
  if this.bendValueInst != nil:
    return this.bendValueInst
  let bendValueInstExpr = int((((this.b2 shl 7) + this.b1) - 16384))
  this.bendValueInst = bendValueInstExpr
  if this.bendValueInst != nil:
    return this.bendValueInst

proc adjBendValue(this: StandardMidiFile_PitchBendEvent): int = 
  if this.adjBendValueInst != nil:
    return this.adjBendValueInst
  let adjBendValueInstExpr = int((this.bendValue - 16384))
  this.adjBendValueInst = adjBendValueInstExpr
  if this.adjBendValueInst != nil:
    return this.adjBendValueInst

proc fromFile*(_: typedesc[StandardMidiFile_PitchBendEvent], filename: string): StandardMidiFile_PitchBendEvent =
  StandardMidiFile_PitchBendEvent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_ProgramChangeEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_ProgramChangeEvent =
  template this: untyped = result
  this = new(StandardMidiFile_ProgramChangeEvent)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let programExpr = this.io.readU1()
  this.program = programExpr

proc fromFile*(_: typedesc[StandardMidiFile_ProgramChangeEvent], filename: string): StandardMidiFile_ProgramChangeEvent =
  StandardMidiFile_ProgramChangeEvent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_NoteOnEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_NoteOnEvent =
  template this: untyped = result
  this = new(StandardMidiFile_NoteOnEvent)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let noteExpr = this.io.readU1()
  this.note = noteExpr
  let velocityExpr = this.io.readU1()
  this.velocity = velocityExpr

proc fromFile*(_: typedesc[StandardMidiFile_NoteOnEvent], filename: string): StandardMidiFile_NoteOnEvent =
  StandardMidiFile_NoteOnEvent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_PolyphonicPressureEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_PolyphonicPressureEvent =
  template this: untyped = result
  this = new(StandardMidiFile_PolyphonicPressureEvent)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let noteExpr = this.io.readU1()
  this.note = noteExpr
  let pressureExpr = this.io.readU1()
  this.pressure = pressureExpr

proc fromFile*(_: typedesc[StandardMidiFile_PolyphonicPressureEvent], filename: string): StandardMidiFile_PolyphonicPressureEvent =
  StandardMidiFile_PolyphonicPressureEvent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_Track], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile): StandardMidiFile_Track =
  template this: untyped = result
  this = new(StandardMidiFile_Track)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let lenEventsExpr = this.io.readU4be()
  this.lenEvents = lenEventsExpr
  let rawEventsExpr = this.io.readBytes(int(this.lenEvents))
  this.rawEvents = rawEventsExpr
  let rawEventsIo = newKaitaiStream(rawEventsExpr)
  let eventsExpr = StandardMidiFile_TrackEvents.read(rawEventsIo, this.root, this)
  this.events = eventsExpr

proc fromFile*(_: typedesc[StandardMidiFile_Track], filename: string): StandardMidiFile_Track =
  StandardMidiFile_Track.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_MetaEventBody], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_MetaEventBody =
  template this: untyped = result
  this = new(StandardMidiFile_MetaEventBody)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let metaTypeExpr = StandardMidiFile_MetaEventBody_MetaTypeEnum(this.io.readU1())
  this.metaType = metaTypeExpr
  let lenExpr = VlqBase128Be.read(this.io, this.root, this)
  this.len = lenExpr
  let bodyExpr = this.io.readBytes(int(this.len.value))
  this.body = bodyExpr

proc fromFile*(_: typedesc[StandardMidiFile_MetaEventBody], filename: string): StandardMidiFile_MetaEventBody =
  StandardMidiFile_MetaEventBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_ControllerEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_ControllerEvent =
  template this: untyped = result
  this = new(StandardMidiFile_ControllerEvent)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let controllerExpr = this.io.readU1()
  this.controller = controllerExpr
  let valueExpr = this.io.readU1()
  this.value = valueExpr

proc fromFile*(_: typedesc[StandardMidiFile_ControllerEvent], filename: string): StandardMidiFile_ControllerEvent =
  StandardMidiFile_ControllerEvent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_Header], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile): StandardMidiFile_Header =
  template this: untyped = result
  this = new(StandardMidiFile_Header)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let lenHeaderExpr = this.io.readU4be()
  this.lenHeader = lenHeaderExpr
  let formatExpr = this.io.readU2be()
  this.format = formatExpr
  let numTracksExpr = this.io.readU2be()
  this.numTracks = numTracksExpr
  let divisionExpr = this.io.readS2be()
  this.division = divisionExpr

proc fromFile*(_: typedesc[StandardMidiFile_Header], filename: string): StandardMidiFile_Header =
  StandardMidiFile_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_SysexEventBody], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_SysexEventBody =
  template this: untyped = result
  this = new(StandardMidiFile_SysexEventBody)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = VlqBase128Be.read(this.io, this.root, this)
  this.len = lenExpr
  let dataExpr = this.io.readBytes(int(this.len.value))
  this.data = dataExpr

proc fromFile*(_: typedesc[StandardMidiFile_SysexEventBody], filename: string): StandardMidiFile_SysexEventBody =
  StandardMidiFile_SysexEventBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_NoteOffEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_NoteOffEvent =
  template this: untyped = result
  this = new(StandardMidiFile_NoteOffEvent)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let noteExpr = this.io.readU1()
  this.note = noteExpr
  let velocityExpr = this.io.readU1()
  this.velocity = velocityExpr

proc fromFile*(_: typedesc[StandardMidiFile_NoteOffEvent], filename: string): StandardMidiFile_NoteOffEvent =
  StandardMidiFile_NoteOffEvent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[StandardMidiFile_ChannelPressureEvent], io: KaitaiStream, root: KaitaiStruct, parent: StandardMidiFile_TrackEvent): StandardMidiFile_ChannelPressureEvent =
  template this: untyped = result
  this = new(StandardMidiFile_ChannelPressureEvent)
  let root = if root == nil: cast[StandardMidiFile](this) else: cast[StandardMidiFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let pressureExpr = this.io.readU1()
  this.pressure = pressureExpr

proc fromFile*(_: typedesc[StandardMidiFile_ChannelPressureEvent], filename: string): StandardMidiFile_ChannelPressureEvent =
  StandardMidiFile_ChannelPressureEvent.read(newKaitaiFileStream(filename), nil, nil)

