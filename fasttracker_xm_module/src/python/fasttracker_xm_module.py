# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

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
        super(FasttrackerXmModule, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.preheader = FasttrackerXmModule.Preheader(self._io, self, self._root)
        self._raw_header = self._io.read_bytes(self.preheader.header_size - 4)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = FasttrackerXmModule.Header(_io__raw_header, self, self._root)
        self.patterns = []
        for i in range(self.header.num_patterns):
            self.patterns.append(FasttrackerXmModule.Pattern(self._io, self, self._root))

        self.instruments = []
        for i in range(self.header.num_instruments):
            self.instruments.append(FasttrackerXmModule.Instrument(self._io, self, self._root))



    def _fetch_instances(self):
        pass
        self.preheader._fetch_instances()
        self.header._fetch_instances()
        for i in range(len(self.patterns)):
            pass
            self.patterns[i]._fetch_instances()

        for i in range(len(self.instruments)):
            pass
            self.instruments[i]._fetch_instances()


    class Flags(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(FasttrackerXmModule.Flags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.reserved = self._io.read_bits_int_be(15)
            self.freq_table_type = self._io.read_bits_int_be(1) != 0


        def _fetch_instances(self):
            pass


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(FasttrackerXmModule.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.song_length = self._io.read_u2le()
            self.restart_position = self._io.read_u2le()
            self.num_channels = self._io.read_u2le()
            self.num_patterns = self._io.read_u2le()
            self.num_instruments = self._io.read_u2le()
            self.flags = FasttrackerXmModule.Flags(self._io, self, self._root)
            self.default_tempo = self._io.read_u2le()
            self.default_bpm = self._io.read_u2le()
            self.pattern_order_table = []
            for i in range(256):
                self.pattern_order_table.append(self._io.read_u1())



        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            for i in range(len(self.pattern_order_table)):
                pass



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
            super(FasttrackerXmModule.Instrument, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header_size = self._io.read_u4le()
            self._raw_header = self._io.read_bytes(self.header_size - 4)
            _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
            self.header = FasttrackerXmModule.Instrument.Header(_io__raw_header, self, self._root)
            self.samples_headers = []
            for i in range(self.header.num_samples):
                self.samples_headers.append(FasttrackerXmModule.Instrument.SampleHeader(self._io, self, self._root))

            self.samples = []
            for i in range(self.header.num_samples):
                self.samples.append(FasttrackerXmModule.Instrument.SamplesData(self.samples_headers[i], self._io, self, self._root))



        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            for i in range(len(self.samples_headers)):
                pass
                self.samples_headers[i]._fetch_instances()

            for i in range(len(self.samples)):
                pass
                self.samples[i]._fetch_instances()


        class ExtraHeader(KaitaiStruct):

            class Type(IntEnum):
                true = 0
                sustain = 1
                loop = 2
            def __init__(self, _io, _parent=None, _root=None):
                super(FasttrackerXmModule.Instrument.ExtraHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.len_sample_header = self._io.read_u4le()
                self.idx_sample_per_note = []
                for i in range(96):
                    self.idx_sample_per_note.append(self._io.read_u1())

                self.volume_points = []
                for i in range(12):
                    self.volume_points.append(FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint(self._io, self, self._root))

                self.panning_points = []
                for i in range(12):
                    self.panning_points.append(FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint(self._io, self, self._root))

                self.num_volume_points = self._io.read_u1()
                self.num_panning_points = self._io.read_u1()
                self.volume_sustain_point = self._io.read_u1()
                self.volume_loop_start_point = self._io.read_u1()
                self.volume_loop_end_point = self._io.read_u1()
                self.panning_sustain_point = self._io.read_u1()
                self.panning_loop_start_point = self._io.read_u1()
                self.panning_loop_end_point = self._io.read_u1()
                self.volume_type = KaitaiStream.resolve_enum(FasttrackerXmModule.Instrument.ExtraHeader.Type, self._io.read_u1())
                self.panning_type = KaitaiStream.resolve_enum(FasttrackerXmModule.Instrument.ExtraHeader.Type, self._io.read_u1())
                self.vibrato_type = self._io.read_u1()
                self.vibrato_sweep = self._io.read_u1()
                self.vibrato_depth = self._io.read_u1()
                self.vibrato_rate = self._io.read_u1()
                self.volume_fadeout = self._io.read_u2le()
                self.reserved = self._io.read_u2le()


            def _fetch_instances(self):
                pass
                for i in range(len(self.idx_sample_per_note)):
                    pass

                for i in range(len(self.volume_points)):
                    pass
                    self.volume_points[i]._fetch_instances()

                for i in range(len(self.panning_points)):
                    pass
                    self.panning_points[i]._fetch_instances()


            class EnvelopePoint(KaitaiStruct):
                """Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
                BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
                Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
                !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
                Of course it does not help if all instruments have the values inside FT2 supported range.
                The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
                """
                def __init__(self, _io, _parent=None, _root=None):
                    super(FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._read()

                def _read(self):
                    self.x = self._io.read_u2le()
                    self.y = self._io.read_u2le()


                def _fetch_instances(self):
                    pass



        class Header(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(FasttrackerXmModule.Instrument.Header, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(22), 0, False)).decode(u"UTF-8")
                self.type = self._io.read_u1()
                self.num_samples = self._io.read_u2le()
                if self.num_samples > 0:
                    pass
                    self.extra_header = FasttrackerXmModule.Instrument.ExtraHeader(self._io, self, self._root)



            def _fetch_instances(self):
                pass
                if self.num_samples > 0:
                    pass
                    self.extra_header._fetch_instances()



        class SampleHeader(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(FasttrackerXmModule.Instrument.SampleHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.sample_length = self._io.read_u4le()
                self.sample_loop_start = self._io.read_u4le()
                self.sample_loop_length = self._io.read_u4le()
                self.volume = self._io.read_u1()
                self.fine_tune = self._io.read_s1()
                self.type = FasttrackerXmModule.Instrument.SampleHeader.LoopType(self._io, self, self._root)
                self.panning = self._io.read_u1()
                self.relative_note_number = self._io.read_s1()
                self.reserved = self._io.read_u1()
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(22), 0, False)).decode(u"UTF-8")


            def _fetch_instances(self):
                pass
                self.type._fetch_instances()

            class LoopType(KaitaiStruct):

                class LoopType(IntEnum):
                    none = 0
                    forward = 1
                    ping_pong = 2
                def __init__(self, _io, _parent=None, _root=None):
                    super(FasttrackerXmModule.Instrument.SampleHeader.LoopType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._read()

                def _read(self):
                    self.reserved0 = self._io.read_bits_int_be(3)
                    self.is_sample_data_16_bit = self._io.read_bits_int_be(1) != 0
                    self.reserved1 = self._io.read_bits_int_be(2)
                    self.loop_type = KaitaiStream.resolve_enum(FasttrackerXmModule.Instrument.SampleHeader.LoopType.LoopType, self._io.read_bits_int_be(2))


                def _fetch_instances(self):
                    pass



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
                super(FasttrackerXmModule.Instrument.SamplesData, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self.header = header
                self._read()

            def _read(self):
                self.data = self._io.read_bytes(self.header.sample_length * (2 if self.header.type.is_sample_data_16_bit else 1))


            def _fetch_instances(self):
                pass



    class Pattern(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(FasttrackerXmModule.Pattern, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = FasttrackerXmModule.Pattern.Header(self._io, self, self._root)
            self.packed_data = self._io.read_bytes(self.header.main.len_packed_pattern)


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()

        class Header(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(FasttrackerXmModule.Pattern.Header, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.header_length = self._io.read_u4le()
                self._raw_main = self._io.read_bytes(self.header_length - 4)
                _io__raw_main = KaitaiStream(BytesIO(self._raw_main))
                self.main = FasttrackerXmModule.Pattern.Header.HeaderMain(_io__raw_main, self, self._root)


            def _fetch_instances(self):
                pass
                self.main._fetch_instances()

            class HeaderMain(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    super(FasttrackerXmModule.Pattern.Header.HeaderMain, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._read()

                def _read(self):
                    self.packing_type = self._io.read_u1()
                    _on = self._root.preheader.version_number.value
                    if _on == 258:
                        pass
                        self.num_rows_raw = self._io.read_u1()
                    else:
                        pass
                        self.num_rows_raw = self._io.read_u2le()
                    self.len_packed_pattern = self._io.read_u2le()


                def _fetch_instances(self):
                    pass
                    _on = self._root.preheader.version_number.value
                    if _on == 258:
                        pass
                    else:
                        pass

                @property
                def num_rows(self):
                    if hasattr(self, '_m_num_rows'):
                        return self._m_num_rows

                    self._m_num_rows = self.num_rows_raw + (1 if self._root.preheader.version_number.value == 258 else 0)
                    return getattr(self, '_m_num_rows', None)




    class Preheader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(FasttrackerXmModule.Preheader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.signature0 = self._io.read_bytes(17)
            if not self.signature0 == b"\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20":
                raise kaitaistruct.ValidationNotEqualError(b"\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20", self.signature0, self._io, u"/types/preheader/seq/0")
            self.module_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(20), 0, False)).decode(u"UTF-8")
            self.signature1 = self._io.read_bytes(1)
            if not self.signature1 == b"\x1A":
                raise kaitaistruct.ValidationNotEqualError(b"\x1A", self.signature1, self._io, u"/types/preheader/seq/2")
            self.tracker_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(20), 0, False)).decode(u"UTF-8")
            self.version_number = FasttrackerXmModule.Preheader.Version(self._io, self, self._root)
            self.header_size = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            self.version_number._fetch_instances()

        class Version(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(FasttrackerXmModule.Preheader.Version, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.minor = self._io.read_u1()
                self.major = self._io.read_u1()


            def _fetch_instances(self):
                pass

            @property
            def value(self):
                if hasattr(self, '_m_value'):
                    return self._m_value

                self._m_value = self.major << 8 | self.minor
                return getattr(self, '_m_value', None)




