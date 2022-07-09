# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Grub2Font(KaitaiStruct):
    """Bitmap font format for the GRUB 2 bootloader.
    
    .. seealso::
       Source - https://grub.gibibit.com/New_font_format
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(12)
        if not self.magic == b"\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32":
            raise kaitaistruct.ValidationNotEqualError(b"\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32", self.magic, self._io, u"/seq/0")
        self.sections = []
        i = 0
        while True:
            _ = Grub2Font.Section(self._io, self, self._root)
            self.sections.append(_)
            if _.section_type == u"DATA":
                break
            i += 1

    class PtszSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.font_point_size = self._io.read_u2be()


    class FamiSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.font_family_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


    class WeigSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.font_weight = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


    class MaxwSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.maximum_character_width = self._io.read_u2be()


    class DescSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.descent_in_pixels = self._io.read_u2be()


    class Section(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.section_type = (self._io.read_bytes(4)).decode(u"ASCII")
            self.len_body = self._io.read_u4be()
            if self.section_type != u"DATA":
                _on = self.section_type
                if _on == u"MAXH":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.MaxhSection(_io__raw_body, self, self._root)
                elif _on == u"FAMI":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.FamiSection(_io__raw_body, self, self._root)
                elif _on == u"PTSZ":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.PtszSection(_io__raw_body, self, self._root)
                elif _on == u"MAXW":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.MaxwSection(_io__raw_body, self, self._root)
                elif _on == u"SLAN":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.SlanSection(_io__raw_body, self, self._root)
                elif _on == u"WEIG":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.WeigSection(_io__raw_body, self, self._root)
                elif _on == u"CHIX":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.ChixSection(_io__raw_body, self, self._root)
                elif _on == u"DESC":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.DescSection(_io__raw_body, self, self._root)
                elif _on == u"NAME":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.NameSection(_io__raw_body, self, self._root)
                elif _on == u"ASCE":
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.AsceSection(_io__raw_body, self, self._root)
                else:
                    self.body = self._io.read_bytes(self.len_body)



    class AsceSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.ascent_in_pixels = self._io.read_u2be()


    class ChixSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.characters = []
            i = 0
            while not self._io.is_eof():
                self.characters.append(Grub2Font.ChixSection.Character(self._io, self, self._root))
                i += 1


        class Character(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.code_point = self._io.read_u4be()
                self.flags = self._io.read_u1()
                self.ofs_definition = self._io.read_u4be()

            @property
            def definition(self):
                if hasattr(self, '_m_definition'):
                    return self._m_definition

                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_definition)
                self._m_definition = Grub2Font.ChixSection.CharacterDefinition(io, self, self._root)
                io.seek(_pos)
                return getattr(self, '_m_definition', None)


        class CharacterDefinition(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.width = self._io.read_u2be()
                self.height = self._io.read_u2be()
                self.x_offset = self._io.read_s2be()
                self.y_offset = self._io.read_s2be()
                self.device_width = self._io.read_s2be()
                self.bitmap_data = self._io.read_bytes(((self.width * self.height) + 7) // 8)



    class MaxhSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.maximum_character_height = self._io.read_u2be()


    class NameSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.font_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


    class SlanSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.font_slant = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")



