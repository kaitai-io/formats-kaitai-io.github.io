# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Gguf(ReadWriteKaitaiStruct):
    """GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
    tensor library for storing machine learning models, used for example by
    [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
    replaced the older GGML, GGMF and GGJT formats.
    
    A GGUF file consists of a header with metadata as key-value pairs (model
    architecture, hyperparameters, tokenizer, etc.), a description of each
    tensor (name, dimensions, type and offset), and finally the tensor data.
    
    .. seealso::
       Git tag "v0.27.0" - https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md
    """

    class GgmlType(IntEnum):
        f32 = 0
        f16 = 1
        q4_0 = 2
        q4_1 = 3
        q4_2 = 4
        q4_3 = 5
        q5_0 = 6
        q5_1 = 7
        q8_0 = 8
        q8_1 = 9
        q2_k = 10
        q3_k = 11
        q4_k = 12
        q5_k = 13
        q6_k = 14
        q8_k = 15
        iq2_xxs = 16
        iq2_xs = 17
        iq3_xxs = 18
        iq1_s = 19
        iq4_nl = 20
        iq3_s = 21
        iq2_s = 22
        iq4_xs = 23
        i8 = 24
        i16 = 25
        i32 = 26
        i64 = 27
        f64 = 28
        iq1_m = 29
        bf16 = 30
        q4_0_4_4 = 31
        q4_0_4_8 = 32
        q4_0_8_8 = 33
        tq1_0 = 34
        tq2_0 = 35
        iq4_nl_4_4 = 36
        iq4_nl_4_8 = 37
        iq4_nl_8_8 = 38
        mxfp4 = 39
        nvfp4 = 40
        q1_0 = 41
        q2_0 = 42

    class GgufType(IntEnum):
        uint8 = 0
        int8 = 1
        uint16 = 2
        int16 = 3
        uint32 = 4
        int32 = 5
        float32 = 6
        bool = 7
        string = 8
        array = 9
        uint64 = 10
        int64 = 11
        float64 = 12
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Gguf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_version_le = False
        self.version_le__enabled = True

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x47\x47\x55\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x47\x47\x55\x46", self.magic, self._io, u"/seq/0")
        self.body = Gguf.GgufBody(self._io, self, self._root)
        self.body._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.body._fetch_instances()
        _ = self.version_le
        if hasattr(self, '_m_version_le'):
            pass



    def _write__seq(self, io=None):
        super(Gguf, self)._write__seq(io)
        self._should_write_version_le = self.version_le__enabled
        self._io.write_bytes(self.magic)
        self.body._write__seq(self._io)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x47\x47\x55\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x47\x47\x55\x46", self.magic, None, u"/seq/0")
        if self.body._root != self._root:
            raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
        if self.body._parent != self:
            raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        if self.version_le__enabled:
            pass

        self._dirty = False

    class GgufBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gguf.GgufBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            _on = self._root.is_big_endian
            if _on == True:
                pass
                self._is_le = False
            elif _on == False:
                pass
                self._is_le = True
            if not hasattr(self, '_is_le'):
                raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body")
            elif self._is_le == True:
                self._read_le()
            elif self._is_le == False:
                self._read_be()
            self._dirty = False

        def _read_le(self):
            self.version = self._io.read_u4le()
            if not self.version >= 2:
                raise kaitaistruct.ValidationLessThanError(2, self.version, self._io, u"/types/gguf_body/seq/0")
            if not self.version <= 3:
                raise kaitaistruct.ValidationGreaterThanError(3, self.version, self._io, u"/types/gguf_body/seq/0")
            self.num_tensor_infos = self._io.read_u8le()
            self.num_kv_pairs = self._io.read_u8le()
            self.kv_pairs = []
            for i in range(self.num_kv_pairs):
                _t_kv_pairs = Gguf.GgufBody.GgufKv((self.kv_pairs[i - 1].alignment if i != 0 else 32), self._io, self, self._root, self._is_le)
                try:
                    _t_kv_pairs._read()
                finally:
                    self.kv_pairs.append(_t_kv_pairs)

            self.tensor_infos = []
            for i in range(self.num_tensor_infos):
                _t_tensor_infos = Gguf.GgufBody.GgufTensorInfo((self.tensor_infos[i - 1].expected_next_offset if i != 0 else 0), self._io, self, self._root, self._is_le)
                try:
                    _t_tensor_infos._read()
                finally:
                    self.tensor_infos.append(_t_tensor_infos)

            if self.num_tensor_infos != 0:
                pass
                self.padding = self._io.read_bytes((self.alignment - self._io.pos() % self.alignment) % self.alignment)

            if self.ofs_tensor_data < 0:
                pass
                self._unnamed6 = self._io.read_bytes(0)

            self._dirty = False

        def _read_be(self):
            self.version = self._io.read_u4be()
            if not self.version >= 2:
                raise kaitaistruct.ValidationLessThanError(2, self.version, self._io, u"/types/gguf_body/seq/0")
            if not self.version <= 3:
                raise kaitaistruct.ValidationGreaterThanError(3, self.version, self._io, u"/types/gguf_body/seq/0")
            self.num_tensor_infos = self._io.read_u8be()
            self.num_kv_pairs = self._io.read_u8be()
            self.kv_pairs = []
            for i in range(self.num_kv_pairs):
                _t_kv_pairs = Gguf.GgufBody.GgufKv((self.kv_pairs[i - 1].alignment if i != 0 else 32), self._io, self, self._root, self._is_le)
                try:
                    _t_kv_pairs._read()
                finally:
                    self.kv_pairs.append(_t_kv_pairs)

            self.tensor_infos = []
            for i in range(self.num_tensor_infos):
                _t_tensor_infos = Gguf.GgufBody.GgufTensorInfo((self.tensor_infos[i - 1].expected_next_offset if i != 0 else 0), self._io, self, self._root, self._is_le)
                try:
                    _t_tensor_infos._read()
                finally:
                    self.tensor_infos.append(_t_tensor_infos)

            if self.num_tensor_infos != 0:
                pass
                self.padding = self._io.read_bytes((self.alignment - self._io.pos() % self.alignment) % self.alignment)

            if self.ofs_tensor_data < 0:
                pass
                self._unnamed6 = self._io.read_bytes(0)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.kv_pairs)):
                pass
                self.kv_pairs[i]._fetch_instances()

            for i in range(len(self.tensor_infos)):
                pass
                self.tensor_infos[i]._fetch_instances()

            if self.num_tensor_infos != 0:
                pass

            if self.ofs_tensor_data < 0:
                pass



        def _write__seq(self, io=None):
            super(Gguf.GgufBody, self)._write__seq(io)
            if not hasattr(self, '_is_le'):
                raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body")
            elif self._is_le == True:
                self._write__seq_le()
            elif self._is_le == False:
                self._write__seq_be()


        def _write__seq_le(self):
            self._io.write_u4le(self.version)
            self._io.write_u8le(self.num_tensor_infos)
            self._io.write_u8le(self.num_kv_pairs)
            for i in range(len(self.kv_pairs)):
                pass
                self.kv_pairs[i]._write__seq(self._io)

            for i in range(len(self.tensor_infos)):
                pass
                self.tensor_infos[i]._write__seq(self._io)

            if self.num_tensor_infos != 0:
                pass
                if len(self.padding) != (self.alignment - self._io.pos() % self.alignment) % self.alignment:
                    raise kaitaistruct.ConsistencyError(u"padding", (self.alignment - self._io.pos() % self.alignment) % self.alignment, len(self.padding))
                self._io.write_bytes(self.padding)

            if self.ofs_tensor_data < 0:
                pass
                if len(self._unnamed6) != 0:
                    raise kaitaistruct.ConsistencyError(u"_unnamed6", 0, len(self._unnamed6))
                self._io.write_bytes(self._unnamed6)



        def _write__seq_be(self):
            self._io.write_u4be(self.version)
            self._io.write_u8be(self.num_tensor_infos)
            self._io.write_u8be(self.num_kv_pairs)
            for i in range(len(self.kv_pairs)):
                pass
                self.kv_pairs[i]._write__seq(self._io)

            for i in range(len(self.tensor_infos)):
                pass
                self.tensor_infos[i]._write__seq(self._io)

            if self.num_tensor_infos != 0:
                pass
                if len(self.padding) != (self.alignment - self._io.pos() % self.alignment) % self.alignment:
                    raise kaitaistruct.ConsistencyError(u"padding", (self.alignment - self._io.pos() % self.alignment) % self.alignment, len(self.padding))
                self._io.write_bytes(self.padding)

            if self.ofs_tensor_data < 0:
                pass
                if len(self._unnamed6) != 0:
                    raise kaitaistruct.ConsistencyError(u"_unnamed6", 0, len(self._unnamed6))
                self._io.write_bytes(self._unnamed6)



        def _check(self):
            if not self.version >= 2:
                raise kaitaistruct.ValidationLessThanError(2, self.version, None, u"/types/gguf_body/seq/0")
            if not self.version <= 3:
                raise kaitaistruct.ValidationGreaterThanError(3, self.version, None, u"/types/gguf_body/seq/0")
            if len(self.kv_pairs) != self.num_kv_pairs:
                raise kaitaistruct.ConsistencyError(u"kv_pairs", self.num_kv_pairs, len(self.kv_pairs))
            for i in range(len(self.kv_pairs)):
                pass
                if self.kv_pairs[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"kv_pairs", self._root, self.kv_pairs[i]._root)
                if self.kv_pairs[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"kv_pairs", self, self.kv_pairs[i]._parent)
                if self.kv_pairs[i].prev_alignment != (self.kv_pairs[i - 1].alignment if i != 0 else 32):
                    raise kaitaistruct.ConsistencyError(u"kv_pairs", (self.kv_pairs[i - 1].alignment if i != 0 else 32), self.kv_pairs[i].prev_alignment)

            if len(self.tensor_infos) != self.num_tensor_infos:
                raise kaitaistruct.ConsistencyError(u"tensor_infos", self.num_tensor_infos, len(self.tensor_infos))
            for i in range(len(self.tensor_infos)):
                pass
                if self.tensor_infos[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tensor_infos", self._root, self.tensor_infos[i]._root)
                if self.tensor_infos[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tensor_infos", self, self.tensor_infos[i]._parent)
                if self.tensor_infos[i].expected_offset != (self.tensor_infos[i - 1].expected_next_offset if i != 0 else 0):
                    raise kaitaistruct.ConsistencyError(u"tensor_infos", (self.tensor_infos[i - 1].expected_next_offset if i != 0 else 0), self.tensor_infos[i].expected_offset)

            if self.num_tensor_infos != 0:
                pass

            self._dirty = False

        class GgufArray(ReadWriteKaitaiStruct):
            """Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
            they are explicitly allowed by `gguf.md` - see
            <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
            """
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufArray, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_array")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.type = KaitaiStream.resolve_enum(Gguf.GgufType, self._io.read_u4le())
                if not isinstance(self.type, Gguf.GgufType):
                    raise kaitaistruct.ValidationNotInEnumError(self.type, self._io, u"/types/gguf_body/types/gguf_array/seq/0")
                self.num_elems = self._io.read_u8le()
                self.elems = []
                for i in range(self.num_elems):
                    _t_elems = Gguf.GgufBody.GgufValue(self.type, self._io, self, self._root, self._is_le)
                    try:
                        _t_elems._read()
                    finally:
                        self.elems.append(_t_elems)

                self._dirty = False

            def _read_be(self):
                self.type = KaitaiStream.resolve_enum(Gguf.GgufType, self._io.read_u4be())
                if not isinstance(self.type, Gguf.GgufType):
                    raise kaitaistruct.ValidationNotInEnumError(self.type, self._io, u"/types/gguf_body/types/gguf_array/seq/0")
                self.num_elems = self._io.read_u8be()
                self.elems = []
                for i in range(self.num_elems):
                    _t_elems = Gguf.GgufBody.GgufValue(self.type, self._io, self, self._root, self._is_le)
                    try:
                        _t_elems._read()
                    finally:
                        self.elems.append(_t_elems)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.elems)):
                    pass
                    self.elems[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufArray, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_array")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u4le(int(self.type))
                self._io.write_u8le(self.num_elems)
                for i in range(len(self.elems)):
                    pass
                    self.elems[i]._write__seq(self._io)



            def _write__seq_be(self):
                self._io.write_u4be(int(self.type))
                self._io.write_u8be(self.num_elems)
                for i in range(len(self.elems)):
                    pass
                    self.elems[i]._write__seq(self._io)



            def _check(self):
                if not isinstance(self.type, Gguf.GgufType):
                    raise kaitaistruct.ValidationNotInEnumError(self.type, None, u"/types/gguf_body/types/gguf_array/seq/0")
                if len(self.elems) != self.num_elems:
                    raise kaitaistruct.ConsistencyError(u"elems", self.num_elems, len(self.elems))
                for i in range(len(self.elems)):
                    pass
                    if self.elems[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"elems", self._root, self.elems[i]._root)
                    if self.elems[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"elems", self, self.elems[i]._parent)
                    if self.elems[i].type != self.type:
                        raise kaitaistruct.ConsistencyError(u"elems", self.type, self.elems[i].type)

                self._dirty = False


        class GgufBool(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufBool, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_bool")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value_raw = self._io.read_u1()
                if not self.value_raw <= 1:
                    raise kaitaistruct.ValidationGreaterThanError(1, self.value_raw, self._io, u"/types/gguf_body/types/gguf_bool/seq/0")
                self._dirty = False

            def _read_be(self):
                self.value_raw = self._io.read_u1()
                if not self.value_raw <= 1:
                    raise kaitaistruct.ValidationGreaterThanError(1, self.value_raw, self._io, u"/types/gguf_body/types/gguf_bool/seq/0")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufBool, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_bool")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u1(self.value_raw)


            def _write__seq_be(self):
                self._io.write_u1(self.value_raw)


            def _check(self):
                if not self.value_raw <= 1:
                    raise kaitaistruct.ValidationGreaterThanError(1, self.value_raw, None, u"/types/gguf_body/types/gguf_bool/seq/0")
                self._dirty = False

            @property
            def value(self):
                """
                .. seealso::
                   Git tag "v0.27.0" - https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L321
                """
                if hasattr(self, '_m_value'):
                    return self._m_value

                self._m_value = self.value_raw != 0
                return getattr(self, '_m_value', None)

            def _invalidate_value(self):
                del self._m_value

        class GgufFloat32(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufFloat32, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_float32")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_f4le()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_f4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufFloat32, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_float32")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_f4le(self.value)


            def _write__seq_be(self):
                self._io.write_f4be(self.value)


            def _check(self):
                self._dirty = False


        class GgufFloat64(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufFloat64, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_float64")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_f8le()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_f8be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufFloat64, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_float64")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_f8le(self.value)


            def _write__seq_be(self):
                self._io.write_f8be(self.value)


            def _check(self):
                self._dirty = False


        class GgufInt16(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufInt16, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_int16")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_s2le()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_s2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufInt16, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_int16")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_s2le(self.value)


            def _write__seq_be(self):
                self._io.write_s2be(self.value)


            def _check(self):
                self._dirty = False


        class GgufInt32(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufInt32, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_int32")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_s4le()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_s4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufInt32, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_int32")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_s4le(self.value)


            def _write__seq_be(self):
                self._io.write_s4be(self.value)


            def _check(self):
                self._dirty = False


        class GgufInt64(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufInt64, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_int64")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_s8le()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_s8be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufInt64, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_int64")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_s8le(self.value)


            def _write__seq_be(self):
                self._io.write_s8be(self.value)


            def _check(self):
                self._dirty = False


        class GgufInt8(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufInt8, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_int8")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_s1()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_s1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufInt8, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_int8")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_s1(self.value)


            def _write__seq_be(self):
                self._io.write_s1(self.value)


            def _check(self):
                self._dirty = False


        class GgufKv(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Git tag "v0.27.0" - https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275
            """
            def __init__(self, prev_alignment, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufKv, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self.prev_alignment = prev_alignment

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_kv")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.key = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
                self.key._read()
                _ = self.key
                if not _.len_value != 0:
                    raise kaitaistruct.ValidationExprError(self.key, self._io, u"/types/gguf_body/types/gguf_kv/seq/0")
                self.type = KaitaiStream.resolve_enum(Gguf.GgufType, self._io.read_u4le())
                if not isinstance(self.type, Gguf.GgufType):
                    raise kaitaistruct.ValidationNotInEnumError(self.type, self._io, u"/types/gguf_body/types/gguf_kv/seq/1")
                self.value = Gguf.GgufBody.GgufValue(self.type, self._io, self, self._root, self._is_le)
                self.value._read()
                _ = self.value
                if not ( ((self.type == Gguf.GgufType.uint32) and (_.value.value != 0) and (_.value.value & _.value.value - 1 == 0))  if self.key.value == u"general.alignment" else True):
                    raise kaitaistruct.ValidationExprError(self.value, self._io, u"/types/gguf_body/types/gguf_kv/seq/2")
                self._dirty = False

            def _read_be(self):
                self.key = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
                self.key._read()
                _ = self.key
                if not _.len_value != 0:
                    raise kaitaistruct.ValidationExprError(self.key, self._io, u"/types/gguf_body/types/gguf_kv/seq/0")
                self.type = KaitaiStream.resolve_enum(Gguf.GgufType, self._io.read_u4be())
                if not isinstance(self.type, Gguf.GgufType):
                    raise kaitaistruct.ValidationNotInEnumError(self.type, self._io, u"/types/gguf_body/types/gguf_kv/seq/1")
                self.value = Gguf.GgufBody.GgufValue(self.type, self._io, self, self._root, self._is_le)
                self.value._read()
                _ = self.value
                if not ( ((self.type == Gguf.GgufType.uint32) and (_.value.value != 0) and (_.value.value & _.value.value - 1 == 0))  if self.key.value == u"general.alignment" else True):
                    raise kaitaistruct.ValidationExprError(self.value, self._io, u"/types/gguf_body/types/gguf_kv/seq/2")
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.key._fetch_instances()
                self.value._fetch_instances()


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufKv, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_kv")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self.key._write__seq(self._io)
                self._io.write_u4le(int(self.type))
                self.value._write__seq(self._io)


            def _write__seq_be(self):
                self.key._write__seq(self._io)
                self._io.write_u4be(int(self.type))
                self.value._write__seq(self._io)


            def _check(self):
                if self.key._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"key", self._root, self.key._root)
                if self.key._parent != self:
                    raise kaitaistruct.ConsistencyError(u"key", self, self.key._parent)
                _ = self.key
                if not _.len_value != 0:
                    raise kaitaistruct.ValidationExprError(self.key, None, u"/types/gguf_body/types/gguf_kv/seq/0")
                if not isinstance(self.type, Gguf.GgufType):
                    raise kaitaistruct.ValidationNotInEnumError(self.type, None, u"/types/gguf_body/types/gguf_kv/seq/1")
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                if self.value.type != self.type:
                    raise kaitaistruct.ConsistencyError(u"value", self.type, self.value.type)
                _ = self.value
                if not ( ((self.type == Gguf.GgufType.uint32) and (_.value.value != 0) and (_.value.value & _.value.value - 1 == 0))  if self.key.value == u"general.alignment" else True):
                    raise kaitaistruct.ValidationExprError(self.value, None, u"/types/gguf_body/types/gguf_kv/seq/2")
                self._dirty = False

            @property
            def alignment(self):
                if hasattr(self, '_m_alignment'):
                    return self._m_alignment

                self._m_alignment = (self.value.value.value if self.key.value == u"general.alignment" else self.prev_alignment)
                return getattr(self, '_m_alignment', None)

            def _invalidate_alignment(self):
                del self._m_alignment

        class GgufStr(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Git tag "v0.27.0" - https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237
            """
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufStr, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_str")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.len_value = self._io.read_u8le()
                self.value = (self._io.read_bytes(self.len_value)).decode(u"UTF-8")
                self._dirty = False

            def _read_be(self):
                self.len_value = self._io.read_u8be()
                self.value = (self._io.read_bytes(self.len_value)).decode(u"UTF-8")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufStr, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_str")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u8le(self.len_value)
                self._io.write_bytes((self.value).encode(u"UTF-8"))


            def _write__seq_be(self):
                self._io.write_u8be(self.len_value)
                self._io.write_bytes((self.value).encode(u"UTF-8"))


            def _check(self):
                if len((self.value).encode(u"UTF-8")) != self.len_value:
                    raise kaitaistruct.ConsistencyError(u"value", self.len_value, len((self.value).encode(u"UTF-8")))
                self._dirty = False


        class GgufTensorInfo(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Git tag "v0.27.0" - https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325
            """
            def __init__(self, expected_offset, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufTensorInfo, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self.expected_offset = expected_offset
                self._should_write_data = False
                self.data__enabled = True
                self._should_write_padding = False
                self.padding__enabled = True

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_tensor_info")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.name = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
                self.name._read()
                _ = self.name
                if not _.len_value < 64:
                    raise kaitaistruct.ValidationExprError(self.name, self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/0")
                self.num_dims = self._io.read_u4le()
                if not self.num_dims <= 4:
                    raise kaitaistruct.ValidationGreaterThanError(4, self.num_dims, self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/1")
                self.dims = []
                for i in range(self.num_dims):
                    self.dims.append(self._io.read_s8le())
                    if not self.dims[i] >= 0:
                        raise kaitaistruct.ValidationLessThanError(0, self.dims[i], self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/2")

                self.type = KaitaiStream.resolve_enum(Gguf.GgmlType, self._io.read_u4le())
                _ = self.type
                if not  ((int(_) < 43) and (self.num_elements_per_block != 0) and ((self.dims[0] if self.num_dims > 0 else 1) % self.num_elements_per_block == 0)) :
                    raise kaitaistruct.ValidationExprError(self.type, self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/3")
                self.offset = self._io.read_u8le()
                if not self.offset == self.expected_offset:
                    raise kaitaistruct.ValidationNotEqualError(self.expected_offset, self.offset, self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/4")
                self._dirty = False

            def _read_be(self):
                self.name = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
                self.name._read()
                _ = self.name
                if not _.len_value < 64:
                    raise kaitaistruct.ValidationExprError(self.name, self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/0")
                self.num_dims = self._io.read_u4be()
                if not self.num_dims <= 4:
                    raise kaitaistruct.ValidationGreaterThanError(4, self.num_dims, self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/1")
                self.dims = []
                for i in range(self.num_dims):
                    self.dims.append(self._io.read_s8be())
                    if not self.dims[i] >= 0:
                        raise kaitaistruct.ValidationLessThanError(0, self.dims[i], self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/2")

                self.type = KaitaiStream.resolve_enum(Gguf.GgmlType, self._io.read_u4be())
                _ = self.type
                if not  ((int(_) < 43) and (self.num_elements_per_block != 0) and ((self.dims[0] if self.num_dims > 0 else 1) % self.num_elements_per_block == 0)) :
                    raise kaitaistruct.ValidationExprError(self.type, self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/3")
                self.offset = self._io.read_u8be()
                if not self.offset == self.expected_offset:
                    raise kaitaistruct.ValidationNotEqualError(self.expected_offset, self.offset, self._io, u"/types/gguf_body/types/gguf_tensor_info/seq/4")
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.name._fetch_instances()
                for i in range(len(self.dims)):
                    pass

                _ = self.data
                if hasattr(self, '_m_data'):
                    pass

                _ = self.padding
                if hasattr(self, '_m_padding'):
                    pass



            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufTensorInfo, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_tensor_info")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._should_write_data = self.data__enabled
                self._should_write_padding = self.padding__enabled
                self.name._write__seq(self._io)
                self._io.write_u4le(self.num_dims)
                for i in range(len(self.dims)):
                    pass
                    self._io.write_s8le(self.dims[i])

                self._io.write_u4le(int(self.type))
                self._io.write_u8le(self.offset)


            def _write__seq_be(self):
                self._should_write_data = self.data__enabled
                self._should_write_padding = self.padding__enabled
                self.name._write__seq(self._io)
                self._io.write_u4be(self.num_dims)
                for i in range(len(self.dims)):
                    pass
                    self._io.write_s8be(self.dims[i])

                self._io.write_u4be(int(self.type))
                self._io.write_u8be(self.offset)


            def _check(self):
                if self.name._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
                if self.name._parent != self:
                    raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
                _ = self.name
                if not _.len_value < 64:
                    raise kaitaistruct.ValidationExprError(self.name, None, u"/types/gguf_body/types/gguf_tensor_info/seq/0")
                if not self.num_dims <= 4:
                    raise kaitaistruct.ValidationGreaterThanError(4, self.num_dims, None, u"/types/gguf_body/types/gguf_tensor_info/seq/1")
                if len(self.dims) != self.num_dims:
                    raise kaitaistruct.ConsistencyError(u"dims", self.num_dims, len(self.dims))
                for i in range(len(self.dims)):
                    pass
                    if not self.dims[i] >= 0:
                        raise kaitaistruct.ValidationLessThanError(0, self.dims[i], None, u"/types/gguf_body/types/gguf_tensor_info/seq/2")

                _ = self.type
                if not  ((int(_) < 43) and (self.num_elements_per_block != 0) and ((self.dims[0] if self.num_dims > 0 else 1) % self.num_elements_per_block == 0)) :
                    raise kaitaistruct.ValidationExprError(self.type, None, u"/types/gguf_body/types/gguf_tensor_info/seq/3")
                if not self.offset == self.expected_offset:
                    raise kaitaistruct.ValidationNotEqualError(self.expected_offset, self.offset, None, u"/types/gguf_body/types/gguf_tensor_info/seq/4")
                if self.data__enabled:
                    pass
                    if len(self._m_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self._m_data))

                if self.padding__enabled:
                    pass
                    if len(self._m_padding) != self.len_padding:
                        raise kaitaistruct.ConsistencyError(u"padding", self.len_padding, len(self._m_padding))

                self._dirty = False

            @property
            def data(self):
                if self._should_write_data:
                    self._write_data()
                if hasattr(self, '_m_data'):
                    return self._m_data

                if not self.data__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self._parent.ofs_tensor_data + self.offset)
                if self._is_le:
                    self._m_data = self._io.read_bytes(self.len_data)
                else:
                    self._m_data = self._io.read_bytes(self.len_data)
                self._io.seek(_pos)
                return getattr(self, '_m_data', None)

            @data.setter
            def data(self, v):
                self._dirty = True
                self._m_data = v

            def _write_data(self):
                self._should_write_data = False
                _pos = self._io.pos()
                self._io.seek(self._parent.ofs_tensor_data + self.offset)
                if self._is_le:
                    self._io.write_bytes(self._m_data)
                else:
                    self._io.write_bytes(self._m_data)
                self._io.seek(_pos)

            @property
            def dump_dims(self):
                """`dims` joined with the string `" x "`. This is necessary for
                `-webide-representation`, which cannot format `dims` directly -
                see <https://github.com/kaitai-io/kaitai_struct_webide/issues/160>.
                """
                if hasattr(self, '_m_dump_dims'):
                    return self._m_dump_dims

                self._m_dump_dims = (((str(self.dims[0]) if self.num_dims > 0 else u"") + (u" x " + str(self.dims[1]) if self.num_dims > 1 else u"")) + (u" x " + str(self.dims[2]) if self.num_dims > 2 else u"")) + (u" x " + str(self.dims[3]) if self.num_dims > 3 else u"")
                return getattr(self, '_m_dump_dims', None)

            def _invalidate_dump_dims(self):
                del self._m_dump_dims
            @property
            def expected_next_offset(self):
                """`offset` that the next tensor must have."""
                if hasattr(self, '_m_expected_next_offset'):
                    return self._m_expected_next_offset

                self._m_expected_next_offset = ((self.offset + self.len_data) + self.len_padding)
                return getattr(self, '_m_expected_next_offset', None)

            def _invalidate_expected_next_offset(self):
                del self._m_expected_next_offset
            @property
            def len_block(self):
                """Size of a block in bytes."""
                if hasattr(self, '_m_len_block'):
                    return self._m_len_block

                self._m_len_block = [4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18][int(self.type)]
                return getattr(self, '_m_len_block', None)

            def _invalidate_len_block(self):
                del self._m_len_block
            @property
            def len_data(self):
                if hasattr(self, '_m_len_data'):
                    return self._m_len_data

                self._m_len_data = (self.len_block * self.num_blocks)
                return getattr(self, '_m_len_data', None)

            def _invalidate_len_data(self):
                del self._m_len_data
            @property
            def len_padding(self):
                """Number of padding bytes after the data."""
                if hasattr(self, '_m_len_padding'):
                    return self._m_len_padding

                self._m_len_padding = (self._parent.alignment - self.len_data % self._parent.alignment) % self._parent.alignment
                return getattr(self, '_m_len_padding', None)

            def _invalidate_len_padding(self):
                del self._m_len_padding
            @property
            def num_blocks(self):
                if hasattr(self, '_m_num_blocks'):
                    return self._m_num_blocks

                self._m_num_blocks = (self.num_elements // self.num_elements_per_block)
                return getattr(self, '_m_num_blocks', None)

            def _invalidate_num_blocks(self):
                del self._m_num_blocks
            @property
            def num_elements(self):
                if hasattr(self, '_m_num_elements'):
                    return self._m_num_elements

                self._m_num_elements = ((((self.dims[0] if self.num_dims > 0 else 1) * (self.dims[1] if self.num_dims > 1 else 1)) * (self.dims[2] if self.num_dims > 2 else 1)) * (self.dims[3] if self.num_dims > 3 else 1))
                return getattr(self, '_m_num_elements', None)

            def _invalidate_num_elements(self):
                del self._m_num_elements
            @property
            def num_elements_per_block(self):
                """Number of elements in a block."""
                if hasattr(self, '_m_num_elements_per_block'):
                    return self._m_num_elements_per_block

                self._m_num_elements_per_block = [1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64][int(self.type)]
                return getattr(self, '_m_num_elements_per_block', None)

            def _invalidate_num_elements_per_block(self):
                del self._m_num_elements_per_block
            @property
            def padding(self):
                """Padding after the data. ggml requires it even after the last tensor
                when reading the tensor data.
                
                .. seealso::
                   Git tag "v0.27.0" - https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893
                """
                if self._should_write_padding:
                    self._write_padding()
                if hasattr(self, '_m_padding'):
                    return self._m_padding

                if not self.padding__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek((self._parent.ofs_tensor_data + self.offset) + self.len_data)
                if self._is_le:
                    self._m_padding = self._io.read_bytes(self.len_padding)
                else:
                    self._m_padding = self._io.read_bytes(self.len_padding)
                self._io.seek(_pos)
                return getattr(self, '_m_padding', None)

            @padding.setter
            def padding(self, v):
                self._dirty = True
                self._m_padding = v

            def _write_padding(self):
                self._should_write_padding = False
                _pos = self._io.pos()
                self._io.seek((self._parent.ofs_tensor_data + self.offset) + self.len_data)
                if self._is_le:
                    self._io.write_bytes(self._m_padding)
                else:
                    self._io.write_bytes(self._m_padding)
                self._io.seek(_pos)


        class GgufUint16(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufUint16, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_uint16")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_u2le()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufUint16, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_uint16")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u2le(self.value)


            def _write__seq_be(self):
                self._io.write_u2be(self.value)


            def _check(self):
                self._dirty = False


        class GgufUint32(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufUint32, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_uint32")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_u4le()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufUint32, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_uint32")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u4le(self.value)


            def _write__seq_be(self):
                self._io.write_u4be(self.value)


            def _check(self):
                self._dirty = False


        class GgufUint64(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufUint64, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_uint64")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_u8le()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_u8be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufUint64, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_uint64")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u8le(self.value)


            def _write__seq_be(self):
                self._io.write_u8be(self.value)


            def _check(self):
                self._dirty = False


        class GgufUint8(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufUint8, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_uint8")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.value = self._io.read_u1()
                self._dirty = False

            def _read_be(self):
                self.value = self._io.read_u1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufUint8, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_uint8")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u1(self.value)


            def _write__seq_be(self):
                self._io.write_u1(self.value)


            def _check(self):
                self._dirty = False


        class GgufValue(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Git tag "v0.27.0" - https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260
            """
            def __init__(self, type, _io=None, _parent=None, _root=None, _is_le=None):
                super(Gguf.GgufBody.GgufValue, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self.type = type

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_value")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                _on = self.type
                if _on == Gguf.GgufType.array:
                    pass
                    self.value = Gguf.GgufBody.GgufArray(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.bool:
                    pass
                    self.value = Gguf.GgufBody.GgufBool(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.float32:
                    pass
                    self.value = Gguf.GgufBody.GgufFloat32(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.float64:
                    pass
                    self.value = Gguf.GgufBody.GgufFloat64(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.int16:
                    pass
                    self.value = Gguf.GgufBody.GgufInt16(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.int32:
                    pass
                    self.value = Gguf.GgufBody.GgufInt32(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.int64:
                    pass
                    self.value = Gguf.GgufBody.GgufInt64(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.int8:
                    pass
                    self.value = Gguf.GgufBody.GgufInt8(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.string:
                    pass
                    self.value = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.uint16:
                    pass
                    self.value = Gguf.GgufBody.GgufUint16(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.uint32:
                    pass
                    self.value = Gguf.GgufBody.GgufUint32(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.uint64:
                    pass
                    self.value = Gguf.GgufBody.GgufUint64(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.uint8:
                    pass
                    self.value = Gguf.GgufBody.GgufUint8(self._io, self, self._root, self._is_le)
                    self.value._read()
                self._dirty = False

            def _read_be(self):
                _on = self.type
                if _on == Gguf.GgufType.array:
                    pass
                    self.value = Gguf.GgufBody.GgufArray(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.bool:
                    pass
                    self.value = Gguf.GgufBody.GgufBool(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.float32:
                    pass
                    self.value = Gguf.GgufBody.GgufFloat32(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.float64:
                    pass
                    self.value = Gguf.GgufBody.GgufFloat64(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.int16:
                    pass
                    self.value = Gguf.GgufBody.GgufInt16(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.int32:
                    pass
                    self.value = Gguf.GgufBody.GgufInt32(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.int64:
                    pass
                    self.value = Gguf.GgufBody.GgufInt64(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.int8:
                    pass
                    self.value = Gguf.GgufBody.GgufInt8(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.string:
                    pass
                    self.value = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.uint16:
                    pass
                    self.value = Gguf.GgufBody.GgufUint16(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.uint32:
                    pass
                    self.value = Gguf.GgufBody.GgufUint32(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.uint64:
                    pass
                    self.value = Gguf.GgufBody.GgufUint64(self._io, self, self._root, self._is_le)
                    self.value._read()
                elif _on == Gguf.GgufType.uint8:
                    pass
                    self.value = Gguf.GgufBody.GgufUint8(self._io, self, self._root, self._is_le)
                    self.value._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _on = self.type
                if _on == Gguf.GgufType.array:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.bool:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.float32:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.float64:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.int16:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.int32:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.int64:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.int8:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.string:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.uint16:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.uint32:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.uint64:
                    pass
                    self.value._fetch_instances()
                elif _on == Gguf.GgufType.uint8:
                    pass
                    self.value._fetch_instances()


            def _write__seq(self, io=None):
                super(Gguf.GgufBody.GgufValue, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/gguf_body/types/gguf_value")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                _on = self.type
                if _on == Gguf.GgufType.array:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.bool:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.float32:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.float64:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.int16:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.int32:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.int64:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.int8:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.string:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.uint16:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.uint32:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.uint64:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.uint8:
                    pass
                    self.value._write__seq(self._io)


            def _write__seq_be(self):
                _on = self.type
                if _on == Gguf.GgufType.array:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.bool:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.float32:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.float64:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.int16:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.int32:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.int64:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.int8:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.string:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.uint16:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.uint32:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.uint64:
                    pass
                    self.value._write__seq(self._io)
                elif _on == Gguf.GgufType.uint8:
                    pass
                    self.value._write__seq(self._io)


            def _check(self):
                _on = self.type
                if _on == Gguf.GgufType.array:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.bool:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.float32:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.float64:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.int16:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.int32:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.int64:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.int8:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.string:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.uint16:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.uint32:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.uint64:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Gguf.GgufType.uint8:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                self._dirty = False


        @property
        def alignment(self):
            """Global alignment - from the `general.alignment` key, or 32 if there's no
            such key.
            
            .. seealso::
               Git tag "v0.27.0" - https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L622-L630
            """
            if hasattr(self, '_m_alignment'):
                return self._m_alignment

            self._m_alignment = (self.kv_pairs[-1].alignment if len(self.kv_pairs) != 0 else 32)
            return getattr(self, '_m_alignment', None)

        def _invalidate_alignment(self):
            del self._m_alignment
        @property
        def ofs_tensor_data(self):
            """Offset of the tensor data. Each tensor's `offset` is relative to this
            position.
            """
            if hasattr(self, '_m_ofs_tensor_data'):
                return self._m_ofs_tensor_data

            self._m_ofs_tensor_data = self._io.pos()
            return getattr(self, '_m_ofs_tensor_data', None)

        def _invalidate_ofs_tensor_data(self):
            del self._m_ofs_tensor_data

    @property
    def is_big_endian(self):
        if hasattr(self, '_m_is_big_endian'):
            return self._m_is_big_endian

        self._m_is_big_endian = self.version_le & 65535 == 0
        return getattr(self, '_m_is_big_endian', None)

    def _invalidate_is_big_endian(self):
        del self._m_is_big_endian
    @property
    def len_file(self):
        """Length of the file (computed from the header), including the padding after
        the last tensor's data.
        
        This Kaitai Struct implementation stops parsing where the tensor data
        starts (which is read lazily, i.e. only on demand). Without reading the
        tensor data, you can use this expected file size to check whether the file
        has been truncated, to carve the file out of a larger one, etc.
        """
        if hasattr(self, '_m_len_file'):
            return self._m_len_file

        self._m_len_file = (self.body.ofs_tensor_data + (self.body.tensor_infos[-1].expected_next_offset if self.body.num_tensor_infos != 0 else 0))
        return getattr(self, '_m_len_file', None)

    def _invalidate_len_file(self):
        del self._m_len_file
    @property
    def version_le(self):
        if self._should_write_version_le:
            self._write_version_le()
        if hasattr(self, '_m_version_le'):
            return self._m_version_le

        if not self.version_le__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(4)
        self._m_version_le = self._io.read_u4le()
        self._io.seek(_pos)
        return getattr(self, '_m_version_le', None)

    @version_le.setter
    def version_le(self, v):
        self._dirty = True
        self._m_version_le = v

    def _write_version_le(self):
        self._should_write_version_le = False
        _pos = self._io.pos()
        self._io.seek(4)
        self._io.write_u4le(self._m_version_le)
        self._io.seek(_pos)


