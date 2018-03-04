# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Dex(KaitaiStruct):
    """
    .. seealso::
       Source - https://source.android.com/devices/tech/dalvik/dex-format
    """

    class ClassAccessFlags(Enum):
        public = 1
        private = 2
        protected = 4
        static = 8
        final = 16
        interface = 512
        abstract = 1024
        synthetic = 4096
        annotation = 8192
        enum = 16384
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = self._root.HeaderItem(self._io, self, self._root)

    class HeaderItem(KaitaiStruct):

        class EndianConstant(Enum):
            endian_constant = 305419896
            reverse_endian_constant = 2018915346
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\x64\x65\x78\x0A")
            self.version_str = (self._io.read_bytes(3)).decode(u"ascii")
            self.magic2 = self._io.ensure_fixed_contents(b"\x00")
            self.checksum = self._io.read_u4le()
            self.signature = self._io.read_bytes(20)
            self.file_size = self._io.read_u4le()
            self.header_size = self._io.read_u4le()
            self.endian_tag = self._root.HeaderItem.EndianConstant(self._io.read_u4le())
            self.link_size = self._io.read_u4le()
            self.link_off = self._io.read_u4le()
            self.map_off = self._io.read_u4le()
            self.string_ids_size = self._io.read_u4le()
            self.string_ids_off = self._io.read_u4le()
            self.type_ids_size = self._io.read_u4le()
            self.type_ids_off = self._io.read_u4le()
            self.proto_ids_size = self._io.read_u4le()
            self.proto_ids_off = self._io.read_u4le()
            self.field_ids_size = self._io.read_u4le()
            self.field_ids_off = self._io.read_u4le()
            self.method_ids_size = self._io.read_u4le()
            self.method_ids_off = self._io.read_u4le()
            self.class_defs_size = self._io.read_u4le()
            self.class_defs_off = self._io.read_u4le()
            self.data_size = self._io.read_u4le()
            self.data_off = self._io.read_u4le()


    class MapList(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.list = [None] * (self.size)
            for i in range(self.size):
                self.list[i] = self._root.MapItem(self._io, self, self._root)



    class EncodedValue(KaitaiStruct):

        class ValueTypeEnum(Enum):
            byte = 0
            short = 2
            char = 3
            int = 4
            long = 6
            float = 16
            double = 17
            method_type = 21
            method_handle = 22
            string = 23
            type = 24
            field = 25
            method = 26
            enum = 27
            array = 28
            annotation = 29
            null = 30
            boolean = 31
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.value_arg = self._io.read_bits_int(3)
            self.value_type = self._root.EncodedValue.ValueTypeEnum(self._io.read_bits_int(5))
            self._io.align_to_byte()
            _on = self.value_type
            if _on == self._root.EncodedValue.ValueTypeEnum.double:
                self.value = self._io.read_f8le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.annotation:
                self.value = self._root.EncodedAnnotation(self._io, self, self._root)
            elif _on == self._root.EncodedValue.ValueTypeEnum.type:
                self.value = self._io.read_u4le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.char:
                self.value = self._io.read_u2le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.method_handle:
                self.value = self._io.read_u4le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.array:
                self.value = self._root.EncodedArray(self._io, self, self._root)
            elif _on == self._root.EncodedValue.ValueTypeEnum.byte:
                self.value = self._io.read_s1()
            elif _on == self._root.EncodedValue.ValueTypeEnum.method:
                self.value = self._io.read_u4le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.method_type:
                self.value = self._io.read_u4le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.short:
                self.value = self._io.read_s2le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.string:
                self.value = self._io.read_u4le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.int:
                self.value = self._io.read_s4le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.field:
                self.value = self._io.read_u4le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.long:
                self.value = self._io.read_s8le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.float:
                self.value = self._io.read_f4le()
            elif _on == self._root.EncodedValue.ValueTypeEnum.enum:
                self.value = self._io.read_u4le()


    class CallSiteIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.call_site_off = self._io.read_u4le()


    class MethodIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.class_idx = self._io.read_u2le()
            self.proto_idx = self._io.read_u2le()
            self.name_idx = self._io.read_u4le()


    class Uleb128(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.b1 = self._io.read_u1()
            if (self.b1 & 128) != 0:
                self.b2 = self._io.read_u1()

            if (self.b2 & 128) != 0:
                self.b3 = self._io.read_u1()

            if (self.b3 & 128) != 0:
                self.b4 = self._io.read_u1()

            if (self.b4 & 128) != 0:
                self.b5 = self._io.read_u1()

            if (self.b5 & 128) != 0:
                self.b6 = self._io.read_u1()

            if (self.b6 & 128) != 0:
                self.b7 = self._io.read_u1()

            if (self.b7 & 128) != 0:
                self.b8 = self._io.read_u1()

            if (self.b8 & 128) != 0:
                self.b9 = self._io.read_u1()

            if (self.b9 & 128) != 0:
                self.b10 = self._io.read_u1()


        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = (((self.b1 % 128) << 0) + (0 if (self.b1 & 128) == 0 else (((self.b2 % 128) << 7) + (0 if (self.b2 & 128) == 0 else (((self.b3 % 128) << 14) + (0 if (self.b3 & 128) == 0 else (((self.b4 % 128) << 21) + (0 if (self.b4 & 128) == 0 else (((self.b5 % 128) << 28) + (0 if (self.b5 & 128) == 0 else (((self.b6 % 128) << 35) + (0 if (self.b6 & 128) == 0 else (((self.b7 % 128) << 42) + (0 if (self.b7 & 128) == 0 else (((self.b8 % 128) << 49) + (0 if (self.b8 & 128) == 0 else (((self.b9 % 128) << 56) + (0 if (self.b8 & 128) == 0 else ((self.b10 % 128) << 63)))))))))))))))))))
            return self._m_value


    class TypeIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.descriptor_idx = self._io.read_u4le()

        @property
        def type_name(self):
            if hasattr(self, '_m_type_name'):
                return self._m_type_name

            self._m_type_name = self._root.string_ids[self.descriptor_idx].value.data
            return self._m_type_name


    class AnnotationElement(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name_idx = self._root.Uleb128(self._io, self, self._root)
            self.value = self._root.EncodedValue(self._io, self, self._root)


    class EncodedField(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.field_idx_diff = self._root.Uleb128(self._io, self, self._root)
            self.access_flags = self._root.Uleb128(self._io, self, self._root)


    class EncodedArrayItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.value = self._root.EncodedArray(self._io, self, self._root)


    class ClassDataItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.static_fields_size = self._root.Uleb128(self._io, self, self._root)
            self.instance_fields_size = self._root.Uleb128(self._io, self, self._root)
            self.direct_methods_size = self._root.Uleb128(self._io, self, self._root)
            self.virtual_methods_size = self._root.Uleb128(self._io, self, self._root)
            self.static_fields = [None] * (self.static_fields_size.value)
            for i in range(self.static_fields_size.value):
                self.static_fields[i] = self._root.EncodedField(self._io, self, self._root)

            self.instance_fields = [None] * (self.instance_fields_size.value)
            for i in range(self.instance_fields_size.value):
                self.instance_fields[i] = self._root.EncodedField(self._io, self, self._root)

            self.direct_methods = [None] * (self.direct_methods_size.value)
            for i in range(self.direct_methods_size.value):
                self.direct_methods[i] = self._root.EncodedMethod(self._io, self, self._root)

            self.virtual_methods = [None] * (self.virtual_methods_size.value)
            for i in range(self.virtual_methods_size.value):
                self.virtual_methods[i] = self._root.EncodedMethod(self._io, self, self._root)



    class FieldIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.class_idx = self._io.read_u2le()
            self.type_idx = self._io.read_u2le()
            self.name_idx = self._io.read_u4le()


    class EncodedAnnotation(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.type_idx = self._root.Uleb128(self._io, self, self._root)
            self.size = self._root.Uleb128(self._io, self, self._root)
            self.elements = [None] * (self.size.value)
            for i in range(self.size.value):
                self.elements[i] = self._root.AnnotationElement(self._io, self, self._root)



    class ClassDefItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.class_idx = self._io.read_u4le()
            self.access_flags = self._root.ClassAccessFlags(self._io.read_u4le())
            self.superclass_idx = self._io.read_u4le()
            self.interfaces_off = self._io.read_u4le()
            self.source_file_idx = self._io.read_u4le()
            self.annotations_off = self._io.read_u4le()
            self.class_data_off = self._io.read_u4le()
            self.static_values_off = self._io.read_u4le()

        @property
        def type_name(self):
            if hasattr(self, '_m_type_name'):
                return self._m_type_name

            self._m_type_name = self._root.type_ids[self.class_idx].type_name
            return self._m_type_name

        @property
        def class_data(self):
            if hasattr(self, '_m_class_data'):
                return self._m_class_data

            if self.class_data_off != 0:
                _pos = self._io.pos()
                self._io.seek(self.class_data_off)
                self._m_class_data = self._root.ClassDataItem(self._io, self, self._root)
                self._io.seek(_pos)

            return self._m_class_data

        @property
        def static_values(self):
            if hasattr(self, '_m_static_values'):
                return self._m_static_values

            if self.static_values_off != 0:
                _pos = self._io.pos()
                self._io.seek(self.static_values_off)
                self._m_static_values = self._root.EncodedArrayItem(self._io, self, self._root)
                self._io.seek(_pos)

            return self._m_static_values


    class StringIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.string_data_off = self._io.read_u4le()

        class StringDataItem(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.utf16_size = self._root.Uleb128(self._io, self, self._root)
                self.data = (self._io.read_bytes(self.utf16_size.value)).decode(u"ascii")


        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            _pos = self._io.pos()
            self._io.seek(self.string_data_off)
            self._m_value = self._root.StringIdItem.StringDataItem(self._io, self, self._root)
            self._io.seek(_pos)
            return self._m_value


    class ProtoIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.shorty_idx = self._io.read_u4le()
            self.return_type_idx = self._io.read_u4le()
            self.parameters_off = self._io.read_u4le()


    class EncodedMethod(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.method_idx_diff = self._root.Uleb128(self._io, self, self._root)
            self.access_flags = self._root.Uleb128(self._io, self, self._root)
            self.code_off = self._root.Uleb128(self._io, self, self._root)


    class MapItem(KaitaiStruct):

        class MapItemType(Enum):
            header_item = 0
            string_id_item = 1
            type_id_item = 2
            proto_id_item = 3
            field_id_item = 4
            method_id_item = 5
            class_def_item = 6
            call_site_id_item = 7
            method_handle_item = 8
            map_list = 4096
            type_list = 4097
            annotation_set_ref_list = 4098
            annotation_set_item = 4099
            class_data_item = 8192
            code_item = 8193
            string_data_item = 8194
            debug_info_item = 8195
            annotation_item = 8196
            encoded_array_item = 8197
            annotations_directory_item = 8198
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.type = self._root.MapItem.MapItemType(self._io.read_u2le())
            self.unused = self._io.read_u2le()
            self.size = self._io.read_u4le()
            self.offset = self._io.read_u4le()


    class EncodedArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._root.Uleb128(self._io, self, self._root)
            self.values = [None] * (self.size.value)
            for i in range(self.size.value):
                self.values[i] = self._root.EncodedValue(self._io, self, self._root)



    @property
    def string_ids(self):
        """string identifiers list.
        These are identifiers for all the strings used by this file, either for  internal naming (e.g., type descriptors) or as constant objects referred to by code.
        This list must be sorted by string contents, using UTF-16 code point values (not in a locale-sensitive manner), and it must not contain any duplicate entries.    
        """
        if hasattr(self, '_m_string_ids'):
            return self._m_string_ids

        _pos = self._io.pos()
        self._io.seek(self.header.string_ids_off)
        self._m_string_ids = [None] * (self.header.string_ids_size)
        for i in range(self.header.string_ids_size):
            self._m_string_ids[i] = self._root.StringIdItem(self._io, self, self._root)

        self._io.seek(_pos)
        return self._m_string_ids

    @property
    def method_ids(self):
        """method identifiers list.
        These are identifiers for all methods referred to by this file, whether defined in the file or not.
        This list must be sorted, where the defining type (by type_id index  is the major order, method name (by string_id index) is the intermediate order, and method prototype (by proto_id index) is the minor order.
        The list must not contain any duplicate entries.
        """
        if hasattr(self, '_m_method_ids'):
            return self._m_method_ids

        _pos = self._io.pos()
        self._io.seek(self.header.method_ids_off)
        self._m_method_ids = [None] * (self.header.method_ids_size)
        for i in range(self.header.method_ids_size):
            self._m_method_ids[i] = self._root.MethodIdItem(self._io, self, self._root)

        self._io.seek(_pos)
        return self._m_method_ids

    @property
    def link_data(self):
        """data used in statically linked files.
        The format of the data in this section is left unspecified by this document.
        This section is empty in unlinked files, and runtime implementations may use it as they see fit.
        """
        if hasattr(self, '_m_link_data'):
            return self._m_link_data

        _pos = self._io.pos()
        self._io.seek(self.header.link_off)
        self._m_link_data = self._io.read_bytes(self.header.link_size)
        self._io.seek(_pos)
        return self._m_link_data

    @property
    def map(self):
        if hasattr(self, '_m_map'):
            return self._m_map

        _pos = self._io.pos()
        self._io.seek(self.header.map_off)
        self._m_map = self._root.MapList(self._io, self, self._root)
        self._io.seek(_pos)
        return self._m_map

    @property
    def class_defs(self):
        """class definitions list.
        The classes must be ordered such that a given class's superclass and implemented interfaces appear in the list earlier than the referring class.
        Furthermore, it is invalid for a definition for the same-named class to appear more than once in the list.
        """
        if hasattr(self, '_m_class_defs'):
            return self._m_class_defs

        _pos = self._io.pos()
        self._io.seek(self.header.class_defs_off)
        self._m_class_defs = [None] * (self.header.class_defs_size)
        for i in range(self.header.class_defs_size):
            self._m_class_defs[i] = self._root.ClassDefItem(self._io, self, self._root)

        self._io.seek(_pos)
        return self._m_class_defs

    @property
    def data(self):
        """data area, containing all the support data for the tables listed above.
        Different items have different alignment requirements, and padding bytes are inserted before each item if necessary to achieve proper alignment.
        """
        if hasattr(self, '_m_data'):
            return self._m_data

        _pos = self._io.pos()
        self._io.seek(self.header.data_off)
        self._m_data = self._io.read_bytes(self.header.data_size)
        self._io.seek(_pos)
        return self._m_data

    @property
    def type_ids(self):
        """type identifiers list. 
        These are identifiers for all types (classes, arrays, or primitive types)  referred to by this file, whether defined in the file or not.
        This list must be sorted by string_id index, and it must not contain any duplicate entries.
        """
        if hasattr(self, '_m_type_ids'):
            return self._m_type_ids

        _pos = self._io.pos()
        self._io.seek(self.header.type_ids_off)
        self._m_type_ids = [None] * (self.header.type_ids_size)
        for i in range(self.header.type_ids_size):
            self._m_type_ids[i] = self._root.TypeIdItem(self._io, self, self._root)

        self._io.seek(_pos)
        return self._m_type_ids

    @property
    def proto_ids(self):
        """method prototype identifiers list.
        These are identifiers for all prototypes referred to by this file.
        This list must be sorted in return-type (by type_id index) major order, and then by argument list (lexicographic ordering, individual arguments ordered by type_id index). The list must not contain any duplicate entries.
        """
        if hasattr(self, '_m_proto_ids'):
            return self._m_proto_ids

        _pos = self._io.pos()
        self._io.seek(self.header.proto_ids_off)
        self._m_proto_ids = [None] * (self.header.proto_ids_size)
        for i in range(self.header.proto_ids_size):
            self._m_proto_ids[i] = self._root.ProtoIdItem(self._io, self, self._root)

        self._io.seek(_pos)
        return self._m_proto_ids

    @property
    def field_ids(self):
        """field identifiers list.
        These are identifiers for all fields referred to by this file, whether defined in the file or not. 
        This list must be sorted, where the defining type (by type_id index)  is the major order, field name (by string_id index) is the intermediate  order, and type (by type_id index) is the minor order.
        The list must not contain any duplicate entries.
        """
        if hasattr(self, '_m_field_ids'):
            return self._m_field_ids

        _pos = self._io.pos()
        self._io.seek(self.header.field_ids_off)
        self._m_field_ids = [None] * (self.header.field_ids_size)
        for i in range(self.header.field_ids_size):
            self._m_field_ids[i] = self._root.FieldIdItem(self._io, self, self._root)

        self._io.seek(_pos)
        return self._m_field_ids


