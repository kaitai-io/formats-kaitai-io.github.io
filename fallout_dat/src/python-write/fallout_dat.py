# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class FalloutDat(ReadWriteKaitaiStruct):

    class Compression(IntEnum):
        none = 32
        lzss = 64
    def __init__(self, _io=None, _parent=None, _root=None):
        super(FalloutDat, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.folder_count = self._io.read_u4be()
        self.unknown1 = self._io.read_u4be()
        self.unknown2 = self._io.read_u4be()
        self.timestamp = self._io.read_u4be()
        self.folder_names = []
        for i in range(self.folder_count):
            _t_folder_names = FalloutDat.Pstr(self._io, self, self._root)
            try:
                _t_folder_names._read()
            finally:
                self.folder_names.append(_t_folder_names)

        self.folders = []
        for i in range(self.folder_count):
            _t_folders = FalloutDat.Folder(self._io, self, self._root)
            try:
                _t_folders._read()
            finally:
                self.folders.append(_t_folders)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.folder_names)):
            pass
            self.folder_names[i]._fetch_instances()

        for i in range(len(self.folders)):
            pass
            self.folders[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(FalloutDat, self)._write__seq(io)
        self._io.write_u4be(self.folder_count)
        self._io.write_u4be(self.unknown1)
        self._io.write_u4be(self.unknown2)
        self._io.write_u4be(self.timestamp)
        for i in range(len(self.folder_names)):
            pass
            self.folder_names[i]._write__seq(self._io)

        for i in range(len(self.folders)):
            pass
            self.folders[i]._write__seq(self._io)



    def _check(self):
        if len(self.folder_names) != self.folder_count:
            raise kaitaistruct.ConsistencyError(u"folder_names", self.folder_count, len(self.folder_names))
        for i in range(len(self.folder_names)):
            pass
            if self.folder_names[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"folder_names", self._root, self.folder_names[i]._root)
            if self.folder_names[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"folder_names", self, self.folder_names[i]._parent)

        if len(self.folders) != self.folder_count:
            raise kaitaistruct.ConsistencyError(u"folders", self.folder_count, len(self.folders))
        for i in range(len(self.folders)):
            pass
            if self.folders[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"folders", self._root, self.folders[i]._root)
            if self.folders[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"folders", self, self.folders[i]._parent)

        self._dirty = False

    class File(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FalloutDat.File, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_contents = False
            self.contents__enabled = True

        def _read(self):
            self.name = FalloutDat.Pstr(self._io, self, self._root)
            self.name._read()
            self.flags = KaitaiStream.resolve_enum(FalloutDat.Compression, self._io.read_u4be())
            self.offset = self._io.read_u4be()
            self.size_unpacked = self._io.read_u4be()
            self.size_packed = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            _ = self.contents
            if hasattr(self, '_m_contents'):
                pass



        def _write__seq(self, io=None):
            super(FalloutDat.File, self)._write__seq(io)
            self._should_write_contents = self.contents__enabled
            self.name._write__seq(self._io)
            self._io.write_u4be(int(self.flags))
            self._io.write_u4be(self.offset)
            self._io.write_u4be(self.size_unpacked)
            self._io.write_u4be(self.size_packed)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.contents__enabled:
                pass
                if len(self._m_contents) != (self.size_unpacked if self.flags == FalloutDat.Compression.none else self.size_packed):
                    raise kaitaistruct.ConsistencyError(u"contents", (self.size_unpacked if self.flags == FalloutDat.Compression.none else self.size_packed), len(self._m_contents))

            self._dirty = False

        @property
        def contents(self):
            if self._should_write_contents:
                self._write_contents()
            if hasattr(self, '_m_contents'):
                return self._m_contents

            if not self.contents__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._m_contents = io.read_bytes((self.size_unpacked if self.flags == FalloutDat.Compression.none else self.size_packed))
            io.seek(_pos)
            return getattr(self, '_m_contents', None)

        @contents.setter
        def contents(self, v):
            self._dirty = True
            self._m_contents = v

        def _write_contents(self):
            self._should_write_contents = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            io.write_bytes(self._m_contents)
            io.seek(_pos)


    class Folder(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FalloutDat.Folder, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_count = self._io.read_u4be()
            self.unknown = self._io.read_u4be()
            self.flags = self._io.read_u4be()
            self.timestamp = self._io.read_u4be()
            self.files = []
            for i in range(self.file_count):
                _t_files = FalloutDat.File(self._io, self, self._root)
                try:
                    _t_files._read()
                finally:
                    self.files.append(_t_files)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.files)):
                pass
                self.files[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(FalloutDat.Folder, self)._write__seq(io)
            self._io.write_u4be(self.file_count)
            self._io.write_u4be(self.unknown)
            self._io.write_u4be(self.flags)
            self._io.write_u4be(self.timestamp)
            for i in range(len(self.files)):
                pass
                self.files[i]._write__seq(self._io)



        def _check(self):
            if len(self.files) != self.file_count:
                raise kaitaistruct.ConsistencyError(u"files", self.file_count, len(self.files))
            for i in range(len(self.files)):
                pass
                if self.files[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"files", self._root, self.files[i]._root)
                if self.files[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"files", self, self.files[i]._parent)

            self._dirty = False


    class Pstr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FalloutDat.Pstr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u1()
            self.str = (self._io.read_bytes(self.size)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(FalloutDat.Pstr, self)._write__seq(io)
            self._io.write_u1(self.size)
            self._io.write_bytes((self.str).encode(u"ASCII"))


        def _check(self):
            if len((self.str).encode(u"ASCII")) != self.size:
                raise kaitaistruct.ConsistencyError(u"str", self.size, len((self.str).encode(u"ASCII")))
            self._dirty = False



