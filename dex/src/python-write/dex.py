# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import vlq_base128_le
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Dex(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Dex, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_class_defs = False
        self.class_defs__enabled = True
        self._should_write_data = False
        self.data__enabled = True
        self._should_write_field_ids = False
        self.field_ids__enabled = True
        self._should_write_link_data = False
        self.link_data__enabled = True
        self._should_write_map = False
        self.map__enabled = True
        self._should_write_method_ids = False
        self.method_ids__enabled = True
        self._should_write_proto_ids = False
        self.proto_ids__enabled = True
        self._should_write_string_ids = False
        self.string_ids__enabled = True
        self._should_write_type_ids = False
        self.type_ids__enabled = True

    def _read(self):
        self.header = Dex.HeaderItem(self._io, self, self._root)
        self.header._read()
        self._dirty = False


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




    def _write__seq(self, io=None):
        super(Dex, self)._write__seq(io)
        self._should_write_class_defs = self.class_defs__enabled
        self._should_write_data = self.data__enabled
        self._should_write_field_ids = self.field_ids__enabled
        self._should_write_link_data = self.link_data__enabled
        self._should_write_map = self.map__enabled
        self._should_write_method_ids = self.method_ids__enabled
        self._should_write_proto_ids = self.proto_ids__enabled
        self._should_write_string_ids = self.string_ids__enabled
        self._should_write_type_ids = self.type_ids__enabled
        self.header._write__seq(self._io)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.class_defs__enabled:
            pass
            if len(self._m_class_defs) != self.header.class_defs_size:
                raise kaitaistruct.ConsistencyError(u"class_defs", self.header.class_defs_size, len(self._m_class_defs))
            for i in range(len(self._m_class_defs)):
                pass
                if self._m_class_defs[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"class_defs", self._root, self._m_class_defs[i]._root)
                if self._m_class_defs[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"class_defs", self, self._m_class_defs[i]._parent)


        if self.data__enabled:
            pass
            if len(self._m_data) != self.header.data_size:
                raise kaitaistruct.ConsistencyError(u"data", self.header.data_size, len(self._m_data))

        if self.field_ids__enabled:
            pass
            if len(self._m_field_ids) != self.header.field_ids_size:
                raise kaitaistruct.ConsistencyError(u"field_ids", self.header.field_ids_size, len(self._m_field_ids))
            for i in range(len(self._m_field_ids)):
                pass
                if self._m_field_ids[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"field_ids", self._root, self._m_field_ids[i]._root)
                if self._m_field_ids[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"field_ids", self, self._m_field_ids[i]._parent)


        if self.link_data__enabled:
            pass
            if len(self._m_link_data) != self.header.link_size:
                raise kaitaistruct.ConsistencyError(u"link_data", self.header.link_size, len(self._m_link_data))

        if self.map__enabled:
            pass
            if self._m_map._root != self._root:
                raise kaitaistruct.ConsistencyError(u"map", self._root, self._m_map._root)
            if self._m_map._parent != self:
                raise kaitaistruct.ConsistencyError(u"map", self, self._m_map._parent)

        if self.method_ids__enabled:
            pass
            if len(self._m_method_ids) != self.header.method_ids_size:
                raise kaitaistruct.ConsistencyError(u"method_ids", self.header.method_ids_size, len(self._m_method_ids))
            for i in range(len(self._m_method_ids)):
                pass
                if self._m_method_ids[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"method_ids", self._root, self._m_method_ids[i]._root)
                if self._m_method_ids[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"method_ids", self, self._m_method_ids[i]._parent)


        if self.proto_ids__enabled:
            pass
            if len(self._m_proto_ids) != self.header.proto_ids_size:
                raise kaitaistruct.ConsistencyError(u"proto_ids", self.header.proto_ids_size, len(self._m_proto_ids))
            for i in range(len(self._m_proto_ids)):
                pass
                if self._m_proto_ids[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"proto_ids", self._root, self._m_proto_ids[i]._root)
                if self._m_proto_ids[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"proto_ids", self, self._m_proto_ids[i]._parent)


        if self.string_ids__enabled:
            pass
            if len(self._m_string_ids) != self.header.string_ids_size:
                raise kaitaistruct.ConsistencyError(u"string_ids", self.header.string_ids_size, len(self._m_string_ids))
            for i in range(len(self._m_string_ids)):
                pass
                if self._m_string_ids[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"string_ids", self._root, self._m_string_ids[i]._root)
                if self._m_string_ids[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"string_ids", self, self._m_string_ids[i]._parent)


        if self.type_ids__enabled:
            pass
            if len(self._m_type_ids) != self.header.type_ids_size:
                raise kaitaistruct.ConsistencyError(u"type_ids", self.header.type_ids_size, len(self._m_type_ids))
            for i in range(len(self._m_type_ids)):
                pass
                if self._m_type_ids[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"type_ids", self._root, self._m_type_ids[i]._root)
                if self._m_type_ids[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"type_ids", self, self._m_type_ids[i]._parent)


        self._dirty = False

    class AnnotationElement(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.AnnotationElement, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name_idx = vlq_base128_le.VlqBase128Le(self._io)
            self.name_idx._read()
            self.value = Dex.EncodedValue(self._io, self, self._root)
            self.value._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name_idx._fetch_instances()
            self.value._fetch_instances()


        def _write__seq(self, io=None):
            super(Dex.AnnotationElement, self)._write__seq(io)
            self.name_idx._write__seq(self._io)
            self.value._write__seq(self._io)


        def _check(self):
            if self.value._root != self._root:
                raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
            if self.value._parent != self:
                raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            self._dirty = False


    class CallSiteIdItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.CallSiteIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.call_site_off = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dex.CallSiteIdItem, self)._write__seq(io)
            self._io.write_u4le(self.call_site_off)


        def _check(self):
            self._dirty = False


    class ClassDataItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.ClassDataItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.static_fields_size = vlq_base128_le.VlqBase128Le(self._io)
            self.static_fields_size._read()
            self.instance_fields_size = vlq_base128_le.VlqBase128Le(self._io)
            self.instance_fields_size._read()
            self.direct_methods_size = vlq_base128_le.VlqBase128Le(self._io)
            self.direct_methods_size._read()
            self.virtual_methods_size = vlq_base128_le.VlqBase128Le(self._io)
            self.virtual_methods_size._read()
            self.static_fields = []
            for i in range(self.static_fields_size.value):
                _t_static_fields = Dex.EncodedField(self._io, self, self._root)
                try:
                    _t_static_fields._read()
                finally:
                    self.static_fields.append(_t_static_fields)

            self.instance_fields = []
            for i in range(self.instance_fields_size.value):
                _t_instance_fields = Dex.EncodedField(self._io, self, self._root)
                try:
                    _t_instance_fields._read()
                finally:
                    self.instance_fields.append(_t_instance_fields)

            self.direct_methods = []
            for i in range(self.direct_methods_size.value):
                _t_direct_methods = Dex.EncodedMethod(self._io, self, self._root)
                try:
                    _t_direct_methods._read()
                finally:
                    self.direct_methods.append(_t_direct_methods)

            self.virtual_methods = []
            for i in range(self.virtual_methods_size.value):
                _t_virtual_methods = Dex.EncodedMethod(self._io, self, self._root)
                try:
                    _t_virtual_methods._read()
                finally:
                    self.virtual_methods.append(_t_virtual_methods)

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(Dex.ClassDataItem, self)._write__seq(io)
            self.static_fields_size._write__seq(self._io)
            self.instance_fields_size._write__seq(self._io)
            self.direct_methods_size._write__seq(self._io)
            self.virtual_methods_size._write__seq(self._io)
            for i in range(len(self.static_fields)):
                pass
                self.static_fields[i]._write__seq(self._io)

            for i in range(len(self.instance_fields)):
                pass
                self.instance_fields[i]._write__seq(self._io)

            for i in range(len(self.direct_methods)):
                pass
                self.direct_methods[i]._write__seq(self._io)

            for i in range(len(self.virtual_methods)):
                pass
                self.virtual_methods[i]._write__seq(self._io)



        def _check(self):
            if len(self.static_fields) != self.static_fields_size.value:
                raise kaitaistruct.ConsistencyError(u"static_fields", self.static_fields_size.value, len(self.static_fields))
            for i in range(len(self.static_fields)):
                pass
                if self.static_fields[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"static_fields", self._root, self.static_fields[i]._root)
                if self.static_fields[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"static_fields", self, self.static_fields[i]._parent)

            if len(self.instance_fields) != self.instance_fields_size.value:
                raise kaitaistruct.ConsistencyError(u"instance_fields", self.instance_fields_size.value, len(self.instance_fields))
            for i in range(len(self.instance_fields)):
                pass
                if self.instance_fields[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"instance_fields", self._root, self.instance_fields[i]._root)
                if self.instance_fields[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"instance_fields", self, self.instance_fields[i]._parent)

            if len(self.direct_methods) != self.direct_methods_size.value:
                raise kaitaistruct.ConsistencyError(u"direct_methods", self.direct_methods_size.value, len(self.direct_methods))
            for i in range(len(self.direct_methods)):
                pass
                if self.direct_methods[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"direct_methods", self._root, self.direct_methods[i]._root)
                if self.direct_methods[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"direct_methods", self, self.direct_methods[i]._parent)

            if len(self.virtual_methods) != self.virtual_methods_size.value:
                raise kaitaistruct.ConsistencyError(u"virtual_methods", self.virtual_methods_size.value, len(self.virtual_methods))
            for i in range(len(self.virtual_methods)):
                pass
                if self.virtual_methods[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"virtual_methods", self._root, self.virtual_methods[i]._root)
                if self.virtual_methods[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"virtual_methods", self, self.virtual_methods[i]._parent)

            self._dirty = False


    class ClassDefItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.ClassDefItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_class_data = False
            self.class_data__enabled = True
            self._should_write_static_values = False
            self.static_values__enabled = True

        def _read(self):
            self.class_idx = self._io.read_u4le()
            self.access_flags = KaitaiStream.resolve_enum(Dex.ClassAccessFlags, self._io.read_u4le())
            self.superclass_idx = self._io.read_u4le()
            self.interfaces_off = self._io.read_u4le()
            self.source_file_idx = self._io.read_u4le()
            self.annotations_off = self._io.read_u4le()
            self.class_data_off = self._io.read_u4le()
            self.static_values_off = self._io.read_u4le()
            self._dirty = False


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



        def _write__seq(self, io=None):
            super(Dex.ClassDefItem, self)._write__seq(io)
            self._should_write_class_data = self.class_data__enabled
            self._should_write_static_values = self.static_values__enabled
            self._io.write_u4le(self.class_idx)
            self._io.write_u4le(int(self.access_flags))
            self._io.write_u4le(self.superclass_idx)
            self._io.write_u4le(self.interfaces_off)
            self._io.write_u4le(self.source_file_idx)
            self._io.write_u4le(self.annotations_off)
            self._io.write_u4le(self.class_data_off)
            self._io.write_u4le(self.static_values_off)


        def _check(self):
            if self.class_data__enabled:
                pass
                if self.class_data_off != 0:
                    pass
                    if self._m_class_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"class_data", self._root, self._m_class_data._root)
                    if self._m_class_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"class_data", self, self._m_class_data._parent)


            if self.static_values__enabled:
                pass
                if self.static_values_off != 0:
                    pass
                    if self._m_static_values._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"static_values", self._root, self._m_static_values._root)
                    if self._m_static_values._parent != self:
                        raise kaitaistruct.ConsistencyError(u"static_values", self, self._m_static_values._parent)


            self._dirty = False

        @property
        def class_data(self):
            if self._should_write_class_data:
                self._write_class_data()
            if hasattr(self, '_m_class_data'):
                return self._m_class_data

            if not self.class_data__enabled:
                return None

            if self.class_data_off != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.class_data_off)
                self._m_class_data = Dex.ClassDataItem(self._io, self, self._root)
                self._m_class_data._read()
                self._io.seek(_pos)

            return getattr(self, '_m_class_data', None)

        @class_data.setter
        def class_data(self, v):
            self._dirty = True
            self._m_class_data = v

        def _write_class_data(self):
            self._should_write_class_data = False
            if self.class_data_off != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.class_data_off)
                self._m_class_data._write__seq(self._io)
                self._io.seek(_pos)


        @property
        def static_values(self):
            if self._should_write_static_values:
                self._write_static_values()
            if hasattr(self, '_m_static_values'):
                return self._m_static_values

            if not self.static_values__enabled:
                return None

            if self.static_values_off != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.static_values_off)
                self._m_static_values = Dex.EncodedArrayItem(self._io, self, self._root)
                self._m_static_values._read()
                self._io.seek(_pos)

            return getattr(self, '_m_static_values', None)

        @static_values.setter
        def static_values(self, v):
            self._dirty = True
            self._m_static_values = v

        def _write_static_values(self):
            self._should_write_static_values = False
            if self.static_values_off != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.static_values_off)
                self._m_static_values._write__seq(self._io)
                self._io.seek(_pos)


        @property
        def type_name(self):
            if hasattr(self, '_m_type_name'):
                return self._m_type_name

            self._m_type_name = self._root.type_ids[self.class_idx].type_name
            return getattr(self, '_m_type_name', None)

        def _invalidate_type_name(self):
            del self._m_type_name

    class EncodedAnnotation(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.EncodedAnnotation, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type_idx = vlq_base128_le.VlqBase128Le(self._io)
            self.type_idx._read()
            self.size = vlq_base128_le.VlqBase128Le(self._io)
            self.size._read()
            self.elements = []
            for i in range(self.size.value):
                _t_elements = Dex.AnnotationElement(self._io, self, self._root)
                try:
                    _t_elements._read()
                finally:
                    self.elements.append(_t_elements)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.type_idx._fetch_instances()
            self.size._fetch_instances()
            for i in range(len(self.elements)):
                pass
                self.elements[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Dex.EncodedAnnotation, self)._write__seq(io)
            self.type_idx._write__seq(self._io)
            self.size._write__seq(self._io)
            for i in range(len(self.elements)):
                pass
                self.elements[i]._write__seq(self._io)



        def _check(self):
            if len(self.elements) != self.size.value:
                raise kaitaistruct.ConsistencyError(u"elements", self.size.value, len(self.elements))
            for i in range(len(self.elements)):
                pass
                if self.elements[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"elements", self._root, self.elements[i]._root)
                if self.elements[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"elements", self, self.elements[i]._parent)

            self._dirty = False


    class EncodedArray(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.EncodedArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = vlq_base128_le.VlqBase128Le(self._io)
            self.size._read()
            self.values = []
            for i in range(self.size.value):
                _t_values = Dex.EncodedValue(self._io, self, self._root)
                try:
                    _t_values._read()
                finally:
                    self.values.append(_t_values)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.size._fetch_instances()
            for i in range(len(self.values)):
                pass
                self.values[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Dex.EncodedArray, self)._write__seq(io)
            self.size._write__seq(self._io)
            for i in range(len(self.values)):
                pass
                self.values[i]._write__seq(self._io)



        def _check(self):
            if len(self.values) != self.size.value:
                raise kaitaistruct.ConsistencyError(u"values", self.size.value, len(self.values))
            for i in range(len(self.values)):
                pass
                if self.values[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"values", self._root, self.values[i]._root)
                if self.values[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"values", self, self.values[i]._parent)

            self._dirty = False


    class EncodedArrayItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.EncodedArrayItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = Dex.EncodedArray(self._io, self, self._root)
            self.value._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.value._fetch_instances()


        def _write__seq(self, io=None):
            super(Dex.EncodedArrayItem, self)._write__seq(io)
            self.value._write__seq(self._io)


        def _check(self):
            if self.value._root != self._root:
                raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
            if self.value._parent != self:
                raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            self._dirty = False


    class EncodedField(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.EncodedField, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.field_idx_diff = vlq_base128_le.VlqBase128Le(self._io)
            self.field_idx_diff._read()
            self.access_flags = vlq_base128_le.VlqBase128Le(self._io)
            self.access_flags._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.field_idx_diff._fetch_instances()
            self.access_flags._fetch_instances()


        def _write__seq(self, io=None):
            super(Dex.EncodedField, self)._write__seq(io)
            self.field_idx_diff._write__seq(self._io)
            self.access_flags._write__seq(self._io)


        def _check(self):
            self._dirty = False


    class EncodedMethod(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.EncodedMethod, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.method_idx_diff = vlq_base128_le.VlqBase128Le(self._io)
            self.method_idx_diff._read()
            self.access_flags = vlq_base128_le.VlqBase128Le(self._io)
            self.access_flags._read()
            self.code_off = vlq_base128_le.VlqBase128Le(self._io)
            self.code_off._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.method_idx_diff._fetch_instances()
            self.access_flags._fetch_instances()
            self.code_off._fetch_instances()


        def _write__seq(self, io=None):
            super(Dex.EncodedMethod, self)._write__seq(io)
            self.method_idx_diff._write__seq(self._io)
            self.access_flags._write__seq(self._io)
            self.code_off._write__seq(self._io)


        def _check(self):
            self._dirty = False


    class EncodedValue(ReadWriteKaitaiStruct):

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
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.EncodedValue, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value_arg = self._io.read_bits_int_be(3)
            self.value_type = KaitaiStream.resolve_enum(Dex.EncodedValue.ValueTypeEnum, self._io.read_bits_int_be(5))
            _on = self.value_type
            if _on == Dex.EncodedValue.ValueTypeEnum.annotation:
                pass
                self.value = Dex.EncodedAnnotation(self._io, self, self._root)
                self.value._read()
            elif _on == Dex.EncodedValue.ValueTypeEnum.array:
                pass
                self.value = Dex.EncodedArray(self._io, self, self._root)
                self.value._read()
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
            self._dirty = False


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


        def _write__seq(self, io=None):
            super(Dex.EncodedValue, self)._write__seq(io)
            self._io.write_bits_int_be(3, self.value_arg)
            self._io.write_bits_int_be(5, int(self.value_type))
            _on = self.value_type
            if _on == Dex.EncodedValue.ValueTypeEnum.annotation:
                pass
                self.value._write__seq(self._io)
            elif _on == Dex.EncodedValue.ValueTypeEnum.array:
                pass
                self.value._write__seq(self._io)
            elif _on == Dex.EncodedValue.ValueTypeEnum.byte:
                pass
                self._io.write_s1(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.char:
                pass
                self._io.write_u2le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.double:
                pass
                self._io.write_f8le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.enum:
                pass
                self._io.write_u4le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.field:
                pass
                self._io.write_u4le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.float:
                pass
                self._io.write_f4le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.int:
                pass
                self._io.write_s4le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.long:
                pass
                self._io.write_s8le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.method:
                pass
                self._io.write_u4le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.method_handle:
                pass
                self._io.write_u4le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.method_type:
                pass
                self._io.write_u4le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.short:
                pass
                self._io.write_s2le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.string:
                pass
                self._io.write_u4le(self.value)
            elif _on == Dex.EncodedValue.ValueTypeEnum.type:
                pass
                self._io.write_u4le(self.value)


        def _check(self):
            _on = self.value_type
            if _on == Dex.EncodedValue.ValueTypeEnum.annotation:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == Dex.EncodedValue.ValueTypeEnum.array:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
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
            self._dirty = False


    class FieldIdItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.FieldIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.class_idx = self._io.read_u2le()
            self.type_idx = self._io.read_u2le()
            self.name_idx = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dex.FieldIdItem, self)._write__seq(io)
            self._io.write_u2le(self.class_idx)
            self._io.write_u2le(self.type_idx)
            self._io.write_u4le(self.name_idx)


        def _check(self):
            self._dirty = False

        @property
        def class_name(self):
            """the definer of this field."""
            if hasattr(self, '_m_class_name'):
                return self._m_class_name

            self._m_class_name = self._root.type_ids[self.class_idx].type_name
            return getattr(self, '_m_class_name', None)

        def _invalidate_class_name(self):
            del self._m_class_name
        @property
        def field_name(self):
            """the name of this field."""
            if hasattr(self, '_m_field_name'):
                return self._m_field_name

            self._m_field_name = self._root.string_ids[self.name_idx].value.data
            return getattr(self, '_m_field_name', None)

        def _invalidate_field_name(self):
            del self._m_field_name
        @property
        def type_name(self):
            """the type of this field."""
            if hasattr(self, '_m_type_name'):
                return self._m_type_name

            self._m_type_name = self._root.type_ids[self.type_idx].type_name
            return getattr(self, '_m_type_name', None)

        def _invalidate_type_name(self):
            del self._m_type_name

    class HeaderItem(ReadWriteKaitaiStruct):

        class EndianConstant(IntEnum):
            endian_constant = 305419896
            reverse_endian_constant = 2018915346
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.HeaderItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dex.HeaderItem, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_bytes_limit((self.version_str).encode(u"ASCII"), 4, 0, 0)
            self._io.write_u4le(self.checksum)
            self._io.write_bytes(self.signature)
            self._io.write_u4le(self.file_size)
            self._io.write_u4le(self.header_size)
            self._io.write_u4le(int(self.endian_tag))
            self._io.write_u4le(self.link_size)
            self._io.write_u4le(self.link_off)
            self._io.write_u4le(self.map_off)
            self._io.write_u4le(self.string_ids_size)
            self._io.write_u4le(self.string_ids_off)
            self._io.write_u4le(self.type_ids_size)
            self._io.write_u4le(self.type_ids_off)
            self._io.write_u4le(self.proto_ids_size)
            self._io.write_u4le(self.proto_ids_off)
            self._io.write_u4le(self.field_ids_size)
            self._io.write_u4le(self.field_ids_off)
            self._io.write_u4le(self.method_ids_size)
            self._io.write_u4le(self.method_ids_off)
            self._io.write_u4le(self.class_defs_size)
            self._io.write_u4le(self.class_defs_off)
            self._io.write_u4le(self.data_size)
            self._io.write_u4le(self.data_off)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x64\x65\x78\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x64\x65\x78\x0A", self.magic, None, u"/types/header_item/seq/0")
            if len((self.version_str).encode(u"ASCII")) > 4:
                raise kaitaistruct.ConsistencyError(u"version_str", 4, len((self.version_str).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.version_str).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"version_str", -1, KaitaiStream.byte_array_index_of((self.version_str).encode(u"ASCII"), 0))
            if len(self.signature) != 20:
                raise kaitaistruct.ConsistencyError(u"signature", 20, len(self.signature))
            self._dirty = False


    class MapItem(ReadWriteKaitaiStruct):

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
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.MapItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = KaitaiStream.resolve_enum(Dex.MapItem.MapItemType, self._io.read_u2le())
            self.unused = self._io.read_u2le()
            self.size = self._io.read_u4le()
            self.offset = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dex.MapItem, self)._write__seq(io)
            self._io.write_u2le(int(self.type))
            self._io.write_u2le(self.unused)
            self._io.write_u4le(self.size)
            self._io.write_u4le(self.offset)


        def _check(self):
            self._dirty = False


    class MapList(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.MapList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4le()
            self.list = []
            for i in range(self.size):
                _t_list = Dex.MapItem(self._io, self, self._root)
                try:
                    _t_list._read()
                finally:
                    self.list.append(_t_list)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.list)):
                pass
                self.list[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Dex.MapList, self)._write__seq(io)
            self._io.write_u4le(self.size)
            for i in range(len(self.list)):
                pass
                self.list[i]._write__seq(self._io)



        def _check(self):
            if len(self.list) != self.size:
                raise kaitaistruct.ConsistencyError(u"list", self.size, len(self.list))
            for i in range(len(self.list)):
                pass
                if self.list[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"list", self._root, self.list[i]._root)
                if self.list[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"list", self, self.list[i]._parent)

            self._dirty = False


    class MethodIdItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.MethodIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.class_idx = self._io.read_u2le()
            self.proto_idx = self._io.read_u2le()
            self.name_idx = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dex.MethodIdItem, self)._write__seq(io)
            self._io.write_u2le(self.class_idx)
            self._io.write_u2le(self.proto_idx)
            self._io.write_u4le(self.name_idx)


        def _check(self):
            self._dirty = False

        @property
        def class_name(self):
            """the definer of this method."""
            if hasattr(self, '_m_class_name'):
                return self._m_class_name

            self._m_class_name = self._root.type_ids[self.class_idx].type_name
            return getattr(self, '_m_class_name', None)

        def _invalidate_class_name(self):
            del self._m_class_name
        @property
        def method_name(self):
            """the name of this method."""
            if hasattr(self, '_m_method_name'):
                return self._m_method_name

            self._m_method_name = self._root.string_ids[self.name_idx].value.data
            return getattr(self, '_m_method_name', None)

        def _invalidate_method_name(self):
            del self._m_method_name
        @property
        def proto_desc(self):
            """the short-form descriptor of the prototype of this method."""
            if hasattr(self, '_m_proto_desc'):
                return self._m_proto_desc

            self._m_proto_desc = self._root.proto_ids[self.proto_idx].shorty_desc
            return getattr(self, '_m_proto_desc', None)

        def _invalidate_proto_desc(self):
            del self._m_proto_desc

    class ProtoIdItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.ProtoIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_params_types = False
            self.params_types__enabled = True

        def _read(self):
            self.shorty_idx = self._io.read_u4le()
            self.return_type_idx = self._io.read_u4le()
            self.parameters_off = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.params_types
            if hasattr(self, '_m_params_types'):
                pass
                self._m_params_types._fetch_instances()



        def _write__seq(self, io=None):
            super(Dex.ProtoIdItem, self)._write__seq(io)
            self._should_write_params_types = self.params_types__enabled
            self._io.write_u4le(self.shorty_idx)
            self._io.write_u4le(self.return_type_idx)
            self._io.write_u4le(self.parameters_off)


        def _check(self):
            if self.params_types__enabled:
                pass
                if self.parameters_off != 0:
                    pass
                    if self._m_params_types._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"params_types", self._root, self._m_params_types._root)
                    if self._m_params_types._parent != self:
                        raise kaitaistruct.ConsistencyError(u"params_types", self, self._m_params_types._parent)


            self._dirty = False

        @property
        def params_types(self):
            """list of parameter types for this prototype."""
            if self._should_write_params_types:
                self._write_params_types()
            if hasattr(self, '_m_params_types'):
                return self._m_params_types

            if not self.params_types__enabled:
                return None

            if self.parameters_off != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.parameters_off)
                self._m_params_types = Dex.TypeList(io, self, self._root)
                self._m_params_types._read()
                io.seek(_pos)

            return getattr(self, '_m_params_types', None)

        @params_types.setter
        def params_types(self, v):
            self._dirty = True
            self._m_params_types = v

        def _write_params_types(self):
            self._should_write_params_types = False
            if self.parameters_off != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.parameters_off)
                self._m_params_types._write__seq(io)
                io.seek(_pos)


        @property
        def return_type(self):
            """return type of this prototype."""
            if hasattr(self, '_m_return_type'):
                return self._m_return_type

            self._m_return_type = self._root.type_ids[self.return_type_idx].type_name
            return getattr(self, '_m_return_type', None)

        def _invalidate_return_type(self):
            del self._m_return_type
        @property
        def shorty_desc(self):
            """short-form descriptor string of this prototype, as pointed to by shorty_idx."""
            if hasattr(self, '_m_shorty_desc'):
                return self._m_shorty_desc

            self._m_shorty_desc = self._root.string_ids[self.shorty_idx].value.data
            return getattr(self, '_m_shorty_desc', None)

        def _invalidate_shorty_desc(self):
            del self._m_shorty_desc

    class StringIdItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.StringIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_value = False
            self.value__enabled = True

        def _read(self):
            self.string_data_off = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.value
            if hasattr(self, '_m_value'):
                pass
                self._m_value._fetch_instances()



        def _write__seq(self, io=None):
            super(Dex.StringIdItem, self)._write__seq(io)
            self._should_write_value = self.value__enabled
            self._io.write_u4le(self.string_data_off)


        def _check(self):
            if self.value__enabled:
                pass
                if self._m_value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                if self._m_value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)

            self._dirty = False

        class StringDataItem(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Dex.StringIdItem.StringDataItem, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.utf16_size = vlq_base128_le.VlqBase128Le(self._io)
                self.utf16_size._read()
                self.data = (self._io.read_bytes(self.utf16_size.value)).decode(u"ASCII")
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.utf16_size._fetch_instances()


            def _write__seq(self, io=None):
                super(Dex.StringIdItem.StringDataItem, self)._write__seq(io)
                self.utf16_size._write__seq(self._io)
                self._io.write_bytes((self.data).encode(u"ASCII"))


            def _check(self):
                if len((self.data).encode(u"ASCII")) != self.utf16_size.value:
                    raise kaitaistruct.ConsistencyError(u"data", self.utf16_size.value, len((self.data).encode(u"ASCII")))
                self._dirty = False


        @property
        def value(self):
            if self._should_write_value:
                self._write_value()
            if hasattr(self, '_m_value'):
                return self._m_value

            if not self.value__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.string_data_off)
            self._m_value = Dex.StringIdItem.StringDataItem(self._io, self, self._root)
            self._m_value._read()
            self._io.seek(_pos)
            return getattr(self, '_m_value', None)

        @value.setter
        def value(self, v):
            self._dirty = True
            self._m_value = v

        def _write_value(self):
            self._should_write_value = False
            _pos = self._io.pos()
            self._io.seek(self.string_data_off)
            self._m_value._write__seq(self._io)
            self._io.seek(_pos)


    class TypeIdItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.TypeIdItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.descriptor_idx = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dex.TypeIdItem, self)._write__seq(io)
            self._io.write_u4le(self.descriptor_idx)


        def _check(self):
            self._dirty = False

        @property
        def type_name(self):
            if hasattr(self, '_m_type_name'):
                return self._m_type_name

            self._m_type_name = self._root.string_ids[self.descriptor_idx].value.data
            return getattr(self, '_m_type_name', None)

        def _invalidate_type_name(self):
            del self._m_type_name

    class TypeItem(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.TypeItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type_idx = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dex.TypeItem, self)._write__seq(io)
            self._io.write_u2le(self.type_idx)


        def _check(self):
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self._root.type_ids[self.type_idx].type_name
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class TypeList(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dex.TypeList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4le()
            self.list = []
            for i in range(self.size):
                _t_list = Dex.TypeItem(self._io, self, self._root)
                try:
                    _t_list._read()
                finally:
                    self.list.append(_t_list)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.list)):
                pass
                self.list[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Dex.TypeList, self)._write__seq(io)
            self._io.write_u4le(self.size)
            for i in range(len(self.list)):
                pass
                self.list[i]._write__seq(self._io)



        def _check(self):
            if len(self.list) != self.size:
                raise kaitaistruct.ConsistencyError(u"list", self.size, len(self.list))
            for i in range(len(self.list)):
                pass
                if self.list[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"list", self._root, self.list[i]._root)
                if self.list[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"list", self, self.list[i]._parent)

            self._dirty = False


    @property
    def class_defs(self):
        """class definitions list.
        
        The classes must be ordered such that a given class's superclass and
        implemented interfaces appear in the list earlier than the referring class.
        
        Furthermore, it is invalid for a definition for the same-named class to
        appear more than once in the list.
        """
        if self._should_write_class_defs:
            self._write_class_defs()
        if hasattr(self, '_m_class_defs'):
            return self._m_class_defs

        if not self.class_defs__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.class_defs_off)
        self._m_class_defs = []
        for i in range(self.header.class_defs_size):
            _t__m_class_defs = Dex.ClassDefItem(self._io, self, self._root)
            try:
                _t__m_class_defs._read()
            finally:
                self._m_class_defs.append(_t__m_class_defs)

        self._io.seek(_pos)
        return getattr(self, '_m_class_defs', None)

    @class_defs.setter
    def class_defs(self, v):
        self._dirty = True
        self._m_class_defs = v

    def _write_class_defs(self):
        self._should_write_class_defs = False
        _pos = self._io.pos()
        self._io.seek(self.header.class_defs_off)
        for i in range(len(self._m_class_defs)):
            pass
            self._m_class_defs[i]._write__seq(self._io)

        self._io.seek(_pos)

    @property
    def data(self):
        """data area, containing all the support data for the tables listed above.
        
        Different items have different alignment requirements, and padding bytes
        are inserted before each item if necessary to achieve proper alignment.
        """
        if self._should_write_data:
            self._write_data()
        if hasattr(self, '_m_data'):
            return self._m_data

        if not self.data__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.data_off)
        self._m_data = self._io.read_bytes(self.header.data_size)
        self._io.seek(_pos)
        return getattr(self, '_m_data', None)

    @data.setter
    def data(self, v):
        self._dirty = True
        self._m_data = v

    def _write_data(self):
        self._should_write_data = False
        _pos = self._io.pos()
        self._io.seek(self.header.data_off)
        self._io.write_bytes(self._m_data)
        self._io.seek(_pos)

    @property
    def field_ids(self):
        """field identifiers list.
        
        These are identifiers for all fields referred to by this file, whether defined in the file or not.
        
        This list must be sorted, where the defining type (by type_id index)
        is the major order, field name (by string_id index) is the intermediate
        order, and type (by type_id index) is the minor order.
        
        The list must not contain any duplicate entries.
        """
        if self._should_write_field_ids:
            self._write_field_ids()
        if hasattr(self, '_m_field_ids'):
            return self._m_field_ids

        if not self.field_ids__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.field_ids_off)
        self._m_field_ids = []
        for i in range(self.header.field_ids_size):
            _t__m_field_ids = Dex.FieldIdItem(self._io, self, self._root)
            try:
                _t__m_field_ids._read()
            finally:
                self._m_field_ids.append(_t__m_field_ids)

        self._io.seek(_pos)
        return getattr(self, '_m_field_ids', None)

    @field_ids.setter
    def field_ids(self, v):
        self._dirty = True
        self._m_field_ids = v

    def _write_field_ids(self):
        self._should_write_field_ids = False
        _pos = self._io.pos()
        self._io.seek(self.header.field_ids_off)
        for i in range(len(self._m_field_ids)):
            pass
            self._m_field_ids[i]._write__seq(self._io)

        self._io.seek(_pos)

    @property
    def link_data(self):
        """data used in statically linked files.
        
        The format of the data in this section is left unspecified by this document.
        
        This section is empty in unlinked files, and runtime implementations may
        use it as they see fit.
        """
        if self._should_write_link_data:
            self._write_link_data()
        if hasattr(self, '_m_link_data'):
            return self._m_link_data

        if not self.link_data__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.link_off)
        self._m_link_data = self._io.read_bytes(self.header.link_size)
        self._io.seek(_pos)
        return getattr(self, '_m_link_data', None)

    @link_data.setter
    def link_data(self, v):
        self._dirty = True
        self._m_link_data = v

    def _write_link_data(self):
        self._should_write_link_data = False
        _pos = self._io.pos()
        self._io.seek(self.header.link_off)
        self._io.write_bytes(self._m_link_data)
        self._io.seek(_pos)

    @property
    def map(self):
        if self._should_write_map:
            self._write_map()
        if hasattr(self, '_m_map'):
            return self._m_map

        if not self.map__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.map_off)
        self._m_map = Dex.MapList(self._io, self, self._root)
        self._m_map._read()
        self._io.seek(_pos)
        return getattr(self, '_m_map', None)

    @map.setter
    def map(self, v):
        self._dirty = True
        self._m_map = v

    def _write_map(self):
        self._should_write_map = False
        _pos = self._io.pos()
        self._io.seek(self.header.map_off)
        self._m_map._write__seq(self._io)
        self._io.seek(_pos)

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
        if self._should_write_method_ids:
            self._write_method_ids()
        if hasattr(self, '_m_method_ids'):
            return self._m_method_ids

        if not self.method_ids__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.method_ids_off)
        self._m_method_ids = []
        for i in range(self.header.method_ids_size):
            _t__m_method_ids = Dex.MethodIdItem(self._io, self, self._root)
            try:
                _t__m_method_ids._read()
            finally:
                self._m_method_ids.append(_t__m_method_ids)

        self._io.seek(_pos)
        return getattr(self, '_m_method_ids', None)

    @method_ids.setter
    def method_ids(self, v):
        self._dirty = True
        self._m_method_ids = v

    def _write_method_ids(self):
        self._should_write_method_ids = False
        _pos = self._io.pos()
        self._io.seek(self.header.method_ids_off)
        for i in range(len(self._m_method_ids)):
            pass
            self._m_method_ids[i]._write__seq(self._io)

        self._io.seek(_pos)

    @property
    def proto_ids(self):
        """method prototype identifiers list.
        
        These are identifiers for all prototypes referred to by this file.
        
        This list must be sorted in return-type (by type_id index) major order,
        and then by argument list (lexicographic ordering, individual arguments
        ordered by type_id index). The list must not contain any duplicate entries.
        """
        if self._should_write_proto_ids:
            self._write_proto_ids()
        if hasattr(self, '_m_proto_ids'):
            return self._m_proto_ids

        if not self.proto_ids__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.proto_ids_off)
        self._m_proto_ids = []
        for i in range(self.header.proto_ids_size):
            _t__m_proto_ids = Dex.ProtoIdItem(self._io, self, self._root)
            try:
                _t__m_proto_ids._read()
            finally:
                self._m_proto_ids.append(_t__m_proto_ids)

        self._io.seek(_pos)
        return getattr(self, '_m_proto_ids', None)

    @proto_ids.setter
    def proto_ids(self, v):
        self._dirty = True
        self._m_proto_ids = v

    def _write_proto_ids(self):
        self._should_write_proto_ids = False
        _pos = self._io.pos()
        self._io.seek(self.header.proto_ids_off)
        for i in range(len(self._m_proto_ids)):
            pass
            self._m_proto_ids[i]._write__seq(self._io)

        self._io.seek(_pos)

    @property
    def string_ids(self):
        """string identifiers list.
        
        These are identifiers for all the strings used by this file, either for
        internal naming (e.g., type descriptors) or as constant objects referred to by code.
        
        This list must be sorted by string contents, using UTF-16 code point values
        (not in a locale-sensitive manner), and it must not contain any duplicate entries.
        """
        if self._should_write_string_ids:
            self._write_string_ids()
        if hasattr(self, '_m_string_ids'):
            return self._m_string_ids

        if not self.string_ids__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.string_ids_off)
        self._m_string_ids = []
        for i in range(self.header.string_ids_size):
            _t__m_string_ids = Dex.StringIdItem(self._io, self, self._root)
            try:
                _t__m_string_ids._read()
            finally:
                self._m_string_ids.append(_t__m_string_ids)

        self._io.seek(_pos)
        return getattr(self, '_m_string_ids', None)

    @string_ids.setter
    def string_ids(self, v):
        self._dirty = True
        self._m_string_ids = v

    def _write_string_ids(self):
        self._should_write_string_ids = False
        _pos = self._io.pos()
        self._io.seek(self.header.string_ids_off)
        for i in range(len(self._m_string_ids)):
            pass
            self._m_string_ids[i]._write__seq(self._io)

        self._io.seek(_pos)

    @property
    def type_ids(self):
        """type identifiers list.
        
        These are identifiers for all types (classes, arrays, or primitive types)
        referred to by this file, whether defined in the file or not.
        
        This list must be sorted by string_id index, and it must not contain any duplicate entries.
        """
        if self._should_write_type_ids:
            self._write_type_ids()
        if hasattr(self, '_m_type_ids'):
            return self._m_type_ids

        if not self.type_ids__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.type_ids_off)
        self._m_type_ids = []
        for i in range(self.header.type_ids_size):
            _t__m_type_ids = Dex.TypeIdItem(self._io, self, self._root)
            try:
                _t__m_type_ids._read()
            finally:
                self._m_type_ids.append(_t__m_type_ids)

        self._io.seek(_pos)
        return getattr(self, '_m_type_ids', None)

    @type_ids.setter
    def type_ids(self, v):
        self._dirty = True
        self._m_type_ids = v

    def _write_type_ids(self):
        self._should_write_type_ids = False
        _pos = self._io.pos()
        self._io.seek(self.header.type_ids_off)
        for i in range(len(self._m_type_ids)):
            pass
            self._m_type_ids[i]._write__seq(self._io)

        self._io.seek(_pos)


