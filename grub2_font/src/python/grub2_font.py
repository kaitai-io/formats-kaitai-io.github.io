# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Grub2Font(KaitaiStruct):
    """Bitmap font format for the GRUB 2 bootloader.
    
    .. seealso::
       Source - https://grub.gibibit.com/New_font_format
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(Grub2Font, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
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


    def _fetch_instances(self):
        pass
        for i in range(len(self.sections)):
            pass
            self.sections[i]._fetch_instances()


    class AsceSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.AsceSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ascent_in_pixels = self._io.read_u2be()


        def _fetch_instances(self):
            pass


    class ChixSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.ChixSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.characters = []
            i = 0
            while not self._io.is_eof():
                self.characters.append(Grub2Font.ChixSection.Character(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.characters)):
                pass
                self.characters[i]._fetch_instances()


        class Character(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Grub2Font.ChixSection.Character, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.code_point = self._io.read_u4be()
                self.flags = self._io.read_u1()
                self.ofs_definition = self._io.read_u4be()


            def _fetch_instances(self):
                pass
                _ = self.definition
                if hasattr(self, '_m_definition'):
                    pass
                    self._m_definition._fetch_instances()


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
                super(Grub2Font.ChixSection.CharacterDefinition, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.width = self._io.read_u2be()
                self.height = self._io.read_u2be()
                self.x_offset = self._io.read_s2be()
                self.y_offset = self._io.read_s2be()
                self.device_width = self._io.read_s2be()
                self.bitmap_data = self._io.read_bytes((self.width * self.height + 7) // 8)


            def _fetch_instances(self):
                pass



    class DescSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.DescSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.descent_in_pixels = self._io.read_u2be()


        def _fetch_instances(self):
            pass


    class FamiSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.FamiSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.font_family_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    class MaxhSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.MaxhSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.maximum_character_height = self._io.read_u2be()


        def _fetch_instances(self):
            pass


    class MaxwSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.MaxwSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.maximum_character_width = self._io.read_u2be()


        def _fetch_instances(self):
            pass


    class NameSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.NameSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.font_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    class PtszSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.PtszSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.font_point_size = self._io.read_u2be()


        def _fetch_instances(self):
            pass


    class Section(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.Section, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.section_type = (self._io.read_bytes(4)).decode(u"ASCII")
            self.len_body = self._io.read_u4be()
            if self.section_type != u"DATA":
                pass
                _on = self.section_type
                if _on == u"ASCE":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.AsceSection(_io__raw_body, self, self._root)
                elif _on == u"CHIX":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.ChixSection(_io__raw_body, self, self._root)
                elif _on == u"DESC":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.DescSection(_io__raw_body, self, self._root)
                elif _on == u"FAMI":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.FamiSection(_io__raw_body, self, self._root)
                elif _on == u"MAXH":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.MaxhSection(_io__raw_body, self, self._root)
                elif _on == u"MAXW":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.MaxwSection(_io__raw_body, self, self._root)
                elif _on == u"NAME":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.NameSection(_io__raw_body, self, self._root)
                elif _on == u"PTSZ":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.PtszSection(_io__raw_body, self, self._root)
                elif _on == u"SLAN":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.SlanSection(_io__raw_body, self, self._root)
                elif _on == u"WEIG":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.WeigSection(_io__raw_body, self, self._root)
                else:
                    pass
                    self.body = self._io.read_bytes(self.len_body)



        def _fetch_instances(self):
            pass
            if self.section_type != u"DATA":
                pass
                _on = self.section_type
                if _on == u"ASCE":
                    pass
                    self.body._fetch_instances()
                elif _on == u"CHIX":
                    pass
                    self.body._fetch_instances()
                elif _on == u"DESC":
                    pass
                    self.body._fetch_instances()
                elif _on == u"FAMI":
                    pass
                    self.body._fetch_instances()
                elif _on == u"MAXH":
                    pass
                    self.body._fetch_instances()
                elif _on == u"MAXW":
                    pass
                    self.body._fetch_instances()
                elif _on == u"NAME":
                    pass
                    self.body._fetch_instances()
                elif _on == u"PTSZ":
                    pass
                    self.body._fetch_instances()
                elif _on == u"SLAN":
                    pass
                    self.body._fetch_instances()
                elif _on == u"WEIG":
                    pass
                    self.body._fetch_instances()
                else:
                    pass



    class SlanSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.SlanSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.font_slant = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    class WeigSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Grub2Font.WeigSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.font_weight = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


        def _fetch_instances(self):
            pass



