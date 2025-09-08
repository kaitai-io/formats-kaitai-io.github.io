# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import bytes_with_io
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PcfFont(ReadWriteKaitaiStruct):
    """Portable Compiled Format (PCF) font is a bitmap font format
    originating from X11 Window System. It matches BDF format (which is
    text-based) closely, but instead being binary and
    platform-independent (as opposed to previously used SNF binary
    format) due to introduced features to handle different endianness
    and bit order.
    
    The overall composition of the format is straightforward: it's more
    or less classic directory of type-offset-size pointers, pointing to
    what PCF format calls "tables". Each table carries a certain
    piece of information related to the font (metadata properties,
    metrics, bitmaps, mapping of glyphs to characters, etc).
    
    .. seealso::
       Source - https://fontforge.org/docs/techref/pcf-format.html
    """

    class Types(IntEnum):
        properties = 1
        accelerators = 2
        metrics = 4
        bitmaps = 8
        ink_metrics = 16
        bdf_encodings = 32
        swidths = 64
        glyph_names = 128
        bdf_accelerators = 256
    def __init__(self, _io=None, _parent=None, _root=None):
        super(PcfFont, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x01\x66\x63\x70":
            raise kaitaistruct.ValidationNotEqualError(b"\x01\x66\x63\x70", self.magic, self._io, u"/seq/0")
        self.num_tables = self._io.read_u4le()
        self.tables = []
        for i in range(self.num_tables):
            _t_tables = PcfFont.Table(self._io, self, self._root)
            try:
                _t_tables._read()
            finally:
                self.tables.append(_t_tables)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.tables)):
            pass
            self.tables[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(PcfFont, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u4le(self.num_tables)
        for i in range(len(self.tables)):
            pass
            self.tables[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x01\x66\x63\x70":
            raise kaitaistruct.ValidationNotEqualError(b"\x01\x66\x63\x70", self.magic, None, u"/seq/0")
        if len(self.tables) != self.num_tables:
            raise kaitaistruct.ConsistencyError(u"tables", self.num_tables, len(self.tables))
        for i in range(len(self.tables)):
            pass
            if self.tables[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"tables", self._root, self.tables[i]._root)
            if self.tables[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"tables", self, self.tables[i]._parent)

        self._dirty = False

    class Format(ReadWriteKaitaiStruct):
        """Table format specifier, always 4 bytes. Original implementation treats
        it as always little-endian and makes liberal use of bitmasking to parse
        various parts of it.
        
        TODO: this format specification recognizes endianness and bit
        order format bits, but it does not really takes any parsing
        decisions based on them.
        
        .. seealso::
           Source - https://fontforge.org/docs/techref/pcf-format.html#file-header
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PcfFont.Format, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.padding1 = self._io.read_bits_int_be(2)
            self.scan_unit_mask = self._io.read_bits_int_be(2)
            self.is_most_significant_bit_first = self._io.read_bits_int_be(1) != 0
            self.is_big_endian = self._io.read_bits_int_be(1) != 0
            self.glyph_pad_mask = self._io.read_bits_int_be(2)
            self.format = self._io.read_u1()
            self.padding = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PcfFont.Format, self)._write__seq(io)
            self._io.write_bits_int_be(2, self.padding1)
            self._io.write_bits_int_be(2, self.scan_unit_mask)
            self._io.write_bits_int_be(1, int(self.is_most_significant_bit_first))
            self._io.write_bits_int_be(1, int(self.is_big_endian))
            self._io.write_bits_int_be(2, self.glyph_pad_mask)
            self._io.write_u1(self.format)
            self._io.write_u2le(self.padding)


        def _check(self):
            self._dirty = False


    class Table(ReadWriteKaitaiStruct):
        """Table offers a offset + length pointer to a particular
        table. "Type" of table references certain enum. Applications can
        ignore enum values which they don't support.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PcfFont.Table, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.type = KaitaiStream.resolve_enum(PcfFont.Types, self._io.read_u4le())
            self.format = PcfFont.Format(self._io, self, self._root)
            self.format._read()
            self.len_body = self._io.read_u4le()
            self.ofs_body = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.format._fetch_instances()
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                _on = self.type
                if _on == PcfFont.Types.bdf_encodings:
                    pass
                    self._m_body._fetch_instances()
                elif _on == PcfFont.Types.bitmaps:
                    pass
                    self._m_body._fetch_instances()
                elif _on == PcfFont.Types.glyph_names:
                    pass
                    self._m_body._fetch_instances()
                elif _on == PcfFont.Types.properties:
                    pass
                    self._m_body._fetch_instances()
                elif _on == PcfFont.Types.swidths:
                    pass
                    self._m_body._fetch_instances()
                else:
                    pass



        def _write__seq(self, io=None):
            super(PcfFont.Table, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4le(int(self.type))
            self.format._write__seq(self._io)
            self._io.write_u4le(self.len_body)
            self._io.write_u4le(self.ofs_body)


        def _check(self):
            if self.format._root != self._root:
                raise kaitaistruct.ConsistencyError(u"format", self._root, self.format._root)
            if self.format._parent != self:
                raise kaitaistruct.ConsistencyError(u"format", self, self.format._parent)
            if self.body__enabled:
                pass
                _on = self.type
                if _on == PcfFont.Types.bdf_encodings:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                elif _on == PcfFont.Types.bitmaps:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                elif _on == PcfFont.Types.glyph_names:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                elif _on == PcfFont.Types.properties:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                elif _on == PcfFont.Types.swidths:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                else:
                    pass
                    if len(self._m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self._m_body))

            self._dirty = False

        class BdfEncodings(ReadWriteKaitaiStruct):
            """Table that allows mapping of character codes to glyphs present in the
            font. Supports 1-byte and 2-byte character codes.
            
            Note that this mapping is agnostic to character encoding itself - it
            can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
            national encodings, etc. If application cares about it, normally
            encoding will be specified in `properties` table, in the properties named
            `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PcfFont.Table.BdfEncodings, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.format._read()
                self.min_char_or_byte2 = self._io.read_u2le()
                self.max_char_or_byte2 = self._io.read_u2le()
                self.min_byte1 = self._io.read_u2le()
                self.max_byte1 = self._io.read_u2le()
                self.default_char = self._io.read_u2le()
                self.glyph_indexes = []
                for i in range(((self.max_char_or_byte2 - self.min_char_or_byte2) + 1) * ((self.max_byte1 - self.min_byte1) + 1)):
                    self.glyph_indexes.append(self._io.read_u2le())

                self._dirty = False


            def _fetch_instances(self):
                pass
                self.format._fetch_instances()
                for i in range(len(self.glyph_indexes)):
                    pass



            def _write__seq(self, io=None):
                super(PcfFont.Table.BdfEncodings, self)._write__seq(io)
                self.format._write__seq(self._io)
                self._io.write_u2le(self.min_char_or_byte2)
                self._io.write_u2le(self.max_char_or_byte2)
                self._io.write_u2le(self.min_byte1)
                self._io.write_u2le(self.max_byte1)
                self._io.write_u2le(self.default_char)
                for i in range(len(self.glyph_indexes)):
                    pass
                    self._io.write_u2le(self.glyph_indexes[i])



            def _check(self):
                if self.format._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"format", self._root, self.format._root)
                if self.format._parent != self:
                    raise kaitaistruct.ConsistencyError(u"format", self, self.format._parent)
                if len(self.glyph_indexes) != ((self.max_char_or_byte2 - self.min_char_or_byte2) + 1) * ((self.max_byte1 - self.min_byte1) + 1):
                    raise kaitaistruct.ConsistencyError(u"glyph_indexes", ((self.max_char_or_byte2 - self.min_char_or_byte2) + 1) * ((self.max_byte1 - self.min_byte1) + 1), len(self.glyph_indexes))
                for i in range(len(self.glyph_indexes)):
                    pass

                self._dirty = False


        class Bitmaps(ReadWriteKaitaiStruct):
            """Table containing uncompressed glyph bitmaps.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PcfFont.Table.Bitmaps, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.format._read()
                self.num_glyphs = self._io.read_u4le()
                self.offsets = []
                for i in range(self.num_glyphs):
                    self.offsets.append(self._io.read_u4le())

                self.bitmap_sizes = []
                for i in range(4):
                    self.bitmap_sizes.append(self._io.read_u4le())

                self._dirty = False


            def _fetch_instances(self):
                pass
                self.format._fetch_instances()
                for i in range(len(self.offsets)):
                    pass

                for i in range(len(self.bitmap_sizes)):
                    pass



            def _write__seq(self, io=None):
                super(PcfFont.Table.Bitmaps, self)._write__seq(io)
                self.format._write__seq(self._io)
                self._io.write_u4le(self.num_glyphs)
                for i in range(len(self.offsets)):
                    pass
                    self._io.write_u4le(self.offsets[i])

                for i in range(len(self.bitmap_sizes)):
                    pass
                    self._io.write_u4le(self.bitmap_sizes[i])



            def _check(self):
                if self.format._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"format", self._root, self.format._root)
                if self.format._parent != self:
                    raise kaitaistruct.ConsistencyError(u"format", self, self.format._parent)
                if len(self.offsets) != self.num_glyphs:
                    raise kaitaistruct.ConsistencyError(u"offsets", self.num_glyphs, len(self.offsets))
                for i in range(len(self.offsets)):
                    pass

                if len(self.bitmap_sizes) != 4:
                    raise kaitaistruct.ConsistencyError(u"bitmap_sizes", 4, len(self.bitmap_sizes))
                for i in range(len(self.bitmap_sizes)):
                    pass

                self._dirty = False


        class GlyphNames(ReadWriteKaitaiStruct):
            """Table containing character names for every glyph.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PcfFont.Table.GlyphNames, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.format._read()
                self.num_glyphs = self._io.read_u4le()
                self.names = []
                for i in range(self.num_glyphs):
                    _t_names = PcfFont.Table.GlyphNames.StringRef(self._io, self, self._root)
                    try:
                        _t_names._read()
                    finally:
                        self.names.append(_t_names)

                self.len_strings = self._io.read_u4le()
                self._raw_strings = self._io.read_bytes(self.len_strings)
                _io__raw_strings = KaitaiStream(BytesIO(self._raw_strings))
                self.strings = bytes_with_io.BytesWithIo(_io__raw_strings)
                self.strings._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.format._fetch_instances()
                for i in range(len(self.names)):
                    pass
                    self.names[i]._fetch_instances()

                self.strings._fetch_instances()


            def _write__seq(self, io=None):
                super(PcfFont.Table.GlyphNames, self)._write__seq(io)
                self.format._write__seq(self._io)
                self._io.write_u4le(self.num_glyphs)
                for i in range(len(self.names)):
                    pass
                    self.names[i]._write__seq(self._io)

                self._io.write_u4le(self.len_strings)
                _io__raw_strings = KaitaiStream(BytesIO(bytearray(self.len_strings)))
                self._io.add_child_stream(_io__raw_strings)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_strings))
                def handler(parent, _io__raw_strings=_io__raw_strings):
                    self._raw_strings = _io__raw_strings.to_byte_array()
                    if len(self._raw_strings) != self.len_strings:
                        raise kaitaistruct.ConsistencyError(u"raw(strings)", self.len_strings, len(self._raw_strings))
                    parent.write_bytes(self._raw_strings)
                _io__raw_strings.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.strings._write__seq(_io__raw_strings)


            def _check(self):
                if self.format._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"format", self._root, self.format._root)
                if self.format._parent != self:
                    raise kaitaistruct.ConsistencyError(u"format", self, self.format._parent)
                if len(self.names) != self.num_glyphs:
                    raise kaitaistruct.ConsistencyError(u"names", self.num_glyphs, len(self.names))
                for i in range(len(self.names)):
                    pass
                    if self.names[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"names", self._root, self.names[i]._root)
                    if self.names[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"names", self, self.names[i]._parent)

                self._dirty = False

            class StringRef(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(PcfFont.Table.GlyphNames.StringRef, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._should_write_value = False
                    self.value__enabled = True

                def _read(self):
                    self.ofs_string = self._io.read_u4le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _ = self.value
                    if hasattr(self, '_m_value'):
                        pass



                def _write__seq(self, io=None):
                    super(PcfFont.Table.GlyphNames.StringRef, self)._write__seq(io)
                    self._should_write_value = self.value__enabled
                    self._io.write_u4le(self.ofs_string)


                def _check(self):
                    if self.value__enabled:
                        pass
                        if KaitaiStream.byte_array_index_of((self._m_value).encode(u"UTF-8"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"value", -1, KaitaiStream.byte_array_index_of((self._m_value).encode(u"UTF-8"), 0))

                    self._dirty = False

                @property
                def value(self):
                    if self._should_write_value:
                        self._write_value()
                    if hasattr(self, '_m_value'):
                        return self._m_value

                    if not self.value__enabled:
                        return None

                    io = self._parent.strings._io
                    _pos = io.pos()
                    io.seek(self.ofs_string)
                    self._m_value = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                    io.seek(_pos)
                    return getattr(self, '_m_value', None)

                @value.setter
                def value(self, v):
                    self._dirty = True
                    self._m_value = v

                def _write_value(self):
                    self._should_write_value = False
                    io = self._parent.strings._io
                    _pos = io.pos()
                    io.seek(self.ofs_string)
                    io.write_bytes((self._m_value).encode(u"UTF-8"))
                    io.write_u1(0)
                    io.seek(_pos)



        class Properties(ReadWriteKaitaiStruct):
            """Array of properties (key-value pairs), used to convey different X11
            settings of a font. Key is always an X font atom.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#properties-table
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PcfFont.Table.Properties, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.format._read()
                self.num_props = self._io.read_u4le()
                self.props = []
                for i in range(self.num_props):
                    _t_props = PcfFont.Table.Properties.Prop(self._io, self, self._root)
                    try:
                        _t_props._read()
                    finally:
                        self.props.append(_t_props)

                self.padding = self._io.read_bytes((0 if self.num_props & 3 == 0 else 4 - (self.num_props & 3)))
                self.len_strings = self._io.read_u4le()
                self._raw_strings = self._io.read_bytes(self.len_strings)
                _io__raw_strings = KaitaiStream(BytesIO(self._raw_strings))
                self.strings = bytes_with_io.BytesWithIo(_io__raw_strings)
                self.strings._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.format._fetch_instances()
                for i in range(len(self.props)):
                    pass
                    self.props[i]._fetch_instances()

                self.strings._fetch_instances()


            def _write__seq(self, io=None):
                super(PcfFont.Table.Properties, self)._write__seq(io)
                self.format._write__seq(self._io)
                self._io.write_u4le(self.num_props)
                for i in range(len(self.props)):
                    pass
                    self.props[i]._write__seq(self._io)

                self._io.write_bytes(self.padding)
                self._io.write_u4le(self.len_strings)
                _io__raw_strings = KaitaiStream(BytesIO(bytearray(self.len_strings)))
                self._io.add_child_stream(_io__raw_strings)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_strings))
                def handler(parent, _io__raw_strings=_io__raw_strings):
                    self._raw_strings = _io__raw_strings.to_byte_array()
                    if len(self._raw_strings) != self.len_strings:
                        raise kaitaistruct.ConsistencyError(u"raw(strings)", self.len_strings, len(self._raw_strings))
                    parent.write_bytes(self._raw_strings)
                _io__raw_strings.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.strings._write__seq(_io__raw_strings)


            def _check(self):
                if self.format._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"format", self._root, self.format._root)
                if self.format._parent != self:
                    raise kaitaistruct.ConsistencyError(u"format", self, self.format._parent)
                if len(self.props) != self.num_props:
                    raise kaitaistruct.ConsistencyError(u"props", self.num_props, len(self.props))
                for i in range(len(self.props)):
                    pass
                    if self.props[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"props", self._root, self.props[i]._root)
                    if self.props[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"props", self, self.props[i]._parent)

                if len(self.padding) != (0 if self.num_props & 3 == 0 else 4 - (self.num_props & 3)):
                    raise kaitaistruct.ConsistencyError(u"padding", (0 if self.num_props & 3 == 0 else 4 - (self.num_props & 3)), len(self.padding))
                self._dirty = False

            class Prop(ReadWriteKaitaiStruct):
                """Property is a key-value pair, "key" being always a
                string and "value" being either a string or a 32-bit
                integer based on an additinal flag (`is_string`).
                
                Simple offset-based mechanism is employed to keep this
                type's sequence fixed-sized and thus have simple access
                to property key/value by index.
                """
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(PcfFont.Table.Properties.Prop, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._should_write_name = False
                    self.name__enabled = True
                    self._should_write_str_value = False
                    self.str_value__enabled = True

                def _read(self):
                    self.ofs_name = self._io.read_u4le()
                    self.is_string = self._io.read_u1()
                    self.value_or_ofs_value = self._io.read_u4le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _ = self.name
                    if hasattr(self, '_m_name'):
                        pass

                    _ = self.str_value
                    if hasattr(self, '_m_str_value'):
                        pass



                def _write__seq(self, io=None):
                    super(PcfFont.Table.Properties.Prop, self)._write__seq(io)
                    self._should_write_name = self.name__enabled
                    self._should_write_str_value = self.str_value__enabled
                    self._io.write_u4le(self.ofs_name)
                    self._io.write_u1(self.is_string)
                    self._io.write_u4le(self.value_or_ofs_value)


                def _check(self):
                    if self.name__enabled:
                        pass
                        if KaitaiStream.byte_array_index_of((self._m_name).encode(u"UTF-8"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self._m_name).encode(u"UTF-8"), 0))

                    if self.str_value__enabled:
                        pass
                        if self.is_string != 0:
                            pass
                            if KaitaiStream.byte_array_index_of((self._m_str_value).encode(u"UTF-8"), 0) != -1:
                                raise kaitaistruct.ConsistencyError(u"str_value", -1, KaitaiStream.byte_array_index_of((self._m_str_value).encode(u"UTF-8"), 0))


                    self._dirty = False

                @property
                def int_value(self):
                    """Value of the property, if this is an integer value.
                    """
                    if hasattr(self, '_m_int_value'):
                        return self._m_int_value

                    if self.is_string == 0:
                        pass
                        self._m_int_value = self.value_or_ofs_value

                    return getattr(self, '_m_int_value', None)

                def _invalidate_int_value(self):
                    del self._m_int_value
                @property
                def name(self):
                    """Name of the property addressed in the strings buffer.
                    """
                    if self._should_write_name:
                        self._write_name()
                    if hasattr(self, '_m_name'):
                        return self._m_name

                    if not self.name__enabled:
                        return None

                    io = self._parent.strings._io
                    _pos = io.pos()
                    io.seek(self.ofs_name)
                    self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                    io.seek(_pos)
                    return getattr(self, '_m_name', None)

                @name.setter
                def name(self, v):
                    self._dirty = True
                    self._m_name = v

                def _write_name(self):
                    self._should_write_name = False
                    io = self._parent.strings._io
                    _pos = io.pos()
                    io.seek(self.ofs_name)
                    io.write_bytes((self._m_name).encode(u"UTF-8"))
                    io.write_u1(0)
                    io.seek(_pos)

                @property
                def str_value(self):
                    """Value of the property addressed in the strings
                    buffer, if this is a string value.
                    """
                    if self._should_write_str_value:
                        self._write_str_value()
                    if hasattr(self, '_m_str_value'):
                        return self._m_str_value

                    if not self.str_value__enabled:
                        return None

                    if self.is_string != 0:
                        pass
                        io = self._parent.strings._io
                        _pos = io.pos()
                        io.seek(self.value_or_ofs_value)
                        self._m_str_value = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                        io.seek(_pos)

                    return getattr(self, '_m_str_value', None)

                @str_value.setter
                def str_value(self, v):
                    self._dirty = True
                    self._m_str_value = v

                def _write_str_value(self):
                    self._should_write_str_value = False
                    if self.is_string != 0:
                        pass
                        io = self._parent.strings._io
                        _pos = io.pos()
                        io.seek(self.value_or_ofs_value)
                        io.write_bytes((self._m_str_value).encode(u"UTF-8"))
                        io.write_u1(0)
                        io.seek(_pos)




        class Swidths(ReadWriteKaitaiStruct):
            """Table containing scalable widths of characters.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PcfFont.Table.Swidths, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.format._read()
                self.num_glyphs = self._io.read_u4le()
                self.swidths = []
                for i in range(self.num_glyphs):
                    self.swidths.append(self._io.read_u4le())

                self._dirty = False


            def _fetch_instances(self):
                pass
                self.format._fetch_instances()
                for i in range(len(self.swidths)):
                    pass



            def _write__seq(self, io=None):
                super(PcfFont.Table.Swidths, self)._write__seq(io)
                self.format._write__seq(self._io)
                self._io.write_u4le(self.num_glyphs)
                for i in range(len(self.swidths)):
                    pass
                    self._io.write_u4le(self.swidths[i])



            def _check(self):
                if self.format._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"format", self._root, self.format._root)
                if self.format._parent != self:
                    raise kaitaistruct.ConsistencyError(u"format", self, self.format._parent)
                if len(self.swidths) != self.num_glyphs:
                    raise kaitaistruct.ConsistencyError(u"swidths", self.num_glyphs, len(self.swidths))
                for i in range(len(self.swidths)):
                    pass

                self._dirty = False


        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_body)
            _on = self.type
            if _on == PcfFont.Types.bdf_encodings:
                pass
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.BdfEncodings(_io__raw__m_body, self, self._root)
                self._m_body._read()
            elif _on == PcfFont.Types.bitmaps:
                pass
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.Bitmaps(_io__raw__m_body, self, self._root)
                self._m_body._read()
            elif _on == PcfFont.Types.glyph_names:
                pass
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.GlyphNames(_io__raw__m_body, self, self._root)
                self._m_body._read()
            elif _on == PcfFont.Types.properties:
                pass
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.Properties(_io__raw__m_body, self, self._root)
                self._m_body._read()
            elif _on == PcfFont.Types.swidths:
                pass
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.Swidths(_io__raw__m_body, self, self._root)
                self._m_body._read()
            else:
                pass
                self._m_body = self._io.read_bytes(self.len_body)
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_body)
            _on = self.type
            if _on == PcfFont.Types.bdf_encodings:
                pass
                _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw__m_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw__m_body=_io__raw__m_body):
                    self._raw__m_body = _io__raw__m_body.to_byte_array()
                    if len(self._raw__m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                    parent.write_bytes(self._raw__m_body)
                _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_body._write__seq(_io__raw__m_body)
            elif _on == PcfFont.Types.bitmaps:
                pass
                _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw__m_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw__m_body=_io__raw__m_body):
                    self._raw__m_body = _io__raw__m_body.to_byte_array()
                    if len(self._raw__m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                    parent.write_bytes(self._raw__m_body)
                _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_body._write__seq(_io__raw__m_body)
            elif _on == PcfFont.Types.glyph_names:
                pass
                _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw__m_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw__m_body=_io__raw__m_body):
                    self._raw__m_body = _io__raw__m_body.to_byte_array()
                    if len(self._raw__m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                    parent.write_bytes(self._raw__m_body)
                _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_body._write__seq(_io__raw__m_body)
            elif _on == PcfFont.Types.properties:
                pass
                _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw__m_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw__m_body=_io__raw__m_body):
                    self._raw__m_body = _io__raw__m_body.to_byte_array()
                    if len(self._raw__m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                    parent.write_bytes(self._raw__m_body)
                _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_body._write__seq(_io__raw__m_body)
            elif _on == PcfFont.Types.swidths:
                pass
                _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw__m_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw__m_body=_io__raw__m_body):
                    self._raw__m_body = _io__raw__m_body.to_byte_array()
                    if len(self._raw__m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                    parent.write_bytes(self._raw__m_body)
                _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_body._write__seq(_io__raw__m_body)
            else:
                pass
                self._io.write_bytes(self._m_body)
            self._io.seek(_pos)



