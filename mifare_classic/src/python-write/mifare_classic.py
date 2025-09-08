# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MifareClassic(ReadWriteKaitaiStruct):
    """You can get a dump for testing from this link:
    <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
    
    .. seealso::
       Source - https://github.com/nfc-tools/libnfc
       https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MifareClassic, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self._raw_sectors = []
        self.sectors = []
        i = 0
        while not self._io.is_eof():
            self._raw_sectors.append(self._io.read_bytes(((4 if i >= 32 else 1) * 4) * 16))
            _io__raw_sectors = KaitaiStream(BytesIO(self._raw_sectors[-1]))
            _t_sectors = MifareClassic.Sector(i == 0, _io__raw_sectors, self, self._root)
            try:
                _t_sectors._read()
            finally:
                self.sectors.append(_t_sectors)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.sectors)):
            pass
            self.sectors[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(MifareClassic, self)._write__seq(io)
        self._raw_sectors = []
        for i in range(len(self.sectors)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"sectors", 0, self._io.size() - self._io.pos())
            _io__raw_sectors = KaitaiStream(BytesIO(bytearray(((4 if i >= 32 else 1) * 4) * 16)))
            self._io.add_child_stream(_io__raw_sectors)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (((4 if i >= 32 else 1) * 4) * 16))
            def handler(parent, _io__raw_sectors=_io__raw_sectors, i=i):
                self._raw_sectors.append(_io__raw_sectors.to_byte_array())
                if len(self._raw_sectors[i]) != ((4 if i >= 32 else 1) * 4) * 16:
                    raise kaitaistruct.ConsistencyError(u"raw(sectors)", ((4 if i >= 32 else 1) * 4) * 16, len(self._raw_sectors[i]))
                parent.write_bytes(self._raw_sectors[i])
            _io__raw_sectors.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.sectors[i]._write__seq(_io__raw_sectors)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"sectors", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.sectors)):
            pass
            if self.sectors[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"sectors", self._root, self.sectors[i]._root)
            if self.sectors[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"sectors", self, self.sectors[i]._parent)
            if self.sectors[i].has_manufacturer != (i == 0):
                raise kaitaistruct.ConsistencyError(u"sectors", i == 0, self.sectors[i].has_manufacturer)

        self._dirty = False

    class Key(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MifareClassic.Key, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.key = self._io.read_bytes(6)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MifareClassic.Key, self)._write__seq(io)
            self._io.write_bytes(self.key)


        def _check(self):
            if len(self.key) != 6:
                raise kaitaistruct.ConsistencyError(u"key", 6, len(self.key))
            self._dirty = False


    class Manufacturer(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MifareClassic.Manufacturer, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.nuid = self._io.read_u4le()
            self.bcc = self._io.read_u1()
            self.sak = self._io.read_u1()
            self.atqa = self._io.read_u2le()
            self.manufacturer = self._io.read_bytes(8)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MifareClassic.Manufacturer, self)._write__seq(io)
            self._io.write_u4le(self.nuid)
            self._io.write_u1(self.bcc)
            self._io.write_u1(self.sak)
            self._io.write_u2le(self.atqa)
            self._io.write_bytes(self.manufacturer)


        def _check(self):
            if len(self.manufacturer) != 8:
                raise kaitaistruct.ConsistencyError(u"manufacturer", 8, len(self.manufacturer))
            self._dirty = False


    class Sector(ReadWriteKaitaiStruct):
        def __init__(self, has_manufacturer, _io=None, _parent=None, _root=None):
            super(MifareClassic.Sector, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.has_manufacturer = has_manufacturer
            self._should_write_blocks = False
            self.blocks__enabled = True
            self._should_write_values = False
            self.values__enabled = True

        def _read(self):
            if self.has_manufacturer:
                pass
                self.manufacturer = MifareClassic.Manufacturer(self._io, self, self._root)
                self.manufacturer._read()

            self._raw_data_filler = self._io.read_bytes((self._io.size() - self._io.pos()) - 16)
            _io__raw_data_filler = KaitaiStream(BytesIO(self._raw_data_filler))
            self.data_filler = MifareClassic.Sector.Filler(_io__raw_data_filler, self, self._root)
            self.data_filler._read()
            self.trailer = MifareClassic.Trailer(self._io, self, self._root)
            self.trailer._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_manufacturer:
                pass
                self.manufacturer._fetch_instances()

            self.data_filler._fetch_instances()
            self.trailer._fetch_instances()
            _ = self.blocks
            if hasattr(self, '_m_blocks'):
                pass
                for i in range(len(self._m_blocks)):
                    pass


            _ = self.values
            if hasattr(self, '_m_values'):
                pass
                self._m_values._fetch_instances()



        def _write__seq(self, io=None):
            super(MifareClassic.Sector, self)._write__seq(io)
            self._should_write_blocks = self.blocks__enabled
            self._should_write_values = self.values__enabled
            if self.has_manufacturer:
                pass
                self.manufacturer._write__seq(self._io)

            _io__raw_data_filler = KaitaiStream(BytesIO(bytearray((self._io.size() - self._io.pos()) - 16)))
            self._io.add_child_stream(_io__raw_data_filler)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + ((self._io.size() - self._io.pos()) - 16))
            def handler(parent, _io__raw_data_filler=_io__raw_data_filler):
                self._raw_data_filler = _io__raw_data_filler.to_byte_array()
                if len(self._raw_data_filler) != (self._io.size() - self._io.pos()) - 16:
                    raise kaitaistruct.ConsistencyError(u"raw(data_filler)", (self._io.size() - self._io.pos()) - 16, len(self._raw_data_filler))
                parent.write_bytes(self._raw_data_filler)
            _io__raw_data_filler.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.data_filler._write__seq(_io__raw_data_filler)
            self.trailer._write__seq(self._io)


        def _check(self):
            if self.has_manufacturer:
                pass
                if self.manufacturer._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"manufacturer", self._root, self.manufacturer._root)
                if self.manufacturer._parent != self:
                    raise kaitaistruct.ConsistencyError(u"manufacturer", self, self.manufacturer._parent)

            if self.data_filler._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data_filler", self._root, self.data_filler._root)
            if self.data_filler._parent != self:
                raise kaitaistruct.ConsistencyError(u"data_filler", self, self.data_filler._parent)
            if self.trailer._root != self._root:
                raise kaitaistruct.ConsistencyError(u"trailer", self._root, self.trailer._root)
            if self.trailer._parent != self:
                raise kaitaistruct.ConsistencyError(u"trailer", self, self.trailer._parent)
            if self.blocks__enabled:
                pass
                for i in range(len(self._m_blocks)):
                    pass
                    if len(self._m_blocks[i]) != self.block_size:
                        raise kaitaistruct.ConsistencyError(u"blocks", self.block_size, len(self._m_blocks[i]))


            if self.values__enabled:
                pass
                if self._m_values._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"values", self._root, self._m_values._root)
                if self._m_values._parent != self:
                    raise kaitaistruct.ConsistencyError(u"values", self, self._m_values._parent)

            self._dirty = False

        class Filler(ReadWriteKaitaiStruct):
            """only to create _io."""
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MifareClassic.Sector.Filler, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.data = self._io.read_bytes(self._io.size())
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(MifareClassic.Sector.Filler, self)._write__seq(io)
                if len(self.data) != self._io.size():
                    raise kaitaistruct.ConsistencyError(u"data", self._io.size(), len(self.data))
                self._io.write_bytes(self.data)


            def _check(self):
                self._dirty = False


        class Values(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MifareClassic.Sector.Values, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.values = []
                i = 0
                while not self._io.is_eof():
                    _t_values = MifareClassic.Sector.Values.ValueBlock(self._io, self, self._root)
                    try:
                        _t_values._read()
                    finally:
                        self.values.append(_t_values)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.values)):
                    pass
                    self.values[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(MifareClassic.Sector.Values, self)._write__seq(io)
                for i in range(len(self.values)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())
                    self.values[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.values)):
                    pass
                    if self.values[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"values", self._root, self.values[i]._root)
                    if self.values[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"values", self, self.values[i]._parent)

                self._dirty = False

            class ValueBlock(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(MifareClassic.Sector.Values.ValueBlock, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.valuez = []
                    for i in range(3):
                        self.valuez.append(self._io.read_u4le())

                    self.addrz = []
                    for i in range(4):
                        self.addrz.append(self._io.read_u1())

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.valuez)):
                        pass

                    for i in range(len(self.addrz)):
                        pass



                def _write__seq(self, io=None):
                    super(MifareClassic.Sector.Values.ValueBlock, self)._write__seq(io)
                    for i in range(len(self.valuez)):
                        pass
                        self._io.write_u4le(self.valuez[i])

                    for i in range(len(self.addrz)):
                        pass
                        self._io.write_u1(self.addrz[i])



                def _check(self):
                    if len(self.valuez) != 3:
                        raise kaitaistruct.ConsistencyError(u"valuez", 3, len(self.valuez))
                    for i in range(len(self.valuez)):
                        pass

                    if len(self.addrz) != 4:
                        raise kaitaistruct.ConsistencyError(u"addrz", 4, len(self.addrz))
                    for i in range(len(self.addrz)):
                        pass

                    self._dirty = False

                @property
                def addr(self):
                    if hasattr(self, '_m_addr'):
                        return self._m_addr

                    if self.valid:
                        pass
                        self._m_addr = self.addrz[0]

                    return getattr(self, '_m_addr', None)

                def _invalidate_addr(self):
                    del self._m_addr
                @property
                def addr_valid(self):
                    if hasattr(self, '_m_addr_valid'):
                        return self._m_addr_valid

                    self._m_addr_valid =  ((self.addrz[0] == ~(self.addrz[1])) and (self.addrz[0] == self.addrz[2]) and (self.addrz[1] == self.addrz[3])) 
                    return getattr(self, '_m_addr_valid', None)

                def _invalidate_addr_valid(self):
                    del self._m_addr_valid
                @property
                def valid(self):
                    if hasattr(self, '_m_valid'):
                        return self._m_valid

                    self._m_valid =  ((self.value_valid) and (self.addr_valid)) 
                    return getattr(self, '_m_valid', None)

                def _invalidate_valid(self):
                    del self._m_valid
                @property
                def value(self):
                    if hasattr(self, '_m_value'):
                        return self._m_value

                    if self.valid:
                        pass
                        self._m_value = self.valuez[0]

                    return getattr(self, '_m_value', None)

                def _invalidate_value(self):
                    del self._m_value
                @property
                def value_valid(self):
                    if hasattr(self, '_m_value_valid'):
                        return self._m_value_valid

                    self._m_value_valid =  ((self.valuez[0] == ~(self.valuez[1])) and (self.valuez[0] == self.valuez[2])) 
                    return getattr(self, '_m_value_valid', None)

                def _invalidate_value_valid(self):
                    del self._m_value_valid


        @property
        def block_size(self):
            if hasattr(self, '_m_block_size'):
                return self._m_block_size

            self._m_block_size = 16
            return getattr(self, '_m_block_size', None)

        def _invalidate_block_size(self):
            del self._m_block_size
        @property
        def blocks(self):
            if self._should_write_blocks:
                self._write_blocks()
            if hasattr(self, '_m_blocks'):
                return self._m_blocks

            if not self.blocks__enabled:
                return None

            io = self.data_filler._io
            _pos = io.pos()
            io.seek(0)
            self._m_blocks = []
            i = 0
            while not io.is_eof():
                self._m_blocks.append(io.read_bytes(self.block_size))
                i += 1

            io.seek(_pos)
            return getattr(self, '_m_blocks', None)

        @blocks.setter
        def blocks(self, v):
            self._dirty = True
            self._m_blocks = v

        def _write_blocks(self):
            self._should_write_blocks = False
            io = self.data_filler._io
            _pos = io.pos()
            io.seek(0)
            for i in range(len(self._m_blocks)):
                pass
                if io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"blocks", 0, io.size() - io.pos())
                io.write_bytes(self._m_blocks[i])

            if not io.is_eof():
                raise kaitaistruct.ConsistencyError(u"blocks", 0, io.size() - io.pos())
            io.seek(_pos)

        @property
        def data(self):
            if hasattr(self, '_m_data'):
                return self._m_data

            self._m_data = self.data_filler.data
            return getattr(self, '_m_data', None)

        def _invalidate_data(self):
            del self._m_data
        @property
        def values(self):
            if self._should_write_values:
                self._write_values()
            if hasattr(self, '_m_values'):
                return self._m_values

            if not self.values__enabled:
                return None

            io = self.data_filler._io
            _pos = io.pos()
            io.seek(0)
            self._m_values = MifareClassic.Sector.Values(io, self, self._root)
            self._m_values._read()
            io.seek(_pos)
            return getattr(self, '_m_values', None)

        @values.setter
        def values(self, v):
            self._dirty = True
            self._m_values = v

        def _write_values(self):
            self._should_write_values = False
            io = self.data_filler._io
            _pos = io.pos()
            io.seek(0)
            self._m_values._write__seq(io)
            io.seek(_pos)


    class Trailer(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MifareClassic.Trailer, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.key_a = MifareClassic.Key(self._io, self, self._root)
            self.key_a._read()
            self._raw_access_bits = self._io.read_bytes(3)
            _io__raw_access_bits = KaitaiStream(BytesIO(self._raw_access_bits))
            self.access_bits = MifareClassic.Trailer.AccessConditions(_io__raw_access_bits, self, self._root)
            self.access_bits._read()
            self.user_byte = self._io.read_u1()
            self.key_b = MifareClassic.Key(self._io, self, self._root)
            self.key_b._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key_a._fetch_instances()
            self.access_bits._fetch_instances()
            self.key_b._fetch_instances()


        def _write__seq(self, io=None):
            super(MifareClassic.Trailer, self)._write__seq(io)
            self.key_a._write__seq(self._io)
            _io__raw_access_bits = KaitaiStream(BytesIO(bytearray(3)))
            self._io.add_child_stream(_io__raw_access_bits)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (3))
            def handler(parent, _io__raw_access_bits=_io__raw_access_bits):
                self._raw_access_bits = _io__raw_access_bits.to_byte_array()
                if len(self._raw_access_bits) != 3:
                    raise kaitaistruct.ConsistencyError(u"raw(access_bits)", 3, len(self._raw_access_bits))
                parent.write_bytes(self._raw_access_bits)
            _io__raw_access_bits.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.access_bits._write__seq(_io__raw_access_bits)
            self._io.write_u1(self.user_byte)
            self.key_b._write__seq(self._io)


        def _check(self):
            if self.key_a._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key_a", self._root, self.key_a._root)
            if self.key_a._parent != self:
                raise kaitaistruct.ConsistencyError(u"key_a", self, self.key_a._parent)
            if self.access_bits._root != self._root:
                raise kaitaistruct.ConsistencyError(u"access_bits", self._root, self.access_bits._root)
            if self.access_bits._parent != self:
                raise kaitaistruct.ConsistencyError(u"access_bits", self, self.access_bits._parent)
            if self.key_b._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key_b", self._root, self.key_b._root)
            if self.key_b._parent != self:
                raise kaitaistruct.ConsistencyError(u"key_b", self, self.key_b._parent)
            self._dirty = False

        class AccessConditions(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(MifareClassic.Trailer.AccessConditions, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_acs_raw = False
                self.acs_raw__enabled = True
                self._should_write_chunks = False
                self.chunks__enabled = True
                self._should_write_data_acs = False
                self.data_acs__enabled = True
                self._should_write_remaps = False
                self.remaps__enabled = True
                self._should_write_trailer_ac = False
                self.trailer_ac__enabled = True

            def _read(self):
                self.raw_chunks = []
                for i in range(self._parent.ac_count_of_chunks):
                    self.raw_chunks.append(self._io.read_bits_int_be(4))

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.raw_chunks)):
                    pass

                _ = self.acs_raw
                if hasattr(self, '_m_acs_raw'):
                    pass
                    for i in range(len(self._m_acs_raw)):
                        pass
                        self._m_acs_raw[i]._fetch_instances()


                _ = self.chunks
                if hasattr(self, '_m_chunks'):
                    pass
                    for i in range(len(self._m_chunks)):
                        pass
                        self._m_chunks[i]._fetch_instances()


                _ = self.data_acs
                if hasattr(self, '_m_data_acs'):
                    pass
                    for i in range(len(self._m_data_acs)):
                        pass
                        self._m_data_acs[i]._fetch_instances()


                _ = self.remaps
                if hasattr(self, '_m_remaps'):
                    pass
                    for i in range(len(self._m_remaps)):
                        pass
                        self._m_remaps[i]._fetch_instances()


                _ = self.trailer_ac
                if hasattr(self, '_m_trailer_ac'):
                    pass
                    self._m_trailer_ac._fetch_instances()



            def _write__seq(self, io=None):
                super(MifareClassic.Trailer.AccessConditions, self)._write__seq(io)
                self._should_write_acs_raw = self.acs_raw__enabled
                self._should_write_chunks = self.chunks__enabled
                self._should_write_data_acs = self.data_acs__enabled
                self._should_write_remaps = self.remaps__enabled
                self._should_write_trailer_ac = self.trailer_ac__enabled
                for i in range(len(self.raw_chunks)):
                    pass
                    self._io.write_bits_int_be(4, self.raw_chunks[i])



            def _check(self):
                if len(self.raw_chunks) != self._parent.ac_count_of_chunks:
                    raise kaitaistruct.ConsistencyError(u"raw_chunks", self._parent.ac_count_of_chunks, len(self.raw_chunks))
                for i in range(len(self.raw_chunks)):
                    pass

                if self.acs_raw__enabled:
                    pass
                    if len(self._m_acs_raw) != self._parent.acs_in_sector:
                        raise kaitaistruct.ConsistencyError(u"acs_raw", self._parent.acs_in_sector, len(self._m_acs_raw))
                    for i in range(len(self._m_acs_raw)):
                        pass
                        if self._m_acs_raw[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"acs_raw", self._root, self._m_acs_raw[i]._root)
                        if self._m_acs_raw[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"acs_raw", self, self._m_acs_raw[i]._parent)
                        if self._m_acs_raw[i].index != i:
                            raise kaitaistruct.ConsistencyError(u"acs_raw", i, self._m_acs_raw[i].index)


                if self.chunks__enabled:
                    pass
                    if len(self._m_chunks) != self._parent.ac_bits:
                        raise kaitaistruct.ConsistencyError(u"chunks", self._parent.ac_bits, len(self._m_chunks))
                    for i in range(len(self._m_chunks)):
                        pass
                        if self._m_chunks[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"chunks", self._root, self._m_chunks[i]._root)
                        if self._m_chunks[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"chunks", self, self._m_chunks[i]._parent)


                if self.data_acs__enabled:
                    pass
                    if len(self._m_data_acs) != self._parent.acs_in_sector - 1:
                        raise kaitaistruct.ConsistencyError(u"data_acs", self._parent.acs_in_sector - 1, len(self._m_data_acs))
                    for i in range(len(self._m_data_acs)):
                        pass
                        if self._m_data_acs[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data_acs", self._root, self._m_data_acs[i]._root)
                        if self._m_data_acs[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data_acs", self, self._m_data_acs[i]._parent)


                if self.remaps__enabled:
                    pass
                    if len(self._m_remaps) != self._parent.ac_bits:
                        raise kaitaistruct.ConsistencyError(u"remaps", self._parent.ac_bits, len(self._m_remaps))
                    for i in range(len(self._m_remaps)):
                        pass
                        if self._m_remaps[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"remaps", self._root, self._m_remaps[i]._root)
                        if self._m_remaps[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"remaps", self, self._m_remaps[i]._parent)
                        if self._m_remaps[i].bit_no != i:
                            raise kaitaistruct.ConsistencyError(u"remaps", i, self._m_remaps[i].bit_no)


                if self.trailer_ac__enabled:
                    pass
                    if self._m_trailer_ac._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"trailer_ac", self._root, self._m_trailer_ac._root)
                    if self._m_trailer_ac._parent != self:
                        raise kaitaistruct.ConsistencyError(u"trailer_ac", self, self._m_trailer_ac._parent)

                self._dirty = False

            class Ac(ReadWriteKaitaiStruct):
                def __init__(self, index, _io=None, _parent=None, _root=None):
                    super(MifareClassic.Trailer.AccessConditions.Ac, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self.index = index
                    self._should_write_bits = False
                    self.bits__enabled = True

                def _read(self):
                    pass
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _ = self.bits
                    if hasattr(self, '_m_bits'):
                        pass
                        for i in range(len(self._m_bits)):
                            pass
                            self._m_bits[i]._fetch_instances()




                def _write__seq(self, io=None):
                    super(MifareClassic.Trailer.AccessConditions.Ac, self)._write__seq(io)
                    self._should_write_bits = self.bits__enabled


                def _check(self):
                    if self.bits__enabled:
                        pass
                        if len(self._m_bits) != self._parent._parent.ac_bits:
                            raise kaitaistruct.ConsistencyError(u"bits", self._parent._parent.ac_bits, len(self._m_bits))
                        for i in range(len(self._m_bits)):
                            pass
                            if self._m_bits[i]._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"bits", self._root, self._m_bits[i]._root)
                            if self._m_bits[i]._parent != self:
                                raise kaitaistruct.ConsistencyError(u"bits", self, self._m_bits[i]._parent)
                            if self._m_bits[i].i != self.index:
                                raise kaitaistruct.ConsistencyError(u"bits", self.index, self._m_bits[i].i)
                            if self._m_bits[i].chunk != self._parent.chunks[i].chunk:
                                raise kaitaistruct.ConsistencyError(u"bits", self._parent.chunks[i].chunk, self._m_bits[i].chunk)


                    self._dirty = False

                class AcBit(ReadWriteKaitaiStruct):
                    def __init__(self, i, chunk, _io=None, _parent=None, _root=None):
                        super(MifareClassic.Trailer.AccessConditions.Ac.AcBit, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self.i = i
                        self.chunk = chunk

                    def _read(self):
                        pass
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(MifareClassic.Trailer.AccessConditions.Ac.AcBit, self)._write__seq(io)


                    def _check(self):
                        self._dirty = False

                    @property
                    def b(self):
                        if hasattr(self, '_m_b'):
                            return self._m_b

                        self._m_b = self.n == 1
                        return getattr(self, '_m_b', None)

                    def _invalidate_b(self):
                        del self._m_b
                    @property
                    def n(self):
                        if hasattr(self, '_m_n'):
                            return self._m_n

                        self._m_n = self.chunk >> self.i & 1
                        return getattr(self, '_m_n', None)

                    def _invalidate_n(self):
                        del self._m_n

                @property
                def bits(self):
                    if self._should_write_bits:
                        self._write_bits()
                    if hasattr(self, '_m_bits'):
                        return self._m_bits

                    if not self.bits__enabled:
                        return None

                    _pos = self._io.pos()
                    self._io.seek(0)
                    self._m_bits = []
                    for i in range(self._parent._parent.ac_bits):
                        _t__m_bits = MifareClassic.Trailer.AccessConditions.Ac.AcBit(self.index, self._parent.chunks[i].chunk, self._io, self, self._root)
                        try:
                            _t__m_bits._read()
                        finally:
                            self._m_bits.append(_t__m_bits)

                    self._io.seek(_pos)
                    return getattr(self, '_m_bits', None)

                @bits.setter
                def bits(self, v):
                    self._dirty = True
                    self._m_bits = v

                def _write_bits(self):
                    self._should_write_bits = False
                    _pos = self._io.pos()
                    self._io.seek(0)
                    for i in range(len(self._m_bits)):
                        pass
                        self._m_bits[i]._write__seq(self._io)

                    self._io.seek(_pos)

                @property
                def inv_shift_val(self):
                    if hasattr(self, '_m_inv_shift_val'):
                        return self._m_inv_shift_val

                    self._m_inv_shift_val = (self.bits[0].n << 2 | self.bits[1].n << 1) | self.bits[2].n
                    return getattr(self, '_m_inv_shift_val', None)

                def _invalidate_inv_shift_val(self):
                    del self._m_inv_shift_val
                @property
                def val(self):
                    """c3 c2 c1."""
                    if hasattr(self, '_m_val'):
                        return self._m_val

                    self._m_val = (self.bits[2].n << 2 | self.bits[1].n << 1) | self.bits[0].n
                    return getattr(self, '_m_val', None)

                def _invalidate_val(self):
                    del self._m_val

            class ChunkBitRemap(ReadWriteKaitaiStruct):
                def __init__(self, bit_no, _io=None, _parent=None, _root=None):
                    super(MifareClassic.Trailer.AccessConditions.ChunkBitRemap, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self.bit_no = bit_no

                def _read(self):
                    pass
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(MifareClassic.Trailer.AccessConditions.ChunkBitRemap, self)._write__seq(io)


                def _check(self):
                    self._dirty = False

                @property
                def chunk_no(self):
                    if hasattr(self, '_m_chunk_no'):
                        return self._m_chunk_no

                    self._m_chunk_no = ((self.inv_chunk_no + self.shift_value) + self._parent._parent.ac_count_of_chunks) % self._parent._parent.ac_count_of_chunks
                    return getattr(self, '_m_chunk_no', None)

                def _invalidate_chunk_no(self):
                    del self._m_chunk_no
                @property
                def inv_chunk_no(self):
                    if hasattr(self, '_m_inv_chunk_no'):
                        return self._m_inv_chunk_no

                    self._m_inv_chunk_no = self.bit_no + self.shift_value
                    return getattr(self, '_m_inv_chunk_no', None)

                def _invalidate_inv_chunk_no(self):
                    del self._m_inv_chunk_no
                @property
                def shift_value(self):
                    if hasattr(self, '_m_shift_value'):
                        return self._m_shift_value

                    self._m_shift_value = (-1 if self.bit_no == 1 else 1)
                    return getattr(self, '_m_shift_value', None)

                def _invalidate_shift_value(self):
                    del self._m_shift_value

            class DataAc(ReadWriteKaitaiStruct):
                def __init__(self, ac, _io=None, _parent=None, _root=None):
                    super(MifareClassic.Trailer.AccessConditions.DataAc, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self.ac = ac

                def _read(self):
                    pass
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(MifareClassic.Trailer.AccessConditions.DataAc, self)._write__seq(io)


                def _check(self):
                    self._dirty = False

                @property
                def decrement_available(self):
                    if hasattr(self, '_m_decrement_available'):
                        return self._m_decrement_available

                    self._m_decrement_available =  (( ((self.ac.bits[1].b) or ((not (self.ac.bits[0].b)))) ) and ((not (self.ac.bits[2].b)))) 
                    return getattr(self, '_m_decrement_available', None)

                def _invalidate_decrement_available(self):
                    del self._m_decrement_available
                @property
                def increment_available(self):
                    if hasattr(self, '_m_increment_available'):
                        return self._m_increment_available

                    self._m_increment_available =  (( (((not (self.ac.bits[0].b))) and ((not (self.read_key_a_required))) and ((not (self.read_key_b_required)))) ) or ( (((not (self.ac.bits[0].b))) and (self.read_key_a_required) and (self.read_key_b_required)) )) 
                    return getattr(self, '_m_increment_available', None)

                def _invalidate_increment_available(self):
                    del self._m_increment_available
                @property
                def read_key_a_required(self):
                    if hasattr(self, '_m_read_key_a_required'):
                        return self._m_read_key_a_required

                    self._m_read_key_a_required = self.ac.val <= 4
                    return getattr(self, '_m_read_key_a_required', None)

                def _invalidate_read_key_a_required(self):
                    del self._m_read_key_a_required
                @property
                def read_key_b_required(self):
                    if hasattr(self, '_m_read_key_b_required'):
                        return self._m_read_key_b_required

                    self._m_read_key_b_required = self.ac.val <= 6
                    return getattr(self, '_m_read_key_b_required', None)

                def _invalidate_read_key_b_required(self):
                    del self._m_read_key_b_required
                @property
                def write_key_a_required(self):
                    if hasattr(self, '_m_write_key_a_required'):
                        return self._m_write_key_a_required

                    self._m_write_key_a_required = self.ac.val == 0
                    return getattr(self, '_m_write_key_a_required', None)

                def _invalidate_write_key_a_required(self):
                    del self._m_write_key_a_required
                @property
                def write_key_b_required(self):
                    if hasattr(self, '_m_write_key_b_required'):
                        return self._m_write_key_b_required

                    self._m_write_key_b_required =  (( (((not (self.read_key_a_required))) or (self.read_key_b_required)) ) and ((not (self.ac.bits[0].b)))) 
                    return getattr(self, '_m_write_key_b_required', None)

                def _invalidate_write_key_b_required(self):
                    del self._m_write_key_b_required

            class TrailerAc(ReadWriteKaitaiStruct):
                def __init__(self, ac, _io=None, _parent=None, _root=None):
                    super(MifareClassic.Trailer.AccessConditions.TrailerAc, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self.ac = ac

                def _read(self):
                    pass
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(MifareClassic.Trailer.AccessConditions.TrailerAc, self)._write__seq(io)


                def _check(self):
                    self._dirty = False

                @property
                def can_read_key_b(self):
                    """key A is required."""
                    if hasattr(self, '_m_can_read_key_b'):
                        return self._m_can_read_key_b

                    self._m_can_read_key_b = self.ac.inv_shift_val <= 2
                    return getattr(self, '_m_can_read_key_b', None)

                def _invalidate_can_read_key_b(self):
                    del self._m_can_read_key_b
                @property
                def can_write_access_bits(self):
                    if hasattr(self, '_m_can_write_access_bits'):
                        return self._m_can_write_access_bits

                    self._m_can_write_access_bits = self.ac.bits[2].b
                    return getattr(self, '_m_can_write_access_bits', None)

                def _invalidate_can_write_access_bits(self):
                    del self._m_can_write_access_bits
                @property
                def can_write_keys(self):
                    if hasattr(self, '_m_can_write_keys'):
                        return self._m_can_write_keys

                    self._m_can_write_keys =  (((self.ac.inv_shift_val + 1) % 3 != 0) and (self.ac.inv_shift_val < 6)) 
                    return getattr(self, '_m_can_write_keys', None)

                def _invalidate_can_write_keys(self):
                    del self._m_can_write_keys
                @property
                def key_b_controls_write(self):
                    if hasattr(self, '_m_key_b_controls_write'):
                        return self._m_key_b_controls_write

                    self._m_key_b_controls_write = (not (self.can_read_key_b))
                    return getattr(self, '_m_key_b_controls_write', None)

                def _invalidate_key_b_controls_write(self):
                    del self._m_key_b_controls_write

            class ValidChunk(ReadWriteKaitaiStruct):
                def __init__(self, inv_chunk, chunk, _io=None, _parent=None, _root=None):
                    super(MifareClassic.Trailer.AccessConditions.ValidChunk, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self.inv_chunk = inv_chunk
                    self.chunk = chunk

                def _read(self):
                    pass
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(MifareClassic.Trailer.AccessConditions.ValidChunk, self)._write__seq(io)


                def _check(self):
                    self._dirty = False

                @property
                def valid(self):
                    if hasattr(self, '_m_valid'):
                        return self._m_valid

                    self._m_valid = self.inv_chunk ^ self.chunk == 15
                    return getattr(self, '_m_valid', None)

                def _invalidate_valid(self):
                    del self._m_valid

            @property
            def acs_raw(self):
                if self._should_write_acs_raw:
                    self._write_acs_raw()
                if hasattr(self, '_m_acs_raw'):
                    return self._m_acs_raw

                if not self.acs_raw__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_acs_raw = []
                for i in range(self._parent.acs_in_sector):
                    _t__m_acs_raw = MifareClassic.Trailer.AccessConditions.Ac(i, self._io, self, self._root)
                    try:
                        _t__m_acs_raw._read()
                    finally:
                        self._m_acs_raw.append(_t__m_acs_raw)

                self._io.seek(_pos)
                return getattr(self, '_m_acs_raw', None)

            @acs_raw.setter
            def acs_raw(self, v):
                self._dirty = True
                self._m_acs_raw = v

            def _write_acs_raw(self):
                self._should_write_acs_raw = False
                _pos = self._io.pos()
                self._io.seek(0)
                for i in range(len(self._m_acs_raw)):
                    pass
                    self._m_acs_raw[i]._write__seq(self._io)

                self._io.seek(_pos)

            @property
            def chunks(self):
                if self._should_write_chunks:
                    self._write_chunks()
                if hasattr(self, '_m_chunks'):
                    return self._m_chunks

                if not self.chunks__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_chunks = []
                for i in range(self._parent.ac_bits):
                    _t__m_chunks = MifareClassic.Trailer.AccessConditions.ValidChunk(self.raw_chunks[self.remaps[i].inv_chunk_no], self.raw_chunks[self.remaps[i].chunk_no], self._io, self, self._root)
                    try:
                        _t__m_chunks._read()
                    finally:
                        self._m_chunks.append(_t__m_chunks)

                self._io.seek(_pos)
                return getattr(self, '_m_chunks', None)

            @chunks.setter
            def chunks(self, v):
                self._dirty = True
                self._m_chunks = v

            def _write_chunks(self):
                self._should_write_chunks = False
                _pos = self._io.pos()
                self._io.seek(0)
                for i in range(len(self._m_chunks)):
                    pass
                    if self._m_chunks[i].inv_chunk != self.raw_chunks[self.remaps[i].inv_chunk_no]:
                        raise kaitaistruct.ConsistencyError(u"chunks", self.raw_chunks[self.remaps[i].inv_chunk_no], self._m_chunks[i].inv_chunk)
                    if self._m_chunks[i].chunk != self.raw_chunks[self.remaps[i].chunk_no]:
                        raise kaitaistruct.ConsistencyError(u"chunks", self.raw_chunks[self.remaps[i].chunk_no], self._m_chunks[i].chunk)
                    self._m_chunks[i]._write__seq(self._io)

                self._io.seek(_pos)

            @property
            def data_acs(self):
                if self._should_write_data_acs:
                    self._write_data_acs()
                if hasattr(self, '_m_data_acs'):
                    return self._m_data_acs

                if not self.data_acs__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_data_acs = []
                for i in range(self._parent.acs_in_sector - 1):
                    _t__m_data_acs = MifareClassic.Trailer.AccessConditions.DataAc(self.acs_raw[i], self._io, self, self._root)
                    try:
                        _t__m_data_acs._read()
                    finally:
                        self._m_data_acs.append(_t__m_data_acs)

                self._io.seek(_pos)
                return getattr(self, '_m_data_acs', None)

            @data_acs.setter
            def data_acs(self, v):
                self._dirty = True
                self._m_data_acs = v

            def _write_data_acs(self):
                self._should_write_data_acs = False
                _pos = self._io.pos()
                self._io.seek(0)
                for i in range(len(self._m_data_acs)):
                    pass
                    if self._m_data_acs[i].ac != self.acs_raw[i]:
                        raise kaitaistruct.ConsistencyError(u"data_acs", self.acs_raw[i], self._m_data_acs[i].ac)
                    self._m_data_acs[i]._write__seq(self._io)

                self._io.seek(_pos)

            @property
            def remaps(self):
                if self._should_write_remaps:
                    self._write_remaps()
                if hasattr(self, '_m_remaps'):
                    return self._m_remaps

                if not self.remaps__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_remaps = []
                for i in range(self._parent.ac_bits):
                    _t__m_remaps = MifareClassic.Trailer.AccessConditions.ChunkBitRemap(i, self._io, self, self._root)
                    try:
                        _t__m_remaps._read()
                    finally:
                        self._m_remaps.append(_t__m_remaps)

                self._io.seek(_pos)
                return getattr(self, '_m_remaps', None)

            @remaps.setter
            def remaps(self, v):
                self._dirty = True
                self._m_remaps = v

            def _write_remaps(self):
                self._should_write_remaps = False
                _pos = self._io.pos()
                self._io.seek(0)
                for i in range(len(self._m_remaps)):
                    pass
                    self._m_remaps[i]._write__seq(self._io)

                self._io.seek(_pos)

            @property
            def trailer_ac(self):
                if self._should_write_trailer_ac:
                    self._write_trailer_ac()
                if hasattr(self, '_m_trailer_ac'):
                    return self._m_trailer_ac

                if not self.trailer_ac__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_trailer_ac = MifareClassic.Trailer.AccessConditions.TrailerAc(self.acs_raw[self._parent.acs_in_sector - 1], self._io, self, self._root)
                self._m_trailer_ac._read()
                self._io.seek(_pos)
                return getattr(self, '_m_trailer_ac', None)

            @trailer_ac.setter
            def trailer_ac(self, v):
                self._dirty = True
                self._m_trailer_ac = v

            def _write_trailer_ac(self):
                self._should_write_trailer_ac = False
                _pos = self._io.pos()
                self._io.seek(0)
                if self._m_trailer_ac.ac != self.acs_raw[self._parent.acs_in_sector - 1]:
                    raise kaitaistruct.ConsistencyError(u"trailer_ac", self.acs_raw[self._parent.acs_in_sector - 1], self._m_trailer_ac.ac)
                self._m_trailer_ac._write__seq(self._io)
                self._io.seek(_pos)


        @property
        def ac_bits(self):
            if hasattr(self, '_m_ac_bits'):
                return self._m_ac_bits

            self._m_ac_bits = 3
            return getattr(self, '_m_ac_bits', None)

        def _invalidate_ac_bits(self):
            del self._m_ac_bits
        @property
        def ac_count_of_chunks(self):
            if hasattr(self, '_m_ac_count_of_chunks'):
                return self._m_ac_count_of_chunks

            self._m_ac_count_of_chunks = self.ac_bits * 2
            return getattr(self, '_m_ac_count_of_chunks', None)

        def _invalidate_ac_count_of_chunks(self):
            del self._m_ac_count_of_chunks
        @property
        def acs_in_sector(self):
            if hasattr(self, '_m_acs_in_sector'):
                return self._m_acs_in_sector

            self._m_acs_in_sector = 4
            return getattr(self, '_m_acs_in_sector', None)

        def _invalidate_acs_in_sector(self):
            del self._m_acs_in_sector


