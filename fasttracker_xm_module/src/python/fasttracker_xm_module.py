# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class FasttrackerXmModule(KaitaiStruct):
    """XM (standing for eXtended Module) is a popular module music file
    format, that was introduced in 1994 in FastTracker2 by Triton demo
    group. Akin to MOD files, it bundles both digital samples
    (instruments) and instructions on which note to play at what time
    (patterns), which provides good audio quality with relatively small
    file size. Audio is reproducible without relying on the sound of
    particular hardware samplers or synths.
    
    .. seealso::
       Source - http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
       ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.preheader = self._root.Preheader(self._io, self, self._root)
        self._raw_header = self._io.read_bytes((self.preheader.header_size - 4))
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = self._root.Header(_io__raw_header, self, self._root)
        self.patterns = [None] * (self.header.num_patterns)
        for i in range(self.header.num_patterns):
            self.patterns[i] = self._root.Pattern(self._io, self, self._root)

        self.instruments = [None] * (self.header.num_instruments)
        for i in range(self.header.num_instruments):
            self.instruments[i] = self._root.Instrument(self._io, self, self._root)


    class Preheader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.signature0 = self._io.ensure_fixed_contents(b"\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20")
            self.module_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(20), 0, False)).decode(u"utf-8")
            self.signature1 = self._io.ensure_fixed_contents(b"\x1A")
            self.tracker_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(20), 0, False)).decode(u"utf-8")
            self.version_number = self._root.Preheader.Version(self._io, self, self._root)
            self.header_size = self._io.read_u4le()

        class Version(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.minor = self._io.read_u1()
                self.major = self._io.read_u1()

            @property
            def value(self):
                if hasattr(self, '_m_value'):
                    return self._m_value if hasattr(self, '_m_value') else None

                self._m_value = ((self.major << 8) | self.minor)
                return self._m_value if hasattr(self, '_m_value') else None



    class Pattern(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = self._root.Pattern.Header(self._io, self, self._root)
            self.packed_data = self._io.read_bytes(self.header.main.len_packed_pattern)

        class Header(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.header_length = self._io.read_u4le()
                self._raw_main = self._io.read_bytes((self.header_length - 4))
                _io__raw_main = KaitaiStream(BytesIO(self._raw_main))
                self.main = self._root.Pattern.Header.HeaderMain(_io__raw_main, self, self._root)

            class HeaderMain(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.packing_type = self._io.read_u1()
                    _on = self._root.preheader.version_number.value
                    if _on == 258:
                        self.num_rows_raw = self._io.read_u1()
                    else:
                        self.num_rows_raw = self._io.read_u2le()
                    self.len_packed_pattern = self._io.read_u2le()

                @property
                def num_rows(self):
                    if hasattr(self, '_m_num_rows'):
                        return self._m_num_rows if hasattr(self, '_m_num_rows') else None

                    self._m_num_rows = (self.num_rows_raw + (1 if self._root.preheader.version_number.value == 258 else 0))
                    return self._m_num_rows if hasattr(self, '_m_num_rows') else None




    class Flags(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.reserved = self._io.read_bits_int(15)
            self.freq_table_type = self._io.read_bits_int(1) != 0


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.song_length = self._io.read_u2le()
            self.restart_position = self._io.read_u2le()
            self.num_channels = self._io.read_u2le()
            self.num_patterns = self._io.read_u2le()
            self.num_instruments = self._io.read_u2le()
            self.flags = self._root.Flags(self._io, self, self._root)
            self.default_tempo = self._io.read_u2le()
            self.default_bpm = self._io.read_u2le()
            self.pattern_order_table = [None] * (256)
            for i in range(256):
                self.pattern_order_table[i] = self._io.read_u1()



    class Instrument(KaitaiStruct):
        """XM's notion of "instrument" typically constitutes of a
        instrument metadata and one or several samples. Metadata
        includes:
        
        * instrument's name
        * instruction of which sample to use for which note
        * volume and panning envelopes and looping instructions
        * vibrato settings
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header_size = self._io.read_u4le()
            self._raw_header = self._io.read_bytes((self.header_size - 4))
            _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
            self.header = self._root.Instrument.Header(_io__raw_header, self, self._root)
            self.samples_headers = [None] * (self.header.num_samples)
            for i in range(self.header.num_samples):
                self.samples_headers[i] = self._root.Instrument.SampleHeader(self._io, self, self._root)

            self.samples = [None] * (self.header.num_samples)
            for i in range(self.header.num_samples):
                self.samples[i] = self._root.Instrument.SamplesData(self.samples_headers[i], self._io, self, self._root)


        class Header(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(22), 0, False)).decode(u"utf-8")
                self.type = self._io.read_u1()
                self.num_samples = self._io.read_u2le()
                if self.num_samples > 0:
                    self.extra_header = self._root.Instrument.ExtraHeader(self._io, self, self._root)



        class ExtraHeader(KaitaiStruct):

            class Type(Enum):
                true = 0
                sustain = 1
                loop = 2
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.len_sample_header = self._io.read_u4le()
                self.idx_sample_per_note = [None] * (96)
                for i in range(96):
                    self.idx_sample_per_note[i] = self._io.read_u1()

                self.volume_points = [None] * (12)
                for i in range(12):
                    self.volume_points[i] = self._root.Instrument.ExtraHeader.EnvelopePoint(self._io, self, self._root)

                self.panning_points = [None] * (12)
                for i in range(12):
                    self.panning_points[i] = self._root.Instrument.ExtraHeader.EnvelopePoint(self._io, self, self._root)

                self.num_volume_points = self._io.read_u1()
                self.num_panning_points = self._io.read_u1()
                self.volume_sustain_point = self._io.read_u1()
                self.volume_loop_start_point = self._io.read_u1()
                self.volume_loop_end_point = self._io.read_u1()
                self.panning_sustain_point = self._io.read_u1()
                self.panning_loop_start_point = self._io.read_u1()
                self.panning_loop_end_point = self._io.read_u1()
                self.volume_type = KaitaiStream.resolve_enum(self._root.Instrument.ExtraHeader.Type, self._io.read_u1())
                self.panning_type = KaitaiStream.resolve_enum(self._root.Instrument.ExtraHeader.Type, self._io.read_u1())
                self.vibrato_type = self._io.read_u1()
                self.vibrato_sweep = self._io.read_u1()
                self.vibrato_depth = self._io.read_u1()
                self.vibrato_rate = self._io.read_u1()
                self.volume_fadeout = self._io.read_u2le()
                self.reserved = self._io.read_u2le()

            class EnvelopePoint(KaitaiStruct):
                """Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
                BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
                Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
                !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
                Of course it does not help if all instruments have the values inside FT2 supported range.
                The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
                """
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.x = self._io.read_u2le()
                    self.y = self._io.read_u2le()



        class SamplesData(KaitaiStruct):
            """The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
            Pseudocode for converting the delta-coded data to normal data,
            old = 0;
            for i in range(data_len):
              new = sample[i] + old;
              sample[i] = new;
              old = new;
            """
            def __init__(self, header, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self.header = header
                self._read()

            def _read(self):
                self.data = self._io.read_bytes((self.header.sample_length * (2 if self.header.type.is_sample_data_16_bit else 1)))


        class SampleHeader(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.sample_length = self._io.read_u4le()
                self.sample_loop_start = self._io.read_u4le()
                self.sample_loop_length = self._io.read_u4le()
                self.volume = self._io.read_u1()
                self.fine_tune = self._io.read_s1()
                self.type = self._root.Instrument.SampleHeader.LoopType(self._io, self, self._root)
                self.panning = self._io.read_u1()
                self.relative_note_number = self._io.read_s1()
                self.reserved = self._io.read_u1()
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(22), 0, False)).decode(u"utf-8")

            class LoopType(KaitaiStruct):

                class LoopType(Enum):
                    none = 0
                    forward = 1
                    ping_pong = 2
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.reserved0 = self._io.read_bits_int(3)
                    self.is_sample_data_16_bit = self._io.read_bits_int(1) != 0
                    self.reserved1 = self._io.read_bits_int(2)
                    self.loop_type = KaitaiStream.resolve_enum(self._root.Instrument.SampleHeader.LoopType.LoopType, self._io.read_bits_int(2))





