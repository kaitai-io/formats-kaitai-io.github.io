# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PhpSerializedValue(ReadWriteKaitaiStruct):
    """A serialized PHP value, in the format used by PHP's built-in `serialize` and
    `unserialize` functions. This format closely mirrors PHP's data model:
    it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
    associative arrays, objects, and recursive data structures using references.
    The only PHP values not supported by this format are *resources*,
    which usually correspond to native file or connection handles and cannot be
    meaningfully serialized.
    
    There is no official documentation for this data format;
    this spec was created based on the PHP source code and the behavior of
    `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
    serialized data between PHP versions, but in practice, the format has
    remained fully backwards-compatible - values serialized by an older
    PHP version can be unserialized on any newer PHP version.
    This spec supports serialized values from PHP 7.3 or any earlier version.
    
    .. seealso::
       Source - https://www.php.net/manual/en/function.serialize.php
    
    
    .. seealso::
       Source - https://www.php.net/manual/en/function.serialize.php#66147
    
    
    .. seealso::
       Source - https://www.php.net/manual/en/function.unserialize.php
    
    
    .. seealso::
       Source - https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re
    
    
    .. seealso::
       Source - https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822
    """

    class BoolValue(IntEnum):
        false = 48
        true = 49

    class ValueType(IntEnum):
        custom_serialized_object = 67
        null = 78
        object = 79
        variable_reference = 82
        php_6_string = 83
        array = 97
        bool = 98
        float = 100
        int = 105
        php_3_object = 111
        object_reference = 114
        string = 115
    def __init__(self, _io=None, _parent=None, _root=None):
        super(PhpSerializedValue, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.type = KaitaiStream.resolve_enum(PhpSerializedValue.ValueType, self._io.read_u1())
        _on = self.type
        if _on == PhpSerializedValue.ValueType.array:
            pass
            self.contents = PhpSerializedValue.ArrayContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.bool:
            pass
            self.contents = PhpSerializedValue.BoolContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.custom_serialized_object:
            pass
            self.contents = PhpSerializedValue.CustomSerializedObjectContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.float:
            pass
            self.contents = PhpSerializedValue.FloatContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.int:
            pass
            self.contents = PhpSerializedValue.IntContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.null:
            pass
            self.contents = PhpSerializedValue.NullContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.object:
            pass
            self.contents = PhpSerializedValue.ObjectContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.object_reference:
            pass
            self.contents = PhpSerializedValue.IntContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.php_3_object:
            pass
            self.contents = PhpSerializedValue.Php3ObjectContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.php_6_string:
            pass
            self.contents = PhpSerializedValue.StringContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.string:
            pass
            self.contents = PhpSerializedValue.StringContents(self._io, self, self._root)
            self.contents._read()
        elif _on == PhpSerializedValue.ValueType.variable_reference:
            pass
            self.contents = PhpSerializedValue.IntContents(self._io, self, self._root)
            self.contents._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        _on = self.type
        if _on == PhpSerializedValue.ValueType.array:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.bool:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.custom_serialized_object:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.float:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.int:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.null:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.object:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.object_reference:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.php_3_object:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.php_6_string:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.string:
            pass
            self.contents._fetch_instances()
        elif _on == PhpSerializedValue.ValueType.variable_reference:
            pass
            self.contents._fetch_instances()


    def _write__seq(self, io=None):
        super(PhpSerializedValue, self)._write__seq(io)
        self._io.write_u1(int(self.type))
        _on = self.type
        if _on == PhpSerializedValue.ValueType.array:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.bool:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.custom_serialized_object:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.float:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.int:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.null:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.object:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.object_reference:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.php_3_object:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.php_6_string:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.string:
            pass
            self.contents._write__seq(self._io)
        elif _on == PhpSerializedValue.ValueType.variable_reference:
            pass
            self.contents._write__seq(self._io)


    def _check(self):
        _on = self.type
        if _on == PhpSerializedValue.ValueType.array:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.bool:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.custom_serialized_object:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.float:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.int:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.null:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.object:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.object_reference:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.php_3_object:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.php_6_string:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.string:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        elif _on == PhpSerializedValue.ValueType.variable_reference:
            pass
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        self._dirty = False

    class ArrayContents(ReadWriteKaitaiStruct):
        """The contents of an array value."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.ArrayContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colon = self._io.read_bytes(1)
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, self._io, u"/types/array_contents/seq/0")
            self.elements = PhpSerializedValue.CountPrefixedMapping(self._io, self, self._root)
            self.elements._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.elements._fetch_instances()


        def _write__seq(self, io=None):
            super(PhpSerializedValue.ArrayContents, self)._write__seq(io)
            self._io.write_bytes(self.colon)
            self.elements._write__seq(self._io)


        def _check(self):
            if len(self.colon) != 1:
                raise kaitaistruct.ConsistencyError(u"colon", 1, len(self.colon))
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, None, u"/types/array_contents/seq/0")
            if self.elements._root != self._root:
                raise kaitaistruct.ConsistencyError(u"elements", self._root, self.elements._root)
            if self.elements._parent != self:
                raise kaitaistruct.ConsistencyError(u"elements", self, self.elements._parent)
            self._dirty = False


    class BoolContents(ReadWriteKaitaiStruct):
        """The contents of a boolean value (`value_type::bool`)."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.BoolContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colon = self._io.read_bytes(1)
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, self._io, u"/types/bool_contents/seq/0")
            self.value_dec = KaitaiStream.resolve_enum(PhpSerializedValue.BoolValue, self._io.read_u1())
            self.semicolon = self._io.read_bytes(1)
            if not self.semicolon == b"\x3B":
                raise kaitaistruct.ValidationNotEqualError(b"\x3B", self.semicolon, self._io, u"/types/bool_contents/seq/2")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PhpSerializedValue.BoolContents, self)._write__seq(io)
            self._io.write_bytes(self.colon)
            self._io.write_u1(int(self.value_dec))
            self._io.write_bytes(self.semicolon)


        def _check(self):
            if len(self.colon) != 1:
                raise kaitaistruct.ConsistencyError(u"colon", 1, len(self.colon))
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, None, u"/types/bool_contents/seq/0")
            if len(self.semicolon) != 1:
                raise kaitaistruct.ConsistencyError(u"semicolon", 1, len(self.semicolon))
            if not self.semicolon == b"\x3B":
                raise kaitaistruct.ValidationNotEqualError(b"\x3B", self.semicolon, None, u"/types/bool_contents/seq/2")
            self._dirty = False

        @property
        def value(self):
            """The value of the `bool`, parsed as a boolean."""
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.value_dec == PhpSerializedValue.BoolValue.true
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class CountPrefixedMapping(ReadWriteKaitaiStruct):
        """A mapping (a sequence of key-value pairs) prefixed with its size."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.CountPrefixedMapping, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_entries_dec = (self._io.read_bytes_term(58, False, True, True)).decode(u"ASCII")
            self.opening_brace = self._io.read_bytes(1)
            if not self.opening_brace == b"\x7B":
                raise kaitaistruct.ValidationNotEqualError(b"\x7B", self.opening_brace, self._io, u"/types/count_prefixed_mapping/seq/1")
            self.entries = []
            for i in range(self.num_entries):
                _t_entries = PhpSerializedValue.MappingEntry(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)

            self.closing_brace = self._io.read_bytes(1)
            if not self.closing_brace == b"\x7D":
                raise kaitaistruct.ValidationNotEqualError(b"\x7D", self.closing_brace, self._io, u"/types/count_prefixed_mapping/seq/3")
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(PhpSerializedValue.CountPrefixedMapping, self)._write__seq(io)
            self._io.write_bytes((self.num_entries_dec).encode(u"ASCII"))
            self._io.write_u1(58)
            self._io.write_bytes(self.opening_brace)
            for i in range(len(self.entries)):
                pass
                self.entries[i]._write__seq(self._io)

            self._io.write_bytes(self.closing_brace)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.num_entries_dec).encode(u"ASCII"), 58) != -1:
                raise kaitaistruct.ConsistencyError(u"num_entries_dec", -1, KaitaiStream.byte_array_index_of((self.num_entries_dec).encode(u"ASCII"), 58))
            if len(self.opening_brace) != 1:
                raise kaitaistruct.ConsistencyError(u"opening_brace", 1, len(self.opening_brace))
            if not self.opening_brace == b"\x7B":
                raise kaitaistruct.ValidationNotEqualError(b"\x7B", self.opening_brace, None, u"/types/count_prefixed_mapping/seq/1")
            if len(self.entries) != self.num_entries:
                raise kaitaistruct.ConsistencyError(u"entries", self.num_entries, len(self.entries))
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            if len(self.closing_brace) != 1:
                raise kaitaistruct.ConsistencyError(u"closing_brace", 1, len(self.closing_brace))
            if not self.closing_brace == b"\x7D":
                raise kaitaistruct.ValidationNotEqualError(b"\x7D", self.closing_brace, None, u"/types/count_prefixed_mapping/seq/3")
            self._dirty = False

        @property
        def num_entries(self):
            """The number of key-value pairs in the mapping, parsed as an integer.
            """
            if hasattr(self, '_m_num_entries'):
                return self._m_num_entries

            self._m_num_entries = int(self.num_entries_dec)
            return getattr(self, '_m_num_entries', None)

        def _invalidate_num_entries(self):
            del self._m_num_entries

    class CustomSerializedObjectContents(ReadWriteKaitaiStruct):
        """The contents of an object value that implements a custom
        serialized format using `Serializable`.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.CustomSerializedObjectContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colon1 = self._io.read_bytes(1)
            if not self.colon1 == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon1, self._io, u"/types/custom_serialized_object_contents/seq/0")
            self.class_name = PhpSerializedValue.LengthPrefixedQuotedString(self._io, self, self._root)
            self.class_name._read()
            self.colon2 = self._io.read_bytes(1)
            if not self.colon2 == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon2, self._io, u"/types/custom_serialized_object_contents/seq/2")
            self.len_data_dec = (self._io.read_bytes_term(58, False, True, True)).decode(u"ASCII")
            self.opening_brace = self._io.read_bytes(1)
            if not self.opening_brace == b"\x7B":
                raise kaitaistruct.ValidationNotEqualError(b"\x7B", self.opening_brace, self._io, u"/types/custom_serialized_object_contents/seq/4")
            self.data = self._io.read_bytes(self.len_data)
            self.closing_quote = self._io.read_bytes(1)
            if not self.closing_quote == b"\x7D":
                raise kaitaistruct.ValidationNotEqualError(b"\x7D", self.closing_quote, self._io, u"/types/custom_serialized_object_contents/seq/6")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.class_name._fetch_instances()


        def _write__seq(self, io=None):
            super(PhpSerializedValue.CustomSerializedObjectContents, self)._write__seq(io)
            self._io.write_bytes(self.colon1)
            self.class_name._write__seq(self._io)
            self._io.write_bytes(self.colon2)
            self._io.write_bytes((self.len_data_dec).encode(u"ASCII"))
            self._io.write_u1(58)
            self._io.write_bytes(self.opening_brace)
            self._io.write_bytes(self.data)
            self._io.write_bytes(self.closing_quote)


        def _check(self):
            if len(self.colon1) != 1:
                raise kaitaistruct.ConsistencyError(u"colon1", 1, len(self.colon1))
            if not self.colon1 == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon1, None, u"/types/custom_serialized_object_contents/seq/0")
            if self.class_name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"class_name", self._root, self.class_name._root)
            if self.class_name._parent != self:
                raise kaitaistruct.ConsistencyError(u"class_name", self, self.class_name._parent)
            if len(self.colon2) != 1:
                raise kaitaistruct.ConsistencyError(u"colon2", 1, len(self.colon2))
            if not self.colon2 == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon2, None, u"/types/custom_serialized_object_contents/seq/2")
            if KaitaiStream.byte_array_index_of((self.len_data_dec).encode(u"ASCII"), 58) != -1:
                raise kaitaistruct.ConsistencyError(u"len_data_dec", -1, KaitaiStream.byte_array_index_of((self.len_data_dec).encode(u"ASCII"), 58))
            if len(self.opening_brace) != 1:
                raise kaitaistruct.ConsistencyError(u"opening_brace", 1, len(self.opening_brace))
            if not self.opening_brace == b"\x7B":
                raise kaitaistruct.ValidationNotEqualError(b"\x7B", self.opening_brace, None, u"/types/custom_serialized_object_contents/seq/4")
            if len(self.data) != self.len_data:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            if len(self.closing_quote) != 1:
                raise kaitaistruct.ConsistencyError(u"closing_quote", 1, len(self.closing_quote))
            if not self.closing_quote == b"\x7D":
                raise kaitaistruct.ValidationNotEqualError(b"\x7D", self.closing_quote, None, u"/types/custom_serialized_object_contents/seq/6")
            self._dirty = False

        @property
        def len_data(self):
            """The length of the serialized data in bytes, parsed as an integer.
            The braces are not counted in this length number.
            """
            if hasattr(self, '_m_len_data'):
                return self._m_len_data

            self._m_len_data = int(self.len_data_dec)
            return getattr(self, '_m_len_data', None)

        def _invalidate_len_data(self):
            del self._m_len_data

    class FloatContents(ReadWriteKaitaiStruct):
        """The contents of a floating-point value."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.FloatContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colon = self._io.read_bytes(1)
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, self._io, u"/types/float_contents/seq/0")
            self.value_dec = (self._io.read_bytes_term(59, False, True, True)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PhpSerializedValue.FloatContents, self)._write__seq(io)
            self._io.write_bytes(self.colon)
            self._io.write_bytes((self.value_dec).encode(u"ASCII"))
            self._io.write_u1(59)


        def _check(self):
            if len(self.colon) != 1:
                raise kaitaistruct.ConsistencyError(u"colon", 1, len(self.colon))
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, None, u"/types/float_contents/seq/0")
            if KaitaiStream.byte_array_index_of((self.value_dec).encode(u"ASCII"), 59) != -1:
                raise kaitaistruct.ConsistencyError(u"value_dec", -1, KaitaiStream.byte_array_index_of((self.value_dec).encode(u"ASCII"), 59))
            self._dirty = False


    class IntContents(ReadWriteKaitaiStruct):
        """The contents of an integer-like value:
        either an actual integer (`value_type::int`) or a reference
        (`value_type::variable_reference`, `value_type::object_reference`).
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.IntContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colon = self._io.read_bytes(1)
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, self._io, u"/types/int_contents/seq/0")
            self.value_dec = (self._io.read_bytes_term(59, False, True, True)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PhpSerializedValue.IntContents, self)._write__seq(io)
            self._io.write_bytes(self.colon)
            self._io.write_bytes((self.value_dec).encode(u"ASCII"))
            self._io.write_u1(59)


        def _check(self):
            if len(self.colon) != 1:
                raise kaitaistruct.ConsistencyError(u"colon", 1, len(self.colon))
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, None, u"/types/int_contents/seq/0")
            if KaitaiStream.byte_array_index_of((self.value_dec).encode(u"ASCII"), 59) != -1:
                raise kaitaistruct.ConsistencyError(u"value_dec", -1, KaitaiStream.byte_array_index_of((self.value_dec).encode(u"ASCII"), 59))
            self._dirty = False

        @property
        def value(self):
            """The value of the `int`, parsed as an integer."""
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = int(self.value_dec)
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class LengthPrefixedQuotedString(ReadWriteKaitaiStruct):
        """A quoted string prefixed with its length.
        
        Despite the quotes surrounding the string data, it can contain
        arbitrary bytes, which are never escaped in any way.
        This does not cause any ambiguities when parsing - the bounds of
        the string are determined only by the length field, not by the quotes.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.LengthPrefixedQuotedString, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_data_dec = (self._io.read_bytes_term(58, False, True, True)).decode(u"ASCII")
            self.opening_quote = self._io.read_bytes(1)
            if not self.opening_quote == b"\x22":
                raise kaitaistruct.ValidationNotEqualError(b"\x22", self.opening_quote, self._io, u"/types/length_prefixed_quoted_string/seq/1")
            self.data = self._io.read_bytes(self.len_data)
            self.closing_quote = self._io.read_bytes(1)
            if not self.closing_quote == b"\x22":
                raise kaitaistruct.ValidationNotEqualError(b"\x22", self.closing_quote, self._io, u"/types/length_prefixed_quoted_string/seq/3")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PhpSerializedValue.LengthPrefixedQuotedString, self)._write__seq(io)
            self._io.write_bytes((self.len_data_dec).encode(u"ASCII"))
            self._io.write_u1(58)
            self._io.write_bytes(self.opening_quote)
            self._io.write_bytes(self.data)
            self._io.write_bytes(self.closing_quote)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.len_data_dec).encode(u"ASCII"), 58) != -1:
                raise kaitaistruct.ConsistencyError(u"len_data_dec", -1, KaitaiStream.byte_array_index_of((self.len_data_dec).encode(u"ASCII"), 58))
            if len(self.opening_quote) != 1:
                raise kaitaistruct.ConsistencyError(u"opening_quote", 1, len(self.opening_quote))
            if not self.opening_quote == b"\x22":
                raise kaitaistruct.ValidationNotEqualError(b"\x22", self.opening_quote, None, u"/types/length_prefixed_quoted_string/seq/1")
            if len(self.data) != self.len_data:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            if len(self.closing_quote) != 1:
                raise kaitaistruct.ConsistencyError(u"closing_quote", 1, len(self.closing_quote))
            if not self.closing_quote == b"\x22":
                raise kaitaistruct.ValidationNotEqualError(b"\x22", self.closing_quote, None, u"/types/length_prefixed_quoted_string/seq/3")
            self._dirty = False

        @property
        def len_data(self):
            """The length of the string's contents in bytes, parsed as an integer.
            The quotes are not counted in this size number.
            """
            if hasattr(self, '_m_len_data'):
                return self._m_len_data

            self._m_len_data = int(self.len_data_dec)
            return getattr(self, '_m_len_data', None)

        def _invalidate_len_data(self):
            del self._m_len_data

    class MappingEntry(ReadWriteKaitaiStruct):
        """A mapping entry consisting of a key and a value."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.MappingEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.key = PhpSerializedValue(self._io, self, self._root)
            self.key._read()
            self.value = PhpSerializedValue(self._io, self, self._root)
            self.value._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()
            self.value._fetch_instances()


        def _write__seq(self, io=None):
            super(PhpSerializedValue.MappingEntry, self)._write__seq(io)
            self.key._write__seq(self._io)
            self.value._write__seq(self._io)


        def _check(self):
            if self.key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key", self._root, self.key._root)
            if self.key._parent != self:
                raise kaitaistruct.ConsistencyError(u"key", self, self.key._parent)
            if self.value._root != self._root:
                raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
            if self.value._parent != self:
                raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            self._dirty = False


    class NullContents(ReadWriteKaitaiStruct):
        """The contents of a null value (`value_type::null`). This structure
        contains no actual data, since there is only a single `NULL` value.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.NullContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.semicolon = self._io.read_bytes(1)
            if not self.semicolon == b"\x3B":
                raise kaitaistruct.ValidationNotEqualError(b"\x3B", self.semicolon, self._io, u"/types/null_contents/seq/0")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PhpSerializedValue.NullContents, self)._write__seq(io)
            self._io.write_bytes(self.semicolon)


        def _check(self):
            if len(self.semicolon) != 1:
                raise kaitaistruct.ConsistencyError(u"semicolon", 1, len(self.semicolon))
            if not self.semicolon == b"\x3B":
                raise kaitaistruct.ValidationNotEqualError(b"\x3B", self.semicolon, None, u"/types/null_contents/seq/0")
            self._dirty = False


    class ObjectContents(ReadWriteKaitaiStruct):
        """The contents of an object value serialized in the default format.
        Unlike its PHP 3 counterpart, it contains a class name.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.ObjectContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colon1 = self._io.read_bytes(1)
            if not self.colon1 == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon1, self._io, u"/types/object_contents/seq/0")
            self.class_name = PhpSerializedValue.LengthPrefixedQuotedString(self._io, self, self._root)
            self.class_name._read()
            self.colon2 = self._io.read_bytes(1)
            if not self.colon2 == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon2, self._io, u"/types/object_contents/seq/2")
            self.properties = PhpSerializedValue.CountPrefixedMapping(self._io, self, self._root)
            self.properties._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.class_name._fetch_instances()
            self.properties._fetch_instances()


        def _write__seq(self, io=None):
            super(PhpSerializedValue.ObjectContents, self)._write__seq(io)
            self._io.write_bytes(self.colon1)
            self.class_name._write__seq(self._io)
            self._io.write_bytes(self.colon2)
            self.properties._write__seq(self._io)


        def _check(self):
            if len(self.colon1) != 1:
                raise kaitaistruct.ConsistencyError(u"colon1", 1, len(self.colon1))
            if not self.colon1 == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon1, None, u"/types/object_contents/seq/0")
            if self.class_name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"class_name", self._root, self.class_name._root)
            if self.class_name._parent != self:
                raise kaitaistruct.ConsistencyError(u"class_name", self, self.class_name._parent)
            if len(self.colon2) != 1:
                raise kaitaistruct.ConsistencyError(u"colon2", 1, len(self.colon2))
            if not self.colon2 == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon2, None, u"/types/object_contents/seq/2")
            if self.properties._root != self._root:
                raise kaitaistruct.ConsistencyError(u"properties", self._root, self.properties._root)
            if self.properties._parent != self:
                raise kaitaistruct.ConsistencyError(u"properties", self, self.properties._parent)
            self._dirty = False


    class Php3ObjectContents(ReadWriteKaitaiStruct):
        """The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
        and above, it does not contain a class name.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.Php3ObjectContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colon = self._io.read_bytes(1)
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, self._io, u"/types/php_3_object_contents/seq/0")
            self.properties = PhpSerializedValue.CountPrefixedMapping(self._io, self, self._root)
            self.properties._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.properties._fetch_instances()


        def _write__seq(self, io=None):
            super(PhpSerializedValue.Php3ObjectContents, self)._write__seq(io)
            self._io.write_bytes(self.colon)
            self.properties._write__seq(self._io)


        def _check(self):
            if len(self.colon) != 1:
                raise kaitaistruct.ConsistencyError(u"colon", 1, len(self.colon))
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, None, u"/types/php_3_object_contents/seq/0")
            if self.properties._root != self._root:
                raise kaitaistruct.ConsistencyError(u"properties", self._root, self.properties._root)
            if self.properties._parent != self:
                raise kaitaistruct.ConsistencyError(u"properties", self, self.properties._parent)
            self._dirty = False


    class StringContents(ReadWriteKaitaiStruct):
        """The contents of a string value.
        
        Note: PHP strings can contain arbitrary byte sequences.
        They are not necessarily valid text in any specific encoding.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PhpSerializedValue.StringContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colon = self._io.read_bytes(1)
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, self._io, u"/types/string_contents/seq/0")
            self.string = PhpSerializedValue.LengthPrefixedQuotedString(self._io, self, self._root)
            self.string._read()
            self.semicolon = self._io.read_bytes(1)
            if not self.semicolon == b"\x3B":
                raise kaitaistruct.ValidationNotEqualError(b"\x3B", self.semicolon, self._io, u"/types/string_contents/seq/2")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.string._fetch_instances()


        def _write__seq(self, io=None):
            super(PhpSerializedValue.StringContents, self)._write__seq(io)
            self._io.write_bytes(self.colon)
            self.string._write__seq(self._io)
            self._io.write_bytes(self.semicolon)


        def _check(self):
            if len(self.colon) != 1:
                raise kaitaistruct.ConsistencyError(u"colon", 1, len(self.colon))
            if not self.colon == b"\x3A":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A", self.colon, None, u"/types/string_contents/seq/0")
            if self.string._root != self._root:
                raise kaitaistruct.ConsistencyError(u"string", self._root, self.string._root)
            if self.string._parent != self:
                raise kaitaistruct.ConsistencyError(u"string", self, self.string._parent)
            if len(self.semicolon) != 1:
                raise kaitaistruct.ConsistencyError(u"semicolon", 1, len(self.semicolon))
            if not self.semicolon == b"\x3B":
                raise kaitaistruct.ValidationNotEqualError(b"\x3B", self.semicolon, None, u"/types/string_contents/seq/2")
            self._dirty = False

        @property
        def value(self):
            """The value of the string, as a byte array."""
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.string.data
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value


