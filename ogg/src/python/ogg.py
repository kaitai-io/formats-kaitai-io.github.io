# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Ogg(KaitaiStruct):
    """Ogg is a popular media container format, which provides basic
    streaming / buffering mechanisms and is content-agnostic. Most
    popular codecs that are used within Ogg streams are Vorbis (thus
    making Ogg/Vorbis streams) and Theora (Ogg/Theora).
    
    Ogg stream is a sequence Ogg pages. They can be read sequentially,
    or one can jump into arbitrary stream location and scan for "OggS"
    sync code to find the beginning of a new Ogg page and continue
    decoding the stream contents from that one.
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.pages = []
        i = 0
        while not self._io.is_eof():
            self.pages.append(self._root.Page(self._io, self, self._root))
            i += 1


    class Page(KaitaiStruct):
        """Ogg page is a basic unit of data in an Ogg bitstream, usually
        it's around 4-8 KB, with a maximum size of 65307 bytes.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.sync_code = self._io.ensure_fixed_contents(struct.pack('4b', 79, 103, 103, 83))
            self.version = self._io.ensure_fixed_contents(struct.pack('1b', 0))
            self.reserved1 = self._io.read_bits_int(5)
            self.is_end_of_stream = self._io.read_bits_int(1) != 0
            self.is_beginning_of_stream = self._io.read_bits_int(1) != 0
            self.is_continuation = self._io.read_bits_int(1) != 0
            self._io.align_to_byte()
            self.granule_pos = self._io.read_u8le()
            self.bitstream_serial = self._io.read_u4le()
            self.page_seq_num = self._io.read_u4le()
            self.crc32 = self._io.read_u4le()
            self.num_segments = self._io.read_u1()
            self.len_segments = [None] * (self.num_segments)
            for i in range(self.num_segments):
                self.len_segments[i] = self._io.read_u1()

            self.segments = [None] * (self.num_segments)
            for i in range(self.num_segments):
                self.segments[i] = self._io.read_bytes(self.len_segments[i])




