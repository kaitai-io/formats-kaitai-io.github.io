# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Au(KaitaiStruct):
    """The NeXT/Sun audio file format.
    
    Sample files:
    
    * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
    * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
    * <https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
    
    .. seealso::
       Source - https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html
    
    
    .. seealso::
       Source - http://soundfile.sapp.org/doc/NextFormat/
    
    
    .. seealso::
       Source - http://soundfile.sapp.org/doc/NextFormat/soundstruct.h
    
    
    .. seealso::
       Source - https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112
    
    
    .. seealso::
       Source - https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74
    
    
    .. seealso::
       Source - https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49
    
    
    .. seealso::
       Source - https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96
    """

    class Encodings(IntEnum):
        mulaw_8 = 1
        linear_8 = 2
        linear_16 = 3
        linear_24 = 4
        linear_32 = 5
        float = 6
        double = 7
        fragmented = 8
        nested = 9
        dsp_core = 10
        fixed_point_8 = 11
        fixed_point_16 = 12
        fixed_point_24 = 13
        fixed_point_32 = 14
        display = 16
        mulaw_squelch = 17
        emphasized = 18
        compressed = 19
        compressed_emphasized = 20
        dsp_commands = 21
        dsp_commands_samples = 22
        adpcm_g721 = 23
        adpcm_g722 = 24
        adpcm_g723_3 = 25
        adpcm_g723_5 = 26
        alaw_8 = 27
        aes = 28
        delta_mulaw_8 = 29
    def __init__(self, _io, _parent=None, _root=None):
        super(Au, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x2E\x73\x6E\x64":
            raise kaitaistruct.ValidationNotEqualError(b"\x2E\x73\x6E\x64", self.magic, self._io, u"/seq/0")
        self.ofs_data = self._io.read_u4be()
        self._raw_header = self._io.read_bytes((self.ofs_data - 4) - 4)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = Au.Header(_io__raw_header, self, self._root)


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()

    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Au.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.data_size = self._io.read_u4be()
            self.encoding = KaitaiStream.resolve_enum(Au.Encodings, self._io.read_u4be())
            self.sample_rate = self._io.read_u4be()
            self.num_channels = self._io.read_u4be()
            if not self.num_channels >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.num_channels, self._io, u"/types/header/seq/3")
            self.comment = (KaitaiStream.bytes_terminate(self._io.read_bytes_full(), 0, False)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    @property
    def len_data(self):
        if hasattr(self, '_m_len_data'):
            return self._m_len_data

        self._m_len_data = (self._io.size() - self.ofs_data if self.header.data_size == 4294967295 else self.header.data_size)
        return getattr(self, '_m_len_data', None)


