# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Msgpack(KaitaiStruct):
    """MessagePack (msgpack) is a system to serialize arbitrary structured
    data into a compact binary stream.
    
    .. seealso::
       Source - https://github.com/msgpack/msgpack/blob/master/spec.md
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.b1 = self._io.read_u1()
        _on = self.b1
        if _on == 211:
            self.int_extra = self._io.read_s8be()
        elif _on == 209:
            self.int_extra = self._io.read_s2be()
        elif _on == 210:
            self.int_extra = self._io.read_s4be()
        elif _on == 208:
            self.int_extra = self._io.read_s1()
        elif _on == 205:
            self.int_extra = self._io.read_u2be()
        elif _on == 207:
            self.int_extra = self._io.read_u8be()
        elif _on == 204:
            self.int_extra = self._io.read_u1()
        elif _on == 206:
            self.int_extra = self._io.read_u4be()
        if self.is_float_32:
            self.float_32_value = self._io.read_f4be()

        if self.is_float_64:
            self.float_64_value = self._io.read_f8be()

        if self.is_str_8:
            self.str_len_8 = self._io.read_u1()

        if self.is_str_16:
            self.str_len_16 = self._io.read_u2be()

        if self.is_str_32:
            self.str_len_32 = self._io.read_u4be()

        if self.is_str:
            self.str_value = (self._io.read_bytes(self.str_len)).decode(u"UTF-8")

        if self.is_array_16:
            self.num_array_elements_16 = self._io.read_u2be()

        if self.is_array_32:
            self.num_array_elements_32 = self._io.read_u4be()

        if self.is_array:
            self.array_elements = []
            for i in range(self.num_array_elements):
                self.array_elements.append(Msgpack(self._io))


        if self.is_map_16:
            self.num_map_elements_16 = self._io.read_u2be()

        if self.is_map_32:
            self.num_map_elements_32 = self._io.read_u4be()

        if self.is_map:
            self.map_elements = []
            for i in range(self.num_map_elements):
                self.map_elements.append(Msgpack.MapTuple(self._io, self, self._root))



    class MapTuple(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.key = Msgpack(self._io)
            self.value = Msgpack(self._io)


    @property
    def is_array_32(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array
        """
        if hasattr(self, '_m_is_array_32'):
            return self._m_is_array_32

        self._m_is_array_32 = self.b1 == 221
        return getattr(self, '_m_is_array_32', None)

    @property
    def int_value(self):
        if hasattr(self, '_m_int_value'):
            return self._m_int_value

        if self.is_int:
            self._m_int_value = (self.pos_int7_value if self.is_pos_int7 else (self.neg_int5_value if self.is_neg_int5 else 4919))

        return getattr(self, '_m_int_value', None)

    @property
    def str_len(self):
        if hasattr(self, '_m_str_len'):
            return self._m_str_len

        if self.is_str:
            self._m_str_len = ((self.b1 & 31) if self.is_fix_str else (self.str_len_8 if self.is_str_8 else (self.str_len_16 if self.is_str_16 else self.str_len_32)))

        return getattr(self, '_m_str_len', None)

    @property
    def is_fix_array(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array
        """
        if hasattr(self, '_m_is_fix_array'):
            return self._m_is_fix_array

        self._m_is_fix_array = (self.b1 & 240) == 144
        return getattr(self, '_m_is_fix_array', None)

    @property
    def is_map(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map
        """
        if hasattr(self, '_m_is_map'):
            return self._m_is_map

        self._m_is_map =  ((self.is_fix_map) or (self.is_map_16) or (self.is_map_32)) 
        return getattr(self, '_m_is_map', None)

    @property
    def is_array(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array
        """
        if hasattr(self, '_m_is_array'):
            return self._m_is_array

        self._m_is_array =  ((self.is_fix_array) or (self.is_array_16) or (self.is_array_32)) 
        return getattr(self, '_m_is_array', None)

    @property
    def is_float(self):
        if hasattr(self, '_m_is_float'):
            return self._m_is_float

        self._m_is_float =  ((self.is_float_32) or (self.is_float_64)) 
        return getattr(self, '_m_is_float', None)

    @property
    def is_str_8(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str
        """
        if hasattr(self, '_m_is_str_8'):
            return self._m_is_str_8

        self._m_is_str_8 = self.b1 == 217
        return getattr(self, '_m_is_str_8', None)

    @property
    def is_fix_map(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map
        """
        if hasattr(self, '_m_is_fix_map'):
            return self._m_is_fix_map

        self._m_is_fix_map = (self.b1 & 240) == 128
        return getattr(self, '_m_is_fix_map', None)

    @property
    def is_int(self):
        if hasattr(self, '_m_is_int'):
            return self._m_is_int

        self._m_is_int =  ((self.is_pos_int7) or (self.is_neg_int5)) 
        return getattr(self, '_m_is_int', None)

    @property
    def is_bool(self):
        if hasattr(self, '_m_is_bool'):
            return self._m_is_bool

        self._m_is_bool =  ((self.b1 == 194) or (self.b1 == 195)) 
        return getattr(self, '_m_is_bool', None)

    @property
    def is_str_16(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str
        """
        if hasattr(self, '_m_is_str_16'):
            return self._m_is_str_16

        self._m_is_str_16 = self.b1 == 218
        return getattr(self, '_m_is_str_16', None)

    @property
    def is_float_64(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float
        """
        if hasattr(self, '_m_is_float_64'):
            return self._m_is_float_64

        self._m_is_float_64 = self.b1 == 203
        return getattr(self, '_m_is_float_64', None)

    @property
    def is_map_16(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map
        """
        if hasattr(self, '_m_is_map_16'):
            return self._m_is_map_16

        self._m_is_map_16 = self.b1 == 222
        return getattr(self, '_m_is_map_16', None)

    @property
    def is_neg_int5(self):
        if hasattr(self, '_m_is_neg_int5'):
            return self._m_is_neg_int5

        self._m_is_neg_int5 = (self.b1 & 224) == 224
        return getattr(self, '_m_is_neg_int5', None)

    @property
    def pos_int7_value(self):
        if hasattr(self, '_m_pos_int7_value'):
            return self._m_pos_int7_value

        if self.is_pos_int7:
            self._m_pos_int7_value = self.b1

        return getattr(self, '_m_pos_int7_value', None)

    @property
    def is_nil(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil
        """
        if hasattr(self, '_m_is_nil'):
            return self._m_is_nil

        self._m_is_nil = self.b1 == 192
        return getattr(self, '_m_is_nil', None)

    @property
    def float_value(self):
        if hasattr(self, '_m_float_value'):
            return self._m_float_value

        if self.is_float:
            self._m_float_value = (self.float_32_value if self.is_float_32 else self.float_64_value)

        return getattr(self, '_m_float_value', None)

    @property
    def num_array_elements(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array
        """
        if hasattr(self, '_m_num_array_elements'):
            return self._m_num_array_elements

        if self.is_array:
            self._m_num_array_elements = ((self.b1 & 15) if self.is_fix_array else (self.num_array_elements_16 if self.is_array_16 else self.num_array_elements_32))

        return getattr(self, '_m_num_array_elements', None)

    @property
    def neg_int5_value(self):
        if hasattr(self, '_m_neg_int5_value'):
            return self._m_neg_int5_value

        if self.is_neg_int5:
            self._m_neg_int5_value = -((self.b1 & 31))

        return getattr(self, '_m_neg_int5_value', None)

    @property
    def bool_value(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool
        """
        if hasattr(self, '_m_bool_value'):
            return self._m_bool_value

        if self.is_bool:
            self._m_bool_value = self.b1 == 195

        return getattr(self, '_m_bool_value', None)

    @property
    def is_pos_int7(self):
        if hasattr(self, '_m_is_pos_int7'):
            return self._m_is_pos_int7

        self._m_is_pos_int7 = (self.b1 & 128) == 0
        return getattr(self, '_m_is_pos_int7', None)

    @property
    def is_array_16(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array
        """
        if hasattr(self, '_m_is_array_16'):
            return self._m_is_array_16

        self._m_is_array_16 = self.b1 == 220
        return getattr(self, '_m_is_array_16', None)

    @property
    def is_str(self):
        if hasattr(self, '_m_is_str'):
            return self._m_is_str

        self._m_is_str =  ((self.is_fix_str) or (self.is_str_8) or (self.is_str_16) or (self.is_str_32)) 
        return getattr(self, '_m_is_str', None)

    @property
    def is_fix_str(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str
        """
        if hasattr(self, '_m_is_fix_str'):
            return self._m_is_fix_str

        self._m_is_fix_str = (self.b1 & 224) == 160
        return getattr(self, '_m_is_fix_str', None)

    @property
    def is_str_32(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str
        """
        if hasattr(self, '_m_is_str_32'):
            return self._m_is_str_32

        self._m_is_str_32 = self.b1 == 219
        return getattr(self, '_m_is_str_32', None)

    @property
    def num_map_elements(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map
        """
        if hasattr(self, '_m_num_map_elements'):
            return self._m_num_map_elements

        if self.is_map:
            self._m_num_map_elements = ((self.b1 & 15) if self.is_fix_map else (self.num_map_elements_16 if self.is_map_16 else self.num_map_elements_32))

        return getattr(self, '_m_num_map_elements', None)

    @property
    def is_float_32(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float
        """
        if hasattr(self, '_m_is_float_32'):
            return self._m_is_float_32

        self._m_is_float_32 = self.b1 == 202
        return getattr(self, '_m_is_float_32', None)

    @property
    def is_map_32(self):
        """
        .. seealso::
           Source - https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map
        """
        if hasattr(self, '_m_is_map_32'):
            return self._m_is_map_32

        self._m_is_map_32 = self.b1 == 223
        return getattr(self, '_m_is_map_32', None)


