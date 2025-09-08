# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MicrosoftPe(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://learn.microsoft.com/en-us/windows/win32/debug/pe-format
    """

    class PeFormat(IntEnum):
        rom_image = 263
        pe32 = 267
        pe32_plus = 523
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MicrosoftPe, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_pe = False
        self.pe__enabled = True

    def _read(self):
        self.mz = MicrosoftPe.MzPlaceholder(self._io, self, self._root)
        self.mz._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.mz._fetch_instances()
        _ = self.pe
        if hasattr(self, '_m_pe'):
            pass
            self._m_pe._fetch_instances()



    def _write__seq(self, io=None):
        super(MicrosoftPe, self)._write__seq(io)
        self._should_write_pe = self.pe__enabled
        self.mz._write__seq(self._io)


    def _check(self):
        if self.mz._root != self._root:
            raise kaitaistruct.ConsistencyError(u"mz", self._root, self.mz._root)
        if self.mz._parent != self:
            raise kaitaistruct.ConsistencyError(u"mz", self, self.mz._parent)
        if self.pe__enabled:
            pass
            if self._m_pe._root != self._root:
                raise kaitaistruct.ConsistencyError(u"pe", self._root, self._m_pe._root)
            if self._m_pe._parent != self:
                raise kaitaistruct.ConsistencyError(u"pe", self, self._m_pe._parent)

        self._dirty = False

    class Annoyingstring(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.Annoyingstring, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_name_from_offset = False
            self.name_from_offset__enabled = True
            self._should_write_name_from_short = False
            self.name_from_short__enabled = True
            self._should_write_name_offset = False
            self.name_offset__enabled = True
            self._should_write_name_zeroes = False
            self.name_zeroes__enabled = True

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.name_from_offset
            if hasattr(self, '_m_name_from_offset'):
                pass

            _ = self.name_from_short
            if hasattr(self, '_m_name_from_short'):
                pass

            _ = self.name_offset
            if hasattr(self, '_m_name_offset'):
                pass

            _ = self.name_zeroes
            if hasattr(self, '_m_name_zeroes'):
                pass



        def _write__seq(self, io=None):
            super(MicrosoftPe.Annoyingstring, self)._write__seq(io)
            self._should_write_name_from_offset = self.name_from_offset__enabled
            self._should_write_name_from_short = self.name_from_short__enabled
            self._should_write_name_offset = self.name_offset__enabled
            self._should_write_name_zeroes = self.name_zeroes__enabled


        def _check(self):
            if self.name_from_offset__enabled:
                pass

            if self.name_from_short__enabled:
                pass

            if self.name_offset__enabled:
                pass

            if self.name_zeroes__enabled:
                pass

            self._dirty = False

        @property
        def name(self):
            if hasattr(self, '_m_name'):
                return self._m_name

            self._m_name = (self.name_from_offset if self.name_zeroes == 0 else self.name_from_short)
            return getattr(self, '_m_name', None)

        def _invalidate_name(self):
            del self._m_name
        @property
        def name_from_offset(self):
            if self._should_write_name_from_offset:
                self._write_name_from_offset()
            if hasattr(self, '_m_name_from_offset'):
                return self._m_name_from_offset

            if not self.name_from_offset__enabled:
                return None

            if self.name_zeroes == 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self._parent._parent.symbol_name_table_offset + self.name_offset if self.name_zeroes == 0 else 0))
                self._m_name_from_offset = (io.read_bytes_term(0, False, True, False)).decode(u"ASCII")
                io.seek(_pos)

            return getattr(self, '_m_name_from_offset', None)

        @name_from_offset.setter
        def name_from_offset(self, v):
            self._dirty = True
            self._m_name_from_offset = v

        def _write_name_from_offset(self):
            self._should_write_name_from_offset = False
            if self.name_zeroes == 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self._parent._parent.symbol_name_table_offset + self.name_offset if self.name_zeroes == 0 else 0))
                if KaitaiStream.byte_array_index_of((self._m_name_from_offset).encode(u"ASCII"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name_from_offset", -1, KaitaiStream.byte_array_index_of((self._m_name_from_offset).encode(u"ASCII"), 0))
                io.write_bytes((self._m_name_from_offset).encode(u"ASCII"))
                if not io.is_eof():
                    io.write_u1(0)

                io.seek(_pos)


        @property
        def name_from_short(self):
            if self._should_write_name_from_short:
                self._write_name_from_short()
            if hasattr(self, '_m_name_from_short'):
                return self._m_name_from_short

            if not self.name_from_short__enabled:
                return None

            if self.name_zeroes != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(0)
                self._m_name_from_short = (self._io.read_bytes_term(0, False, True, False)).decode(u"ASCII")
                self._io.seek(_pos)

            return getattr(self, '_m_name_from_short', None)

        @name_from_short.setter
        def name_from_short(self, v):
            self._dirty = True
            self._m_name_from_short = v

        def _write_name_from_short(self):
            self._should_write_name_from_short = False
            if self.name_zeroes != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(0)
                if KaitaiStream.byte_array_index_of((self._m_name_from_short).encode(u"ASCII"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name_from_short", -1, KaitaiStream.byte_array_index_of((self._m_name_from_short).encode(u"ASCII"), 0))
                self._io.write_bytes((self._m_name_from_short).encode(u"ASCII"))
                if not self._io.is_eof():
                    self._io.write_u1(0)

                self._io.seek(_pos)


        @property
        def name_offset(self):
            if self._should_write_name_offset:
                self._write_name_offset()
            if hasattr(self, '_m_name_offset'):
                return self._m_name_offset

            if not self.name_offset__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(4)
            self._m_name_offset = self._io.read_u4le()
            self._io.seek(_pos)
            return getattr(self, '_m_name_offset', None)

        @name_offset.setter
        def name_offset(self, v):
            self._dirty = True
            self._m_name_offset = v

        def _write_name_offset(self):
            self._should_write_name_offset = False
            _pos = self._io.pos()
            self._io.seek(4)
            self._io.write_u4le(self._m_name_offset)
            self._io.seek(_pos)

        @property
        def name_zeroes(self):
            if self._should_write_name_zeroes:
                self._write_name_zeroes()
            if hasattr(self, '_m_name_zeroes'):
                return self._m_name_zeroes

            if not self.name_zeroes__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_name_zeroes = self._io.read_u4le()
            self._io.seek(_pos)
            return getattr(self, '_m_name_zeroes', None)

        @name_zeroes.setter
        def name_zeroes(self, v):
            self._dirty = True
            self._m_name_zeroes = v

        def _write_name_zeroes(self):
            self._should_write_name_zeroes = False
            _pos = self._io.pos()
            self._io.seek(0)
            self._io.write_u4le(self._m_name_zeroes)
            self._io.seek(_pos)


    class CertificateEntry(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#the-attribute-certificate-table-image-only
        """

        class CertificateRevision(IntEnum):
            revision_1_0 = 256
            revision_2_0 = 512

        class CertificateTypeEnum(IntEnum):
            x509 = 1
            pkcs_signed_data = 2
            reserved_1 = 3
            ts_stack_signed = 4
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.CertificateEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length = self._io.read_u4le()
            self.revision = KaitaiStream.resolve_enum(MicrosoftPe.CertificateEntry.CertificateRevision, self._io.read_u2le())
            self.certificate_type = KaitaiStream.resolve_enum(MicrosoftPe.CertificateEntry.CertificateTypeEnum, self._io.read_u2le())
            self.certificate_bytes = self._io.read_bytes(self.length - 8)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MicrosoftPe.CertificateEntry, self)._write__seq(io)
            self._io.write_u4le(self.length)
            self._io.write_u2le(int(self.revision))
            self._io.write_u2le(int(self.certificate_type))
            self._io.write_bytes(self.certificate_bytes)


        def _check(self):
            if len(self.certificate_bytes) != self.length - 8:
                raise kaitaistruct.ConsistencyError(u"certificate_bytes", self.length - 8, len(self.certificate_bytes))
            self._dirty = False


    class CertificateTable(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.CertificateTable, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.items = []
            i = 0
            while not self._io.is_eof():
                _t_items = MicrosoftPe.CertificateEntry(self._io, self, self._root)
                try:
                    _t_items._read()
                finally:
                    self.items.append(_t_items)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.items)):
                pass
                self.items[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(MicrosoftPe.CertificateTable, self)._write__seq(io)
            for i in range(len(self.items)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())
                self.items[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"items", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.items)):
                pass
                if self.items[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                if self.items[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

            self._dirty = False


    class CoffHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           3.3. COFF File Header (Object and Image)
        """

        class MachineType(IntEnum):
            unknown = 0
            i386 = 332
            r4000 = 358
            wce_mips_v2 = 361
            alpha = 388
            sh3 = 418
            sh3_dsp = 419
            sh4 = 422
            sh5 = 424
            arm = 448
            thumb = 450
            arm_nt = 452
            am33 = 467
            powerpc = 496
            powerpc_fp = 497
            ia64 = 512
            mips16 = 614
            alpha64_or_axp64 = 644
            mips_fpu = 870
            mips16_fpu = 1126
            ebc = 3772
            riscv32 = 20530
            riscv64 = 20580
            riscv128 = 20776
            loongarch32 = 25138
            loongarch64 = 25188
            amd64 = 34404
            m32r = 36929
            arm64 = 43620
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.CoffHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_symbol_name_table_size = False
            self.symbol_name_table_size__enabled = True
            self._should_write_symbol_table = False
            self.symbol_table__enabled = True

        def _read(self):
            self.machine = KaitaiStream.resolve_enum(MicrosoftPe.CoffHeader.MachineType, self._io.read_u2le())
            self.number_of_sections = self._io.read_u2le()
            self.time_date_stamp = self._io.read_u4le()
            self.pointer_to_symbol_table = self._io.read_u4le()
            self.number_of_symbols = self._io.read_u4le()
            self.size_of_optional_header = self._io.read_u2le()
            self.characteristics = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.symbol_name_table_size
            if hasattr(self, '_m_symbol_name_table_size'):
                pass

            _ = self.symbol_table
            if hasattr(self, '_m_symbol_table'):
                pass
                for i in range(len(self._m_symbol_table)):
                    pass
                    self._m_symbol_table[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(MicrosoftPe.CoffHeader, self)._write__seq(io)
            self._should_write_symbol_name_table_size = self.symbol_name_table_size__enabled
            self._should_write_symbol_table = self.symbol_table__enabled
            self._io.write_u2le(int(self.machine))
            self._io.write_u2le(self.number_of_sections)
            self._io.write_u4le(self.time_date_stamp)
            self._io.write_u4le(self.pointer_to_symbol_table)
            self._io.write_u4le(self.number_of_symbols)
            self._io.write_u2le(self.size_of_optional_header)
            self._io.write_u2le(self.characteristics)


        def _check(self):
            if self.symbol_name_table_size__enabled:
                pass

            if self.symbol_table__enabled:
                pass
                if len(self._m_symbol_table) != self.number_of_symbols:
                    raise kaitaistruct.ConsistencyError(u"symbol_table", self.number_of_symbols, len(self._m_symbol_table))
                for i in range(len(self._m_symbol_table)):
                    pass
                    if self._m_symbol_table[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"symbol_table", self._root, self._m_symbol_table[i]._root)
                    if self._m_symbol_table[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"symbol_table", self, self._m_symbol_table[i]._parent)


            self._dirty = False

        @property
        def symbol_name_table_offset(self):
            if hasattr(self, '_m_symbol_name_table_offset'):
                return self._m_symbol_name_table_offset

            self._m_symbol_name_table_offset = self.pointer_to_symbol_table + self.symbol_table_size
            return getattr(self, '_m_symbol_name_table_offset', None)

        def _invalidate_symbol_name_table_offset(self):
            del self._m_symbol_name_table_offset
        @property
        def symbol_name_table_size(self):
            if self._should_write_symbol_name_table_size:
                self._write_symbol_name_table_size()
            if hasattr(self, '_m_symbol_name_table_size'):
                return self._m_symbol_name_table_size

            if not self.symbol_name_table_size__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.symbol_name_table_offset)
            self._m_symbol_name_table_size = self._io.read_u4le()
            self._io.seek(_pos)
            return getattr(self, '_m_symbol_name_table_size', None)

        @symbol_name_table_size.setter
        def symbol_name_table_size(self, v):
            self._dirty = True
            self._m_symbol_name_table_size = v

        def _write_symbol_name_table_size(self):
            self._should_write_symbol_name_table_size = False
            _pos = self._io.pos()
            self._io.seek(self.symbol_name_table_offset)
            self._io.write_u4le(self._m_symbol_name_table_size)
            self._io.seek(_pos)

        @property
        def symbol_table(self):
            if self._should_write_symbol_table:
                self._write_symbol_table()
            if hasattr(self, '_m_symbol_table'):
                return self._m_symbol_table

            if not self.symbol_table__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.pointer_to_symbol_table)
            self._m_symbol_table = []
            for i in range(self.number_of_symbols):
                _t__m_symbol_table = MicrosoftPe.CoffSymbol(self._io, self, self._root)
                try:
                    _t__m_symbol_table._read()
                finally:
                    self._m_symbol_table.append(_t__m_symbol_table)

            self._io.seek(_pos)
            return getattr(self, '_m_symbol_table', None)

        @symbol_table.setter
        def symbol_table(self, v):
            self._dirty = True
            self._m_symbol_table = v

        def _write_symbol_table(self):
            self._should_write_symbol_table = False
            _pos = self._io.pos()
            self._io.seek(self.pointer_to_symbol_table)
            for i in range(len(self._m_symbol_table)):
                pass
                self._m_symbol_table[i]._write__seq(self._io)

            self._io.seek(_pos)

        @property
        def symbol_table_size(self):
            if hasattr(self, '_m_symbol_table_size'):
                return self._m_symbol_table_size

            self._m_symbol_table_size = self.number_of_symbols * 18
            return getattr(self, '_m_symbol_table_size', None)

        def _invalidate_symbol_table_size(self):
            del self._m_symbol_table_size

    class CoffSymbol(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.CoffSymbol, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_data = False
            self.data__enabled = True

        def _read(self):
            self._raw_name_annoying = self._io.read_bytes(8)
            _io__raw_name_annoying = KaitaiStream(BytesIO(self._raw_name_annoying))
            self.name_annoying = MicrosoftPe.Annoyingstring(_io__raw_name_annoying, self, self._root)
            self.name_annoying._read()
            self.value = self._io.read_u4le()
            self.section_number = self._io.read_u2le()
            self.type = self._io.read_u2le()
            self.storage_class = self._io.read_u1()
            self.number_of_aux_symbols = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name_annoying._fetch_instances()
            _ = self.data
            if hasattr(self, '_m_data'):
                pass



        def _write__seq(self, io=None):
            super(MicrosoftPe.CoffSymbol, self)._write__seq(io)
            self._should_write_data = self.data__enabled
            _io__raw_name_annoying = KaitaiStream(BytesIO(bytearray(8)))
            self._io.add_child_stream(_io__raw_name_annoying)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (8))
            def handler(parent, _io__raw_name_annoying=_io__raw_name_annoying):
                self._raw_name_annoying = _io__raw_name_annoying.to_byte_array()
                if len(self._raw_name_annoying) != 8:
                    raise kaitaistruct.ConsistencyError(u"raw(name_annoying)", 8, len(self._raw_name_annoying))
                parent.write_bytes(self._raw_name_annoying)
            _io__raw_name_annoying.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.name_annoying._write__seq(_io__raw_name_annoying)
            self._io.write_u4le(self.value)
            self._io.write_u2le(self.section_number)
            self._io.write_u2le(self.type)
            self._io.write_u1(self.storage_class)
            self._io.write_u1(self.number_of_aux_symbols)


        def _check(self):
            if self.name_annoying._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name_annoying", self._root, self.name_annoying._root)
            if self.name_annoying._parent != self:
                raise kaitaistruct.ConsistencyError(u"name_annoying", self, self.name_annoying._parent)
            if self.data__enabled:
                pass
                if len(self._m_data) != 1:
                    raise kaitaistruct.ConsistencyError(u"data", 1, len(self._m_data))

            self._dirty = False

        @property
        def data(self):
            if self._should_write_data:
                self._write_data()
            if hasattr(self, '_m_data'):
                return self._m_data

            if not self.data__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.section.pointer_to_raw_data + self.value)
            self._m_data = self._io.read_bytes(1)
            self._io.seek(_pos)
            return getattr(self, '_m_data', None)

        @data.setter
        def data(self, v):
            self._dirty = True
            self._m_data = v

        def _write_data(self):
            self._should_write_data = False
            _pos = self._io.pos()
            self._io.seek(self.section.pointer_to_raw_data + self.value)
            self._io.write_bytes(self._m_data)
            self._io.seek(_pos)

        @property
        def section(self):
            if hasattr(self, '_m_section'):
                return self._m_section

            self._m_section = self._root.pe.sections[self.section_number - 1]
            return getattr(self, '_m_section', None)

        def _invalidate_section(self):
            del self._m_section

    class DataDir(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.DataDir, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.virtual_address = self._io.read_u4le()
            self.size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MicrosoftPe.DataDir, self)._write__seq(io)
            self._io.write_u4le(self.virtual_address)
            self._io.write_u4le(self.size)


        def _check(self):
            self._dirty = False


    class MzPlaceholder(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.MzPlaceholder, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\x4D\x5A":
                raise kaitaistruct.ValidationNotEqualError(b"\x4D\x5A", self.magic, self._io, u"/types/mz_placeholder/seq/0")
            self.data1 = self._io.read_bytes(58)
            self.ofs_pe = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MicrosoftPe.MzPlaceholder, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_bytes(self.data1)
            self._io.write_u4le(self.ofs_pe)


        def _check(self):
            if len(self.magic) != 2:
                raise kaitaistruct.ConsistencyError(u"magic", 2, len(self.magic))
            if not self.magic == b"\x4D\x5A":
                raise kaitaistruct.ValidationNotEqualError(b"\x4D\x5A", self.magic, None, u"/types/mz_placeholder/seq/0")
            if len(self.data1) != 58:
                raise kaitaistruct.ConsistencyError(u"data1", 58, len(self.data1))
            self._dirty = False


    class OptionalHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.OptionalHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.std = MicrosoftPe.OptionalHeaderStd(self._io, self, self._root)
            self.std._read()
            self.windows = MicrosoftPe.OptionalHeaderWindows(self._io, self, self._root)
            self.windows._read()
            self.data_dirs = MicrosoftPe.OptionalHeaderDataDirs(self._io, self, self._root)
            self.data_dirs._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.std._fetch_instances()
            self.windows._fetch_instances()
            self.data_dirs._fetch_instances()


        def _write__seq(self, io=None):
            super(MicrosoftPe.OptionalHeader, self)._write__seq(io)
            self.std._write__seq(self._io)
            self.windows._write__seq(self._io)
            self.data_dirs._write__seq(self._io)


        def _check(self):
            if self.std._root != self._root:
                raise kaitaistruct.ConsistencyError(u"std", self._root, self.std._root)
            if self.std._parent != self:
                raise kaitaistruct.ConsistencyError(u"std", self, self.std._parent)
            if self.windows._root != self._root:
                raise kaitaistruct.ConsistencyError(u"windows", self._root, self.windows._root)
            if self.windows._parent != self:
                raise kaitaistruct.ConsistencyError(u"windows", self, self.windows._parent)
            if self.data_dirs._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data_dirs", self._root, self.data_dirs._root)
            if self.data_dirs._parent != self:
                raise kaitaistruct.ConsistencyError(u"data_dirs", self, self.data_dirs._parent)
            self._dirty = False


    class OptionalHeaderDataDirs(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.OptionalHeaderDataDirs, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.export_table = MicrosoftPe.DataDir(self._io, self, self._root)
            self.export_table._read()
            self.import_table = MicrosoftPe.DataDir(self._io, self, self._root)
            self.import_table._read()
            self.resource_table = MicrosoftPe.DataDir(self._io, self, self._root)
            self.resource_table._read()
            self.exception_table = MicrosoftPe.DataDir(self._io, self, self._root)
            self.exception_table._read()
            self.certificate_table = MicrosoftPe.DataDir(self._io, self, self._root)
            self.certificate_table._read()
            self.base_relocation_table = MicrosoftPe.DataDir(self._io, self, self._root)
            self.base_relocation_table._read()
            self.debug = MicrosoftPe.DataDir(self._io, self, self._root)
            self.debug._read()
            self.architecture = MicrosoftPe.DataDir(self._io, self, self._root)
            self.architecture._read()
            self.global_ptr = MicrosoftPe.DataDir(self._io, self, self._root)
            self.global_ptr._read()
            self.tls_table = MicrosoftPe.DataDir(self._io, self, self._root)
            self.tls_table._read()
            self.load_config_table = MicrosoftPe.DataDir(self._io, self, self._root)
            self.load_config_table._read()
            self.bound_import = MicrosoftPe.DataDir(self._io, self, self._root)
            self.bound_import._read()
            self.iat = MicrosoftPe.DataDir(self._io, self, self._root)
            self.iat._read()
            self.delay_import_descriptor = MicrosoftPe.DataDir(self._io, self, self._root)
            self.delay_import_descriptor._read()
            self.clr_runtime_header = MicrosoftPe.DataDir(self._io, self, self._root)
            self.clr_runtime_header._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.export_table._fetch_instances()
            self.import_table._fetch_instances()
            self.resource_table._fetch_instances()
            self.exception_table._fetch_instances()
            self.certificate_table._fetch_instances()
            self.base_relocation_table._fetch_instances()
            self.debug._fetch_instances()
            self.architecture._fetch_instances()
            self.global_ptr._fetch_instances()
            self.tls_table._fetch_instances()
            self.load_config_table._fetch_instances()
            self.bound_import._fetch_instances()
            self.iat._fetch_instances()
            self.delay_import_descriptor._fetch_instances()
            self.clr_runtime_header._fetch_instances()


        def _write__seq(self, io=None):
            super(MicrosoftPe.OptionalHeaderDataDirs, self)._write__seq(io)
            self.export_table._write__seq(self._io)
            self.import_table._write__seq(self._io)
            self.resource_table._write__seq(self._io)
            self.exception_table._write__seq(self._io)
            self.certificate_table._write__seq(self._io)
            self.base_relocation_table._write__seq(self._io)
            self.debug._write__seq(self._io)
            self.architecture._write__seq(self._io)
            self.global_ptr._write__seq(self._io)
            self.tls_table._write__seq(self._io)
            self.load_config_table._write__seq(self._io)
            self.bound_import._write__seq(self._io)
            self.iat._write__seq(self._io)
            self.delay_import_descriptor._write__seq(self._io)
            self.clr_runtime_header._write__seq(self._io)


        def _check(self):
            if self.export_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"export_table", self._root, self.export_table._root)
            if self.export_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"export_table", self, self.export_table._parent)
            if self.import_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"import_table", self._root, self.import_table._root)
            if self.import_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"import_table", self, self.import_table._parent)
            if self.resource_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"resource_table", self._root, self.resource_table._root)
            if self.resource_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"resource_table", self, self.resource_table._parent)
            if self.exception_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"exception_table", self._root, self.exception_table._root)
            if self.exception_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"exception_table", self, self.exception_table._parent)
            if self.certificate_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"certificate_table", self._root, self.certificate_table._root)
            if self.certificate_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"certificate_table", self, self.certificate_table._parent)
            if self.base_relocation_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"base_relocation_table", self._root, self.base_relocation_table._root)
            if self.base_relocation_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"base_relocation_table", self, self.base_relocation_table._parent)
            if self.debug._root != self._root:
                raise kaitaistruct.ConsistencyError(u"debug", self._root, self.debug._root)
            if self.debug._parent != self:
                raise kaitaistruct.ConsistencyError(u"debug", self, self.debug._parent)
            if self.architecture._root != self._root:
                raise kaitaistruct.ConsistencyError(u"architecture", self._root, self.architecture._root)
            if self.architecture._parent != self:
                raise kaitaistruct.ConsistencyError(u"architecture", self, self.architecture._parent)
            if self.global_ptr._root != self._root:
                raise kaitaistruct.ConsistencyError(u"global_ptr", self._root, self.global_ptr._root)
            if self.global_ptr._parent != self:
                raise kaitaistruct.ConsistencyError(u"global_ptr", self, self.global_ptr._parent)
            if self.tls_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"tls_table", self._root, self.tls_table._root)
            if self.tls_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"tls_table", self, self.tls_table._parent)
            if self.load_config_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"load_config_table", self._root, self.load_config_table._root)
            if self.load_config_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"load_config_table", self, self.load_config_table._parent)
            if self.bound_import._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bound_import", self._root, self.bound_import._root)
            if self.bound_import._parent != self:
                raise kaitaistruct.ConsistencyError(u"bound_import", self, self.bound_import._parent)
            if self.iat._root != self._root:
                raise kaitaistruct.ConsistencyError(u"iat", self._root, self.iat._root)
            if self.iat._parent != self:
                raise kaitaistruct.ConsistencyError(u"iat", self, self.iat._parent)
            if self.delay_import_descriptor._root != self._root:
                raise kaitaistruct.ConsistencyError(u"delay_import_descriptor", self._root, self.delay_import_descriptor._root)
            if self.delay_import_descriptor._parent != self:
                raise kaitaistruct.ConsistencyError(u"delay_import_descriptor", self, self.delay_import_descriptor._parent)
            if self.clr_runtime_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"clr_runtime_header", self._root, self.clr_runtime_header._root)
            if self.clr_runtime_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"clr_runtime_header", self, self.clr_runtime_header._parent)
            self._dirty = False


    class OptionalHeaderStd(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.OptionalHeaderStd, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.format = KaitaiStream.resolve_enum(MicrosoftPe.PeFormat, self._io.read_u2le())
            self.major_linker_version = self._io.read_u1()
            self.minor_linker_version = self._io.read_u1()
            self.size_of_code = self._io.read_u4le()
            self.size_of_initialized_data = self._io.read_u4le()
            self.size_of_uninitialized_data = self._io.read_u4le()
            self.address_of_entry_point = self._io.read_u4le()
            self.base_of_code = self._io.read_u4le()
            if self.format == MicrosoftPe.PeFormat.pe32:
                pass
                self.base_of_data = self._io.read_u4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.format == MicrosoftPe.PeFormat.pe32:
                pass



        def _write__seq(self, io=None):
            super(MicrosoftPe.OptionalHeaderStd, self)._write__seq(io)
            self._io.write_u2le(int(self.format))
            self._io.write_u1(self.major_linker_version)
            self._io.write_u1(self.minor_linker_version)
            self._io.write_u4le(self.size_of_code)
            self._io.write_u4le(self.size_of_initialized_data)
            self._io.write_u4le(self.size_of_uninitialized_data)
            self._io.write_u4le(self.address_of_entry_point)
            self._io.write_u4le(self.base_of_code)
            if self.format == MicrosoftPe.PeFormat.pe32:
                pass
                self._io.write_u4le(self.base_of_data)



        def _check(self):
            if self.format == MicrosoftPe.PeFormat.pe32:
                pass

            self._dirty = False


    class OptionalHeaderWindows(ReadWriteKaitaiStruct):

        class SubsystemEnum(IntEnum):
            unknown = 0
            native = 1
            windows_gui = 2
            windows_cui = 3
            posix_cui = 7
            windows_ce_gui = 9
            efi_application = 10
            efi_boot_service_driver = 11
            efi_runtime_driver = 12
            efi_rom = 13
            xbox = 14
            windows_boot_application = 16
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.OptionalHeaderWindows, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self.image_base_32 = self._io.read_u4le()

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self.image_base_64 = self._io.read_u8le()

            self.section_alignment = self._io.read_u4le()
            self.file_alignment = self._io.read_u4le()
            self.major_operating_system_version = self._io.read_u2le()
            self.minor_operating_system_version = self._io.read_u2le()
            self.major_image_version = self._io.read_u2le()
            self.minor_image_version = self._io.read_u2le()
            self.major_subsystem_version = self._io.read_u2le()
            self.minor_subsystem_version = self._io.read_u2le()
            self.win32_version_value = self._io.read_u4le()
            self.size_of_image = self._io.read_u4le()
            self.size_of_headers = self._io.read_u4le()
            self.check_sum = self._io.read_u4le()
            self.subsystem = KaitaiStream.resolve_enum(MicrosoftPe.OptionalHeaderWindows.SubsystemEnum, self._io.read_u2le())
            self.dll_characteristics = self._io.read_u2le()
            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self.size_of_stack_reserve_32 = self._io.read_u4le()

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self.size_of_stack_reserve_64 = self._io.read_u8le()

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self.size_of_stack_commit_32 = self._io.read_u4le()

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self.size_of_stack_commit_64 = self._io.read_u8le()

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self.size_of_heap_reserve_32 = self._io.read_u4le()

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self.size_of_heap_reserve_64 = self._io.read_u8le()

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self.size_of_heap_commit_32 = self._io.read_u4le()

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self.size_of_heap_commit_64 = self._io.read_u8le()

            self.loader_flags = self._io.read_u4le()
            self.number_of_rva_and_sizes = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass



        def _write__seq(self, io=None):
            super(MicrosoftPe.OptionalHeaderWindows, self)._write__seq(io)
            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self._io.write_u4le(self.image_base_32)

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self._io.write_u8le(self.image_base_64)

            self._io.write_u4le(self.section_alignment)
            self._io.write_u4le(self.file_alignment)
            self._io.write_u2le(self.major_operating_system_version)
            self._io.write_u2le(self.minor_operating_system_version)
            self._io.write_u2le(self.major_image_version)
            self._io.write_u2le(self.minor_image_version)
            self._io.write_u2le(self.major_subsystem_version)
            self._io.write_u2le(self.minor_subsystem_version)
            self._io.write_u4le(self.win32_version_value)
            self._io.write_u4le(self.size_of_image)
            self._io.write_u4le(self.size_of_headers)
            self._io.write_u4le(self.check_sum)
            self._io.write_u2le(int(self.subsystem))
            self._io.write_u2le(self.dll_characteristics)
            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self._io.write_u4le(self.size_of_stack_reserve_32)

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self._io.write_u8le(self.size_of_stack_reserve_64)

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self._io.write_u4le(self.size_of_stack_commit_32)

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self._io.write_u8le(self.size_of_stack_commit_64)

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self._io.write_u4le(self.size_of_heap_reserve_32)

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self._io.write_u8le(self.size_of_heap_reserve_64)

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass
                self._io.write_u4le(self.size_of_heap_commit_32)

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass
                self._io.write_u8le(self.size_of_heap_commit_64)

            self._io.write_u4le(self.loader_flags)
            self._io.write_u4le(self.number_of_rva_and_sizes)


        def _check(self):
            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32:
                pass

            if self._parent.std.format == MicrosoftPe.PeFormat.pe32_plus:
                pass

            self._dirty = False


    class PeHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.PeHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_certificate_table = False
            self.certificate_table__enabled = True

        def _read(self):
            self.pe_signature = self._io.read_bytes(4)
            if not self.pe_signature == b"\x50\x45\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x45\x00\x00", self.pe_signature, self._io, u"/types/pe_header/seq/0")
            self.coff_hdr = MicrosoftPe.CoffHeader(self._io, self, self._root)
            self.coff_hdr._read()
            self._raw_optional_hdr = self._io.read_bytes(self.coff_hdr.size_of_optional_header)
            _io__raw_optional_hdr = KaitaiStream(BytesIO(self._raw_optional_hdr))
            self.optional_hdr = MicrosoftPe.OptionalHeader(_io__raw_optional_hdr, self, self._root)
            self.optional_hdr._read()
            self.sections = []
            for i in range(self.coff_hdr.number_of_sections):
                _t_sections = MicrosoftPe.Section(self._io, self, self._root)
                try:
                    _t_sections._read()
                finally:
                    self.sections.append(_t_sections)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.coff_hdr._fetch_instances()
            self.optional_hdr._fetch_instances()
            for i in range(len(self.sections)):
                pass
                self.sections[i]._fetch_instances()

            _ = self.certificate_table
            if hasattr(self, '_m_certificate_table'):
                pass
                self._m_certificate_table._fetch_instances()



        def _write__seq(self, io=None):
            super(MicrosoftPe.PeHeader, self)._write__seq(io)
            self._should_write_certificate_table = self.certificate_table__enabled
            self._io.write_bytes(self.pe_signature)
            self.coff_hdr._write__seq(self._io)
            _io__raw_optional_hdr = KaitaiStream(BytesIO(bytearray(self.coff_hdr.size_of_optional_header)))
            self._io.add_child_stream(_io__raw_optional_hdr)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.coff_hdr.size_of_optional_header))
            def handler(parent, _io__raw_optional_hdr=_io__raw_optional_hdr):
                self._raw_optional_hdr = _io__raw_optional_hdr.to_byte_array()
                if len(self._raw_optional_hdr) != self.coff_hdr.size_of_optional_header:
                    raise kaitaistruct.ConsistencyError(u"raw(optional_hdr)", self.coff_hdr.size_of_optional_header, len(self._raw_optional_hdr))
                parent.write_bytes(self._raw_optional_hdr)
            _io__raw_optional_hdr.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.optional_hdr._write__seq(_io__raw_optional_hdr)
            for i in range(len(self.sections)):
                pass
                self.sections[i]._write__seq(self._io)



        def _check(self):
            if len(self.pe_signature) != 4:
                raise kaitaistruct.ConsistencyError(u"pe_signature", 4, len(self.pe_signature))
            if not self.pe_signature == b"\x50\x45\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x45\x00\x00", self.pe_signature, None, u"/types/pe_header/seq/0")
            if self.coff_hdr._root != self._root:
                raise kaitaistruct.ConsistencyError(u"coff_hdr", self._root, self.coff_hdr._root)
            if self.coff_hdr._parent != self:
                raise kaitaistruct.ConsistencyError(u"coff_hdr", self, self.coff_hdr._parent)
            if self.optional_hdr._root != self._root:
                raise kaitaistruct.ConsistencyError(u"optional_hdr", self._root, self.optional_hdr._root)
            if self.optional_hdr._parent != self:
                raise kaitaistruct.ConsistencyError(u"optional_hdr", self, self.optional_hdr._parent)
            if len(self.sections) != self.coff_hdr.number_of_sections:
                raise kaitaistruct.ConsistencyError(u"sections", self.coff_hdr.number_of_sections, len(self.sections))
            for i in range(len(self.sections)):
                pass
                if self.sections[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"sections", self._root, self.sections[i]._root)
                if self.sections[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"sections", self, self.sections[i]._parent)

            if self.certificate_table__enabled:
                pass
                if self.optional_hdr.data_dirs.certificate_table.virtual_address != 0:
                    pass
                    if self._m_certificate_table._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"certificate_table", self._root, self._m_certificate_table._root)
                    if self._m_certificate_table._parent != self:
                        raise kaitaistruct.ConsistencyError(u"certificate_table", self, self._m_certificate_table._parent)


            self._dirty = False

        @property
        def certificate_table(self):
            if self._should_write_certificate_table:
                self._write_certificate_table()
            if hasattr(self, '_m_certificate_table'):
                return self._m_certificate_table

            if not self.certificate_table__enabled:
                return None

            if self.optional_hdr.data_dirs.certificate_table.virtual_address != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.optional_hdr.data_dirs.certificate_table.virtual_address)
                self._raw__m_certificate_table = self._io.read_bytes(self.optional_hdr.data_dirs.certificate_table.size)
                _io__raw__m_certificate_table = KaitaiStream(BytesIO(self._raw__m_certificate_table))
                self._m_certificate_table = MicrosoftPe.CertificateTable(_io__raw__m_certificate_table, self, self._root)
                self._m_certificate_table._read()
                self._io.seek(_pos)

            return getattr(self, '_m_certificate_table', None)

        @certificate_table.setter
        def certificate_table(self, v):
            self._dirty = True
            self._m_certificate_table = v

        def _write_certificate_table(self):
            self._should_write_certificate_table = False
            if self.optional_hdr.data_dirs.certificate_table.virtual_address != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.optional_hdr.data_dirs.certificate_table.virtual_address)
                _io__raw__m_certificate_table = KaitaiStream(BytesIO(bytearray(self.optional_hdr.data_dirs.certificate_table.size)))
                self._io.add_child_stream(_io__raw__m_certificate_table)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.optional_hdr.data_dirs.certificate_table.size))
                def handler(parent, _io__raw__m_certificate_table=_io__raw__m_certificate_table):
                    self._raw__m_certificate_table = _io__raw__m_certificate_table.to_byte_array()
                    if len(self._raw__m_certificate_table) != self.optional_hdr.data_dirs.certificate_table.size:
                        raise kaitaistruct.ConsistencyError(u"raw(certificate_table)", self.optional_hdr.data_dirs.certificate_table.size, len(self._raw__m_certificate_table))
                    parent.write_bytes(self._raw__m_certificate_table)
                _io__raw__m_certificate_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_certificate_table._write__seq(_io__raw__m_certificate_table)
                self._io.seek(_pos)



    class Section(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftPe.Section, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.name = (KaitaiStream.bytes_strip_right(self._io.read_bytes(8), 0)).decode(u"UTF-8")
            self.virtual_size = self._io.read_u4le()
            self.virtual_address = self._io.read_u4le()
            self.size_of_raw_data = self._io.read_u4le()
            self.pointer_to_raw_data = self._io.read_u4le()
            self.pointer_to_relocations = self._io.read_u4le()
            self.pointer_to_linenumbers = self._io.read_u4le()
            self.number_of_relocations = self._io.read_u2le()
            self.number_of_linenumbers = self._io.read_u2le()
            self.characteristics = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(MicrosoftPe.Section, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 8, 0, 0)
            self._io.write_u4le(self.virtual_size)
            self._io.write_u4le(self.virtual_address)
            self._io.write_u4le(self.size_of_raw_data)
            self._io.write_u4le(self.pointer_to_raw_data)
            self._io.write_u4le(self.pointer_to_relocations)
            self._io.write_u4le(self.pointer_to_linenumbers)
            self._io.write_u2le(self.number_of_relocations)
            self._io.write_u2le(self.number_of_linenumbers)
            self._io.write_u4le(self.characteristics)


        def _check(self):
            if len((self.name).encode(u"UTF-8")) > 8:
                raise kaitaistruct.ConsistencyError(u"name", 8, len((self.name).encode(u"UTF-8")))
            if  ((len((self.name).encode(u"UTF-8")) != 0) and (KaitaiStream.byte_array_index((self.name).encode(u"UTF-8"), -1) == 0)) :
                raise kaitaistruct.ConsistencyError(u"name", 0, KaitaiStream.byte_array_index((self.name).encode(u"UTF-8"), -1))
            if self.body__enabled:
                pass
                if len(self._m_body) != self.size_of_raw_data:
                    raise kaitaistruct.ConsistencyError(u"body", self.size_of_raw_data, len(self._m_body))

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
            self._io.seek(self.pointer_to_raw_data)
            self._m_body = self._io.read_bytes(self.size_of_raw_data)
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            _pos = self._io.pos()
            self._io.seek(self.pointer_to_raw_data)
            self._io.write_bytes(self._m_body)
            self._io.seek(_pos)


    @property
    def pe(self):
        if self._should_write_pe:
            self._write_pe()
        if hasattr(self, '_m_pe'):
            return self._m_pe

        if not self.pe__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.mz.ofs_pe)
        self._m_pe = MicrosoftPe.PeHeader(self._io, self, self._root)
        self._m_pe._read()
        self._io.seek(_pos)
        return getattr(self, '_m_pe', None)

    @pe.setter
    def pe(self, v):
        self._dirty = True
        self._m_pe = v

    def _write_pe(self):
        self._should_write_pe = False
        _pos = self._io.pos()
        self._io.seek(self.mz.ofs_pe)
        self._m_pe._write__seq(self._io)
        self._io.seek(_pos)


