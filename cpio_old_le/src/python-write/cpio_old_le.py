# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class CpioOldLe(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(CpioOldLe, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.files = []
        i = 0
        while not self._io.is_eof():
            _t_files = CpioOldLe.File(self._io, self, self._root)
            try:
                _t_files._read()
            finally:
                self.files.append(_t_files)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.files)):
            pass
            self.files[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(CpioOldLe, self)._write__seq(io)
        for i in range(len(self.files)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"files", 0, self._io.size() - self._io.pos())
            self.files[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"files", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.files)):
            pass
            if self.files[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"files", self._root, self.files[i]._root)
            if self.files[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"files", self, self.files[i]._parent)

        self._dirty = False

    class File(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CpioOldLe.File, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = CpioOldLe.FileHeader(self._io, self, self._root)
            self.header._read()
            self.path_name = self._io.read_bytes(self.header.path_name_size - 1)
            self.string_terminator = self._io.read_bytes(1)
            if not self.string_terminator == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.string_terminator, self._io, u"/types/file/seq/2")
            if self.header.path_name_size % 2 == 1:
                pass
                self.path_name_padding = self._io.read_bytes(1)
                if not self.path_name_padding == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.path_name_padding, self._io, u"/types/file/seq/3")

            self.file_data = self._io.read_bytes(self.header.file_size.value)
            if self.header.file_size.value % 2 == 1:
                pass
                self.file_data_padding = self._io.read_bytes(1)
                if not self.file_data_padding == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.file_data_padding, self._io, u"/types/file/seq/5")

            if  ((self.path_name == b"\x54\x52\x41\x49\x4C\x45\x52\x21\x21\x21") and (self.header.file_size.value == 0)) :
                pass
                self.end_of_file_padding = self._io.read_bytes_full()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            if self.header.path_name_size % 2 == 1:
                pass

            if self.header.file_size.value % 2 == 1:
                pass

            if  ((self.path_name == b"\x54\x52\x41\x49\x4C\x45\x52\x21\x21\x21") and (self.header.file_size.value == 0)) :
                pass



        def _write__seq(self, io=None):
            super(CpioOldLe.File, self)._write__seq(io)
            self.header._write__seq(self._io)
            self._io.write_bytes(self.path_name)
            self._io.write_bytes(self.string_terminator)
            if self.header.path_name_size % 2 == 1:
                pass
                self._io.write_bytes(self.path_name_padding)

            self._io.write_bytes(self.file_data)
            if self.header.file_size.value % 2 == 1:
                pass
                self._io.write_bytes(self.file_data_padding)

            if  ((self.path_name == b"\x54\x52\x41\x49\x4C\x45\x52\x21\x21\x21") and (self.header.file_size.value == 0)) :
                pass
                self._io.write_bytes(self.end_of_file_padding)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"end_of_file_padding", 0, self._io.size() - self._io.pos())



        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            if len(self.path_name) != self.header.path_name_size - 1:
                raise kaitaistruct.ConsistencyError(u"path_name", self.header.path_name_size - 1, len(self.path_name))
            if len(self.string_terminator) != 1:
                raise kaitaistruct.ConsistencyError(u"string_terminator", 1, len(self.string_terminator))
            if not self.string_terminator == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.string_terminator, None, u"/types/file/seq/2")
            if self.header.path_name_size % 2 == 1:
                pass
                if len(self.path_name_padding) != 1:
                    raise kaitaistruct.ConsistencyError(u"path_name_padding", 1, len(self.path_name_padding))
                if not self.path_name_padding == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.path_name_padding, None, u"/types/file/seq/3")

            if len(self.file_data) != self.header.file_size.value:
                raise kaitaistruct.ConsistencyError(u"file_data", self.header.file_size.value, len(self.file_data))
            if self.header.file_size.value % 2 == 1:
                pass
                if len(self.file_data_padding) != 1:
                    raise kaitaistruct.ConsistencyError(u"file_data_padding", 1, len(self.file_data_padding))
                if not self.file_data_padding == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.file_data_padding, None, u"/types/file/seq/5")

            if  ((self.path_name == b"\x54\x52\x41\x49\x4C\x45\x52\x21\x21\x21") and (self.header.file_size.value == 0)) :
                pass

            self._dirty = False


    class FileHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CpioOldLe.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\xC7\x71":
                raise kaitaistruct.ValidationNotEqualError(b"\xC7\x71", self.magic, self._io, u"/types/file_header/seq/0")
            self.device_number = self._io.read_u2le()
            self.inode_number = self._io.read_u2le()
            self.mode = self._io.read_u2le()
            self.user_id = self._io.read_u2le()
            self.group_id = self._io.read_u2le()
            self.number_of_links = self._io.read_u2le()
            self.r_device_number = self._io.read_u2le()
            self.modification_time = CpioOldLe.FourByteUnsignedInteger(self._io, self, self._root)
            self.modification_time._read()
            self.path_name_size = self._io.read_u2le()
            self.file_size = CpioOldLe.FourByteUnsignedInteger(self._io, self, self._root)
            self.file_size._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.modification_time._fetch_instances()
            self.file_size._fetch_instances()


        def _write__seq(self, io=None):
            super(CpioOldLe.FileHeader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u2le(self.device_number)
            self._io.write_u2le(self.inode_number)
            self._io.write_u2le(self.mode)
            self._io.write_u2le(self.user_id)
            self._io.write_u2le(self.group_id)
            self._io.write_u2le(self.number_of_links)
            self._io.write_u2le(self.r_device_number)
            self.modification_time._write__seq(self._io)
            self._io.write_u2le(self.path_name_size)
            self.file_size._write__seq(self._io)


        def _check(self):
            if len(self.magic) != 2:
                raise kaitaistruct.ConsistencyError(u"magic", 2, len(self.magic))
            if not self.magic == b"\xC7\x71":
                raise kaitaistruct.ValidationNotEqualError(b"\xC7\x71", self.magic, None, u"/types/file_header/seq/0")
            if self.modification_time._root != self._root:
                raise kaitaistruct.ConsistencyError(u"modification_time", self._root, self.modification_time._root)
            if self.modification_time._parent != self:
                raise kaitaistruct.ConsistencyError(u"modification_time", self, self.modification_time._parent)
            if self.file_size._root != self._root:
                raise kaitaistruct.ConsistencyError(u"file_size", self._root, self.file_size._root)
            if self.file_size._parent != self:
                raise kaitaistruct.ConsistencyError(u"file_size", self, self.file_size._parent)
            self._dirty = False


    class FourByteUnsignedInteger(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CpioOldLe.FourByteUnsignedInteger, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.most_significant_bits = self._io.read_u2le()
            self.least_significant_bits = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(CpioOldLe.FourByteUnsignedInteger, self)._write__seq(io)
            self._io.write_u2le(self.most_significant_bits)
            self._io.write_u2le(self.least_significant_bits)


        def _check(self):
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.least_significant_bits + (self.most_significant_bits << 16)
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value


