# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Elf(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=0f62fe0532
    
    
    .. seealso::
       Source - https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html
    
    
    .. seealso::
       Source - https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html
    """

    class Bits(IntEnum):
        b32 = 1
        b64 = 2

    class DynamicArrayTags(IntEnum):
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
        symtab_shndx = 34
        relrsz = 35
        relr = 36
        relrent = 37
        deprecated_sparc_register = 117440513
        sunw_auxiliary = 1610612749
        sunw_rtldinf = 1610612750
        sunw_filter = 1610612751
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
        sunw_symtab_shndx = 1610612764
        sunw_capchainent = 1610612765
        sunw_deferred = 1610612766
        sunw_capchainsz = 1610612767
        sunw_phname = 1610612768
        sunw_parent = 1610612769
        sunw_sx_aslr = 1610612771
        sunw_relax = 1610612773
        sunw_kmod = 1610612775
        sunw_sx_nxheap = 1610612777
        sunw_sx_nxstack = 1610612779
        sunw_sx_adiheap = 1610612781
        sunw_sx_adistack = 1610612783
        sunw_sx_ssbd = 1610612785
        sunw_symnsort = 1610612786
        sunw_symnsortsz = 1610612787
        gnu_flags_1 = 1879047668
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
        syminent = 1879047679
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
        syminfo = 1879047935
        versym = 1879048176
        relacount = 1879048185
        relcount = 1879048186
        flags_1 = 1879048187
        verdef = 1879048188
        verdefnum = 1879048189
        verneed = 1879048190
        verneednum = 1879048191
        sparc_register = 1879048193
        auxiliary = 2147483645
        used = 2147483646
        filter = 2147483647

    class Endian(IntEnum):
        le = 1
        be = 2

    class Machine(IntEnum):
        no_machine = 0
        m32 = 1
        sparc = 2
        x86 = 3
        m68k = 4
        m88k = 5
        iamcu = 6
        i860 = 7
        mips = 8
        s370 = 9
        mips_rs3_le = 10
        parisc = 15
        vpp500 = 17
        sparc32plus = 18
        i960 = 19
        powerpc = 20
        powerpc64 = 21
        s390 = 22
        spu = 23
        v800 = 36
        fr20 = 37
        rh32 = 38
        rce = 39
        arm = 40
        old_alpha = 41
        superh = 42
        sparc_v9 = 43
        tricore = 44
        arc = 45
        h8_300 = 46
        h8_300h = 47
        h8s = 48
        h8_500 = 49
        ia_64 = 50
        mips_x = 51
        coldfire = 52
        m68hc12 = 53
        mma = 54
        pcp = 55
        ncpu = 56
        ndr1 = 57
        starcore = 58
        me16 = 59
        st100 = 60
        tinyj = 61
        x86_64 = 62
        pdsp = 63
        pdp10 = 64
        pdp11 = 65
        fx66 = 66
        st9plus = 67
        st7 = 68
        mc68hc16 = 69
        mc68hc11 = 70
        mc68hc08 = 71
        mc68hc05 = 72
        svx = 73
        st19 = 74
        vax = 75
        cris = 76
        javelin = 77
        firepath = 78
        zsp = 79
        mmix = 80
        huany = 81
        prism = 82
        avr = 83
        fr30 = 84
        d10v = 85
        d30v = 86
        v850 = 87
        m32r = 88
        mn10300 = 89
        mn10200 = 90
        picojava = 91
        openrisc = 92
        arc_compact = 93
        xtensa = 94
        videocore = 95
        tmm_gpp = 96
        ns32k = 97
        tpc = 98
        snp1k = 99
        st200 = 100
        ip2k = 101
        max = 102
        compact_risc = 103
        f2mc16 = 104
        msp430 = 105
        blackfin = 106
        se_c33 = 107
        sep = 108
        arca = 109
        unicore = 110
        excess = 111
        dxp = 112
        altera_nios2 = 113
        crx = 114
        xgate = 115
        c166 = 116
        m16c = 117
        dspic30f = 118
        freescale_ce = 119
        m32c = 120
        tsk3000 = 131
        rs08 = 132
        sharc = 133
        ecog2 = 134
        score7 = 135
        dsp24 = 136
        videocore3 = 137
        latticemico32 = 138
        se_c17 = 139
        ti_c6000 = 140
        ti_c2000 = 141
        ti_c5500 = 142
        ti_arp32 = 143
        ti_pru = 144
        mmdsp_plus = 160
        cypress_m8c = 161
        r32c = 162
        trimedia = 163
        qdsp6 = 164
        i8051 = 165
        stxp7x = 166
        nds32 = 167
        ecog1x = 168
        maxq30 = 169
        ximo16 = 170
        manik = 171
        craynv2 = 172
        rx = 173
        metag = 174
        mcst_elbrus = 175
        ecog16 = 176
        cr16 = 177
        etpu = 178
        sle9x = 179
        l10m = 180
        k10m = 181
        aarch64 = 183
        avr32 = 185
        stm8 = 186
        tile64 = 187
        tilepro = 188
        microblaze = 189
        cuda = 190
        tilegx = 191
        cloudshield = 192
        corea_1st = 193
        corea_2nd = 194
        arcv2 = 195
        open8 = 196
        rl78 = 197
        videocore5 = 198
        renesas_78kor = 199
        freescale_56800ex = 200
        ba1 = 201
        ba2 = 202
        xcore = 203
        mchp_pic = 204
        intelgt = 205
        intel206 = 206
        intel207 = 207
        intel208 = 208
        intel209 = 209
        km32 = 210
        kmx32 = 211
        kmx16 = 212
        kmx8 = 213
        kvarc = 214
        cdp = 215
        coge = 216
        cool = 217
        norc = 218
        csr_kalimba = 219
        z80 = 220
        visium = 221
        ft32 = 222
        moxie = 223
        amd_gpu = 224
        riscv = 243
        lanai = 244
        ceva = 245
        ceva_x2 = 246
        bpf = 247
        graphcore_ipu = 248
        img1 = 249
        nfp = 250
        ve = 251
        csky = 252
        arc_compact3_64 = 253
        mcs6502 = 254
        arc_compact3 = 255
        kvx = 256
        wdc65816 = 257
        loongarch = 258
        kf32 = 259
        u16_u8core = 260
        tachyum = 261
        nxp_56800ef = 262
        avr_old = 4183
        msp430_old = 4185
        adapteva_epiphany = 4643
        mt = 9520
        cygnus_fr30 = 13104
        webassembly = 16727
        xc16x = 18056
        s12z = 19951
        cygnus_frv = 21569
        dlx = 23205
        cygnus_d10v = 30288
        cygnus_d30v = 30326
        ip2k_old = 33303
        cygnus_powerpc = 36901
        alpha = 36902
        cygnus_m32r = 36929
        cygnus_v850 = 36992
        s390_old = 41872
        xtensa_old = 43975
        xstormy16 = 44357
        microblaze_old = 47787
        cygnus_mn10300 = 48879
        cygnus_mn10200 = 57005
        cygnus_mep = 61453
        m32c_old = 65200
        iq2000 = 65210
        nios32 = 65211
        moxie_old = 65261

    class ObjType(IntEnum):
        no_file_type = 0
        relocatable = 1
        executable = 2
        shared = 3
        core = 4

    class OsAbi(IntEnum):
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

    class PhType(IntEnum):
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
        gnu_property = 1685382483
        pax_flags = 1694766464
        arm_exidx = 1879048193

    class SectionHeaderIdxSpecial(IntEnum):
        undefined = 0
        before = 65280
        after = 65281
        amd64_lcommon = 65282
        sunw_ignore = 65343
        abs = 65521
        common = 65522
        xindex = 65535

    class ShType(IntEnum):
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
        relr = 19
        sunw_symnsort = 1879048172
        sunw_phname = 1879048173
        sunw_ancillary = 1879048174
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
        arm_preemptmap = 1879048194
        arm_attributes = 1879048195
        arm_debugoverlay = 1879048196
        arm_overlaysection = 1879048197

    class SymbolBinding(IntEnum):
        local = 0
        global_symbol = 1
        weak = 2
        os10 = 10
        os11 = 11
        os12 = 12
        proc13 = 13
        proc14 = 14
        proc15 = 15

    class SymbolType(IntEnum):
        no_type = 0
        object = 1
        func = 2
        section = 3
        file = 4
        common = 5
        tls = 6
        relc = 8
        srelc = 9
        gnu_ifunc = 10
        os11 = 11
        os12 = 12
        proc13 = 13
        proc14 = 14
        proc15 = 15

    class SymbolVisibility(IntEnum):
        default = 0
        internal = 1
        hidden = 2
        protected = 3
        exported = 4
        singleton = 5
        eliminate = 6
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Elf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x7F\x45\x4C\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x7F\x45\x4C\x46", self.magic, self._io, u"/seq/0")
        self.bits = KaitaiStream.resolve_enum(Elf.Bits, self._io.read_u1())
        self.endian = KaitaiStream.resolve_enum(Elf.Endian, self._io.read_u1())
        self.ei_version = self._io.read_u1()
        if not self.ei_version == 1:
            raise kaitaistruct.ValidationNotEqualError(1, self.ei_version, self._io, u"/seq/3")
        self.abi = KaitaiStream.resolve_enum(Elf.OsAbi, self._io.read_u1())
        self.abi_version = self._io.read_u1()
        self.pad = self._io.read_bytes(7)
        if not self.pad == b"\x00\x00\x00\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00", self.pad, self._io, u"/seq/6")
        self.header = Elf.EndianElf(self._io, self, self._root)
        self.header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()


    def _write__seq(self, io=None):
        super(Elf, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u1(int(self.bits))
        self._io.write_u1(int(self.endian))
        self._io.write_u1(self.ei_version)
        self._io.write_u1(int(self.abi))
        self._io.write_u1(self.abi_version)
        self._io.write_bytes(self.pad)
        self.header._write__seq(self._io)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x7F\x45\x4C\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x7F\x45\x4C\x46", self.magic, None, u"/seq/0")
        if not self.ei_version == 1:
            raise kaitaistruct.ValidationNotEqualError(1, self.ei_version, None, u"/seq/3")
        if len(self.pad) != 7:
            raise kaitaistruct.ConsistencyError(u"pad", 7, len(self.pad))
        if not self.pad == b"\x00\x00\x00\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00", self.pad, None, u"/seq/6")
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        self._dirty = False

    class DtFlag1Values(ReadWriteKaitaiStruct):
        def __init__(self, value, _io=None, _parent=None, _root=None):
            super(Elf.DtFlag1Values, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.value = value

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Elf.DtFlag1Values, self)._write__seq(io)


        def _check(self):
            self._dirty = False

        @property
        def confalt(self):
            """Configuration alternative created."""
            if hasattr(self, '_m_confalt'):
                return self._m_confalt

            self._m_confalt = self.value & 8192 != 0
            return getattr(self, '_m_confalt', None)

        def _invalidate_confalt(self):
            del self._m_confalt
        @property
        def direct(self):
            """Direct binding enabled."""
            if hasattr(self, '_m_direct'):
                return self._m_direct

            self._m_direct = self.value & 256 != 0
            return getattr(self, '_m_direct', None)

        def _invalidate_direct(self):
            del self._m_direct
        @property
        def dispreldne(self):
            """Disp reloc applied at build time."""
            if hasattr(self, '_m_dispreldne'):
                return self._m_dispreldne

            self._m_dispreldne = self.value & 32768 != 0
            return getattr(self, '_m_dispreldne', None)

        def _invalidate_dispreldne(self):
            del self._m_dispreldne
        @property
        def disprelpnd(self):
            """Disp reloc applied at run-time."""
            if hasattr(self, '_m_disprelpnd'):
                return self._m_disprelpnd

            self._m_disprelpnd = self.value & 65536 != 0
            return getattr(self, '_m_disprelpnd', None)

        def _invalidate_disprelpnd(self):
            del self._m_disprelpnd
        @property
        def edited(self):
            """Object is modified after built."""
            if hasattr(self, '_m_edited'):
                return self._m_edited

            self._m_edited = self.value & 2097152 != 0
            return getattr(self, '_m_edited', None)

        def _invalidate_edited(self):
            del self._m_edited
        @property
        def endfiltee(self):
            """Filtee terminates filters search."""
            if hasattr(self, '_m_endfiltee'):
                return self._m_endfiltee

            self._m_endfiltee = self.value & 16384 != 0
            return getattr(self, '_m_endfiltee', None)

        def _invalidate_endfiltee(self):
            del self._m_endfiltee
        @property
        def globaudit(self):
            """Global auditing required."""
            if hasattr(self, '_m_globaudit'):
                return self._m_globaudit

            self._m_globaudit = self.value & 16777216 != 0
            return getattr(self, '_m_globaudit', None)

        def _invalidate_globaudit(self):
            del self._m_globaudit
        @property
        def group(self):
            """Set RTLD_GROUP for this object."""
            if hasattr(self, '_m_group'):
                return self._m_group

            self._m_group = self.value & 4 != 0
            return getattr(self, '_m_group', None)

        def _invalidate_group(self):
            del self._m_group
        @property
        def ignmuldef(self):
            if hasattr(self, '_m_ignmuldef'):
                return self._m_ignmuldef

            self._m_ignmuldef = self.value & 262144 != 0
            return getattr(self, '_m_ignmuldef', None)

        def _invalidate_ignmuldef(self):
            del self._m_ignmuldef
        @property
        def initfirst(self):
            """Set RTLD_INITFIRST for this object."""
            if hasattr(self, '_m_initfirst'):
                return self._m_initfirst

            self._m_initfirst = self.value & 32 != 0
            return getattr(self, '_m_initfirst', None)

        def _invalidate_initfirst(self):
            del self._m_initfirst
        @property
        def interpose(self):
            """Object is used to interpose."""
            if hasattr(self, '_m_interpose'):
                return self._m_interpose

            self._m_interpose = self.value & 1024 != 0
            return getattr(self, '_m_interpose', None)

        def _invalidate_interpose(self):
            del self._m_interpose
        @property
        def loadfltr(self):
            """Trigger filtee loading at runtime."""
            if hasattr(self, '_m_loadfltr'):
                return self._m_loadfltr

            self._m_loadfltr = self.value & 16 != 0
            return getattr(self, '_m_loadfltr', None)

        def _invalidate_loadfltr(self):
            del self._m_loadfltr
        @property
        def nodeflib(self):
            """Ignore default lib search path."""
            if hasattr(self, '_m_nodeflib'):
                return self._m_nodeflib

            self._m_nodeflib = self.value & 2048 != 0
            return getattr(self, '_m_nodeflib', None)

        def _invalidate_nodeflib(self):
            del self._m_nodeflib
        @property
        def nodelete(self):
            """Set RTLD_NODELETE for this object."""
            if hasattr(self, '_m_nodelete'):
                return self._m_nodelete

            self._m_nodelete = self.value & 8 != 0
            return getattr(self, '_m_nodelete', None)

        def _invalidate_nodelete(self):
            del self._m_nodelete
        @property
        def nodirect(self):
            """Object has no-direct binding."""
            if hasattr(self, '_m_nodirect'):
                return self._m_nodirect

            self._m_nodirect = self.value & 131072 != 0
            return getattr(self, '_m_nodirect', None)

        def _invalidate_nodirect(self):
            del self._m_nodirect
        @property
        def nodump(self):
            """Object can't be dldump'ed."""
            if hasattr(self, '_m_nodump'):
                return self._m_nodump

            self._m_nodump = self.value & 4096 != 0
            return getattr(self, '_m_nodump', None)

        def _invalidate_nodump(self):
            del self._m_nodump
        @property
        def nohdr(self):
            if hasattr(self, '_m_nohdr'):
                return self._m_nohdr

            self._m_nohdr = self.value & 1048576 != 0
            return getattr(self, '_m_nohdr', None)

        def _invalidate_nohdr(self):
            del self._m_nohdr
        @property
        def noksyms(self):
            if hasattr(self, '_m_noksyms'):
                return self._m_noksyms

            self._m_noksyms = self.value & 524288 != 0
            return getattr(self, '_m_noksyms', None)

        def _invalidate_noksyms(self):
            del self._m_noksyms
        @property
        def noopen(self):
            """Set RTLD_NOOPEN for this object."""
            if hasattr(self, '_m_noopen'):
                return self._m_noopen

            self._m_noopen = self.value & 64 != 0
            return getattr(self, '_m_noopen', None)

        def _invalidate_noopen(self):
            del self._m_noopen
        @property
        def noreloc(self):
            if hasattr(self, '_m_noreloc'):
                return self._m_noreloc

            self._m_noreloc = self.value & 4194304 != 0
            return getattr(self, '_m_noreloc', None)

        def _invalidate_noreloc(self):
            del self._m_noreloc
        @property
        def now(self):
            """Set RTLD_NOW for this object."""
            if hasattr(self, '_m_now'):
                return self._m_now

            self._m_now = self.value & 1 != 0
            return getattr(self, '_m_now', None)

        def _invalidate_now(self):
            del self._m_now
        @property
        def origin(self):
            """$ORIGIN must be handled."""
            if hasattr(self, '_m_origin'):
                return self._m_origin

            self._m_origin = self.value & 128 != 0
            return getattr(self, '_m_origin', None)

        def _invalidate_origin(self):
            del self._m_origin
        @property
        def pie(self):
            if hasattr(self, '_m_pie'):
                return self._m_pie

            self._m_pie = self.value & 134217728 != 0
            return getattr(self, '_m_pie', None)

        def _invalidate_pie(self):
            del self._m_pie
        @property
        def rtld_global(self):
            """Set RTLD_GLOBAL for this object."""
            if hasattr(self, '_m_rtld_global'):
                return self._m_rtld_global

            self._m_rtld_global = self.value & 2 != 0
            return getattr(self, '_m_rtld_global', None)

        def _invalidate_rtld_global(self):
            del self._m_rtld_global
        @property
        def singleton(self):
            """Singleton symbols are used."""
            if hasattr(self, '_m_singleton'):
                return self._m_singleton

            self._m_singleton = self.value & 33554432 != 0
            return getattr(self, '_m_singleton', None)

        def _invalidate_singleton(self):
            del self._m_singleton
        @property
        def stub(self):
            if hasattr(self, '_m_stub'):
                return self._m_stub

            self._m_stub = self.value & 67108864 != 0
            return getattr(self, '_m_stub', None)

        def _invalidate_stub(self):
            del self._m_stub
        @property
        def symintpose(self):
            """Object has individual interposers."""
            if hasattr(self, '_m_symintpose'):
                return self._m_symintpose

            self._m_symintpose = self.value & 8388608 != 0
            return getattr(self, '_m_symintpose', None)

        def _invalidate_symintpose(self):
            del self._m_symintpose
        @property
        def trans(self):
            if hasattr(self, '_m_trans'):
                return self._m_trans

            self._m_trans = self.value & 512 != 0
            return getattr(self, '_m_trans', None)

        def _invalidate_trans(self):
            del self._m_trans

    class DtFlagValues(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Figure 5-11: DT_FLAGS values - https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html
        
        
        .. seealso::
           Source - https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095
        
        
        .. seealso::
           Source - https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER7-TBL-5
        """
        def __init__(self, value, _io=None, _parent=None, _root=None):
            super(Elf.DtFlagValues, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.value = value

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Elf.DtFlagValues, self)._write__seq(io)


        def _check(self):
            self._dirty = False

        @property
        def bind_now(self):
            """all relocations for this object must be processed before returning
            control to the program
            """
            if hasattr(self, '_m_bind_now'):
                return self._m_bind_now

            self._m_bind_now = self.value & 8 != 0
            return getattr(self, '_m_bind_now', None)

        def _invalidate_bind_now(self):
            del self._m_bind_now
        @property
        def origin(self):
            """object may reference the $ORIGIN substitution string."""
            if hasattr(self, '_m_origin'):
                return self._m_origin

            self._m_origin = self.value & 1 != 0
            return getattr(self, '_m_origin', None)

        def _invalidate_origin(self):
            del self._m_origin
        @property
        def static_tls(self):
            """object uses static thread-local storage scheme."""
            if hasattr(self, '_m_static_tls'):
                return self._m_static_tls

            self._m_static_tls = self.value & 16 != 0
            return getattr(self, '_m_static_tls', None)

        def _invalidate_static_tls(self):
            del self._m_static_tls
        @property
        def symbolic(self):
            """symbolic linking."""
            if hasattr(self, '_m_symbolic'):
                return self._m_symbolic

            self._m_symbolic = self.value & 2 != 0
            return getattr(self, '_m_symbolic', None)

        def _invalidate_symbolic(self):
            del self._m_symbolic
        @property
        def textrel(self):
            """relocation entries might request modifications to a non-writable segment."""
            if hasattr(self, '_m_textrel'):
                return self._m_textrel

            self._m_textrel = self.value & 4 != 0
            return getattr(self, '_m_textrel', None)

        def _invalidate_textrel(self):
            del self._m_textrel

    class EndianElf(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Elf.EndianElf, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_program_headers = False
            self.program_headers__enabled = True
            self._should_write_section_headers = False
            self.section_headers__enabled = True
            self._should_write_section_names = False
            self.section_names__enabled = True

        def _read(self):
            _on = self._root.endian
            if _on == Elf.Endian.le:
                pass
                self._is_le = True
            elif _on == Elf.Endian.be:
                pass
                self._is_le = False
            if not hasattr(self, '_is_le'):
                raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf")
            elif self._is_le == True:
                self._read_le()
            elif self._is_le == False:
                self._read_be()
            self._dirty = False

        def _read_le(self):
            self.e_type = KaitaiStream.resolve_enum(Elf.ObjType, self._io.read_u2le())
            self.machine = KaitaiStream.resolve_enum(Elf.Machine, self._io.read_u2le())
            self.e_version = self._io.read_u4le()
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self.entry_point = self._io.read_u4le()
            elif _on == Elf.Bits.b64:
                pass
                self.entry_point = self._io.read_u8le()
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self.ofs_program_headers = self._io.read_u4le()
            elif _on == Elf.Bits.b64:
                pass
                self.ofs_program_headers = self._io.read_u8le()
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self.ofs_section_headers = self._io.read_u4le()
            elif _on == Elf.Bits.b64:
                pass
                self.ofs_section_headers = self._io.read_u8le()
            self.flags = self._io.read_bytes(4)
            self.e_ehsize = self._io.read_u2le()
            self.program_header_size = self._io.read_u2le()
            self.num_program_headers = self._io.read_u2le()
            self.section_header_size = self._io.read_u2le()
            self.num_section_headers = self._io.read_u2le()
            self.section_names_idx = self._io.read_u2le()
            self._dirty = False

        def _read_be(self):
            self.e_type = KaitaiStream.resolve_enum(Elf.ObjType, self._io.read_u2be())
            self.machine = KaitaiStream.resolve_enum(Elf.Machine, self._io.read_u2be())
            self.e_version = self._io.read_u4be()
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self.entry_point = self._io.read_u4be()
            elif _on == Elf.Bits.b64:
                pass
                self.entry_point = self._io.read_u8be()
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self.ofs_program_headers = self._io.read_u4be()
            elif _on == Elf.Bits.b64:
                pass
                self.ofs_program_headers = self._io.read_u8be()
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self.ofs_section_headers = self._io.read_u4be()
            elif _on == Elf.Bits.b64:
                pass
                self.ofs_section_headers = self._io.read_u8be()
            self.flags = self._io.read_bytes(4)
            self.e_ehsize = self._io.read_u2be()
            self.program_header_size = self._io.read_u2be()
            self.num_program_headers = self._io.read_u2be()
            self.section_header_size = self._io.read_u2be()
            self.num_section_headers = self._io.read_u2be()
            self.section_names_idx = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
            elif _on == Elf.Bits.b64:
                pass
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
            elif _on == Elf.Bits.b64:
                pass
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
            elif _on == Elf.Bits.b64:
                pass
            _ = self.program_headers
            if hasattr(self, '_m_program_headers'):
                pass
                for i in range(len(self._m_program_headers)):
                    pass
                    self._m_program_headers[i]._fetch_instances()


            _ = self.section_headers
            if hasattr(self, '_m_section_headers'):
                pass
                for i in range(len(self._m_section_headers)):
                    pass
                    self._m_section_headers[i]._fetch_instances()


            _ = self.section_names
            if hasattr(self, '_m_section_names'):
                pass
                self._m_section_names._fetch_instances()



        def _write__seq(self, io=None):
            super(Elf.EndianElf, self)._write__seq(io)
            if not hasattr(self, '_is_le'):
                raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf")
            elif self._is_le == True:
                self._write__seq_le()
            elif self._is_le == False:
                self._write__seq_be()


        def _write__seq_le(self):
            self._should_write_program_headers = self.program_headers__enabled
            self._should_write_section_headers = self.section_headers__enabled
            self._should_write_section_names = self.section_names__enabled
            self._io.write_u2le(int(self.e_type))
            self._io.write_u2le(int(self.machine))
            self._io.write_u4le(self.e_version)
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self._io.write_u4le(self.entry_point)
            elif _on == Elf.Bits.b64:
                pass
                self._io.write_u8le(self.entry_point)
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self._io.write_u4le(self.ofs_program_headers)
            elif _on == Elf.Bits.b64:
                pass
                self._io.write_u8le(self.ofs_program_headers)
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self._io.write_u4le(self.ofs_section_headers)
            elif _on == Elf.Bits.b64:
                pass
                self._io.write_u8le(self.ofs_section_headers)
            self._io.write_bytes(self.flags)
            self._io.write_u2le(self.e_ehsize)
            self._io.write_u2le(self.program_header_size)
            self._io.write_u2le(self.num_program_headers)
            self._io.write_u2le(self.section_header_size)
            self._io.write_u2le(self.num_section_headers)
            self._io.write_u2le(self.section_names_idx)


        def _write__seq_be(self):
            self._should_write_program_headers = self.program_headers__enabled
            self._should_write_section_headers = self.section_headers__enabled
            self._should_write_section_names = self.section_names__enabled
            self._io.write_u2be(int(self.e_type))
            self._io.write_u2be(int(self.machine))
            self._io.write_u4be(self.e_version)
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self._io.write_u4be(self.entry_point)
            elif _on == Elf.Bits.b64:
                pass
                self._io.write_u8be(self.entry_point)
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self._io.write_u4be(self.ofs_program_headers)
            elif _on == Elf.Bits.b64:
                pass
                self._io.write_u8be(self.ofs_program_headers)
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
                self._io.write_u4be(self.ofs_section_headers)
            elif _on == Elf.Bits.b64:
                pass
                self._io.write_u8be(self.ofs_section_headers)
            self._io.write_bytes(self.flags)
            self._io.write_u2be(self.e_ehsize)
            self._io.write_u2be(self.program_header_size)
            self._io.write_u2be(self.num_program_headers)
            self._io.write_u2be(self.section_header_size)
            self._io.write_u2be(self.num_section_headers)
            self._io.write_u2be(self.section_names_idx)


        def _check(self):
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
            elif _on == Elf.Bits.b64:
                pass
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
            elif _on == Elf.Bits.b64:
                pass
            _on = self._root.bits
            if _on == Elf.Bits.b32:
                pass
            elif _on == Elf.Bits.b64:
                pass
            if len(self.flags) != 4:
                raise kaitaistruct.ConsistencyError(u"flags", 4, len(self.flags))
            if self.program_headers__enabled:
                pass
                if len(self._m_program_headers) != self.num_program_headers:
                    raise kaitaistruct.ConsistencyError(u"program_headers", self.num_program_headers, len(self._m_program_headers))
                for i in range(len(self._m_program_headers)):
                    pass
                    if self._m_program_headers[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"program_headers", self._root, self._m_program_headers[i]._root)
                    if self._m_program_headers[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"program_headers", self, self._m_program_headers[i]._parent)


            if self.section_headers__enabled:
                pass
                if len(self._m_section_headers) != self.num_section_headers:
                    raise kaitaistruct.ConsistencyError(u"section_headers", self.num_section_headers, len(self._m_section_headers))
                for i in range(len(self._m_section_headers)):
                    pass
                    if self._m_section_headers[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"section_headers", self._root, self._m_section_headers[i]._root)
                    if self._m_section_headers[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"section_headers", self, self._m_section_headers[i]._parent)


            if self.section_names__enabled:
                pass
                if  ((self.section_names_idx != int(Elf.SectionHeaderIdxSpecial.undefined)) and (self.section_names_idx < self._root.header.num_section_headers)) :
                    pass
                    if self._m_section_names._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"section_names", self._root, self._m_section_names._root)
                    if self._m_section_names._parent != self:
                        raise kaitaistruct.ConsistencyError(u"section_names", self, self._m_section_names._parent)


            self._dirty = False

        class DynamicSection(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.DynamicSection, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/dynamic_section")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Elf.EndianElf.DynamicSectionEntry(self._io, self, self._root, self._is_le)
                    try:
                        _t_entries._read()
                    finally:
                        self.entries.append(_t_entries)
                    i += 1

                self._dirty = False

            def _read_be(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Elf.EndianElf.DynamicSectionEntry(self._io, self, self._root, self._is_le)
                    try:
                        _t_entries._read()
                    finally:
                        self.entries.append(_t_entries)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Elf.EndianElf.DynamicSection, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/dynamic_section")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self.entries[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _write__seq_be(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self.entries[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.entries)):
                    pass
                    if self.entries[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                    if self.entries[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

                self._dirty = False

            @property
            def is_string_table_linked(self):
                if hasattr(self, '_m_is_string_table_linked'):
                    return self._m_is_string_table_linked

                self._m_is_string_table_linked = self._parent.linked_section.type == Elf.ShType.strtab
                return getattr(self, '_m_is_string_table_linked', None)

            def _invalidate_is_string_table_linked(self):
                del self._m_is_string_table_linked

        class DynamicSectionEntry(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html
            
            
            .. seealso::
               Source - https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html#dynamic_section
            """
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.DynamicSectionEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self._should_write_flag_1_values = False
                self.flag_1_values__enabled = True
                self._should_write_flag_values = False
                self.flag_values__enabled = True
                self._should_write_value_str = False
                self.value_str__enabled = True

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/dynamic_section_entry")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.tag = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.tag = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.value_or_ptr = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.value_or_ptr = self._io.read_u8le()
                self._dirty = False

            def _read_be(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.tag = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.tag = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.value_or_ptr = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.value_or_ptr = self._io.read_u8be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _ = self.flag_1_values
                if hasattr(self, '_m_flag_1_values'):
                    pass
                    self._m_flag_1_values._fetch_instances()

                _ = self.flag_values
                if hasattr(self, '_m_flag_values'):
                    pass
                    self._m_flag_values._fetch_instances()

                _ = self.value_str
                if hasattr(self, '_m_value_str'):
                    pass



            def _write__seq(self, io=None):
                super(Elf.EndianElf.DynamicSectionEntry, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/dynamic_section_entry")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._should_write_flag_1_values = self.flag_1_values__enabled
                self._should_write_flag_values = self.flag_values__enabled
                self._should_write_value_str = self.value_str__enabled
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.tag)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.tag)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.value_or_ptr)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.value_or_ptr)


            def _write__seq_be(self):
                self._should_write_flag_1_values = self.flag_1_values__enabled
                self._should_write_flag_values = self.flag_values__enabled
                self._should_write_value_str = self.value_str__enabled
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.tag)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.tag)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.value_or_ptr)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.value_or_ptr)


            def _check(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                if self.flag_1_values__enabled:
                    pass
                    if self.tag_enum == Elf.DynamicArrayTags.flags_1:
                        pass
                        if self._m_flag_1_values._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"flag_1_values", self._root, self._m_flag_1_values._root)
                        if self._m_flag_1_values._parent != self:
                            raise kaitaistruct.ConsistencyError(u"flag_1_values", self, self._m_flag_1_values._parent)
                        if self._m_flag_1_values.value != self.value_or_ptr:
                            raise kaitaistruct.ConsistencyError(u"flag_1_values", self.value_or_ptr, self._m_flag_1_values.value)


                if self.flag_values__enabled:
                    pass
                    if self.tag_enum == Elf.DynamicArrayTags.flags:
                        pass
                        if self._m_flag_values._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"flag_values", self._root, self._m_flag_values._root)
                        if self._m_flag_values._parent != self:
                            raise kaitaistruct.ConsistencyError(u"flag_values", self, self._m_flag_values._parent)
                        if self._m_flag_values.value != self.value_or_ptr:
                            raise kaitaistruct.ConsistencyError(u"flag_values", self.value_or_ptr, self._m_flag_values.value)


                if self.value_str__enabled:
                    pass
                    if  ((self.is_value_str) and (self._parent.is_string_table_linked)) :
                        pass
                        if KaitaiStream.byte_array_index_of((self._m_value_str).encode(u"ASCII"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"value_str", -1, KaitaiStream.byte_array_index_of((self._m_value_str).encode(u"ASCII"), 0))


                self._dirty = False

            @property
            def flag_1_values(self):
                if self._should_write_flag_1_values:
                    self._write_flag_1_values()
                if hasattr(self, '_m_flag_1_values'):
                    return self._m_flag_1_values

                if not self.flag_1_values__enabled:
                    return None

                if self.tag_enum == Elf.DynamicArrayTags.flags_1:
                    pass
                    if self._is_le:
                        self._m_flag_1_values = Elf.DtFlag1Values(self.value_or_ptr, self._io, self, self._root)
                        self._m_flag_1_values._read()
                    else:
                        self._m_flag_1_values = Elf.DtFlag1Values(self.value_or_ptr, self._io, self, self._root)
                        self._m_flag_1_values._read()

                return getattr(self, '_m_flag_1_values', None)

            @flag_1_values.setter
            def flag_1_values(self, v):
                self._dirty = True
                self._m_flag_1_values = v

            def _write_flag_1_values(self):
                self._should_write_flag_1_values = False
                if self.tag_enum == Elf.DynamicArrayTags.flags_1:
                    pass
                    if self._is_le:
                        self._m_flag_1_values._write__seq(self._io)
                    else:
                        self._m_flag_1_values._write__seq(self._io)


            @property
            def flag_values(self):
                if self._should_write_flag_values:
                    self._write_flag_values()
                if hasattr(self, '_m_flag_values'):
                    return self._m_flag_values

                if not self.flag_values__enabled:
                    return None

                if self.tag_enum == Elf.DynamicArrayTags.flags:
                    pass
                    if self._is_le:
                        self._m_flag_values = Elf.DtFlagValues(self.value_or_ptr, self._io, self, self._root)
                        self._m_flag_values._read()
                    else:
                        self._m_flag_values = Elf.DtFlagValues(self.value_or_ptr, self._io, self, self._root)
                        self._m_flag_values._read()

                return getattr(self, '_m_flag_values', None)

            @flag_values.setter
            def flag_values(self, v):
                self._dirty = True
                self._m_flag_values = v

            def _write_flag_values(self):
                self._should_write_flag_values = False
                if self.tag_enum == Elf.DynamicArrayTags.flags:
                    pass
                    if self._is_le:
                        self._m_flag_values._write__seq(self._io)
                    else:
                        self._m_flag_values._write__seq(self._io)


            @property
            def is_value_str(self):
                if hasattr(self, '_m_is_value_str'):
                    return self._m_is_value_str

                self._m_is_value_str =  ((self.value_or_ptr != 0) and ( ((self.tag_enum == Elf.DynamicArrayTags.needed) or (self.tag_enum == Elf.DynamicArrayTags.soname) or (self.tag_enum == Elf.DynamicArrayTags.rpath) or (self.tag_enum == Elf.DynamicArrayTags.runpath) or (self.tag_enum == Elf.DynamicArrayTags.sunw_auxiliary) or (self.tag_enum == Elf.DynamicArrayTags.sunw_filter) or (self.tag_enum == Elf.DynamicArrayTags.auxiliary) or (self.tag_enum == Elf.DynamicArrayTags.filter) or (self.tag_enum == Elf.DynamicArrayTags.config) or (self.tag_enum == Elf.DynamicArrayTags.depaudit) or (self.tag_enum == Elf.DynamicArrayTags.audit)) )) 
                return getattr(self, '_m_is_value_str', None)

            def _invalidate_is_value_str(self):
                del self._m_is_value_str
            @property
            def tag_enum(self):
                if hasattr(self, '_m_tag_enum'):
                    return self._m_tag_enum

                self._m_tag_enum = KaitaiStream.resolve_enum(Elf.DynamicArrayTags, self.tag)
                return getattr(self, '_m_tag_enum', None)

            def _invalidate_tag_enum(self):
                del self._m_tag_enum
            @property
            def value_str(self):
                if self._should_write_value_str:
                    self._write_value_str()
                if hasattr(self, '_m_value_str'):
                    return self._m_value_str

                if not self.value_str__enabled:
                    return None

                if  ((self.is_value_str) and (self._parent.is_string_table_linked)) :
                    pass
                    io = self._parent._parent.linked_section.body._io
                    _pos = io.pos()
                    io.seek(self.value_or_ptr)
                    if self._is_le:
                        self._m_value_str = (io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                    else:
                        self._m_value_str = (io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                    io.seek(_pos)

                return getattr(self, '_m_value_str', None)

            @value_str.setter
            def value_str(self, v):
                self._dirty = True
                self._m_value_str = v

            def _write_value_str(self):
                self._should_write_value_str = False
                if  ((self.is_value_str) and (self._parent.is_string_table_linked)) :
                    pass
                    io = self._parent._parent.linked_section.body._io
                    _pos = io.pos()
                    io.seek(self.value_or_ptr)
                    if self._is_le:
                        io.write_bytes((self._m_value_str).encode(u"ASCII"))
                        io.write_u1(0)
                    else:
                        io.write_bytes((self._m_value_str).encode(u"ASCII"))
                        io.write_u1(0)
                    io.seek(_pos)



        class DynsymSection(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.DynsymSection, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/dynsym_section")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Elf.EndianElf.DynsymSectionEntry(self._io, self, self._root, self._is_le)
                    try:
                        _t_entries._read()
                    finally:
                        self.entries.append(_t_entries)
                    i += 1

                self._dirty = False

            def _read_be(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Elf.EndianElf.DynsymSectionEntry(self._io, self, self._root, self._is_le)
                    try:
                        _t_entries._read()
                    finally:
                        self.entries.append(_t_entries)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Elf.EndianElf.DynsymSection, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/dynsym_section")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self.entries[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _write__seq_be(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self.entries[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.entries)):
                    pass
                    if self.entries[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                    if self.entries[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

                self._dirty = False

            @property
            def is_string_table_linked(self):
                if hasattr(self, '_m_is_string_table_linked'):
                    return self._m_is_string_table_linked

                self._m_is_string_table_linked = self._parent.linked_section.type == Elf.ShType.strtab
                return getattr(self, '_m_is_string_table_linked', None)

            def _invalidate_is_string_table_linked(self):
                del self._m_is_string_table_linked

        class DynsymSectionEntry(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html
            
            
            .. seealso::
               Source - https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.symtab.html
            """
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.DynsymSectionEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self._should_write_name = False
                self.name__enabled = True

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/dynsym_section_entry")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.ofs_name = self._io.read_u4le()
                if self._root.bits == Elf.Bits.b32:
                    pass
                    self.value_b32 = self._io.read_u4le()

                if self._root.bits == Elf.Bits.b32:
                    pass
                    self.size_b32 = self._io.read_u4le()

                self.bind = KaitaiStream.resolve_enum(Elf.SymbolBinding, self._io.read_bits_int_be(4))
                self.type = KaitaiStream.resolve_enum(Elf.SymbolType, self._io.read_bits_int_be(4))
                self.other = self._io.read_u1()
                self.sh_idx = self._io.read_u2le()
                if self._root.bits == Elf.Bits.b64:
                    pass
                    self.value_b64 = self._io.read_u8le()

                if self._root.bits == Elf.Bits.b64:
                    pass
                    self.size_b64 = self._io.read_u8le()

                self._dirty = False

            def _read_be(self):
                self.ofs_name = self._io.read_u4be()
                if self._root.bits == Elf.Bits.b32:
                    pass
                    self.value_b32 = self._io.read_u4be()

                if self._root.bits == Elf.Bits.b32:
                    pass
                    self.size_b32 = self._io.read_u4be()

                self.bind = KaitaiStream.resolve_enum(Elf.SymbolBinding, self._io.read_bits_int_be(4))
                self.type = KaitaiStream.resolve_enum(Elf.SymbolType, self._io.read_bits_int_be(4))
                self.other = self._io.read_u1()
                self.sh_idx = self._io.read_u2be()
                if self._root.bits == Elf.Bits.b64:
                    pass
                    self.value_b64 = self._io.read_u8be()

                if self._root.bits == Elf.Bits.b64:
                    pass
                    self.size_b64 = self._io.read_u8be()

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self._root.bits == Elf.Bits.b32:
                    pass

                if self._root.bits == Elf.Bits.b32:
                    pass

                if self._root.bits == Elf.Bits.b64:
                    pass

                if self._root.bits == Elf.Bits.b64:
                    pass

                _ = self.name
                if hasattr(self, '_m_name'):
                    pass



            def _write__seq(self, io=None):
                super(Elf.EndianElf.DynsymSectionEntry, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/dynsym_section_entry")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._should_write_name = self.name__enabled
                self._io.write_u4le(self.ofs_name)
                if self._root.bits == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.value_b32)

                if self._root.bits == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.size_b32)

                self._io.write_bits_int_be(4, int(self.bind))
                self._io.write_bits_int_be(4, int(self.type))
                self._io.write_u1(self.other)
                self._io.write_u2le(self.sh_idx)
                if self._root.bits == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.value_b64)

                if self._root.bits == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.size_b64)



            def _write__seq_be(self):
                self._should_write_name = self.name__enabled
                self._io.write_u4be(self.ofs_name)
                if self._root.bits == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.value_b32)

                if self._root.bits == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.size_b32)

                self._io.write_bits_int_be(4, int(self.bind))
                self._io.write_bits_int_be(4, int(self.type))
                self._io.write_u1(self.other)
                self._io.write_u2be(self.sh_idx)
                if self._root.bits == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.value_b64)

                if self._root.bits == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.size_b64)



            def _check(self):
                if self._root.bits == Elf.Bits.b32:
                    pass

                if self._root.bits == Elf.Bits.b32:
                    pass

                if self._root.bits == Elf.Bits.b64:
                    pass

                if self._root.bits == Elf.Bits.b64:
                    pass

                if self.name__enabled:
                    pass
                    if  ((self.ofs_name != 0) and (self._parent.is_string_table_linked)) :
                        pass
                        if KaitaiStream.byte_array_index_of((self._m_name).encode(u"UTF-8"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self._m_name).encode(u"UTF-8"), 0))


                self._dirty = False

            @property
            def is_sh_idx_os(self):
                if hasattr(self, '_m_is_sh_idx_os'):
                    return self._m_is_sh_idx_os

                self._m_is_sh_idx_os =  ((self.sh_idx >= self._root.sh_idx_lo_os) and (self.sh_idx <= self._root.sh_idx_hi_os)) 
                return getattr(self, '_m_is_sh_idx_os', None)

            def _invalidate_is_sh_idx_os(self):
                del self._m_is_sh_idx_os
            @property
            def is_sh_idx_proc(self):
                if hasattr(self, '_m_is_sh_idx_proc'):
                    return self._m_is_sh_idx_proc

                self._m_is_sh_idx_proc =  ((self.sh_idx >= self._root.sh_idx_lo_proc) and (self.sh_idx <= self._root.sh_idx_hi_proc)) 
                return getattr(self, '_m_is_sh_idx_proc', None)

            def _invalidate_is_sh_idx_proc(self):
                del self._m_is_sh_idx_proc
            @property
            def is_sh_idx_reserved(self):
                if hasattr(self, '_m_is_sh_idx_reserved'):
                    return self._m_is_sh_idx_reserved

                self._m_is_sh_idx_reserved =  ((self.sh_idx >= self._root.sh_idx_lo_reserved) and (self.sh_idx <= self._root.sh_idx_hi_reserved)) 
                return getattr(self, '_m_is_sh_idx_reserved', None)

            def _invalidate_is_sh_idx_reserved(self):
                del self._m_is_sh_idx_reserved
            @property
            def name(self):
                if self._should_write_name:
                    self._write_name()
                if hasattr(self, '_m_name'):
                    return self._m_name

                if not self.name__enabled:
                    return None

                if  ((self.ofs_name != 0) and (self._parent.is_string_table_linked)) :
                    pass
                    io = self._parent._parent.linked_section.body._io
                    _pos = io.pos()
                    io.seek(self.ofs_name)
                    if self._is_le:
                        self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                    else:
                        self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                    io.seek(_pos)

                return getattr(self, '_m_name', None)

            @name.setter
            def name(self, v):
                self._dirty = True
                self._m_name = v

            def _write_name(self):
                self._should_write_name = False
                if  ((self.ofs_name != 0) and (self._parent.is_string_table_linked)) :
                    pass
                    io = self._parent._parent.linked_section.body._io
                    _pos = io.pos()
                    io.seek(self.ofs_name)
                    if self._is_le:
                        io.write_bytes((self._m_name).encode(u"UTF-8"))
                        io.write_u1(0)
                    else:
                        io.write_bytes((self._m_name).encode(u"UTF-8"))
                        io.write_u1(0)
                    io.seek(_pos)


            @property
            def sh_idx_special(self):
                if hasattr(self, '_m_sh_idx_special'):
                    return self._m_sh_idx_special

                self._m_sh_idx_special = KaitaiStream.resolve_enum(Elf.SectionHeaderIdxSpecial, self.sh_idx)
                return getattr(self, '_m_sh_idx_special', None)

            def _invalidate_sh_idx_special(self):
                del self._m_sh_idx_special
            @property
            def size(self):
                if hasattr(self, '_m_size'):
                    return self._m_size

                self._m_size = (self.size_b32 if self._root.bits == Elf.Bits.b32 else (self.size_b64 if self._root.bits == Elf.Bits.b64 else 0))
                return getattr(self, '_m_size', None)

            def _invalidate_size(self):
                del self._m_size
            @property
            def value(self):
                if hasattr(self, '_m_value'):
                    return self._m_value

                self._m_value = (self.value_b32 if self._root.bits == Elf.Bits.b32 else (self.value_b64 if self._root.bits == Elf.Bits.b64 else 0))
                return getattr(self, '_m_value', None)

            def _invalidate_value(self):
                del self._m_value
            @property
            def visibility(self):
                if hasattr(self, '_m_visibility'):
                    return self._m_visibility

                self._m_visibility = KaitaiStream.resolve_enum(Elf.SymbolVisibility, self.other & 3)
                return getattr(self, '_m_visibility', None)

            def _invalidate_visibility(self):
                del self._m_visibility

        class NoteSection(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.NoteSection, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/note_section")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Elf.EndianElf.NoteSectionEntry(self._io, self, self._root, self._is_le)
                    try:
                        _t_entries._read()
                    finally:
                        self.entries.append(_t_entries)
                    i += 1

                self._dirty = False

            def _read_be(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Elf.EndianElf.NoteSectionEntry(self._io, self, self._root, self._is_le)
                    try:
                        _t_entries._read()
                    finally:
                        self.entries.append(_t_entries)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Elf.EndianElf.NoteSection, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/note_section")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self.entries[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _write__seq_be(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self.entries[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.entries)):
                    pass
                    if self.entries[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                    if self.entries[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

                self._dirty = False


        class NoteSectionEntry(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/note-section.html
            
            
            .. seealso::
               Source - https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section
            """
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.NoteSectionEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/note_section_entry")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.len_name = self._io.read_u4le()
                self.len_descriptor = self._io.read_u4le()
                self.type = self._io.read_u4le()
                self.name = KaitaiStream.bytes_terminate(self._io.read_bytes(self.len_name), 0, False)
                self.name_padding = self._io.read_bytes(-(self.len_name) % 4)
                self.descriptor = self._io.read_bytes(self.len_descriptor)
                self.descriptor_padding = self._io.read_bytes(-(self.len_descriptor) % 4)
                self._dirty = False

            def _read_be(self):
                self.len_name = self._io.read_u4be()
                self.len_descriptor = self._io.read_u4be()
                self.type = self._io.read_u4be()
                self.name = KaitaiStream.bytes_terminate(self._io.read_bytes(self.len_name), 0, False)
                self.name_padding = self._io.read_bytes(-(self.len_name) % 4)
                self.descriptor = self._io.read_bytes(self.len_descriptor)
                self.descriptor_padding = self._io.read_bytes(-(self.len_descriptor) % 4)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Elf.EndianElf.NoteSectionEntry, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/note_section_entry")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._io.write_u4le(self.len_name)
                self._io.write_u4le(self.len_descriptor)
                self._io.write_u4le(self.type)
                self._io.write_bytes_limit(self.name, self.len_name, 0, 0)
                self._io.write_bytes(self.name_padding)
                self._io.write_bytes(self.descriptor)
                self._io.write_bytes(self.descriptor_padding)


            def _write__seq_be(self):
                self._io.write_u4be(self.len_name)
                self._io.write_u4be(self.len_descriptor)
                self._io.write_u4be(self.type)
                self._io.write_bytes_limit(self.name, self.len_name, 0, 0)
                self._io.write_bytes(self.name_padding)
                self._io.write_bytes(self.descriptor)
                self._io.write_bytes(self.descriptor_padding)


            def _check(self):
                if len(self.name) > self.len_name:
                    raise kaitaistruct.ConsistencyError(u"name", self.len_name, len(self.name))
                if KaitaiStream.byte_array_index_of(self.name, 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of(self.name, 0))
                if len(self.name_padding) != -(self.len_name) % 4:
                    raise kaitaistruct.ConsistencyError(u"name_padding", -(self.len_name) % 4, len(self.name_padding))
                if len(self.descriptor) != self.len_descriptor:
                    raise kaitaistruct.ConsistencyError(u"descriptor", self.len_descriptor, len(self.descriptor))
                if len(self.descriptor_padding) != -(self.len_descriptor) % 4:
                    raise kaitaistruct.ConsistencyError(u"descriptor_padding", -(self.len_descriptor) % 4, len(self.descriptor_padding))
                self._dirty = False


        class ProgramHeader(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.ProgramHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self._should_write_flags_obj = False
                self.flags_obj__enabled = True

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/program_header")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.type = KaitaiStream.resolve_enum(Elf.PhType, self._io.read_u4le())
                if self._root.bits == Elf.Bits.b64:
                    pass
                    self.flags64 = self._io.read_u4le()

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.offset = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.offset = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.vaddr = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.vaddr = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.paddr = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.paddr = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.filesz = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.filesz = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.memsz = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.memsz = self._io.read_u8le()
                if self._root.bits == Elf.Bits.b32:
                    pass
                    self.flags32 = self._io.read_u4le()

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.align = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.align = self._io.read_u8le()
                self._dirty = False

            def _read_be(self):
                self.type = KaitaiStream.resolve_enum(Elf.PhType, self._io.read_u4be())
                if self._root.bits == Elf.Bits.b64:
                    pass
                    self.flags64 = self._io.read_u4be()

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.offset = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.offset = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.vaddr = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.vaddr = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.paddr = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.paddr = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.filesz = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.filesz = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.memsz = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.memsz = self._io.read_u8be()
                if self._root.bits == Elf.Bits.b32:
                    pass
                    self.flags32 = self._io.read_u4be()

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.align = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.align = self._io.read_u8be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                if self._root.bits == Elf.Bits.b64:
                    pass

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                if self._root.bits == Elf.Bits.b32:
                    pass

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _ = self.flags_obj
                if hasattr(self, '_m_flags_obj'):
                    pass
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self._m_flags_obj._fetch_instances()
                    elif _on == Elf.Bits.b64:
                        pass
                        self._m_flags_obj._fetch_instances()



            def _write__seq(self, io=None):
                super(Elf.EndianElf.ProgramHeader, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/program_header")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._should_write_flags_obj = self.flags_obj__enabled
                self._io.write_u4le(int(self.type))
                if self._root.bits == Elf.Bits.b64:
                    pass
                    self._io.write_u4le(self.flags64)

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.offset)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.offset)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.vaddr)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.vaddr)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.paddr)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.paddr)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.filesz)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.filesz)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.memsz)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.memsz)
                if self._root.bits == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.flags32)

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.align)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.align)


            def _write__seq_be(self):
                self._should_write_flags_obj = self.flags_obj__enabled
                self._io.write_u4be(int(self.type))
                if self._root.bits == Elf.Bits.b64:
                    pass
                    self._io.write_u4be(self.flags64)

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.offset)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.offset)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.vaddr)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.vaddr)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.paddr)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.paddr)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.filesz)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.filesz)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.memsz)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.memsz)
                if self._root.bits == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.flags32)

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.align)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.align)


            def _check(self):
                if self._root.bits == Elf.Bits.b64:
                    pass

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                if self._root.bits == Elf.Bits.b32:
                    pass

                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                if self.flags_obj__enabled:
                    pass
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        if self._m_flags_obj._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"flags_obj", self._root, self._m_flags_obj._root)
                        if self._m_flags_obj._parent != self:
                            raise kaitaistruct.ConsistencyError(u"flags_obj", self, self._m_flags_obj._parent)
                        if self._m_flags_obj.value != self.flags32:
                            raise kaitaistruct.ConsistencyError(u"flags_obj", self.flags32, self._m_flags_obj.value)
                    elif _on == Elf.Bits.b64:
                        pass
                        if self._m_flags_obj._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"flags_obj", self._root, self._m_flags_obj._root)
                        if self._m_flags_obj._parent != self:
                            raise kaitaistruct.ConsistencyError(u"flags_obj", self, self._m_flags_obj._parent)
                        if self._m_flags_obj.value != self.flags64:
                            raise kaitaistruct.ConsistencyError(u"flags_obj", self.flags64, self._m_flags_obj.value)

                self._dirty = False

            @property
            def flags_obj(self):
                if self._should_write_flags_obj:
                    self._write_flags_obj()
                if hasattr(self, '_m_flags_obj'):
                    return self._m_flags_obj

                if not self.flags_obj__enabled:
                    return None

                if self._is_le:
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self._m_flags_obj = Elf.PhdrTypeFlags(self.flags32, self._io, self, self._root)
                        self._m_flags_obj._read()
                    elif _on == Elf.Bits.b64:
                        pass
                        self._m_flags_obj = Elf.PhdrTypeFlags(self.flags64, self._io, self, self._root)
                        self._m_flags_obj._read()
                else:
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self._m_flags_obj = Elf.PhdrTypeFlags(self.flags32, self._io, self, self._root)
                        self._m_flags_obj._read()
                    elif _on == Elf.Bits.b64:
                        pass
                        self._m_flags_obj = Elf.PhdrTypeFlags(self.flags64, self._io, self, self._root)
                        self._m_flags_obj._read()
                return getattr(self, '_m_flags_obj', None)

            @flags_obj.setter
            def flags_obj(self, v):
                self._dirty = True
                self._m_flags_obj = v

            def _write_flags_obj(self):
                self._should_write_flags_obj = False
                if self._is_le:
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self._m_flags_obj._write__seq(self._io)
                    elif _on == Elf.Bits.b64:
                        pass
                        self._m_flags_obj._write__seq(self._io)
                else:
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self._m_flags_obj._write__seq(self._io)
                    elif _on == Elf.Bits.b64:
                        pass
                        self._m_flags_obj._write__seq(self._io)


        class RelocationSection(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/relocation-sections.html
            
            
            .. seealso::
               Source - https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html
            """
            def __init__(self, has_addend, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.RelocationSection, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self.has_addend = has_addend

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/relocation_section")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Elf.EndianElf.RelocationSectionEntry(self._io, self, self._root, self._is_le)
                    try:
                        _t_entries._read()
                    finally:
                        self.entries.append(_t_entries)
                    i += 1

                self._dirty = False

            def _read_be(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Elf.EndianElf.RelocationSectionEntry(self._io, self, self._root, self._is_le)
                    try:
                        _t_entries._read()
                    finally:
                        self.entries.append(_t_entries)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Elf.EndianElf.RelocationSection, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/relocation_section")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self.entries[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _write__seq_be(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self.entries[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.entries)):
                    pass
                    if self.entries[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                    if self.entries[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

                self._dirty = False


        class RelocationSectionEntry(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.RelocationSectionEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/relocation_section_entry")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.offset = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.offset = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.info = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.info = self._io.read_u8le()
                if self._parent.has_addend:
                    pass
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self.addend = self._io.read_s4le()
                    elif _on == Elf.Bits.b64:
                        pass
                        self.addend = self._io.read_s8le()

                self._dirty = False

            def _read_be(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.offset = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.offset = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.info = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.info = self._io.read_u8be()
                if self._parent.has_addend:
                    pass
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self.addend = self._io.read_s4be()
                    elif _on == Elf.Bits.b64:
                        pass
                        self.addend = self._io.read_s8be()

                self._dirty = False


            def _fetch_instances(self):
                pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                if self._parent.has_addend:
                    pass
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                    elif _on == Elf.Bits.b64:
                        pass



            def _write__seq(self, io=None):
                super(Elf.EndianElf.RelocationSectionEntry, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/relocation_section_entry")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.offset)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.offset)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.info)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.info)
                if self._parent.has_addend:
                    pass
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self._io.write_s4le(self.addend)
                    elif _on == Elf.Bits.b64:
                        pass
                        self._io.write_s8le(self.addend)



            def _write__seq_be(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.offset)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.offset)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.info)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.info)
                if self._parent.has_addend:
                    pass
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                        self._io.write_s4be(self.addend)
                    elif _on == Elf.Bits.b64:
                        pass
                        self._io.write_s8be(self.addend)



            def _check(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                if self._parent.has_addend:
                    pass
                    _on = self._root.bits
                    if _on == Elf.Bits.b32:
                        pass
                    elif _on == Elf.Bits.b64:
                        pass

                self._dirty = False


        class SectionHeader(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.SectionHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le
                self._should_write_body = False
                self.body__enabled = True
                self._should_write_flags_obj = False
                self.flags_obj__enabled = True
                self._should_write_name = False
                self.name__enabled = True

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/section_header")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.ofs_name = self._io.read_u4le()
                self.type = KaitaiStream.resolve_enum(Elf.ShType, self._io.read_u4le())
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.flags = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.flags = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.addr = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.addr = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.ofs_body = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.ofs_body = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.len_body = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.len_body = self._io.read_u8le()
                self.linked_section_idx = self._io.read_u4le()
                self.info = self._io.read_bytes(4)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.align = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.align = self._io.read_u8le()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.entry_size = self._io.read_u4le()
                elif _on == Elf.Bits.b64:
                    pass
                    self.entry_size = self._io.read_u8le()
                self._dirty = False

            def _read_be(self):
                self.ofs_name = self._io.read_u4be()
                self.type = KaitaiStream.resolve_enum(Elf.ShType, self._io.read_u4be())
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.flags = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.flags = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.addr = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.addr = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.ofs_body = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.ofs_body = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.len_body = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.len_body = self._io.read_u8be()
                self.linked_section_idx = self._io.read_u4be()
                self.info = self._io.read_bytes(4)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.align = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.align = self._io.read_u8be()
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self.entry_size = self._io.read_u4be()
                elif _on == Elf.Bits.b64:
                    pass
                    self.entry_size = self._io.read_u8be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _ = self.body
                if hasattr(self, '_m_body'):
                    pass
                    _on = self.type
                    if _on == Elf.ShType.dynamic:
                        pass
                        self._m_body._fetch_instances()
                    elif _on == Elf.ShType.dynsym:
                        pass
                        self._m_body._fetch_instances()
                    elif _on == Elf.ShType.note:
                        pass
                        self._m_body._fetch_instances()
                    elif _on == Elf.ShType.rel:
                        pass
                        self._m_body._fetch_instances()
                    elif _on == Elf.ShType.rela:
                        pass
                        self._m_body._fetch_instances()
                    elif _on == Elf.ShType.strtab:
                        pass
                        self._m_body._fetch_instances()
                    elif _on == Elf.ShType.symtab:
                        pass
                        self._m_body._fetch_instances()
                    else:
                        pass

                _ = self.flags_obj
                if hasattr(self, '_m_flags_obj'):
                    pass
                    self._m_flags_obj._fetch_instances()

                _ = self.name
                if hasattr(self, '_m_name'):
                    pass



            def _write__seq(self, io=None):
                super(Elf.EndianElf.SectionHeader, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/section_header")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                self._should_write_body = self.body__enabled
                self._should_write_flags_obj = self.flags_obj__enabled
                self._should_write_name = self.name__enabled
                self._io.write_u4le(self.ofs_name)
                self._io.write_u4le(int(self.type))
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.flags)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.flags)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.addr)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.addr)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.ofs_body)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.ofs_body)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.len_body)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.len_body)
                self._io.write_u4le(self.linked_section_idx)
                self._io.write_bytes(self.info)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.align)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.align)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4le(self.entry_size)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8le(self.entry_size)


            def _write__seq_be(self):
                self._should_write_body = self.body__enabled
                self._should_write_flags_obj = self.flags_obj__enabled
                self._should_write_name = self.name__enabled
                self._io.write_u4be(self.ofs_name)
                self._io.write_u4be(int(self.type))
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.flags)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.flags)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.addr)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.addr)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.ofs_body)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.ofs_body)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.len_body)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.len_body)
                self._io.write_u4be(self.linked_section_idx)
                self._io.write_bytes(self.info)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.align)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.align)
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                    self._io.write_u4be(self.entry_size)
                elif _on == Elf.Bits.b64:
                    pass
                    self._io.write_u8be(self.entry_size)


            def _check(self):
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                if len(self.info) != 4:
                    raise kaitaistruct.ConsistencyError(u"info", 4, len(self.info))
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                _on = self._root.bits
                if _on == Elf.Bits.b32:
                    pass
                elif _on == Elf.Bits.b64:
                    pass
                if self.body__enabled:
                    pass
                    if self.type != Elf.ShType.nobits:
                        pass
                        _on = self.type
                        if _on == Elf.ShType.dynamic:
                            pass
                            if self._m_body._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                            if self._m_body._parent != self:
                                raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                        elif _on == Elf.ShType.dynsym:
                            pass
                            if self._m_body._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                            if self._m_body._parent != self:
                                raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                        elif _on == Elf.ShType.note:
                            pass
                            if self._m_body._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                            if self._m_body._parent != self:
                                raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                        elif _on == Elf.ShType.rel:
                            pass
                            if self._m_body._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                            if self._m_body._parent != self:
                                raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                            if self._m_body.has_addend != False:
                                raise kaitaistruct.ConsistencyError(u"body", False, self._m_body.has_addend)
                        elif _on == Elf.ShType.rela:
                            pass
                            if self._m_body._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                            if self._m_body._parent != self:
                                raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                            if self._m_body.has_addend != True:
                                raise kaitaistruct.ConsistencyError(u"body", True, self._m_body.has_addend)
                        elif _on == Elf.ShType.strtab:
                            pass
                            if self._m_body._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                            if self._m_body._parent != self:
                                raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                        elif _on == Elf.ShType.symtab:
                            pass
                            if self._m_body._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                            if self._m_body._parent != self:
                                raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                        else:
                            pass
                            if len(self._m_body) != self.len_body:
                                raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self._m_body))


                if self.flags_obj__enabled:
                    pass
                    if self._m_flags_obj._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"flags_obj", self._root, self._m_flags_obj._root)
                    if self._m_flags_obj._parent != self:
                        raise kaitaistruct.ConsistencyError(u"flags_obj", self, self._m_flags_obj._parent)
                    if self._m_flags_obj.value != self.flags:
                        raise kaitaistruct.ConsistencyError(u"flags_obj", self.flags, self._m_flags_obj.value)

                if self.name__enabled:
                    pass
                    if KaitaiStream.byte_array_index_of((self._m_name).encode(u"ASCII"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self._m_name).encode(u"ASCII"), 0))

                self._dirty = False

            @property
            def body(self):
                if self._should_write_body:
                    self._write_body()
                if hasattr(self, '_m_body'):
                    return self._m_body

                if not self.body__enabled:
                    return None

                if self.type != Elf.ShType.nobits:
                    pass
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.ofs_body)
                    if self._is_le:
                        _on = self.type
                        if _on == Elf.ShType.dynamic:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.DynamicSection(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.dynsym:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.DynsymSection(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.note:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.NoteSection(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.rel:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.RelocationSection(False, _io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.rela:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.RelocationSection(True, _io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.strtab:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.StringsStruct(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.symtab:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.DynsymSection(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        else:
                            pass
                            self._m_body = io.read_bytes(self.len_body)
                    else:
                        _on = self.type
                        if _on == Elf.ShType.dynamic:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.DynamicSection(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.dynsym:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.DynsymSection(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.note:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.NoteSection(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.rel:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.RelocationSection(False, _io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.rela:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.RelocationSection(True, _io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.strtab:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.StringsStruct(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        elif _on == Elf.ShType.symtab:
                            pass
                            self._raw__m_body = io.read_bytes(self.len_body)
                            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                            self._m_body = Elf.EndianElf.DynsymSection(_io__raw__m_body, self, self._root, self._is_le)
                            self._m_body._read()
                        else:
                            pass
                            self._m_body = io.read_bytes(self.len_body)
                    io.seek(_pos)

                return getattr(self, '_m_body', None)

            @body.setter
            def body(self, v):
                self._dirty = True
                self._m_body = v

            def _write_body(self):
                self._should_write_body = False
                if self.type != Elf.ShType.nobits:
                    pass
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.ofs_body)
                    if self._is_le:
                        _on = self.type
                        if _on == Elf.ShType.dynamic:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.dynsym:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.note:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.rel:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.rela:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.strtab:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.symtab:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        else:
                            pass
                            io.write_bytes(self._m_body)
                    else:
                        _on = self.type
                        if _on == Elf.ShType.dynamic:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.dynsym:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.note:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.rel:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.rela:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.strtab:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        elif _on == Elf.ShType.symtab:
                            pass
                            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                            io.add_child_stream(_io__raw__m_body)
                            _pos2 = io.pos()
                            io.seek(io.pos() + (self.len_body))
                            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                                self._raw__m_body = _io__raw__m_body.to_byte_array()
                                if len(self._raw__m_body) != self.len_body:
                                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                                parent.write_bytes(self._raw__m_body)
                            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_body._write__seq(_io__raw__m_body)
                        else:
                            pass
                            io.write_bytes(self._m_body)
                    io.seek(_pos)


            @property
            def flags_obj(self):
                if self._should_write_flags_obj:
                    self._write_flags_obj()
                if hasattr(self, '_m_flags_obj'):
                    return self._m_flags_obj

                if not self.flags_obj__enabled:
                    return None

                if self._is_le:
                    self._m_flags_obj = Elf.SectionHeaderFlags(self.flags, self._io, self, self._root)
                    self._m_flags_obj._read()
                else:
                    self._m_flags_obj = Elf.SectionHeaderFlags(self.flags, self._io, self, self._root)
                    self._m_flags_obj._read()
                return getattr(self, '_m_flags_obj', None)

            @flags_obj.setter
            def flags_obj(self, v):
                self._dirty = True
                self._m_flags_obj = v

            def _write_flags_obj(self):
                self._should_write_flags_obj = False
                if self._is_le:
                    self._m_flags_obj._write__seq(self._io)
                else:
                    self._m_flags_obj._write__seq(self._io)

            @property
            def linked_section(self):
                """may reference a later section header, so don't try to access too early (use only lazy `instances`).
                
                .. seealso::
                   Source - https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link
                """
                if hasattr(self, '_m_linked_section'):
                    return self._m_linked_section

                if  ((self.linked_section_idx != int(Elf.SectionHeaderIdxSpecial.undefined)) and (self.linked_section_idx < self._root.header.num_section_headers)) :
                    pass
                    self._m_linked_section = self._root.header.section_headers[self.linked_section_idx]

                return getattr(self, '_m_linked_section', None)

            def _invalidate_linked_section(self):
                del self._m_linked_section
            @property
            def name(self):
                if self._should_write_name:
                    self._write_name()
                if hasattr(self, '_m_name'):
                    return self._m_name

                if not self.name__enabled:
                    return None

                io = self._root.header.section_names._io
                _pos = io.pos()
                io.seek(self.ofs_name)
                if self._is_le:
                    self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                else:
                    self._m_name = (io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                io.seek(_pos)
                return getattr(self, '_m_name', None)

            @name.setter
            def name(self, v):
                self._dirty = True
                self._m_name = v

            def _write_name(self):
                self._should_write_name = False
                io = self._root.header.section_names._io
                _pos = io.pos()
                io.seek(self.ofs_name)
                if self._is_le:
                    io.write_bytes((self._m_name).encode(u"ASCII"))
                    io.write_u1(0)
                else:
                    io.write_bytes((self._m_name).encode(u"ASCII"))
                    io.write_u1(0)
                io.seek(_pos)


        class StringsStruct(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None, _is_le=None):
                super(Elf.EndianElf.StringsStruct, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._is_le = _is_le

            def _read(self):
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/strings_struct")
                elif self._is_le == True:
                    self._read_le()
                elif self._is_le == False:
                    self._read_be()
                self._dirty = False

            def _read_le(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))
                    i += 1

                self._dirty = False

            def _read_be(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass



            def _write__seq(self, io=None):
                super(Elf.EndianElf.StringsStruct, self)._write__seq(io)
                if not hasattr(self, '_is_le'):
                    raise kaitaistruct.UndecidedEndiannessError("/types/endian_elf/types/strings_struct")
                elif self._is_le == True:
                    self._write__seq_le()
                elif self._is_le == False:
                    self._write__seq_be()


            def _write__seq_le(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self._io.write_bytes((self.entries[i]).encode(u"UTF-8"))
                    self._io.write_u1(0)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _write__seq_be(self):
                for i in range(len(self.entries)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                    self._io.write_bytes((self.entries[i]).encode(u"UTF-8"))
                    self._io.write_u1(0)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.entries)):
                    pass
                    if KaitaiStream.byte_array_index_of((self.entries[i]).encode(u"UTF-8"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"entries", -1, KaitaiStream.byte_array_index_of((self.entries[i]).encode(u"UTF-8"), 0))

                self._dirty = False


        @property
        def program_headers(self):
            if self._should_write_program_headers:
                self._write_program_headers()
            if hasattr(self, '_m_program_headers'):
                return self._m_program_headers

            if not self.program_headers__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_program_headers)
            if self._is_le:
                self._raw__m_program_headers = []
                self._m_program_headers = []
                for i in range(self.num_program_headers):
                    self._raw__m_program_headers.append(self._io.read_bytes(self.program_header_size))
                    _io__raw__m_program_headers = KaitaiStream(BytesIO(self._raw__m_program_headers[i]))
                    _t__m_program_headers = Elf.EndianElf.ProgramHeader(_io__raw__m_program_headers, self, self._root, self._is_le)
                    try:
                        _t__m_program_headers._read()
                    finally:
                        self._m_program_headers.append(_t__m_program_headers)

            else:
                self._raw__m_program_headers = []
                self._m_program_headers = []
                for i in range(self.num_program_headers):
                    self._raw__m_program_headers.append(self._io.read_bytes(self.program_header_size))
                    _io__raw__m_program_headers = KaitaiStream(BytesIO(self._raw__m_program_headers[i]))
                    _t__m_program_headers = Elf.EndianElf.ProgramHeader(_io__raw__m_program_headers, self, self._root, self._is_le)
                    try:
                        _t__m_program_headers._read()
                    finally:
                        self._m_program_headers.append(_t__m_program_headers)

            self._io.seek(_pos)
            return getattr(self, '_m_program_headers', None)

        @program_headers.setter
        def program_headers(self, v):
            self._dirty = True
            self._m_program_headers = v

        def _write_program_headers(self):
            self._should_write_program_headers = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_program_headers)
            if self._is_le:
                self._raw__m_program_headers = []
                for i in range(len(self._m_program_headers)):
                    pass
                    _io__raw__m_program_headers = KaitaiStream(BytesIO(bytearray(self.program_header_size)))
                    self._io.add_child_stream(_io__raw__m_program_headers)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.program_header_size))
                    def handler(parent, _io__raw__m_program_headers=_io__raw__m_program_headers, i=i):
                        self._raw__m_program_headers.append(_io__raw__m_program_headers.to_byte_array())
                        if len(self._raw__m_program_headers[i]) != self.program_header_size:
                            raise kaitaistruct.ConsistencyError(u"raw(program_headers)", self.program_header_size, len(self._raw__m_program_headers[i]))
                        parent.write_bytes(self._raw__m_program_headers[i])
                    _io__raw__m_program_headers.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_program_headers[i]._write__seq(_io__raw__m_program_headers)

            else:
                self._raw__m_program_headers = []
                for i in range(len(self._m_program_headers)):
                    pass
                    _io__raw__m_program_headers = KaitaiStream(BytesIO(bytearray(self.program_header_size)))
                    self._io.add_child_stream(_io__raw__m_program_headers)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.program_header_size))
                    def handler(parent, _io__raw__m_program_headers=_io__raw__m_program_headers, i=i):
                        self._raw__m_program_headers.append(_io__raw__m_program_headers.to_byte_array())
                        if len(self._raw__m_program_headers[i]) != self.program_header_size:
                            raise kaitaistruct.ConsistencyError(u"raw(program_headers)", self.program_header_size, len(self._raw__m_program_headers[i]))
                        parent.write_bytes(self._raw__m_program_headers[i])
                    _io__raw__m_program_headers.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_program_headers[i]._write__seq(_io__raw__m_program_headers)

            self._io.seek(_pos)

        @property
        def section_headers(self):
            if self._should_write_section_headers:
                self._write_section_headers()
            if hasattr(self, '_m_section_headers'):
                return self._m_section_headers

            if not self.section_headers__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_section_headers)
            if self._is_le:
                self._raw__m_section_headers = []
                self._m_section_headers = []
                for i in range(self.num_section_headers):
                    self._raw__m_section_headers.append(self._io.read_bytes(self.section_header_size))
                    _io__raw__m_section_headers = KaitaiStream(BytesIO(self._raw__m_section_headers[i]))
                    _t__m_section_headers = Elf.EndianElf.SectionHeader(_io__raw__m_section_headers, self, self._root, self._is_le)
                    try:
                        _t__m_section_headers._read()
                    finally:
                        self._m_section_headers.append(_t__m_section_headers)

            else:
                self._raw__m_section_headers = []
                self._m_section_headers = []
                for i in range(self.num_section_headers):
                    self._raw__m_section_headers.append(self._io.read_bytes(self.section_header_size))
                    _io__raw__m_section_headers = KaitaiStream(BytesIO(self._raw__m_section_headers[i]))
                    _t__m_section_headers = Elf.EndianElf.SectionHeader(_io__raw__m_section_headers, self, self._root, self._is_le)
                    try:
                        _t__m_section_headers._read()
                    finally:
                        self._m_section_headers.append(_t__m_section_headers)

            self._io.seek(_pos)
            return getattr(self, '_m_section_headers', None)

        @section_headers.setter
        def section_headers(self, v):
            self._dirty = True
            self._m_section_headers = v

        def _write_section_headers(self):
            self._should_write_section_headers = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_section_headers)
            if self._is_le:
                self._raw__m_section_headers = []
                for i in range(len(self._m_section_headers)):
                    pass
                    _io__raw__m_section_headers = KaitaiStream(BytesIO(bytearray(self.section_header_size)))
                    self._io.add_child_stream(_io__raw__m_section_headers)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.section_header_size))
                    def handler(parent, _io__raw__m_section_headers=_io__raw__m_section_headers, i=i):
                        self._raw__m_section_headers.append(_io__raw__m_section_headers.to_byte_array())
                        if len(self._raw__m_section_headers[i]) != self.section_header_size:
                            raise kaitaistruct.ConsistencyError(u"raw(section_headers)", self.section_header_size, len(self._raw__m_section_headers[i]))
                        parent.write_bytes(self._raw__m_section_headers[i])
                    _io__raw__m_section_headers.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_section_headers[i]._write__seq(_io__raw__m_section_headers)

            else:
                self._raw__m_section_headers = []
                for i in range(len(self._m_section_headers)):
                    pass
                    _io__raw__m_section_headers = KaitaiStream(BytesIO(bytearray(self.section_header_size)))
                    self._io.add_child_stream(_io__raw__m_section_headers)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.section_header_size))
                    def handler(parent, _io__raw__m_section_headers=_io__raw__m_section_headers, i=i):
                        self._raw__m_section_headers.append(_io__raw__m_section_headers.to_byte_array())
                        if len(self._raw__m_section_headers[i]) != self.section_header_size:
                            raise kaitaistruct.ConsistencyError(u"raw(section_headers)", self.section_header_size, len(self._raw__m_section_headers[i]))
                        parent.write_bytes(self._raw__m_section_headers[i])
                    _io__raw__m_section_headers.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_section_headers[i]._write__seq(_io__raw__m_section_headers)

            self._io.seek(_pos)

        @property
        def section_names(self):
            if self._should_write_section_names:
                self._write_section_names()
            if hasattr(self, '_m_section_names'):
                return self._m_section_names

            if not self.section_names__enabled:
                return None

            if  ((self.section_names_idx != int(Elf.SectionHeaderIdxSpecial.undefined)) and (self.section_names_idx < self._root.header.num_section_headers)) :
                pass
                _pos = self._io.pos()
                self._io.seek(self.section_headers[self.section_names_idx].ofs_body)
                if self._is_le:
                    self._raw__m_section_names = self._io.read_bytes(self.section_headers[self.section_names_idx].len_body)
                    _io__raw__m_section_names = KaitaiStream(BytesIO(self._raw__m_section_names))
                    self._m_section_names = Elf.EndianElf.StringsStruct(_io__raw__m_section_names, self, self._root, self._is_le)
                    self._m_section_names._read()
                else:
                    self._raw__m_section_names = self._io.read_bytes(self.section_headers[self.section_names_idx].len_body)
                    _io__raw__m_section_names = KaitaiStream(BytesIO(self._raw__m_section_names))
                    self._m_section_names = Elf.EndianElf.StringsStruct(_io__raw__m_section_names, self, self._root, self._is_le)
                    self._m_section_names._read()
                self._io.seek(_pos)

            return getattr(self, '_m_section_names', None)

        @section_names.setter
        def section_names(self, v):
            self._dirty = True
            self._m_section_names = v

        def _write_section_names(self):
            self._should_write_section_names = False
            if  ((self.section_names_idx != int(Elf.SectionHeaderIdxSpecial.undefined)) and (self.section_names_idx < self._root.header.num_section_headers)) :
                pass
                _pos = self._io.pos()
                self._io.seek(self.section_headers[self.section_names_idx].ofs_body)
                if self._is_le:
                    _io__raw__m_section_names = KaitaiStream(BytesIO(bytearray(self.section_headers[self.section_names_idx].len_body)))
                    self._io.add_child_stream(_io__raw__m_section_names)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.section_headers[self.section_names_idx].len_body))
                    def handler(parent, _io__raw__m_section_names=_io__raw__m_section_names):
                        self._raw__m_section_names = _io__raw__m_section_names.to_byte_array()
                        if len(self._raw__m_section_names) != self.section_headers[self.section_names_idx].len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(section_names)", self.section_headers[self.section_names_idx].len_body, len(self._raw__m_section_names))
                        parent.write_bytes(self._raw__m_section_names)
                    _io__raw__m_section_names.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_section_names._write__seq(_io__raw__m_section_names)
                else:
                    _io__raw__m_section_names = KaitaiStream(BytesIO(bytearray(self.section_headers[self.section_names_idx].len_body)))
                    self._io.add_child_stream(_io__raw__m_section_names)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.section_headers[self.section_names_idx].len_body))
                    def handler(parent, _io__raw__m_section_names=_io__raw__m_section_names):
                        self._raw__m_section_names = _io__raw__m_section_names.to_byte_array()
                        if len(self._raw__m_section_names) != self.section_headers[self.section_names_idx].len_body:
                            raise kaitaistruct.ConsistencyError(u"raw(section_names)", self.section_headers[self.section_names_idx].len_body, len(self._raw__m_section_names))
                        parent.write_bytes(self._raw__m_section_names)
                    _io__raw__m_section_names.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_section_names._write__seq(_io__raw__m_section_names)
                self._io.seek(_pos)



    class PhdrTypeFlags(ReadWriteKaitaiStruct):
        def __init__(self, value, _io=None, _parent=None, _root=None):
            super(Elf.PhdrTypeFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.value = value

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Elf.PhdrTypeFlags, self)._write__seq(io)


        def _check(self):
            self._dirty = False

        @property
        def execute(self):
            if hasattr(self, '_m_execute'):
                return self._m_execute

            self._m_execute = self.value & 1 != 0
            return getattr(self, '_m_execute', None)

        def _invalidate_execute(self):
            del self._m_execute
        @property
        def mask_proc(self):
            if hasattr(self, '_m_mask_proc'):
                return self._m_mask_proc

            self._m_mask_proc = self.value & 4026531840 != 0
            return getattr(self, '_m_mask_proc', None)

        def _invalidate_mask_proc(self):
            del self._m_mask_proc
        @property
        def read(self):
            if hasattr(self, '_m_read'):
                return self._m_read

            self._m_read = self.value & 4 != 0
            return getattr(self, '_m_read', None)

        def _invalidate_read(self):
            del self._m_read
        @property
        def write(self):
            if hasattr(self, '_m_write'):
                return self._m_write

            self._m_write = self.value & 2 != 0
            return getattr(self, '_m_write', None)

        def _invalidate_write(self):
            del self._m_write

    class SectionHeaderFlags(ReadWriteKaitaiStruct):
        def __init__(self, value, _io=None, _parent=None, _root=None):
            super(Elf.SectionHeaderFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.value = value

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Elf.SectionHeaderFlags, self)._write__seq(io)


        def _check(self):
            self._dirty = False

        @property
        def alloc(self):
            """occupies memory during execution."""
            if hasattr(self, '_m_alloc'):
                return self._m_alloc

            self._m_alloc = self.value & 2 != 0
            return getattr(self, '_m_alloc', None)

        def _invalidate_alloc(self):
            del self._m_alloc
        @property
        def exclude(self):
            """section is excluded unless referenced or allocated (Solaris)."""
            if hasattr(self, '_m_exclude'):
                return self._m_exclude

            self._m_exclude = self.value & 134217728 != 0
            return getattr(self, '_m_exclude', None)

        def _invalidate_exclude(self):
            del self._m_exclude
        @property
        def exec_instr(self):
            """executable."""
            if hasattr(self, '_m_exec_instr'):
                return self._m_exec_instr

            self._m_exec_instr = self.value & 4 != 0
            return getattr(self, '_m_exec_instr', None)

        def _invalidate_exec_instr(self):
            del self._m_exec_instr
        @property
        def group(self):
            """section is member of a group."""
            if hasattr(self, '_m_group'):
                return self._m_group

            self._m_group = self.value & 512 != 0
            return getattr(self, '_m_group', None)

        def _invalidate_group(self):
            del self._m_group
        @property
        def info_link(self):
            """'sh_info' contains SHT index."""
            if hasattr(self, '_m_info_link'):
                return self._m_info_link

            self._m_info_link = self.value & 64 != 0
            return getattr(self, '_m_info_link', None)

        def _invalidate_info_link(self):
            del self._m_info_link
        @property
        def link_order(self):
            """preserve order after combining."""
            if hasattr(self, '_m_link_order'):
                return self._m_link_order

            self._m_link_order = self.value & 128 != 0
            return getattr(self, '_m_link_order', None)

        def _invalidate_link_order(self):
            del self._m_link_order
        @property
        def mask_os(self):
            """OS-specific."""
            if hasattr(self, '_m_mask_os'):
                return self._m_mask_os

            self._m_mask_os = self.value & 267386880 != 0
            return getattr(self, '_m_mask_os', None)

        def _invalidate_mask_os(self):
            del self._m_mask_os
        @property
        def mask_proc(self):
            """Processor-specific."""
            if hasattr(self, '_m_mask_proc'):
                return self._m_mask_proc

            self._m_mask_proc = self.value & 4026531840 != 0
            return getattr(self, '_m_mask_proc', None)

        def _invalidate_mask_proc(self):
            del self._m_mask_proc
        @property
        def merge(self):
            """might be merged."""
            if hasattr(self, '_m_merge'):
                return self._m_merge

            self._m_merge = self.value & 16 != 0
            return getattr(self, '_m_merge', None)

        def _invalidate_merge(self):
            del self._m_merge
        @property
        def ordered(self):
            """special ordering requirement (Solaris)."""
            if hasattr(self, '_m_ordered'):
                return self._m_ordered

            self._m_ordered = self.value & 67108864 != 0
            return getattr(self, '_m_ordered', None)

        def _invalidate_ordered(self):
            del self._m_ordered
        @property
        def os_non_conforming(self):
            """non-standard OS specific handling required."""
            if hasattr(self, '_m_os_non_conforming'):
                return self._m_os_non_conforming

            self._m_os_non_conforming = self.value & 256 != 0
            return getattr(self, '_m_os_non_conforming', None)

        def _invalidate_os_non_conforming(self):
            del self._m_os_non_conforming
        @property
        def strings(self):
            """contains nul-terminated strings."""
            if hasattr(self, '_m_strings'):
                return self._m_strings

            self._m_strings = self.value & 32 != 0
            return getattr(self, '_m_strings', None)

        def _invalidate_strings(self):
            del self._m_strings
        @property
        def tls(self):
            """section hold thread-local data."""
            if hasattr(self, '_m_tls'):
                return self._m_tls

            self._m_tls = self.value & 1024 != 0
            return getattr(self, '_m_tls', None)

        def _invalidate_tls(self):
            del self._m_tls
        @property
        def write(self):
            """writable."""
            if hasattr(self, '_m_write'):
                return self._m_write

            self._m_write = self.value & 1 != 0
            return getattr(self, '_m_write', None)

        def _invalidate_write(self):
            del self._m_write

    @property
    def sh_idx_hi_os(self):
        if hasattr(self, '_m_sh_idx_hi_os'):
            return self._m_sh_idx_hi_os

        self._m_sh_idx_hi_os = 65343
        return getattr(self, '_m_sh_idx_hi_os', None)

    def _invalidate_sh_idx_hi_os(self):
        del self._m_sh_idx_hi_os
    @property
    def sh_idx_hi_proc(self):
        if hasattr(self, '_m_sh_idx_hi_proc'):
            return self._m_sh_idx_hi_proc

        self._m_sh_idx_hi_proc = 65311
        return getattr(self, '_m_sh_idx_hi_proc', None)

    def _invalidate_sh_idx_hi_proc(self):
        del self._m_sh_idx_hi_proc
    @property
    def sh_idx_hi_reserved(self):
        if hasattr(self, '_m_sh_idx_hi_reserved'):
            return self._m_sh_idx_hi_reserved

        self._m_sh_idx_hi_reserved = 65535
        return getattr(self, '_m_sh_idx_hi_reserved', None)

    def _invalidate_sh_idx_hi_reserved(self):
        del self._m_sh_idx_hi_reserved
    @property
    def sh_idx_lo_os(self):
        if hasattr(self, '_m_sh_idx_lo_os'):
            return self._m_sh_idx_lo_os

        self._m_sh_idx_lo_os = 65312
        return getattr(self, '_m_sh_idx_lo_os', None)

    def _invalidate_sh_idx_lo_os(self):
        del self._m_sh_idx_lo_os
    @property
    def sh_idx_lo_proc(self):
        if hasattr(self, '_m_sh_idx_lo_proc'):
            return self._m_sh_idx_lo_proc

        self._m_sh_idx_lo_proc = 65280
        return getattr(self, '_m_sh_idx_lo_proc', None)

    def _invalidate_sh_idx_lo_proc(self):
        del self._m_sh_idx_lo_proc
    @property
    def sh_idx_lo_reserved(self):
        if hasattr(self, '_m_sh_idx_lo_reserved'):
            return self._m_sh_idx_lo_reserved

        self._m_sh_idx_lo_reserved = 65280
        return getattr(self, '_m_sh_idx_lo_reserved', None)

    def _invalidate_sh_idx_lo_reserved(self):
        del self._m_sh_idx_lo_reserved

