# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Elf(KaitaiStruct):
    """
    .. seealso::
       Source - https://github.com/lattera/glibc/blob/master/elf/elf.h
    """

    class Endian(Enum):
        le = 1
        be = 2

    class ShType(Enum):
        null_type = 0
        progbits = 1
        symtab = 2
        strtab = 3
        rela = 4
        hash = 5
        dynamic = 6
        note = 7
        nobits = 8
        rel = 9
        shlib = 10
        dynsym = 11
        init_array = 14
        fini_array = 15
        preinit_array = 16
        group = 17
        symtab_shndx = 18
        sunw_capchain = 1879048175
        sunw_capinfo = 1879048176
        sunw_symsort = 1879048177
        sunw_tlssort = 1879048178
        sunw_ldynsym = 1879048179
        sunw_dof = 1879048180
        sunw_cap = 1879048181
        sunw_signature = 1879048182
        sunw_annotate = 1879048183
        sunw_debugstr = 1879048184
        sunw_debug = 1879048185
        sunw_move = 1879048186
        sunw_comdat = 1879048187
        sunw_syminfo = 1879048188
        sunw_verdef = 1879048189
        sunw_verneed = 1879048190
        sunw_versym = 1879048191
        sparc_gotdata = 1879048192
        amd64_unwind = 1879048193

    class OsAbi(Enum):
        system_v = 0
        hp_ux = 1
        netbsd = 2
        gnu = 3
        solaris = 6
        aix = 7
        irix = 8
        freebsd = 9
        tru64 = 10
        modesto = 11
        openbsd = 12
        openvms = 13
        nsk = 14
        aros = 15
        fenixos = 16
        cloudabi = 17
        openvos = 18

    class Machine(Enum):
        not_set = 0
        sparc = 2
        x86 = 3
        mips = 8
        powerpc = 20
        arm = 40
        superh = 42
        ia_64 = 50
        x86_64 = 62
        aarch64 = 183

    class PhdrType(Enum):
        read = 1
        write = 2
        execute = 4
        mask_proc = 4026531840

    class SectionHeaderFlags(Enum):
        write = 1
        alloc = 2
        exec_instr = 4
        merge = 16
        strings = 32
        info_link = 64
        link_order = 128
        os_non_conforming = 256
        group = 512
        tls = 1024
        ordered = 67108864
        exclude = 134217728
        mask_proc = 4026531840

    class DynamicArrayTags(Enum):
        null = 0
        needed = 1
        pltrelsz = 2
        pltgot = 3
        hash = 4
        strtab = 5
        symtab = 6
        rela = 7
        relasz = 8
        relaent = 9
        strsz = 10
        syment = 11
        init = 12
        fini = 13
        soname = 14
        rpath = 15
        symbolic = 16
        rel = 17
        relsz = 18
        relent = 19
        pltrel = 20
        debug = 21
        textrel = 22
        jmprel = 23
        bind_now = 24
        init_array = 25
        fini_array = 26
        init_arraysz = 27
        fini_arraysz = 28
        runpath = 29
        flags = 30
        preinit_array = 32
        preinit_arraysz = 33
        maxpostags = 34
        sunw_auxiliary = 1610612749
        sunw_filter = 1610612750
        sunw_cap = 1610612752
        sunw_symtab = 1610612753
        sunw_symsz = 1610612754
        sunw_sortent = 1610612755
        sunw_symsort = 1610612756
        sunw_symsortsz = 1610612757
        sunw_tlssort = 1610612758
        sunw_tlssortsz = 1610612759
        sunw_capinfo = 1610612760
        sunw_strpad = 1610612761
        sunw_capchain = 1610612762
        sunw_ldmach = 1610612763
        sunw_capchainent = 1610612765
        sunw_capchainsz = 1610612767
        hios = 1879044096
        valrnglo = 1879047424
        gnu_prelinked = 1879047669
        gnu_conflictsz = 1879047670
        gnu_liblistsz = 1879047671
        checksum = 1879047672
        pltpadsz = 1879047673
        moveent = 1879047674
        movesz = 1879047675
        feature_1 = 1879047676
        posflag_1 = 1879047677
        syminsz = 1879047678
        valrnghi = 1879047679
        addrrnglo = 1879047680
        gnu_hash = 1879047925
        tlsdesc_plt = 1879047926
        tlsdesc_got = 1879047927
        gnu_conflict = 1879047928
        gnu_liblist = 1879047929
        config = 1879047930
        depaudit = 1879047931
        audit = 1879047932
        pltpad = 1879047933
        movetab = 1879047934
        addrrnghi = 1879047935
        versym = 1879048176
        relacount = 1879048185
        relcount = 1879048186
        flags_1 = 1879048187
        verdef = 1879048188
        verdefnum = 1879048189
        verneed = 1879048190
        verneednum = 1879048191
        loproc = 1879048192
        sparc_register = 1879048193
        auxiliary = 2147483645
        used = 2147483646
        hiproc = 2147483647

    class Bits(Enum):
        b32 = 1
        b64 = 2

    class PhType(Enum):
        null_type = 0
        load = 1
        dynamic = 2
        interp = 3
        note = 4
        shlib = 5
        phdr = 6
        tls = 7
        gnu_eh_frame = 1685382480
        gnu_stack = 1685382481
        gnu_relro = 1685382482
        pax_flags = 1694766464
        hios = 1879048191

    class ObjType(Enum):
        relocatable = 1
        executable = 2
        shared = 3
        core = 4
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.ensure_fixed_contents(b"\x7F\x45\x4C\x46")
        self.bits = self._root.Bits(self._io.read_u1())
        self.endian = self._root.Endian(self._io.read_u1())
        self.ei_version = self._io.read_u1()
        self.abi = self._root.OsAbi(self._io.read_u1())
        self.abi_version = self._io.read_u1()
        self.pad = self._io.read_bytes(7)
        self.header = self._root.EndianElf(self._io, self, self._root)

    class EndianElf(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            _on = self._root.endian
            if _on == self._root.Endian.le:
                self._is_le = True
            elif _on == self._root.Endian.be:
                self._is_le = False

            if self._is_le == True:
                self._read_le()
            elif self._is_le == False:
                self._read_be()
            else:
                raise Exception("Unable to decide endianness")

        def _read_le(self):
            self.e_type = self._root.ObjType(self._io.read_u2le())
            self.machine = self._root.Machine(self._io.read_u2le())
            self.e_version = self._io.read_u4le()
            _on = self._root.bits
            if _on == self._root.Bits.b32:
                self.entry_point = self._io.read_u4le()
            elif _on == self._root.Bits.b64:
                self.entry_point = self._io.read_u8le()
            _on = self._root.bits
            if _on == self._root.Bits.b32:
                self.program_header_offset = self._io.read_u4le()
            elif _on == self._root.Bits.b64:
                self.program_header_offset = self._io.read_u8le()
            _on = self._root.bits
            if _on == self._root.Bits.b32:
                self.section_header_offset = self._io.read_u4le()
            elif _on == self._root.Bits.b64:
                self.section_header_offset = self._io.read_u8le()
            self.flags = self._io.read_bytes(4)
            self.e_ehsize = self._io.read_u2le()
            self.program_header_entry_size = self._io.read_u2le()
            self.qty_program_header = self._io.read_u2le()
            self.section_header_entry_size = self._io.read_u2le()
            self.qty_section_header = self._io.read_u2le()
            self.section_names_idx = self._io.read_u2le()

        def _read_be(self):
            self.e_type = self._root.ObjType(self._io.read_u2be())
            self.machine = self._root.Machine(self._io.read_u2be())
            self.e_version = self._io.read_u4be()
            _on = self._root.bits
            if _on == self._root.Bits.b32:
                self.entry_point = self._io.read_u4be()
            elif _on == self._root.Bits.b64:
                self.entry_point = self._io.read_u8be()
            _on = self._root.bits
            if _on == self._root.Bits.b32:
                self.program_header_offset = self._io.read_u4be()
            elif _on == self._root.Bits.b64:
                self.program_header_offset = self._io.read_u8be()
            _on = self._root.bits
            if _on == self._root.Bits.b32:
                self.section_header_offset = self._io.read_u4be()
            elif _on == self._root.Bits.b64:
                self.section_header_offset = self._io.read_u8be()
            self.flags = self._io.read_bytes(4)
            self.e_ehsize = self._io.read_u2be()
            self.program_header_entry_size = self._io.read_u2be()
            self.qty_program_header = self._io.read_u2be()
            self.section_header_entry_size = self._io.read_u2be()
            self.qty_section_header = self._io.read_u2be()
            self.section_names_idx = self._io.read_u2be()

        class ProgramHeader(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None, _is_le=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._is_le = _is_le
                self._read()

            def _read(self):

                if self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                else:
                    raise Exception("Unable to decide endianness")

            def _read_le(self):
                self.type = self._root.PhType(self._io.read_u4le())
                if self._root.bits == self._root.Bits.b64:
                    self.flags64 = self._root.PhdrType(self._io.read_u4le())

                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.offset = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.offset = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.vaddr = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.vaddr = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.paddr = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.paddr = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.filesz = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.filesz = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.memsz = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.memsz = self._io.read_u8le()
                if self._root.bits == self._root.Bits.b32:
                    self.flags32 = self._io.read_u4le()

                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.align = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.align = self._io.read_u8le()

            def _read_be(self):
                self.type = self._root.PhType(self._io.read_u4be())
                if self._root.bits == self._root.Bits.b64:
                    self.flags64 = self._root.PhdrType(self._io.read_u4be())

                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.offset = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.offset = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.vaddr = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.vaddr = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.paddr = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.paddr = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.filesz = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.filesz = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.memsz = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.memsz = self._io.read_u8be()
                if self._root.bits == self._root.Bits.b32:
                    self.flags32 = self._io.read_u4be()

                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.align = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.align = self._io.read_u8be()

            @property
            def dynamic(self):
                if hasattr(self, '_m_dynamic'):
                    return self._m_dynamic if hasattr(self, '_m_dynamic') else None

                if self.type == self._root.PhType.dynamic:
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.offset)
                    if self._is_le:
                        self._raw__m_dynamic = io.read_bytes(self.filesz)
                        io = KaitaiStream(BytesIO(self._raw__m_dynamic))
                        self._m_dynamic = self._root.EndianElf.DynamicSection(io, self, self._root, self._is_le)
                    else:
                        self._raw__m_dynamic = io.read_bytes(self.filesz)
                        io = KaitaiStream(BytesIO(self._raw__m_dynamic))
                        self._m_dynamic = self._root.EndianElf.DynamicSection(io, self, self._root, self._is_le)
                    io.seek(_pos)

                return self._m_dynamic if hasattr(self, '_m_dynamic') else None


        class DynamicSectionEntry(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None, _is_le=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._is_le = _is_le
                self._read()

            def _read(self):

                if self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                else:
                    raise Exception("Unable to decide endianness")

            def _read_le(self):
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.tag = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.tag = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.value_or_ptr = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.value_or_ptr = self._io.read_u8le()

            def _read_be(self):
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.tag = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.tag = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.value_or_ptr = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.value_or_ptr = self._io.read_u8be()

            @property
            def tag_enum(self):
                if hasattr(self, '_m_tag_enum'):
                    return self._m_tag_enum if hasattr(self, '_m_tag_enum') else None

                self._m_tag_enum = self._root.DynamicArrayTags(self.tag)
                return self._m_tag_enum if hasattr(self, '_m_tag_enum') else None


        class SectionHeader(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None, _is_le=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._is_le = _is_le
                self._read()

            def _read(self):

                if self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                else:
                    raise Exception("Unable to decide endianness")

            def _read_le(self):
                self.name_offset = self._io.read_u4le()
                self.type = self._root.ShType(self._io.read_u4le())
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.flags = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.flags = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.addr = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.addr = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.offset = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.offset = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.size = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.size = self._io.read_u8le()
                self.linked_section_idx = self._io.read_u4le()
                self.info = self._io.read_bytes(4)
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.align = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.align = self._io.read_u8le()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.entry_size = self._io.read_u4le()
                elif _on == self._root.Bits.b64:
                    self.entry_size = self._io.read_u8le()

            def _read_be(self):
                self.name_offset = self._io.read_u4be()
                self.type = self._root.ShType(self._io.read_u4be())
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.flags = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.flags = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.addr = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.addr = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.offset = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.offset = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.size = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.size = self._io.read_u8be()
                self.linked_section_idx = self._io.read_u4be()
                self.info = self._io.read_bytes(4)
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.align = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.align = self._io.read_u8be()
                _on = self._root.bits
                if _on == self._root.Bits.b32:
                    self.entry_size = self._io.read_u4be()
                elif _on == self._root.Bits.b64:
                    self.entry_size = self._io.read_u8be()

            @property
            def flags_enum(self):
                if hasattr(self, '_m_flags_enum'):
                    return self._m_flags_enum if hasattr(self, '_m_flags_enum') else None

                self._m_flags_enum = self._root.SectionHeaderFlags(self.flags)
                return self._m_flags_enum if hasattr(self, '_m_flags_enum') else None

            @property
            def body(self):
                if hasattr(self, '_m_body'):
                    return self._m_body if hasattr(self, '_m_body') else None

                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                if self._is_le:
                    self._m_body = io.read_bytes(self.size)
                else:
                    self._m_body = io.read_bytes(self.size)
                io.seek(_pos)
                return self._m_body if hasattr(self, '_m_body') else None

            @property
            def strtab(self):
                if hasattr(self, '_m_strtab'):
                    return self._m_strtab if hasattr(self, '_m_strtab') else None

                if self.type == self._root.ShType.strtab:
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.offset)
                    if self._is_le:
                        self._raw__m_strtab = io.read_bytes(self.size)
                        io = KaitaiStream(BytesIO(self._raw__m_strtab))
                        self._m_strtab = self._root.EndianElf.StringsStruct(io, self, self._root, self._is_le)
                    else:
                        self._raw__m_strtab = io.read_bytes(self.size)
                        io = KaitaiStream(BytesIO(self._raw__m_strtab))
                        self._m_strtab = self._root.EndianElf.StringsStruct(io, self, self._root, self._is_le)
                    io.seek(_pos)

                return self._m_strtab if hasattr(self, '_m_strtab') else None

            @property
            def name(self):
                if hasattr(self, '_m_name'):
                    return self._m_name if hasattr(self, '_m_name') else None

                io = self._root.header.strings._io
                _pos = io.pos()
                io.seek(self.name_offset)
                if self._is_le:
                    self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                else:
                    self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                io.seek(_pos)
                return self._m_name if hasattr(self, '_m_name') else None

            @property
            def dynamic(self):
                if hasattr(self, '_m_dynamic'):
                    return self._m_dynamic if hasattr(self, '_m_dynamic') else None

                if self.type == self._root.ShType.dynamic:
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.offset)
                    if self._is_le:
                        self._raw__m_dynamic = io.read_bytes(self.size)
                        io = KaitaiStream(BytesIO(self._raw__m_dynamic))
                        self._m_dynamic = self._root.EndianElf.DynamicSection(io, self, self._root, self._is_le)
                    else:
                        self._raw__m_dynamic = io.read_bytes(self.size)
                        io = KaitaiStream(BytesIO(self._raw__m_dynamic))
                        self._m_dynamic = self._root.EndianElf.DynamicSection(io, self, self._root, self._is_le)
                    io.seek(_pos)

                return self._m_dynamic if hasattr(self, '_m_dynamic') else None


        class DynamicSection(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None, _is_le=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._is_le = _is_le
                self._read()

            def _read(self):

                if self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                else:
                    raise Exception("Unable to decide endianness")

            def _read_le(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append(self._root.EndianElf.DynamicSectionEntry(self._io, self, self._root, self._is_le))
                    i += 1


            def _read_be(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append(self._root.EndianElf.DynamicSectionEntry(self._io, self, self._root, self._is_le))
                    i += 1



        class StringsStruct(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None, _is_le=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._is_le = _is_le
                self._read()

            def _read(self):

                if self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                else:
                    raise Exception("Unable to decide endianness")

            def _read_le(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append((self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII"))
                    i += 1


            def _read_be(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append((self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII"))
                    i += 1



        @property
        def program_headers(self):
            if hasattr(self, '_m_program_headers'):
                return self._m_program_headers if hasattr(self, '_m_program_headers') else None

            _pos = self._io.pos()
            self._io.seek(self.program_header_offset)
            if self._is_le:
                self._raw__m_program_headers = [None] * (self.qty_program_header)
                self._m_program_headers = [None] * (self.qty_program_header)
                for i in range(self.qty_program_header):
                    self._raw__m_program_headers[i] = self._io.read_bytes(self.program_header_entry_size)
                    io = KaitaiStream(BytesIO(self._raw__m_program_headers[i]))
                    self._m_program_headers[i] = self._root.EndianElf.ProgramHeader(io, self, self._root, self._is_le)

            else:
                self._raw__m_program_headers = [None] * (self.qty_program_header)
                self._m_program_headers = [None] * (self.qty_program_header)
                for i in range(self.qty_program_header):
                    self._raw__m_program_headers[i] = self._io.read_bytes(self.program_header_entry_size)
                    io = KaitaiStream(BytesIO(self._raw__m_program_headers[i]))
                    self._m_program_headers[i] = self._root.EndianElf.ProgramHeader(io, self, self._root, self._is_le)

            self._io.seek(_pos)
            return self._m_program_headers if hasattr(self, '_m_program_headers') else None

        @property
        def section_headers(self):
            if hasattr(self, '_m_section_headers'):
                return self._m_section_headers if hasattr(self, '_m_section_headers') else None

            _pos = self._io.pos()
            self._io.seek(self.section_header_offset)
            if self._is_le:
                self._raw__m_section_headers = [None] * (self.qty_section_header)
                self._m_section_headers = [None] * (self.qty_section_header)
                for i in range(self.qty_section_header):
                    self._raw__m_section_headers[i] = self._io.read_bytes(self.section_header_entry_size)
                    io = KaitaiStream(BytesIO(self._raw__m_section_headers[i]))
                    self._m_section_headers[i] = self._root.EndianElf.SectionHeader(io, self, self._root, self._is_le)

            else:
                self._raw__m_section_headers = [None] * (self.qty_section_header)
                self._m_section_headers = [None] * (self.qty_section_header)
                for i in range(self.qty_section_header):
                    self._raw__m_section_headers[i] = self._io.read_bytes(self.section_header_entry_size)
                    io = KaitaiStream(BytesIO(self._raw__m_section_headers[i]))
                    self._m_section_headers[i] = self._root.EndianElf.SectionHeader(io, self, self._root, self._is_le)

            self._io.seek(_pos)
            return self._m_section_headers if hasattr(self, '_m_section_headers') else None

        @property
        def strings(self):
            if hasattr(self, '_m_strings'):
                return self._m_strings if hasattr(self, '_m_strings') else None

            _pos = self._io.pos()
            self._io.seek(self.section_headers[self.section_names_idx].offset)
            if self._is_le:
                self._raw__m_strings = self._io.read_bytes(self.section_headers[self.section_names_idx].size)
                io = KaitaiStream(BytesIO(self._raw__m_strings))
                self._m_strings = self._root.EndianElf.StringsStruct(io, self, self._root, self._is_le)
            else:
                self._raw__m_strings = self._io.read_bytes(self.section_headers[self.section_names_idx].size)
                io = KaitaiStream(BytesIO(self._raw__m_strings))
                self._m_strings = self._root.EndianElf.StringsStruct(io, self, self._root, self._is_le)
            self._io.seek(_pos)
            return self._m_strings if hasattr(self, '_m_strings') else None



