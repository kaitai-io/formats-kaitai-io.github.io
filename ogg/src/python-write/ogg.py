# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ogg(ReadWriteKaitaiStruct):
    """Ogg is a popular media container format, which provides basic
    streaming / buffering mechanisms and is content-agnostic. Most
    popular codecs that are used within Ogg streams are Vorbis (thus
    making Ogg/Vorbis streams) and Theora (Ogg/Theora).
    
    Ogg stream is a sequence Ogg pages. They can be read sequentially,
    or one can jump into arbitrary stream location and scan for "OggS"
    sync code to find the beginning of a new Ogg page and continue
    decoding the stream contents from that one.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Ogg, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.pages = []
        i = 0
        while not self._io.is_eof():
            _t_pages = Ogg.Page(self._io, self, self._root)
            try:
                _t_pages._read()
            finally:
                self.pages.append(_t_pages)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.pages)):
            pass
            self.pages[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Ogg, self)._write__seq(io)
        for i in range(len(self.pages)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"pages", 0, self._io.size() - self._io.pos())
            self.pages[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"pages", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.pages)):
            pass
            if self.pages[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"pages", self._root, self.pages[i]._root)
            if self.pages[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"pages", self, self.pages[i]._parent)

        self._dirty = False

    class Page(ReadWriteKaitaiStruct):
        """Ogg page is a basic unit of data in an Ogg bitstream, usually
        it's around 4-8 KB, with a maximum size of 65307 bytes.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ogg.Page, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sync_code = self._io.read_bytes(4)
            if not self.sync_code == b"\x4F\x67\x67\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x4F\x67\x67\x53", self.sync_code, self._io, u"/types/page/seq/0")
            self.version = self._io.read_bytes(1)
            if not self.version == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.version, self._io, u"/types/page/seq/1")
            self.reserved1 = self._io.read_bits_int_be(5)
            self.is_end_of_stream = self._io.read_bits_int_be(1) != 0
            self.is_beginning_of_stream = self._io.read_bits_int_be(1) != 0
            self.is_continuation = self._io.read_bits_int_be(1) != 0
            self.granule_pos = self._io.read_u8le()
            self.bitstream_serial = self._io.read_u4le()
            self.page_seq_num = self._io.read_u4le()
            self.crc32 = self._io.read_u4le()
            self.num_segments = self._io.read_u1()
            self.len_segments = []
            for i in range(self.num_segments):
                self.len_segments.append(self._io.read_u1())

            self.segments = []
            for i in range(self.num_segments):
                self.segments.append(self._io.read_bytes(self.len_segments[i]))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.len_segments)):
                pass

            for i in range(len(self.segments)):
                pass



        def _write__seq(self, io=None):
            super(Ogg.Page, self)._write__seq(io)
            self._io.write_bytes(self.sync_code)
            self._io.write_bytes(self.version)
            self._io.write_bits_int_be(5, self.reserved1)
            self._io.write_bits_int_be(1, int(self.is_end_of_stream))
            self._io.write_bits_int_be(1, int(self.is_beginning_of_stream))
            self._io.write_bits_int_be(1, int(self.is_continuation))
            self._io.write_u8le(self.granule_pos)
            self._io.write_u4le(self.bitstream_serial)
            self._io.write_u4le(self.page_seq_num)
            self._io.write_u4le(self.crc32)
            self._io.write_u1(self.num_segments)
            for i in range(len(self.len_segments)):
                pass
                self._io.write_u1(self.len_segments[i])

            for i in range(len(self.segments)):
                pass
                self._io.write_bytes(self.segments[i])



        def _check(self):
            if len(self.sync_code) != 4:
                raise kaitaistruct.ConsistencyError(u"sync_code", 4, len(self.sync_code))
            if not self.sync_code == b"\x4F\x67\x67\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x4F\x67\x67\x53", self.sync_code, None, u"/types/page/seq/0")
            if len(self.version) != 1:
                raise kaitaistruct.ConsistencyError(u"version", 1, len(self.version))
            if not self.version == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.version, None, u"/types/page/seq/1")
            if len(self.len_segments) != self.num_segments:
                raise kaitaistruct.ConsistencyError(u"len_segments", self.num_segments, len(self.len_segments))
            for i in range(len(self.len_segments)):
                pass

            if len(self.segments) != self.num_segments:
                raise kaitaistruct.ConsistencyError(u"segments", self.num_segments, len(self.segments))
            for i in range(len(self.segments)):
                pass
                if len(self.segments[i]) != self.len_segments[i]:
                    raise kaitaistruct.ConsistencyError(u"segments", self.len_segments[i], len(self.segments[i]))

            self._dirty = False



