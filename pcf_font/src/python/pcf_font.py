# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

import bytes_with_io
class PcfFont(KaitaiStruct):
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

    class Types(Enum):
        properties = 1
        accelerators = 2
        metrics = 4
        bitmaps = 8
        ink_metrics = 16
        bdf_encodings = 32
        swidths = 64
        glyph_names = 128
        bdf_accelerators = 256
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x01\x66\x63\x70":
            raise kaitaistruct.ValidationNotEqualError(b"\x01\x66\x63\x70", self.magic, self._io, u"/seq/0")
        self.num_tables = self._io.read_u4le()
        self.tables = [None] * (self.num_tables)
        for i in range(self.num_tables):
            self.tables[i] = PcfFont.Table(self._io, self, self._root)


    class Table(KaitaiStruct):
        """Table offers a offset + length pointer to a particular
        table. "Type" of table references certain enum. Applications can
        ignore enum values which they don't support.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.type = KaitaiStream.resolve_enum(PcfFont.Types, self._io.read_u4le())
            self.format = PcfFont.Format(self._io, self, self._root)
            self.len_body = self._io.read_u4le()
            self.ofs_body = self._io.read_u4le()

        class Swidths(KaitaiStruct):
            """Table containing scalable widths of characters.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.num_glyphs = self._io.read_u4le()
                self.swidths = [None] * (self.num_glyphs)
                for i in range(self.num_glyphs):
                    self.swidths[i] = self._io.read_u4le()



        class Properties(KaitaiStruct):
            """Array of properties (key-value pairs), used to convey different X11
            settings of a font. Key is always an X font atom.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#properties-table
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.num_props = self._io.read_u4le()
                self.props = [None] * (self.num_props)
                for i in range(self.num_props):
                    self.props[i] = PcfFont.Table.Properties.Prop(self._io, self, self._root)

                self.padding = self._io.read_bytes((0 if (self.num_props & 3) == 0 else (4 - (self.num_props & 3))))
                self.len_strings = self._io.read_u4le()
                self._raw_strings = self._io.read_bytes(self.len_strings)
                _io__raw_strings = KaitaiStream(BytesIO(self._raw_strings))
                self.strings = bytes_with_io.BytesWithIo(_io__raw_strings)

            class Prop(KaitaiStruct):
                """Property is a key-value pair, "key" being always a
                string and "value" being either a string or a 32-bit
                integer based on an additinal flag (`is_string`).
                
                Simple offset-based mechanism is employed to keep this
                type's sequence fixed-sized and thus have simple access
                to property key/value by index.
                """
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.ofs_name = self._io.read_u4le()
                    self.is_string = self._io.read_u1()
                    self.value_or_ofs_value = self._io.read_u4le()

                @property
                def name(self):
                    """Name of the property addressed in the strings buffer.
                    """
                    if hasattr(self, '_m_name'):
                        return self._m_name if hasattr(self, '_m_name') else None

                    io = self._parent.strings._io
                    _pos = io.pos()
                    io.seek(self.ofs_name)
                    self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                    io.seek(_pos)
                    return self._m_name if hasattr(self, '_m_name') else None

                @property
                def str_value(self):
                    """Value of the property addressed in the strings
                    buffer, if this is a string value.
                    """
                    if hasattr(self, '_m_str_value'):
                        return self._m_str_value if hasattr(self, '_m_str_value') else None

                    if self.is_string != 0:
                        io = self._parent.strings._io
                        _pos = io.pos()
                        io.seek(self.value_or_ofs_value)
                        self._m_str_value = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                        io.seek(_pos)

                    return self._m_str_value if hasattr(self, '_m_str_value') else None

                @property
                def int_value(self):
                    """Value of the property, if this is an integer value.
                    """
                    if hasattr(self, '_m_int_value'):
                        return self._m_int_value if hasattr(self, '_m_int_value') else None

                    if self.is_string == 0:
                        self._m_int_value = self.value_or_ofs_value

                    return self._m_int_value if hasattr(self, '_m_int_value') else None



        class BdfEncodings(KaitaiStruct):
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
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.min_char_or_byte2 = self._io.read_u2le()
                self.max_char_or_byte2 = self._io.read_u2le()
                self.min_byte1 = self._io.read_u2le()
                self.max_byte1 = self._io.read_u2le()
                self.default_char = self._io.read_u2le()
                self.glyph_indexes = [None] * ((((self.max_char_or_byte2 - self.min_char_or_byte2) + 1) * ((self.max_byte1 - self.min_byte1) + 1)))
                for i in range((((self.max_char_or_byte2 - self.min_char_or_byte2) + 1) * ((self.max_byte1 - self.min_byte1) + 1))):
                    self.glyph_indexes[i] = self._io.read_u2le()



        class GlyphNames(KaitaiStruct):
            """Table containing character names for every glyph.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.num_glyphs = self._io.read_u4le()
                self.names = [None] * (self.num_glyphs)
                for i in range(self.num_glyphs):
                    self.names[i] = PcfFont.Table.GlyphNames.StringRef(self._io, self, self._root)

                self.len_strings = self._io.read_u4le()
                self._raw_strings = self._io.read_bytes(self.len_strings)
                _io__raw_strings = KaitaiStream(BytesIO(self._raw_strings))
                self.strings = bytes_with_io.BytesWithIo(_io__raw_strings)

            class StringRef(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.ofs_string = self._io.read_u4le()

                @property
                def value(self):
                    if hasattr(self, '_m_value'):
                        return self._m_value if hasattr(self, '_m_value') else None

                    io = self._parent.strings._io
                    _pos = io.pos()
                    io.seek(self.ofs_string)
                    self._m_value = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                    io.seek(_pos)
                    return self._m_value if hasattr(self, '_m_value') else None



        class Bitmaps(KaitaiStruct):
            """Table containing uncompressed glyph bitmaps.
            
            .. seealso::
               Source - https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.format = PcfFont.Format(self._io, self, self._root)
                self.num_glyphs = self._io.read_u4le()
                self.offsets = [None] * (self.num_glyphs)
                for i in range(self.num_glyphs):
                    self.offsets[i] = self._io.read_u4le()

                self.bitmap_sizes = [None] * (4)
                for i in range(4):
                    self.bitmap_sizes[i] = self._io.read_u4le()



        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body if hasattr(self, '_m_body') else None

            _pos = self._io.pos()
            self._io.seek(self.ofs_body)
            _on = self.type
            if _on == PcfFont.Types.properties:
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.Properties(_io__raw__m_body, self, self._root)
            elif _on == PcfFont.Types.bdf_encodings:
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.BdfEncodings(_io__raw__m_body, self, self._root)
            elif _on == PcfFont.Types.swidths:
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.Swidths(_io__raw__m_body, self, self._root)
            elif _on == PcfFont.Types.glyph_names:
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.GlyphNames(_io__raw__m_body, self, self._root)
            elif _on == PcfFont.Types.bitmaps:
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = PcfFont.Table.Bitmaps(_io__raw__m_body, self, self._root)
            else:
                self._m_body = self._io.read_bytes(self.len_body)
            self._io.seek(_pos)
            return self._m_body if hasattr(self, '_m_body') else None


    class Format(KaitaiStruct):
        """Table format specifier, always 4 bytes. Original implementation treats
        it as always little-endian and makes liberal use of bitmasking to parse
        various parts of it.
        
        TODO: this format specification recognizes endianness and bit
        order format bits, but it does not really takes any parsing
        decisions based on them.
        
        .. seealso::
           Source - https://fontforge.org/docs/techref/pcf-format.html#file-header
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.padding1 = self._io.read_bits_int_be(2)
            self.scan_unit_mask = self._io.read_bits_int_be(2)
            self.is_most_significant_bit_first = self._io.read_bits_int_be(1) != 0
            self.is_big_endian = self._io.read_bits_int_be(1) != 0
            self.glyph_pad_mask = self._io.read_bits_int_be(2)
            self._io.align_to_byte()
            self.format = self._io.read_u1()
            self.padding = self._io.read_u2le()



