# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PythonPyc27(ReadWriteKaitaiStruct):
    """Python interpreter runs .py files in 2 step process: first, it
    produces bytecode, which it then executes. Translation of .py source
    into bytecode is time-consuming, so Python dumps compiled bytecode
    into .pyc files, to be reused from cache at later time if possible.
    
    .pyc file is essentially a raw dump of `py_object` (see `body`) with
    a simple header prepended.
    """

    class Version(IntEnum):
        v15 = 20121
        v16 = 50428
        v20 = 50823
        v21 = 60202
        v22 = 60717
        v23_a0 = 62011
        v23_a0b = 62021
        v24_a0 = 62041
        v24_a3 = 62051
        v24_b1 = 62061
        v25_a0 = 62071
        v25_a0b = 62081
        v25_a0c = 62091
        v25_a0d = 62092
        v25_b3 = 62101
        v25_b3b = 62111
        v25_c1 = 62121
        v25_c2 = 62131
        v26_a0 = 62151
        v26_a1 = 62161
        v27_a0 = 62171
        v27_a0b = 62181
        v27_a0c = 62191
        v27_a0d = 62201
        v27_a0e = 62211
    def __init__(self, _io=None, _parent=None, _root=None):
        super(PythonPyc27, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.version_magic = KaitaiStream.resolve_enum(PythonPyc27.Version, self._io.read_u2le())
        self.crlf = self._io.read_u2le()
        self.modification_timestamp = self._io.read_u4le()
        self.body = PythonPyc27.PyObject(self._io, self, self._root)
        self.body._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.body._fetch_instances()


    def _write__seq(self, io=None):
        super(PythonPyc27, self)._write__seq(io)
        self._io.write_u2le(int(self.version_magic))
        self._io.write_u2le(self.crlf)
        self._io.write_u4le(self.modification_timestamp)
        self.body._write__seq(self._io)


    def _check(self):
        if self.body._root != self._root:
            raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
        if self.body._parent != self:
            raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        self._dirty = False

    class Assembly(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PythonPyc27.Assembly, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.string_magic = self._io.read_bytes(1)
            if not self.string_magic == b"\x73":
                raise kaitaistruct.ValidationNotEqualError(b"\x73", self.string_magic, self._io, u"/types/assembly/seq/0")
            self.length = self._io.read_u4le()
            self._raw_items = self._io.read_bytes(self.length)
            _io__raw_items = KaitaiStream(BytesIO(self._raw_items))
            self.items = PythonPyc27.OpArgs(_io__raw_items, self, self._root)
            self.items._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.items._fetch_instances()


        def _write__seq(self, io=None):
            super(PythonPyc27.Assembly, self)._write__seq(io)
            self._io.write_bytes(self.string_magic)
            self._io.write_u4le(self.length)
            _io__raw_items = KaitaiStream(BytesIO(bytearray(self.length)))
            self._io.add_child_stream(_io__raw_items)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.length))
            def handler(parent, _io__raw_items=_io__raw_items):
                self._raw_items = _io__raw_items.to_byte_array()
                if len(self._raw_items) != self.length:
                    raise kaitaistruct.ConsistencyError(u"raw(items)", self.length, len(self._raw_items))
                parent.write_bytes(self._raw_items)
            _io__raw_items.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.items._write__seq(_io__raw_items)


        def _check(self):
            if len(self.string_magic) != 1:
                raise kaitaistruct.ConsistencyError(u"string_magic", 1, len(self.string_magic))
            if not self.string_magic == b"\x73":
                raise kaitaistruct.ValidationNotEqualError(b"\x73", self.string_magic, None, u"/types/assembly/seq/0")
            if self.items._root != self._root:
                raise kaitaistruct.ConsistencyError(u"items", self._root, self.items._root)
            if self.items._parent != self:
                raise kaitaistruct.ConsistencyError(u"items", self, self.items._parent)
            self._dirty = False


    class CodeObject(ReadWriteKaitaiStruct):

        class FlagsEnum(IntEnum):
            has_args = 4
            has_kwargs = 8
            generator = 32
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PythonPyc27.CodeObject, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.arg_count = self._io.read_u4le()
            self.local_count = self._io.read_u4le()
            self.stack_size = self._io.read_u4le()
            self.flags = KaitaiStream.resolve_enum(PythonPyc27.CodeObject.FlagsEnum, self._io.read_u4le())
            self.code = PythonPyc27.Assembly(self._io, self, self._root)
            self.code._read()
            self.consts = PythonPyc27.PyObject(self._io, self, self._root)
            self.consts._read()
            self.names = PythonPyc27.PyObject(self._io, self, self._root)
            self.names._read()
            self.var_names = PythonPyc27.PyObject(self._io, self, self._root)
            self.var_names._read()
            self.free_vars = PythonPyc27.PyObject(self._io, self, self._root)
            self.free_vars._read()
            self.cell_vars = PythonPyc27.PyObject(self._io, self, self._root)
            self.cell_vars._read()
            self.filename = PythonPyc27.PyObject(self._io, self, self._root)
            self.filename._read()
            self.name = PythonPyc27.PyObject(self._io, self, self._root)
            self.name._read()
            self.first_line_no = self._io.read_u4le()
            self.lnotab = PythonPyc27.PyObject(self._io, self, self._root)
            self.lnotab._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.code._fetch_instances()
            self.consts._fetch_instances()
            self.names._fetch_instances()
            self.var_names._fetch_instances()
            self.free_vars._fetch_instances()
            self.cell_vars._fetch_instances()
            self.filename._fetch_instances()
            self.name._fetch_instances()
            self.lnotab._fetch_instances()


        def _write__seq(self, io=None):
            super(PythonPyc27.CodeObject, self)._write__seq(io)
            self._io.write_u4le(self.arg_count)
            self._io.write_u4le(self.local_count)
            self._io.write_u4le(self.stack_size)
            self._io.write_u4le(int(self.flags))
            self.code._write__seq(self._io)
            self.consts._write__seq(self._io)
            self.names._write__seq(self._io)
            self.var_names._write__seq(self._io)
            self.free_vars._write__seq(self._io)
            self.cell_vars._write__seq(self._io)
            self.filename._write__seq(self._io)
            self.name._write__seq(self._io)
            self._io.write_u4le(self.first_line_no)
            self.lnotab._write__seq(self._io)


        def _check(self):
            if self.code._root != self._root:
                raise kaitaistruct.ConsistencyError(u"code", self._root, self.code._root)
            if self.code._parent != self:
                raise kaitaistruct.ConsistencyError(u"code", self, self.code._parent)
            if self.consts._root != self._root:
                raise kaitaistruct.ConsistencyError(u"consts", self._root, self.consts._root)
            if self.consts._parent != self:
                raise kaitaistruct.ConsistencyError(u"consts", self, self.consts._parent)
            if self.names._root != self._root:
                raise kaitaistruct.ConsistencyError(u"names", self._root, self.names._root)
            if self.names._parent != self:
                raise kaitaistruct.ConsistencyError(u"names", self, self.names._parent)
            if self.var_names._root != self._root:
                raise kaitaistruct.ConsistencyError(u"var_names", self._root, self.var_names._root)
            if self.var_names._parent != self:
                raise kaitaistruct.ConsistencyError(u"var_names", self, self.var_names._parent)
            if self.free_vars._root != self._root:
                raise kaitaistruct.ConsistencyError(u"free_vars", self._root, self.free_vars._root)
            if self.free_vars._parent != self:
                raise kaitaistruct.ConsistencyError(u"free_vars", self, self.free_vars._parent)
            if self.cell_vars._root != self._root:
                raise kaitaistruct.ConsistencyError(u"cell_vars", self._root, self.cell_vars._root)
            if self.cell_vars._parent != self:
                raise kaitaistruct.ConsistencyError(u"cell_vars", self, self.cell_vars._parent)
            if self.filename._root != self._root:
                raise kaitaistruct.ConsistencyError(u"filename", self._root, self.filename._root)
            if self.filename._parent != self:
                raise kaitaistruct.ConsistencyError(u"filename", self, self.filename._parent)
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.lnotab._root != self._root:
                raise kaitaistruct.ConsistencyError(u"lnotab", self._root, self.lnotab._root)
            if self.lnotab._parent != self:
                raise kaitaistruct.ConsistencyError(u"lnotab", self, self.lnotab._parent)
            self._dirty = False


    class OpArg(ReadWriteKaitaiStruct):

        class OpCodeEnum(IntEnum):
            stop_code = 0
            pop_top = 1
            rot_two = 2
            rot_three = 3
            dup_top = 4
            rot_four = 5
            nop = 9
            unary_positive = 10
            unary_negative = 11
            unary_not = 12
            unary_convert = 13
            unary_invert = 15
            binary_power = 19
            binary_multiply = 20
            binary_divide = 21
            binary_modulo = 22
            binary_add = 23
            binary_subtract = 24
            binary_subscr = 25
            binary_floor_divide = 26
            binary_true_divide = 27
            inplace_floor_divide = 28
            inplace_true_divide = 29
            slice_0 = 30
            slice_1 = 31
            slice_2 = 32
            slice_3 = 33
            store_slice_0 = 40
            store_slice_1 = 41
            store_slice_2 = 42
            store_slice_3 = 43
            delete_slice_0 = 50
            delete_slice_1 = 51
            delete_slice_2 = 52
            delete_slice_3 = 53
            store_map = 54
            inplace_add = 55
            inplace_subtract = 56
            inplace_multiply = 57
            inplace_divide = 58
            inplace_modulo = 59
            store_subscr = 60
            delete_subscr = 61
            binary_lshift = 62
            binary_rshift = 63
            binary_and = 64
            binary_xor = 65
            binary_or = 66
            inplace_power = 67
            get_iter = 68
            print_expr = 70
            print_item = 71
            print_newline = 72
            print_item_to = 73
            print_newline_to = 74
            inplace_lshift = 75
            inplace_rshift = 76
            inplace_and = 77
            inplace_xor = 78
            inplace_or = 79
            break_loop = 80
            with_cleanup = 81
            load_locals = 82
            return_value = 83
            import_star = 84
            exec_stmt = 85
            yield_value = 86
            pop_block = 87
            end_finally = 88
            build_class = 89
            store_name = 90
            delete_name = 91
            unpack_sequence = 92
            for_iter = 93
            list_append = 94
            store_attr = 95
            delete_attr = 96
            store_global = 97
            delete_global = 98
            dup_topx = 99
            load_const = 100
            load_name = 101
            build_tuple = 102
            build_list = 103
            build_set = 104
            build_map = 105
            load_attr = 106
            compare_op = 107
            import_name = 108
            import_from = 109
            jump_forward = 110
            jump_if_false_or_pop = 111
            jump_if_true_or_pop = 112
            jump_absolute = 113
            pop_jump_if_false = 114
            pop_jump_if_true = 115
            load_global = 116
            continue_loop = 119
            setup_loop = 120
            setup_except = 121
            setup_finally = 122
            load_fast = 124
            store_fast = 125
            delete_fast = 126
            raise_varargs = 130
            call_function = 131
            make_function = 132
            build_slice = 133
            make_closure = 134
            load_closure = 135
            load_deref = 136
            store_deref = 137
            call_function_var = 140
            call_function_kw = 141
            call_function_var_kw = 142
            setup_with = 143
            extended_arg = 145
            set_add = 146
            map_add = 147
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PythonPyc27.OpArg, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.op_code = KaitaiStream.resolve_enum(PythonPyc27.OpArg.OpCodeEnum, self._io.read_u1())
            if int(self.op_code) >= int(PythonPyc27.OpArg.OpCodeEnum.store_name):
                pass
                self.arg = self._io.read_u2le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if int(self.op_code) >= int(PythonPyc27.OpArg.OpCodeEnum.store_name):
                pass



        def _write__seq(self, io=None):
            super(PythonPyc27.OpArg, self)._write__seq(io)
            self._io.write_u1(int(self.op_code))
            if int(self.op_code) >= int(PythonPyc27.OpArg.OpCodeEnum.store_name):
                pass
                self._io.write_u2le(self.arg)



        def _check(self):
            if int(self.op_code) >= int(PythonPyc27.OpArg.OpCodeEnum.store_name):
                pass

            self._dirty = False


    class OpArgs(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PythonPyc27.OpArgs, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.items = []
            i = 0
            while not self._io.is_eof():
                _t_items = PythonPyc27.OpArg(self._io, self, self._root)
                try:
                    _t_items._read()
                finally:
                    self.items.append(_t_items)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.items)):
                pass
                self.items[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(PythonPyc27.OpArgs, self)._write__seq(io)
            for i in range(len(self.items)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())
                self.items[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.items)):
                pass
                if self.items[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                if self.items[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

            self._dirty = False


    class PyObject(ReadWriteKaitaiStruct):

        class ObjectType(IntEnum):
            tuple = 40
            py_false = 70
            none = 78
            string_ref = 82
            py_true = 84
            code_object = 99
            int = 105
            string = 115
            interned = 116
            unicode_string = 117
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PythonPyc27.PyObject, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = KaitaiStream.resolve_enum(PythonPyc27.PyObject.ObjectType, self._io.read_u1())
            _on = self.type
            if _on == PythonPyc27.PyObject.ObjectType.code_object:
                pass
                self.value = PythonPyc27.CodeObject(self._io, self, self._root)
                self.value._read()
            elif _on == PythonPyc27.PyObject.ObjectType.int:
                pass
                self.value = self._io.read_u4le()
            elif _on == PythonPyc27.PyObject.ObjectType.interned:
                pass
                self.value = PythonPyc27.PyObject.InternedString(self._io, self, self._root)
                self.value._read()
            elif _on == PythonPyc27.PyObject.ObjectType.none:
                pass
                self.value = PythonPyc27.PyObject.PyNone(self._io, self, self._root)
                self.value._read()
            elif _on == PythonPyc27.PyObject.ObjectType.py_false:
                pass
                self.value = PythonPyc27.PyObject.PyFalse(self._io, self, self._root)
                self.value._read()
            elif _on == PythonPyc27.PyObject.ObjectType.py_true:
                pass
                self.value = PythonPyc27.PyObject.PyTrue(self._io, self, self._root)
                self.value._read()
            elif _on == PythonPyc27.PyObject.ObjectType.string:
                pass
                self.value = PythonPyc27.PyObject.PyString(self._io, self, self._root)
                self.value._read()
            elif _on == PythonPyc27.PyObject.ObjectType.string_ref:
                pass
                self.value = PythonPyc27.PyObject.StringRef(self._io, self, self._root)
                self.value._read()
            elif _on == PythonPyc27.PyObject.ObjectType.tuple:
                pass
                self.value = PythonPyc27.PyObject.Tuple(self._io, self, self._root)
                self.value._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == PythonPyc27.PyObject.ObjectType.code_object:
                pass
                self.value._fetch_instances()
            elif _on == PythonPyc27.PyObject.ObjectType.int:
                pass
            elif _on == PythonPyc27.PyObject.ObjectType.interned:
                pass
                self.value._fetch_instances()
            elif _on == PythonPyc27.PyObject.ObjectType.none:
                pass
                self.value._fetch_instances()
            elif _on == PythonPyc27.PyObject.ObjectType.py_false:
                pass
                self.value._fetch_instances()
            elif _on == PythonPyc27.PyObject.ObjectType.py_true:
                pass
                self.value._fetch_instances()
            elif _on == PythonPyc27.PyObject.ObjectType.string:
                pass
                self.value._fetch_instances()
            elif _on == PythonPyc27.PyObject.ObjectType.string_ref:
                pass
                self.value._fetch_instances()
            elif _on == PythonPyc27.PyObject.ObjectType.tuple:
                pass
                self.value._fetch_instances()


        def _write__seq(self, io=None):
            super(PythonPyc27.PyObject, self)._write__seq(io)
            self._io.write_u1(int(self.type))
            _on = self.type
            if _on == PythonPyc27.PyObject.ObjectType.code_object:
                pass
                self.value._write__seq(self._io)
            elif _on == PythonPyc27.PyObject.ObjectType.int:
                pass
                self._io.write_u4le(self.value)
            elif _on == PythonPyc27.PyObject.ObjectType.interned:
                pass
                self.value._write__seq(self._io)
            elif _on == PythonPyc27.PyObject.ObjectType.none:
                pass
                self.value._write__seq(self._io)
            elif _on == PythonPyc27.PyObject.ObjectType.py_false:
                pass
                self.value._write__seq(self._io)
            elif _on == PythonPyc27.PyObject.ObjectType.py_true:
                pass
                self.value._write__seq(self._io)
            elif _on == PythonPyc27.PyObject.ObjectType.string:
                pass
                self.value._write__seq(self._io)
            elif _on == PythonPyc27.PyObject.ObjectType.string_ref:
                pass
                self.value._write__seq(self._io)
            elif _on == PythonPyc27.PyObject.ObjectType.tuple:
                pass
                self.value._write__seq(self._io)


        def _check(self):
            _on = self.type
            if _on == PythonPyc27.PyObject.ObjectType.code_object:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == PythonPyc27.PyObject.ObjectType.int:
                pass
            elif _on == PythonPyc27.PyObject.ObjectType.interned:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == PythonPyc27.PyObject.ObjectType.none:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == PythonPyc27.PyObject.ObjectType.py_false:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == PythonPyc27.PyObject.ObjectType.py_true:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == PythonPyc27.PyObject.ObjectType.string:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == PythonPyc27.PyObject.ObjectType.string_ref:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == PythonPyc27.PyObject.ObjectType.tuple:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            self._dirty = False

        class InternedString(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PythonPyc27.PyObject.InternedString, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.length = self._io.read_u4le()
                self.data = (self._io.read_bytes(self.length)).decode(u"UTF-8")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PythonPyc27.PyObject.InternedString, self)._write__seq(io)
                self._io.write_u4le(self.length)
                self._io.write_bytes((self.data).encode(u"UTF-8"))


            def _check(self):
                if len((self.data).encode(u"UTF-8")) != self.length:
                    raise kaitaistruct.ConsistencyError(u"data", self.length, len((self.data).encode(u"UTF-8")))
                self._dirty = False


        class PyFalse(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PythonPyc27.PyObject.PyFalse, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                pass
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PythonPyc27.PyObject.PyFalse, self)._write__seq(io)


            def _check(self):
                self._dirty = False


        class PyNone(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PythonPyc27.PyObject.PyNone, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                pass
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PythonPyc27.PyObject.PyNone, self)._write__seq(io)


            def _check(self):
                self._dirty = False


        class PyString(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PythonPyc27.PyObject.PyString, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.length = self._io.read_u4le()
                self.data = self._io.read_bytes(self.length)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PythonPyc27.PyObject.PyString, self)._write__seq(io)
                self._io.write_u4le(self.length)
                self._io.write_bytes(self.data)


            def _check(self):
                if len(self.data) != self.length:
                    raise kaitaistruct.ConsistencyError(u"data", self.length, len(self.data))
                self._dirty = False


        class PyTrue(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PythonPyc27.PyObject.PyTrue, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                pass
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PythonPyc27.PyObject.PyTrue, self)._write__seq(io)


            def _check(self):
                self._dirty = False


        class StringRef(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PythonPyc27.PyObject.StringRef, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.interned_list_index = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PythonPyc27.PyObject.StringRef, self)._write__seq(io)
                self._io.write_u4le(self.interned_list_index)


            def _check(self):
                self._dirty = False


        class Tuple(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PythonPyc27.PyObject.Tuple, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.count = self._io.read_u4le()
                self.items = []
                for i in range(self.count):
                    _t_items = PythonPyc27.PyObject(self._io, self, self._root)
                    try:
                        _t_items._read()
                    finally:
                        self.items.append(_t_items)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.items)):
                    pass
                    self.items[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(PythonPyc27.PyObject.Tuple, self)._write__seq(io)
                self._io.write_u4le(self.count)
                for i in range(len(self.items)):
                    pass
                    self.items[i]._write__seq(self._io)



            def _check(self):
                if len(self.items) != self.count:
                    raise kaitaistruct.ConsistencyError(u"items", self.count, len(self.items))
                for i in range(len(self.items)):
                    pass
                    if self.items[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                    if self.items[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

                self._dirty = False


        class UnicodeString(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PythonPyc27.PyObject.UnicodeString, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.length = self._io.read_u4le()
                self.data = (self._io.read_bytes(self.length)).decode(u"UTF-8")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PythonPyc27.PyObject.UnicodeString, self)._write__seq(io)
                self._io.write_u4le(self.length)
                self._io.write_bytes((self.data).encode(u"UTF-8"))


            def _check(self):
                if len((self.data).encode(u"UTF-8")) != self.length:
                    raise kaitaistruct.ConsistencyError(u"data", self.length, len((self.data).encode(u"UTF-8")))
                self._dirty = False




