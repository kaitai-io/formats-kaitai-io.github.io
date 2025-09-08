# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ines(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://www.nesdev.org/wiki/INES
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Ines, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self._raw_header = self._io.read_bytes(16)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = Ines.Header(_io__raw_header, self, self._root)
        self.header._read()
        if self.header.f6.trainer:
            pass
            self.trainer = self._io.read_bytes(512)

        self.prg_rom = self._io.read_bytes(self.header.len_prg_rom * 16384)
        self.chr_rom = self._io.read_bytes(self.header.len_chr_rom * 8192)
        if self.header.f7.playchoice10:
            pass
            self.playchoice10 = Ines.Playchoice10(self._io, self, self._root)
            self.playchoice10._read()

        if (not (self._io.is_eof())):
            pass
            self.title = (self._io.read_bytes_full()).decode(u"ASCII")

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        if self.header.f6.trainer:
            pass

        if self.header.f7.playchoice10:
            pass
            self.playchoice10._fetch_instances()

        if (not (self._io.is_eof())):
            pass



    def _write__seq(self, io=None):
        super(Ines, self)._write__seq(io)
        _io__raw_header = KaitaiStream(BytesIO(bytearray(16)))
        self._io.add_child_stream(_io__raw_header)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (16))
        def handler(parent, _io__raw_header=_io__raw_header):
            self._raw_header = _io__raw_header.to_byte_array()
            if len(self._raw_header) != 16:
                raise kaitaistruct.ConsistencyError(u"raw(header)", 16, len(self._raw_header))
            parent.write_bytes(self._raw_header)
        _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.header._write__seq(_io__raw_header)
        if self.header.f6.trainer:
            pass
            self._io.write_bytes(self.trainer)

        self._io.write_bytes(self.prg_rom)
        self._io.write_bytes(self.chr_rom)
        if self.header.f7.playchoice10:
            pass
            self.playchoice10._write__seq(self._io)

        if (not (self._io.is_eof())):
            pass
            self._io.write_bytes((self.title).encode(u"ASCII"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"title", 0, self._io.size() - self._io.pos())



    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.header.f6.trainer:
            pass
            if len(self.trainer) != 512:
                raise kaitaistruct.ConsistencyError(u"trainer", 512, len(self.trainer))

        if len(self.prg_rom) != self.header.len_prg_rom * 16384:
            raise kaitaistruct.ConsistencyError(u"prg_rom", self.header.len_prg_rom * 16384, len(self.prg_rom))
        if len(self.chr_rom) != self.header.len_chr_rom * 8192:
            raise kaitaistruct.ConsistencyError(u"chr_rom", self.header.len_chr_rom * 8192, len(self.chr_rom))
        if self.header.f7.playchoice10:
            pass
            if self.playchoice10._root != self._root:
                raise kaitaistruct.ConsistencyError(u"playchoice10", self._root, self.playchoice10._root)
            if self.playchoice10._parent != self:
                raise kaitaistruct.ConsistencyError(u"playchoice10", self, self.playchoice10._parent)

        self._dirty = False

    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ines.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x4E\x45\x53\x1A":
                raise kaitaistruct.ValidationNotEqualError(b"\x4E\x45\x53\x1A", self.magic, self._io, u"/types/header/seq/0")
            self.len_prg_rom = self._io.read_u1()
            self.len_chr_rom = self._io.read_u1()
            self._raw_f6 = self._io.read_bytes(1)
            _io__raw_f6 = KaitaiStream(BytesIO(self._raw_f6))
            self.f6 = Ines.Header.F6(_io__raw_f6, self, self._root)
            self.f6._read()
            self._raw_f7 = self._io.read_bytes(1)
            _io__raw_f7 = KaitaiStream(BytesIO(self._raw_f7))
            self.f7 = Ines.Header.F7(_io__raw_f7, self, self._root)
            self.f7._read()
            self.len_prg_ram = self._io.read_u1()
            self._raw_f9 = self._io.read_bytes(1)
            _io__raw_f9 = KaitaiStream(BytesIO(self._raw_f9))
            self.f9 = Ines.Header.F9(_io__raw_f9, self, self._root)
            self.f9._read()
            self._raw_f10 = self._io.read_bytes(1)
            _io__raw_f10 = KaitaiStream(BytesIO(self._raw_f10))
            self.f10 = Ines.Header.F10(_io__raw_f10, self, self._root)
            self.f10._read()
            self.reserved = self._io.read_bytes(5)
            if not self.reserved == b"\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00", self.reserved, self._io, u"/types/header/seq/8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.f6._fetch_instances()
            self.f7._fetch_instances()
            self.f9._fetch_instances()
            self.f10._fetch_instances()


        def _write__seq(self, io=None):
            super(Ines.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u1(self.len_prg_rom)
            self._io.write_u1(self.len_chr_rom)
            _io__raw_f6 = KaitaiStream(BytesIO(bytearray(1)))
            self._io.add_child_stream(_io__raw_f6)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (1))
            def handler(parent, _io__raw_f6=_io__raw_f6):
                self._raw_f6 = _io__raw_f6.to_byte_array()
                if len(self._raw_f6) != 1:
                    raise kaitaistruct.ConsistencyError(u"raw(f6)", 1, len(self._raw_f6))
                parent.write_bytes(self._raw_f6)
            _io__raw_f6.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.f6._write__seq(_io__raw_f6)
            _io__raw_f7 = KaitaiStream(BytesIO(bytearray(1)))
            self._io.add_child_stream(_io__raw_f7)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (1))
            def handler(parent, _io__raw_f7=_io__raw_f7):
                self._raw_f7 = _io__raw_f7.to_byte_array()
                if len(self._raw_f7) != 1:
                    raise kaitaistruct.ConsistencyError(u"raw(f7)", 1, len(self._raw_f7))
                parent.write_bytes(self._raw_f7)
            _io__raw_f7.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.f7._write__seq(_io__raw_f7)
            self._io.write_u1(self.len_prg_ram)
            _io__raw_f9 = KaitaiStream(BytesIO(bytearray(1)))
            self._io.add_child_stream(_io__raw_f9)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (1))
            def handler(parent, _io__raw_f9=_io__raw_f9):
                self._raw_f9 = _io__raw_f9.to_byte_array()
                if len(self._raw_f9) != 1:
                    raise kaitaistruct.ConsistencyError(u"raw(f9)", 1, len(self._raw_f9))
                parent.write_bytes(self._raw_f9)
            _io__raw_f9.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.f9._write__seq(_io__raw_f9)
            _io__raw_f10 = KaitaiStream(BytesIO(bytearray(1)))
            self._io.add_child_stream(_io__raw_f10)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (1))
            def handler(parent, _io__raw_f10=_io__raw_f10):
                self._raw_f10 = _io__raw_f10.to_byte_array()
                if len(self._raw_f10) != 1:
                    raise kaitaistruct.ConsistencyError(u"raw(f10)", 1, len(self._raw_f10))
                parent.write_bytes(self._raw_f10)
            _io__raw_f10.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.f10._write__seq(_io__raw_f10)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x4E\x45\x53\x1A":
                raise kaitaistruct.ValidationNotEqualError(b"\x4E\x45\x53\x1A", self.magic, None, u"/types/header/seq/0")
            if self.f6._root != self._root:
                raise kaitaistruct.ConsistencyError(u"f6", self._root, self.f6._root)
            if self.f6._parent != self:
                raise kaitaistruct.ConsistencyError(u"f6", self, self.f6._parent)
            if self.f7._root != self._root:
                raise kaitaistruct.ConsistencyError(u"f7", self._root, self.f7._root)
            if self.f7._parent != self:
                raise kaitaistruct.ConsistencyError(u"f7", self, self.f7._parent)
            if self.f9._root != self._root:
                raise kaitaistruct.ConsistencyError(u"f9", self._root, self.f9._root)
            if self.f9._parent != self:
                raise kaitaistruct.ConsistencyError(u"f9", self, self.f9._parent)
            if self.f10._root != self._root:
                raise kaitaistruct.ConsistencyError(u"f10", self._root, self.f10._root)
            if self.f10._parent != self:
                raise kaitaistruct.ConsistencyError(u"f10", self, self.f10._parent)
            if len(self.reserved) != 5:
                raise kaitaistruct.ConsistencyError(u"reserved", 5, len(self.reserved))
            if not self.reserved == b"\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00", self.reserved, None, u"/types/header/seq/8")
            self._dirty = False

        class F10(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://www.nesdev.org/wiki/INES#Flags_10
            """

            class TvSystem(IntEnum):
                ntsc = 0
                dual1 = 1
                pal = 2
                dual2 = 3
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ines.Header.F10, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved1 = self._io.read_bits_int_be(2)
                self.bus_conflict = self._io.read_bits_int_be(1) != 0
                self.prg_ram = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(2)
                self.tv_system = KaitaiStream.resolve_enum(Ines.Header.F10.TvSystem, self._io.read_bits_int_be(2))
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Ines.Header.F10, self)._write__seq(io)
                self._io.write_bits_int_be(2, self.reserved1)
                self._io.write_bits_int_be(1, int(self.bus_conflict))
                self._io.write_bits_int_be(1, int(self.prg_ram))
                self._io.write_bits_int_be(2, self.reserved2)
                self._io.write_bits_int_be(2, int(self.tv_system))


            def _check(self):
                self._dirty = False


        class F6(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://www.nesdev.org/wiki/INES#Flags_6
            """

            class Mirroring(IntEnum):
                horizontal = 0
                vertical = 1
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ines.Header.F6, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.lower_mapper = self._io.read_bits_int_be(4)
                self.four_screen = self._io.read_bits_int_be(1) != 0
                self.trainer = self._io.read_bits_int_be(1) != 0
                self.has_battery_ram = self._io.read_bits_int_be(1) != 0
                self.mirroring = KaitaiStream.resolve_enum(Ines.Header.F6.Mirroring, self._io.read_bits_int_be(1))
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Ines.Header.F6, self)._write__seq(io)
                self._io.write_bits_int_be(4, self.lower_mapper)
                self._io.write_bits_int_be(1, int(self.four_screen))
                self._io.write_bits_int_be(1, int(self.trainer))
                self._io.write_bits_int_be(1, int(self.has_battery_ram))
                self._io.write_bits_int_be(1, int(self.mirroring))


            def _check(self):
                self._dirty = False


        class F7(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://www.nesdev.org/wiki/INES#Flags_7
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ines.Header.F7, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.upper_mapper = self._io.read_bits_int_be(4)
                self.format = self._io.read_bits_int_be(2)
                self.playchoice10 = self._io.read_bits_int_be(1) != 0
                self.vs_unisystem = self._io.read_bits_int_be(1) != 0
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Ines.Header.F7, self)._write__seq(io)
                self._io.write_bits_int_be(4, self.upper_mapper)
                self._io.write_bits_int_be(2, self.format)
                self._io.write_bits_int_be(1, int(self.playchoice10))
                self._io.write_bits_int_be(1, int(self.vs_unisystem))


            def _check(self):
                self._dirty = False


        class F9(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://www.nesdev.org/wiki/INES#Flags_9
            """

            class TvSystem(IntEnum):
                ntsc = 0
                pal = 1
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ines.Header.F9, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_bits_int_be(7)
                self.tv_system = KaitaiStream.resolve_enum(Ines.Header.F9.TvSystem, self._io.read_bits_int_be(1))
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Ines.Header.F9, self)._write__seq(io)
                self._io.write_bits_int_be(7, self.reserved)
                self._io.write_bits_int_be(1, int(self.tv_system))


            def _check(self):
                self._dirty = False


        @property
        def mapper(self):
            """
            .. seealso::
               Source - https://www.nesdev.org/wiki/Mapper
            """
            if hasattr(self, '_m_mapper'):
                return self._m_mapper

            self._m_mapper = self.f6.lower_mapper | self.f7.upper_mapper << 4
            return getattr(self, '_m_mapper', None)

        def _invalidate_mapper(self):
            del self._m_mapper

    class Playchoice10(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.nesdev.org/wiki/PC10_ROM-Images
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ines.Playchoice10, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.inst_rom = self._io.read_bytes(8192)
            self.prom = Ines.Playchoice10.Prom(self._io, self, self._root)
            self.prom._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.prom._fetch_instances()


        def _write__seq(self, io=None):
            super(Ines.Playchoice10, self)._write__seq(io)
            self._io.write_bytes(self.inst_rom)
            self.prom._write__seq(self._io)


        def _check(self):
            if len(self.inst_rom) != 8192:
                raise kaitaistruct.ConsistencyError(u"inst_rom", 8192, len(self.inst_rom))
            if self.prom._root != self._root:
                raise kaitaistruct.ConsistencyError(u"prom", self._root, self.prom._root)
            if self.prom._parent != self:
                raise kaitaistruct.ConsistencyError(u"prom", self, self.prom._parent)
            self._dirty = False

        class Prom(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ines.Playchoice10.Prom, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.data = self._io.read_bytes(16)
                self.counter_out = self._io.read_bytes(16)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Ines.Playchoice10.Prom, self)._write__seq(io)
                self._io.write_bytes(self.data)
                self._io.write_bytes(self.counter_out)


            def _check(self):
                if len(self.data) != 16:
                    raise kaitaistruct.ConsistencyError(u"data", 16, len(self.data))
                if len(self.counter_out) != 16:
                    raise kaitaistruct.ConsistencyError(u"counter_out", 16, len(self.counter_out))
                self._dirty = False




