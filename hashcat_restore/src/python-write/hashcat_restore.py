# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class HashcatRestore(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://hashcat.net/wiki/doku.php?id=restore
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(HashcatRestore, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.version = self._io.read_u4le()
        self.cwd = (KaitaiStream.bytes_terminate(self._io.read_bytes(256), 0, False)).decode(u"UTF-8")
        self.dicts_pos = self._io.read_u4le()
        self.masks_pos = self._io.read_u4le()
        self.padding = self._io.read_bytes(4)
        self.current_restore_point = self._io.read_u8le()
        self.argc = self._io.read_u4le()
        self.padding2 = self._io.read_bytes(12)
        self.argv = []
        for i in range(self.argc):
            self.argv.append((self._io.read_bytes_term(10, False, True, True)).decode(u"UTF-8"))

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.argv)):
            pass



    def _write__seq(self, io=None):
        super(HashcatRestore, self)._write__seq(io)
        self._io.write_u4le(self.version)
        self._io.write_bytes_limit((self.cwd).encode(u"UTF-8"), 256, 0, 0)
        self._io.write_u4le(self.dicts_pos)
        self._io.write_u4le(self.masks_pos)
        self._io.write_bytes(self.padding)
        self._io.write_u8le(self.current_restore_point)
        self._io.write_u4le(self.argc)
        self._io.write_bytes(self.padding2)
        for i in range(len(self.argv)):
            pass
            self._io.write_bytes((self.argv[i]).encode(u"UTF-8"))
            self._io.write_u1(10)



    def _check(self):
        if len((self.cwd).encode(u"UTF-8")) > 256:
            raise kaitaistruct.ConsistencyError(u"cwd", 256, len((self.cwd).encode(u"UTF-8")))
        if KaitaiStream.byte_array_index_of((self.cwd).encode(u"UTF-8"), 0) != -1:
            raise kaitaistruct.ConsistencyError(u"cwd", -1, KaitaiStream.byte_array_index_of((self.cwd).encode(u"UTF-8"), 0))
        if len(self.padding) != 4:
            raise kaitaistruct.ConsistencyError(u"padding", 4, len(self.padding))
        if len(self.padding2) != 12:
            raise kaitaistruct.ConsistencyError(u"padding2", 12, len(self.padding2))
        if len(self.argv) != self.argc:
            raise kaitaistruct.ConsistencyError(u"argv", self.argc, len(self.argv))
        for i in range(len(self.argv)):
            pass
            if KaitaiStream.byte_array_index_of((self.argv[i]).encode(u"UTF-8"), 10) != -1:
                raise kaitaistruct.ConsistencyError(u"argv", -1, KaitaiStream.byte_array_index_of((self.argv[i]).encode(u"UTF-8"), 10))

        self._dirty = False


