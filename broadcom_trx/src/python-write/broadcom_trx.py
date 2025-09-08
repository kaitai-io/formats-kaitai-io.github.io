# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class BroadcomTrx(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(BroadcomTrx, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_header = False
        self.header__enabled = True
        self._should_write_tail = False
        self.tail__enabled = True

    def _read(self):
        pass
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.header
        if hasattr(self, '_m_header'):
            pass
            self._m_header._fetch_instances()

        _ = self.tail
        if hasattr(self, '_m_tail'):
            pass
            self._m_tail._fetch_instances()



    def _write__seq(self, io=None):
        super(BroadcomTrx, self)._write__seq(io)
        self._should_write_header = self.header__enabled
        self._should_write_tail = self.tail__enabled


    def _check(self):
        if self.header__enabled:
            pass
            if self._m_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self._m_header._root)
            if self._m_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self._m_header._parent)

        if self.tail__enabled:
            pass
            if self._m_tail._root != self._root:
                raise kaitaistruct.ConsistencyError(u"tail", self._root, self._m_tail._root)
            if self._m_tail._parent != self:
                raise kaitaistruct.ConsistencyError(u"tail", self, self._m_tail._parent)

        self._dirty = False

    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BroadcomTrx.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x48\x44\x52\x30":
                raise kaitaistruct.ValidationNotEqualError(b"\x48\x44\x52\x30", self.magic, self._io, u"/types/header/seq/0")
            self.len = self._io.read_u4le()
            self.crc32 = self._io.read_u4le()
            self.version = self._io.read_u2le()
            self.flags = BroadcomTrx.Header.Flags(self._io, self, self._root)
            self.flags._read()
            self.partitions = []
            i = 0
            while True:
                _t_partitions = BroadcomTrx.Header.Partition(i, self._io, self, self._root)
                try:
                    _t_partitions._read()
                finally:
                    _ = _t_partitions
                    self.partitions.append(_)
                if  ((i >= 4) or ((not (_.is_present)))) :
                    break
                i += 1
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            for i in range(len(self.partitions)):
                pass
                self.partitions[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(BroadcomTrx.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.len)
            self._io.write_u4le(self.crc32)
            self._io.write_u2le(self.version)
            self.flags._write__seq(self._io)
            for i in range(len(self.partitions)):
                pass
                self.partitions[i]._write__seq(self._io)



        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x48\x44\x52\x30":
                raise kaitaistruct.ValidationNotEqualError(b"\x48\x44\x52\x30", self.magic, None, u"/types/header/seq/0")
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len(self.partitions) == 0:
                raise kaitaistruct.ConsistencyError(u"partitions", 0, len(self.partitions))
            for i in range(len(self.partitions)):
                pass
                if self.partitions[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"partitions", self._root, self.partitions[i]._root)
                if self.partitions[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"partitions", self, self.partitions[i]._parent)
                if self.partitions[i].idx != i:
                    raise kaitaistruct.ConsistencyError(u"partitions", i, self.partitions[i].idx)
                _ = self.partitions[i]
                if  ((i >= 4) or ((not (_.is_present))))  != (i == len(self.partitions) - 1):
                    raise kaitaistruct.ConsistencyError(u"partitions", i == len(self.partitions) - 1,  ((i >= 4) or ((not (_.is_present)))) )

            self._dirty = False

        class Flags(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(BroadcomTrx.Header.Flags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.flags = []
                for i in range(16):
                    self.flags.append(self._io.read_bits_int_le(1) != 0)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.flags)):
                    pass



            def _write__seq(self, io=None):
                super(BroadcomTrx.Header.Flags, self)._write__seq(io)
                for i in range(len(self.flags)):
                    pass
                    self._io.write_bits_int_le(1, int(self.flags[i]))



            def _check(self):
                if len(self.flags) != 16:
                    raise kaitaistruct.ConsistencyError(u"flags", 16, len(self.flags))
                for i in range(len(self.flags)):
                    pass

                self._dirty = False


        class Partition(ReadWriteKaitaiStruct):
            def __init__(self, idx, _io=None, _parent=None, _root=None):
                super(BroadcomTrx.Header.Partition, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self.idx = idx
                self._should_write_body = False
                self.body__enabled = True

            def _read(self):
                self.ofs_body = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.body
                if hasattr(self, '_m_body'):
                    pass



            def _write__seq(self, io=None):
                super(BroadcomTrx.Header.Partition, self)._write__seq(io)
                self._should_write_body = self.body__enabled
                self._io.write_u4le(self.ofs_body)


            def _check(self):
                if self.body__enabled:
                    pass
                    if self.is_present:
                        pass


                self._dirty = False

            @property
            def body(self):
                if self._should_write_body:
                    self._write_body()
                if hasattr(self, '_m_body'):
                    return self._m_body

                if not self.body__enabled:
                    return None

                if self.is_present:
                    pass
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.ofs_body)
                    self._m_body = io.read_bytes(self.len_body)
                    io.seek(_pos)

                return getattr(self, '_m_body', None)

            @body.setter
            def body(self, v):
                self._dirty = True
                self._m_body = v

            def _write_body(self):
                self._should_write_body = False
                if self.is_present:
                    pass
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.ofs_body)
                    if len(self._m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self._m_body))
                    io.write_bytes(self._m_body)
                    io.seek(_pos)


            @property
            def is_last(self):
                if hasattr(self, '_m_is_last'):
                    return self._m_is_last

                if self.is_present:
                    pass
                    self._m_is_last =  ((self.idx == len(self._parent.partitions) - 1) or ((not (self._parent.partitions[self.idx + 1].is_present)))) 

                return getattr(self, '_m_is_last', None)

            def _invalidate_is_last(self):
                del self._m_is_last
            @property
            def is_present(self):
                if hasattr(self, '_m_is_present'):
                    return self._m_is_present

                self._m_is_present = self.ofs_body != 0
                return getattr(self, '_m_is_present', None)

            def _invalidate_is_present(self):
                del self._m_is_present
            @property
            def len_body(self):
                if hasattr(self, '_m_len_body'):
                    return self._m_len_body

                if self.is_present:
                    pass
                    self._m_len_body = (self._root._io.size() - self.ofs_body if self.is_last else self._parent.partitions[self.idx + 1].ofs_body)

                return getattr(self, '_m_len_body', None)

            def _invalidate_len_body(self):
                del self._m_len_body


    class Revision(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BroadcomTrx.Revision, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.major = self._io.read_u1()
            self.minor = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(BroadcomTrx.Revision, self)._write__seq(io)
            self._io.write_u1(self.major)
            self._io.write_u1(self.minor)


        def _check(self):
            self._dirty = False


    class Tail(ReadWriteKaitaiStruct):
        """A safeguard against installation of firmware to an incompatible device."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BroadcomTrx.Tail, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = BroadcomTrx.Version(self._io, self, self._root)
            self.version._read()
            self.product_id = (KaitaiStream.bytes_terminate(self._io.read_bytes(12), 0, False)).decode(u"UTF-8")
            self.comp_hw = []
            for i in range(4):
                _t_comp_hw = BroadcomTrx.Tail.HwCompInfo(self._io, self, self._root)
                try:
                    _t_comp_hw._read()
                finally:
                    self.comp_hw.append(_t_comp_hw)

            self.reserved = self._io.read_bytes(32)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()
            for i in range(len(self.comp_hw)):
                pass
                self.comp_hw[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(BroadcomTrx.Tail, self)._write__seq(io)
            self.version._write__seq(self._io)
            self._io.write_bytes_limit((self.product_id).encode(u"UTF-8"), 12, 0, 0)
            for i in range(len(self.comp_hw)):
                pass
                self.comp_hw[i]._write__seq(self._io)

            self._io.write_bytes(self.reserved)


        def _check(self):
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if len((self.product_id).encode(u"UTF-8")) > 12:
                raise kaitaistruct.ConsistencyError(u"product_id", 12, len((self.product_id).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.product_id).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"product_id", -1, KaitaiStream.byte_array_index_of((self.product_id).encode(u"UTF-8"), 0))
            if len(self.comp_hw) != 4:
                raise kaitaistruct.ConsistencyError(u"comp_hw", 4, len(self.comp_hw))
            for i in range(len(self.comp_hw)):
                pass
                if self.comp_hw[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"comp_hw", self._root, self.comp_hw[i]._root)
                if self.comp_hw[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"comp_hw", self, self.comp_hw[i]._parent)

            if len(self.reserved) != 32:
                raise kaitaistruct.ConsistencyError(u"reserved", 32, len(self.reserved))
            self._dirty = False

        class HwCompInfo(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(BroadcomTrx.Tail.HwCompInfo, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.min = BroadcomTrx.Revision(self._io, self, self._root)
                self.min._read()
                self.max = BroadcomTrx.Revision(self._io, self, self._root)
                self.max._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.min._fetch_instances()
                self.max._fetch_instances()


            def _write__seq(self, io=None):
                super(BroadcomTrx.Tail.HwCompInfo, self)._write__seq(io)
                self.min._write__seq(self._io)
                self.max._write__seq(self._io)


            def _check(self):
                if self.min._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"min", self._root, self.min._root)
                if self.min._parent != self:
                    raise kaitaistruct.ConsistencyError(u"min", self, self.min._parent)
                if self.max._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"max", self._root, self.max._root)
                if self.max._parent != self:
                    raise kaitaistruct.ConsistencyError(u"max", self, self.max._parent)
                self._dirty = False



    class Version(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BroadcomTrx.Version, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.major = self._io.read_u1()
            self.minor = self._io.read_u1()
            self.patch = self._io.read_u1()
            self.tweak = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(BroadcomTrx.Version, self)._write__seq(io)
            self._io.write_u1(self.major)
            self._io.write_u1(self.minor)
            self._io.write_u1(self.patch)
            self._io.write_u1(self.tweak)


        def _check(self):
            self._dirty = False


    @property
    def header(self):
        if self._should_write_header:
            self._write_header()
        if hasattr(self, '_m_header'):
            return self._m_header

        if not self.header__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(0)
        self._m_header = BroadcomTrx.Header(self._io, self, self._root)
        self._m_header._read()
        self._io.seek(_pos)
        return getattr(self, '_m_header', None)

    @header.setter
    def header(self, v):
        self._dirty = True
        self._m_header = v

    def _write_header(self):
        self._should_write_header = False
        _pos = self._io.pos()
        self._io.seek(0)
        self._m_header._write__seq(self._io)
        self._io.seek(_pos)

    @property
    def tail(self):
        if self._should_write_tail:
            self._write_tail()
        if hasattr(self, '_m_tail'):
            return self._m_tail

        if not self.tail__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self._io.size() - 64)
        self._m_tail = BroadcomTrx.Tail(self._io, self, self._root)
        self._m_tail._read()
        self._io.seek(_pos)
        return getattr(self, '_m_tail', None)

    @tail.setter
    def tail(self, v):
        self._dirty = True
        self._m_tail = v

    def _write_tail(self):
        self._should_write_tail = False
        _pos = self._io.pos()
        self._io.seek(self._io.size() - 64)
        self._m_tail._write__seq(self._io)
        self._io.seek(_pos)


