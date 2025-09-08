# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class S3m(ReadWriteKaitaiStruct):
    """Scream Tracker 3 module is a tracker music file format that, as all
    tracker music, bundles both sound samples and instructions on which
    notes to play. It originates from a Scream Tracker 3 music editor
    (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
    module format.
    
    Instrument descriptions in S3M format allow to use either digital
    samples or setup and control AdLib (OPL2) synth.
    
    Music is organized in so called `patterns`. "Pattern" is a generally
    a 64-row long table, which instructs which notes to play on which
    time measure. "Patterns" are played one-by-one in a sequence
    determined by `orders`, which is essentially an array of pattern IDs
    - this way it's possible to reuse certain patterns more than once
    for repetitive musical phrases.
    
    .. seealso::
       Source - http://hackipedia.org/browse.cgi/File%20formats/Music%20tracker/S3M%2c%20ScreamTracker%203/Scream%20Tracker%203.20%20by%20Future%20Crew.txt
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(S3m, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.song_name = KaitaiStream.bytes_terminate(self._io.read_bytes(28), 0, False)
        self.magic1 = self._io.read_bytes(1)
        if not self.magic1 == b"\x1A":
            raise kaitaistruct.ValidationNotEqualError(b"\x1A", self.magic1, self._io, u"/seq/1")
        self.file_type = self._io.read_u1()
        self.reserved1 = self._io.read_bytes(2)
        self.num_orders = self._io.read_u2le()
        self.num_instruments = self._io.read_u2le()
        self.num_patterns = self._io.read_u2le()
        self.flags = self._io.read_u2le()
        self.version = self._io.read_u2le()
        self.samples_format = self._io.read_u2le()
        self.magic2 = self._io.read_bytes(4)
        if not self.magic2 == b"\x53\x43\x52\x4D":
            raise kaitaistruct.ValidationNotEqualError(b"\x53\x43\x52\x4D", self.magic2, self._io, u"/seq/10")
        self.global_volume = self._io.read_u1()
        self.initial_speed = self._io.read_u1()
        self.initial_tempo = self._io.read_u1()
        self.is_stereo = self._io.read_bits_int_be(1) != 0
        self.master_volume = self._io.read_bits_int_be(7)
        self.ultra_click_removal = self._io.read_u1()
        self.has_custom_pan = self._io.read_u1()
        self.reserved2 = self._io.read_bytes(8)
        self.ofs_special = self._io.read_u2le()
        self.channels = []
        for i in range(32):
            _t_channels = S3m.Channel(self._io, self, self._root)
            try:
                _t_channels._read()
            finally:
                self.channels.append(_t_channels)

        self.orders = self._io.read_bytes(self.num_orders)
        self.instruments = []
        for i in range(self.num_instruments):
            _t_instruments = S3m.InstrumentPtr(self._io, self, self._root)
            try:
                _t_instruments._read()
            finally:
                self.instruments.append(_t_instruments)

        self.patterns = []
        for i in range(self.num_patterns):
            _t_patterns = S3m.PatternPtr(self._io, self, self._root)
            try:
                _t_patterns._read()
            finally:
                self.patterns.append(_t_patterns)

        if self.has_custom_pan == 252:
            pass
            self.channel_pans = []
            for i in range(32):
                _t_channel_pans = S3m.ChannelPan(self._io, self, self._root)
                try:
                    _t_channel_pans._read()
                finally:
                    self.channel_pans.append(_t_channel_pans)


        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.channels)):
            pass
            self.channels[i]._fetch_instances()

        for i in range(len(self.instruments)):
            pass
            self.instruments[i]._fetch_instances()

        for i in range(len(self.patterns)):
            pass
            self.patterns[i]._fetch_instances()

        if self.has_custom_pan == 252:
            pass
            for i in range(len(self.channel_pans)):
                pass
                self.channel_pans[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(S3m, self)._write__seq(io)
        self._io.write_bytes_limit(self.song_name, 28, 0, 0)
        self._io.write_bytes(self.magic1)
        self._io.write_u1(self.file_type)
        self._io.write_bytes(self.reserved1)
        self._io.write_u2le(self.num_orders)
        self._io.write_u2le(self.num_instruments)
        self._io.write_u2le(self.num_patterns)
        self._io.write_u2le(self.flags)
        self._io.write_u2le(self.version)
        self._io.write_u2le(self.samples_format)
        self._io.write_bytes(self.magic2)
        self._io.write_u1(self.global_volume)
        self._io.write_u1(self.initial_speed)
        self._io.write_u1(self.initial_tempo)
        self._io.write_bits_int_be(1, int(self.is_stereo))
        self._io.write_bits_int_be(7, self.master_volume)
        self._io.write_u1(self.ultra_click_removal)
        self._io.write_u1(self.has_custom_pan)
        self._io.write_bytes(self.reserved2)
        self._io.write_u2le(self.ofs_special)
        for i in range(len(self.channels)):
            pass
            self.channels[i]._write__seq(self._io)

        self._io.write_bytes(self.orders)
        for i in range(len(self.instruments)):
            pass
            self.instruments[i]._write__seq(self._io)

        for i in range(len(self.patterns)):
            pass
            self.patterns[i]._write__seq(self._io)

        if self.has_custom_pan == 252:
            pass
            for i in range(len(self.channel_pans)):
                pass
                self.channel_pans[i]._write__seq(self._io)




    def _check(self):
        if len(self.song_name) > 28:
            raise kaitaistruct.ConsistencyError(u"song_name", 28, len(self.song_name))
        if KaitaiStream.byte_array_index_of(self.song_name, 0) != -1:
            raise kaitaistruct.ConsistencyError(u"song_name", -1, KaitaiStream.byte_array_index_of(self.song_name, 0))
        if len(self.magic1) != 1:
            raise kaitaistruct.ConsistencyError(u"magic1", 1, len(self.magic1))
        if not self.magic1 == b"\x1A":
            raise kaitaistruct.ValidationNotEqualError(b"\x1A", self.magic1, None, u"/seq/1")
        if len(self.reserved1) != 2:
            raise kaitaistruct.ConsistencyError(u"reserved1", 2, len(self.reserved1))
        if len(self.magic2) != 4:
            raise kaitaistruct.ConsistencyError(u"magic2", 4, len(self.magic2))
        if not self.magic2 == b"\x53\x43\x52\x4D":
            raise kaitaistruct.ValidationNotEqualError(b"\x53\x43\x52\x4D", self.magic2, None, u"/seq/10")
        if len(self.reserved2) != 8:
            raise kaitaistruct.ConsistencyError(u"reserved2", 8, len(self.reserved2))
        if len(self.channels) != 32:
            raise kaitaistruct.ConsistencyError(u"channels", 32, len(self.channels))
        for i in range(len(self.channels)):
            pass
            if self.channels[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"channels", self._root, self.channels[i]._root)
            if self.channels[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"channels", self, self.channels[i]._parent)

        if len(self.orders) != self.num_orders:
            raise kaitaistruct.ConsistencyError(u"orders", self.num_orders, len(self.orders))
        if len(self.instruments) != self.num_instruments:
            raise kaitaistruct.ConsistencyError(u"instruments", self.num_instruments, len(self.instruments))
        for i in range(len(self.instruments)):
            pass
            if self.instruments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"instruments", self._root, self.instruments[i]._root)
            if self.instruments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"instruments", self, self.instruments[i]._parent)

        if len(self.patterns) != self.num_patterns:
            raise kaitaistruct.ConsistencyError(u"patterns", self.num_patterns, len(self.patterns))
        for i in range(len(self.patterns)):
            pass
            if self.patterns[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"patterns", self._root, self.patterns[i]._root)
            if self.patterns[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"patterns", self, self.patterns[i]._parent)

        if self.has_custom_pan == 252:
            pass
            if len(self.channel_pans) != 32:
                raise kaitaistruct.ConsistencyError(u"channel_pans", 32, len(self.channel_pans))
            for i in range(len(self.channel_pans)):
                pass
                if self.channel_pans[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"channel_pans", self._root, self.channel_pans[i]._root)
                if self.channel_pans[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"channel_pans", self, self.channel_pans[i]._parent)


        self._dirty = False

    class Channel(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.Channel, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.is_disabled = self._io.read_bits_int_be(1) != 0
            self.ch_type = self._io.read_bits_int_be(7)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(S3m.Channel, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.is_disabled))
            self._io.write_bits_int_be(7, self.ch_type)


        def _check(self):
            self._dirty = False


    class ChannelPan(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.ChannelPan, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved1 = self._io.read_bits_int_be(2)
            self.has_custom_pan = self._io.read_bits_int_be(1) != 0
            self.reserved2 = self._io.read_bits_int_be(1) != 0
            self.pan = self._io.read_bits_int_be(4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(S3m.ChannelPan, self)._write__seq(io)
            self._io.write_bits_int_be(2, self.reserved1)
            self._io.write_bits_int_be(1, int(self.has_custom_pan))
            self._io.write_bits_int_be(1, int(self.reserved2))
            self._io.write_bits_int_be(4, self.pan)


        def _check(self):
            self._dirty = False


    class Instrument(ReadWriteKaitaiStruct):

        class InstTypes(IntEnum):
            sample = 1
            melodic = 2
            bass_drum = 3
            snare_drum = 4
            tom = 5
            cymbal = 6
            hihat = 7
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.Instrument, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = KaitaiStream.resolve_enum(S3m.Instrument.InstTypes, self._io.read_u1())
            self.filename = KaitaiStream.bytes_terminate(self._io.read_bytes(12), 0, False)
            _on = self.type
            if _on == S3m.Instrument.InstTypes.sample:
                pass
                self.body = S3m.Instrument.Sampled(self._io, self, self._root)
                self.body._read()
            else:
                pass
                self.body = S3m.Instrument.Adlib(self._io, self, self._root)
                self.body._read()
            self.tuning_hz = self._io.read_u4le()
            self.reserved2 = self._io.read_bytes(12)
            self.sample_name = KaitaiStream.bytes_terminate(self._io.read_bytes(28), 0, False)
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x53\x43\x52\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x43\x52\x53", self.magic, self._io, u"/types/instrument/seq/6")
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == S3m.Instrument.InstTypes.sample:
                pass
                self.body._fetch_instances()
            else:
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(S3m.Instrument, self)._write__seq(io)
            self._io.write_u1(int(self.type))
            self._io.write_bytes_limit(self.filename, 12, 0, 0)
            _on = self.type
            if _on == S3m.Instrument.InstTypes.sample:
                pass
                self.body._write__seq(self._io)
            else:
                pass
                self.body._write__seq(self._io)
            self._io.write_u4le(self.tuning_hz)
            self._io.write_bytes(self.reserved2)
            self._io.write_bytes_limit(self.sample_name, 28, 0, 0)
            self._io.write_bytes(self.magic)


        def _check(self):
            if len(self.filename) > 12:
                raise kaitaistruct.ConsistencyError(u"filename", 12, len(self.filename))
            if KaitaiStream.byte_array_index_of(self.filename, 0) != -1:
                raise kaitaistruct.ConsistencyError(u"filename", -1, KaitaiStream.byte_array_index_of(self.filename, 0))
            _on = self.type
            if _on == S3m.Instrument.InstTypes.sample:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            if len(self.reserved2) != 12:
                raise kaitaistruct.ConsistencyError(u"reserved2", 12, len(self.reserved2))
            if len(self.sample_name) > 28:
                raise kaitaistruct.ConsistencyError(u"sample_name", 28, len(self.sample_name))
            if KaitaiStream.byte_array_index_of(self.sample_name, 0) != -1:
                raise kaitaistruct.ConsistencyError(u"sample_name", -1, KaitaiStream.byte_array_index_of(self.sample_name, 0))
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x53\x43\x52\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x43\x52\x53", self.magic, None, u"/types/instrument/seq/6")
            self._dirty = False

        class Adlib(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(S3m.Instrument.Adlib, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved1 = self._io.read_bytes(3)
                if not self.reserved1 == b"\x00\x00\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00", self.reserved1, self._io, u"/types/instrument/types/adlib/seq/0")
                self._unnamed1 = self._io.read_bytes(16)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(S3m.Instrument.Adlib, self)._write__seq(io)
                self._io.write_bytes(self.reserved1)
                self._io.write_bytes(self._unnamed1)


            def _check(self):
                if len(self.reserved1) != 3:
                    raise kaitaistruct.ConsistencyError(u"reserved1", 3, len(self.reserved1))
                if not self.reserved1 == b"\x00\x00\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00", self.reserved1, None, u"/types/instrument/types/adlib/seq/0")
                if len(self._unnamed1) != 16:
                    raise kaitaistruct.ConsistencyError(u"_unnamed1", 16, len(self._unnamed1))
                self._dirty = False


        class Sampled(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(S3m.Instrument.Sampled, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_sample = False
                self.sample__enabled = True

            def _read(self):
                self.paraptr_sample = S3m.SwappedU3(self._io, self, self._root)
                self.paraptr_sample._read()
                self.len_sample = self._io.read_u4le()
                self.loop_begin = self._io.read_u4le()
                self.loop_end = self._io.read_u4le()
                self.default_volume = self._io.read_u1()
                self.reserved1 = self._io.read_u1()
                self.is_packed = self._io.read_u1()
                self.flags = self._io.read_u1()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.paraptr_sample._fetch_instances()
                _ = self.sample
                if hasattr(self, '_m_sample'):
                    pass



            def _write__seq(self, io=None):
                super(S3m.Instrument.Sampled, self)._write__seq(io)
                self._should_write_sample = self.sample__enabled
                self.paraptr_sample._write__seq(self._io)
                self._io.write_u4le(self.len_sample)
                self._io.write_u4le(self.loop_begin)
                self._io.write_u4le(self.loop_end)
                self._io.write_u1(self.default_volume)
                self._io.write_u1(self.reserved1)
                self._io.write_u1(self.is_packed)
                self._io.write_u1(self.flags)


            def _check(self):
                if self.paraptr_sample._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"paraptr_sample", self._root, self.paraptr_sample._root)
                if self.paraptr_sample._parent != self:
                    raise kaitaistruct.ConsistencyError(u"paraptr_sample", self, self.paraptr_sample._parent)
                if self.sample__enabled:
                    pass
                    if len(self._m_sample) != self.len_sample:
                        raise kaitaistruct.ConsistencyError(u"sample", self.len_sample, len(self._m_sample))

                self._dirty = False

            @property
            def sample(self):
                if self._should_write_sample:
                    self._write_sample()
                if hasattr(self, '_m_sample'):
                    return self._m_sample

                if not self.sample__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self.paraptr_sample.value * 16)
                self._m_sample = self._io.read_bytes(self.len_sample)
                self._io.seek(_pos)
                return getattr(self, '_m_sample', None)

            @sample.setter
            def sample(self, v):
                self._dirty = True
                self._m_sample = v

            def _write_sample(self):
                self._should_write_sample = False
                _pos = self._io.pos()
                self._io.seek(self.paraptr_sample.value * 16)
                self._io.write_bytes(self._m_sample)
                self._io.seek(_pos)



    class InstrumentPtr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.InstrumentPtr, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.paraptr = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                self._m_body._fetch_instances()



        def _write__seq(self, io=None):
            super(S3m.InstrumentPtr, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u2le(self.paraptr)


        def _check(self):
            if self.body__enabled:
                pass
                if self._m_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                if self._m_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)

            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.paraptr * 16)
            self._m_body = S3m.Instrument(self._io, self, self._root)
            self._m_body._read()
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            _pos = self._io.pos()
            self._io.seek(self.paraptr * 16)
            self._m_body._write__seq(self._io)
            self._io.seek(_pos)


    class Pattern(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.Pattern, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u2le()
            self._raw_body = self._io.read_bytes(self.size - 2)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = S3m.PatternCells(_io__raw_body, self, self._root)
            self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(S3m.Pattern, self)._write__seq(io)
            self._io.write_u2le(self.size)
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size - 2)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size - 2))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.size - 2:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.size - 2, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)


        def _check(self):
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False


    class PatternCell(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.PatternCell, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.has_fx = self._io.read_bits_int_be(1) != 0
            self.has_volume = self._io.read_bits_int_be(1) != 0
            self.has_note_and_instrument = self._io.read_bits_int_be(1) != 0
            self.channel_num = self._io.read_bits_int_be(5)
            if self.has_note_and_instrument:
                pass
                self.note = self._io.read_u1()

            if self.has_note_and_instrument:
                pass
                self.instrument = self._io.read_u1()

            if self.has_volume:
                pass
                self.volume = self._io.read_u1()

            if self.has_fx:
                pass
                self.fx_type = self._io.read_u1()

            if self.has_fx:
                pass
                self.fx_value = self._io.read_u1()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_note_and_instrument:
                pass

            if self.has_note_and_instrument:
                pass

            if self.has_volume:
                pass

            if self.has_fx:
                pass

            if self.has_fx:
                pass



        def _write__seq(self, io=None):
            super(S3m.PatternCell, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.has_fx))
            self._io.write_bits_int_be(1, int(self.has_volume))
            self._io.write_bits_int_be(1, int(self.has_note_and_instrument))
            self._io.write_bits_int_be(5, self.channel_num)
            if self.has_note_and_instrument:
                pass
                self._io.write_u1(self.note)

            if self.has_note_and_instrument:
                pass
                self._io.write_u1(self.instrument)

            if self.has_volume:
                pass
                self._io.write_u1(self.volume)

            if self.has_fx:
                pass
                self._io.write_u1(self.fx_type)

            if self.has_fx:
                pass
                self._io.write_u1(self.fx_value)



        def _check(self):
            if self.has_note_and_instrument:
                pass

            if self.has_note_and_instrument:
                pass

            if self.has_volume:
                pass

            if self.has_fx:
                pass

            if self.has_fx:
                pass

            self._dirty = False


    class PatternCells(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.PatternCells, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.cells = []
            i = 0
            while not self._io.is_eof():
                _t_cells = S3m.PatternCell(self._io, self, self._root)
                try:
                    _t_cells._read()
                finally:
                    self.cells.append(_t_cells)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.cells)):
                pass
                self.cells[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(S3m.PatternCells, self)._write__seq(io)
            for i in range(len(self.cells)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"cells", 0, self._io.size() - self._io.pos())
                self.cells[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"cells", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.cells)):
                pass
                if self.cells[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"cells", self._root, self.cells[i]._root)
                if self.cells[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"cells", self, self.cells[i]._parent)

            self._dirty = False


    class PatternPtr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.PatternPtr, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.paraptr = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                self._m_body._fetch_instances()



        def _write__seq(self, io=None):
            super(S3m.PatternPtr, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u2le(self.paraptr)


        def _check(self):
            if self.body__enabled:
                pass
                if self._m_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                if self._m_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)

            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.paraptr * 16)
            self._m_body = S3m.Pattern(self._io, self, self._root)
            self._m_body._read()
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            _pos = self._io.pos()
            self._io.seek(self.paraptr * 16)
            self._m_body._write__seq(self._io)
            self._io.seek(_pos)


    class SwappedU3(ReadWriteKaitaiStruct):
        """Custom 3-byte integer, stored in mixed endian manner."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(S3m.SwappedU3, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.hi = self._io.read_u1()
            self.lo = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(S3m.SwappedU3, self)._write__seq(io)
            self._io.write_u1(self.hi)
            self._io.write_u2le(self.lo)


        def _check(self):
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.lo | self.hi << 16
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value


