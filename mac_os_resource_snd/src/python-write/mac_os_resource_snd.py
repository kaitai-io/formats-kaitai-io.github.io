# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MacOsResourceSnd(ReadWriteKaitaiStruct):
    """Sound resources were introduced in Classic MacOS with the Sound Manager program.
    They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
    They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
    
    .. seealso::
       Source - https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf
    """

    class CmdType(IntEnum):
        null_cmd = 0
        quiet_cmd = 3
        flush_cmd = 4
        re_init_cmd = 5
        wait_cmd = 10
        pause_cmd = 11
        resume_cmd = 12
        call_back_cmd = 13
        sync_cmd = 14
        empty_cmd = 15
        available_cmd = 24
        version_cmd = 25
        total_load_cmd = 26
        load_cmd = 27
        freq_duration_cmd = 40
        rest_cmd = 41
        freq_cmd = 42
        amp_cmd = 43
        timbre_cmd = 44
        get_amp_cmd = 45
        volume_cmd = 46
        get_volume_cmd = 47
        wave_table_cmd = 60
        phase_cmd = 61
        sound_cmd = 80
        buffer_cmd = 81
        rate_cmd = 82
        get_rate_cmd = 85

    class CompressionTypeEnum(IntEnum):
        variable_compression = -2
        fixed_compression = -1
        not_compressed = 0
        two_to_one = 1
        eight_to_three = 2
        three_to_one = 3
        six_to_one = 4

    class DataType(IntEnum):
        square_wave_synth = 1
        wave_table_synth = 3
        sampled_synth = 5

    class InitOption(IntEnum):
        chan_left = 2
        chan_right = 3
        no_interp = 4
        no_drop = 8
        mono = 128
        stereo = 192
        mace3 = 768
        mace6 = 1024

    class SoundHeaderType(IntEnum):
        standard = 0
        compressed = 254
        extended = 255

    class WaveInitOption(IntEnum):
        channel0 = 4
        channel1 = 5
        channel2 = 6
        channel3 = 7
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MacOsResourceSnd, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.format = self._io.read_u2be()
        if self.format == 1:
            pass
            self.num_data_formats = self._io.read_u2be()

        if self.format == 1:
            pass
            self.data_formats = []
            for i in range(self.num_data_formats):
                _t_data_formats = MacOsResourceSnd.DataFormat(self._io, self, self._root)
                try:
                    _t_data_formats._read()
                finally:
                    self.data_formats.append(_t_data_formats)


        if self.format == 2:
            pass
            self.reference_count = self._io.read_u2be()

        self.num_sound_commands = self._io.read_u2be()
        self.sound_commands = []
        for i in range(self.num_sound_commands):
            _t_sound_commands = MacOsResourceSnd.SoundCommand(self._io, self, self._root)
            try:
                _t_sound_commands._read()
            finally:
                self.sound_commands.append(_t_sound_commands)

        self._dirty = False


    def _fetch_instances(self):
        pass
        if self.format == 1:
            pass

        if self.format == 1:
            pass
            for i in range(len(self.data_formats)):
                pass
                self.data_formats[i]._fetch_instances()


        if self.format == 2:
            pass

        for i in range(len(self.sound_commands)):
            pass
            self.sound_commands[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(MacOsResourceSnd, self)._write__seq(io)
        self._io.write_u2be(self.format)
        if self.format == 1:
            pass
            self._io.write_u2be(self.num_data_formats)

        if self.format == 1:
            pass
            for i in range(len(self.data_formats)):
                pass
                self.data_formats[i]._write__seq(self._io)


        if self.format == 2:
            pass
            self._io.write_u2be(self.reference_count)

        self._io.write_u2be(self.num_sound_commands)
        for i in range(len(self.sound_commands)):
            pass
            self.sound_commands[i]._write__seq(self._io)



    def _check(self):
        if self.format == 1:
            pass

        if self.format == 1:
            pass
            if len(self.data_formats) != self.num_data_formats:
                raise kaitaistruct.ConsistencyError(u"data_formats", self.num_data_formats, len(self.data_formats))
            for i in range(len(self.data_formats)):
                pass
                if self.data_formats[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data_formats", self._root, self.data_formats[i]._root)
                if self.data_formats[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data_formats", self, self.data_formats[i]._parent)


        if self.format == 2:
            pass

        if len(self.sound_commands) != self.num_sound_commands:
            raise kaitaistruct.ConsistencyError(u"sound_commands", self.num_sound_commands, len(self.sound_commands))
        for i in range(len(self.sound_commands)):
            pass
            if self.sound_commands[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"sound_commands", self._root, self.sound_commands[i]._root)
            if self.sound_commands[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"sound_commands", self, self.sound_commands[i]._parent)

        self._dirty = False

    class Compressed(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MacOsResourceSnd.Compressed, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.format = (self._io.read_bytes(4)).decode(u"ASCII")
            self.reserved = self._io.read_bytes(4)
            self.state_vars_ptr = self._io.read_u4be()
            self.left_over_samples_ptr = self._io.read_u4be()
            self.compression_id = self._io.read_s2be()
            self.packet_size = self._io.read_u2be()
            self.synthesizer_id = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MacOsResourceSnd.Compressed, self)._write__seq(io)
            self._io.write_bytes((self.format).encode(u"ASCII"))
            self._io.write_bytes(self.reserved)
            self._io.write_u4be(self.state_vars_ptr)
            self._io.write_u4be(self.left_over_samples_ptr)
            self._io.write_s2be(self.compression_id)
            self._io.write_u2be(self.packet_size)
            self._io.write_u2be(self.synthesizer_id)


        def _check(self):
            if len((self.format).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"format", 4, len((self.format).encode(u"ASCII")))
            if len(self.reserved) != 4:
                raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
            self._dirty = False

        @property
        def compression_type(self):
            if hasattr(self, '_m_compression_type'):
                return self._m_compression_type

            self._m_compression_type = KaitaiStream.resolve_enum(MacOsResourceSnd.CompressionTypeEnum, self.compression_id)
            return getattr(self, '_m_compression_type', None)

        def _invalidate_compression_type(self):
            del self._m_compression_type

    class DataFormat(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MacOsResourceSnd.DataFormat, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = KaitaiStream.resolve_enum(MacOsResourceSnd.DataType, self._io.read_u2be())
            self.options = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MacOsResourceSnd.DataFormat, self)._write__seq(io)
            self._io.write_u2be(int(self.id))
            self._io.write_u4be(self.options)


        def _check(self):
            self._dirty = False

        @property
        def comp_init(self):
            if hasattr(self, '_m_comp_init'):
                return self._m_comp_init

            self._m_comp_init = KaitaiStream.resolve_enum(MacOsResourceSnd.InitOption, self.options & self.init_comp_mask)
            return getattr(self, '_m_comp_init', None)

        def _invalidate_comp_init(self):
            del self._m_comp_init
        @property
        def init_comp_mask(self):
            """mask for compression IDs."""
            if hasattr(self, '_m_init_comp_mask'):
                return self._m_init_comp_mask

            self._m_init_comp_mask = 65280
            return getattr(self, '_m_init_comp_mask', None)

        def _invalidate_init_comp_mask(self):
            del self._m_init_comp_mask
        @property
        def init_pan_mask(self):
            """mask for right/left pan values."""
            if hasattr(self, '_m_init_pan_mask'):
                return self._m_init_pan_mask

            self._m_init_pan_mask = 3
            return getattr(self, '_m_init_pan_mask', None)

        def _invalidate_init_pan_mask(self):
            del self._m_init_pan_mask
        @property
        def init_stereo_mask(self):
            """mask for mono/stereo values."""
            if hasattr(self, '_m_init_stereo_mask'):
                return self._m_init_stereo_mask

            self._m_init_stereo_mask = 192
            return getattr(self, '_m_init_stereo_mask', None)

        def _invalidate_init_stereo_mask(self):
            del self._m_init_stereo_mask
        @property
        def pan_init(self):
            if hasattr(self, '_m_pan_init'):
                return self._m_pan_init

            self._m_pan_init = KaitaiStream.resolve_enum(MacOsResourceSnd.InitOption, self.options & self.init_pan_mask)
            return getattr(self, '_m_pan_init', None)

        def _invalidate_pan_init(self):
            del self._m_pan_init
        @property
        def stereo_init(self):
            if hasattr(self, '_m_stereo_init'):
                return self._m_stereo_init

            self._m_stereo_init = KaitaiStream.resolve_enum(MacOsResourceSnd.InitOption, self.options & self.init_stereo_mask)
            return getattr(self, '_m_stereo_init', None)

        def _invalidate_stereo_init(self):
            del self._m_stereo_init
        @property
        def wave_init(self):
            if hasattr(self, '_m_wave_init'):
                return self._m_wave_init

            if self.id == MacOsResourceSnd.DataType.wave_table_synth:
                pass
                self._m_wave_init = KaitaiStream.resolve_enum(MacOsResourceSnd.WaveInitOption, self.options & self.wave_init_channel_mask)

            return getattr(self, '_m_wave_init', None)

        def _invalidate_wave_init(self):
            del self._m_wave_init
        @property
        def wave_init_channel_mask(self):
            """wave table only, Sound Manager 2.0 and earlier."""
            if hasattr(self, '_m_wave_init_channel_mask'):
                return self._m_wave_init_channel_mask

            self._m_wave_init_channel_mask = 7
            return getattr(self, '_m_wave_init_channel_mask', None)

        def _invalidate_wave_init_channel_mask(self):
            del self._m_wave_init_channel_mask

    class Extended(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MacOsResourceSnd.Extended, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.instrument_chunk_ptr = self._io.read_u4be()
            self.aes_recording_ptr = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MacOsResourceSnd.Extended, self)._write__seq(io)
            self._io.write_u4be(self.instrument_chunk_ptr)
            self._io.write_u4be(self.aes_recording_ptr)


        def _check(self):
            self._dirty = False


    class ExtendedOrCompressed(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MacOsResourceSnd.ExtendedOrCompressed, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_frames = self._io.read_u4be()
            self.aiff_sample_rate = self._io.read_bytes(10)
            self.marker_chunk = self._io.read_u4be()
            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended:
                pass
                self.extended = MacOsResourceSnd.Extended(self._io, self, self._root)
                self.extended._read()

            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed:
                pass
                self.compressed = MacOsResourceSnd.Compressed(self._io, self, self._root)
                self.compressed._read()

            self.bits_per_sample = self._io.read_u2be()
            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended:
                pass
                self.reserved = self._io.read_bytes(14)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended:
                pass
                self.extended._fetch_instances()

            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed:
                pass
                self.compressed._fetch_instances()

            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended:
                pass



        def _write__seq(self, io=None):
            super(MacOsResourceSnd.ExtendedOrCompressed, self)._write__seq(io)
            self._io.write_u4be(self.num_frames)
            self._io.write_bytes(self.aiff_sample_rate)
            self._io.write_u4be(self.marker_chunk)
            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended:
                pass
                self.extended._write__seq(self._io)

            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed:
                pass
                self.compressed._write__seq(self._io)

            self._io.write_u2be(self.bits_per_sample)
            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended:
                pass
                self._io.write_bytes(self.reserved)



        def _check(self):
            if len(self.aiff_sample_rate) != 10:
                raise kaitaistruct.ConsistencyError(u"aiff_sample_rate", 10, len(self.aiff_sample_rate))
            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended:
                pass
                if self.extended._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"extended", self._root, self.extended._root)
                if self.extended._parent != self:
                    raise kaitaistruct.ConsistencyError(u"extended", self, self.extended._parent)

            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed:
                pass
                if self.compressed._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"compressed", self._root, self.compressed._root)
                if self.compressed._parent != self:
                    raise kaitaistruct.ConsistencyError(u"compressed", self, self.compressed._parent)

            if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended:
                pass
                if len(self.reserved) != 14:
                    raise kaitaistruct.ConsistencyError(u"reserved", 14, len(self.reserved))

            self._dirty = False


    class SoundCommand(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MacOsResourceSnd.SoundCommand, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_sound_header = False
            self.sound_header__enabled = True

        def _read(self):
            self.is_data_offset = self._io.read_bits_int_be(1) != 0
            self.cmd = KaitaiStream.resolve_enum(MacOsResourceSnd.CmdType, self._io.read_bits_int_be(15))
            self.param1 = self._io.read_u2be()
            self.param2 = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.sound_header
            if hasattr(self, '_m_sound_header'):
                pass
                self._m_sound_header._fetch_instances()



        def _write__seq(self, io=None):
            super(MacOsResourceSnd.SoundCommand, self)._write__seq(io)
            self._should_write_sound_header = self.sound_header__enabled
            self._io.write_bits_int_be(1, int(self.is_data_offset))
            self._io.write_bits_int_be(15, int(self.cmd))
            self._io.write_u2be(self.param1)
            self._io.write_u4be(self.param2)


        def _check(self):
            if self.sound_header__enabled:
                pass
                if  ((self.is_data_offset) and (self.cmd == MacOsResourceSnd.CmdType.buffer_cmd)) :
                    pass
                    if self._m_sound_header._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"sound_header", self._root, self._m_sound_header._root)
                    if self._m_sound_header._parent != self:
                        raise kaitaistruct.ConsistencyError(u"sound_header", self, self._m_sound_header._parent)


            self._dirty = False

        @property
        def sound_header(self):
            if self._should_write_sound_header:
                self._write_sound_header()
            if hasattr(self, '_m_sound_header'):
                return self._m_sound_header

            if not self.sound_header__enabled:
                return None

            if  ((self.is_data_offset) and (self.cmd == MacOsResourceSnd.CmdType.buffer_cmd)) :
                pass
                _pos = self._io.pos()
                self._io.seek(self.param2)
                self._m_sound_header = MacOsResourceSnd.SoundHeader(self._io, self, self._root)
                self._m_sound_header._read()
                self._io.seek(_pos)

            return getattr(self, '_m_sound_header', None)

        @sound_header.setter
        def sound_header(self, v):
            self._dirty = True
            self._m_sound_header = v

        def _write_sound_header(self):
            self._should_write_sound_header = False
            if  ((self.is_data_offset) and (self.cmd == MacOsResourceSnd.CmdType.buffer_cmd)) :
                pass
                _pos = self._io.pos()
                self._io.seek(self.param2)
                self._m_sound_header._write__seq(self._io)
                self._io.seek(_pos)



    class SoundHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MacOsResourceSnd.SoundHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_sound_header_type = False
            self.sound_header_type__enabled = True

        def _read(self):
            if self.start_ofs < 0:
                pass
                self._unnamed0 = self._io.read_bytes(0)

            self.sample_ptr = self._io.read_u4be()
            if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.standard:
                pass
                self.num_samples = self._io.read_u4be()

            if  ((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) or (self.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed)) :
                pass
                self.num_channels = self._io.read_u4be()

            self.sample_rate = MacOsResourceSnd.UnsignedFixedPoint(self._io, self, self._root)
            self.sample_rate._read()
            self.loop_start = self._io.read_u4be()
            self.loop_end = self._io.read_u4be()
            self.encode = KaitaiStream.resolve_enum(MacOsResourceSnd.SoundHeaderType, self._io.read_u1())
            self.midi_note = self._io.read_u1()
            if  ((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) or (self.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed)) :
                pass
                self.extended_or_compressed = MacOsResourceSnd.ExtendedOrCompressed(self._io, self, self._root)
                self.extended_or_compressed._read()

            if self.sample_ptr == 0:
                pass
                self.sample_area = self._io.read_bytes((self.num_samples if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.standard else (((self.extended_or_compressed.num_frames * self.num_channels) * self.extended_or_compressed.bits_per_sample) // 8 if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended else self._io.size() - self._io.pos())))

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.start_ofs < 0:
                pass

            if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.standard:
                pass

            if  ((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) or (self.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed)) :
                pass

            self.sample_rate._fetch_instances()
            if  ((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) or (self.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed)) :
                pass
                self.extended_or_compressed._fetch_instances()

            if self.sample_ptr == 0:
                pass

            _ = self.sound_header_type
            if hasattr(self, '_m_sound_header_type'):
                pass



        def _write__seq(self, io=None):
            super(MacOsResourceSnd.SoundHeader, self)._write__seq(io)
            self._should_write_sound_header_type = self.sound_header_type__enabled
            if self.start_ofs < 0:
                pass
                if len(self._unnamed0) != 0:
                    raise kaitaistruct.ConsistencyError(u"_unnamed0", 0, len(self._unnamed0))
                self._io.write_bytes(self._unnamed0)

            self._io.write_u4be(self.sample_ptr)
            if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.standard:
                pass
                self._io.write_u4be(self.num_samples)

            if  ((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) or (self.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed)) :
                pass
                self._io.write_u4be(self.num_channels)

            self.sample_rate._write__seq(self._io)
            self._io.write_u4be(self.loop_start)
            self._io.write_u4be(self.loop_end)
            self._io.write_u1(int(self.encode))
            self._io.write_u1(self.midi_note)
            if  ((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) or (self.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed)) :
                pass
                if self.extended_or_compressed._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"extended_or_compressed", self._root, self.extended_or_compressed._root)
                if self.extended_or_compressed._parent != self:
                    raise kaitaistruct.ConsistencyError(u"extended_or_compressed", self, self.extended_or_compressed._parent)
                self.extended_or_compressed._write__seq(self._io)

            if self.sample_ptr == 0:
                pass
                if len(self.sample_area) != (self.num_samples if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.standard else (((self.extended_or_compressed.num_frames * self.num_channels) * self.extended_or_compressed.bits_per_sample) // 8 if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended else self._io.size() - self._io.pos())):
                    raise kaitaistruct.ConsistencyError(u"sample_area", (self.num_samples if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.standard else (((self.extended_or_compressed.num_frames * self.num_channels) * self.extended_or_compressed.bits_per_sample) // 8 if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended else self._io.size() - self._io.pos())), len(self.sample_area))
                self._io.write_bytes(self.sample_area)



        def _check(self):
            if self.sample_rate._root != self._root:
                raise kaitaistruct.ConsistencyError(u"sample_rate", self._root, self.sample_rate._root)
            if self.sample_rate._parent != self:
                raise kaitaistruct.ConsistencyError(u"sample_rate", self, self.sample_rate._parent)
            if self.sample_ptr == 0:
                pass

            if self.sound_header_type__enabled:
                pass

            self._dirty = False

        @property
        def base_freqeuncy(self):
            """base frequency of sample in Hz
            Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
            
            .. seealso::
               Source - https://en.wikipedia.org/wiki/MIDI_tuning_standard
            """
            if hasattr(self, '_m_base_freqeuncy'):
                return self._m_base_freqeuncy

            if  ((self.midi_note >= 0) and (self.midi_note < 128)) :
                pass
                self._m_base_freqeuncy = self._root.midi_note_to_frequency[self.midi_note]

            return getattr(self, '_m_base_freqeuncy', None)

        def _invalidate_base_freqeuncy(self):
            del self._m_base_freqeuncy
        @property
        def sound_header_type(self):
            if self._should_write_sound_header_type:
                self._write_sound_header_type()
            if hasattr(self, '_m_sound_header_type'):
                return self._m_sound_header_type

            if not self.sound_header_type__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.start_ofs + 20)
            self._m_sound_header_type = KaitaiStream.resolve_enum(MacOsResourceSnd.SoundHeaderType, self._io.read_u1())
            self._io.seek(_pos)
            return getattr(self, '_m_sound_header_type', None)

        @sound_header_type.setter
        def sound_header_type(self, v):
            self._dirty = True
            self._m_sound_header_type = v

        def _write_sound_header_type(self):
            self._should_write_sound_header_type = False
            _pos = self._io.pos()
            self._io.seek(self.start_ofs + 20)
            self._io.write_u1(int(self._m_sound_header_type))
            self._io.seek(_pos)

        @property
        def start_ofs(self):
            if hasattr(self, '_m_start_ofs'):
                return self._m_start_ofs

            self._m_start_ofs = self._io.pos()
            return getattr(self, '_m_start_ofs', None)

        def _invalidate_start_ofs(self):
            del self._m_start_ofs

    class UnsignedFixedPoint(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MacOsResourceSnd.UnsignedFixedPoint, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.integer_part = self._io.read_u2be()
            self.fraction_part = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MacOsResourceSnd.UnsignedFixedPoint, self)._write__seq(io)
            self._io.write_u2be(self.integer_part)
            self._io.write_u2be(self.fraction_part)


        def _check(self):
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.integer_part + self.fraction_part / 65535.0
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    @property
    def midi_note_to_frequency(self):
        """Lookup table to convert a MIDI note into a frequency in Hz
        The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
        
        .. seealso::
           Source - https://en.wikipedia.org/wiki/MIDI_tuning_standard
        """
        if hasattr(self, '_m_midi_note_to_frequency'):
            return self._m_midi_note_to_frequency

        self._m_midi_note_to_frequency = [8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85]
        return getattr(self, '_m_midi_note_to_frequency', None)

    def _invalidate_midi_note_to_frequency(self):
        del self._m_midi_note_to_frequency

