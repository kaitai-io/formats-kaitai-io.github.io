# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
import vlq_base128_le
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Dex(KaitaiStruct):
    """Android OS applications executables are typically stored in its own
    format, optimized for more efficient execution in Dalvik virtual
    machine.
    
    This format is loosely similar to Java .class file format and
    generally holds the similar set of data: i.e. classes, methods,
    fields, annotations, etc.
    
    .. seealso::
       Source - https://source.android.com/docs/core/runtime/dex-format
    """

    class ClassAccessFlags(IntEnum):
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
        super(Dex, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = Dex.HeaderItem(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.class_defs
        if hasattr(self, '_m_class_defs'):
            pass
            for i in range(len(self._m_class_defs)):
                pass
                self._m_class_defs[i]._fetch_instances()


        _ = self.data
        if hasattr(self, '_m_data'):
            pass

        _ = self.field_ids
        if hasattr(self, '_m_field_ids'):
            pass
            for i in range(len(self._m_field_ids)):
                pass
                self._m_field_ids[i]._fetch_instances()


        _ = self.link_data
        if hasattr(self, '_m_link_data'):
            pass

        _ = self.map
        if hasattr(self, '_m_map'):
            pass
            self._m_map._fetch_instances()

        _ = self.method_ids
        if hasattr(self, '_m_method_ids'):
            pass
            for i in range(len(self._m_method_ids)):
                pass
                self._m_method_ids[i]._fetch_instances()


        _ = self.proto_ids
        if hasattr(self, '_m_proto_ids'):
            pass
            for i in range(len(self._m_proto_ids)):
                pass
                self._m_proto_ids[i]._fetch_instances()


        _ = self.string_ids
        if hasattr(self, '_m_string_ids'):
            pass
            for i in range(len(self._m_string_ids)):
                pass
                self._m_string_ids[i]._fetch_instances()


        _ = self.type_ids
        if hasattr(self, '_m_type_ids'):
            pass
            for i in range(len(self._m_type_ids)):
                pass
                self._m_type_ids[i]._fetch_instances()



    class AnnotationElement(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.AnnotationElement, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name_idx = vlq_base128_le.VlqBase128Le(self._io)
            self.value = Dex.EncodedValue(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.name_idx._fetch_instances()
            self.value._fetch_instances()


    class CallSiteIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.CallSiteIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.call_site_off = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class ClassDataItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.ClassDataItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.static_fields_size = vlq_base128_le.VlqBase128Le(self._io)
            self.instance_fields_size = vlq_base128_le.VlqBase128Le(self._io)
            self.direct_methods_size = vlq_base128_le.VlqBase128Le(self._io)
            self.virtual_methods_size = vlq_base128_le.VlqBase128Le(self._io)
            self.static_fields = []
            for i in range(self.static_fields_size.value):
                self.static_fields.append(Dex.EncodedField(self._io, self, self._root))

            self.instance_fields = []
            for i in range(self.instance_fields_size.value):
                self.instance_fields.append(Dex.EncodedField(self._io, self, self._root))

            self.direct_methods = []
            for i in range(self.direct_methods_size.value):
                self.direct_methods.append(Dex.EncodedMethod(self._io, self, self._root))

            self.virtual_methods = []
            for i in range(self.virtual_methods_size.value):
                self.virtual_methods.append(Dex.EncodedMethod(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            self.static_fields_size._fetch_instances()
            self.instance_fields_size._fetch_instances()
            self.direct_methods_size._fetch_instances()
            self.virtual_methods_size._fetch_instances()
            for i in range(len(self.static_fields)):
                pass
                self.static_fields[i]._fetch_instances()

            for i in range(len(self.instance_fields)):
                pass
                self.instance_fields[i]._fetch_instances()

            for i in range(len(self.direct_methods)):
                pass
                self.direct_methods[i]._fetch_instances()

            for i in range(len(self.virtual_methods)):
                pass
                self.virtual_methods[i]._fetch_instances()



    class ClassDefItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.ClassDefItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.class_idx = self._io.read_u4le()
            self.access_flags = KaitaiStream.resolve_enum(Dex.ClassAccessFlags, self._io.read_u4le())
            self.superclass_idx = self._io.read_u4le()
            self.interfaces_off = self._io.read_u4le()
            self.source_file_idx = self._io.read_u4le()
            self.annotations_off = self._io.read_u4le()
            self.class_data_off = self._io.read_u4le()
            self.static_values_off = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            _ = self.class_data
            if hasattr(self, '_m_class_data'):
                pass
                self._m_class_data._fetch_instances()

            _ = self.static_values
            if hasattr(self, '_m_static_values'):
                pass
                self._m_static_values._fetch_instances()


        @property
        def class_data(self):
            if hasattr(self, '_m_class_data'):
                return self._m_class_data

            if self.class_data_off != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.class_data_off)
                self._m_class_data = Dex.ClassDataItem(self._io, self, self._root)
                self._io.seek(_pos)

            return getattr(self, '_m_class_data', None)

        @property
        def static_values(self):
            if hasattr(self, '_m_static_values'):
                return self._m_static_values

            if self.static_values_off != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.static_values_off)
                self._m_static_values = Dex.EncodedArrayItem(self._io, self, self._root)
                self._io.seek(_pos)

            return getattr(self, '_m_static_values', None)

        @property
        def type_name(self):
            if hasattr(self, '_m_type_name'):
                return self._m_type_name

            self._m_type_name = self._root.type_ids[self.class_idx].type_name
            return getattr(self, '_m_type_name', None)


    class EncodedAnnotation(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.EncodedAnnotation, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.type_idx = vlq_base128_le.VlqBase128Le(self._io)
            self.size = vlq_base128_le.VlqBase128Le(self._io)
            self.elements = []
            for i in range(self.size.value):
                self.elements.append(Dex.AnnotationElement(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            self.type_idx._fetch_instances()
            self.size._fetch_instances()
            for i in range(len(self.elements)):
                pass
                self.elements[i]._fetch_instances()



    class EncodedArray(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.EncodedArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.size = vlq_base128_le.VlqBase128Le(self._io)
            self.values = []
            for i in range(self.size.value):
                self.values.append(Dex.EncodedValue(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            self.size._fetch_instances()
            for i in range(len(self.values)):
                pass
                self.values[i]._fetch_instances()



    class EncodedArrayItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.EncodedArrayItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.value = Dex.EncodedArray(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.value._fetch_instances()


    class EncodedField(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.EncodedField, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.field_idx_diff = vlq_base128_le.VlqBase128Le(self._io)
            self.access_flags = vlq_base128_le.VlqBase128Le(self._io)


        def _fetch_instances(self):
            pass
            self.field_idx_diff._fetch_instances()
            self.access_flags._fetch_instances()


    class EncodedMethod(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.EncodedMethod, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.method_idx_diff = vlq_base128_le.VlqBase128Le(self._io)
            self.access_flags = vlq_base128_le.VlqBase128Le(self._io)
            self.code_off = vlq_base128_le.VlqBase128Le(self._io)


        def _fetch_instances(self):
            pass
            self.method_idx_diff._fetch_instances()
            self.access_flags._fetch_instances()
            self.code_off._fetch_instances()


    class EncodedValue(KaitaiStruct):

        class ValueTypeEnum(IntEnum):
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
            super(Dex.EncodedValue, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.value_arg = self._io.read_bits_int_be(3)
            self.value_type = KaitaiStream.resolve_enum(Dex.EncodedValue.ValueTypeEnum, self._io.read_bits_int_be(5))
            _on = self.value_type
            if _on == Dex.EncodedValue.ValueTypeEnum.annotation:
                pass
                self.value = Dex.EncodedAnnotation(self._io, self, self._root)
            elif _on == Dex.EncodedValue.ValueTypeEnum.array:
                pass
                self.value = Dex.EncodedArray(self._io, self, self._root)
            elif _on == Dex.EncodedValue.ValueTypeEnum.byte:
                pass
                self.value = self._io.read_s1()
            elif _on == Dex.EncodedValue.ValueTypeEnum.char:
                pass
                self.value = self._io.read_u2le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.double:
                pass
                self.value = self._io.read_f8le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.enum:
                pass
                self.value = self._io.read_u4le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.field:
                pass
                self.value = self._io.read_u4le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.float:
                pass
                self.value = self._io.read_f4le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.int:
                pass
                self.value = self._io.read_s4le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.long:
                pass
                self.value = self._io.read_s8le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.method:
                pass
                self.value = self._io.read_u4le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.method_handle:
                pass
                self.value = self._io.read_u4le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.method_type:
                pass
                self.value = self._io.read_u4le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.short:
                pass
                self.value = self._io.read_s2le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.string:
                pass
                self.value = self._io.read_u4le()
            elif _on == Dex.EncodedValue.ValueTypeEnum.type:
                pass
                self.value = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            _on = self.value_type
            if _on == Dex.EncodedValue.ValueTypeEnum.annotation:
                pass
                self.value._fetch_instances()
            elif _on == Dex.EncodedValue.ValueTypeEnum.array:
                pass
                self.value._fetch_instances()
            elif _on == Dex.EncodedValue.ValueTypeEnum.byte:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.char:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.double:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.enum:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.field:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.float:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.int:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.long:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.method:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.method_handle:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.method_type:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.short:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.string:
                pass
            elif _on == Dex.EncodedValue.ValueTypeEnum.type:
                pass


    class FieldIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.FieldIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.class_idx = self._io.read_u2le()
            self.type_idx = self._io.read_u2le()
            self.name_idx = self._io.read_u4le()


        def _fetch_instances(self):
            pass

        @property
        def class_name(self):
            """the definer of this field."""
            if hasattr(self, '_m_class_name'):
                return self._m_class_name

            self._m_class_name = self._root.type_ids[self.class_idx].type_name
            return getattr(self, '_m_class_name', None)

        @property
        def field_name(self):
            """the name of this field."""
            if hasattr(self, '_m_field_name'):
                return self._m_field_name

            self._m_field_name = self._root.string_ids[self.name_idx].value.data
            return getattr(self, '_m_field_name', None)

        @property
        def type_name(self):
            """the type of this field."""
            if hasattr(self, '_m_type_name'):
                return self._m_type_name

            self._m_type_name = self._root.type_ids[self.type_idx].type_name
            return getattr(self, '_m_type_name', None)


    class HeaderItem(KaitaiStruct):

        class EndianConstant(IntEnum):
            endian_constant = 305419896
            reverse_endian_constant = 2018915346
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.HeaderItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x64\x65\x78\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x64\x65\x78\x0A", self.magic, self._io, u"/types/header_item/seq/0")
            self.version_str = (KaitaiStream.bytes_terminate(self._io.read_bytes(4), 0, False)).decode(u"ASCII")
            self.checksum = self._io.read_u4le()
            self.signature = self._io.read_bytes(20)
            self.file_size = self._io.read_u4le()
            self.header_size = self._io.read_u4le()
            self.endian_tag = KaitaiStream.resolve_enum(Dex.HeaderItem.EndianConstant, self._io.read_u4le())
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


        def _fetch_instances(self):
            pass


    class MapItem(KaitaiStruct):

        class MapItemType(IntEnum):
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
            super(Dex.MapItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.type = KaitaiStream.resolve_enum(Dex.MapItem.MapItemType, self._io.read_u2le())
            self.unused = self._io.read_u2le()
            self.size = self._io.read_u4le()
            self.offset = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class MapList(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.MapList, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.list = []
            for i in range(self.size):
                self.list.append(Dex.MapItem(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.list)):
                pass
                self.list[i]._fetch_instances()



    class MethodIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.MethodIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.class_idx = self._io.read_u2le()
            self.proto_idx = self._io.read_u2le()
            self.name_idx = self._io.read_u4le()


        def _fetch_instances(self):
            pass

        @property
        def class_name(self):
            """the definer of this method."""
            if hasattr(self, '_m_class_name'):
                return self._m_class_name

            self._m_class_name = self._root.type_ids[self.class_idx].type_name
            return getattr(self, '_m_class_name', None)

        @property
        def method_name(self):
            """the name of this method."""
            if hasattr(self, '_m_method_name'):
                return self._m_method_name

            self._m_method_name = self._root.string_ids[self.name_idx].value.data
            return getattr(self, '_m_method_name', None)

        @property
        def proto_desc(self):
            """the short-form descriptor of the prototype of this method."""
            if hasattr(self, '_m_proto_desc'):
                return self._m_proto_desc

            self._m_proto_desc = self._root.proto_ids[self.proto_idx].shorty_desc
            return getattr(self, '_m_proto_desc', None)


    class ProtoIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.ProtoIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.shorty_idx = self._io.read_u4le()
            self.return_type_idx = self._io.read_u4le()
            self.parameters_off = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            _ = self.params_types
            if hasattr(self, '_m_params_types'):
                pass
                self._m_params_types._fetch_instances()


        @property
        def params_types(self):
            """list of parameter types for this prototype."""
            if hasattr(self, '_m_params_types'):
                return self._m_params_types

            if self.parameters_off != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.parameters_off)
                self._m_params_types = Dex.TypeList(io, self, self._root)
                io.seek(_pos)

            return getattr(self, '_m_params_types', None)

        @property
        def return_type(self):
            """return type of this prototype."""
            if hasattr(self, '_m_return_type'):
                return self._m_return_type

            self._m_return_type = self._root.type_ids[self.return_type_idx].type_name
            return getattr(self, '_m_return_type', None)

        @property
        def shorty_desc(self):
            """short-form descriptor string of this prototype, as pointed to by shorty_idx."""
            if hasattr(self, '_m_shorty_desc'):
                return self._m_shorty_desc

            self._m_shorty_desc = self._root.string_ids[self.shorty_idx].value.data
            return getattr(self, '_m_shorty_desc', None)


    class StringIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.StringIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.string_data_off = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            _ = self.value
            if hasattr(self, '_m_value'):
                pass
                self._m_value._fetch_instances()


        class StringDataItem(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Dex.StringIdItem.StringDataItem, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.utf16_size = vlq_base128_le.VlqBase128Le(self._io)
                self.data = (self._io.read_bytes(self.utf16_size.value)).decode(u"ASCII")


            def _fetch_instances(self):
                pass
                self.utf16_size._fetch_instances()


        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            _pos = self._io.pos()
            self._io.seek(self.string_data_off)
            self._m_value = Dex.StringIdItem.StringDataItem(self._io, self, self._root)
            self._io.seek(_pos)
            return getattr(self, '_m_value', None)


    class TypeIdItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.TypeIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.descriptor_idx = self._io.read_u4le()


        def _fetch_instances(self):
            pass

        @property
        def type_name(self):
            if hasattr(self, '_m_type_name'):
                return self._m_type_name

            self._m_type_name = self._root.string_ids[self.descriptor_idx].value.data
            return getattr(self, '_m_type_name', None)


    class TypeItem(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.TypeItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.type_idx = self._io.read_u2le()


        def _fetch_instances(self):
            pass

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self._root.type_ids[self.type_idx].type_name
            return getattr(self, '_m_value', None)


    class TypeList(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dex.TypeList, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.list = []
            for i in range(self.size):
                self.list.append(Dex.TypeItem(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.list)):
                pass
                self.list[i]._fetch_instances()



    @property
    def class_defs(self):
        """class definitions list.
        
        The classes must be ordered such that a given class's superclass and
        implemented interfaces appear in the list earlier than the referring class.
        
        Furthermore, it is invalid for a definition for the same-named class to
        appear more than once in the list.
        """
        if hasattr(self, '_m_class_defs'):
            return self._m_class_defs

        _pos = self._io.pos()
        self._io.seek(self.header.class_defs_off)
        self._m_class_defs = []
        for i in range(self.header.class_defs_size):
            self._m_class_defs.append(Dex.ClassDefItem(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_class_defs', None)

    @property
    def data(self):
        """data area, containing all the support data for the tables listed above.
        
        Different items have different alignment requirements, and padding bytes
        are inserted before each item if necessary to achieve proper alignment.
        """
        if hasattr(self, '_m_data'):
            return self._m_data

        _pos = self._io.pos()
        self._io.seek(self.header.data_off)
        self._m_data = self._io.read_bytes(self.header.data_size)
        self._io.seek(_pos)
        return getattr(self, '_m_data', None)

    @property
    def field_ids(self):
        """field identifiers list.
        
        These are identifiers for all fields referred to by this file, whether defined in the file or not.
        
        This list must be sorted, where the defining type (by type_id index)
        is the major order, field name (by string_id index) is the intermediate
        order, and type (by type_id index) is the minor order.
        
        The list must not contain any duplicate entries.
        """
        if hasattr(self, '_m_field_ids'):
            return self._m_field_ids

        _pos = self._io.pos()
        self._io.seek(self.header.field_ids_off)
        self._m_field_ids = []
        for i in range(self.header.field_ids_size):
            self._m_field_ids.append(Dex.FieldIdItem(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_field_ids', None)

    @property
    def link_data(self):
        """data used in statically linked files.
        
        The format of the data in this section is left unspecified by this document.
        
        This section is empty in unlinked files, and runtime implementations may
        use it as they see fit.
        """
        if hasattr(self, '_m_link_data'):
            return self._m_link_data

        _pos = self._io.pos()
        self._io.seek(self.header.link_off)
        self._m_link_data = self._io.read_bytes(self.header.link_size)
        self._io.seek(_pos)
        return getattr(self, '_m_link_data', None)

    @property
    def map(self):
        if hasattr(self, '_m_map'):
            return self._m_map

        _pos = self._io.pos()
        self._io.seek(self.header.map_off)
        self._m_map = Dex.MapList(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_map', None)

    @property
    def method_ids(self):
        """method identifiers list.
        
        These are identifiers for all methods referred to by this file,
        whether defined in the file or not.
        
        This list must be sorted, where the defining type (by type_id index
        is the major order, method name (by string_id index) is the intermediate
        order, and method prototype (by proto_id index) is the minor order.
        
        The list must not contain any duplicate entries.
        """
        if hasattr(self, '_m_method_ids'):
            return self._m_method_ids

        _pos = self._io.pos()
        self._io.seek(self.header.method_ids_off)
        self._m_method_ids = []
        for i in range(self.header.method_ids_size):
            self._m_method_ids.append(Dex.MethodIdItem(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_method_ids', None)

    @property
    def proto_ids(self):
        """method prototype identifiers list.
        
        These are identifiers for all prototypes referred to by this file.
        
        This list must be sorted in return-type (by type_id index) major order,
        and then by argument list (lexicographic ordering, individual arguments
        ordered by type_id index). The list must not contain any duplicate entries.
        """
        if hasattr(self, '_m_proto_ids'):
            return self._m_proto_ids

        _pos = self._io.pos()
        self._io.seek(self.header.proto_ids_off)
        self._m_proto_ids = []
        for i in range(self.header.proto_ids_size):
            self._m_proto_ids.append(Dex.ProtoIdItem(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_proto_ids', None)

    @property
    def string_ids(self):
        """string identifiers list.
        
        These are identifiers for all the strings used by this file, either for
        internal naming (e.g., type descriptors) or as constant objects referred to by code.
        
        This list must be sorted by string contents, using UTF-16 code point values
        (not in a locale-sensitive manner), and it must not contain any duplicate entries.
        """
        if hasattr(self, '_m_string_ids'):
            return self._m_string_ids

        _pos = self._io.pos()
        self._io.seek(self.header.string_ids_off)
        self._m_string_ids = []
        for i in range(self.header.string_ids_size):
            self._m_string_ids.append(Dex.StringIdItem(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_string_ids', None)

    @property
    def type_ids(self):
        """type identifiers list.
        
        These are identifiers for all types (classes, arrays, or primitive types)
        referred to by this file, whether defined in the file or not.
        
        This list must be sorted by string_id index, and it must not contain any duplicate entries.
        """
        if hasattr(self, '_m_type_ids'):
            return self._m_type_ids

        _pos = self._io.pos()
        self._io.seek(self.header.type_ids_off)
        self._m_type_ids = []
        for i in range(self.header.type_ids_size):
            self._m_type_ids.append(Dex.TypeIdItem(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_type_ids', None)


