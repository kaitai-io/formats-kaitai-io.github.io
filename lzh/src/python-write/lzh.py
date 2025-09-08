# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import dos_datetime


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Lzh(ReadWriteKaitaiStruct):
    """LHA (LHarc, LZH) is a file format used by a popular freeware
    eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
    years, many ports and implementations were developed, sporting many
    extensions to original 1988 LZH.
    
    File format is pretty simple and essentially consists of a stream of
    records.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Lzh, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.entries = []
        i = 0
        while not self._io.is_eof():
            _t_entries = Lzh.Record(self._io, self, self._root)
            try:
                _t_entries._read()
            finally:
                self.entries.append(_t_entries)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.entries)):
            pass
            self.entries[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Lzh, self)._write__seq(io)
        for i in range(len(self.entries)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
            self.entries[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.entries)):
            pass
            if self.entries[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
            if self.entries[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

        self._dirty = False

    class FileRecord(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Lzh.FileRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._raw_header = self._io.read_bytes(self._parent.header_len - 1)
            _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
            self.header = Lzh.Header(_io__raw_header, self, self._root)
            self.header._read()
            if self.header.header1.lha_level == 0:
                pass
                self.file_uncompr_crc16 = self._io.read_u2le()

            self.body = self._io.read_bytes(self.header.header1.file_size_compr)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            if self.header.header1.lha_level == 0:
                pass



        def _write__seq(self, io=None):
            super(Lzh.FileRecord, self)._write__seq(io)
            _io__raw_header = KaitaiStream(BytesIO(bytearray(self._parent.header_len - 1)))
            self._io.add_child_stream(_io__raw_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._parent.header_len - 1))
            def handler(parent, _io__raw_header=_io__raw_header):
                self._raw_header = _io__raw_header.to_byte_array()
                if len(self._raw_header) != self._parent.header_len - 1:
                    raise kaitaistruct.ConsistencyError(u"raw(header)", self._parent.header_len - 1, len(self._raw_header))
                parent.write_bytes(self._raw_header)
            _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.header._write__seq(_io__raw_header)
            if self.header.header1.lha_level == 0:
                pass
                self._io.write_u2le(self.file_uncompr_crc16)

            self._io.write_bytes(self.body)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            if self.header.header1.lha_level == 0:
                pass

            if len(self.body) != self.header.header1.file_size_compr:
                raise kaitaistruct.ConsistencyError(u"body", self.header.header1.file_size_compr, len(self.body))
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Lzh.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header1 = Lzh.Header1(self._io, self, self._root)
            self.header1._read()
            if self.header1.lha_level == 0:
                pass
                self.filename_len = self._io.read_u1()

            if self.header1.lha_level == 0:
                pass
                self.filename = (self._io.read_bytes(self.filename_len)).decode(u"ASCII")

            if self.header1.lha_level == 2:
                pass
                self.file_uncompr_crc16 = self._io.read_u2le()

            if self.header1.lha_level == 2:
                pass
                self.os = self._io.read_u1()

            if self.header1.lha_level == 2:
                pass
                self.ext_header_size = self._io.read_u2le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header1._fetch_instances()
            if self.header1.lha_level == 0:
                pass

            if self.header1.lha_level == 0:
                pass

            if self.header1.lha_level == 2:
                pass

            if self.header1.lha_level == 2:
                pass

            if self.header1.lha_level == 2:
                pass



        def _write__seq(self, io=None):
            super(Lzh.Header, self)._write__seq(io)
            self.header1._write__seq(self._io)
            if self.header1.lha_level == 0:
                pass
                self._io.write_u1(self.filename_len)

            if self.header1.lha_level == 0:
                pass
                self._io.write_bytes((self.filename).encode(u"ASCII"))

            if self.header1.lha_level == 2:
                pass
                self._io.write_u2le(self.file_uncompr_crc16)

            if self.header1.lha_level == 2:
                pass
                self._io.write_u1(self.os)

            if self.header1.lha_level == 2:
                pass
                self._io.write_u2le(self.ext_header_size)



        def _check(self):
            if self.header1._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header1", self._root, self.header1._root)
            if self.header1._parent != self:
                raise kaitaistruct.ConsistencyError(u"header1", self, self.header1._parent)
            if self.header1.lha_level == 0:
                pass

            if self.header1.lha_level == 0:
                pass
                if len((self.filename).encode(u"ASCII")) != self.filename_len:
                    raise kaitaistruct.ConsistencyError(u"filename", self.filename_len, len((self.filename).encode(u"ASCII")))

            if self.header1.lha_level == 2:
                pass

            if self.header1.lha_level == 2:
                pass

            if self.header1.lha_level == 2:
                pass

            self._dirty = False


    class Header1(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Lzh.Header1, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header_checksum = self._io.read_u1()
            self.method_id = (self._io.read_bytes(5)).decode(u"ASCII")
            self.file_size_compr = self._io.read_u4le()
            self.file_size_uncompr = self._io.read_u4le()
            self._raw_file_timestamp = self._io.read_bytes(4)
            _io__raw_file_timestamp = KaitaiStream(BytesIO(self._raw_file_timestamp))
            self.file_timestamp = dos_datetime.DosDatetime(_io__raw_file_timestamp)
            self.file_timestamp._read()
            self.attr = self._io.read_u1()
            self.lha_level = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.file_timestamp._fetch_instances()


        def _write__seq(self, io=None):
            super(Lzh.Header1, self)._write__seq(io)
            self._io.write_u1(self.header_checksum)
            self._io.write_bytes((self.method_id).encode(u"ASCII"))
            self._io.write_u4le(self.file_size_compr)
            self._io.write_u4le(self.file_size_uncompr)
            _io__raw_file_timestamp = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_file_timestamp)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_file_timestamp=_io__raw_file_timestamp):
                self._raw_file_timestamp = _io__raw_file_timestamp.to_byte_array()
                if len(self._raw_file_timestamp) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(file_timestamp)", 4, len(self._raw_file_timestamp))
                parent.write_bytes(self._raw_file_timestamp)
            _io__raw_file_timestamp.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.file_timestamp._write__seq(_io__raw_file_timestamp)
            self._io.write_u1(self.attr)
            self._io.write_u1(self.lha_level)


        def _check(self):
            if len((self.method_id).encode(u"ASCII")) != 5:
                raise kaitaistruct.ConsistencyError(u"method_id", 5, len((self.method_id).encode(u"ASCII")))
            self._dirty = False


    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Lzh.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header_len = self._io.read_u1()
            if self.header_len > 0:
                pass
                self.file_record = Lzh.FileRecord(self._io, self, self._root)
                self.file_record._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.header_len > 0:
                pass
                self.file_record._fetch_instances()



        def _write__seq(self, io=None):
            super(Lzh.Record, self)._write__seq(io)
            self._io.write_u1(self.header_len)
            if self.header_len > 0:
                pass
                self.file_record._write__seq(self._io)



        def _check(self):
            if self.header_len > 0:
                pass
                if self.file_record._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"file_record", self._root, self.file_record._root)
                if self.file_record._parent != self:
                    raise kaitaistruct.ConsistencyError(u"file_record", self, self.file_record._parent)

            self._dirty = False



