# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum
import zlib


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Swf(KaitaiStruct):

    class TagType(Enum):
        file_attributes = 69
        abc_tag = 82
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.junk = self._io.read_bytes(4)
        self.file_size = self._io.read_u4le()
        self._raw__raw_body = self._io.read_bytes_full()
        self._raw_body = zlib.decompress(self._raw__raw_body)
        io = KaitaiStream(BytesIO(self._raw_body))
        self.body = self._root.SwfBody(io, self, self._root)

    class SwfBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.rect = self._root.Rect(self._io, self, self._root)
            self.frame_rate = self._io.read_u2le()
            self.frame_count = self._io.read_u2le()
            self.tags = []
            while not self._io.is_eof():
                self.tags.append(self._root.Tag(self._io, self, self._root))



    class Rect(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.b1 = self._io.read_u1()
            self.skip = self._io.read_bytes(self.num_bytes)

        @property
        def num_bits(self):
            if hasattr(self, '_m_num_bits'):
                return self._m_num_bits if hasattr(self, '_m_num_bits') else None

            self._m_num_bits = (self.b1 >> 3)
            return self._m_num_bits if hasattr(self, '_m_num_bits') else None

        @property
        def num_bytes(self):
            if hasattr(self, '_m_num_bytes'):
                return self._m_num_bytes if hasattr(self, '_m_num_bytes') else None

            self._m_num_bytes = (((self.num_bits * 4) - 3) + 7) // 8
            return self._m_num_bytes if hasattr(self, '_m_num_bytes') else None


    class Tag(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.record_header = self._root.RecordHeader(self._io, self, self._root)
            _on = self.record_header.tag_type
            if _on == self._root.TagType.abc_tag:
                self._raw_tag_body = self._io.read_bytes(self.record_header.len)
                io = KaitaiStream(BytesIO(self._raw_tag_body))
                self.tag_body = self._root.AbcTagBody(io, self, self._root)
            else:
                self.tag_body = self._io.read_bytes(self.record_header.len)


    class AbcTagBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.flags = self._io.read_u4le()
            self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self.abcdata = self._io.read_bytes_full()


    class RecordHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.tag_code_and_length = self._io.read_u2le()
            if self.small_len == 63:
                self.big_len = self._io.read_s4le()


        @property
        def tag_type(self):
            if hasattr(self, '_m_tag_type'):
                return self._m_tag_type if hasattr(self, '_m_tag_type') else None

            self._m_tag_type = self._root.TagType((self.tag_code_and_length >> 6))
            return self._m_tag_type if hasattr(self, '_m_tag_type') else None

        @property
        def small_len(self):
            if hasattr(self, '_m_small_len'):
                return self._m_small_len if hasattr(self, '_m_small_len') else None

            self._m_small_len = (self.tag_code_and_length & 63)
            return self._m_small_len if hasattr(self, '_m_small_len') else None

        @property
        def len(self):
            if hasattr(self, '_m_len'):
                return self._m_len if hasattr(self, '_m_len') else None

            self._m_len = (self.big_len if self.small_len == 63 else self.small_len)
            return self._m_len if hasattr(self, '_m_len') else None



