# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class UefiTe(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(UefiTe, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self._raw_te_hdr = self._io.read_bytes(40)
        _io__raw_te_hdr = KaitaiStream(BytesIO(self._raw_te_hdr))
        self.te_hdr = UefiTe.TeHeader(_io__raw_te_hdr, self, self._root)
        self.sections = []
        for i in range(self.te_hdr.num_sections):
            self.sections.append(UefiTe.Section(self._io, self, self._root))



    def _fetch_instances(self):
        pass
        self.te_hdr._fetch_instances()
        for i in range(len(self.sections)):
            pass
            self.sections[i]._fetch_instances()


    class DataDir(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(UefiTe.DataDir, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.virtual_address = self._io.read_u4le()
            self.size = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class HeaderDataDirs(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(UefiTe.HeaderDataDirs, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.base_relocation_table = UefiTe.DataDir(self._io, self, self._root)
            self.debug = UefiTe.DataDir(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.base_relocation_table._fetch_instances()
            self.debug._fetch_instances()


    class Section(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(UefiTe.Section, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass


        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body

            _pos = self._io.pos()
            self._io.seek((self.pointer_to_raw_data - self._root.te_hdr.stripped_size) + self._root.te_hdr._io.size())
            self._m_body = self._io.read_bytes(self.size_of_raw_data)
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)


    class TeHeader(KaitaiStruct):

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
        def __init__(self, _io, _parent=None, _root=None):
            super(UefiTe.TeHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass
            self.data_dirs._fetch_instances()



