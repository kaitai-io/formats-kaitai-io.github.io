# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class CreativeVoiceFile(ReadWriteKaitaiStruct):
    """Creative Voice File is a container file format for digital audio
    wave data. Initial revisions were able to support only unsigned
    8-bit PCM and ADPCM data, later versions were revised to add support
    for 16-bit PCM and a-law / u-law formats.
    
    This format was actively used in 1990s, around the advent of
    Creative's sound cards (Sound Blaster family). It was a popular
    choice for a digital sound container in lots of games and multimedia
    software due to simplicity and availability of Creative's recording
    / editing tools.
    
    .. seealso::
       Source - https://wiki.multimedia.cx/index.php?title=Creative_Voice
    """

    class BlockTypes(IntEnum):
        terminator = 0
        sound_data = 1
        sound_data_cont = 2
        silence = 3
        marker = 4
        text = 5
        repeat_start = 6
        repeat_end = 7
        extra_info = 8
        sound_data_new = 9

    class Codecs(IntEnum):
        pcm_8bit_unsigned = 0
        adpcm_4bit = 1
        adpcm_2_6bit = 2
        adpcm_2_bit = 3
        pcm_16bit_signed = 4
        alaw = 6
        ulaw = 7
        adpcm_4_to_16bit = 512
    def __init__(self, _io=None, _parent=None, _root=None):
        super(CreativeVoiceFile, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(20)
        if not self.magic == b"\x43\x72\x65\x61\x74\x69\x76\x65\x20\x56\x6F\x69\x63\x65\x20\x46\x69\x6C\x65\x1A":
            raise kaitaistruct.ValidationNotEqualError(b"\x43\x72\x65\x61\x74\x69\x76\x65\x20\x56\x6F\x69\x63\x65\x20\x46\x69\x6C\x65\x1A", self.magic, self._io, u"/seq/0")
        self.header_size = self._io.read_u2le()
        self.version = self._io.read_u2le()
        self.checksum = self._io.read_u2le()
        self.blocks = []
        i = 0
        while not self._io.is_eof():
            _t_blocks = CreativeVoiceFile.Block(self._io, self, self._root)
            try:
                _t_blocks._read()
            finally:
                self.blocks.append(_t_blocks)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.blocks)):
            pass
            self.blocks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(CreativeVoiceFile, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u2le(self.header_size)
        self._io.write_u2le(self.version)
        self._io.write_u2le(self.checksum)
        for i in range(len(self.blocks)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"blocks", 0, self._io.size() - self._io.pos())
            self.blocks[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"blocks", 0, self._io.size() - self._io.pos())


    def _check(self):
        if len(self.magic) != 20:
            raise kaitaistruct.ConsistencyError(u"magic", 20, len(self.magic))
        if not self.magic == b"\x43\x72\x65\x61\x74\x69\x76\x65\x20\x56\x6F\x69\x63\x65\x20\x46\x69\x6C\x65\x1A":
            raise kaitaistruct.ValidationNotEqualError(b"\x43\x72\x65\x61\x74\x69\x76\x65\x20\x56\x6F\x69\x63\x65\x20\x46\x69\x6C\x65\x1A", self.magic, None, u"/seq/0")
        for i in range(len(self.blocks)):
            pass
            if self.blocks[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"blocks", self._root, self.blocks[i]._root)
            if self.blocks[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"blocks", self, self.blocks[i]._parent)

        self._dirty = False

    class Block(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CreativeVoiceFile.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.block_type = KaitaiStream.resolve_enum(CreativeVoiceFile.BlockTypes, self._io.read_u1())
            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                self.body_size1 = self._io.read_u2le()

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                self.body_size2 = self._io.read_u1()

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                _on = self.block_type
                if _on == CreativeVoiceFile.BlockTypes.extra_info:
                    pass
                    self._raw_body = self._io.read_bytes(self.body_size)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = CreativeVoiceFile.BlockExtraInfo(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == CreativeVoiceFile.BlockTypes.marker:
                    pass
                    self._raw_body = self._io.read_bytes(self.body_size)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = CreativeVoiceFile.BlockMarker(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == CreativeVoiceFile.BlockTypes.repeat_start:
                    pass
                    self._raw_body = self._io.read_bytes(self.body_size)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = CreativeVoiceFile.BlockRepeatStart(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == CreativeVoiceFile.BlockTypes.silence:
                    pass
                    self._raw_body = self._io.read_bytes(self.body_size)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = CreativeVoiceFile.BlockSilence(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == CreativeVoiceFile.BlockTypes.sound_data:
                    pass
                    self._raw_body = self._io.read_bytes(self.body_size)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = CreativeVoiceFile.BlockSoundData(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == CreativeVoiceFile.BlockTypes.sound_data_new:
                    pass
                    self._raw_body = self._io.read_bytes(self.body_size)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = CreativeVoiceFile.BlockSoundDataNew(_io__raw_body, self, self._root)
                    self.body._read()
                else:
                    pass
                    self.body = self._io.read_bytes(self.body_size)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                _on = self.block_type
                if _on == CreativeVoiceFile.BlockTypes.extra_info:
                    pass
                    self.body._fetch_instances()
                elif _on == CreativeVoiceFile.BlockTypes.marker:
                    pass
                    self.body._fetch_instances()
                elif _on == CreativeVoiceFile.BlockTypes.repeat_start:
                    pass
                    self.body._fetch_instances()
                elif _on == CreativeVoiceFile.BlockTypes.silence:
                    pass
                    self.body._fetch_instances()
                elif _on == CreativeVoiceFile.BlockTypes.sound_data:
                    pass
                    self.body._fetch_instances()
                elif _on == CreativeVoiceFile.BlockTypes.sound_data_new:
                    pass
                    self.body._fetch_instances()
                else:
                    pass



        def _write__seq(self, io=None):
            super(CreativeVoiceFile.Block, self)._write__seq(io)
            self._io.write_u1(int(self.block_type))
            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                self._io.write_u2le(self.body_size1)

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                self._io.write_u1(self.body_size2)

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                _on = self.block_type
                if _on == CreativeVoiceFile.BlockTypes.extra_info:
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.body_size)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.body_size))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.body_size:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.body_size, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == CreativeVoiceFile.BlockTypes.marker:
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.body_size)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.body_size))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.body_size:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.body_size, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == CreativeVoiceFile.BlockTypes.repeat_start:
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.body_size)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.body_size))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.body_size:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.body_size, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == CreativeVoiceFile.BlockTypes.silence:
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.body_size)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.body_size))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.body_size:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.body_size, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == CreativeVoiceFile.BlockTypes.sound_data:
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.body_size)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.body_size))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.body_size:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.body_size, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == CreativeVoiceFile.BlockTypes.sound_data_new:
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.body_size)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.body_size))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.body_size:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.body_size, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                else:
                    pass
                    self._io.write_bytes(self.body)



        def _check(self):
            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                _on = self.block_type
                if _on == CreativeVoiceFile.BlockTypes.extra_info:
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == CreativeVoiceFile.BlockTypes.marker:
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == CreativeVoiceFile.BlockTypes.repeat_start:
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == CreativeVoiceFile.BlockTypes.silence:
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == CreativeVoiceFile.BlockTypes.sound_data:
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == CreativeVoiceFile.BlockTypes.sound_data_new:
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                else:
                    pass
                    if len(self.body) != self.body_size:
                        raise kaitaistruct.ConsistencyError(u"body", self.body_size, len(self.body))

            self._dirty = False

        @property
        def body_size(self):
            """body_size is a 24-bit little-endian integer, so we're
            emulating that by adding two standard-sized integers
            (body_size1 and body_size2).
            """
            if hasattr(self, '_m_body_size'):
                return self._m_body_size

            if self.block_type != CreativeVoiceFile.BlockTypes.terminator:
                pass
                self._m_body_size = self.body_size1 + (self.body_size2 << 16)

            return getattr(self, '_m_body_size', None)

        def _invalidate_body_size(self):
            del self._m_body_size

    class BlockExtraInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CreativeVoiceFile.BlockExtraInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.freq_div = self._io.read_u2le()
            self.codec = KaitaiStream.resolve_enum(CreativeVoiceFile.Codecs, self._io.read_u1())
            self.num_channels_1 = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(CreativeVoiceFile.BlockExtraInfo, self)._write__seq(io)
            self._io.write_u2le(self.freq_div)
            self._io.write_u1(int(self.codec))
            self._io.write_u1(self.num_channels_1)


        def _check(self):
            self._dirty = False

        @property
        def num_channels(self):
            """Number of channels (1 = mono, 2 = stereo)."""
            if hasattr(self, '_m_num_channels'):
                return self._m_num_channels

            self._m_num_channels = self.num_channels_1 + 1
            return getattr(self, '_m_num_channels', None)

        def _invalidate_num_channels(self):
            del self._m_num_channels
        @property
        def sample_rate(self):
            if hasattr(self, '_m_sample_rate'):
                return self._m_sample_rate

            self._m_sample_rate = 256000000.0 / (self.num_channels * (65536 - self.freq_div))
            return getattr(self, '_m_sample_rate', None)

        def _invalidate_sample_rate(self):
            del self._m_sample_rate

    class BlockMarker(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CreativeVoiceFile.BlockMarker, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.marker_id = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(CreativeVoiceFile.BlockMarker, self)._write__seq(io)
            self._io.write_u2le(self.marker_id)


        def _check(self):
            self._dirty = False


    class BlockRepeatStart(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CreativeVoiceFile.BlockRepeatStart, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.repeat_count_1 = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(CreativeVoiceFile.BlockRepeatStart, self)._write__seq(io)
            self._io.write_u2le(self.repeat_count_1)


        def _check(self):
            self._dirty = False


    class BlockSilence(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CreativeVoiceFile.BlockSilence, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.duration_samples = self._io.read_u2le()
            self.freq_div = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(CreativeVoiceFile.BlockSilence, self)._write__seq(io)
            self._io.write_u2le(self.duration_samples)
            self._io.write_u1(self.freq_div)


        def _check(self):
            self._dirty = False

        @property
        def duration_sec(self):
            """Duration of silence, in seconds."""
            if hasattr(self, '_m_duration_sec'):
                return self._m_duration_sec

            self._m_duration_sec = self.duration_samples / self.sample_rate
            return getattr(self, '_m_duration_sec', None)

        def _invalidate_duration_sec(self):
            del self._m_duration_sec
        @property
        def sample_rate(self):
            if hasattr(self, '_m_sample_rate'):
                return self._m_sample_rate

            self._m_sample_rate = 1000000.0 / (256 - self.freq_div)
            return getattr(self, '_m_sample_rate', None)

        def _invalidate_sample_rate(self):
            del self._m_sample_rate

    class BlockSoundData(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CreativeVoiceFile.BlockSoundData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.freq_div = self._io.read_u1()
            self.codec = KaitaiStream.resolve_enum(CreativeVoiceFile.Codecs, self._io.read_u1())
            self.wave = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(CreativeVoiceFile.BlockSoundData, self)._write__seq(io)
            self._io.write_u1(self.freq_div)
            self._io.write_u1(int(self.codec))
            self._io.write_bytes(self.wave)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"wave", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False

        @property
        def sample_rate(self):
            if hasattr(self, '_m_sample_rate'):
                return self._m_sample_rate

            self._m_sample_rate = 1000000.0 / (256 - self.freq_div)
            return getattr(self, '_m_sample_rate', None)

        def _invalidate_sample_rate(self):
            del self._m_sample_rate

    class BlockSoundDataNew(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CreativeVoiceFile.BlockSoundDataNew, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sample_rate = self._io.read_u4le()
            self.bits_per_sample = self._io.read_u1()
            self.num_channels = self._io.read_u1()
            self.codec = KaitaiStream.resolve_enum(CreativeVoiceFile.Codecs, self._io.read_u2le())
            self.reserved = self._io.read_bytes(4)
            self.wave = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(CreativeVoiceFile.BlockSoundDataNew, self)._write__seq(io)
            self._io.write_u4le(self.sample_rate)
            self._io.write_u1(self.bits_per_sample)
            self._io.write_u1(self.num_channels)
            self._io.write_u2le(int(self.codec))
            self._io.write_bytes(self.reserved)
            self._io.write_bytes(self.wave)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"wave", 0, self._io.size() - self._io.pos())


        def _check(self):
            if len(self.reserved) != 4:
                raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
            self._dirty = False



