# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class UefiTe(ReadWriteKaitaiStruct):
    """This type of executables could be found inside the UEFI firmware. The UEFI
    firmware is stored in SPI flash memory, which is a chip soldered on a
    system's motherboard. UEFI firmware is very modular: it usually contains
    dozens, if not hundreds, of executables. To store all these separates files,
    the firmware is laid out in volumes using the Firmware File System (FFS), a
    file system specifically designed to store firmware images. The volumes
    contain files that are identified by GUIDs and each of these files contain
    one or more sections holding the data. One of these sections contains the
    actual executable image. Most of the executable images follow the PE format.
    However, some of them follow the TE format.
    
    The Terse Executable (TE) image format was created as a mechanism to reduce
    the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
    corresponding reduction of image sizes for executables running in the PI
    (Platform Initialization) Architecture environment. Reducing image size
    provides an opportunity for use of a smaller system flash part.
    
    So the TE format is basically a stripped version of PE.
    
    .. seealso::
       Source - https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(UefiTe, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self._raw_te_hdr = self._io.read_bytes(40)
        _io__raw_te_hdr = KaitaiStream(BytesIO(self._raw_te_hdr))
        self.te_hdr = UefiTe.TeHeader(_io__raw_te_hdr, self, self._root)
        self.te_hdr._read()
        self.sections = []
        for i in range(self.te_hdr.num_sections):
            _t_sections = UefiTe.Section(self._io, self, self._root)
            try:
                _t_sections._read()
            finally:
                self.sections.append(_t_sections)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.te_hdr._fetch_instances()
        for i in range(len(self.sections)):
            pass
            self.sections[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(UefiTe, self)._write__seq(io)
        _io__raw_te_hdr = KaitaiStream(BytesIO(bytearray(40)))
        self._io.add_child_stream(_io__raw_te_hdr)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (40))
        def handler(parent, _io__raw_te_hdr=_io__raw_te_hdr):
            self._raw_te_hdr = _io__raw_te_hdr.to_byte_array()
            if len(self._raw_te_hdr) != 40:
                raise kaitaistruct.ConsistencyError(u"raw(te_hdr)", 40, len(self._raw_te_hdr))
            parent.write_bytes(self._raw_te_hdr)
        _io__raw_te_hdr.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.te_hdr._write__seq(_io__raw_te_hdr)
        for i in range(len(self.sections)):
            pass
            self.sections[i]._write__seq(self._io)



    def _check(self):
        if self.te_hdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"te_hdr", self._root, self.te_hdr._root)
        if self.te_hdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"te_hdr", self, self.te_hdr._parent)
        if len(self.sections) != self.te_hdr.num_sections:
            raise kaitaistruct.ConsistencyError(u"sections", self.te_hdr.num_sections, len(self.sections))
        for i in range(len(self.sections)):
            pass
            if self.sections[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"sections", self._root, self.sections[i]._root)
            if self.sections[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"sections", self, self.sections[i]._parent)

        self._dirty = False

    class DataDir(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(UefiTe.DataDir, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.virtual_address = self._io.read_u4le()
            self.size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(UefiTe.DataDir, self)._write__seq(io)
            self._io.write_u4le(self.virtual_address)
            self._io.write_u4le(self.size)


        def _check(self):
            self._dirty = False


    class HeaderDataDirs(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(UefiTe.HeaderDataDirs, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.base_relocation_table = UefiTe.DataDir(self._io, self, self._root)
            self.base_relocation_table._read()
            self.debug = UefiTe.DataDir(self._io, self, self._root)
            self.debug._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.base_relocation_table._fetch_instances()
            self.debug._fetch_instances()


        def _write__seq(self, io=None):
            super(UefiTe.HeaderDataDirs, self)._write__seq(io)
            self.base_relocation_table._write__seq(self._io)
            self.debug._write__seq(self._io)


        def _check(self):
            if self.base_relocation_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"base_relocation_table", self._root, self.base_relocation_table._root)
            if self.base_relocation_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"base_relocation_table", self, self.base_relocation_table._parent)
            if self.debug._root != self._root:
                raise kaitaistruct.ConsistencyError(u"debug", self._root, self.debug._root)
            if self.debug._parent != self:
                raise kaitaistruct.ConsistencyError(u"debug", self, self.debug._parent)
            self._dirty = False


    class Section(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(UefiTe.Section, self).__init__(_io)
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
            self.num_relocations = self._io.read_u2le()
            self.num_linenumbers = self._io.read_u2le()
            self.characteristics = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(UefiTe.Section, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 8, 0, 0)
            self._io.write_u4le(self.virtual_size)
            self._io.write_u4le(self.virtual_address)
            self._io.write_u4le(self.size_of_raw_data)
            self._io.write_u4le(self.pointer_to_raw_data)
            self._io.write_u4le(self.pointer_to_relocations)
            self._io.write_u4le(self.pointer_to_linenumbers)
            self._io.write_u2le(self.num_relocations)
            self._io.write_u2le(self.num_linenumbers)
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
            self._io.seek((self.pointer_to_raw_data - self._root.te_hdr.stripped_size) + self._root.te_hdr._io.size())
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
            self._io.seek((self.pointer_to_raw_data - self._root.te_hdr.stripped_size) + self._root.te_hdr._io.size())
            self._io.write_bytes(self._m_body)
            self._io.seek(_pos)


    class TeHeader(ReadWriteKaitaiStruct):

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
            super(UefiTe.TeHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\x56\x5A":
                raise kaitaistruct.ValidationNotEqualError(b"\x56\x5A", self.magic, self._io, u"/types/te_header/seq/0")
            self.machine = KaitaiStream.resolve_enum(UefiTe.TeHeader.MachineType, self._io.read_u2le())
            self.num_sections = self._io.read_u1()
            self.subsystem = KaitaiStream.resolve_enum(UefiTe.TeHeader.SubsystemEnum, self._io.read_u1())
            self.stripped_size = self._io.read_u2le()
            self.entry_point_addr = self._io.read_u4le()
            self.base_of_code = self._io.read_u4le()
            self.image_base = self._io.read_u8le()
            self.data_dirs = UefiTe.HeaderDataDirs(self._io, self, self._root)
            self.data_dirs._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.data_dirs._fetch_instances()


        def _write__seq(self, io=None):
            super(UefiTe.TeHeader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u2le(int(self.machine))
            self._io.write_u1(self.num_sections)
            self._io.write_u1(int(self.subsystem))
            self._io.write_u2le(self.stripped_size)
            self._io.write_u4le(self.entry_point_addr)
            self._io.write_u4le(self.base_of_code)
            self._io.write_u8le(self.image_base)
            self.data_dirs._write__seq(self._io)


        def _check(self):
            if len(self.magic) != 2:
                raise kaitaistruct.ConsistencyError(u"magic", 2, len(self.magic))
            if not self.magic == b"\x56\x5A":
                raise kaitaistruct.ValidationNotEqualError(b"\x56\x5A", self.magic, None, u"/types/te_header/seq/0")
            if self.data_dirs._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data_dirs", self._root, self.data_dirs._root)
            if self.data_dirs._parent != self:
                raise kaitaistruct.ConsistencyError(u"data_dirs", self, self.data_dirs._parent)
            self._dirty = False



