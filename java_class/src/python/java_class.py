# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class JavaClass(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

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
        for i in range((self.constant_pool_count - 1)):
            self.constant_pool.append(JavaClass.ConstantPoolEntry((self.constant_pool[(i - 1)].is_two_entries if i != 0 else False), self._io, self, self._root))

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
            self.fields.append(JavaClass.FieldInfo(self._io, self, self._root))

        self.methods_count = self._io.read_u2be()
        self.methods = []
        for i in range(self.methods_count):
            self.methods.append(JavaClass.MethodInfo(self._io, self, self._root))

        self.attributes_count = self._io.read_u2be()
        self.attributes = []
        for i in range(self.attributes_count):
            self.attributes.append(JavaClass.AttributeInfo(self._io, self, self._root))


    class VersionGuard(KaitaiStruct):
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
        def __init__(self, major, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.major = major
            self._read()

        def _read(self):
            self._unnamed0 = self._io.read_bytes(0)
            _ = self._unnamed0
            if not self._root.version_major >= self.major:
                raise kaitaistruct.ValidationExprError(self._unnamed0, self._io, u"/types/version_guard/seq/0")


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
                _io__raw_info = KaitaiStream(BytesIO(self._raw_info))
                self.info = JavaClass.AttributeInfo.AttrBodySourceFile(_io__raw_info, self, self._root)
            elif _on == u"LineNumberTable":
                self._raw_info = self._io.read_bytes(self.attribute_length)
                _io__raw_info = KaitaiStream(BytesIO(self._raw_info))
                self.info = JavaClass.AttributeInfo.AttrBodyLineNumberTable(_io__raw_info, self, self._root)
            elif _on == u"Exceptions":
                self._raw_info = self._io.read_bytes(self.attribute_length)
                _io__raw_info = KaitaiStream(BytesIO(self._raw_info))
                self.info = JavaClass.AttributeInfo.AttrBodyExceptions(_io__raw_info, self, self._root)
            elif _on == u"Code":
                self._raw_info = self._io.read_bytes(self.attribute_length)
                _io__raw_info = KaitaiStream(BytesIO(self._raw_info))
                self.info = JavaClass.AttributeInfo.AttrBodyCode(_io__raw_info, self, self._root)
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
                self.exception_table = []
                for i in range(self.exception_table_length):
                    self.exception_table.append(JavaClass.AttributeInfo.AttrBodyCode.ExceptionEntry(self._io, self, self._root))

                self.attributes_count = self._io.read_u2be()
                self.attributes = []
                for i in range(self.attributes_count):
                    self.attributes.append(JavaClass.AttributeInfo(self._io, self, self._root))


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
                        return self._m_catch_exception

                    if self.catch_type != 0:
                        self._m_catch_exception = self._root.constant_pool[(self.catch_type - 1)]

                    return getattr(self, '_m_catch_exception', None)



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
                self.exceptions = []
                for i in range(self.number_of_exceptions):
                    self.exceptions.append(JavaClass.AttributeInfo.AttrBodyExceptions.ExceptionTableEntry(self._io, self, self._root))


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
                        return self._m_as_info

                    self._m_as_info = self._root.constant_pool[(self.index - 1)].cp_info
                    return getattr(self, '_m_as_info', None)

                @property
                def name_as_str(self):
                    if hasattr(self, '_m_name_as_str'):
                        return self._m_name_as_str

                    self._m_name_as_str = self.as_info.name_as_str
                    return getattr(self, '_m_name_as_str', None)



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
                    return self._m_sourcefile_as_str

                self._m_sourcefile_as_str = self._root.constant_pool[(self.sourcefile_index - 1)].cp_info.value
                return getattr(self, '_m_sourcefile_as_str', None)


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
                self.line_number_table = []
                for i in range(self.line_number_table_length):
                    self.line_number_table.append(JavaClass.AttributeInfo.AttrBodyLineNumberTable.LineNumberTableEntry(self._io, self, self._root))


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
                return self._m_name_as_str

            self._m_name_as_str = self._root.constant_pool[(self.name_index - 1)].cp_info.value
            return getattr(self, '_m_name_as_str', None)


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
                return self._m_class_as_info

            self._m_class_as_info = self._root.constant_pool[(self.class_index - 1)].cp_info
            return getattr(self, '_m_class_as_info', None)

        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info

            self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1)].cp_info
            return getattr(self, '_m_name_and_type_as_info', None)


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
            self.attributes = []
            for i in range(self.attributes_count):
                self.attributes.append(JavaClass.AttributeInfo(self._io, self, self._root))


        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self._root.constant_pool[(self.name_index - 1)].cp_info.value
            return getattr(self, '_m_name_as_str', None)


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


    class DynamicCpInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.10
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self._unnamed0 = JavaClass.VersionGuard(55, self._io, self, self._root)
            self.bootstrap_method_attr_index = self._io.read_u2be()
            self.name_and_type_index = self._io.read_u2be()


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
            self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
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
            self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
            self.reference_kind = KaitaiStream.resolve_enum(JavaClass.MethodHandleCpInfo.ReferenceKindEnum, self._io.read_u1())
            self.reference_index = self._io.read_u2be()


    class ModulePackageCpInfo(KaitaiStruct):
        """Project Jigsaw modules introduced in Java 9
        
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-3.html#jvms-3.16
        
        
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.11
        
        
        .. seealso::
           Source - https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.12
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self._unnamed0 = JavaClass.VersionGuard(53, self._io, self, self._root)
            self.name_index = self._io.read_u2be()

        @property
        def name_as_info(self):
            if hasattr(self, '_m_name_as_info'):
                return self._m_name_as_info

            self._m_name_as_info = self._root.constant_pool[(self.name_index - 1)].cp_info
            return getattr(self, '_m_name_as_info', None)

        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self.name_as_info.value
            return getattr(self, '_m_name_as_str', None)


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
                return self._m_name_as_info

            self._m_name_as_info = self._root.constant_pool[(self.name_index - 1)].cp_info
            return getattr(self, '_m_name_as_info', None)

        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self.name_as_info.value
            return getattr(self, '_m_name_as_str', None)

        @property
        def descriptor_as_info(self):
            if hasattr(self, '_m_descriptor_as_info'):
                return self._m_descriptor_as_info

            self._m_descriptor_as_info = self._root.constant_pool[(self.descriptor_index - 1)].cp_info
            return getattr(self, '_m_descriptor_as_info', None)

        @property
        def descriptor_as_str(self):
            if hasattr(self, '_m_descriptor_as_str'):
                return self._m_descriptor_as_str

            self._m_descriptor_as_str = self.descriptor_as_info.value
            return getattr(self, '_m_descriptor_as_str', None)


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
            self._unnamed0 = JavaClass.VersionGuard(51, self._io, self, self._root)
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
                return self._m_class_as_info

            self._m_class_as_info = self._root.constant_pool[(self.class_index - 1)].cp_info
            return getattr(self, '_m_class_as_info', None)

        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info

            self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1)].cp_info
            return getattr(self, '_m_name_and_type_as_info', None)


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
                return self._m_name_as_info

            self._m_name_as_info = self._root.constant_pool[(self.name_index - 1)].cp_info
            return getattr(self, '_m_name_as_info', None)

        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self.name_as_info.value
            return getattr(self, '_m_name_as_str', None)


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
            dynamic = 17
            invoke_dynamic = 18
            module = 19
            package = 20
        def __init__(self, is_prev_two_entries, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.is_prev_two_entries = is_prev_two_entries
            self._read()

        def _read(self):
            if not (self.is_prev_two_entries):
                self.tag = KaitaiStream.resolve_enum(JavaClass.ConstantPoolEntry.TagEnum, self._io.read_u1())

            if not (self.is_prev_two_entries):
                _on = self.tag
                if _on == JavaClass.ConstantPoolEntry.TagEnum.interface_method_ref:
                    self.cp_info = JavaClass.InterfaceMethodRefCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.class_type:
                    self.cp_info = JavaClass.ClassCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.dynamic:
                    self.cp_info = JavaClass.DynamicCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.utf8:
                    self.cp_info = JavaClass.Utf8CpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_type:
                    self.cp_info = JavaClass.MethodTypeCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.integer:
                    self.cp_info = JavaClass.IntegerCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.string:
                    self.cp_info = JavaClass.StringCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.float:
                    self.cp_info = JavaClass.FloatCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.module:
                    self.cp_info = JavaClass.ModulePackageCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.long:
                    self.cp_info = JavaClass.LongCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_ref:
                    self.cp_info = JavaClass.MethodRefCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.double:
                    self.cp_info = JavaClass.DoubleCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.invoke_dynamic:
                    self.cp_info = JavaClass.InvokeDynamicCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.field_ref:
                    self.cp_info = JavaClass.FieldRefCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.method_handle:
                    self.cp_info = JavaClass.MethodHandleCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.package:
                    self.cp_info = JavaClass.ModulePackageCpInfo(self._io, self, self._root)
                elif _on == JavaClass.ConstantPoolEntry.TagEnum.name_and_type:
                    self.cp_info = JavaClass.NameAndTypeCpInfo(self._io, self, self._root)


        @property
        def is_two_entries(self):
            if hasattr(self, '_m_is_two_entries'):
                return self._m_is_two_entries

            self._m_is_two_entries = (False if self.is_prev_two_entries else  ((self.tag == JavaClass.ConstantPoolEntry.TagEnum.long) or (self.tag == JavaClass.ConstantPoolEntry.TagEnum.double)) )
            return getattr(self, '_m_is_two_entries', None)


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
            self.attributes = []
            for i in range(self.attributes_count):
                self.attributes.append(JavaClass.AttributeInfo(self._io, self, self._root))


        @property
        def name_as_str(self):
            if hasattr(self, '_m_name_as_str'):
                return self._m_name_as_str

            self._m_name_as_str = self._root.constant_pool[(self.name_index - 1)].cp_info.value
            return getattr(self, '_m_name_as_str', None)


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
                return self._m_class_as_info

            self._m_class_as_info = self._root.constant_pool[(self.class_index - 1)].cp_info
            return getattr(self, '_m_class_as_info', None)

        @property
        def name_and_type_as_info(self):
            if hasattr(self, '_m_name_and_type_as_info'):
                return self._m_name_and_type_as_info

            self._m_name_and_type_as_info = self._root.constant_pool[(self.name_and_type_index - 1)].cp_info
            return getattr(self, '_m_name_and_type_as_info', None)



