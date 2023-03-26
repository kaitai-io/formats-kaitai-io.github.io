# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class MifareClassic(KaitaiStruct):
    """You can get a dump for testing from this link:
    <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
    
    .. seealso::
       Source - https://github.com/nfc-tools/libnfc
       https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self._raw_sectors = []
        self.sectors = []
        i = 0
        while not self._io.is_eof():
            self._raw_sectors.append(self._io.read_bytes((((4 if i >= 32 else 1) * 4) * 16)))
            _io__raw_sectors = KaitaiStream(BytesIO(self._raw_sectors[-1]))
            self.sectors.append(MifareClassic.Sector(i == 0, _io__raw_sectors, self, self._root))
            i += 1


    class Key(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.key = self._io.read_bytes(6)


    class Sector(KaitaiStruct):
        def __init__(self, has_manufacturer, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.has_manufacturer = has_manufacturer
            self._read()

        def _read(self):
            if self.has_manufacturer:
                self.manufacturer = MifareClassic.Manufacturer(self._io, self, self._root)

            self._raw_data_filler = self._io.read_bytes(((self._io.size() - self._io.pos()) - 16))
            _io__raw_data_filler = KaitaiStream(BytesIO(self._raw_data_filler))
            self.data_filler = MifareClassic.Sector.Filler(_io__raw_data_filler, self, self._root)
            self.trailer = MifareClassic.Trailer(self._io, self, self._root)

        class Values(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.values = []
                i = 0
                while not self._io.is_eof():
                    self.values.append(MifareClassic.Sector.Values.ValueBlock(self._io, self, self._root))
                    i += 1


            class ValueBlock(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.valuez = []
                    for i in range(3):
                        self.valuez.append(self._io.read_u4le())

                    self.addrz = []
                    for i in range(4):
                        self.addrz.append(self._io.read_u1())


                @property
                def addr(self):
                    if hasattr(self, '_m_addr'):
                        return self._m_addr

                    if self.valid:
                        self._m_addr = self.addrz[0]

                    return getattr(self, '_m_addr', None)

                @property
                def addr_valid(self):
                    if hasattr(self, '_m_addr_valid'):
                        return self._m_addr_valid

                    self._m_addr_valid =  ((self.addrz[0] == ~(self.addrz[1])) and (self.addrz[0] == self.addrz[2]) and (self.addrz[1] == self.addrz[3])) 
                    return getattr(self, '_m_addr_valid', None)

                @property
                def valid(self):
                    if hasattr(self, '_m_valid'):
                        return self._m_valid

                    self._m_valid =  ((self.value_valid) and (self.addr_valid)) 
                    return getattr(self, '_m_valid', None)

                @property
                def value_valid(self):
                    if hasattr(self, '_m_value_valid'):
                        return self._m_value_valid

                    self._m_value_valid =  ((self.valuez[0] == ~(self.valuez[1])) and (self.valuez[0] == self.valuez[2])) 
                    return getattr(self, '_m_value_valid', None)

                @property
                def value(self):
                    if hasattr(self, '_m_value'):
                        return self._m_value

                    if self.valid:
                        self._m_value = self.valuez[0]

                    return getattr(self, '_m_value', None)



        class Filler(KaitaiStruct):
            """only to create _io."""
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.data = self._io.read_bytes(self._io.size())


        @property
        def block_size(self):
            if hasattr(self, '_m_block_size'):
                return self._m_block_size

            self._m_block_size = 16
            return getattr(self, '_m_block_size', None)

        @property
        def data(self):
            if hasattr(self, '_m_data'):
                return self._m_data

            self._m_data = self.data_filler.data
            return getattr(self, '_m_data', None)

        @property
        def blocks(self):
            if hasattr(self, '_m_blocks'):
                return self._m_blocks

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

        @property
        def values(self):
            if hasattr(self, '_m_values'):
                return self._m_values

            io = self.data_filler._io
            _pos = io.pos()
            io.seek(0)
            self._m_values = MifareClassic.Sector.Values(io, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_values', None)


    class Manufacturer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.nuid = self._io.read_u4le()
            self.bcc = self._io.read_u1()
            self.sak = self._io.read_u1()
            self.atqa = self._io.read_u2le()
            self.manufacturer = self._io.read_bytes(8)


    class Trailer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.key_a = MifareClassic.Key(self._io, self, self._root)
            self._raw_access_bits = self._io.read_bytes(3)
            _io__raw_access_bits = KaitaiStream(BytesIO(self._raw_access_bits))
            self.access_bits = MifareClassic.Trailer.AccessConditions(_io__raw_access_bits, self, self._root)
            self.user_byte = self._io.read_u1()
            self.key_b = MifareClassic.Key(self._io, self, self._root)

        class AccessConditions(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.raw_chunks = []
                for i in range(self._parent.ac_count_of_chunks):
                    self.raw_chunks.append(self._io.read_bits_int_be(4))


            class TrailerAc(KaitaiStruct):
                def __init__(self, ac, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self.ac = ac
                    self._read()

                def _read(self):
                    pass

                @property
                def can_read_key_b(self):
                    """key A is required."""
                    if hasattr(self, '_m_can_read_key_b'):
                        return self._m_can_read_key_b

                    self._m_can_read_key_b = self.ac.inv_shift_val <= 2
                    return getattr(self, '_m_can_read_key_b', None)

                @property
                def can_write_keys(self):
                    if hasattr(self, '_m_can_write_keys'):
                        return self._m_can_write_keys

                    self._m_can_write_keys =  ((((self.ac.inv_shift_val + 1) % 3) != 0) and (self.ac.inv_shift_val < 6)) 
                    return getattr(self, '_m_can_write_keys', None)

                @property
                def can_write_access_bits(self):
                    if hasattr(self, '_m_can_write_access_bits'):
                        return self._m_can_write_access_bits

                    self._m_can_write_access_bits = self.ac.bits[2].b
                    return getattr(self, '_m_can_write_access_bits', None)

                @property
                def key_b_controls_write(self):
                    if hasattr(self, '_m_key_b_controls_write'):
                        return self._m_key_b_controls_write

                    self._m_key_b_controls_write = not (self.can_read_key_b)
                    return getattr(self, '_m_key_b_controls_write', None)


            class ChunkBitRemap(KaitaiStruct):
                def __init__(self, bit_no, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self.bit_no = bit_no
                    self._read()

                def _read(self):
                    pass

                @property
                def shift_value(self):
                    if hasattr(self, '_m_shift_value'):
                        return self._m_shift_value

                    self._m_shift_value = (-1 if self.bit_no == 1 else 1)
                    return getattr(self, '_m_shift_value', None)

                @property
                def chunk_no(self):
                    if hasattr(self, '_m_chunk_no'):
                        return self._m_chunk_no

                    self._m_chunk_no = (((self.inv_chunk_no + self.shift_value) + self._parent._parent.ac_count_of_chunks) % self._parent._parent.ac_count_of_chunks)
                    return getattr(self, '_m_chunk_no', None)

                @property
                def inv_chunk_no(self):
                    if hasattr(self, '_m_inv_chunk_no'):
                        return self._m_inv_chunk_no

                    self._m_inv_chunk_no = (self.bit_no + self.shift_value)
                    return getattr(self, '_m_inv_chunk_no', None)


            class DataAc(KaitaiStruct):
                def __init__(self, ac, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self.ac = ac
                    self._read()

                def _read(self):
                    pass

                @property
                def read_key_a_required(self):
                    if hasattr(self, '_m_read_key_a_required'):
                        return self._m_read_key_a_required

                    self._m_read_key_a_required = self.ac.val <= 4
                    return getattr(self, '_m_read_key_a_required', None)

                @property
                def write_key_b_required(self):
                    if hasattr(self, '_m_write_key_b_required'):
                        return self._m_write_key_b_required

                    self._m_write_key_b_required =  (( ((not (self.read_key_a_required)) or (self.read_key_b_required)) ) and (not (self.ac.bits[0].b))) 
                    return getattr(self, '_m_write_key_b_required', None)

                @property
                def write_key_a_required(self):
                    if hasattr(self, '_m_write_key_a_required'):
                        return self._m_write_key_a_required

                    self._m_write_key_a_required = self.ac.val == 0
                    return getattr(self, '_m_write_key_a_required', None)

                @property
                def read_key_b_required(self):
                    if hasattr(self, '_m_read_key_b_required'):
                        return self._m_read_key_b_required

                    self._m_read_key_b_required = self.ac.val <= 6
                    return getattr(self, '_m_read_key_b_required', None)

                @property
                def decrement_available(self):
                    if hasattr(self, '_m_decrement_available'):
                        return self._m_decrement_available

                    self._m_decrement_available =  (( ((self.ac.bits[1].b) or (not (self.ac.bits[0].b))) ) and (not (self.ac.bits[2].b))) 
                    return getattr(self, '_m_decrement_available', None)

                @property
                def increment_available(self):
                    if hasattr(self, '_m_increment_available'):
                        return self._m_increment_available

                    self._m_increment_available =  (( ((not (self.ac.bits[0].b)) and (not (self.read_key_a_required)) and (not (self.read_key_b_required))) ) or ( ((not (self.ac.bits[0].b)) and (self.read_key_a_required) and (self.read_key_b_required)) )) 
                    return getattr(self, '_m_increment_available', None)


            class Ac(KaitaiStruct):
                def __init__(self, index, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self.index = index
                    self._read()

                def _read(self):
                    pass

                class AcBit(KaitaiStruct):
                    def __init__(self, i, chunk, _io, _parent=None, _root=None):
                        self._io = _io
                        self._parent = _parent
                        self._root = _root if _root else self
                        self.i = i
                        self.chunk = chunk
                        self._read()

                    def _read(self):
                        pass

                    @property
                    def n(self):
                        if hasattr(self, '_m_n'):
                            return self._m_n

                        self._m_n = ((self.chunk >> self.i) & 1)
                        return getattr(self, '_m_n', None)

                    @property
                    def b(self):
                        if hasattr(self, '_m_b'):
                            return self._m_b

                        self._m_b = self.n == 1
                        return getattr(self, '_m_b', None)


                @property
                def bits(self):
                    if hasattr(self, '_m_bits'):
                        return self._m_bits

                    _pos = self._io.pos()
                    self._io.seek(0)
                    self._m_bits = []
                    for i in range(self._parent._parent.ac_bits):
                        self._m_bits.append(MifareClassic.Trailer.AccessConditions.Ac.AcBit(self.index, self._parent.chunks[i].chunk, self._io, self, self._root))

                    self._io.seek(_pos)
                    return getattr(self, '_m_bits', None)

                @property
                def val(self):
                    """c3 c2 c1."""
                    if hasattr(self, '_m_val'):
                        return self._m_val

                    self._m_val = (((self.bits[2].n << 2) | (self.bits[1].n << 1)) | self.bits[0].n)
                    return getattr(self, '_m_val', None)

                @property
                def inv_shift_val(self):
                    if hasattr(self, '_m_inv_shift_val'):
                        return self._m_inv_shift_val

                    self._m_inv_shift_val = (((self.bits[0].n << 2) | (self.bits[1].n << 1)) | self.bits[2].n)
                    return getattr(self, '_m_inv_shift_val', None)


            class ValidChunk(KaitaiStruct):
                def __init__(self, inv_chunk, chunk, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self.inv_chunk = inv_chunk
                    self.chunk = chunk
                    self._read()

                def _read(self):
                    pass

                @property
                def valid(self):
                    if hasattr(self, '_m_valid'):
                        return self._m_valid

                    self._m_valid = (self.inv_chunk ^ self.chunk) == 15
                    return getattr(self, '_m_valid', None)


            @property
            def data_acs(self):
                if hasattr(self, '_m_data_acs'):
                    return self._m_data_acs

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_data_acs = []
                for i in range((self._parent.acs_in_sector - 1)):
                    self._m_data_acs.append(MifareClassic.Trailer.AccessConditions.DataAc(self.acs_raw[i], self._io, self, self._root))

                self._io.seek(_pos)
                return getattr(self, '_m_data_acs', None)

            @property
            def remaps(self):
                if hasattr(self, '_m_remaps'):
                    return self._m_remaps

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_remaps = []
                for i in range(self._parent.ac_bits):
                    self._m_remaps.append(MifareClassic.Trailer.AccessConditions.ChunkBitRemap(i, self._io, self, self._root))

                self._io.seek(_pos)
                return getattr(self, '_m_remaps', None)

            @property
            def acs_raw(self):
                if hasattr(self, '_m_acs_raw'):
                    return self._m_acs_raw

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_acs_raw = []
                for i in range(self._parent.acs_in_sector):
                    self._m_acs_raw.append(MifareClassic.Trailer.AccessConditions.Ac(i, self._io, self, self._root))

                self._io.seek(_pos)
                return getattr(self, '_m_acs_raw', None)

            @property
            def trailer_ac(self):
                if hasattr(self, '_m_trailer_ac'):
                    return self._m_trailer_ac

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_trailer_ac = MifareClassic.Trailer.AccessConditions.TrailerAc(self.acs_raw[(self._parent.acs_in_sector - 1)], self._io, self, self._root)
                self._io.seek(_pos)
                return getattr(self, '_m_trailer_ac', None)

            @property
            def chunks(self):
                if hasattr(self, '_m_chunks'):
                    return self._m_chunks

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_chunks = []
                for i in range(self._parent.ac_bits):
                    self._m_chunks.append(MifareClassic.Trailer.AccessConditions.ValidChunk(self.raw_chunks[self.remaps[i].inv_chunk_no], self.raw_chunks[self.remaps[i].chunk_no], self._io, self, self._root))

                self._io.seek(_pos)
                return getattr(self, '_m_chunks', None)


        @property
        def ac_bits(self):
            if hasattr(self, '_m_ac_bits'):
                return self._m_ac_bits

            self._m_ac_bits = 3
            return getattr(self, '_m_ac_bits', None)

        @property
        def acs_in_sector(self):
            if hasattr(self, '_m_acs_in_sector'):
                return self._m_acs_in_sector

            self._m_acs_in_sector = 4
            return getattr(self, '_m_acs_in_sector', None)

        @property
        def ac_count_of_chunks(self):
            if hasattr(self, '_m_ac_count_of_chunks'):
                return self._m_ac_count_of_chunks

            self._m_ac_count_of_chunks = (self.ac_bits * 2)
            return getattr(self, '_m_ac_count_of_chunks', None)



