# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
import struct
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

from vlq_base128_be import VlqBase128Be
class StandardMidiFile(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.hdr = self._root.Header(self._io, self, self._root)
        self.tracks = [None] * (self.hdr.qty_tracks)
        for i in range(self.hdr.qty_tracks):
            self.tracks[i] = self._root.Track(self._io, self, self._root)


    class TrackEvents(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.event = []
            while not self._io.is_eof():
                self.event.append(self._root.TrackEvent(self._io, self, self._root))



    class TrackEvent(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.v_time = VlqBase128Be(self._io)
            self.event_header = self._io.read_u1()
            if self.event_header == 255:
                self.meta_event_body = self._root.MetaEventBody(self._io, self, self._root)

            if self.event_header == 240:
                self.sysex_body = self._root.SysexEventBody(self._io, self, self._root)

            _on = self.event_type
            if _on == 224:
                self.event_body = self._root.PitchBendEvent(self._io, self, self._root)
            elif _on == 144:
                self.event_body = self._root.NoteOnEvent(self._io, self, self._root)
            elif _on == 208:
                self.event_body = self._root.ChannelPressureEvent(self._io, self, self._root)
            elif _on == 192:
                self.event_body = self._root.ProgramChangeEvent(self._io, self, self._root)
            elif _on == 160:
                self.event_body = self._root.PolyphonicPressureEvent(self._io, self, self._root)
            elif _on == 176:
                self.event_body = self._root.ControllerEvent(self._io, self, self._root)
            elif _on == 128:
                self.event_body = self._root.NoteOffEvent(self._io, self, self._root)

        @property
        def event_type(self):
            if hasattr(self, '_m_event_type'):
                return self._m_event_type if hasattr(self, '_m_event_type') else None

            self._m_event_type = (self.event_header & 240)
            return self._m_event_type if hasattr(self, '_m_event_type') else None

        @property
        def channel(self):
            if hasattr(self, '_m_channel'):
                return self._m_channel if hasattr(self, '_m_channel') else None

            if self.event_type != 240:
                self._m_channel = (self.event_header & 15)

            return self._m_channel if hasattr(self, '_m_channel') else None


    class PitchBendEvent(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.b1 = self._io.read_u1()
            self.b2 = self._io.read_u1()

        @property
        def bend_value(self):
            if hasattr(self, '_m_bend_value'):
                return self._m_bend_value if hasattr(self, '_m_bend_value') else None

            self._m_bend_value = (((self.b2 << 7) + self.b1) - 16384)
            return self._m_bend_value if hasattr(self, '_m_bend_value') else None

        @property
        def adj_bend_value(self):
            if hasattr(self, '_m_adj_bend_value'):
                return self._m_adj_bend_value if hasattr(self, '_m_adj_bend_value') else None

            self._m_adj_bend_value = (self.bend_value - 16384)
            return self._m_adj_bend_value if hasattr(self, '_m_adj_bend_value') else None


    class ProgramChangeEvent(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.program = self._io.read_u1()


    class NoteOnEvent(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.note = self._io.read_u1()
            self.velocity = self._io.read_u1()


    class PolyphonicPressureEvent(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.note = self._io.read_u1()
            self.pressure = self._io.read_u1()


    class Track(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(struct.pack('4b', 77, 84, 114, 107))
            self.track_length = self._io.read_u4be()
            self._raw_events = self._io.read_bytes(self.track_length)
            io = KaitaiStream(BytesIO(self._raw_events))
            self.events = self._root.TrackEvents(io, self, self._root)


    class MetaEventBody(KaitaiStruct):

        class MetaTypeEnum(Enum):
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
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.meta_type = self._root.MetaEventBody.MetaTypeEnum(self._io.read_u1())
            self.len = VlqBase128Be(self._io)
            self.body = self._io.read_bytes(self.len.value)


    class ControllerEvent(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.controller = self._io.read_u1()
            self.value = self._io.read_u1()


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(struct.pack('4b', 77, 84, 104, 100))
            self.header_length = self._io.read_u4be()
            self.format = self._io.read_u2be()
            self.qty_tracks = self._io.read_u2be()
            self.division = self._io.read_s2be()


    class SysexEventBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = VlqBase128Be(self._io)
            self.data = self._io.read_bytes(self.len.value)


    class NoteOffEvent(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.note = self._io.read_u1()
            self.velocity = self._io.read_u1()


    class ChannelPressureEvent(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.pressure = self._io.read_u1()



