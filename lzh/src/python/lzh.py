# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
import dos_datetime


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Lzh(KaitaiStruct):
    """LHA (LHarc, LZH) is a file format used by a popular freeware
    eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
    years, many ports and implementations were developed, sporting many
    extensions to original 1988 LZH.
    
    File format is pretty simple and essentially consists of a stream of
    records.
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(Lzh, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.entries = []
        i = 0
        while not self._io.is_eof():
            self.entries.append(Lzh.Record(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.entries)):
            pass
            self.entries[i]._fetch_instances()


    class FileRecord(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Lzh.FileRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self._raw_header = self._io.read_bytes(self._parent.header_len - 1)
            _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
            self.header = Lzh.Header(_io__raw_header, self, self._root)
            if self.header.header1.lha_level == 0:
                pass
                self.file_uncompr_crc16 = self._io.read_u2le()

            self.body = self._io.read_bytes(self.header.header1.file_size_compr)


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            if self.header.header1.lha_level == 0:
                pass



    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Lzh.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header1 = Lzh.Header1(self._io, self, self._root)
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



    class Header1(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Lzh.Header1, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header_checksum = self._io.read_u1()
            self.method_id = (self._io.read_bytes(5)).decode(u"ASCII")
            self.file_size_compr = self._io.read_u4le()
            self.file_size_uncompr = self._io.read_u4le()
            self._raw_file_timestamp = self._io.read_bytes(4)
            _io__raw_file_timestamp = KaitaiStream(BytesIO(self._raw_file_timestamp))
            self.file_timestamp = dos_datetime.DosDatetime(_io__raw_file_timestamp)
            self.attr = self._io.read_u1()
            self.lha_level = self._io.read_u1()


        def _fetch_instances(self):
            pass
            self.file_timestamp._fetch_instances()


    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Lzh.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header_len = self._io.read_u1()
            if self.header_len > 0:
                pass
                self.file_record = Lzh.FileRecord(self._io, self, self._root)



        def _fetch_instances(self):
            pass
            if self.header_len > 0:
                pass
                self.file_record._fetch_instances()




