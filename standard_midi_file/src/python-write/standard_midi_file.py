# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import vlq_base128_be
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class StandardMidiFile(ReadWriteKaitaiStruct):
    """Standard MIDI file, typically known just as "MID", is a standard way
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
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(StandardMidiFile, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.hdr = StandardMidiFile.Header(self._io, self, self._root)
        self.hdr._read()
        self.tracks = []
        for i in range(self.hdr.num_tracks):
            _t_tracks = StandardMidiFile.Track(self._io, self, self._root)
            try:
                _t_tracks._read()
            finally:
                self.tracks.append(_t_tracks)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.hdr._fetch_instances()
        for i in range(len(self.tracks)):
            pass
            self.tracks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(StandardMidiFile, self)._write__seq(io)
        self.hdr._write__seq(self._io)
        for i in range(len(self.tracks)):
            pass
            self.tracks[i]._write__seq(self._io)



    def _check(self):
        if self.hdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"hdr", self._root, self.hdr._root)
        if self.hdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"hdr", self, self.hdr._parent)
        if len(self.tracks) != self.hdr.num_tracks:
            raise kaitaistruct.ConsistencyError(u"tracks", self.hdr.num_tracks, len(self.tracks))
        for i in range(len(self.tracks)):
            pass
            if self.tracks[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"tracks", self._root, self.tracks[i]._root)
            if self.tracks[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"tracks", self, self.tracks[i]._parent)

        self._dirty = False

    class ChannelPressureEvent(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.ChannelPressureEvent, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.pressure = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(StandardMidiFile.ChannelPressureEvent, self)._write__seq(io)
            self._io.write_u1(self.pressure)


        def _check(self):
            self._dirty = False


    class ControllerEvent(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.ControllerEvent, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.controller = self._io.read_u1()
            self.value = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(StandardMidiFile.ControllerEvent, self)._write__seq(io)
            self._io.write_u1(self.controller)
            self._io.write_u1(self.value)


        def _check(self):
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x4D\x54\x68\x64":
                raise kaitaistruct.ValidationNotEqualError(b"\x4D\x54\x68\x64", self.magic, self._io, u"/types/header/seq/0")
            self.len_header = self._io.read_u4be()
            self.format = self._io.read_u2be()
            self.num_tracks = self._io.read_u2be()
            self.division = self._io.read_s2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(StandardMidiFile.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4be(self.len_header)
            self._io.write_u2be(self.format)
            self._io.write_u2be(self.num_tracks)
            self._io.write_s2be(self.division)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x4D\x54\x68\x64":
                raise kaitaistruct.ValidationNotEqualError(b"\x4D\x54\x68\x64", self.magic, None, u"/types/header/seq/0")
            self._dirty = False


    class MetaEventBody(ReadWriteKaitaiStruct):

        class MetaTypeEnum(IntEnum):
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
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.MetaEventBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.meta_type = KaitaiStream.resolve_enum(StandardMidiFile.MetaEventBody.MetaTypeEnum, self._io.read_u1())
            self.len = vlq_base128_be.VlqBase128Be(self._io)
            self.len._read()
            self.body = self._io.read_bytes(self.len.value)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len._fetch_instances()


        def _write__seq(self, io=None):
            super(StandardMidiFile.MetaEventBody, self)._write__seq(io)
            self._io.write_u1(int(self.meta_type))
            self.len._write__seq(self._io)
            self._io.write_bytes(self.body)


        def _check(self):
            if len(self.body) != self.len.value:
                raise kaitaistruct.ConsistencyError(u"body", self.len.value, len(self.body))
            self._dirty = False


    class NoteOffEvent(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.NoteOffEvent, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.note = self._io.read_u1()
            self.velocity = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(StandardMidiFile.NoteOffEvent, self)._write__seq(io)
            self._io.write_u1(self.note)
            self._io.write_u1(self.velocity)


        def _check(self):
            self._dirty = False


    class NoteOnEvent(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.NoteOnEvent, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.note = self._io.read_u1()
            self.velocity = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(StandardMidiFile.NoteOnEvent, self)._write__seq(io)
            self._io.write_u1(self.note)
            self._io.write_u1(self.velocity)


        def _check(self):
            self._dirty = False


    class PitchBendEvent(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.PitchBendEvent, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.b1 = self._io.read_u1()
            self.b2 = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(StandardMidiFile.PitchBendEvent, self)._write__seq(io)
            self._io.write_u1(self.b1)
            self._io.write_u1(self.b2)


        def _check(self):
            self._dirty = False

        @property
        def adj_bend_value(self):
            if hasattr(self, '_m_adj_bend_value'):
                return self._m_adj_bend_value

            self._m_adj_bend_value = self.bend_value - 16384
            return getattr(self, '_m_adj_bend_value', None)

        def _invalidate_adj_bend_value(self):
            del self._m_adj_bend_value
        @property
        def bend_value(self):
            if hasattr(self, '_m_bend_value'):
                return self._m_bend_value

            self._m_bend_value = ((self.b2 << 7) + self.b1) - 16384
            return getattr(self, '_m_bend_value', None)

        def _invalidate_bend_value(self):
            del self._m_bend_value

    class PolyphonicPressureEvent(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.PolyphonicPressureEvent, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.note = self._io.read_u1()
            self.pressure = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(StandardMidiFile.PolyphonicPressureEvent, self)._write__seq(io)
            self._io.write_u1(self.note)
            self._io.write_u1(self.pressure)


        def _check(self):
            self._dirty = False


    class ProgramChangeEvent(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.ProgramChangeEvent, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.program = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(StandardMidiFile.ProgramChangeEvent, self)._write__seq(io)
            self._io.write_u1(self.program)


        def _check(self):
            self._dirty = False


    class SysexEventBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.SysexEventBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = vlq_base128_be.VlqBase128Be(self._io)
            self.len._read()
            self.data = self._io.read_bytes(self.len.value)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len._fetch_instances()


        def _write__seq(self, io=None):
            super(StandardMidiFile.SysexEventBody, self)._write__seq(io)
            self.len._write__seq(self._io)
            self._io.write_bytes(self.data)


        def _check(self):
            if len(self.data) != self.len.value:
                raise kaitaistruct.ConsistencyError(u"data", self.len.value, len(self.data))
            self._dirty = False


    class Track(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.Track, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x4D\x54\x72\x6B":
                raise kaitaistruct.ValidationNotEqualError(b"\x4D\x54\x72\x6B", self.magic, self._io, u"/types/track/seq/0")
            self.len_events = self._io.read_u4be()
            self._raw_events = self._io.read_bytes(self.len_events)
            _io__raw_events = KaitaiStream(BytesIO(self._raw_events))
            self.events = StandardMidiFile.TrackEvents(_io__raw_events, self, self._root)
            self.events._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.events._fetch_instances()


        def _write__seq(self, io=None):
            super(StandardMidiFile.Track, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4be(self.len_events)
            _io__raw_events = KaitaiStream(BytesIO(bytearray(self.len_events)))
            self._io.add_child_stream(_io__raw_events)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_events))
            def handler(parent, _io__raw_events=_io__raw_events):
                self._raw_events = _io__raw_events.to_byte_array()
                if len(self._raw_events) != self.len_events:
                    raise kaitaistruct.ConsistencyError(u"raw(events)", self.len_events, len(self._raw_events))
                parent.write_bytes(self._raw_events)
            _io__raw_events.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.events._write__seq(_io__raw_events)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x4D\x54\x72\x6B":
                raise kaitaistruct.ValidationNotEqualError(b"\x4D\x54\x72\x6B", self.magic, None, u"/types/track/seq/0")
            if self.events._root != self._root:
                raise kaitaistruct.ConsistencyError(u"events", self._root, self.events._root)
            if self.events._parent != self:
                raise kaitaistruct.ConsistencyError(u"events", self, self.events._parent)
            self._dirty = False


    class TrackEvent(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.TrackEvent, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.v_time = vlq_base128_be.VlqBase128Be(self._io)
            self.v_time._read()
            self.event_header = self._io.read_u1()
            if self.event_header == 255:
                pass
                self.meta_event_body = StandardMidiFile.MetaEventBody(self._io, self, self._root)
                self.meta_event_body._read()

            if self.event_header == 240:
                pass
                self.sysex_body = StandardMidiFile.SysexEventBody(self._io, self, self._root)
                self.sysex_body._read()

            _on = self.event_type
            if _on == 128:
                pass
                self.event_body = StandardMidiFile.NoteOffEvent(self._io, self, self._root)
                self.event_body._read()
            elif _on == 144:
                pass
                self.event_body = StandardMidiFile.NoteOnEvent(self._io, self, self._root)
                self.event_body._read()
            elif _on == 160:
                pass
                self.event_body = StandardMidiFile.PolyphonicPressureEvent(self._io, self, self._root)
                self.event_body._read()
            elif _on == 176:
                pass
                self.event_body = StandardMidiFile.ControllerEvent(self._io, self, self._root)
                self.event_body._read()
            elif _on == 192:
                pass
                self.event_body = StandardMidiFile.ProgramChangeEvent(self._io, self, self._root)
                self.event_body._read()
            elif _on == 208:
                pass
                self.event_body = StandardMidiFile.ChannelPressureEvent(self._io, self, self._root)
                self.event_body._read()
            elif _on == 224:
                pass
                self.event_body = StandardMidiFile.PitchBendEvent(self._io, self, self._root)
                self.event_body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.v_time._fetch_instances()
            if self.event_header == 255:
                pass
                self.meta_event_body._fetch_instances()

            if self.event_header == 240:
                pass
                self.sysex_body._fetch_instances()

            _on = self.event_type
            if _on == 128:
                pass
                self.event_body._fetch_instances()
            elif _on == 144:
                pass
                self.event_body._fetch_instances()
            elif _on == 160:
                pass
                self.event_body._fetch_instances()
            elif _on == 176:
                pass
                self.event_body._fetch_instances()
            elif _on == 192:
                pass
                self.event_body._fetch_instances()
            elif _on == 208:
                pass
                self.event_body._fetch_instances()
            elif _on == 224:
                pass
                self.event_body._fetch_instances()


        def _write__seq(self, io=None):
            super(StandardMidiFile.TrackEvent, self)._write__seq(io)
            self.v_time._write__seq(self._io)
            self._io.write_u1(self.event_header)
            if self.event_header == 255:
                pass
                self.meta_event_body._write__seq(self._io)

            if self.event_header == 240:
                pass
                self.sysex_body._write__seq(self._io)

            _on = self.event_type
            if _on == 128:
                pass
                self.event_body._write__seq(self._io)
            elif _on == 144:
                pass
                self.event_body._write__seq(self._io)
            elif _on == 160:
                pass
                self.event_body._write__seq(self._io)
            elif _on == 176:
                pass
                self.event_body._write__seq(self._io)
            elif _on == 192:
                pass
                self.event_body._write__seq(self._io)
            elif _on == 208:
                pass
                self.event_body._write__seq(self._io)
            elif _on == 224:
                pass
                self.event_body._write__seq(self._io)


        def _check(self):
            if self.event_header == 255:
                pass
                if self.meta_event_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"meta_event_body", self._root, self.meta_event_body._root)
                if self.meta_event_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"meta_event_body", self, self.meta_event_body._parent)

            if self.event_header == 240:
                pass
                if self.sysex_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"sysex_body", self._root, self.sysex_body._root)
                if self.sysex_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"sysex_body", self, self.sysex_body._parent)

            _on = self.event_type
            if _on == 128:
                pass
                if self.event_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"event_body", self._root, self.event_body._root)
                if self.event_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"event_body", self, self.event_body._parent)
            elif _on == 144:
                pass
                if self.event_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"event_body", self._root, self.event_body._root)
                if self.event_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"event_body", self, self.event_body._parent)
            elif _on == 160:
                pass
                if self.event_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"event_body", self._root, self.event_body._root)
                if self.event_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"event_body", self, self.event_body._parent)
            elif _on == 176:
                pass
                if self.event_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"event_body", self._root, self.event_body._root)
                if self.event_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"event_body", self, self.event_body._parent)
            elif _on == 192:
                pass
                if self.event_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"event_body", self._root, self.event_body._root)
                if self.event_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"event_body", self, self.event_body._parent)
            elif _on == 208:
                pass
                if self.event_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"event_body", self._root, self.event_body._root)
                if self.event_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"event_body", self, self.event_body._parent)
            elif _on == 224:
                pass
                if self.event_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"event_body", self._root, self.event_body._root)
                if self.event_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"event_body", self, self.event_body._parent)
            self._dirty = False

        @property
        def channel(self):
            if hasattr(self, '_m_channel'):
                return self._m_channel

            if self.event_type != 240:
                pass
                self._m_channel = self.event_header & 15

            return getattr(self, '_m_channel', None)

        def _invalidate_channel(self):
            del self._m_channel
        @property
        def event_type(self):
            if hasattr(self, '_m_event_type'):
                return self._m_event_type

            self._m_event_type = self.event_header & 240
            return getattr(self, '_m_event_type', None)

        def _invalidate_event_type(self):
            del self._m_event_type

    class TrackEvents(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(StandardMidiFile.TrackEvents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.event = []
            i = 0
            while not self._io.is_eof():
                _t_event = StandardMidiFile.TrackEvent(self._io, self, self._root)
                try:
                    _t_event._read()
                finally:
                    self.event.append(_t_event)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.event)):
                pass
                self.event[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(StandardMidiFile.TrackEvents, self)._write__seq(io)
            for i in range(len(self.event)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"event", 0, self._io.size() - self._io.pos())
                self.event[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"event", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.event)):
                pass
                if self.event[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"event", self._root, self.event[i]._root)
                if self.event[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"event", self, self.event[i]._parent)

            self._dirty = False



