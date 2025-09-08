# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Grub2Font(ReadWriteKaitaiStruct):
    """Bitmap font format for the GRUB 2 bootloader.
    
    .. seealso::
       Source - https://grub.gibibit.com/New_font_format
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Grub2Font, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(12)
        if not self.magic == b"\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32":
            raise kaitaistruct.ValidationNotEqualError(b"\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32", self.magic, self._io, u"/seq/0")
        self.sections = []
        i = 0
        while True:
            _t_sections = Grub2Font.Section(self._io, self, self._root)
            try:
                _t_sections._read()
            finally:
                _ = _t_sections
                self.sections.append(_)
            if _.section_type == u"DATA":
                break
            i += 1
        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.sections)):
            pass
            self.sections[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Grub2Font, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        for i in range(len(self.sections)):
            pass
            self.sections[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 12:
            raise kaitaistruct.ConsistencyError(u"magic", 12, len(self.magic))
        if not self.magic == b"\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32":
            raise kaitaistruct.ValidationNotEqualError(b"\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32", self.magic, None, u"/seq/0")
        if len(self.sections) == 0:
            raise kaitaistruct.ConsistencyError(u"sections", 0, len(self.sections))
        for i in range(len(self.sections)):
            pass
            if self.sections[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"sections", self._root, self.sections[i]._root)
            if self.sections[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"sections", self, self.sections[i]._parent)
            _ = self.sections[i]
            if (_.section_type == u"DATA") != (i == len(self.sections) - 1):
                raise kaitaistruct.ConsistencyError(u"sections", i == len(self.sections) - 1, _.section_type == u"DATA")

        self._dirty = False

    class AsceSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.AsceSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ascent_in_pixels = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.AsceSection, self)._write__seq(io)
            self._io.write_u2be(self.ascent_in_pixels)


        def _check(self):
            self._dirty = False


    class ChixSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.ChixSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.characters = []
            i = 0
            while not self._io.is_eof():
                _t_characters = Grub2Font.ChixSection.Character(self._io, self, self._root)
                try:
                    _t_characters._read()
                finally:
                    self.characters.append(_t_characters)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.characters)):
                pass
                self.characters[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Grub2Font.ChixSection, self)._write__seq(io)
            for i in range(len(self.characters)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"characters", 0, self._io.size() - self._io.pos())
                self.characters[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"characters", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.characters)):
                pass
                if self.characters[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"characters", self._root, self.characters[i]._root)
                if self.characters[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"characters", self, self.characters[i]._parent)

            self._dirty = False

        class Character(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Grub2Font.ChixSection.Character, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_definition = False
                self.definition__enabled = True

            def _read(self):
                self.code_point = self._io.read_u4be()
                self.flags = self._io.read_u1()
                self.ofs_definition = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.definition
                if hasattr(self, '_m_definition'):
                    pass
                    self._m_definition._fetch_instances()



            def _write__seq(self, io=None):
                super(Grub2Font.ChixSection.Character, self)._write__seq(io)
                self._should_write_definition = self.definition__enabled
                self._io.write_u4be(self.code_point)
                self._io.write_u1(self.flags)
                self._io.write_u4be(self.ofs_definition)


            def _check(self):
                if self.definition__enabled:
                    pass
                    if self._m_definition._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"definition", self._root, self._m_definition._root)
                    if self._m_definition._parent != self:
                        raise kaitaistruct.ConsistencyError(u"definition", self, self._m_definition._parent)

                self._dirty = False

            @property
            def definition(self):
                if self._should_write_definition:
                    self._write_definition()
                if hasattr(self, '_m_definition'):
                    return self._m_definition

                if not self.definition__enabled:
                    return None

                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_definition)
                self._m_definition = Grub2Font.ChixSection.CharacterDefinition(io, self, self._root)
                self._m_definition._read()
                io.seek(_pos)
                return getattr(self, '_m_definition', None)

            @definition.setter
            def definition(self, v):
                self._dirty = True
                self._m_definition = v

            def _write_definition(self):
                self._should_write_definition = False
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_definition)
                self._m_definition._write__seq(io)
                io.seek(_pos)


        class CharacterDefinition(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Grub2Font.ChixSection.CharacterDefinition, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.width = self._io.read_u2be()
                self.height = self._io.read_u2be()
                self.x_offset = self._io.read_s2be()
                self.y_offset = self._io.read_s2be()
                self.device_width = self._io.read_s2be()
                self.bitmap_data = self._io.read_bytes((self.width * self.height + 7) // 8)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Grub2Font.ChixSection.CharacterDefinition, self)._write__seq(io)
                self._io.write_u2be(self.width)
                self._io.write_u2be(self.height)
                self._io.write_s2be(self.x_offset)
                self._io.write_s2be(self.y_offset)
                self._io.write_s2be(self.device_width)
                self._io.write_bytes(self.bitmap_data)


            def _check(self):
                if len(self.bitmap_data) != (self.width * self.height + 7) // 8:
                    raise kaitaistruct.ConsistencyError(u"bitmap_data", (self.width * self.height + 7) // 8, len(self.bitmap_data))
                self._dirty = False



    class DescSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.DescSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.descent_in_pixels = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.DescSection, self)._write__seq(io)
            self._io.write_u2be(self.descent_in_pixels)


        def _check(self):
            self._dirty = False


    class FamiSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.FamiSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.font_family_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.FamiSection, self)._write__seq(io)
            self._io.write_bytes((self.font_family_name).encode(u"ASCII"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.font_family_name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"font_family_name", -1, KaitaiStream.byte_array_index_of((self.font_family_name).encode(u"ASCII"), 0))
            self._dirty = False


    class MaxhSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.MaxhSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.maximum_character_height = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.MaxhSection, self)._write__seq(io)
            self._io.write_u2be(self.maximum_character_height)


        def _check(self):
            self._dirty = False


    class MaxwSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.MaxwSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.maximum_character_width = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.MaxwSection, self)._write__seq(io)
            self._io.write_u2be(self.maximum_character_width)


        def _check(self):
            self._dirty = False


    class NameSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.NameSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.font_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.NameSection, self)._write__seq(io)
            self._io.write_bytes((self.font_name).encode(u"ASCII"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.font_name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"font_name", -1, KaitaiStream.byte_array_index_of((self.font_name).encode(u"ASCII"), 0))
            self._dirty = False


    class PtszSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.PtszSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.font_point_size = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.PtszSection, self)._write__seq(io)
            self._io.write_u2be(self.font_point_size)


        def _check(self):
            self._dirty = False


    class Section(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.Section, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
                    self.body._read()
                elif _on == u"CHIX":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.ChixSection(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == u"DESC":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.DescSection(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == u"FAMI":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.FamiSection(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == u"MAXH":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.MaxhSection(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == u"MAXW":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.MaxwSection(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == u"NAME":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.NameSection(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == u"PTSZ":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.PtszSection(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == u"SLAN":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.SlanSection(_io__raw_body, self, self._root)
                    self.body._read()
                elif _on == u"WEIG":
                    pass
                    self._raw_body = self._io.read_bytes(self.len_body)
                    _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                    self.body = Grub2Font.WeigSection(_io__raw_body, self, self._root)
                    self.body._read()
                else:
                    pass
                    self.body = self._io.read_bytes(self.len_body)

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(Grub2Font.Section, self)._write__seq(io)
            self._io.write_bytes((self.section_type).encode(u"ASCII"))
            self._io.write_u4be(self.len_body)
            if self.section_type != u"DATA":
                pass
                _on = self.section_type
                if _on == u"ASCE":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"CHIX":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"DESC":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"FAMI":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"MAXH":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"MAXW":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"NAME":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"PTSZ":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"SLAN":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                elif _on == u"WEIG":
                    pass
                    _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                    self._io.add_child_stream(_io__raw_body)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_body))
                    def handler(parent, _io__raw_body=_io__raw_body):
                        self._raw_body = _io__raw_body.to_byte_array()
                        if len(self._raw_body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                        parent.write_bytes(self._raw_body)
                    _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.body._write__seq(_io__raw_body)
                else:
                    pass
                    self._io.write_bytes(self.body)



        def _check(self):
            if len((self.section_type).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"section_type", 4, len((self.section_type).encode(u"ASCII")))
            if self.section_type != u"DATA":
                pass
                _on = self.section_type
                if _on == u"ASCE":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"CHIX":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"DESC":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"FAMI":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"MAXH":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"MAXW":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"NAME":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"PTSZ":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"SLAN":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == u"WEIG":
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                else:
                    pass
                    if len(self.body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self.body))

            self._dirty = False


    class SlanSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.SlanSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.font_slant = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.SlanSection, self)._write__seq(io)
            self._io.write_bytes((self.font_slant).encode(u"ASCII"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.font_slant).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"font_slant", -1, KaitaiStream.byte_array_index_of((self.font_slant).encode(u"ASCII"), 0))
            self._dirty = False


    class WeigSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Grub2Font.WeigSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.font_weight = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Grub2Font.WeigSection, self)._write__seq(io)
            self._io.write_bytes((self.font_weight).encode(u"ASCII"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.font_weight).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"font_weight", -1, KaitaiStream.byte_array_index_of((self.font_weight).encode(u"ASCII"), 0))
            self._dirty = False



