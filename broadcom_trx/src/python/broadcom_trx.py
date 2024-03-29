# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class BroadcomTrx(KaitaiStruct):
    """.trx file format is widely used for distribution of firmware
    updates for Broadcom devices. The most well-known are ASUS routers.
    
    Fundamentally, it includes a footer which acts as a safeguard
    against installing a firmware package on a wrong hardware model or
    version, and a header which list numerous partitions packaged inside
    a single .trx file.
    
    trx files not necessarily contain all these headers.
    
    .. seealso::
       Source - https://github.com/openwrt/firmware-utils/blob/a2c80c5/src/trx.c
    
    
    .. seealso::
       Source - https://web.archive.org/web/20190127154419/https://openwrt.org/docs/techref/header
    
    
    .. seealso::
       Source - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
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
            self.version = BroadcomTrx.Version(self._io, self, self._root)
            self.product_id = (KaitaiStream.bytes_terminate(self._io.read_bytes(12), 0, False)).decode(u"utf-8")
            self.comp_hw = []
            for i in range(4):
                self.comp_hw.append(BroadcomTrx.Tail.HwCompInfo(self._io, self, self._root))

            self.reserved = self._io.read_bytes(32)

        class HwCompInfo(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.min = BroadcomTrx.Revision(self._io, self, self._root)
                self.max = BroadcomTrx.Revision(self._io, self, self._root)



    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x48\x44\x52\x30":
                raise kaitaistruct.ValidationNotEqualError(b"\x48\x44\x52\x30", self.magic, self._io, u"/types/header/seq/0")
            self.len = self._io.read_u4le()
            self.crc32 = self._io.read_u4le()
            self.version = self._io.read_u2le()
            self.flags = BroadcomTrx.Header.Flags(self._io, self, self._root)
            self.partitions = []
            i = 0
            while True:
                _ = BroadcomTrx.Header.Partition(i, self._io, self, self._root)
                self.partitions.append(_)
                if  ((i >= 4) or (not (_.is_present))) :
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
                self.ofs_body = self._io.read_u4le()

            @property
            def is_present(self):
                if hasattr(self, '_m_is_present'):
                    return self._m_is_present

                self._m_is_present = self.ofs_body != 0
                return getattr(self, '_m_is_present', None)

            @property
            def is_last(self):
                if hasattr(self, '_m_is_last'):
                    return self._m_is_last

                if self.is_present:
                    self._m_is_last =  ((self.idx == (len(self._parent.partitions) - 1)) or (not (self._parent.partitions[(self.idx + 1)].is_present))) 

                return getattr(self, '_m_is_last', None)

            @property
            def len_body(self):
                if hasattr(self, '_m_len_body'):
                    return self._m_len_body

                if self.is_present:
                    self._m_len_body = ((self._root._io.size() - self.ofs_body) if self.is_last else self._parent.partitions[(self.idx + 1)].ofs_body)

                return getattr(self, '_m_len_body', None)

            @property
            def body(self):
                if hasattr(self, '_m_body'):
                    return self._m_body

                if self.is_present:
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.ofs_body)
                    self._m_body = io.read_bytes(self.len_body)
                    io.seek(_pos)

                return getattr(self, '_m_body', None)


        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.flags = []
                for i in range(16):
                    self.flags.append(self._io.read_bits_int_le(1) != 0)




    @property
    def header(self):
        if hasattr(self, '_m_header'):
            return self._m_header

        _pos = self._io.pos()
        self._io.seek(0)
        self._m_header = BroadcomTrx.Header(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_header', None)

    @property
    def tail(self):
        if hasattr(self, '_m_tail'):
            return self._m_tail

        _pos = self._io.pos()
        self._io.seek((self._io.size() - 64))
        self._m_tail = BroadcomTrx.Tail(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_tail', None)


