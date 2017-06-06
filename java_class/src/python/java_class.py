# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
import struct
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class JavaClass(KaitaiStruct):
    """
    .. seealso::
       Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.1
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.ensure_fixed_contents(struct.pack('4b', -54, -2, -70, -66))
        self.version_minor = self._io.read_u2be()
        self.version_major = self._io.read_u2be()
        self.constant_pool_count = self._io.read_u2be()
        self.constant_pool = [None] * ((self.constant_pool_count - 1))
        for i in range((self.constant_pool_count - 1)):
            self.constant_pool[i] = self._root.ConstantPoolEntry(self._io, self, self._root)

        self.access_flags = self._io.read_u2be()
        self.this_class = self._io.read_u2be()
        self.super_class = self._io.read_u2be()
        self.interfaces_count = self._io.read_u2be()
        self.interfaces = [None] * (self.interfaces_count)
        for i in range(self.interfaces_count):
            self.interfaces[i] = self._io.read_u2be()

        self.fields_count = self._io.read_u2be()
        self.fields = [None] * (self.fields_count)
        for i in range(self.fields_count):
            self.fields[i] = self._root.FieldInfo(self._io, self, self._root)

        self.methods_count = self._io.read_u2be()
        self.methods = [None] * (self.methods_count)
        for i in range(self.methods_count):
            self.methods[i] = self._root.MethodInfo(self._io, self, self._root)

        self.attributes_count = self._io.read_u2be()
        self.attributes = [None] * (self.attributes_count)
        for i in range(self.attributes_count):
            self.attributes[i] = self._root.AttributeInfo(self._io, self, self._root)


    class FloatCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.value = self._io.read_f4be()


    class AttributeInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name_index = self._io.read_u2be()
            self.attribute_length = self._io.read_u4be()
            _on = self.name_as_str
            if _on == u"SourceFile":
                self._raw_info = self._io.read_bytes(self.attribute_length)
                io = KaitaiStream(BytesIO(self._raw_info))
                self.info = self._root.AttributeInfo.AttrBodySourceFile(io, self, self._root)
            elif _on == u"LineNumberTable":
                self._raw_info = self._io.read_bytes(self.attribute_length)
                io = KaitaiStream(BytesIO(self._raw_info))
                self.info = self._root.AttributeInfo.AttrBodyLineNumberTable(io, self, self._root)
            elif _on == u"Exceptions":
                self._raw_info = self._io.read_bytes(self.attribute_length)
                io = KaitaiStream(BytesIO(self._raw_info))
                self.info = self._root.AttributeInfo.AttrBodyExceptions(io, self, self._root)
            elif _on == u"Code":
                self._raw_info = self._io.read_bytes(self.attribute_length)
                io = KaitaiStream(BytesIO(self._raw_info))
                self.info = self._root.AttributeInfo.AttrBodyCode(io, self, self._root)
            else:
                self.info = self._io.read_bytes(self.attribute_length)

        class AttrBodyCode(KaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.max_stack = self._io.read_u2be()
                self.max_locals = self._io.read_u2be()
                self.code_length = self._io.read_u4be()
                self.code = self._io.read_bytes(self.code_length)
                self.exception_table_length = self._io.read_u2be()
                self.exception_table = [None] * (self.exception_table_length)
                for i in range(self.exception_table_length):
                    self.exception_table[i] = self._root.AttributeInfo.AttrBodyCode.ExceptionEntry(self._io, self, self._root)

                self.attributes_count = self._io.read_u2be()
                self.attributes = [None] * (self.attributes_count)
                for i in range(self.attributes_count):
                    self.attributes[i] = self._root.AttributeInfo(self._io, self, self._root)


            class ExceptionEntry(KaitaiStruct):
                """
                .. seealso::
                   Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3
                """
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.start_pc = self._io.read_u2be()
                    self.end_pc = self._io.read_u2be()
                    self.handler_pc = self._io.read_u2be()
                    self.catch_type = self._io.read_u2be()

                @property
                def catch_exception(self):
                    if hasattr(self, '_m_catch_exception'):
                        return self._m_catch_exception if hasattr(self, '_m_catch_exception') else None

                    if self.catch_type != 0:
                        self._m_catch_exception = self._root.constant_pool[(self.catch_type - 1)]

                    return self._m_catch_exception if hasattr(self, '_m_catch_exception') else None



        class AttrBodyExceptions(KaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.number_of_exceptions = self._io.read_u2be()
                self.exceptions = [None] * (self.number_of_exceptions)
                for i in range(self.number_of_exceptions):
                    self.exceptions[i] = self._root.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry(self._io, self, self._root)


            class ExceptionTableEntry(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.index = self._io.read_u2be()

                @property
                def as_info(self):
                    if hasattr(self, '_m_as_info'):
                        return self._m_as_info if hasattr(self, '_m_as_info') else None

                    self._m_as_info = self._root.constant_pool[(self.index - 1)].cp_info
                    return self._m_as_info if hasattr(self, '_m_as_info') else None

                @property
                def name_as_str(self):
                    if hasattr(self, '_m_name_as_str'):
                        return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None

                    self._m_name_as_str = self.as_info.name_as_str
                    return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None



        class AttrBodySourceFile(KaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.sourcefile_index = self._io.read_u2be()

            @property
            def sourcefile_as_str(self):
                if hasattr(self, '_m_sourcefile_as_str'):
                    return self._m_sourcefile_as_str if hasattr(self, '_m_sourcefile_as_str') else None

                self._m_sourcefile_as_str = self._root.constant_pool[(self.sourcefile_index - 1)].cp_info.value
                return self._m_sourcefile_as_str if hasattr(self, '_m_sourcefile_as_str') else None


        class AttrBodyLineNumberTable(KaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.line_number_table_length = self._io.read_u2be()
                self.line_number_table = [None] * (self.line_number_table_length)
                for i in range(self.line_number_table_length):
                    self.line_number_table[i] = self._root.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry(self._io, self, self._root)


            class LineNumberTableEntry(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.start_pc = self._io.read_u2be()
                    self.line_number = self._io.read_u2be()



        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None

            self._m_name_as_str = self._root.constant_pool[(self.name_index - 1)].cp_info.value
            return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None


    class MethodRefCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.class_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()

        @property
        def class_as_info(self):
            if hasattr(self, '_m_class_as_info'):
                return self._m_class_as_info if hasattr(self, '_m_class_as_info') else None

            self._m_class_as_info = self._root.constant_pool[(self.class_index - 1)].cp_info
            return self._m_class_as_info if hasattr(self, '_m_class_as_info') else None

        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info if hasattr(self, '_m_name_and_type_as_info') else None

            self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1)].cp_info
            return self._m_name_and_type_as_info if hasattr(self, '_m_name_and_type_as_info') else None


    class FieldInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.access_flags = self._io.read_u2be()
            self.name_index = self._io.read_u2be()
            self.descriptor_index = self._io.read_u2be()
            self.attributes_count = self._io.read_u2be()
            self.attributes = [None] * (self.attributes_count)
            for i in range(self.attributes_count):
                self.attributes[i] = self._root.AttributeInfo(self._io, self, self._root)


        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None

            self._m_name_as_str = self._root.constant_pool[(self.name_index - 1)].cp_info.value
            return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None


    class DoubleCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.value = self._io.read_f8be()


    class LongCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.value = self._io.read_u8be()


    class InvokeDynamicCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bootstrap_method_attr_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()


    class MethodHandleCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8
        """

        class ReferenceKindEnum(Enum):
            get_field = 1
            get_static = 2
            put_field = 3
            put_static = 4
            invoke_virtual = 5
            invoke_static = 6
            invoke_special = 7
            new_invoke_special = 8
            invoke_interface = 9
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.reference_kind = self._root.MethodHandleCpInfo.ReferenceKindEnum(self._io.read_u1())
            self.reference_index = self._io.read_u2be()


    class NameAndTypeCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name_index = self._io.read_u2be()
            self.descriptor_index = self._io.read_u2be()

        @property
        def name_as_info(self):
            if hasattr(self, '_m_name_as_info'):
                return self._m_name_as_info if hasattr(self, '_m_name_as_info') else None

            self._m_name_as_info = self._root.constant_pool[(self.name_index - 1)].cp_info
            return self._m_name_as_info if hasattr(self, '_m_name_as_info') else None

        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None

            self._m_name_as_str = self.name_as_info.value
            return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None

        @property
        def descriptor_as_info(self):
            if hasattr(self, '_m_descriptor_as_info'):
                return self._m_descriptor_as_info if hasattr(self, '_m_descriptor_as_info') else None

            self._m_descriptor_as_info = self._root.constant_pool[(self.descriptor_index - 1)].cp_info
            return self._m_descriptor_as_info if hasattr(self, '_m_descriptor_as_info') else None

        @property
        def descriptor_as_str(self):
            if hasattr(self, '_m_descriptor_as_str'):
                return self._m_descriptor_as_str if hasattr(self, '_m_descriptor_as_str') else None

            self._m_descriptor_as_str = self.descriptor_as_info.value
            return self._m_descriptor_as_str if hasattr(self, '_m_descriptor_as_str') else None


    class Utf8CpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.str_len = self._io.read_u2be()
            self.value = (self._io.read_bytes(self.str_len)).decode(u"UTF-8")


    class StringCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.string_index = self._io.read_u2be()


    class MethodTypeCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.descriptor_index = self._io.read_u2be()


    class InterfaceMethodRefCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.class_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()

        @property
        def class_as_info(self):
            if hasattr(self, '_m_class_as_info'):
                return self._m_class_as_info if hasattr(self, '_m_class_as_info') else None

            self._m_class_as_info = self._root.constant_pool[(self.class_index - 1)].cp_info
            return self._m_class_as_info if hasattr(self, '_m_class_as_info') else None

        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info if hasattr(self, '_m_name_and_type_as_info') else None

            self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1)].cp_info
            return self._m_name_and_type_as_info if hasattr(self, '_m_name_and_type_as_info') else None


    class ClassCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name_index = self._io.read_u2be()

        @property
        def name_as_info(self):
            if hasattr(self, '_m_name_as_info'):
                return self._m_name_as_info if hasattr(self, '_m_name_as_info') else None

            self._m_name_as_info = self._root.constant_pool[(self.name_index - 1)].cp_info
            return self._m_name_as_info if hasattr(self, '_m_name_as_info') else None

        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None

            self._m_name_as_str = self.name_as_info.value
            return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None


    class ConstantPoolEntry(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4
        """

        class TagEnum(Enum):
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
            invoke_dynamic = 18
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.tag = self._root.ConstantPoolEntry.TagEnum(self._io.read_u1())
            _on = self.tag
            if _on == self._root.ConstantPoolEntry.TagEnum.string:
                self.cp_info = self._root.StringCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.double:
                self.cp_info = self._root.DoubleCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.invoke_dynamic:
                self.cp_info = self._root.InvokeDynamicCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.method_handle:
                self.cp_info = self._root.MethodHandleCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.class_type:
                self.cp_info = self._root.ClassCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.method_ref:
                self.cp_info = self._root.MethodRefCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.long:
                self.cp_info = self._root.LongCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.name_and_type:
                self.cp_info = self._root.NameAndTypeCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.float:
                self.cp_info = self._root.FloatCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.interface_method_ref:
                self.cp_info = self._root.InterfaceMethodRefCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.integer:
                self.cp_info = self._root.IntegerCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.utf8:
                self.cp_info = self._root.Utf8CpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.field_ref:
                self.cp_info = self._root.FieldRefCpInfo(self._io, self, self._root)
            elif _on == self._root.ConstantPoolEntry.TagEnum.method_type:
                self.cp_info = self._root.MethodTypeCpInfo(self._io, self, self._root)


    class MethodInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.access_flags = self._io.read_u2be()
            self.name_index = self._io.read_u2be()
            self.descriptor_index = self._io.read_u2be()
            self.attributes_count = self._io.read_u2be()
            self.attributes = [None] * (self.attributes_count)
            for i in range(self.attributes_count):
                self.attributes[i] = self._root.AttributeInfo(self._io, self, self._root)


        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None

            self._m_name_as_str = self._root.constant_pool[(self.name_index - 1)].cp_info.value
            return self._m_name_as_str if hasattr(self, '_m_name_as_str') else None


    class IntegerCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.value = self._io.read_u4be()


    class FieldRefCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.class_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()

        @property
        def class_as_info(self):
            if hasattr(self, '_m_class_as_info'):
                return self._m_class_as_info if hasattr(self, '_m_class_as_info') else None

            self._m_class_as_info = self._root.constant_pool[(self.class_index - 1)].cp_info
            return self._m_class_as_info if hasattr(self, '_m_class_as_info') else None

        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info if hasattr(self, '_m_name_and_type_as_info') else None

            self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1)].cp_info
            return self._m_name_and_type_as_info if hasattr(self, '_m_name_and_type_as_info') else None



