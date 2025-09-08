# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Bson(ReadWriteKaitaiStruct):
    """BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
      * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
      * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
      * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Bson, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.len = self._io.read_s4le()
        self._raw_fields = self._io.read_bytes(self.len - 5)
        _io__raw_fields = KaitaiStream(BytesIO(self._raw_fields))
        self.fields = Bson.ElementsList(_io__raw_fields, self, self._root)
        self.fields._read()
        self.terminator = self._io.read_bytes(1)
        if not self.terminator == b"\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00", self.terminator, self._io, u"/seq/2")
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.fields._fetch_instances()


    def _write__seq(self, io=None):
        super(Bson, self)._write__seq(io)
        self._io.write_s4le(self.len)
        _io__raw_fields = KaitaiStream(BytesIO(bytearray(self.len - 5)))
        self._io.add_child_stream(_io__raw_fields)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len - 5))
        def handler(parent, _io__raw_fields=_io__raw_fields):
            self._raw_fields = _io__raw_fields.to_byte_array()
            if len(self._raw_fields) != self.len - 5:
                raise kaitaistruct.ConsistencyError(u"raw(fields)", self.len - 5, len(self._raw_fields))
            parent.write_bytes(self._raw_fields)
        _io__raw_fields.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.fields._write__seq(_io__raw_fields)
        self._io.write_bytes(self.terminator)


    def _check(self):
        if self.fields._root != self._root:
            raise kaitaistruct.ConsistencyError(u"fields", self._root, self.fields._root)
        if self.fields._parent != self:
            raise kaitaistruct.ConsistencyError(u"fields", self, self.fields._parent)
        if len(self.terminator) != 1:
            raise kaitaistruct.ConsistencyError(u"terminator", 1, len(self.terminator))
        if not self.terminator == b"\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00", self.terminator, None, u"/seq/2")
        self._dirty = False

    class BinData(ReadWriteKaitaiStruct):
        """The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined."""

        class Subtype(IntEnum):
            generic = 0
            function = 1
            byte_array_deprecated = 2
            uuid_deprecated = 3
            uuid = 4
            md5 = 5
            custom = 128
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.BinData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_s4le()
            self.subtype = KaitaiStream.resolve_enum(Bson.BinData.Subtype, self._io.read_u1())
            _on = self.subtype
            if _on == Bson.BinData.Subtype.byte_array_deprecated:
                pass
                self._raw_content = self._io.read_bytes(self.len)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = Bson.BinData.ByteArrayDeprecated(_io__raw_content, self, self._root)
                self.content._read()
            else:
                pass
                self.content = self._io.read_bytes(self.len)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.subtype
            if _on == Bson.BinData.Subtype.byte_array_deprecated:
                pass
                self.content._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Bson.BinData, self)._write__seq(io)
            self._io.write_s4le(self.len)
            self._io.write_u1(int(self.subtype))
            _on = self.subtype
            if _on == Bson.BinData.Subtype.byte_array_deprecated:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            else:
                pass
                self._io.write_bytes(self.content)


        def _check(self):
            _on = self.subtype
            if _on == Bson.BinData.Subtype.byte_array_deprecated:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            else:
                pass
                if len(self.content) != self.len:
                    raise kaitaistruct.ConsistencyError(u"content", self.len, len(self.content))
            self._dirty = False

        class ByteArrayDeprecated(ReadWriteKaitaiStruct):
            """The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined."""
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Bson.BinData.ByteArrayDeprecated, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.len = self._io.read_s4le()
                self.content = self._io.read_bytes(self.len)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Bson.BinData.ByteArrayDeprecated, self)._write__seq(io)
                self._io.write_s4le(self.len)
                self._io.write_bytes(self.content)


            def _check(self):
                if len(self.content) != self.len:
                    raise kaitaistruct.ConsistencyError(u"content", self.len, len(self.content))
                self._dirty = False



    class CodeWithScope(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.CodeWithScope, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_s4le()
            self.source = Bson.String(self._io, self, self._root)
            self.source._read()
            self.scope = Bson(self._io, self, self._root)
            self.scope._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.source._fetch_instances()
            self.scope._fetch_instances()


        def _write__seq(self, io=None):
            super(Bson.CodeWithScope, self)._write__seq(io)
            self._io.write_s4le(self.id)
            self.source._write__seq(self._io)
            self.scope._write__seq(self._io)


        def _check(self):
            if self.source._root != self._root:
                raise kaitaistruct.ConsistencyError(u"source", self._root, self.source._root)
            if self.source._parent != self:
                raise kaitaistruct.ConsistencyError(u"source", self, self.source._parent)
            if self.scope._root != self._root:
                raise kaitaistruct.ConsistencyError(u"scope", self._root, self.scope._root)
            if self.scope._parent != self:
                raise kaitaistruct.ConsistencyError(u"scope", self, self.scope._parent)
            self._dirty = False


    class Cstring(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.Cstring, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.str = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bson.Cstring, self)._write__seq(io)
            self._io.write_bytes((self.str).encode(u"UTF-8"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.str).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"str", -1, KaitaiStream.byte_array_index_of((self.str).encode(u"UTF-8"), 0))
            self._dirty = False


    class DbPointer(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.DbPointer, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.namespace = Bson.String(self._io, self, self._root)
            self.namespace._read()
            self.id = Bson.ObjectId(self._io, self, self._root)
            self.id._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.namespace._fetch_instances()
            self.id._fetch_instances()


        def _write__seq(self, io=None):
            super(Bson.DbPointer, self)._write__seq(io)
            self.namespace._write__seq(self._io)
            self.id._write__seq(self._io)


        def _check(self):
            if self.namespace._root != self._root:
                raise kaitaistruct.ConsistencyError(u"namespace", self._root, self.namespace._root)
            if self.namespace._parent != self:
                raise kaitaistruct.ConsistencyError(u"namespace", self, self.namespace._parent)
            if self.id._root != self._root:
                raise kaitaistruct.ConsistencyError(u"id", self._root, self.id._root)
            if self.id._parent != self:
                raise kaitaistruct.ConsistencyError(u"id", self, self.id._parent)
            self._dirty = False


    class Element(ReadWriteKaitaiStruct):

        class BsonType(IntEnum):
            min_key = -1
            end_of_object = 0
            number_double = 1
            string = 2
            document = 3
            array = 4
            bin_data = 5
            undefined = 6
            object_id = 7
            boolean = 8
            utc_datetime = 9
            jst_null = 10
            reg_ex = 11
            db_pointer = 12
            javascript = 13
            symbol = 14
            code_with_scope = 15
            number_int = 16
            timestamp = 17
            number_long = 18
            number_decimal = 19
            max_key = 127
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.Element, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type_byte = KaitaiStream.resolve_enum(Bson.Element.BsonType, self._io.read_u1())
            self.name = Bson.Cstring(self._io, self, self._root)
            self.name._read()
            _on = self.type_byte
            if _on == Bson.Element.BsonType.array:
                pass
                self.content = Bson(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.bin_data:
                pass
                self.content = Bson.BinData(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.boolean:
                pass
                self.content = self._io.read_u1()
            elif _on == Bson.Element.BsonType.code_with_scope:
                pass
                self.content = Bson.CodeWithScope(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.db_pointer:
                pass
                self.content = Bson.DbPointer(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.document:
                pass
                self.content = Bson(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.javascript:
                pass
                self.content = Bson.String(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.number_decimal:
                pass
                self.content = Bson.F16(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.number_double:
                pass
                self.content = self._io.read_f8le()
            elif _on == Bson.Element.BsonType.number_int:
                pass
                self.content = self._io.read_s4le()
            elif _on == Bson.Element.BsonType.number_long:
                pass
                self.content = self._io.read_s8le()
            elif _on == Bson.Element.BsonType.object_id:
                pass
                self.content = Bson.ObjectId(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.reg_ex:
                pass
                self.content = Bson.RegEx(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.string:
                pass
                self.content = Bson.String(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.symbol:
                pass
                self.content = Bson.String(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.timestamp:
                pass
                self.content = Bson.Timestamp(self._io, self, self._root)
                self.content._read()
            elif _on == Bson.Element.BsonType.utc_datetime:
                pass
                self.content = self._io.read_s8le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            _on = self.type_byte
            if _on == Bson.Element.BsonType.array:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.bin_data:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.boolean:
                pass
            elif _on == Bson.Element.BsonType.code_with_scope:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.db_pointer:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.document:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.javascript:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.number_decimal:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.number_double:
                pass
            elif _on == Bson.Element.BsonType.number_int:
                pass
            elif _on == Bson.Element.BsonType.number_long:
                pass
            elif _on == Bson.Element.BsonType.object_id:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.reg_ex:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.string:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.symbol:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.timestamp:
                pass
                self.content._fetch_instances()
            elif _on == Bson.Element.BsonType.utc_datetime:
                pass


        def _write__seq(self, io=None):
            super(Bson.Element, self)._write__seq(io)
            self._io.write_u1(int(self.type_byte))
            self.name._write__seq(self._io)
            _on = self.type_byte
            if _on == Bson.Element.BsonType.array:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.bin_data:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.boolean:
                pass
                self._io.write_u1(self.content)
            elif _on == Bson.Element.BsonType.code_with_scope:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.db_pointer:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.document:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.javascript:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.number_decimal:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.number_double:
                pass
                self._io.write_f8le(self.content)
            elif _on == Bson.Element.BsonType.number_int:
                pass
                self._io.write_s4le(self.content)
            elif _on == Bson.Element.BsonType.number_long:
                pass
                self._io.write_s8le(self.content)
            elif _on == Bson.Element.BsonType.object_id:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.reg_ex:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.string:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.symbol:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.timestamp:
                pass
                self.content._write__seq(self._io)
            elif _on == Bson.Element.BsonType.utc_datetime:
                pass
                self._io.write_s8le(self.content)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            _on = self.type_byte
            if _on == Bson.Element.BsonType.array:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.bin_data:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.boolean:
                pass
            elif _on == Bson.Element.BsonType.code_with_scope:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.db_pointer:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.document:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.javascript:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.number_decimal:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.number_double:
                pass
            elif _on == Bson.Element.BsonType.number_int:
                pass
            elif _on == Bson.Element.BsonType.number_long:
                pass
            elif _on == Bson.Element.BsonType.object_id:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.reg_ex:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.string:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.symbol:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.timestamp:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == Bson.Element.BsonType.utc_datetime:
                pass
            self._dirty = False


    class ElementsList(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.ElementsList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.elements = []
            i = 0
            while not self._io.is_eof():
                _t_elements = Bson.Element(self._io, self, self._root)
                try:
                    _t_elements._read()
                finally:
                    self.elements.append(_t_elements)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.elements)):
                pass
                self.elements[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Bson.ElementsList, self)._write__seq(io)
            for i in range(len(self.elements)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"elements", 0, self._io.size() - self._io.pos())
                self.elements[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"elements", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.elements)):
                pass
                if self.elements[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"elements", self._root, self.elements[i]._root)
                if self.elements[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"elements", self, self.elements[i]._parent)

            self._dirty = False


    class F16(ReadWriteKaitaiStruct):
        """128-bit IEEE 754-2008 decimal floating point."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.F16, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.str = self._io.read_bits_int_be(1) != 0
            self.exponent = self._io.read_bits_int_be(15)
            self.significand_hi = self._io.read_bits_int_be(49)
            self.significand_lo = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bson.F16, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.str))
            self._io.write_bits_int_be(15, self.exponent)
            self._io.write_bits_int_be(49, self.significand_hi)
            self._io.write_u8le(self.significand_lo)


        def _check(self):
            self._dirty = False


    class ObjectId(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.mongodb.com/docs/manual/reference/method/ObjectId/
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.ObjectId, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.epoch_time = self._io.read_u4le()
            self.machine_id = Bson.U3(self._io, self, self._root)
            self.machine_id._read()
            self.process_id = self._io.read_u2le()
            self.counter = Bson.U3(self._io, self, self._root)
            self.counter._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.machine_id._fetch_instances()
            self.counter._fetch_instances()


        def _write__seq(self, io=None):
            super(Bson.ObjectId, self)._write__seq(io)
            self._io.write_u4le(self.epoch_time)
            self.machine_id._write__seq(self._io)
            self._io.write_u2le(self.process_id)
            self.counter._write__seq(self._io)


        def _check(self):
            if self.machine_id._root != self._root:
                raise kaitaistruct.ConsistencyError(u"machine_id", self._root, self.machine_id._root)
            if self.machine_id._parent != self:
                raise kaitaistruct.ConsistencyError(u"machine_id", self, self.machine_id._parent)
            if self.counter._root != self._root:
                raise kaitaistruct.ConsistencyError(u"counter", self._root, self.counter._root)
            if self.counter._parent != self:
                raise kaitaistruct.ConsistencyError(u"counter", self, self.counter._parent)
            self._dirty = False


    class RegEx(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.RegEx, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.pattern = Bson.Cstring(self._io, self, self._root)
            self.pattern._read()
            self.options = Bson.Cstring(self._io, self, self._root)
            self.options._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.pattern._fetch_instances()
            self.options._fetch_instances()


        def _write__seq(self, io=None):
            super(Bson.RegEx, self)._write__seq(io)
            self.pattern._write__seq(self._io)
            self.options._write__seq(self._io)


        def _check(self):
            if self.pattern._root != self._root:
                raise kaitaistruct.ConsistencyError(u"pattern", self._root, self.pattern._root)
            if self.pattern._parent != self:
                raise kaitaistruct.ConsistencyError(u"pattern", self, self.pattern._parent)
            if self.options._root != self._root:
                raise kaitaistruct.ConsistencyError(u"options", self._root, self.options._root)
            if self.options._parent != self:
                raise kaitaistruct.ConsistencyError(u"options", self, self.options._parent)
            self._dirty = False


    class String(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.String, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_s4le()
            self.str = (self._io.read_bytes(self.len - 1)).decode(u"UTF-8")
            self.terminator = self._io.read_bytes(1)
            if not self.terminator == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.terminator, self._io, u"/types/string/seq/2")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bson.String, self)._write__seq(io)
            self._io.write_s4le(self.len)
            self._io.write_bytes((self.str).encode(u"UTF-8"))
            self._io.write_bytes(self.terminator)


        def _check(self):
            if len((self.str).encode(u"UTF-8")) != self.len - 1:
                raise kaitaistruct.ConsistencyError(u"str", self.len - 1, len((self.str).encode(u"UTF-8")))
            if len(self.terminator) != 1:
                raise kaitaistruct.ConsistencyError(u"terminator", 1, len(self.terminator))
            if not self.terminator == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.terminator, None, u"/types/string/seq/2")
            self._dirty = False


    class Timestamp(ReadWriteKaitaiStruct):
        """Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.Timestamp, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.increment = self._io.read_u4le()
            self.timestamp = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bson.Timestamp, self)._write__seq(io)
            self._io.write_u4le(self.increment)
            self._io.write_u4le(self.timestamp)


        def _check(self):
            self._dirty = False


    class U3(ReadWriteKaitaiStruct):
        """Implements unsigned 24-bit (3 byte) integer.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bson.U3, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.b1 = self._io.read_u1()
            self.b2 = self._io.read_u1()
            self.b3 = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bson.U3, self)._write__seq(io)
            self._io.write_u1(self.b1)
            self._io.write_u1(self.b2)
            self._io.write_u1(self.b3)


        def _check(self):
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = (self.b1 | self.b2 << 8) | self.b3 << 16
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value


