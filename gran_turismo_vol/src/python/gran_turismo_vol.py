# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GranTurismoVol(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        super(GranTurismoVol, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x47\x54\x46\x53\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x47\x54\x46\x53\x00\x00\x00\x00", self.magic, self._io, u"/seq/0")
        self.num_files = self._io.read_u2le()
        self.num_entries = self._io.read_u2le()
        self.reserved = self._io.read_bytes(4)
        if not self.reserved == b"\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/seq/3")
        self.offsets = []
        for i in range(self.num_files):
            self.offsets.append(self._io.read_u4le())



    def _fetch_instances(self):
        pass
        for i in range(len(self.offsets)):
            pass

        _ = self.files
        if hasattr(self, '_m_files'):
            pass
            for i in range(len(self._m_files)):
                pass
                self._m_files[i]._fetch_instances()



    class FileInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(GranTurismoVol.FileInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.timestamp = self._io.read_u4le()
            self.offset_idx = self._io.read_u2le()
            self.flags = self._io.read_u1()
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(25), 0, False)).decode(u"ASCII")


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass


        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body

            if (not (self.is_dir)):
                pass
                _pos = self._io.pos()
                self._io.seek(self._root.offsets[self.offset_idx] & 4294965248)
                self._m_body = self._io.read_bytes(self.size)
                self._io.seek(_pos)

            return getattr(self, '_m_body', None)

        @property
        def is_dir(self):
            if hasattr(self, '_m_is_dir'):
                return self._m_is_dir

            self._m_is_dir = self.flags & 1 != 0
            return getattr(self, '_m_is_dir', None)

        @property
        def is_last_entry(self):
            if hasattr(self, '_m_is_last_entry'):
                return self._m_is_last_entry

            self._m_is_last_entry = self.flags & 128 != 0
            return getattr(self, '_m_is_last_entry', None)

        @property
        def size(self):
            if hasattr(self, '_m_size'):
                return self._m_size

            self._m_size = (self._root.offsets[self.offset_idx + 1] & 4294965248) - self._root.offsets[self.offset_idx]
            return getattr(self, '_m_size', None)


    @property
    def files(self):
        if hasattr(self, '_m_files'):
            return self._m_files

        _pos = self._io.pos()
        self._io.seek(self.ofs_dir & 4294965248)
        self._m_files = []
        for i in range(self._root.num_entries):
            self._m_files.append(GranTurismoVol.FileInfo(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_files', None)

    @property
    def ofs_dir(self):
        if hasattr(self, '_m_ofs_dir'):
            return self._m_ofs_dir

        self._m_ofs_dir = self.offsets[1]
        return getattr(self, '_m_ofs_dir', None)


