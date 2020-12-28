# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class AsusTrx(KaitaiStruct):
    """Header and a footer for stock firmwares used on some ASUS routers. trx files not necessarily contain these headers.
    
    .. seealso::
       Source - https://github.com/openwrt/openwrt/blob/master/tools/firmware-utils/src/trx.c
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        pass

    class Revision(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.major = self._io.read_u1()
            self.minor = self._io.read_u1()


    class Version(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.major = self._io.read_u1()
            self.minor = self._io.read_u1()
            self.patch = self._io.read_u1()
            self.tweak = self._io.read_u1()


    class Tail(KaitaiStruct):
        """A safeguard against installation of firmware to an incompatible device."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version = AsusTrx.Version(self._io, self, self._root)
            self.product_id = (KaitaiStream.bytes_terminate(self._io.read_bytes(12), 0, False)).decode(u"utf-8")
            self.comp_hw = [None] * (4)
            for i in range(4):
                self.comp_hw[i] = AsusTrx.Tail.HwCompInfo(self._io, self, self._root)

            self.reserved = self._io.read_bytes(32)

        class HwCompInfo(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.min = AsusTrx.Revision(self._io, self, self._root)
                self.max = AsusTrx.Revision(self._io, self, self._root)



    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.signature = self._io.read_bytes(4)
            if not self.signature == b"\x48\x44\x52\x30":
                raise kaitaistruct.ValidationNotEqualError(b"\x48\x44\x52\x30", self.signature, self._io, u"/types/header/seq/0")
            self.len = self._io.read_u4le()
            self.crc32 = self._io.read_u4le()
            self.version = self._io.read_u2le()
            self.flags = AsusTrx.Header.Flags(self._io, self, self._root)
            self.partitions = []
            i = 0
            while True:
                _ = AsusTrx.Header.Partition(i, self._io, self, self._root)
                self.partitions.append(_)
                if  ((i >= 4) or (not (_.present))) :
                    break
                i += 1

        class Partition(KaitaiStruct):
            def __init__(self, idx, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self.idx = idx
                self._read()

            def _read(self):
                self.offset = self._io.read_u4le()

            @property
            def present(self):
                if hasattr(self, '_m_present'):
                    return self._m_present if hasattr(self, '_m_present') else None

                self._m_present = self.offset != 0
                return self._m_present if hasattr(self, '_m_present') else None

            @property
            def is_last(self):
                if hasattr(self, '_m_is_last'):
                    return self._m_is_last if hasattr(self, '_m_is_last') else None

                if self.present:
                    self._m_is_last =  ((self.idx == (len(self._parent.partitions) - 1)) or (not (self._parent.partitions[(self.idx + 1)].present))) 

                return self._m_is_last if hasattr(self, '_m_is_last') else None

            @property
            def size(self):
                if hasattr(self, '_m_size'):
                    return self._m_size if hasattr(self, '_m_size') else None

                if self.present:
                    self._m_size = ((self._root._io.size() - self.offset) if self.is_last else self._parent.partitions[(self.idx + 1)].offset)

                return self._m_size if hasattr(self, '_m_size') else None

            @property
            def partition(self):
                if hasattr(self, '_m_partition'):
                    return self._m_partition if hasattr(self, '_m_partition') else None

                if self.present:
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.offset)
                    self._m_partition = io.read_bytes(self.size)
                    io.seek(_pos)

                return self._m_partition if hasattr(self, '_m_partition') else None


        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.flags = [None] * (16)
                for i in range(16):
                    self.flags[i] = self._io.read_bits_int_le(1) != 0




    @property
    def header(self):
        if hasattr(self, '_m_header'):
            return self._m_header if hasattr(self, '_m_header') else None

        _pos = self._io.pos()
        self._io.seek(0)
        self._m_header = AsusTrx.Header(self._io, self, self._root)
        self._io.seek(_pos)
        return self._m_header if hasattr(self, '_m_header') else None

    @property
    def tail(self):
        if hasattr(self, '_m_tail'):
            return self._m_tail if hasattr(self, '_m_tail') else None

        _pos = self._io.pos()
        self._io.seek((self._io.size() - 64))
        self._m_tail = AsusTrx.Tail(self._io, self, self._root)
        self._io.seek(_pos)
        return self._m_tail if hasattr(self, '_m_tail') else None


