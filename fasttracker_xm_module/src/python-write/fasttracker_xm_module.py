# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class FasttrackerXmModule(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(FasttrackerXmModule, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.preheader = FasttrackerXmModule.Preheader(self._io, self, self._root)
        self.preheader._read()
        self._raw_header = self._io.read_bytes(self.preheader.header_size - 4)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = FasttrackerXmModule.Header(_io__raw_header, self, self._root)
        self.header._read()
        self.patterns = []
        for i in range(self.header.num_patterns):
            _t_patterns = FasttrackerXmModule.Pattern(self._io, self, self._root)
            try:
                _t_patterns._read()
            finally:
                self.patterns.append(_t_patterns)

        self.instruments = []
        for i in range(self.header.num_instruments):
            _t_instruments = FasttrackerXmModule.Instrument(self._io, self, self._root)
            try:
                _t_instruments._read()
            finally:
                self.instruments.append(_t_instruments)

        self._dirty = False


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



    def _write__seq(self, io=None):
        super(FasttrackerXmModule, self)._write__seq(io)
        self.preheader._write__seq(self._io)
        _io__raw_header = KaitaiStream(BytesIO(bytearray(self.preheader.header_size - 4)))
        self._io.add_child_stream(_io__raw_header)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.preheader.header_size - 4))
        def handler(parent, _io__raw_header=_io__raw_header):
            self._raw_header = _io__raw_header.to_byte_array()
            if len(self._raw_header) != self.preheader.header_size - 4:
                raise kaitaistruct.ConsistencyError(u"raw(header)", self.preheader.header_size - 4, len(self._raw_header))
            parent.write_bytes(self._raw_header)
        _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.header._write__seq(_io__raw_header)
        for i in range(len(self.patterns)):
            pass
            self.patterns[i]._write__seq(self._io)

        for i in range(len(self.instruments)):
            pass
            self.instruments[i]._write__seq(self._io)



    def _check(self):
        if self.preheader._root != self._root:
            raise kaitaistruct.ConsistencyError(u"preheader", self._root, self.preheader._root)
        if self.preheader._parent != self:
            raise kaitaistruct.ConsistencyError(u"preheader", self, self.preheader._parent)
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.patterns) != self.header.num_patterns:
            raise kaitaistruct.ConsistencyError(u"patterns", self.header.num_patterns, len(self.patterns))
        for i in range(len(self.patterns)):
            pass
            if self.patterns[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"patterns", self._root, self.patterns[i]._root)
            if self.patterns[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"patterns", self, self.patterns[i]._parent)

        if len(self.instruments) != self.header.num_instruments:
            raise kaitaistruct.ConsistencyError(u"instruments", self.header.num_instruments, len(self.instruments))
        for i in range(len(self.instruments)):
            pass
            if self.instruments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"instruments", self._root, self.instruments[i]._root)
            if self.instruments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"instruments", self, self.instruments[i]._parent)

        self._dirty = False

    class Flags(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FasttrackerXmModule.Flags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved = self._io.read_bits_int_be(15)
            self.freq_table_type = self._io.read_bits_int_be(1) != 0
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(FasttrackerXmModule.Flags, self)._write__seq(io)
            self._io.write_bits_int_be(15, self.reserved)
            self._io.write_bits_int_be(1, int(self.freq_table_type))


        def _check(self):
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FasttrackerXmModule.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.song_length = self._io.read_u2le()
            self.restart_position = self._io.read_u2le()
            self.num_channels = self._io.read_u2le()
            self.num_patterns = self._io.read_u2le()
            self.num_instruments = self._io.read_u2le()
            self.flags = FasttrackerXmModule.Flags(self._io, self, self._root)
            self.flags._read()
            self.default_tempo = self._io.read_u2le()
            self.default_bpm = self._io.read_u2le()
            self.pattern_order_table = []
            for i in range(256):
                self.pattern_order_table.append(self._io.read_u1())

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            for i in range(len(self.pattern_order_table)):
                pass



        def _write__seq(self, io=None):
            super(FasttrackerXmModule.Header, self)._write__seq(io)
            self._io.write_u2le(self.song_length)
            self._io.write_u2le(self.restart_position)
            self._io.write_u2le(self.num_channels)
            self._io.write_u2le(self.num_patterns)
            self._io.write_u2le(self.num_instruments)
            self.flags._write__seq(self._io)
            self._io.write_u2le(self.default_tempo)
            self._io.write_u2le(self.default_bpm)
            for i in range(len(self.pattern_order_table)):
                pass
                self._io.write_u1(self.pattern_order_table[i])



        def _check(self):
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len(self.pattern_order_table) != 256:
                raise kaitaistruct.ConsistencyError(u"pattern_order_table", 256, len(self.pattern_order_table))
            for i in range(len(self.pattern_order_table)):
                pass

            self._dirty = False


    class Instrument(ReadWriteKaitaiStruct):
        """XM's notion of "instrument" typically constitutes of a
        instrument metadata and one or several samples. Metadata
        includes:
        
        * instrument's name
        * instruction of which sample to use for which note
        * volume and panning envelopes and looping instructions
        * vibrato settings
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FasttrackerXmModule.Instrument, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header_size = self._io.read_u4le()
            self._raw_header = self._io.read_bytes(self.header_size - 4)
            _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
            self.header = FasttrackerXmModule.Instrument.Header(_io__raw_header, self, self._root)
            self.header._read()
            self.samples_headers = []
            for i in range(self.header.num_samples):
                _t_samples_headers = FasttrackerXmModule.Instrument.SampleHeader(self._io, self, self._root)
                try:
                    _t_samples_headers._read()
                finally:
                    self.samples_headers.append(_t_samples_headers)

            self.samples = []
            for i in range(self.header.num_samples):
                _t_samples = FasttrackerXmModule.Instrument.SamplesData(self.samples_headers[i], self._io, self, self._root)
                try:
                    _t_samples._read()
                finally:
                    self.samples.append(_t_samples)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            for i in range(len(self.samples_headers)):
                pass
                self.samples_headers[i]._fetch_instances()

            for i in range(len(self.samples)):
                pass
                self.samples[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(FasttrackerXmModule.Instrument, self)._write__seq(io)
            self._io.write_u4le(self.header_size)
            _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_size - 4)))
            self._io.add_child_stream(_io__raw_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.header_size - 4))
            def handler(parent, _io__raw_header=_io__raw_header):
                self._raw_header = _io__raw_header.to_byte_array()
                if len(self._raw_header) != self.header_size - 4:
                    raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_size - 4, len(self._raw_header))
                parent.write_bytes(self._raw_header)
            _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.header._write__seq(_io__raw_header)
            for i in range(len(self.samples_headers)):
                pass
                self.samples_headers[i]._write__seq(self._io)

            for i in range(len(self.samples)):
                pass
                self.samples[i]._write__seq(self._io)



        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            if len(self.samples_headers) != self.header.num_samples:
                raise kaitaistruct.ConsistencyError(u"samples_headers", self.header.num_samples, len(self.samples_headers))
            for i in range(len(self.samples_headers)):
                pass
                if self.samples_headers[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"samples_headers", self._root, self.samples_headers[i]._root)
                if self.samples_headers[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"samples_headers", self, self.samples_headers[i]._parent)

            if len(self.samples) != self.header.num_samples:
                raise kaitaistruct.ConsistencyError(u"samples", self.header.num_samples, len(self.samples))
            for i in range(len(self.samples)):
                pass
                if self.samples[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"samples", self._root, self.samples[i]._root)
                if self.samples[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"samples", self, self.samples[i]._parent)
                if self.samples[i].header != self.samples_headers[i]:
                    raise kaitaistruct.ConsistencyError(u"samples", self.samples_headers[i], self.samples[i].header)

            self._dirty = False

        class ExtraHeader(ReadWriteKaitaiStruct):

            class Type(IntEnum):
                true = 0
                sustain = 1
                loop = 2
            def __init__(self, _io=None, _parent=None, _root=None):
                super(FasttrackerXmModule.Instrument.ExtraHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.len_sample_header = self._io.read_u4le()
                self.idx_sample_per_note = []
                for i in range(96):
                    self.idx_sample_per_note.append(self._io.read_u1())

                self.volume_points = []
                for i in range(12):
                    _t_volume_points = FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint(self._io, self, self._root)
                    try:
                        _t_volume_points._read()
                    finally:
                        self.volume_points.append(_t_volume_points)

                self.panning_points = []
                for i in range(12):
                    _t_panning_points = FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint(self._io, self, self._root)
                    try:
                        _t_panning_points._read()
                    finally:
                        self.panning_points.append(_t_panning_points)

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
                self._dirty = False


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



            def _write__seq(self, io=None):
                super(FasttrackerXmModule.Instrument.ExtraHeader, self)._write__seq(io)
                self._io.write_u4le(self.len_sample_header)
                for i in range(len(self.idx_sample_per_note)):
                    pass
                    self._io.write_u1(self.idx_sample_per_note[i])

                for i in range(len(self.volume_points)):
                    pass
                    self.volume_points[i]._write__seq(self._io)

                for i in range(len(self.panning_points)):
                    pass
                    self.panning_points[i]._write__seq(self._io)

                self._io.write_u1(self.num_volume_points)
                self._io.write_u1(self.num_panning_points)
                self._io.write_u1(self.volume_sustain_point)
                self._io.write_u1(self.volume_loop_start_point)
                self._io.write_u1(self.volume_loop_end_point)
                self._io.write_u1(self.panning_sustain_point)
                self._io.write_u1(self.panning_loop_start_point)
                self._io.write_u1(self.panning_loop_end_point)
                self._io.write_u1(int(self.volume_type))
                self._io.write_u1(int(self.panning_type))
                self._io.write_u1(self.vibrato_type)
                self._io.write_u1(self.vibrato_sweep)
                self._io.write_u1(self.vibrato_depth)
                self._io.write_u1(self.vibrato_rate)
                self._io.write_u2le(self.volume_fadeout)
                self._io.write_u2le(self.reserved)


            def _check(self):
                if len(self.idx_sample_per_note) != 96:
                    raise kaitaistruct.ConsistencyError(u"idx_sample_per_note", 96, len(self.idx_sample_per_note))
                for i in range(len(self.idx_sample_per_note)):
                    pass

                if len(self.volume_points) != 12:
                    raise kaitaistruct.ConsistencyError(u"volume_points", 12, len(self.volume_points))
                for i in range(len(self.volume_points)):
                    pass
                    if self.volume_points[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"volume_points", self._root, self.volume_points[i]._root)
                    if self.volume_points[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"volume_points", self, self.volume_points[i]._parent)

                if len(self.panning_points) != 12:
                    raise kaitaistruct.ConsistencyError(u"panning_points", 12, len(self.panning_points))
                for i in range(len(self.panning_points)):
                    pass
                    if self.panning_points[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"panning_points", self._root, self.panning_points[i]._root)
                    if self.panning_points[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"panning_points", self, self.panning_points[i]._parent)

                self._dirty = False

            class EnvelopePoint(ReadWriteKaitaiStruct):
                """Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
                BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
                Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
                !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
                Of course it does not help if all instruments have the values inside FT2 supported range.
                The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
                """
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.x = self._io.read_u2le()
                    self.y = self._io.read_u2le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint, self)._write__seq(io)
                    self._io.write_u2le(self.x)
                    self._io.write_u2le(self.y)


                def _check(self):
                    self._dirty = False



        class Header(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(FasttrackerXmModule.Instrument.Header, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(22), 0, False)).decode(u"UTF-8")
                self.type = self._io.read_u1()
                self.num_samples = self._io.read_u2le()
                if self.num_samples > 0:
                    pass
                    self.extra_header = FasttrackerXmModule.Instrument.ExtraHeader(self._io, self, self._root)
                    self.extra_header._read()

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.num_samples > 0:
                    pass
                    self.extra_header._fetch_instances()



            def _write__seq(self, io=None):
                super(FasttrackerXmModule.Instrument.Header, self)._write__seq(io)
                self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 22, 0, 0)
                self._io.write_u1(self.type)
                self._io.write_u2le(self.num_samples)
                if self.num_samples > 0:
                    pass
                    self.extra_header._write__seq(self._io)



            def _check(self):
                if len((self.name).encode(u"UTF-8")) > 22:
                    raise kaitaistruct.ConsistencyError(u"name", 22, len((self.name).encode(u"UTF-8")))
                if KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0))
                if self.num_samples > 0:
                    pass
                    if self.extra_header._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"extra_header", self._root, self.extra_header._root)
                    if self.extra_header._parent != self:
                        raise kaitaistruct.ConsistencyError(u"extra_header", self, self.extra_header._parent)

                self._dirty = False


        class SampleHeader(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(FasttrackerXmModule.Instrument.SampleHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.sample_length = self._io.read_u4le()
                self.sample_loop_start = self._io.read_u4le()
                self.sample_loop_length = self._io.read_u4le()
                self.volume = self._io.read_u1()
                self.fine_tune = self._io.read_s1()
                self.type = FasttrackerXmModule.Instrument.SampleHeader.LoopType(self._io, self, self._root)
                self.type._read()
                self.panning = self._io.read_u1()
                self.relative_note_number = self._io.read_s1()
                self.reserved = self._io.read_u1()
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(22), 0, False)).decode(u"UTF-8")
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.type._fetch_instances()


            def _write__seq(self, io=None):
                super(FasttrackerXmModule.Instrument.SampleHeader, self)._write__seq(io)
                self._io.write_u4le(self.sample_length)
                self._io.write_u4le(self.sample_loop_start)
                self._io.write_u4le(self.sample_loop_length)
                self._io.write_u1(self.volume)
                self._io.write_s1(self.fine_tune)
                self.type._write__seq(self._io)
                self._io.write_u1(self.panning)
                self._io.write_s1(self.relative_note_number)
                self._io.write_u1(self.reserved)
                self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 22, 0, 0)


            def _check(self):
                if self.type._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"type", self._root, self.type._root)
                if self.type._parent != self:
                    raise kaitaistruct.ConsistencyError(u"type", self, self.type._parent)
                if len((self.name).encode(u"UTF-8")) > 22:
                    raise kaitaistruct.ConsistencyError(u"name", 22, len((self.name).encode(u"UTF-8")))
                if KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0))
                self._dirty = False

            class LoopType(ReadWriteKaitaiStruct):

                class LoopType(IntEnum):
                    none = 0
                    forward = 1
                    ping_pong = 2
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(FasttrackerXmModule.Instrument.SampleHeader.LoopType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved0 = self._io.read_bits_int_be(3)
                    self.is_sample_data_16_bit = self._io.read_bits_int_be(1) != 0
                    self.reserved1 = self._io.read_bits_int_be(2)
                    self.loop_type = KaitaiStream.resolve_enum(FasttrackerXmModule.Instrument.SampleHeader.LoopType.LoopType, self._io.read_bits_int_be(2))
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(FasttrackerXmModule.Instrument.SampleHeader.LoopType, self)._write__seq(io)
                    self._io.write_bits_int_be(3, self.reserved0)
                    self._io.write_bits_int_be(1, int(self.is_sample_data_16_bit))
                    self._io.write_bits_int_be(2, self.reserved1)
                    self._io.write_bits_int_be(2, int(self.loop_type))


                def _check(self):
                    self._dirty = False



        class SamplesData(ReadWriteKaitaiStruct):
            """The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
            Pseudocode for converting the delta-coded data to normal data,
            old = 0;
            for i in range(data_len):
              new = sample[i] + old;
              sample[i] = new;
              old = new;
            """
            def __init__(self, header, _io=None, _parent=None, _root=None):
                super(FasttrackerXmModule.Instrument.SamplesData, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self.header = header

            def _read(self):
                self.data = self._io.read_bytes(self.header.sample_length * (2 if self.header.type.is_sample_data_16_bit else 1))
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(FasttrackerXmModule.Instrument.SamplesData, self)._write__seq(io)
                self._io.write_bytes(self.data)


            def _check(self):
                if len(self.data) != self.header.sample_length * (2 if self.header.type.is_sample_data_16_bit else 1):
                    raise kaitaistruct.ConsistencyError(u"data", self.header.sample_length * (2 if self.header.type.is_sample_data_16_bit else 1), len(self.data))
                self._dirty = False



    class Pattern(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FasttrackerXmModule.Pattern, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = FasttrackerXmModule.Pattern.Header(self._io, self, self._root)
            self.header._read()
            self.packed_data = self._io.read_bytes(self.header.main.len_packed_pattern)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()


        def _write__seq(self, io=None):
            super(FasttrackerXmModule.Pattern, self)._write__seq(io)
            self.header._write__seq(self._io)
            self._io.write_bytes(self.packed_data)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            if len(self.packed_data) != self.header.main.len_packed_pattern:
                raise kaitaistruct.ConsistencyError(u"packed_data", self.header.main.len_packed_pattern, len(self.packed_data))
            self._dirty = False

        class Header(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(FasttrackerXmModule.Pattern.Header, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.header_length = self._io.read_u4le()
                self._raw_main = self._io.read_bytes(self.header_length - 4)
                _io__raw_main = KaitaiStream(BytesIO(self._raw_main))
                self.main = FasttrackerXmModule.Pattern.Header.HeaderMain(_io__raw_main, self, self._root)
                self.main._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.main._fetch_instances()


            def _write__seq(self, io=None):
                super(FasttrackerXmModule.Pattern.Header, self)._write__seq(io)
                self._io.write_u4le(self.header_length)
                _io__raw_main = KaitaiStream(BytesIO(bytearray(self.header_length - 4)))
                self._io.add_child_stream(_io__raw_main)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header_length - 4))
                def handler(parent, _io__raw_main=_io__raw_main):
                    self._raw_main = _io__raw_main.to_byte_array()
                    if len(self._raw_main) != self.header_length - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(main)", self.header_length - 4, len(self._raw_main))
                    parent.write_bytes(self._raw_main)
                _io__raw_main.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.main._write__seq(_io__raw_main)


            def _check(self):
                if self.main._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"main", self._root, self.main._root)
                if self.main._parent != self:
                    raise kaitaistruct.ConsistencyError(u"main", self, self.main._parent)
                self._dirty = False

            class HeaderMain(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(FasttrackerXmModule.Pattern.Header.HeaderMain, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

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
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self._root.preheader.version_number.value
                    if _on == 258:
                        pass
                    else:
                        pass


                def _write__seq(self, io=None):
                    super(FasttrackerXmModule.Pattern.Header.HeaderMain, self)._write__seq(io)
                    self._io.write_u1(self.packing_type)
                    _on = self._root.preheader.version_number.value
                    if _on == 258:
                        pass
                        self._io.write_u1(self.num_rows_raw)
                    else:
                        pass
                        self._io.write_u2le(self.num_rows_raw)
                    self._io.write_u2le(self.len_packed_pattern)


                def _check(self):
                    _on = self._root.preheader.version_number.value
                    if _on == 258:
                        pass
                    else:
                        pass
                    self._dirty = False

                @property
                def num_rows(self):
                    if hasattr(self, '_m_num_rows'):
                        return self._m_num_rows

                    self._m_num_rows = self.num_rows_raw + (1 if self._root.preheader.version_number.value == 258 else 0)
                    return getattr(self, '_m_num_rows', None)

                def _invalidate_num_rows(self):
                    del self._m_num_rows



    class Preheader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FasttrackerXmModule.Preheader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self.version_number._read()
            self.header_size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version_number._fetch_instances()


        def _write__seq(self, io=None):
            super(FasttrackerXmModule.Preheader, self)._write__seq(io)
            self._io.write_bytes(self.signature0)
            self._io.write_bytes_limit((self.module_name).encode(u"UTF-8"), 20, 0, 0)
            self._io.write_bytes(self.signature1)
            self._io.write_bytes_limit((self.tracker_name).encode(u"UTF-8"), 20, 0, 0)
            self.version_number._write__seq(self._io)
            self._io.write_u4le(self.header_size)


        def _check(self):
            if len(self.signature0) != 17:
                raise kaitaistruct.ConsistencyError(u"signature0", 17, len(self.signature0))
            if not self.signature0 == b"\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20":
                raise kaitaistruct.ValidationNotEqualError(b"\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20", self.signature0, None, u"/types/preheader/seq/0")
            if len((self.module_name).encode(u"UTF-8")) > 20:
                raise kaitaistruct.ConsistencyError(u"module_name", 20, len((self.module_name).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.module_name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"module_name", -1, KaitaiStream.byte_array_index_of((self.module_name).encode(u"UTF-8"), 0))
            if len(self.signature1) != 1:
                raise kaitaistruct.ConsistencyError(u"signature1", 1, len(self.signature1))
            if not self.signature1 == b"\x1A":
                raise kaitaistruct.ValidationNotEqualError(b"\x1A", self.signature1, None, u"/types/preheader/seq/2")
            if len((self.tracker_name).encode(u"UTF-8")) > 20:
                raise kaitaistruct.ConsistencyError(u"tracker_name", 20, len((self.tracker_name).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.tracker_name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"tracker_name", -1, KaitaiStream.byte_array_index_of((self.tracker_name).encode(u"UTF-8"), 0))
            if self.version_number._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version_number", self._root, self.version_number._root)
            if self.version_number._parent != self:
                raise kaitaistruct.ConsistencyError(u"version_number", self, self.version_number._parent)
            self._dirty = False

        class Version(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(FasttrackerXmModule.Preheader.Version, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.minor = self._io.read_u1()
                self.major = self._io.read_u1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(FasttrackerXmModule.Preheader.Version, self)._write__seq(io)
                self._io.write_u1(self.minor)
                self._io.write_u1(self.major)


            def _check(self):
                self._dirty = False

            @property
            def value(self):
                if hasattr(self, '_m_value'):
                    return self._m_value

                self._m_value = self.major << 8 | self.minor
                return getattr(self, '_m_value', None)

            def _invalidate_value(self):
                del self._m_value



