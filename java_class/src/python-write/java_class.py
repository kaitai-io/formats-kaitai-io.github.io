# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class JavaClass(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html
    
    
    .. seealso::
       Source - https://docs.oracle.com/javase/specs/jls/se6/jls3.pdf
    
    
    .. seealso::
       Source - https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/jdk.hotspot.agent/share/classes/sun/jvm/hotspot/runtime/ClassConstants.java
    
    
    .. seealso::
       Source - https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/java.base/share/native/include/classfile_constants.h.template
    
    
    .. seealso::
       Source - https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/hotspot/share/classfile/classFileParser.cpp
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(JavaClass, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\xCA\xFE\xBA\xBE":
            raise kaitaistruct.ValidationNotEqualError(b"\xCA\xFE\xBA\xBE", self.magic, self._io, u"/seq/0")
        self.version_minor = self._io.read_u2be()
        self.version_major = self._io.read_u2be()
        if not self.version_major >= 43:
            raise kaitaistruct.ValidationLessThanError(43, self.version_major, self._io, u"/seq/2")
        self.constant_pool_count = self._io.read_u2be()
        self.constant_pool = []
        for i in range(self.constant_pool_count - 1):
            _t_constant_pool = JavaClass.ConstantPoolEntry((self.constant_pool[i - 1].is_two_entries if i != 0 else False), self._io, self, self._root)
            try:
                _t_constant_pool._read()
            finally:
                self.constant_pool.append(_t_constant_pool)

        self.access_flags = self._io.read_u2be()
        self.this_class = self._io.read_u2be()
        self.super_class = self._io.read_u2be()
        self.interfaces_count = self._io.read_u2be()
        self.interfaces = []
        for i in range(self.interfaces_count):
            self.interfaces.append(self._io.read_u2be())

        self.fields_count = self._io.read_u2be()
        self.fields = []
        for i in range(self.fields_count):
            _t_fields = JavaClass.FieldInfo(self._io, self, self._root)
            try:
                _t_fields._read()
            finally:
                self.fields.append(_t_fields)

        self.methods_count = self._io.read_u2be()
        self.methods = []
        for i in range(self.methods_count):
            _t_methods = JavaClass.MethodInfo(self._io, self, self._root)
            try:
                _t_methods._read()
            finally:
                self.methods.append(_t_methods)

        self.attributes_count = self._io.read_u2be()
        self.attributes = []
        for i in range(self.attributes_count):
            _t_attributes = JavaClass.AttributeInfo(self._io, self, self._root)
            try:
                _t_attributes._read()
            finally:
                self.attributes.append(_t_attributes)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.constant_pool)):
            pass
            self.constant_pool[i]._fetch_instances()

        for i in range(len(self.interfaces)):
            pass

        for i in range(len(self.fields)):
            pass
            self.fields[i]._fetch_instances()

        for i in range(len(self.methods)):
            pass
            self.methods[i]._fetch_instances()

        for i in range(len(self.attributes)):
            pass
            self.attributes[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(JavaClass, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u2be(self.version_minor)
        self._io.write_u2be(self.version_major)
        self._io.write_u2be(self.constant_pool_count)
        for i in range(len(self.constant_pool)):
            pass
            self.constant_pool[i]._write__seq(self._io)

        self._io.write_u2be(self.access_flags)
        self._io.write_u2be(self.this_class)
        self._io.write_u2be(self.super_class)
        self._io.write_u2be(self.interfaces_count)
        for i in range(len(self.interfaces)):
            pass
            self._io.write_u2be(self.interfaces[i])

        self._io.write_u2be(self.fields_count)
        for i in range(len(self.fields)):
            pass
            self.fields[i]._write__seq(self._io)

        self._io.write_u2be(self.methods_count)
        for i in range(len(self.methods)):
            pass
            self.methods[i]._write__seq(self._io)

        self._io.write_u2be(self.attributes_count)
        for i in range(len(self.attributes)):
            pass
            self.attributes[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\xCA\xFE\xBA\xBE":
            raise kaitaistruct.ValidationNotEqualError(b"\xCA\xFE\xBA\xBE", self.magic, None, u"/seq/0")
        if not self.version_major >= 43:
            raise kaitaistruct.ValidationLessThanError(43, self.version_major, None, u"/seq/2")
        if len(self.constant_pool) != self.constant_pool_count - 1:
            raise kaitaistruct.ConsistencyError(u"constant_pool", self.constant_pool_count - 1, len(self.constant_pool))
        for i in range(len(self.constant_pool)):
            pass
            if self.constant_pool[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"constant_pool", self._root, self.constant_pool[i]._root)
            if self.constant_pool[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"constant_pool", self, self.constant_pool[i]._parent)
            if self.constant_pool[i].is_prev_two_entries != (self.constant_pool[i - 1].is_two_entries if i != 0 else False):
                raise kaitaistruct.ConsistencyError(u"constant_pool", (self.constant_pool[i - 1].is_two_entries if i != 0 else False), self.constant_pool[i].is_prev_two_entries)

        if len(self.interfaces) != self.interfaces_count:
            raise kaitaistruct.ConsistencyError(u"interfaces", self.interfaces_count, len(self.interfaces))
        for i in range(len(self.interfaces)):
            pass

        if len(self.fields) != self.fields_count:
            raise kaitaistruct.ConsistencyError(u"fields", self.fields_count, len(self.fields))
        for i in range(len(self.fields)):
            pass
            if self.fields[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"fields", self._root, self.fields[i]._root)
            if self.fields[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"fields", self, self.fields[i]._parent)

        if len(self.methods) != self.methods_count:
            raise kaitaistruct.ConsistencyError(u"methods", self.methods_count, len(self.methods))
        for i in range(len(self.methods)):
            pass
            if self.methods[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"methods", self._root, self.methods[i]._root)
            if self.methods[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"methods", self, self.methods[i]._parent)

        if len(self.attributes) != self.attributes_count:
            raise kaitaistruct.ConsistencyError(u"attributes", self.attributes_count, len(self.attributes))
        for i in range(len(self.attributes)):
            pass
            if self.attributes[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"attributes", self._root, self.attributes[i]._root)
            if self.attributes[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"attributes", self, self.attributes[i]._parent)

        self._dirty = False

    class AttributeInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.AttributeInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name_index = self._io.read_u2be()
            self.attribute_length = self._io.read_u4be()
            _on = self.name_as_str
            if _on == u"Code":
                pass
                self._raw_info = self._io.read_bytes(self.attribute_length)
                _io__raw_info = KaitaiStream(BytesIO(self._raw_info))
                self.info = JavaClass.AttributeInfo.AttrBodyCode(_io__raw_info, self, self._root)
                self.info._read()
            elif _on == u"Exceptions":
                pass
                self._raw_info = self._io.read_bytes(self.attribute_length)
                _io__raw_info = KaitaiStream(BytesIO(self._raw_info))
                self.info = JavaClass.AttributeInfo.AttrBodyExceptions(_io__raw_info, self, self._root)
                self.info._read()
            elif _on == u"LineNumberTable":
                pass
                self._raw_info = self._io.read_bytes(self.attribute_length)
                _io__raw_info = KaitaiStream(BytesIO(self._raw_info))
                self.info = JavaClass.AttributeInfo.AttrBodyLineNumberTable(_io__raw_info, self, self._root)
                self.info._read()
            elif _on == u"SourceFile":
                pass
                self._raw_info = self._io.read_bytes(self.attribute_length)
                _io__raw_info = KaitaiStream(BytesIO(self._raw_info))
                self.info = JavaClass.AttributeInfo.AttrBodySourceFile(_io__raw_info, self, self._root)
                self.info._read()
            else:
                pass
                self.info = self._io.read_bytes(self.attribute_length)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.name_as_str
            if _on == u"Code":
                pass
                self.info._fetch_instances()
            elif _on == u"Exceptions":
                pass
                self.info._fetch_instances()
            elif _on == u"LineNumberTable":
                pass
                self.info._fetch_instances()
            elif _on == u"SourceFile":
                pass
                self.info._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(JavaClass.AttributeInfo, self)._write__seq(io)
            self._io.write_u2be(self.name_index)
            self._io.write_u4be(self.attribute_length)
            _on = self.name_as_str
            if _on == u"Code":
                pass
                _io__raw_info = KaitaiStream(BytesIO(bytearray(self.attribute_length)))
                self._io.add_child_stream(_io__raw_info)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.attribute_length))
                def handler(parent, _io__raw_info=_io__raw_info):
                    self._raw_info = _io__raw_info.to_byte_array()
                    if len(self._raw_info) != self.attribute_length:
                        raise kaitaistruct.ConsistencyError(u"raw(info)", self.attribute_length, len(self._raw_info))
                    parent.write_bytes(self._raw_info)
                _io__raw_info.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.info._write__seq(_io__raw_info)
            elif _on == u"Exceptions":
                pass
                _io__raw_info = KaitaiStream(BytesIO(bytearray(self.attribute_length)))
                self._io.add_child_stream(_io__raw_info)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.attribute_length))
                def handler(parent, _io__raw_info=_io__raw_info):
                    self._raw_info = _io__raw_info.to_byte_array()
                    if len(self._raw_info) != self.attribute_length:
                        raise kaitaistruct.ConsistencyError(u"raw(info)", self.attribute_length, len(self._raw_info))
                    parent.write_bytes(self._raw_info)
                _io__raw_info.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.info._write__seq(_io__raw_info)
            elif _on == u"LineNumberTable":
                pass
                _io__raw_info = KaitaiStream(BytesIO(bytearray(self.attribute_length)))
                self._io.add_child_stream(_io__raw_info)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.attribute_length))
                def handler(parent, _io__raw_info=_io__raw_info):
                    self._raw_info = _io__raw_info.to_byte_array()
                    if len(self._raw_info) != self.attribute_length:
                        raise kaitaistruct.ConsistencyError(u"raw(info)", self.attribute_length, len(self._raw_info))
                    parent.write_bytes(self._raw_info)
                _io__raw_info.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.info._write__seq(_io__raw_info)
            elif _on == u"SourceFile":
                pass
                _io__raw_info = KaitaiStream(BytesIO(bytearray(self.attribute_length)))
                self._io.add_child_stream(_io__raw_info)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.attribute_length))
                def handler(parent, _io__raw_info=_io__raw_info):
                    self._raw_info = _io__raw_info.to_byte_array()
                    if len(self._raw_info) != self.attribute_length:
                        raise kaitaistruct.ConsistencyError(u"raw(info)", self.attribute_length, len(self._raw_info))
                    parent.write_bytes(self._raw_info)
                _io__raw_info.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.info._write__seq(_io__raw_info)
            else:
                pass
                self._io.write_bytes(self.info)


        def _check(self):
            _on = self.name_as_str
            if _on == u"Code":
                pass
                if self.info._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"info", self._root, self.info._root)
                if self.info._parent != self:
                    raise kaitaistruct.ConsistencyError(u"info", self, self.info._parent)
            elif _on == u"Exceptions":
                pass
                if self.info._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"info", self._root, self.info._root)
                if self.info._parent != self:
                    raise kaitaistruct.ConsistencyError(u"info", self, self.info._parent)
            elif _on == u"LineNumberTable":
                pass
                if self.info._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"info", self._root, self.info._root)
                if self.info._parent != self:
                    raise kaitaistruct.ConsistencyError(u"info", self, self.info._parent)
            elif _on == u"SourceFile":
                pass
                if self.info._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"info", self._root, self.info._root)
                if self.info._parent != self:
                    raise kaitaistruct.ConsistencyError(u"info", self, self.info._parent)
            else:
                pass
                if len(self.info) != self.attribute_length:
                    raise kaitaistruct.ConsistencyError(u"info", self.attribute_length, len(self.info))
            self._dirty = False

        class AttrBodyCode(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(JavaClass.AttributeInfo.AttrBodyCode, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.max_stack = self._io.read_u2be()
                self.max_locals = self._io.read_u2be()
                self.code_length = self._io.read_u4be()
                self.code = self._io.read_bytes(self.code_length)
                self.exception_table_length = self._io.read_u2be()
                self.exception_table = []
                for i in range(self.exception_table_length):
                    _t_exception_table = JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry(self._io, self, self._root)
                    try:
                        _t_exception_table._read()
                    finally:
                        self.exception_table.append(_t_exception_table)

                self.attributes_count = self._io.read_u2be()
                self.attributes = []
                for i in range(self.attributes_count):
                    _t_attributes = JavaClass.AttributeInfo(self._io, self, self._root)
                    try:
                        _t_attributes._read()
                    finally:
                        self.attributes.append(_t_attributes)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.exception_table)):
                    pass
                    self.exception_table[i]._fetch_instances()

                for i in range(len(self.attributes)):
                    pass
                    self.attributes[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(JavaClass.AttributeInfo.AttrBodyCode, self)._write__seq(io)
                self._io.write_u2be(self.max_stack)
                self._io.write_u2be(self.max_locals)
                self._io.write_u4be(self.code_length)
                self._io.write_bytes(self.code)
                self._io.write_u2be(self.exception_table_length)
                for i in range(len(self.exception_table)):
                    pass
                    self.exception_table[i]._write__seq(self._io)

                self._io.write_u2be(self.attributes_count)
                for i in range(len(self.attributes)):
                    pass
                    self.attributes[i]._write__seq(self._io)



            def _check(self):
                if len(self.code) != self.code_length:
                    raise kaitaistruct.ConsistencyError(u"code", self.code_length, len(self.code))
                if len(self.exception_table) != self.exception_table_length:
                    raise kaitaistruct.ConsistencyError(u"exception_table", self.exception_table_length, len(self.exception_table))
                for i in range(len(self.exception_table)):
                    pass
                    if self.exception_table[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"exception_table", self._root, self.exception_table[i]._root)
                    if self.exception_table[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"exception_table", self, self.exception_table[i]._parent)

                if len(self.attributes) != self.attributes_count:
                    raise kaitaistruct.ConsistencyError(u"attributes", self.attributes_count, len(self.attributes))
                for i in range(len(self.attributes)):
                    pass
                    if self.attributes[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"attributes", self._root, self.attributes[i]._root)
                    if self.attributes[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"attributes", self, self.attributes[i]._parent)

                self._dirty = False

            class ExceptionEntry(ReadWriteKaitaiStruct):
                """
                .. seealso::
                   Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3
                """
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.start_pc = self._io.read_u2be()
                    self.end_pc = self._io.read_u2be()
                    self.handler_pc = self._io.read_u2be()
                    self.catch_type = self._io.read_u2be()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry, self)._write__seq(io)
                    self._io.write_u2be(self.start_pc)
                    self._io.write_u2be(self.end_pc)
                    self._io.write_u2be(self.handler_pc)
                    self._io.write_u2be(self.catch_type)


                def _check(self):
                    self._dirty = False

                @property
                def catch_exception(self):
                    if hasattr(self, '_m_catch_exception'):
                        return self._m_catch_exception

                    if self.catch_type != 0:
                        pass
                        self._m_catch_exception = self._root.constant_pool[self.catch_type - 1]

                    return getattr(self, '_m_catch_exception', None)

                def _invalidate_catch_exception(self):
                    del self._m_catch_exception


        class AttrBodyExceptions(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(JavaClass.AttributeInfo.AttrBodyExceptions, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.number_of_exceptions = self._io.read_u2be()
                self.exceptions = []
                for i in range(self.number_of_exceptions):
                    _t_exceptions = JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry(self._io, self, self._root)
                    try:
                        _t_exceptions._read()
                    finally:
                        self.exceptions.append(_t_exceptions)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.exceptions)):
                    pass
                    self.exceptions[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(JavaClass.AttributeInfo.AttrBodyExceptions, self)._write__seq(io)
                self._io.write_u2be(self.number_of_exceptions)
                for i in range(len(self.exceptions)):
                    pass
                    self.exceptions[i]._write__seq(self._io)



            def _check(self):
                if len(self.exceptions) != self.number_of_exceptions:
                    raise kaitaistruct.ConsistencyError(u"exceptions", self.number_of_exceptions, len(self.exceptions))
                for i in range(len(self.exceptions)):
                    pass
                    if self.exceptions[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"exceptions", self._root, self.exceptions[i]._root)
                    if self.exceptions[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"exceptions", self, self.exceptions[i]._parent)

                self._dirty = False

            class ExceptionTableEntry(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.index = self._io.read_u2be()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry, self)._write__seq(io)
                    self._io.write_u2be(self.index)


                def _check(self):
                    self._dirty = False

                @property
                def as_info(self):
                    if hasattr(self, '_m_as_info'):
                        return self._m_as_info

                    self._m_as_info = self._root.constant_pool[self.index - 1].cp_info
                    return getattr(self, '_m_as_info', None)

                def _invalidate_as_info(self):
                    del self._m_as_info
                @property
                def name_as_str(self):
                    if hasattr(self, '_m_name_as_str'):
                        return self._m_name_as_str

                    self._m_name_as_str = self.as_info.name_as_str
                    return getattr(self, '_m_name_as_str', None)

                def _invalidate_name_as_str(self):
                    del self._m_name_as_str


        class AttrBodyLineNumberTable(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(JavaClass.AttributeInfo.AttrBodyLineNumberTable, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.line_number_table_length = self._io.read_u2be()
                self.line_number_table = []
                for i in range(self.line_number_table_length):
                    _t_line_number_table = JavaClass.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry(self._io, self, self._root)
                    try:
                        _t_line_number_table._read()
                    finally:
                        self.line_number_table.append(_t_line_number_table)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.line_number_table)):
                    pass
                    self.line_number_table[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(JavaClass.AttributeInfo.AttrBodyLineNumberTable, self)._write__seq(io)
                self._io.write_u2be(self.line_number_table_length)
                for i in range(len(self.line_number_table)):
                    pass
                    self.line_number_table[i]._write__seq(self._io)



            def _check(self):
                if len(self.line_number_table) != self.line_number_table_length:
                    raise kaitaistruct.ConsistencyError(u"line_number_table", self.line_number_table_length, len(self.line_number_table))
                for i in range(len(self.line_number_table)):
                    pass
                    if self.line_number_table[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"line_number_table", self._root, self.line_number_table[i]._root)
                    if self.line_number_table[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"line_number_table", self, self.line_number_table[i]._parent)

                self._dirty = False

            class LineNumberTableEntry(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(JavaClass.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.start_pc = self._io.read_u2be()
                    self.line_number = self._io.read_u2be()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(JavaClass.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry, self)._write__seq(io)
                    self._io.write_u2be(self.start_pc)
                    self._io.write_u2be(self.line_number)


                def _check(self):
                    self._dirty = False



        class AttrBodySourceFile(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(JavaClass.AttributeInfo.AttrBodySourceFile, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.sourcefile_index = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(JavaClass.AttributeInfo.AttrBodySourceFile, self)._write__seq(io)
                self._io.write_u2be(self.sourcefile_index)


            def _check(self):
                self._dirty = False

            @property
            def sourcefile_as_str(self):
                if hasattr(self, '_m_sourcefile_as_str'):
                    return self._m_sourcefile_as_str

                self._m_sourcefile_as_str = self._root.constant_pool[self.sourcefile_index - 1].cp_info.value
                return getattr(self, '_m_sourcefile_as_str', None)

            def _invalidate_sourcefile_as_str(self):
                del self._m_sourcefile_as_str

        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self._root.constant_pool[self.name_index - 1].cp_info.value
            return getattr(self, '_m_name_as_str', None)

        def _invalidate_name_as_str(self):
            del self._m_name_as_str

    class ClassCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.ClassCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.ClassCpInfo, self)._write__seq(io)
            self._io.write_u2be(self.name_index)


        def _check(self):
            self._dirty = False

        @property
        def name_as_info(self):
            if hasattr(self, '_m_name_as_info'):
                return self._m_name_as_info

            self._m_name_as_info = self._root.constant_pool[self.name_index - 1].cp_info
            return getattr(self, '_m_name_as_info', None)

        def _invalidate_name_as_info(self):
            del self._m_name_as_info
        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self.name_as_info.value
            return getattr(self, '_m_name_as_str', None)

        def _invalidate_name_as_str(self):
            del self._m_name_as_str

    class ConstantPoolEntry(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4
        """

        class TagEnum(IntEnum):
            utf8 = 1
            integer = 3
            float = 4
            long = 5
            double = 6
            class_type = 7
            string = 8
            field_ref = 9
            method_ref = 10
            interface_method_ref = 11
            name_and_type = 12
            method_handle = 15
            method_type = 16
            dynamic = 17
            invoke_dynamic = 18
            module = 19
            package = 20
        def __init__(self, is_prev_two_entries, _io=None, _parent=None, _root=None):
            super(JavaClass.ConstantPoolEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.is_prev_two_entries = is_prev_two_entries

        def _read(self):
            if (not (self.is_prev_two_entries)):
                pass
                self.tag = KaitaiStream.resolve_enum(JavaClass.ConstantPoolEntry.TagEnum, self._io.read_u1())

            if (not (self.is_prev_two_entries)):
                pass
                _on = self.tag
                if _on == JavaClass.ConstantPoolEntry.TagEnum.class_type:
                    pass
                    self.cp_info = JavaClass.ClassCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.double:
                    pass
                    self.cp_info = JavaClass.DoubleCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.dynamic:
                    pass
                    self.cp_info = JavaClass.DynamicCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.field_ref:
                    pass
                    self.cp_info = JavaClass.FieldRefCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.float:
                    pass
                    self.cp_info = JavaClass.FloatCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.integer:
                    pass
                    self.cp_info = JavaClass.IntegerCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.interface_method_ref:
                    pass
                    self.cp_info = JavaClass.InterfaceMethodRefCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.invoke_dynamic:
                    pass
                    self.cp_info = JavaClass.InvokeDynamicCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.long:
                    pass
                    self.cp_info = JavaClass.LongCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_handle:
                    pass
                    self.cp_info = JavaClass.MethodHandleCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_ref:
                    pass
                    self.cp_info = JavaClass.MethodRefCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_type:
                    pass
                    self.cp_info = JavaClass.MethodTypeCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.module:
                    pass
                    self.cp_info = JavaClass.ModulePackageCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.name_and_type:
                    pass
                    self.cp_info = JavaClass.NameAndTypeCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.package:
                    pass
                    self.cp_info = JavaClass.ModulePackageCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.string:
                    pass
                    self.cp_info = JavaClass.StringCpInfo(self._io, self, self._root)
                    self.cp_info._read()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.utf8:
                    pass
                    self.cp_info = JavaClass.Utf8CpInfo(self._io, self, self._root)
                    self.cp_info._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if (not (self.is_prev_two_entries)):
                pass

            if (not (self.is_prev_two_entries)):
                pass
                _on = self.tag
                if _on == JavaClass.ConstantPoolEntry.TagEnum.class_type:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.double:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.dynamic:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.field_ref:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.float:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.integer:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.interface_method_ref:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.invoke_dynamic:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.long:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_handle:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_ref:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_type:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.module:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.name_and_type:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.package:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.string:
                    pass
                    self.cp_info._fetch_instances()
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.utf8:
                    pass
                    self.cp_info._fetch_instances()



        def _write__seq(self, io=None):
            super(JavaClass.ConstantPoolEntry, self)._write__seq(io)
            if (not (self.is_prev_two_entries)):
                pass
                self._io.write_u1(int(self.tag))

            if (not (self.is_prev_two_entries)):
                pass
                _on = self.tag
                if _on == JavaClass.ConstantPoolEntry.TagEnum.class_type:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.double:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.dynamic:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.field_ref:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.float:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.integer:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.interface_method_ref:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.invoke_dynamic:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.long:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_handle:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_ref:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_type:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.module:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.name_and_type:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.package:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.string:
                    pass
                    self.cp_info._write__seq(self._io)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.utf8:
                    pass
                    self.cp_info._write__seq(self._io)



        def _check(self):
            if (not (self.is_prev_two_entries)):
                pass

            if (not (self.is_prev_two_entries)):
                pass
                _on = self.tag
                if _on == JavaClass.ConstantPoolEntry.TagEnum.class_type:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.double:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.dynamic:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.field_ref:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.float:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.integer:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.interface_method_ref:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.invoke_dynamic:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.long:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_handle:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_ref:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_type:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.module:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.name_and_type:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.package:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.string:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.utf8:
                    pass
                    if self.cp_info._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self._root, self.cp_info._root)
                    if self.cp_info._parent != self:
                        raise kaitaistruct.ConsistencyError(u"cp_info", self, self.cp_info._parent)

            self._dirty = False

        @property
        def is_two_entries(self):
            if hasattr(self, '_m_is_two_entries'):
                return self._m_is_two_entries

            self._m_is_two_entries = (False if self.is_prev_two_entries else  ((self.tag == JavaClass.ConstantPoolEntry.TagEnum.long) or (self.tag == JavaClass.ConstantPoolEntry.TagEnum.double)) )
            return getattr(self, '_m_is_two_entries', None)

        def _invalidate_is_two_entries(self):
            del self._m_is_two_entries

    class DoubleCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.DoubleCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = self._io.read_f8be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.DoubleCpInfo, self)._write__seq(io)
            self._io.write_f8be(self.value)


        def _check(self):
            self._dirty = False


    class DynamicCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.10
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.DynamicCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = JavaClass.VersionGuard(55, self._io, self, self._root)
            self._unnamed0._read()
            self.bootstrap_method_attr_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self._unnamed0._fetch_instances()


        def _write__seq(self, io=None):
            super(JavaClass.DynamicCpInfo, self)._write__seq(io)
            self._unnamed0._write__seq(self._io)
            self._io.write_u2be(self.bootstrap_method_attr_index)
            self._io.write_u2be(self.name_and_type_index)


        def _check(self):
            if self._unnamed0._root != self._root:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self._root, self._unnamed0._root)
            if self._unnamed0._parent != self:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self, self._unnamed0._parent)
            if self._unnamed0.major != 55:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 55, self._unnamed0.major)
            self._dirty = False


    class FieldInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.FieldInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.access_flags = self._io.read_u2be()
            self.name_index = self._io.read_u2be()
            self.descriptor_index = self._io.read_u2be()
            self.attributes_count = self._io.read_u2be()
            self.attributes = []
            for i in range(self.attributes_count):
                _t_attributes = JavaClass.AttributeInfo(self._io, self, self._root)
                try:
                    _t_attributes._read()
                finally:
                    self.attributes.append(_t_attributes)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.attributes)):
                pass
                self.attributes[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(JavaClass.FieldInfo, self)._write__seq(io)
            self._io.write_u2be(self.access_flags)
            self._io.write_u2be(self.name_index)
            self._io.write_u2be(self.descriptor_index)
            self._io.write_u2be(self.attributes_count)
            for i in range(len(self.attributes)):
                pass
                self.attributes[i]._write__seq(self._io)



        def _check(self):
            if len(self.attributes) != self.attributes_count:
                raise kaitaistruct.ConsistencyError(u"attributes", self.attributes_count, len(self.attributes))
            for i in range(len(self.attributes)):
                pass
                if self.attributes[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"attributes", self._root, self.attributes[i]._root)
                if self.attributes[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"attributes", self, self.attributes[i]._parent)

            self._dirty = False

        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self._root.constant_pool[self.name_index - 1].cp_info.value
            return getattr(self, '_m_name_as_str', None)

        def _invalidate_name_as_str(self):
            del self._m_name_as_str

    class FieldRefCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.FieldRefCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.class_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.FieldRefCpInfo, self)._write__seq(io)
            self._io.write_u2be(self.class_index)
            self._io.write_u2be(self.name_and_type_index)


        def _check(self):
            self._dirty = False

        @property
        def class_as_info(self):
            if hasattr(self, '_m_class_as_info'):
                return self._m_class_as_info

            self._m_class_as_info = self._root.constant_pool[self.class_index - 1].cp_info
            return getattr(self, '_m_class_as_info', None)

        def _invalidate_class_as_info(self):
            del self._m_class_as_info
        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info

            self._m_name_and_type_as_info = self._root.constant_pool[self.name_and_type_index - 1].cp_info
            return getattr(self, '_m_name_and_type_as_info', None)

        def _invalidate_name_and_type_as_info(self):
            del self._m_name_and_type_as_info

    class FloatCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.FloatCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = self._io.read_f4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.FloatCpInfo, self)._write__seq(io)
            self._io.write_f4be(self.value)


        def _check(self):
            self._dirty = False


    class IntegerCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.IntegerCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.IntegerCpInfo, self)._write__seq(io)
            self._io.write_u4be(self.value)


        def _check(self):
            self._dirty = False


    class InterfaceMethodRefCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.InterfaceMethodRefCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.class_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.InterfaceMethodRefCpInfo, self)._write__seq(io)
            self._io.write_u2be(self.class_index)
            self._io.write_u2be(self.name_and_type_index)


        def _check(self):
            self._dirty = False

        @property
        def class_as_info(self):
            if hasattr(self, '_m_class_as_info'):
                return self._m_class_as_info

            self._m_class_as_info = self._root.constant_pool[self.class_index - 1].cp_info
            return getattr(self, '_m_class_as_info', None)

        def _invalidate_class_as_info(self):
            del self._m_class_as_info
        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info

            self._m_name_and_type_as_info = self._root.constant_pool[self.name_and_type_index - 1].cp_info
            return getattr(self, '_m_name_and_type_as_info', None)

        def _invalidate_name_and_type_as_info(self):
            del self._m_name_and_type_as_info

    class InvokeDynamicCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.InvokeDynamicCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
            self._unnamed0._read()
            self.bootstrap_method_attr_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self._unnamed0._fetch_instances()


        def _write__seq(self, io=None):
            super(JavaClass.InvokeDynamicCpInfo, self)._write__seq(io)
            self._unnamed0._write__seq(self._io)
            self._io.write_u2be(self.bootstrap_method_attr_index)
            self._io.write_u2be(self.name_and_type_index)


        def _check(self):
            if self._unnamed0._root != self._root:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self._root, self._unnamed0._root)
            if self._unnamed0._parent != self:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self, self._unnamed0._parent)
            if self._unnamed0.major != 51:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 51, self._unnamed0.major)
            self._dirty = False


    class LongCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.LongCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = self._io.read_u8be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.LongCpInfo, self)._write__seq(io)
            self._io.write_u8be(self.value)


        def _check(self):
            self._dirty = False


    class MethodHandleCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8
        """

        class ReferenceKindEnum(IntEnum):
            get_field = 1
            get_static = 2
            put_field = 3
            put_static = 4
            invoke_virtual = 5
            invoke_static = 6
            invoke_special = 7
            new_invoke_special = 8
            invoke_interface = 9
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.MethodHandleCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
            self._unnamed0._read()
            self.reference_kind = KaitaiStream.resolve_enum(JavaClass.MethodHandleCpInfo.ReferenceKindEnum, self._io.read_u1())
            self.reference_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self._unnamed0._fetch_instances()


        def _write__seq(self, io=None):
            super(JavaClass.MethodHandleCpInfo, self)._write__seq(io)
            self._unnamed0._write__seq(self._io)
            self._io.write_u1(int(self.reference_kind))
            self._io.write_u2be(self.reference_index)


        def _check(self):
            if self._unnamed0._root != self._root:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self._root, self._unnamed0._root)
            if self._unnamed0._parent != self:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self, self._unnamed0._parent)
            if self._unnamed0.major != 51:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 51, self._unnamed0.major)
            self._dirty = False


    class MethodInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.MethodInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.access_flags = self._io.read_u2be()
            self.name_index = self._io.read_u2be()
            self.descriptor_index = self._io.read_u2be()
            self.attributes_count = self._io.read_u2be()
            self.attributes = []
            for i in range(self.attributes_count):
                _t_attributes = JavaClass.AttributeInfo(self._io, self, self._root)
                try:
                    _t_attributes._read()
                finally:
                    self.attributes.append(_t_attributes)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.attributes)):
                pass
                self.attributes[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(JavaClass.MethodInfo, self)._write__seq(io)
            self._io.write_u2be(self.access_flags)
            self._io.write_u2be(self.name_index)
            self._io.write_u2be(self.descriptor_index)
            self._io.write_u2be(self.attributes_count)
            for i in range(len(self.attributes)):
                pass
                self.attributes[i]._write__seq(self._io)



        def _check(self):
            if len(self.attributes) != self.attributes_count:
                raise kaitaistruct.ConsistencyError(u"attributes", self.attributes_count, len(self.attributes))
            for i in range(len(self.attributes)):
                pass
                if self.attributes[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"attributes", self._root, self.attributes[i]._root)
                if self.attributes[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"attributes", self, self.attributes[i]._parent)

            self._dirty = False

        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self._root.constant_pool[self.name_index - 1].cp_info.value
            return getattr(self, '_m_name_as_str', None)

        def _invalidate_name_as_str(self):
            del self._m_name_as_str

    class MethodRefCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.MethodRefCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.class_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.MethodRefCpInfo, self)._write__seq(io)
            self._io.write_u2be(self.class_index)
            self._io.write_u2be(self.name_and_type_index)


        def _check(self):
            self._dirty = False

        @property
        def class_as_info(self):
            if hasattr(self, '_m_class_as_info'):
                return self._m_class_as_info

            self._m_class_as_info = self._root.constant_pool[self.class_index - 1].cp_info
            return getattr(self, '_m_class_as_info', None)

        def _invalidate_class_as_info(self):
            del self._m_class_as_info
        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info

            self._m_name_and_type_as_info = self._root.constant_pool[self.name_and_type_index - 1].cp_info
            return getattr(self, '_m_name_and_type_as_info', None)

        def _invalidate_name_and_type_as_info(self):
            del self._m_name_and_type_as_info

    class MethodTypeCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.MethodTypeCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
            self._unnamed0._read()
            self.descriptor_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self._unnamed0._fetch_instances()


        def _write__seq(self, io=None):
            super(JavaClass.MethodTypeCpInfo, self)._write__seq(io)
            self._unnamed0._write__seq(self._io)
            self._io.write_u2be(self.descriptor_index)


        def _check(self):
            if self._unnamed0._root != self._root:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self._root, self._unnamed0._root)
            if self._unnamed0._parent != self:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self, self._unnamed0._parent)
            if self._unnamed0.major != 51:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 51, self._unnamed0.major)
            self._dirty = False


    class ModulePackageCpInfo(ReadWriteKaitaiStruct):
        """Project Jigsaw modules introduced in Java 9
        
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-3.html#jvms-3.16
        
        
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.11
        
        
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.12
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.ModulePackageCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = JavaClass.VersionGuard(53, self._io, self, self._root)
            self._unnamed0._read()
            self.name_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self._unnamed0._fetch_instances()


        def _write__seq(self, io=None):
            super(JavaClass.ModulePackageCpInfo, self)._write__seq(io)
            self._unnamed0._write__seq(self._io)
            self._io.write_u2be(self.name_index)


        def _check(self):
            if self._unnamed0._root != self._root:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self._root, self._unnamed0._root)
            if self._unnamed0._parent != self:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", self, self._unnamed0._parent)
            if self._unnamed0.major != 53:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 53, self._unnamed0.major)
            self._dirty = False

        @property
        def name_as_info(self):
            if hasattr(self, '_m_name_as_info'):
                return self._m_name_as_info

            self._m_name_as_info = self._root.constant_pool[self.name_index - 1].cp_info
            return getattr(self, '_m_name_as_info', None)

        def _invalidate_name_as_info(self):
            del self._m_name_as_info
        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self.name_as_info.value
            return getattr(self, '_m_name_as_str', None)

        def _invalidate_name_as_str(self):
            del self._m_name_as_str

    class NameAndTypeCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.NameAndTypeCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name_index = self._io.read_u2be()
            self.descriptor_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.NameAndTypeCpInfo, self)._write__seq(io)
            self._io.write_u2be(self.name_index)
            self._io.write_u2be(self.descriptor_index)


        def _check(self):
            self._dirty = False

        @property
        def descriptor_as_info(self):
            if hasattr(self, '_m_descriptor_as_info'):
                return self._m_descriptor_as_info

            self._m_descriptor_as_info = self._root.constant_pool[self.descriptor_index - 1].cp_info
            return getattr(self, '_m_descriptor_as_info', None)

        def _invalidate_descriptor_as_info(self):
            del self._m_descriptor_as_info
        @property
        def descriptor_as_str(self):
            if hasattr(self, '_m_descriptor_as_str'):
                return self._m_descriptor_as_str

            self._m_descriptor_as_str = self.descriptor_as_info.value
            return getattr(self, '_m_descriptor_as_str', None)

        def _invalidate_descriptor_as_str(self):
            del self._m_descriptor_as_str
        @property
        def name_as_info(self):
            if hasattr(self, '_m_name_as_info'):
                return self._m_name_as_info

            self._m_name_as_info = self._root.constant_pool[self.name_index - 1].cp_info
            return getattr(self, '_m_name_as_info', None)

        def _invalidate_name_as_info(self):
            del self._m_name_as_info
        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self.name_as_info.value
            return getattr(self, '_m_name_as_str', None)

        def _invalidate_name_as_str(self):
            del self._m_name_as_str

    class StringCpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.StringCpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.string_index = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.StringCpInfo, self)._write__seq(io)
            self._io.write_u2be(self.string_index)


        def _check(self):
            self._dirty = False


    class Utf8CpInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(JavaClass.Utf8CpInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.str_len = self._io.read_u2be()
            self.value = (self._io.read_bytes(self.str_len)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.Utf8CpInfo, self)._write__seq(io)
            self._io.write_u2be(self.str_len)
            self._io.write_bytes((self.value).encode(u"UTF-8"))


        def _check(self):
            if len((self.value).encode(u"UTF-8")) != self.str_len:
                raise kaitaistruct.ConsistencyError(u"value", self.str_len, len((self.value).encode(u"UTF-8")))
            self._dirty = False


    class VersionGuard(ReadWriteKaitaiStruct):
        """`class` file format version 45.3 (appeared in the very first publicly
        known release of Java SE AND JDK 1.0.2, released 23th January 1996) is so
        ancient that it's taken for granted. Earlier formats seem to be
        undocumented. Changes of `version_minor` don't change `class` format.
        Earlier `version_major`s likely belong to Oak programming language, the
        proprietary predecessor of Java.
        
        .. seealso::
           James Gosling, Bill Joy and Guy Steele. The Java Language Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Aug. 1996, p. 825. ISBN: 0-201-63451-1.
        
        
        .. seealso::
           Frank Yellin and Tim Lindholm. The Java Virtual Machine Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Sept. 1996, p. 475. ISBN: 0-201-63452-X.
        """
        def __init__(self, major, _io=None, _parent=None, _root=None):
            super(JavaClass.VersionGuard, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.major = major

        def _read(self):
            self._unnamed0 = self._io.read_bytes(0)
            _ = self._unnamed0
            if not self._root.version_major >= self.major:
                raise kaitaistruct.ValidationExprError(self._unnamed0, self._io, u"/types/version_guard/seq/0")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(JavaClass.VersionGuard, self)._write__seq(io)
            self._io.write_bytes(self._unnamed0)


        def _check(self):
            if len(self._unnamed0) != 0:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 0, len(self._unnamed0))
            _ = self._unnamed0
            if not self._root.version_major >= self.major:
                raise kaitaistruct.ValidationExprError(self._unnamed0, None, u"/types/version_guard/seq/0")
            self._dirty = False



