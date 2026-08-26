// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;


/**
 * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h">Source</a>
 * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html">Source</a>
 * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html">Source</a>
 */
public class Elf extends KaitaiStruct {
    public static Elf fromFile(String fileName) throws IOException {
        return new Elf(new ByteBufferKaitaiStream(fileName));
    }

    public enum Bits {
        B32(1),
        B64(2);

        private final long id;
        Bits(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Bits> byId = new HashMap<Long, Bits>(2);
        static {
            for (Bits e : Bits.values())
                byId.put(e.id(), e);
        }
        public static Bits byId(long id) { return byId.get(id); }
    }

    public enum DynamicArrayTags {
        NULL(0),
        NEEDED(1),
        PLTRELSZ(2),
        PLTGOT(3),
        HASH(4),
        STRTAB(5),
        SYMTAB(6),
        RELA(7),
        RELASZ(8),
        RELAENT(9),
        STRSZ(10),
        SYMENT(11),
        INIT(12),
        FINI(13),
        SONAME(14),
        RPATH(15),
        SYMBOLIC(16),
        REL(17),
        RELSZ(18),
        RELENT(19),
        PLTREL(20),
        DEBUG(21),
        TEXTREL(22),
        JMPREL(23),
        BIND_NOW(24),
        INIT_ARRAY(25),
        FINI_ARRAY(26),
        INIT_ARRAYSZ(27),
        FINI_ARRAYSZ(28),
        RUNPATH(29),
        FLAGS(30),
        PREINIT_ARRAY(32),
        PREINIT_ARRAYSZ(33),
        SYMTAB_SHNDX(34),
        RELRSZ(35),
        RELR(36),
        RELRENT(37),
        DEPRECATED_SPARC_REGISTER(117440513),
        SUNW_AUXILIARY(1610612749),
        SUNW_RTLDINF(1610612750),
        SUNW_FILTER(1610612751),
        SUNW_CAP(1610612752),
        SUNW_SYMTAB(1610612753),
        SUNW_SYMSZ(1610612754),
        SUNW_SORTENT(1610612755),
        SUNW_SYMSORT(1610612756),
        SUNW_SYMSORTSZ(1610612757),
        SUNW_TLSSORT(1610612758),
        SUNW_TLSSORTSZ(1610612759),
        SUNW_CAPINFO(1610612760),
        SUNW_STRPAD(1610612761),
        SUNW_CAPCHAIN(1610612762),
        SUNW_LDMACH(1610612763),
        SUNW_SYMTAB_SHNDX(1610612764),
        SUNW_CAPCHAINENT(1610612765),
        SUNW_DEFERRED(1610612766),
        SUNW_CAPCHAINSZ(1610612767),
        SUNW_PHNAME(1610612768),
        SUNW_PARENT(1610612769),
        SUNW_SX_ASLR(1610612771),
        SUNW_RELAX(1610612773),
        SUNW_KMOD(1610612775),
        SUNW_SX_NXHEAP(1610612777),
        SUNW_SX_NXSTACK(1610612779),
        SUNW_SX_ADIHEAP(1610612781),
        SUNW_SX_ADISTACK(1610612783),
        SUNW_SX_SSBD(1610612785),
        SUNW_SYMNSORT(1610612786),
        SUNW_SYMNSORTSZ(1610612787),
        GNU_FLAGS_1(1879047668),
        GNU_PRELINKED(1879047669),
        GNU_CONFLICTSZ(1879047670),
        GNU_LIBLISTSZ(1879047671),
        CHECKSUM(1879047672),
        PLTPADSZ(1879047673),
        MOVEENT(1879047674),
        MOVESZ(1879047675),
        FEATURE_1(1879047676),
        POSFLAG_1(1879047677),
        SYMINSZ(1879047678),
        SYMINENT(1879047679),
        GNU_HASH(1879047925),
        TLSDESC_PLT(1879047926),
        TLSDESC_GOT(1879047927),
        GNU_CONFLICT(1879047928),
        GNU_LIBLIST(1879047929),
        CONFIG(1879047930),
        DEPAUDIT(1879047931),
        AUDIT(1879047932),
        PLTPAD(1879047933),
        MOVETAB(1879047934),
        SYMINFO(1879047935),
        VERSYM(1879048176),
        RELACOUNT(1879048185),
        RELCOUNT(1879048186),
        FLAGS_1(1879048187),
        VERDEF(1879048188),
        VERDEFNUM(1879048189),
        VERNEED(1879048190),
        VERNEEDNUM(1879048191),
        SPARC_REGISTER(1879048193),
        AUXILIARY(2147483645),
        USED(2147483646),
        FILTER(2147483647);

        private final long id;
        DynamicArrayTags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DynamicArrayTags> byId = new HashMap<Long, DynamicArrayTags>(104);
        static {
            for (DynamicArrayTags e : DynamicArrayTags.values())
                byId.put(e.id(), e);
        }
        public static DynamicArrayTags byId(long id) { return byId.get(id); }
    }

    public enum Endian {
        LE(1),
        BE(2);

        private final long id;
        Endian(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Endian> byId = new HashMap<Long, Endian>(2);
        static {
            for (Endian e : Endian.values())
                byId.put(e.id(), e);
        }
        public static Endian byId(long id) { return byId.get(id); }
    }

    public enum Machine {
        NO_MACHINE(0),
        M32(1),
        SPARC(2),
        I386(3),
        M68K(4),
        M88K(5),
        IAMCU(6),
        I860(7),
        MIPS(8),
        S370(9),
        MIPS_RS3_LE(10),
        OLD_SPARC_V9(11),
        PARISC(15),
        VPP500(17),
        SPARC32PLUS(18),
        I960(19),
        POWERPC(20),
        POWERPC64(21),
        S390(22),
        SPU(23),
        V800(36),
        FR20(37),
        RH32(38),
        MCORE(39),
        ARM(40),
        OLD_ALPHA(41),
        SUPERH(42),
        SPARC_V9(43),
        TRICORE(44),
        ARC(45),
        H8_300(46),
        H8_300H(47),
        H8S(48),
        H8_500(49),
        IA_64(50),
        MIPS_X(51),
        COLDFIRE(52),
        M68HC12(53),
        MMA(54),
        PCP(55),
        NCPU(56),
        NDR1(57),
        STARCORE(58),
        ME16(59),
        ST100(60),
        TINYJ(61),
        X86_64(62),
        PDSP(63),
        PDP10(64),
        PDP11(65),
        FX66(66),
        ST9PLUS(67),
        ST7(68),
        M68HC16(69),
        M68HC11(70),
        M68HC08(71),
        M68HC05(72),
        SVX(73),
        ST19(74),
        VAX(75),
        CRIS(76),
        JAVELIN(77),
        FIREPATH(78),
        ZSP(79),
        MMIX(80),
        HUANY(81),
        PRISM(82),
        AVR(83),
        FR30(84),
        D10V(85),
        D30V(86),
        V850(87),
        M32R(88),
        MN10300(89),
        MN10200(90),
        PICOJAVA(91),
        OR1K(92),
        ARC_COMPACT(93),
        XTENSA(94),
        VIDEOCORE(95),
        TMM_GPP(96),
        NS32K(97),
        TPC(98),
        SNP1K(99),
        ST200(100),
        IP2K(101),
        MAX(102),
        CR(103),
        F2MC16(104),
        MSP430(105),
        BLACKFIN(106),
        SE_C33(107),
        SEP(108),
        ARCA(109),
        UNICORE(110),
        EXCESS(111),
        DXP(112),
        ALTERA_NIOS2(113),
        CRX(114),
        XGATE(115),
        C166(116),
        M16C(117),
        DSPIC30F(118),
        FREESCALE_CE(119),
        M32C(120),
        TSK3000(131),
        RS08(132),
        SHARC(133),
        ECOG2(134),
        SCORE7(135),
        DSP24(136),
        VIDEOCORE3(137),
        LATTICEMICO32(138),
        SE_C17(139),
        TI_C6000(140),
        TI_C2000(141),
        TI_C5500(142),
        TI_ARP32(143),
        TI_PRU(144),
        MMDSP_PLUS(160),
        CYPRESS_M8C(161),
        R32C(162),
        TRIMEDIA(163),
        QDSP6(164),
        I8051(165),
        STXP7X(166),
        NDS32(167),
        ECOG1X(168),
        MAXQ30(169),
        XIMO16(170),
        MANIK(171),
        CRAY_NV2(172),
        RX(173),
        METAG(174),
        MCST_ELBRUS(175),
        ECOG16(176),
        CR16(177),
        ETPU(178),
        SLE9X(179),
        L1OM(180),
        K1OM(181),
        INTEL182(182),
        AARCH64(183),
        ARM184(184),
        AVR32(185),
        STM8(186),
        TILE64(187),
        TILEPRO(188),
        MICROBLAZE(189),
        CUDA(190),
        TILEGX(191),
        CLOUDSHIELD(192),
        COREA_1ST(193),
        COREA_2ND(194),
        ARC_COMPACT2(195),
        OPEN8(196),
        RL78(197),
        VIDEOCORE5(198),
        RENESAS_78K0R(199),
        FREESCALE_56800EX(200),
        BA1(201),
        BA2(202),
        XCORE(203),
        MCHP_PIC(204),
        INTELGT(205),
        INTEL206(206),
        INTEL207(207),
        INTEL208(208),
        INTEL209(209),
        KM32(210),
        KMX32(211),
        KMX16(212),
        KMX8(213),
        KVARC(214),
        CDP(215),
        COGE(216),
        COOL(217),
        NORC(218),
        CSR_KALIMBA(219),
        Z80(220),
        VISIUM(221),
        FT32(222),
        MOXIE(223),
        AMDGPU(224),
        RISCV(243),
        LANAI(244),
        CEVA(245),
        CEVA_X2(246),
        BPF(247),
        GRAPHCORE_IPU(248),
        IMG1(249),
        NFP(250),
        VE(251),
        CSKY(252),
        ARC_COMPACT3_64(253),
        MCS6502(254),
        ARC_COMPACT3(255),
        KVX(256),
        WDC_65816(257),
        LOONGARCH(258),
        KF32(259),
        U16_U8CORE(260),
        TACHYUM(261),
        NXP_56800EF(262),
        SBF(263),
        AI_ENGINE(264),
        SIMA_MLA(265),
        BANG(266),
        LOONGGPU(267),
        SW64(268),
        AI_ENGINE_CTRLCODE(269),
        PPU(270),
        AVR_OLD(4183),
        MSP430_OLD(4185),
        ADAPTEVA_EPIPHANY(4643),
        MT(9520),
        CYGNUS_FR30(13104),
        WEBASSEMBLY(16727),
        XC16X(18056),
        S12Z(19951),
        CYGNUS_FRV(21569),
        DLX(23205),
        CYGNUS_D10V(30288),
        CYGNUS_D30V(30326),
        IP2K_OLD(33303),
        CYGNUS_POWERPC(36901),
        ALPHA(36902),
        CYGNUS_M32R(36929),
        CYGNUS_V850(36992),
        S390_OLD(41872),
        XTENSA_OLD(43975),
        XSTORMY16(44357),
        MICROBLAZE_OLD(47787),
        CYGNUS_MN10300(48879),
        CYGNUS_MN10200(57005),
        CYGNUS_MEP(61453),
        M32C_OLD(65200),
        IQ2000(65210),
        NIOS32(65211),
        MOXIE_OLD(65261);

        private final long id;
        Machine(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Machine> byId = new HashMap<Long, Machine>(240);
        static {
            for (Machine e : Machine.values())
                byId.put(e.id(), e);
        }
        public static Machine byId(long id) { return byId.get(id); }
    }

    public enum ObjType {
        NO_FILE_TYPE(0),
        RELOCATABLE(1),
        EXECUTABLE(2),
        SHARED(3),
        CORE(4);

        private final long id;
        ObjType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ObjType> byId = new HashMap<Long, ObjType>(5);
        static {
            for (ObjType e : ObjType.values())
                byId.put(e.id(), e);
        }
        public static ObjType byId(long id) { return byId.get(id); }
    }

    public enum OsAbi {
        SYSTEM_V(0),
        HP_UX(1),
        NETBSD(2),
        GNU(3),
        SOLARIS(6),
        AIX(7),
        IRIX(8),
        FREEBSD(9),
        TRU64(10),
        MODESTO(11),
        OPENBSD(12),
        OPENVMS(13),
        NSK(14),
        AROS(15),
        FENIXOS(16),
        CLOUDABI(17),
        OPENVOS(18),
        CUDA(51),
        ARM_AEABI(64),
        ARM_FDPIC(65),
        AMDGPU_MESA3D(66),
        ARM(97),
        STANDALONE(255);

        private final long id;
        OsAbi(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, OsAbi> byId = new HashMap<Long, OsAbi>(23);
        static {
            for (OsAbi e : OsAbi.values())
                byId.put(e.id(), e);
        }
        public static OsAbi byId(long id) { return byId.get(id); }
    }

    public enum PhType {
        NULL_TYPE(0),
        LOAD(1),
        DYNAMIC(2),
        INTERP(3),
        NOTE(4),
        SHLIB(5),
        PHDR(6),
        TLS(7),
        SUNW_UNWIND(1684333904),
        GNU_EH_FRAME(1685382480),
        GNU_STACK(1685382481),
        GNU_RELRO(1685382482),
        GNU_PROPERTY(1685382483),
        GNU_SFRAME(1685382484),
        PAX_FLAGS(1694766464),
        OPENBSD_MUTABLE(1705237477),
        OPENBSD_RANDOMIZE(1705237478),
        OPENBSD_WXNEEDED(1705237479),
        OPENBSD_NOBTCFI(1705237480),
        OPENBSD_SYSCALLS(1705237481),
        OPENBSD_BOOTDATA(1705253862),
        SUNW_SYSSTAT_ZONE(1879048183),
        SUNW_SYSSTAT(1879048184),
        SUNW_RESERVE(1879048185),
        SUNW_BSS(1879048186),
        SUNW_STACK(1879048187),
        SUNW_DTRACE(1879048188),
        SUNW_CAP(1879048189),
        ARM_ARCHEXT(1879048192),
        ARM_EXIDX(1879048193),
        AARCH64_MEMTAG_MTE(1879048194),
        RISCV_ATTRIBUTES(1879048195);

        private final long id;
        PhType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PhType> byId = new HashMap<Long, PhType>(32);
        static {
            for (PhType e : PhType.values())
                byId.put(e.id(), e);
        }
        public static PhType byId(long id) { return byId.get(id); }
    }

    public enum SectionHeaderIdxSpecial {
        UNDEFINED(0),
        BEFORE(65280),
        AFTER(65281),
        AMD64_LCOMMON(65282),
        SUNW_IGNORE(65343),
        ABS(65521),
        COMMON(65522),
        XINDEX(65535);

        private final long id;
        SectionHeaderIdxSpecial(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SectionHeaderIdxSpecial> byId = new HashMap<Long, SectionHeaderIdxSpecial>(8);
        static {
            for (SectionHeaderIdxSpecial e : SectionHeaderIdxSpecial.values())
                byId.put(e.id(), e);
        }
        public static SectionHeaderIdxSpecial byId(long id) { return byId.get(id); }
    }

    public enum ShType {
        NULL_TYPE(0),
        PROGBITS(1),
        SYMTAB(2),
        STRTAB(3),
        RELA(4),
        HASH(5),
        DYNAMIC(6),
        NOTE(7),
        NOBITS(8),
        REL(9),
        SHLIB(10),
        DYNSYM(11),
        INIT_ARRAY(14),
        FINI_ARRAY(15),
        PREINIT_ARRAY(16),
        GROUP(17),
        SYMTAB_SHNDX(18),
        RELR(19),
        ANDROID_REL(1610612737),
        ANDROID_RELA(1610612738),
        GNU_INCREMENTAL_INPUTS(1879000832),
        LLVM_ODRTAB(1879002112),
        LLVM_LINKER_OPTIONS(1879002113),
        LLVM_ADDRSIG(1879002115),
        LLVM_DEPENDENT_LIBRARIES(1879002116),
        LLVM_SYMPART(1879002117),
        LLVM_PART_EHDR(1879002118),
        LLVM_PART_PHDR(1879002119),
        LLVM_BB_ADDR_MAP_V0(1879002120),
        LLVM_CALL_GRAPH_PROFILE(1879002121),
        LLVM_BB_ADDR_MAP(1879002122),
        LLVM_OFFLOADING(1879002123),
        LLVM_LTO(1879002124),
        LLVM_JT_SIZES(1879002125),
        LLVM_CFI_JUMP_TABLE(1879002126),
        LLVM_CALL_GRAPH(1879002127),
        LLVM_DYNDBG_ELF(1879002128),
        ANDROID_RELR(1879047936),
        SUNW_CTF(1879048171),
        SUNW_SYMNSORT(1879048172),
        SUNW_PHNAME(1879048173),
        SUNW_ANCILLARY(1879048174),
        SUNW_CAPCHAIN(1879048175),
        SUNW_CAPINFO(1879048176),
        SUNW_SYMSORT(1879048177),
        SUNW_TLSSORT(1879048178),
        SUNW_LDYNSYM(1879048179),
        GNU_SFRAME(1879048180),
        GNU_ATTRIBUTES(1879048181),
        GNU_HASH(1879048182),
        GNU_LIBLIST(1879048183),
        CHECKSUM(1879048184),
        GNU_OBJECT_ONLY(1879048185),
        SUNW_MOVE(1879048186),
        SUNW_COMDAT(1879048187),
        SUNW_SYMINFO(1879048188),
        GNU_VERDEF(1879048189),
        GNU_VERNEED(1879048190),
        GNU_VERSYM(1879048191),
        SPARC_GOTDATA(1879048192),
        X86_64_UNWIND(1879048193),
        ARM_PREEMPTMAP(1879048194),
        ARM_ATTRIBUTES(1879048195),
        ARM_DEBUGOVERLAY(1879048196),
        ARM_OVERLAYSECTION(1879048197),
        AARCH64_MEMTAG_GLOBALS_STATIC(1879048199),
        AARCH64_MEMTAG_GLOBALS_DYNAMIC(1879048200);

        private final long id;
        ShType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ShType> byId = new HashMap<Long, ShType>(67);
        static {
            for (ShType e : ShType.values())
                byId.put(e.id(), e);
        }
        public static ShType byId(long id) { return byId.get(id); }
    }

    public enum SymbolBinding {
        LOCAL(0),
        GLOBAL_SYMBOL(1),
        WEAK(2),
        OS10(10),
        OS11(11),
        OS12(12),
        PROC13(13),
        PROC14(14),
        PROC15(15);

        private final long id;
        SymbolBinding(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SymbolBinding> byId = new HashMap<Long, SymbolBinding>(9);
        static {
            for (SymbolBinding e : SymbolBinding.values())
                byId.put(e.id(), e);
        }
        public static SymbolBinding byId(long id) { return byId.get(id); }
    }

    public enum SymbolType {
        NO_TYPE(0),
        OBJECT(1),
        FUNC(2),
        SECTION(3),
        FILE(4),
        COMMON(5),
        TLS(6),
        RELC(8),
        SRELC(9),
        GNU_IFUNC(10),
        OS11(11),
        OS12(12),
        PROC13(13),
        PROC14(14),
        PROC15(15);

        private final long id;
        SymbolType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SymbolType> byId = new HashMap<Long, SymbolType>(15);
        static {
            for (SymbolType e : SymbolType.values())
                byId.put(e.id(), e);
        }
        public static SymbolType byId(long id) { return byId.get(id); }
    }

    public enum SymbolVisibility {
        DEFAULT(0),
        INTERNAL(1),
        HIDDEN(2),
        PROTECTED(3),
        EXPORTED(4),
        SINGLETON(5),
        ELIMINATE(6);

        private final long id;
        SymbolVisibility(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SymbolVisibility> byId = new HashMap<Long, SymbolVisibility>(7);
        static {
            for (SymbolVisibility e : SymbolVisibility.values())
                byId.put(e.id(), e);
        }
        public static SymbolVisibility byId(long id) { return byId.get(id); }
    }

    public enum VersionIndexSpecial {
        LOCAL(0),
        GLOBAL_SYMBOL(1),
        ELIMINATE(65281);

        private final long id;
        VersionIndexSpecial(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, VersionIndexSpecial> byId = new HashMap<Long, VersionIndexSpecial>(3);
        static {
            for (VersionIndexSpecial e : VersionIndexSpecial.values())
                byId.put(e.id(), e);
        }
        public static VersionIndexSpecial byId(long id) { return byId.get(id); }
    }

    public Elf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Elf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Elf(KaitaiStream _io, KaitaiStruct _parent, Elf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 127, 69, 76, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 127, 69, 76, 70 }, this.magic, this._io, "/seq/0");
        }
        this.bits = Bits.byId(this._io.readU1());
        this.endian = Endian.byId(this._io.readU1());
        this.eiVersion = this._io.readU1();
        if (!(this.eiVersion == 1)) {
            throw new KaitaiStream.ValidationNotEqualError(1, this.eiVersion, this._io, "/seq/3");
        }
        this.abi = OsAbi.byId(this._io.readU1());
        this.abiVersion = this._io.readU1();
        this.pad = this._io.readBytes(7);
        if (!(Arrays.equals(this.pad, new byte[] { 0, 0, 0, 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0 }, this.pad, this._io, "/seq/6");
        }
        this.header = new EndianElf(this._io, this, _root);
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
    }

    /**
     * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1008">Source</a>
     * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-53">Source</a>
     */
    public static class DtFlag1Values extends KaitaiStruct {

        public DtFlag1Values(KaitaiStream _io, long value) {
            this(_io, null, null, value);
        }

        public DtFlag1Values(KaitaiStream _io, KaitaiStruct _parent, long value) {
            this(_io, _parent, null, value);
        }

        public DtFlag1Values(KaitaiStream _io, KaitaiStruct _parent, Elf _root, long value) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.value = value;
            _read();
        }
        private void _read() {
        }

        public void _fetchInstances() {
        }
        private Boolean confAlt;

        /**
         * Configuration alternative created.
         * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1023">Source</a>
         */
        public Boolean confAlt() {
            if (this.confAlt != null)
                return this.confAlt;
            this.confAlt = (value() & 8192) != 0;
            return this.confAlt;
        }
        private Boolean direct;

        /**
         * Direct binding enabled.
         */
        public Boolean direct() {
            if (this.direct != null)
                return this.direct;
            this.direct = (value() & 256) != 0;
            return this.direct;
        }
        private Boolean dispRelDne;

        /**
         * Displacement relocation done (applied at build time).
         */
        public Boolean dispRelDne() {
            if (this.dispRelDne != null)
                return this.dispRelDne;
            this.dispRelDne = (value() & 32768) != 0;
            return this.dispRelDne;
        }
        private Boolean dispRelPnd;

        /**
         * Displacement relocation pending (applied at runtime).
         */
        public Boolean dispRelPnd() {
            if (this.dispRelPnd != null)
                return this.dispRelPnd;
            this.dispRelPnd = (value() & 65536) != 0;
            return this.dispRelPnd;
        }
        private Boolean edited;

        /**
         * Object is modified after built.
         */
        public Boolean edited() {
            if (this.edited != null)
                return this.edited;
            this.edited = (value() & 2097152) != 0;
            return this.edited;
        }
        private Boolean endFiltee;

        /**
         * Filtee terminates filters search.
         */
        public Boolean endFiltee() {
            if (this.endFiltee != null)
                return this.endFiltee;
            this.endFiltee = (value() & 16384) != 0;
            return this.endFiltee;
        }
        private Boolean globAudit;

        /**
         * Global auditing required.
         */
        public Boolean globAudit() {
            if (this.globAudit != null)
                return this.globAudit;
            this.globAudit = (value() & 16777216) != 0;
            return this.globAudit;
        }
        private Boolean group;

        /**
         * Set `RTLD_GROUP` for this object.
         */
        public Boolean group() {
            if (this.group != null)
                return this.group;
            this.group = (value() & 4) != 0;
            return this.group;
        }
        private Boolean ignMulDef;
        public Boolean ignMulDef() {
            if (this.ignMulDef != null)
                return this.ignMulDef;
            this.ignMulDef = (value() & 262144) != 0;
            return this.ignMulDef;
        }
        private Boolean initFirst;

        /**
         * Set `RTLD_INITFIRST` for this object.
         */
        public Boolean initFirst() {
            if (this.initFirst != null)
                return this.initFirst;
            this.initFirst = (value() & 32) != 0;
            return this.initFirst;
        }
        private Boolean interpose;

        /**
         * Object is used to interpose.
         */
        public Boolean interpose() {
            if (this.interpose != null)
                return this.interpose;
            this.interpose = (value() & 1024) != 0;
            return this.interpose;
        }
        private Boolean kmod;

        /**
         * Object is a kernel module.
         */
        public Boolean kmod() {
            if (this.kmod != null)
                return this.kmod;
            this.kmod = (value() & 268435456) != 0;
            return this.kmod;
        }
        private Boolean loadFltr;

        /**
         * Trigger filtee loading at runtime.
         */
        public Boolean loadFltr() {
            if (this.loadFltr != null)
                return this.loadFltr;
            this.loadFltr = (value() & 16) != 0;
            return this.loadFltr;
        }
        private Boolean noCommon;

        /**
         * No COMMON symbols exist.
         * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1040">Source</a>
         */
        public Boolean noCommon() {
            if (this.noCommon != null)
                return this.noCommon;
            this.noCommon = (value() & 1073741824) != 0;
            return this.noCommon;
        }
        private Boolean noDefLib;

        /**
         * Ignore the default library search path.
         */
        public Boolean noDefLib() {
            if (this.noDefLib != null)
                return this.noDefLib;
            this.noDefLib = (value() & 2048) != 0;
            return this.noDefLib;
        }
        private Boolean noDelete;

        /**
         * Set `RTLD_NODELETE` for this object.
         */
        public Boolean noDelete() {
            if (this.noDelete != null)
                return this.noDelete;
            this.noDelete = (value() & 8) != 0;
            return this.noDelete;
        }
        private Boolean noDirect;

        /**
         * Object contains non-direct bindings.
         */
        public Boolean noDirect() {
            if (this.noDirect != null)
                return this.noDirect;
            this.noDirect = (value() & 131072) != 0;
            return this.noDirect;
        }
        private Boolean noDump;

        /**
         * Object can't be dldump'ed.
         */
        public Boolean noDump() {
            if (this.noDump != null)
                return this.noDump;
            this.noDump = (value() & 4096) != 0;
            return this.noDump;
        }
        private Boolean noHdr;
        public Boolean noHdr() {
            if (this.noHdr != null)
                return this.noHdr;
            this.noHdr = (value() & 1048576) != 0;
            return this.noHdr;
        }
        private Boolean noKsyms;
        public Boolean noKsyms() {
            if (this.noKsyms != null)
                return this.noKsyms;
            this.noKsyms = (value() & 524288) != 0;
            return this.noKsyms;
        }
        private Boolean noOpen;

        /**
         * Set `RTLD_NOOPEN` for this object.
         */
        public Boolean noOpen() {
            if (this.noOpen != null)
                return this.noOpen;
            this.noOpen = (value() & 64) != 0;
            return this.noOpen;
        }
        private Boolean noReloc;
        public Boolean noReloc() {
            if (this.noReloc != null)
                return this.noReloc;
            this.noReloc = (value() & 4194304) != 0;
            return this.noReloc;
        }
        private Boolean now;

        /**
         * Set `RTLD_NOW` for this object.
         */
        public Boolean now() {
            if (this.now != null)
                return this.now;
            this.now = (value() & 1) != 0;
            return this.now;
        }
        private Boolean origin;

        /**
         * `$ORIGIN` must be handled.
         */
        public Boolean origin() {
            if (this.origin != null)
                return this.origin;
            this.origin = (value() & 128) != 0;
            return this.origin;
        }
        private Boolean pie;

        /**
         * Object is a Position Independent Executable (PIE).
         */
        public Boolean pie() {
            if (this.pie != null)
                return this.pie;
            this.pie = (value() & 134217728) != 0;
            return this.pie;
        }
        private Boolean rtldGlobal;

        /**
         * Set `RTLD_GLOBAL` for this object.
         */
        public Boolean rtldGlobal() {
            if (this.rtldGlobal != null)
                return this.rtldGlobal;
            this.rtldGlobal = (value() & 2) != 0;
            return this.rtldGlobal;
        }
        private Boolean singleton;

        /**
         * Singleton symbols are used.
         */
        public Boolean singleton() {
            if (this.singleton != null)
                return this.singleton;
            this.singleton = (value() & 33554432) != 0;
            return this.singleton;
        }
        private Boolean stub;

        /**
         * Object is a stub.
         * See [Stub Objects](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/stub-objects.html).
         */
        public Boolean stub() {
            if (this.stub != null)
                return this.stub;
            this.stub = (value() & 67108864) != 0;
            return this.stub;
        }
        private Boolean symIntpose;

        /**
         * Object has individual symbol interposers.
         */
        public Boolean symIntpose() {
            if (this.symIntpose != null)
                return this.symIntpose;
            this.symIntpose = (value() & 8388608) != 0;
            return this.symIntpose;
        }
        private Boolean trans;

        /**
         * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1019">Source</a>
         */
        public Boolean trans() {
            if (this.trans != null)
                return this.trans;
            this.trans = (value() & 512) != 0;
            return this.trans;
        }
        private Boolean weakFilter;

        /**
         * Object is a weak standard filter.
         */
        public Boolean weakFilter() {
            if (this.weakFilter != null)
                return this.weakFilter;
            this.weakFilter = (value() & 536870912) != 0;
            return this.weakFilter;
        }
        private long value;
        private Elf _root;
        private KaitaiStruct _parent;
        public long value() { return value; }
        public Elf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html">Figure 5-11: DT_FLAGS values</a>
     * @see <a href="https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095">Source</a>
     * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER7-TBL-5">Source</a>
     */
    public static class DtFlagValues extends KaitaiStruct {

        public DtFlagValues(KaitaiStream _io, long value) {
            this(_io, null, null, value);
        }

        public DtFlagValues(KaitaiStream _io, KaitaiStruct _parent, long value) {
            this(_io, _parent, null, value);
        }

        public DtFlagValues(KaitaiStream _io, KaitaiStruct _parent, Elf _root, long value) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.value = value;
            _read();
        }
        private void _read() {
        }

        public void _fetchInstances() {
        }
        private Boolean bindNow;

        /**
         * all relocations for this object must be processed before returning
         * control to the program
         */
        public Boolean bindNow() {
            if (this.bindNow != null)
                return this.bindNow;
            this.bindNow = (value() & 8) != 0;
            return this.bindNow;
        }
        private Boolean origin;

        /**
         * object may reference the $ORIGIN substitution string
         */
        public Boolean origin() {
            if (this.origin != null)
                return this.origin;
            this.origin = (value() & 1) != 0;
            return this.origin;
        }
        private Boolean staticTls;

        /**
         * object uses static thread-local storage scheme
         */
        public Boolean staticTls() {
            if (this.staticTls != null)
                return this.staticTls;
            this.staticTls = (value() & 16) != 0;
            return this.staticTls;
        }
        private Boolean symbolic;

        /**
         * symbolic linking
         */
        public Boolean symbolic() {
            if (this.symbolic != null)
                return this.symbolic;
            this.symbolic = (value() & 2) != 0;
            return this.symbolic;
        }
        private Boolean textrel;

        /**
         * relocation entries might request modifications to a non-writable segment
         */
        public Boolean textrel() {
            if (this.textrel != null)
                return this.textrel;
            this.textrel = (value() & 4) != 0;
            return this.textrel;
        }
        private long value;
        private Elf _root;
        private KaitaiStruct _parent;
        public long value() { return value; }
        public Elf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://gabi.xinuos.com/v42/elf/02-eheader.html">Source</a>
     * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-header.html">Source</a>
     */
    public static class EndianElf extends KaitaiStruct {
        public static EndianElf fromFile(String fileName) throws IOException {
            return new EndianElf(new ByteBufferKaitaiStream(fileName));
        }
        private Boolean _is_le;

        public EndianElf(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EndianElf(KaitaiStream _io, Elf _parent) {
            this(_io, _parent, null);
        }

        public EndianElf(KaitaiStream _io, Elf _parent, Elf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            {
                Endian on = _root().endian();
                if (on != null) {
                    switch (_root().endian()) {
                    case LE: {
                        this._is_le = true;
                        break;
                    }
                    case BE: {
                        this._is_le = false;
                        break;
                    }
                    }
                }
            }

            if (_is_le == null) {
                throw new KaitaiStream.UndecidedEndiannessError();
            } else if (_is_le) {
                _readLE();
            } else {
                _readBE();
            }
        }
        private void _readLE() {
            this.eType = Elf.ObjType.byId(this._io.readU2le());
            this.machine = Elf.Machine.byId(this._io.readU2le());
            if (this.machine == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.machine, this._io, "/types/endian_elf/seq/1");
            }
            this.eVersion = this._io.readU4le();
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this.entryPoint = ((Number) (this._io.readU4le())).longValue();
                        break;
                    }
                    case B64: {
                        this.entryPoint = this._io.readU8le();
                        break;
                    }
                    }
                }
            }
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this.ofsProgramHeaders = ((Number) (this._io.readU4le())).longValue();
                        break;
                    }
                    case B64: {
                        this.ofsProgramHeaders = this._io.readU8le();
                        break;
                    }
                    }
                }
            }
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this.ofsSectionHeaders = ((Number) (this._io.readU4le())).longValue();
                        break;
                    }
                    case B64: {
                        this.ofsSectionHeaders = this._io.readU8le();
                        break;
                    }
                    }
                }
            }
            this.flags = this._io.readBytes(4);
            this.eEhsize = this._io.readU2le();
            this.programHeaderSize = this._io.readU2le();
            this.numProgramHeaders = this._io.readU2le();
            this.sectionHeaderSize = this._io.readU2le();
            this.numSectionHeaders = this._io.readU2le();
            this.sectionNamesIdx = this._io.readU2le();
        }
        private void _readBE() {
            this.eType = Elf.ObjType.byId(this._io.readU2be());
            this.machine = Elf.Machine.byId(this._io.readU2be());
            if (this.machine == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.machine, this._io, "/types/endian_elf/seq/1");
            }
            this.eVersion = this._io.readU4be();
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this.entryPoint = ((Number) (this._io.readU4be())).longValue();
                        break;
                    }
                    case B64: {
                        this.entryPoint = this._io.readU8be();
                        break;
                    }
                    }
                }
            }
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this.ofsProgramHeaders = ((Number) (this._io.readU4be())).longValue();
                        break;
                    }
                    case B64: {
                        this.ofsProgramHeaders = this._io.readU8be();
                        break;
                    }
                    }
                }
            }
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this.ofsSectionHeaders = ((Number) (this._io.readU4be())).longValue();
                        break;
                    }
                    case B64: {
                        this.ofsSectionHeaders = this._io.readU8be();
                        break;
                    }
                    }
                }
            }
            this.flags = this._io.readBytes(4);
            this.eEhsize = this._io.readU2be();
            this.programHeaderSize = this._io.readU2be();
            this.numProgramHeaders = this._io.readU2be();
            this.sectionHeaderSize = this._io.readU2be();
            this.numSectionHeaders = this._io.readU2be();
            this.sectionNamesIdx = this._io.readU2be();
        }

        public void _fetchInstances() {
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        break;
                    }
                    case B64: {
                        break;
                    }
                    }
                }
            }
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        break;
                    }
                    case B64: {
                        break;
                    }
                    }
                }
            }
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        break;
                    }
                    case B64: {
                        break;
                    }
                    }
                }
            }
            programHeaders();
            if (this.programHeaders != null) {
                for (int i = 0; i < this.programHeaders.size(); i++) {
                    this.programHeaders.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            sectionHeaders();
            if (this.sectionHeaders != null) {
                for (int i = 0; i < this.sectionHeaders.size(); i++) {
                    this.sectionHeaders.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            sectionNames();
            if (this.sectionNames != null) {
                this.sectionNames._fetchInstances();
            }
        }
        public static class DynsymSection extends KaitaiStruct {
            private Boolean _is_le;

            public DynsymSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.entries = new ArrayList<DynsymSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new DynsymSectionEntry(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<DynsymSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new DynsymSectionEntry(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private Boolean isStringTableLinked;
            public Boolean isStringTableLinked() {
                if (this.isStringTableLinked != null)
                    return this.isStringTableLinked;
                this.isStringTableLinked = _parent().linkedSection().type() == Elf.ShType.STRTAB;
                return this.isStringTableLinked;
            }
            private List<DynsymSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public List<DynsymSectionEntry> entries() { return entries; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        }

        /**
         * @see <a href="https://gabi.xinuos.com/elf/05-symtab.html">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html">Source</a>
         */
        public static class DynsymSectionEntry extends KaitaiStruct {
            private Boolean _is_le;

            public DynsymSectionEntry(KaitaiStream _io, Elf.EndianElf.DynsymSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.ofsName = this._io.readU4le();
                if (_root().bits() == Elf.Bits.B32) {
                    this.valueB32 = this._io.readU4le();
                }
                if (_root().bits() == Elf.Bits.B32) {
                    this.sizeB32 = this._io.readU4le();
                }
                this.bind = Elf.SymbolBinding.byId(this._io.readBitsIntBe(4));
                this.type = Elf.SymbolType.byId(this._io.readBitsIntBe(4));
                this.other = this._io.readU1();
                this.shIdx = this._io.readU2le();
                if (_root().bits() == Elf.Bits.B64) {
                    this.valueB64 = this._io.readU8le();
                }
                if (_root().bits() == Elf.Bits.B64) {
                    this.sizeB64 = this._io.readU8le();
                }
            }
            private void _readBE() {
                this.ofsName = this._io.readU4be();
                if (_root().bits() == Elf.Bits.B32) {
                    this.valueB32 = this._io.readU4be();
                }
                if (_root().bits() == Elf.Bits.B32) {
                    this.sizeB32 = this._io.readU4be();
                }
                this.bind = Elf.SymbolBinding.byId(this._io.readBitsIntBe(4));
                this.type = Elf.SymbolType.byId(this._io.readBitsIntBe(4));
                this.other = this._io.readU1();
                this.shIdx = this._io.readU2be();
                if (_root().bits() == Elf.Bits.B64) {
                    this.valueB64 = this._io.readU8be();
                }
                if (_root().bits() == Elf.Bits.B64) {
                    this.sizeB64 = this._io.readU8be();
                }
            }

            public void _fetchInstances() {
                if (_root().bits() == Elf.Bits.B32) {
                }
                if (_root().bits() == Elf.Bits.B32) {
                }
                if (_root().bits() == Elf.Bits.B64) {
                }
                if (_root().bits() == Elf.Bits.B64) {
                }
                name();
                if (this.name != null) {
                }
            }
            private Boolean isShIdxOs;
            public Boolean isShIdxOs() {
                if (this.isShIdxOs != null)
                    return this.isShIdxOs;
                this.isShIdxOs =  ((shIdx() >= _root().shIdxLoOs()) && (shIdx() <= _root().shIdxHiOs())) ;
                return this.isShIdxOs;
            }
            private Boolean isShIdxProc;
            public Boolean isShIdxProc() {
                if (this.isShIdxProc != null)
                    return this.isShIdxProc;
                this.isShIdxProc =  ((shIdx() >= _root().shIdxLoProc()) && (shIdx() <= _root().shIdxHiProc())) ;
                return this.isShIdxProc;
            }
            private Boolean isShIdxReserved;
            public Boolean isShIdxReserved() {
                if (this.isShIdxReserved != null)
                    return this.isShIdxReserved;
                this.isShIdxReserved =  ((shIdx() >= _root().shIdxLoReserved()) && (shIdx() <= _root().shIdxHiReserved())) ;
                return this.isShIdxReserved;
            }
            private String name;
            public String name() {
                if (this.name != null)
                    return this.name;
                if ( ((ofsName() != 0) && (_parent().isStringTableLinked())) ) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    if (_is_le) {
                        this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    } else {
                        this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    }
                    io.seek(_pos);
                }
                return this.name;
            }
            private SectionHeaderIdxSpecial shIdxSpecial;
            public SectionHeaderIdxSpecial shIdxSpecial() {
                if (this.shIdxSpecial != null)
                    return this.shIdxSpecial;
                this.shIdxSpecial = Elf.SectionHeaderIdxSpecial.byId(shIdx());
                return this.shIdxSpecial;
            }
            private Long size;
            public Long size() {
                if (this.size != null)
                    return this.size;
                this.size = ((Number) ((_root().bits() == Elf.Bits.B32 ? sizeB32() : (_root().bits() == Elf.Bits.B64 ? sizeB64() : 0)))).longValue();
                return this.size;
            }
            private Long value;
            public Long value() {
                if (this.value != null)
                    return this.value;
                this.value = ((Number) ((_root().bits() == Elf.Bits.B32 ? valueB32() : (_root().bits() == Elf.Bits.B64 ? valueB64() : 0)))).longValue();
                return this.value;
            }
            private SymbolVisibility visibility;

            /**
             * @see <a href="https://github.com/xinuos/gabi/commit/acd5ebb2962cf243dca4983bc934442b42ef96f5">Source</a>
             */
            public SymbolVisibility visibility() {
                if (this.visibility != null)
                    return this.visibility;
                this.visibility = Elf.SymbolVisibility.byId(other() & 7);
                return this.visibility;
            }
            private long ofsName;
            private Long valueB32;
            private Long sizeB32;
            private SymbolBinding bind;
            private SymbolType type;
            private int other;
            private int shIdx;
            private Long valueB64;
            private Long sizeB64;
            private Elf _root;
            private Elf.EndianElf.DynsymSection _parent;
            public long ofsName() { return ofsName; }
            public Long valueB32() { return valueB32; }
            public Long sizeB32() { return sizeB32; }
            public SymbolBinding bind() { return bind; }
            public SymbolType type() { return type; }

            /**
             * don't read this field, access `visibility` instead
             */
            public int other() { return other; }

            /**
             * section header index
             */
            public int shIdx() { return shIdx; }
            public Long valueB64() { return valueB64; }
            public Long sizeB64() { return sizeB64; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.DynsymSection _parent() { return _parent; }
        }
        public static class NoteSection extends KaitaiStruct {
            private Boolean _is_le;

            public NoteSection(KaitaiStream _io, KaitaiStruct _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.entries = new ArrayList<NoteSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new NoteSectionEntry(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<NoteSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new NoteSectionEntry(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private List<NoteSectionEntry> entries;
            private Elf _root;
            private KaitaiStruct _parent;
            public List<NoteSectionEntry> entries() { return entries; }
            public Elf _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }

        /**
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/note-section.html">Source</a>
         * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section">Source</a>
         */
        public static class NoteSectionEntry extends KaitaiStruct {
            private Boolean _is_le;

            public NoteSectionEntry(KaitaiStream _io, Elf.EndianElf.NoteSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.lenName = this._io.readU4le();
                this.lenDescriptor = this._io.readU4le();
                this.type = this._io.readU4le();
                this.name = KaitaiStream.bytesTerminate(this._io.readBytes(lenName()), (byte) 0, false);
                this.namePadding = this._io.readBytes(KaitaiStream.mod(-(lenName()), 4));
                this.descriptor = this._io.readBytes(lenDescriptor());
                this.descriptorPadding = this._io.readBytes(KaitaiStream.mod(-(lenDescriptor()), 4));
            }
            private void _readBE() {
                this.lenName = this._io.readU4be();
                this.lenDescriptor = this._io.readU4be();
                this.type = this._io.readU4be();
                this.name = KaitaiStream.bytesTerminate(this._io.readBytes(lenName()), (byte) 0, false);
                this.namePadding = this._io.readBytes(KaitaiStream.mod(-(lenName()), 4));
                this.descriptor = this._io.readBytes(lenDescriptor());
                this.descriptorPadding = this._io.readBytes(KaitaiStream.mod(-(lenDescriptor()), 4));
            }

            public void _fetchInstances() {
            }
            private long lenName;
            private long lenDescriptor;
            private long type;
            private byte[] name;
            private byte[] namePadding;
            private byte[] descriptor;
            private byte[] descriptorPadding;
            private Elf _root;
            private Elf.EndianElf.NoteSection _parent;
            public long lenName() { return lenName; }
            public long lenDescriptor() { return lenDescriptor; }
            public long type() { return type; }

            /**
             * Although the ELF specification seems to hint that the `note_name` field
             * is ASCII this isn't the case for Linux binaries that have a
             * `.gnu.build.attributes` section.
             * @see <a href="https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes">Source</a>
             */
            public byte[] name() { return name; }
            public byte[] namePadding() { return namePadding; }
            public byte[] descriptor() { return descriptor; }
            public byte[] descriptorPadding() { return descriptorPadding; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.NoteSection _parent() { return _parent; }
        }

        /**
         * Same type as `sh_dynamic_section`, but it does not use
         * `_parent.linked_section`, which is available only in section headers
         * (i.e. when `_parent` is of type `section_header`). This allows it to
         * be used in program headers (i.e. from the `program_header` type).
         * 
         * The inability to access `linked_section` means that offsets in the
         * string table (which should be stored in the `.dynstr` section) will
         * not be resolved to strings and will be provided only in raw form in
         * the `value_or_ptr` field. In other words, the
         * `ph_dynamic_section_entry` type has no `value_str` instance, unlike
         * the `sh_dynamic_section_entry` type.
         * 
         * There is another way to find the string table referenced by the
         * dynamic section entries that does not rely on `linked_section`, but is
         * a bit more complex (and is therefore considered out of scope of this
         * .ksy spec): the mandatory dynamic tag `dynamic_array_tags::strtab`
         * (`DT_STRTAB`) specifies the virtual address of the string table, and
         * `dynamic_array_tags::strsz` (`DT_STRSZ`) specifies its size in bytes.
         * The virtual address can be converted to a file offset by reading the
         * program headers - see the source code for the `readelf` command:
         * 
         * 1. [`offset_from_vma` call site with an address from `DT_STRTAB` as an
         *   argument](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13018)
         * 2. [`offset_from_vma` function
         *   definition](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L7788)
         * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         */
        public static class PhDynamicSection extends KaitaiStruct {
            private Boolean _is_le;

            public PhDynamicSection(KaitaiStream _io, Elf.EndianElf.ProgramHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.entries = new ArrayList<PhDynamicSectionEntry>();
                {
                    PhDynamicSectionEntry _it;
                    int i = 0;
                    do {
                        _it = new PhDynamicSectionEntry(this._io, this, _root, _is_le);
                        this.entries.add(_it);
                        i++;
                    } while (!(_it.tagEnum() == Elf.DynamicArrayTags.NULL));
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<PhDynamicSectionEntry>();
                {
                    PhDynamicSectionEntry _it;
                    int i = 0;
                    do {
                        _it = new PhDynamicSectionEntry(this._io, this, _root, _is_le);
                        this.entries.add(_it);
                        i++;
                    } while (!(_it.tagEnum() == Elf.DynamicArrayTags.NULL));
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private List<PhDynamicSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.ProgramHeader _parent;
            public List<PhDynamicSectionEntry> entries() { return entries; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.ProgramHeader _parent() { return _parent; }
        }

        /**
         * Same type as `sh_dynamic_section_entry`, but without the `value_str`
         * instance - see the documentation for `ph_dynamic_section` for more
         * details.
         * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         */
        public static class PhDynamicSectionEntry extends KaitaiStruct {
            private Boolean _is_le;

            public PhDynamicSectionEntry(KaitaiStream _io, Elf.EndianElf.PhDynamicSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.tag = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.tag = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.valueOrPtr = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.valueOrPtr = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
            }
            private void _readBE() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.tag = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.tag = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.valueOrPtr = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.valueOrPtr = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
            }

            public void _fetchInstances() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                flag1Values();
                if (this.flag1Values != null) {
                    this.flag1Values._fetchInstances();
                }
                flagValues();
                if (this.flagValues != null) {
                    this.flagValues._fetchInstances();
                }
            }
            private DtFlag1Values flag1Values;
            public DtFlag1Values flag1Values() {
                if (this.flag1Values != null)
                    return this.flag1Values;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS_1) {
                    if (_is_le) {
                        this.flag1Values = new DtFlag1Values(this._io, this, _root, valueOrPtr());
                    } else {
                        this.flag1Values = new DtFlag1Values(this._io, this, _root, valueOrPtr());
                    }
                }
                return this.flag1Values;
            }
            private DtFlagValues flagValues;
            public DtFlagValues flagValues() {
                if (this.flagValues != null)
                    return this.flagValues;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS) {
                    if (_is_le) {
                        this.flagValues = new DtFlagValues(this._io, this, _root, valueOrPtr());
                    } else {
                        this.flagValues = new DtFlagValues(this._io, this, _root, valueOrPtr());
                    }
                }
                return this.flagValues;
            }
            private Boolean isValueStr;
            public Boolean isValueStr() {
                if (this.isValueStr != null)
                    return this.isValueStr;
                this.isValueStr =  ((valueOrPtr() != 0) && ( ((tagEnum() == Elf.DynamicArrayTags.NEEDED) || (tagEnum() == Elf.DynamicArrayTags.SONAME) || (tagEnum() == Elf.DynamicArrayTags.RPATH) || (tagEnum() == Elf.DynamicArrayTags.RUNPATH) || (tagEnum() == Elf.DynamicArrayTags.SUNW_AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.SUNW_FILTER) || (tagEnum() == Elf.DynamicArrayTags.AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.FILTER) || (tagEnum() == Elf.DynamicArrayTags.CONFIG) || (tagEnum() == Elf.DynamicArrayTags.DEPAUDIT) || (tagEnum() == Elf.DynamicArrayTags.AUDIT)) )) ;
                return this.isValueStr;
            }
            private DynamicArrayTags tagEnum;
            public DynamicArrayTags tagEnum() {
                if (this.tagEnum != null)
                    return this.tagEnum;
                this.tagEnum = Elf.DynamicArrayTags.byId(tag());
                return this.tagEnum;
            }
            private Long tag;
            private Long valueOrPtr;
            private Elf _root;
            private Elf.EndianElf.PhDynamicSection _parent;
            public Long tag() { return tag; }
            public Long valueOrPtr() { return valueOrPtr; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.PhDynamicSection _parent() { return _parent; }
        }

        /**
         * @see <a href="https://gabi.xinuos.com/v42/elf/07-pheader.html#program-header-entry">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-header.html">Source</a>
         */
        public static class ProgramHeader extends KaitaiStruct {
            private Boolean _is_le;

            public ProgramHeader(KaitaiStream _io, Elf.EndianElf _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.type = Elf.PhType.byId(this._io.readU4le());
                if (_root().bits() == Elf.Bits.B64) {
                    this.flags64 = this._io.readU4le();
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.ofsBody = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.ofsBody = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.virtAddr = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.virtAddr = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.physAddr = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.physAddr = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.lenBody = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.lenBody = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.memorySize = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.memorySize = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                if (_root().bits() == Elf.Bits.B32) {
                    this.flags32 = this._io.readU4le();
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.align = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.align = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
            }
            private void _readBE() {
                this.type = Elf.PhType.byId(this._io.readU4be());
                if (_root().bits() == Elf.Bits.B64) {
                    this.flags64 = this._io.readU4be();
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.ofsBody = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.ofsBody = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.virtAddr = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.virtAddr = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.physAddr = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.physAddr = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.lenBody = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.lenBody = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.memorySize = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.memorySize = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                if (_root().bits() == Elf.Bits.B32) {
                    this.flags32 = this._io.readU4be();
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.align = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.align = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
            }

            public void _fetchInstances() {
                if (_root().bits() == Elf.Bits.B64) {
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                if (_root().bits() == Elf.Bits.B32) {
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                body();
                if (this.body != null) {
                    {
                        PhType on = type();
                        if (on != null) {
                            switch (type()) {
                            case DYNAMIC: {
                                ((PhDynamicSection) (this.body))._fetchInstances();
                                break;
                            }
                            case INTERP: {
                                ((PhInterpreter) (this.body))._fetchInstances();
                                break;
                            }
                            case NOTE: {
                                ((NoteSection) (this.body))._fetchInstances();
                                break;
                            }
                            default: {
                                break;
                            }
                            }
                        } else {
                        }
                    }
                }
                flagsObj();
                if (this.flagsObj != null) {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                this.flagsObj._fetchInstances();
                                break;
                            }
                            case B64: {
                                ((PhdrTypeFlags) (this.flagsObj))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }
            }

            /**
             * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#program-interpreter">Source</a>
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-interpreter.html">Source</a>
             */
            public static class PhInterpreter extends KaitaiStruct {
                private Boolean _is_le;

                public PhInterpreter(KaitaiStream _io, Elf.EndianElf.ProgramHeader _parent, Elf _root, boolean _is_le) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this._is_le = _is_le;
                    _read();
                }
                private void _read() {

                    if (_is_le == null) {
                        throw new KaitaiStream.UndecidedEndiannessError();
                    } else if (_is_le) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE() {
                    this.pathName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                }
                private void _readBE() {
                    this.pathName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                }

                public void _fetchInstances() {
                }
                private String pathName;
                private Elf _root;
                private Elf.EndianElf.ProgramHeader _parent;
                public String pathName() { return pathName; }
                public Elf _root() { return _root; }
                public Elf.EndianElf.ProgramHeader _parent() { return _parent; }
            }
            private Object body;

            /**
             * Note: a program header may not have a valid body in the same ELF
             * file, so accessing `body` may result in reading garbage or
             * triggering EOF errors.
             * 
             * In particular, `*.debug` files produced by elfutils'
             * `eu-strip --strip-debug` (as used by Fedora/RHEL and other
             * RPM-based distros for their `*-debuginfo` packages, e.g.
             * `glibc-debuginfo`) copy the original binary's program header table
             * verbatim, including `ofs_body`/`len_body` (i.e.
             * `p_offset`/`p_filesz`), while dropping the actual contents of most
             * segments. Such segments can be recognized by the fact that the
             * corresponding section headers have type `sh_type::nobits`
             * (`SHT_NOBITS`). However, this Kaitai Struct implementation doesn't
             * know the mapping between program headers and section headers, so
             * this must be handled externally.
             * 
             * `*.debug` files from Debian/Ubuntu `*-dbg` packages (e.g.
             * `libc6-dbg`) are usually not affected by this issue, because they
             * are produced using GNU Binutils (`objcopy --only-keep-debug`),
             * which zeroes `len_body` for segments whose contents were omitted
             * (which reliably tells us that there is no `body`).
             */
            public Object body() {
                if (this.body != null)
                    return this.body;
                if (lenBody() != 0) {
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(ofsBody());
                    if (_is_le) {
                        {
                            PhType on = type();
                            if (on != null) {
                                switch (type()) {
                                case DYNAMIC: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new PhDynamicSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case INTERP: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new PhInterpreter(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case NOTE: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new NoteSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                default: {
                                    this.body = io.readBytes(lenBody());
                                    break;
                                }
                                }
                            } else {
                                this.body = io.readBytes(lenBody());
                            }
                        }
                    } else {
                        {
                            PhType on = type();
                            if (on != null) {
                                switch (type()) {
                                case DYNAMIC: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new PhDynamicSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case INTERP: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new PhInterpreter(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case NOTE: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new NoteSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                default: {
                                    this.body = io.readBytes(lenBody());
                                    break;
                                }
                                }
                            } else {
                                this.body = io.readBytes(lenBody());
                            }
                        }
                    }
                    io.seek(_pos);
                }
                return this.body;
            }
            private PhdrTypeFlags flagsObj;
            public PhdrTypeFlags flagsObj() {
                if (this.flagsObj != null)
                    return this.flagsObj;
                if (_is_le) {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                this.flagsObj = new PhdrTypeFlags(this._io, this, _root, flags32());
                                break;
                            }
                            case B64: {
                                this.flagsObj = new PhdrTypeFlags(this._io, this, _root, flags64());
                                break;
                            }
                            }
                        }
                    }
                } else {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                this.flagsObj = new PhdrTypeFlags(this._io, this, _root, flags32());
                                break;
                            }
                            case B64: {
                                this.flagsObj = new PhdrTypeFlags(this._io, this, _root, flags64());
                                break;
                            }
                            }
                        }
                    }
                }
                return this.flagsObj;
            }
            private PhType type;
            private Long flags64;
            private Long ofsBody;
            private Long virtAddr;
            private Long physAddr;
            private Long lenBody;
            private Long memorySize;
            private Long flags32;
            private Long align;
            private Elf _root;
            private Elf.EndianElf _parent;
            public PhType type() { return type; }
            public Long flags64() { return flags64; }
            public Long ofsBody() { return ofsBody; }
            public Long virtAddr() { return virtAddr; }
            public Long physAddr() { return physAddr; }
            public Long lenBody() { return lenBody; }
            public Long memorySize() { return memorySize; }
            public Long flags32() { return flags32; }
            public Long align() { return align; }
            public Elf _root() { return _root; }
            public Elf.EndianElf _parent() { return _parent; }
        }

        /**
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/relocation-sections.html">Source</a>
         * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html">Source</a>
         */
        public static class RelocationSection extends KaitaiStruct {
            private Boolean _is_le;

            public RelocationSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le, boolean hasAddend) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.hasAddend = hasAddend;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.entries = new ArrayList<RelocationSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new RelocationSectionEntry(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<RelocationSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new RelocationSectionEntry(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private List<RelocationSectionEntry> entries;
            private boolean hasAddend;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public List<RelocationSectionEntry> entries() { return entries; }
            public boolean hasAddend() { return hasAddend; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        }
        public static class RelocationSectionEntry extends KaitaiStruct {
            private Boolean _is_le;

            public RelocationSectionEntry(KaitaiStream _io, Elf.EndianElf.RelocationSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.offset = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.offset = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.info = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.info = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                if (_parent().hasAddend()) {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                this.addend = ((Number) (this._io.readS4le())).longValue();
                                break;
                            }
                            case B64: {
                                this.addend = this._io.readS8le();
                                break;
                            }
                            }
                        }
                    }
                }
            }
            private void _readBE() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.offset = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.offset = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.info = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.info = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                if (_parent().hasAddend()) {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                this.addend = ((Number) (this._io.readS4be())).longValue();
                                break;
                            }
                            case B64: {
                                this.addend = this._io.readS8be();
                                break;
                            }
                            }
                        }
                    }
                }
            }

            public void _fetchInstances() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                if (_parent().hasAddend()) {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                break;
                            }
                            case B64: {
                                break;
                            }
                            }
                        }
                    }
                }
            }
            private Long offset;
            private Long info;
            private Long addend;
            private Elf _root;
            private Elf.EndianElf.RelocationSection _parent;
            public Long offset() { return offset; }
            public Long info() { return info; }
            public Long addend() { return addend; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.RelocationSection _parent() { return _parent; }
        }

        /**
         * @see <a href="https://gabi.xinuos.com/v42/elf/03-sheader.html#section-header-table-entry">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html">Source</a>
         */
        public static class SectionHeader extends KaitaiStruct {
            private Boolean _is_le;

            public SectionHeader(KaitaiStream _io, Elf.EndianElf _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.ofsName = this._io.readU4le();
                this.type = Elf.ShType.byId(this._io.readU4le());
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.flags = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.flags = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.addr = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.addr = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.ofsBody = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.ofsBody = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.lenBody = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.lenBody = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                this.linkedSectionIdx = this._io.readU4le();
                this.info = this._io.readU4le();
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.align = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.align = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.entrySize = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.entrySize = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
            }
            private void _readBE() {
                this.ofsName = this._io.readU4be();
                this.type = Elf.ShType.byId(this._io.readU4be());
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.flags = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.flags = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.addr = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.addr = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.ofsBody = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.ofsBody = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.lenBody = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.lenBody = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                this.linkedSectionIdx = this._io.readU4be();
                this.info = this._io.readU4be();
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.align = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.align = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.entrySize = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.entrySize = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
            }

            public void _fetchInstances() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                body();
                if (this.body != null) {
                    {
                        ShType on = type();
                        if (on != null) {
                            switch (type()) {
                            case DYNAMIC: {
                                ((ShDynamicSection) (this.body))._fetchInstances();
                                break;
                            }
                            case DYNSYM: {
                                ((DynsymSection) (this.body))._fetchInstances();
                                break;
                            }
                            case GNU_VERDEF: {
                                ((VerdefSection) (this.body))._fetchInstances();
                                break;
                            }
                            case GNU_VERNEED: {
                                ((VerneedSection) (this.body))._fetchInstances();
                                break;
                            }
                            case GNU_VERSYM: {
                                ((VersymSection) (this.body))._fetchInstances();
                                break;
                            }
                            case NOTE: {
                                ((NoteSection) (this.body))._fetchInstances();
                                break;
                            }
                            case REL: {
                                ((RelocationSection) (this.body))._fetchInstances();
                                break;
                            }
                            case RELA: {
                                ((RelocationSection) (this.body))._fetchInstances();
                                break;
                            }
                            case STRTAB: {
                                ((StringsStruct) (this.body))._fetchInstances();
                                break;
                            }
                            case SYMTAB: {
                                ((DynsymSection) (this.body))._fetchInstances();
                                break;
                            }
                            default: {
                                break;
                            }
                            }
                        } else {
                        }
                    }
                }
                flagsObj();
                if (this.flagsObj != null) {
                    this.flagsObj._fetchInstances();
                }
                name();
                if (this.name != null) {
                }
            }
            private Object body;
            public Object body() {
                if (this.body != null)
                    return this.body;
                if (type() != Elf.ShType.NOBITS) {
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(ofsBody());
                    if (_is_le) {
                        {
                            ShType on = type();
                            if (on != null) {
                                switch (type()) {
                                case DYNAMIC: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new ShDynamicSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case DYNSYM: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new DynsymSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case GNU_VERDEF: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new VerdefSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case GNU_VERNEED: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new VerneedSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case GNU_VERSYM: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new VersymSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case NOTE: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new NoteSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case REL: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new RelocationSection(_io_body, this, _root, _is_le, false);
                                    break;
                                }
                                case RELA: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new RelocationSection(_io_body, this, _root, _is_le, true);
                                    break;
                                }
                                case STRTAB: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new StringsStruct(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case SYMTAB: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new DynsymSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                default: {
                                    this.body = io.readBytes(lenBody());
                                    break;
                                }
                                }
                            } else {
                                this.body = io.readBytes(lenBody());
                            }
                        }
                    } else {
                        {
                            ShType on = type();
                            if (on != null) {
                                switch (type()) {
                                case DYNAMIC: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new ShDynamicSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case DYNSYM: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new DynsymSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case GNU_VERDEF: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new VerdefSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case GNU_VERNEED: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new VerneedSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case GNU_VERSYM: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new VersymSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case NOTE: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new NoteSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case REL: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new RelocationSection(_io_body, this, _root, _is_le, false);
                                    break;
                                }
                                case RELA: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new RelocationSection(_io_body, this, _root, _is_le, true);
                                    break;
                                }
                                case STRTAB: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new StringsStruct(_io_body, this, _root, _is_le);
                                    break;
                                }
                                case SYMTAB: {
                                    KaitaiStream _io_body = io.substream(lenBody());
                                    this.body = new DynsymSection(_io_body, this, _root, _is_le);
                                    break;
                                }
                                default: {
                                    this.body = io.readBytes(lenBody());
                                    break;
                                }
                                }
                            } else {
                                this.body = io.readBytes(lenBody());
                            }
                        }
                    }
                    io.seek(_pos);
                }
                return this.body;
            }
            private SectionHeaderFlags flagsObj;
            public SectionHeaderFlags flagsObj() {
                if (this.flagsObj != null)
                    return this.flagsObj;
                if (_is_le) {
                    this.flagsObj = new SectionHeaderFlags(this._io, this, _root, flags());
                } else {
                    this.flagsObj = new SectionHeaderFlags(this._io, this, _root, flags());
                }
                return this.flagsObj;
            }
            private SectionHeader linkedSection;

            /**
             * may reference a later section header, so don't try to access too early (use only lazy `instances`)
             * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link">Source</a>
             */
            public SectionHeader linkedSection() {
                if (this.linkedSection != null)
                    return this.linkedSection;
                if ( ((linkedSectionIdx() != Elf.SectionHeaderIdxSpecial.UNDEFINED.id()) && (linkedSectionIdx() < _root().header().numSectionHeaders())) ) {
                    this.linkedSection = _root().header().sectionHeaders().get(((Number) (linkedSectionIdx())).intValue());
                }
                return this.linkedSection;
            }
            private String name;
            public String name() {
                if (this.name != null)
                    return this.name;
                KaitaiStream io = _root().header().sectionNames()._io();
                long _pos = io.pos();
                io.seek(ofsName());
                if (_is_le) {
                    this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                } else {
                    this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                }
                io.seek(_pos);
                return this.name;
            }
            private long ofsName;
            private ShType type;
            private Long flags;
            private Long addr;
            private Long ofsBody;
            private Long lenBody;
            private long linkedSectionIdx;
            private long info;
            private Long align;
            private Long entrySize;
            private Elf _root;
            private Elf.EndianElf _parent;
            public long ofsName() { return ofsName; }
            public ShType type() { return type; }
            public Long flags() { return flags; }
            public Long addr() { return addr; }
            public Long ofsBody() { return ofsBody; }
            public Long lenBody() { return lenBody; }
            public long linkedSectionIdx() { return linkedSectionIdx; }
            public long info() { return info; }
            public Long align() { return align; }
            public Long entrySize() { return entrySize; }
            public Elf _root() { return _root; }
            public Elf.EndianElf _parent() { return _parent; }
        }

        /**
         * Same type as `ph_dynamic_section`, but it depends on
         * `_parent.linked_section`, so it can be used only in the
         * `section_header` type. See the documentation for `ph_dynamic_section`
         * for more details.
         * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         */
        public static class ShDynamicSection extends KaitaiStruct {
            private Boolean _is_le;

            public ShDynamicSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.entries = new ArrayList<ShDynamicSectionEntry>();
                {
                    ShDynamicSectionEntry _it;
                    int i = 0;
                    do {
                        _it = new ShDynamicSectionEntry(this._io, this, _root, _is_le);
                        this.entries.add(_it);
                        i++;
                    } while (!(_it.tagEnum() == Elf.DynamicArrayTags.NULL));
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<ShDynamicSectionEntry>();
                {
                    ShDynamicSectionEntry _it;
                    int i = 0;
                    do {
                        _it = new ShDynamicSectionEntry(this._io, this, _root, _is_le);
                        this.entries.add(_it);
                        i++;
                    } while (!(_it.tagEnum() == Elf.DynamicArrayTags.NULL));
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private Boolean isStringTableLinked;
            public Boolean isStringTableLinked() {
                if (this.isStringTableLinked != null)
                    return this.isStringTableLinked;
                this.isStringTableLinked = _parent().linkedSection().type() == Elf.ShType.STRTAB;
                return this.isStringTableLinked;
            }
            private List<ShDynamicSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public List<ShDynamicSectionEntry> entries() { return entries; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        }

        /**
         * Same type as `ph_dynamic_section_entry`, but with the `value_str`
         * instance - see the documentation for `ph_dynamic_section` for more
         * details.
         * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         */
        public static class ShDynamicSectionEntry extends KaitaiStruct {
            private Boolean _is_le;

            public ShDynamicSectionEntry(KaitaiStream _io, Elf.EndianElf.ShDynamicSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.tag = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.tag = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.valueOrPtr = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.valueOrPtr = this._io.readU8le();
                            break;
                        }
                        }
                    }
                }
            }
            private void _readBE() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.tag = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.tag = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this.valueOrPtr = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.valueOrPtr = this._io.readU8be();
                            break;
                        }
                        }
                    }
                }
            }

            public void _fetchInstances() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            break;
                        }
                        case B64: {
                            break;
                        }
                        }
                    }
                }
                flag1Values();
                if (this.flag1Values != null) {
                    this.flag1Values._fetchInstances();
                }
                flagValues();
                if (this.flagValues != null) {
                    this.flagValues._fetchInstances();
                }
                valueStr();
                if (this.valueStr != null) {
                }
            }
            private DtFlag1Values flag1Values;
            public DtFlag1Values flag1Values() {
                if (this.flag1Values != null)
                    return this.flag1Values;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS_1) {
                    if (_is_le) {
                        this.flag1Values = new DtFlag1Values(this._io, this, _root, valueOrPtr());
                    } else {
                        this.flag1Values = new DtFlag1Values(this._io, this, _root, valueOrPtr());
                    }
                }
                return this.flag1Values;
            }
            private DtFlagValues flagValues;
            public DtFlagValues flagValues() {
                if (this.flagValues != null)
                    return this.flagValues;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS) {
                    if (_is_le) {
                        this.flagValues = new DtFlagValues(this._io, this, _root, valueOrPtr());
                    } else {
                        this.flagValues = new DtFlagValues(this._io, this, _root, valueOrPtr());
                    }
                }
                return this.flagValues;
            }
            private Boolean isValueStr;
            public Boolean isValueStr() {
                if (this.isValueStr != null)
                    return this.isValueStr;
                this.isValueStr =  ((valueOrPtr() != 0) && ( ((tagEnum() == Elf.DynamicArrayTags.NEEDED) || (tagEnum() == Elf.DynamicArrayTags.SONAME) || (tagEnum() == Elf.DynamicArrayTags.RPATH) || (tagEnum() == Elf.DynamicArrayTags.RUNPATH) || (tagEnum() == Elf.DynamicArrayTags.SUNW_AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.SUNW_FILTER) || (tagEnum() == Elf.DynamicArrayTags.AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.FILTER) || (tagEnum() == Elf.DynamicArrayTags.CONFIG) || (tagEnum() == Elf.DynamicArrayTags.DEPAUDIT) || (tagEnum() == Elf.DynamicArrayTags.AUDIT)) )) ;
                return this.isValueStr;
            }
            private DynamicArrayTags tagEnum;
            public DynamicArrayTags tagEnum() {
                if (this.tagEnum != null)
                    return this.tagEnum;
                this.tagEnum = Elf.DynamicArrayTags.byId(tag());
                return this.tagEnum;
            }
            private String valueStr;
            public String valueStr() {
                if (this.valueStr != null)
                    return this.valueStr;
                if ( ((isValueStr()) && (_parent().isStringTableLinked())) ) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(valueOrPtr());
                    if (_is_le) {
                        this.valueStr = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                    } else {
                        this.valueStr = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                    }
                    io.seek(_pos);
                }
                return this.valueStr;
            }
            private Long tag;
            private Long valueOrPtr;
            private Elf _root;
            private Elf.EndianElf.ShDynamicSection _parent;
            public Long tag() { return tag; }
            public Long valueOrPtr() { return valueOrPtr; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.ShDynamicSection _parent() { return _parent; }
        }
        public static class StringsStruct extends KaitaiStruct {
            private Boolean _is_le;

            public StringsStruct(KaitaiStream _io, KaitaiStruct _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.entries = new ArrayList<String>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8));
                        i++;
                    }
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<String>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8));
                        i++;
                    }
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                }
            }
            private List<String> entries;
            private Elf _root;
            private KaitaiStruct _parent;
            public List<String> entries() { return entries; }
            public Elf _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }

        /**
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFEXTS">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VerdauxEntry extends KaitaiStruct {
            private Boolean _is_le;

            public VerdauxEntry(KaitaiStream _io, Elf.EndianElf.VerdefSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.ofsName = this._io.readU4le();
                this.ofsNext = this._io.readU4le();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 8)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verdaux_entry/seq/2");
                    }
                }
            }
            private void _readBE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.ofsName = this._io.readU4be();
                this.ofsNext = this._io.readU4be();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 8)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verdaux_entry/seq/2");
                    }
                }
            }

            public void _fetchInstances() {
                if (ofsStart() < 0) {
                }
                name();
                if (this.name != null) {
                }
                next();
                if (this.next != null) {
                    this.next._fetchInstances();
                }
            }
            private String name;
            public String name() {
                if (this.name != null)
                    return this.name;
                if (_parent().isStringTableLinked()) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    if (_is_le) {
                        this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    } else {
                        this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    }
                    io.seek(_pos);
                }
                return this.name;
            }
            private VerdauxEntry next;
            public VerdauxEntry next() {
                if (this.next != null)
                    return this.next;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next = new VerdauxEntry(this._io, _parent(), _root, _is_le);
                    } else {
                        this.next = new VerdauxEntry(this._io, _parent(), _root, _is_le);
                    }
                    this._io.seek(_pos);
                }
                return this.next;
            }
            private Integer ofsStart;
            public Integer ofsStart() {
                if (this.ofsStart != null)
                    return this.ofsStart;
                this.ofsStart = ((Number) (_io().pos())).intValue();
                return this.ofsStart;
            }
            private byte[] _unnamed0;
            private long ofsName;
            private long ofsNext;
            private Elf _root;
            private Elf.EndianElf.VerdefSection _parent;
            public byte[] _unnamed0() { return _unnamed0; }

            /**
             * Byte offset to the version or dependency name string in the linked
             * string table.
             */
            public long ofsName() { return ofsName; }

            /**
             * Byte offset to the next verdaux entry, relative to the start of
             * this `verdaux_entry`. A value of zero means that there is no next
             * entry.
             */
            public long ofsNext() { return ofsNext; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.VerdefSection _parent() { return _parent; }
        }

        /**
         * Version Definitions, contained in the special section named
         * `.gnu.version_d` with the section type `sh_type::gnu_verdef`
         * (`SHT_GNU_verdef`).
         * 
         * The number of entries in this section must match the value of the
         * dynamic tag `dynamic_array_tags::verdefnum` (`DT_VERDEFNUM`) in the
         * Dynamic Section (`.dynamic`).
         * 
         * `_parent.linked_section` must be the string table that contains the
         * strings referenced by this section. Specifically, the string table in
         * the `.dynstr` section should be used (side note: the `readelf` command
         * doesn't even check which string table `sh_link` points to, and always
         * uses `.dynstr` for the lookups - see
         * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13787>).
         * 
         * The `is_string_table_linked` value instance indicates whether the
         * string table is linked. If it is not, version names (the `name`
         * instance in the `verdaux_entry` type) will not be available.
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERDEFS">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VerdefSection extends KaitaiStruct {
            private Boolean _is_le;

            public VerdefSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.firstEntry = new VerdefSectionEntry(this._io, this, _root, _is_le);
            }
            private void _readBE() {
                this.firstEntry = new VerdefSectionEntry(this._io, this, _root, _is_le);
            }

            public void _fetchInstances() {
                this.firstEntry._fetchInstances();
            }
            private Boolean isStringTableLinked;

            /**
             * Indicates whether a string table is linked. This should always be
             * `true` in spec-compliant ELF files. If it is `false`, the string
             * offsets in this section will not be resolved to strings.
             */
            public Boolean isStringTableLinked() {
                if (this.isStringTableLinked != null)
                    return this.isStringTableLinked;
                this.isStringTableLinked = _parent().linkedSection().type() == Elf.ShType.STRTAB;
                return this.isStringTableLinked;
            }
            private Long numEntries;

            /**
             * Number of entries (version definitions)
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976">Source</a>
             */
            public Long numEntries() {
                if (this.numEntries != null)
                    return this.numEntries;
                this.numEntries = ((Number) (_parent().info())).longValue();
                return this.numEntries;
            }
            private VerdefSectionEntry firstEntry;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public VerdefSectionEntry firstEntry() { return firstEntry; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        }

        /**
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFENTRIES">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VerdefSectionEntry extends KaitaiStruct {
            private Boolean _is_le;

            public VerdefSectionEntry(KaitaiStream _io, Elf.EndianElf.VerdefSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.version = this._io.readU2le();
                if (!(this.version == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/endian_elf/types/verdef_section_entry/seq/1");
                }
                this.flags = this._io.readU2le();
                this.versionIndex = this._io.readU2le();
                {
                    int _it = this.versionIndex;
                    if (!((_it & 32768) == 0)) {
                        throw new KaitaiStream.ValidationExprError(this.versionIndex, this._io, "/types/endian_elf/types/verdef_section_entry/seq/3");
                    }
                }
                this.numAuxEntries = this._io.readU2le();
                if (!(this.numAuxEntries >= 1)) {
                    throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, this._io, "/types/endian_elf/types/verdef_section_entry/seq/4");
                }
                this.hash = this._io.readU4le();
                this.ofsFirstAux = this._io.readU4le();
                if (!(this.ofsFirstAux >= 20)) {
                    throw new KaitaiStream.ValidationLessThanError(20, this.ofsFirstAux, this._io, "/types/endian_elf/types/verdef_section_entry/seq/6");
                }
                this.ofsNext = this._io.readU4le();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 20)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verdef_section_entry/seq/7");
                    }
                }
            }
            private void _readBE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.version = this._io.readU2be();
                if (!(this.version == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/endian_elf/types/verdef_section_entry/seq/1");
                }
                this.flags = this._io.readU2be();
                this.versionIndex = this._io.readU2be();
                {
                    int _it = this.versionIndex;
                    if (!((_it & 32768) == 0)) {
                        throw new KaitaiStream.ValidationExprError(this.versionIndex, this._io, "/types/endian_elf/types/verdef_section_entry/seq/3");
                    }
                }
                this.numAuxEntries = this._io.readU2be();
                if (!(this.numAuxEntries >= 1)) {
                    throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, this._io, "/types/endian_elf/types/verdef_section_entry/seq/4");
                }
                this.hash = this._io.readU4be();
                this.ofsFirstAux = this._io.readU4be();
                if (!(this.ofsFirstAux >= 20)) {
                    throw new KaitaiStream.ValidationLessThanError(20, this.ofsFirstAux, this._io, "/types/endian_elf/types/verdef_section_entry/seq/6");
                }
                this.ofsNext = this._io.readU4be();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 20)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verdef_section_entry/seq/7");
                    }
                }
            }

            public void _fetchInstances() {
                if (ofsStart() < 0) {
                }
                firstAux();
                if (this.firstAux != null) {
                    this.firstAux._fetchInstances();
                }
                flagsObj();
                if (this.flagsObj != null) {
                    this.flagsObj._fetchInstances();
                }
                next();
                if (this.next != null) {
                    this.next._fetchInstances();
                }
            }
            private VerdauxEntry firstAux;

            /**
             * First auxiliary entry of type `verdaux_entry` (`Elfxx_Verdaux`).
             * The rest follow its `next` instance.
             */
            public VerdauxEntry firstAux() {
                if (this.firstAux != null)
                    return this.firstAux;
                long _pos = this._io.pos();
                this._io.seek(ofsStart() + ofsFirstAux());
                if (_is_le) {
                    this.firstAux = new VerdauxEntry(this._io, _parent(), _root, _is_le);
                } else {
                    this.firstAux = new VerdauxEntry(this._io, _parent(), _root, _is_le);
                }
                this._io.seek(_pos);
                return this.firstAux;
            }
            private VersionFlags flagsObj;
            public VersionFlags flagsObj() {
                if (this.flagsObj != null)
                    return this.flagsObj;
                if (_is_le) {
                    this.flagsObj = new VersionFlags(this._io, this, _root, _is_le, flags());
                } else {
                    this.flagsObj = new VersionFlags(this._io, this, _root, _is_le, flags());
                }
                return this.flagsObj;
            }
            private VerdefSectionEntry next;
            public VerdefSectionEntry next() {
                if (this.next != null)
                    return this.next;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next = new VerdefSectionEntry(this._io, _parent(), _root, _is_le);
                    } else {
                        this.next = new VerdefSectionEntry(this._io, _parent(), _root, _is_le);
                    }
                    this._io.seek(_pos);
                }
                return this.next;
            }
            private Integer ofsStart;
            public Integer ofsStart() {
                if (this.ofsStart != null)
                    return this.ofsStart;
                this.ofsStart = ((Number) (_io().pos())).intValue();
                return this.ofsStart;
            }
            private VersionIndexSpecial versionIndexSpecial;
            public VersionIndexSpecial versionIndexSpecial() {
                if (this.versionIndexSpecial != null)
                    return this.versionIndexSpecial;
                this.versionIndexSpecial = Elf.VersionIndexSpecial.byId(versionIndex());
                return this.versionIndexSpecial;
            }
            private byte[] _unnamed0;
            private int version;
            private int flags;
            private int versionIndex;
            private int numAuxEntries;
            private long hash;
            private long ofsFirstAux;
            private long ofsNext;
            private Elf _root;
            private Elf.EndianElf.VerdefSection _parent;
            public byte[] _unnamed0() { return _unnamed0; }

            /**
             * Version of the structure. Must be set to 1.
             */
            public int version() { return version; }

            /**
             * Version information flag bitmask. Access `flags_obj` instead.
             */
            public int flags() { return flags; }

            /**
             * Version index assigned to this version definition. A unique index
             * that entries in the Symbol Version Table (the `versym_section`
             * type) use to reference the corresponding version definition.
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
             */
            public int versionIndex() { return versionIndex; }

            /**
             * Number of associated auxiliary entries.
             */
            public int numAuxEntries() { return numAuxEntries; }

            /**
             * Version name hash value (ELF hash function).
             */
            public long hash() { return hash; }

            /**
             * Byte offset to the first `verdaux_entry` (`Elfxx_Verdaux`)
             * associated with this version definition. The offset is relative to
             * the start of this `verdef_section_entry`.
             */
            public long ofsFirstAux() { return ofsFirstAux; }

            /**
             * Byte offset to the next verdef entry, relative to the start of
             * this `verdef_section_entry`. A value of zero means that there is
             * no next entry.
             */
            public long ofsNext() { return ofsNext; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.VerdefSection _parent() { return _parent; }
        }

        /**
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDEXTFIG">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VernauxEntry extends KaitaiStruct {
            private Boolean _is_le;

            public VernauxEntry(KaitaiStream _io, Elf.EndianElf.VerneedSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.hash = this._io.readU4le();
                this.flags = this._io.readU2le();
                this.versionIndex = new VersionIndex(this._io, this, _root, _is_le);
                this.ofsName = this._io.readU4le();
                this.ofsNext = this._io.readU4le();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 16)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/vernaux_entry/seq/5");
                    }
                }
            }
            private void _readBE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.hash = this._io.readU4be();
                this.flags = this._io.readU2be();
                this.versionIndex = new VersionIndex(this._io, this, _root, _is_le);
                this.ofsName = this._io.readU4be();
                this.ofsNext = this._io.readU4be();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 16)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/vernaux_entry/seq/5");
                    }
                }
            }

            public void _fetchInstances() {
                if (ofsStart() < 0) {
                }
                this.versionIndex._fetchInstances();
                flagsObj();
                if (this.flagsObj != null) {
                    this.flagsObj._fetchInstances();
                }
                name();
                if (this.name != null) {
                }
                next();
                if (this.next != null) {
                    this.next._fetchInstances();
                }
            }
            private VersionFlags flagsObj;
            public VersionFlags flagsObj() {
                if (this.flagsObj != null)
                    return this.flagsObj;
                if (_is_le) {
                    this.flagsObj = new VersionFlags(this._io, this, _root, _is_le, flags());
                } else {
                    this.flagsObj = new VersionFlags(this._io, this, _root, _is_le, flags());
                }
                return this.flagsObj;
            }
            private String name;
            public String name() {
                if (this.name != null)
                    return this.name;
                if (_parent().isStringTableLinked()) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    if (_is_le) {
                        this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    } else {
                        this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    }
                    io.seek(_pos);
                }
                return this.name;
            }
            private VernauxEntry next;
            public VernauxEntry next() {
                if (this.next != null)
                    return this.next;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next = new VernauxEntry(this._io, _parent(), _root, _is_le);
                    } else {
                        this.next = new VernauxEntry(this._io, _parent(), _root, _is_le);
                    }
                    this._io.seek(_pos);
                }
                return this.next;
            }
            private Integer ofsStart;
            public Integer ofsStart() {
                if (this.ofsStart != null)
                    return this.ofsStart;
                this.ofsStart = ((Number) (_io().pos())).intValue();
                return this.ofsStart;
            }
            private byte[] _unnamed0;
            private long hash;
            private int flags;
            private VersionIndex versionIndex;
            private long ofsName;
            private long ofsNext;
            private Elf _root;
            private Elf.EndianElf.VerneedSection _parent;
            public byte[] _unnamed0() { return _unnamed0; }

            /**
             * Dependency name hash value (ELF hash function).
             */
            public long hash() { return hash; }

            /**
             * Dependency information flag bitmask. Access `flags_obj` instead.
             */
            public int flags() { return flags; }

            /**
             * Version index assigned to this dependency version. A unique index
             * that entries in the Symbol Version Table (the `versym_section`
             * type) use to reference the corresponding dependency version.
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
             */
            public VersionIndex versionIndex() { return versionIndex; }

            /**
             * Byte offset to the dependency name string in the linked string
             * table.
             */
            public long ofsName() { return ofsName; }

            /**
             * Byte offset to the next vernaux entry, relative to the start of
             * this `vernaux_entry`. A value of zero means that there is no next
             * entry.
             */
            public long ofsNext() { return ofsNext; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.VerneedSection _parent() { return _parent; }
        }

        /**
         * Version Requirements, contained in the special section named
         * `.gnu.version_r` with the section type `sh_type::gnu_verneed`
         * (`SHT_GNU_verneed`). This section defines the required versions of
         * dynamic symbols from other shared objects.
         * 
         * The number of entries in this section must match the value of the
         * dynamic tag `dynamic_array_tags::verneednum` (`DT_VERNEEDNUM`) in the
         * Dynamic Section (`.dynamic`).
         * 
         * `_parent.linked_section` must be the string table that contains the
         * strings referenced by this section. Specifically, the string table in
         * the `.dynstr` section should be used (side note: the `readelf` command
         * doesn't even check which string table `sh_link` points to, and always
         * uses `.dynstr` for the lookups - see
         * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13941>).
         * 
         * The `is_string_table_linked` value instance indicates whether the
         * string table is linked. If it is not, file names (the `file_name`
         * instance in the `verneed_section_entry` type) or version names (the
         * `name` instance in the `vernaux_entry` type) will not be available.
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERRQMTS">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VerneedSection extends KaitaiStruct {
            private Boolean _is_le;

            public VerneedSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.firstEntry = new VerneedSectionEntry(this._io, this, _root, _is_le);
            }
            private void _readBE() {
                this.firstEntry = new VerneedSectionEntry(this._io, this, _root, _is_le);
            }

            public void _fetchInstances() {
                this.firstEntry._fetchInstances();
            }
            private Boolean isStringTableLinked;

            /**
             * Indicates whether a string table is linked. This should always be
             * `true` in spec-compliant ELF files. If it is `false`, the string
             * offsets in this section will not be resolved to strings.
             */
            public Boolean isStringTableLinked() {
                if (this.isStringTableLinked != null)
                    return this.isStringTableLinked;
                this.isStringTableLinked = _parent().linkedSection().type() == Elf.ShType.STRTAB;
                return this.isStringTableLinked;
            }
            private Long numEntries;

            /**
             * Number of entries (dependency versions)
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976">Source</a>
             */
            public Long numEntries() {
                if (this.numEntries != null)
                    return this.numEntries;
                this.numEntries = ((Number) (_parent().info())).longValue();
                return this.numEntries;
            }
            private VerneedSectionEntry firstEntry;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public VerneedSectionEntry firstEntry() { return firstEntry; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        }

        /**
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDFIG">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VerneedSectionEntry extends KaitaiStruct {
            private Boolean _is_le;

            public VerneedSectionEntry(KaitaiStream _io, Elf.EndianElf.VerneedSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.version = this._io.readU2le();
                if (!(this.version == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/endian_elf/types/verneed_section_entry/seq/1");
                }
                this.numAuxEntries = this._io.readU2le();
                if (!(this.numAuxEntries >= 1)) {
                    throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, this._io, "/types/endian_elf/types/verneed_section_entry/seq/2");
                }
                this.ofsFileName = this._io.readU4le();
                this.ofsFirstAux = this._io.readU4le();
                if (!(this.ofsFirstAux >= 16)) {
                    throw new KaitaiStream.ValidationLessThanError(16, this.ofsFirstAux, this._io, "/types/endian_elf/types/verneed_section_entry/seq/4");
                }
                this.ofsNext = this._io.readU4le();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 16)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verneed_section_entry/seq/5");
                    }
                }
            }
            private void _readBE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.version = this._io.readU2be();
                if (!(this.version == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/endian_elf/types/verneed_section_entry/seq/1");
                }
                this.numAuxEntries = this._io.readU2be();
                if (!(this.numAuxEntries >= 1)) {
                    throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, this._io, "/types/endian_elf/types/verneed_section_entry/seq/2");
                }
                this.ofsFileName = this._io.readU4be();
                this.ofsFirstAux = this._io.readU4be();
                if (!(this.ofsFirstAux >= 16)) {
                    throw new KaitaiStream.ValidationLessThanError(16, this.ofsFirstAux, this._io, "/types/endian_elf/types/verneed_section_entry/seq/4");
                }
                this.ofsNext = this._io.readU4be();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 16)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/verneed_section_entry/seq/5");
                    }
                }
            }

            public void _fetchInstances() {
                if (ofsStart() < 0) {
                }
                fileName();
                if (this.fileName != null) {
                }
                firstAux();
                if (this.firstAux != null) {
                    this.firstAux._fetchInstances();
                }
                next();
                if (this.next != null) {
                    this.next._fetchInstances();
                }
            }
            private String fileName;
            public String fileName() {
                if (this.fileName != null)
                    return this.fileName;
                if (_parent().isStringTableLinked()) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(ofsFileName());
                    if (_is_le) {
                        this.fileName = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    } else {
                        this.fileName = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    }
                    io.seek(_pos);
                }
                return this.fileName;
            }
            private VernauxEntry firstAux;

            /**
             * First auxiliary entry of type `vernaux_entry` (`Elfxx_Vernaux`).
             * The rest follow its `next` instance.
             */
            public VernauxEntry firstAux() {
                if (this.firstAux != null)
                    return this.firstAux;
                long _pos = this._io.pos();
                this._io.seek(ofsStart() + ofsFirstAux());
                if (_is_le) {
                    this.firstAux = new VernauxEntry(this._io, _parent(), _root, _is_le);
                } else {
                    this.firstAux = new VernauxEntry(this._io, _parent(), _root, _is_le);
                }
                this._io.seek(_pos);
                return this.firstAux;
            }
            private VerneedSectionEntry next;
            public VerneedSectionEntry next() {
                if (this.next != null)
                    return this.next;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next = new VerneedSectionEntry(this._io, _parent(), _root, _is_le);
                    } else {
                        this.next = new VerneedSectionEntry(this._io, _parent(), _root, _is_le);
                    }
                    this._io.seek(_pos);
                }
                return this.next;
            }
            private Integer ofsStart;
            public Integer ofsStart() {
                if (this.ofsStart != null)
                    return this.ofsStart;
                this.ofsStart = ((Number) (_io().pos())).intValue();
                return this.ofsStart;
            }
            private byte[] _unnamed0;
            private int version;
            private int numAuxEntries;
            private long ofsFileName;
            private long ofsFirstAux;
            private long ofsNext;
            private Elf _root;
            private Elf.EndianElf.VerneedSection _parent;
            public byte[] _unnamed0() { return _unnamed0; }

            /**
             * Version of the structure. Must be set to 1.
             */
            public int version() { return version; }

            /**
             * Number of associated auxiliary entries.
             */
            public int numAuxEntries() { return numAuxEntries; }

            /**
             * Byte offset to the file name string in the linked string table.
             */
            public long ofsFileName() { return ofsFileName; }

            /**
             * Byte offset to the first associated `vernaux_entry`
             * (`Elfxx_Vernaux`). The offset is relative to the start of this
             * `verneed_section_entry`.
             */
            public long ofsFirstAux() { return ofsFirstAux; }

            /**
             * Byte offset to the next verneed entry, relative to the start of
             * this `verneed_section_entry`. A value of zero means that there is
             * no next entry.
             */
            public long ofsNext() { return ofsNext; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.VerneedSection _parent() { return _parent; }
        }

        /**
         * Version information flag bitmask, shared by the `flags` (`vd_flags`)
         * field of `verdef_section_entry` (`Elfxx_Verdef`) and the `flags`
         * (`vna_flags`) field of `vernaux_entry` (`Elfxx_Vernaux`).
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMSTARTSEQ">Source</a>
         * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1078">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VersionFlags extends KaitaiStruct {
            private Boolean _is_le;

            public VersionFlags(KaitaiStream _io, KaitaiStruct _parent, Elf _root, boolean _is_le, int value) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.value = value;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
            }
            private void _readBE() {
            }

            public void _fetchInstances() {
            }
            private Boolean base;

            /**
             * Version definition of the file itself (the base definition).
             */
            public Boolean base() {
                if (this.base != null)
                    return this.base;
                this.base = (value() & 1) != 0;
                return this.base;
            }
            private Boolean info;

            /**
             * Version reference exists for informational purposes and does not
             * need to be validated at runtime.
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
             */
            public Boolean info() {
                if (this.info != null)
                    return this.info;
                this.info = (value() & 4) != 0;
                return this.info;
            }
            private Boolean weak;

            /**
             * Weak version identifier.
             * 
             * A weak version definition has no symbols associated with the
             * version. See [Creating a Weak Version
             * Definition](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/creating-weak-version-definition.html).
             */
            public Boolean weak() {
                if (this.weak != null)
                    return this.weak;
                this.weak = (value() & 2) != 0;
                return this.weak;
            }
            private int value;
            private Elf _root;
            private KaitaiStruct _parent;
            public int value() { return value; }
            public Elf _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        public static class VersionIndex extends KaitaiStruct {
            private Boolean _is_le;

            public VersionIndex(KaitaiStream _io, KaitaiStruct _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.raw = this._io.readU2le();
            }
            private void _readBE() {
                this.raw = this._io.readU2be();
            }

            public void _fetchInstances() {
            }
            private Boolean isHidden;

            /**
             * This bit is set if the symbol is hidden, and is only visible with
             * an explicit version number. This is a GNU extension.
             * @see <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L1379">Source</a>
             */
            public Boolean isHidden() {
                if (this.isHidden != null)
                    return this.isHidden;
                this.isHidden = (raw() & 32768) != 0;
                return this.isHidden;
            }
            private Integer value;

            /**
             * The values `version_index_special::local` (0) and
             * `version_index_special::global_symbol` (1) have special meanings.
             * The `version_index_special` value instance converts the integer
             * value to the `version_index_special` enum.
             */
            public Integer value() {
                if (this.value != null)
                    return this.value;
                this.value = ((Number) (raw() & 32767)).intValue();
                return this.value;
            }
            private VersionIndexSpecial versionIndexSpecial;

            /**
             * Note: we match special constants against the full 16-bit integer
             * value (called `raw` in this .ksy implementation), because that's
             * what the `readelf` command does when deciding whether to print
             * `0 (*local*)` or `1 (*global*)` in the `.gnu.version`
             * (`SHT_GNU_versym`) section - see
             * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L14079>.
             * 
             * Besides, `version_index_special::eliminate` (`VER_NDX_ELIMINATE`)
             * has a value of `0xff01`, which is a 16-bit value. If we matched
             * against `value` instead, `version_index_special::eliminate` would
             * be unreachable, because `value` contains only the lower 15 bits,
             * so its maximum possible value is `0x7fff`.
             */
            public VersionIndexSpecial versionIndexSpecial() {
                if (this.versionIndexSpecial != null)
                    return this.versionIndexSpecial;
                this.versionIndexSpecial = Elf.VersionIndexSpecial.byId(raw());
                return this.versionIndexSpecial;
            }
            private int raw;
            private Elf _root;
            private KaitaiStruct _parent;

            /**
             * Raw value, don't read this field - access `value`,
             * `version_index_special` and `is_hidden` instead.
             */
            public int raw() { return raw; }
            public Elf _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }

        /**
         * Symbol Version Table, contained in the special section named
         * `.gnu.version` with the section type `sh_type::gnu_versym`
         * (`SHT_GNU_versym`).
         * 
         * This section must have the same number of entries as the Dynamic
         * Symbol Table in the `.dynsym` section (section type `sh_type::dynsym`
         * / `SHT_DYNSYM`). Each entry specifies the version defined for or
         * required by the corresponding symbol in the Dynamic Symbol Table.
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERTBL">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-symbol-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VersymSection extends KaitaiStruct {
            private Boolean _is_le;

            public VersymSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.entries = new ArrayList<VersionIndex>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new VersionIndex(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<VersionIndex>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new VersionIndex(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private List<VersionIndex> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;

            /**
             * Version indexes for the corresponding symbols in the Dynamic
             * Symbol Table (`.dynsym` section).
             * 
             * These values are not the versions themselves: they are keys that
             * are matched against the `version_index` (`vd_ndx`) field of the
             * `verdef_section_entry` (`Elfxx_Verdef`) type if the symbol is
             * defined in this object, or the `version_index` (`vna_other`) field
             * of the `vernaux_entry` (`Elfxx_Vernaux`) type if the symbol is
             * required from another object. The `name` instance of the matched
             * entry specifies the version of the symbol.
             */
            public List<VersionIndex> entries() { return entries; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        }
        private List<ProgramHeader> programHeaders;
        public List<ProgramHeader> programHeaders() {
            if (this.programHeaders != null)
                return this.programHeaders;
            long _pos = this._io.pos();
            this._io.seek(ofsProgramHeaders());
            if (_is_le) {
                this.programHeaders = new ArrayList<ProgramHeader>();
                for (int i = 0; i < numProgramHeaders(); i++) {
                    KaitaiStream _io_programHeaders = this._io.substream(programHeaderSize());
                    this.programHeaders.add(new ProgramHeader(_io_programHeaders, this, _root, _is_le));
                }
            } else {
                this.programHeaders = new ArrayList<ProgramHeader>();
                for (int i = 0; i < numProgramHeaders(); i++) {
                    KaitaiStream _io_programHeaders = this._io.substream(programHeaderSize());
                    this.programHeaders.add(new ProgramHeader(_io_programHeaders, this, _root, _is_le));
                }
            }
            this._io.seek(_pos);
            return this.programHeaders;
        }
        private List<SectionHeader> sectionHeaders;
        public List<SectionHeader> sectionHeaders() {
            if (this.sectionHeaders != null)
                return this.sectionHeaders;
            long _pos = this._io.pos();
            this._io.seek(ofsSectionHeaders());
            if (_is_le) {
                this.sectionHeaders = new ArrayList<SectionHeader>();
                for (int i = 0; i < numSectionHeaders(); i++) {
                    KaitaiStream _io_sectionHeaders = this._io.substream(sectionHeaderSize());
                    this.sectionHeaders.add(new SectionHeader(_io_sectionHeaders, this, _root, _is_le));
                }
            } else {
                this.sectionHeaders = new ArrayList<SectionHeader>();
                for (int i = 0; i < numSectionHeaders(); i++) {
                    KaitaiStream _io_sectionHeaders = this._io.substream(sectionHeaderSize());
                    this.sectionHeaders.add(new SectionHeader(_io_sectionHeaders, this, _root, _is_le));
                }
            }
            this._io.seek(_pos);
            return this.sectionHeaders;
        }
        private StringsStruct sectionNames;
        public StringsStruct sectionNames() {
            if (this.sectionNames != null)
                return this.sectionNames;
            if ( ((sectionNamesIdx() != Elf.SectionHeaderIdxSpecial.UNDEFINED.id()) && (sectionNamesIdx() < _root().header().numSectionHeaders())) ) {
                long _pos = this._io.pos();
                this._io.seek(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).ofsBody());
                if (_is_le) {
                    KaitaiStream _io_sectionNames = this._io.substream(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody());
                    this.sectionNames = new StringsStruct(_io_sectionNames, this, _root, _is_le);
                } else {
                    KaitaiStream _io_sectionNames = this._io.substream(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody());
                    this.sectionNames = new StringsStruct(_io_sectionNames, this, _root, _is_le);
                }
                this._io.seek(_pos);
            }
            return this.sectionNames;
        }
        private ObjType eType;
        private Machine machine;
        private long eVersion;
        private Long entryPoint;
        private Long ofsProgramHeaders;
        private Long ofsSectionHeaders;
        private byte[] flags;
        private int eEhsize;
        private int programHeaderSize;
        private int numProgramHeaders;
        private int sectionHeaderSize;
        private int numSectionHeaders;
        private int sectionNamesIdx;
        private Elf _root;
        private Elf _parent;
        public ObjType eType() { return eType; }
        public Machine machine() { return machine; }
        public long eVersion() { return eVersion; }
        public Long entryPoint() { return entryPoint; }
        public Long ofsProgramHeaders() { return ofsProgramHeaders; }
        public Long ofsSectionHeaders() { return ofsSectionHeaders; }
        public byte[] flags() { return flags; }
        public int eEhsize() { return eEhsize; }
        public int programHeaderSize() { return programHeaderSize; }
        public int numProgramHeaders() { return numProgramHeaders; }
        public int sectionHeaderSize() { return sectionHeaderSize; }
        public int numSectionHeaders() { return numSectionHeaders; }
        public int sectionNamesIdx() { return sectionNamesIdx; }
        public Elf _root() { return _root; }
        public Elf _parent() { return _parent; }
    }
    public static class PhdrTypeFlags extends KaitaiStruct {

        public PhdrTypeFlags(KaitaiStream _io, long value) {
            this(_io, null, null, value);
        }

        public PhdrTypeFlags(KaitaiStream _io, Elf.EndianElf.ProgramHeader _parent, long value) {
            this(_io, _parent, null, value);
        }

        public PhdrTypeFlags(KaitaiStream _io, Elf.EndianElf.ProgramHeader _parent, Elf _root, long value) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.value = value;
            _read();
        }
        private void _read() {
        }

        public void _fetchInstances() {
        }
        private Boolean execute;
        public Boolean execute() {
            if (this.execute != null)
                return this.execute;
            this.execute = (value() & 1) != 0;
            return this.execute;
        }
        private Boolean maskProc;
        public Boolean maskProc() {
            if (this.maskProc != null)
                return this.maskProc;
            this.maskProc = (value() & 4026531840L) != 0;
            return this.maskProc;
        }
        private Boolean read;
        public Boolean read() {
            if (this.read != null)
                return this.read;
            this.read = (value() & 4) != 0;
            return this.read;
        }
        private Boolean write;
        public Boolean write() {
            if (this.write != null)
                return this.write;
            this.write = (value() & 2) != 0;
            return this.write;
        }
        private long value;
        private Elf _root;
        private Elf.EndianElf.ProgramHeader _parent;
        public long value() { return value; }
        public Elf _root() { return _root; }
        public Elf.EndianElf.ProgramHeader _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675">Source</a>
     * @see <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L614">Source</a>
     * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L468">Source</a>
     */
    public static class SectionHeaderFlags extends KaitaiStruct {

        public SectionHeaderFlags(KaitaiStream _io, long value) {
            this(_io, null, null, value);
        }

        public SectionHeaderFlags(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, long value) {
            this(_io, _parent, null, value);
        }

        public SectionHeaderFlags(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, long value) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.value = value;
            _read();
        }
        private void _read() {
        }

        public void _fetchInstances() {
        }
        private Boolean alloc;

        /**
         * Occupies memory during execution
         */
        public Boolean alloc() {
            if (this.alloc != null)
                return this.alloc;
            this.alloc = (value() & 2) != 0;
            return this.alloc;
        }
        private Boolean compressed;

        /**
         * Section with compressed data
         */
        public Boolean compressed() {
            if (this.compressed != null)
                return this.compressed;
            this.compressed = (value() & 2048) != 0;
            return this.compressed;
        }
        private Boolean exclude;

        /**
         * Section is excluded unless referenced or allocated (Solaris)
         */
        public Boolean exclude() {
            if (this.exclude != null)
                return this.exclude;
            this.exclude = (value() & 2147483648L) != 0;
            return this.exclude;
        }
        private Boolean execInstr;

        /**
         * Executable machine instructions
         */
        public Boolean execInstr() {
            if (this.execInstr != null)
                return this.execInstr;
            this.execInstr = (value() & 4) != 0;
            return this.execInstr;
        }
        private Boolean gnuMbind;

        /**
         * Mbind section
         * @see <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L631">Source</a>
         */
        public Boolean gnuMbind() {
            if (this.gnuMbind != null)
                return this.gnuMbind;
            this.gnuMbind = (value() & 16777216) != 0;
            return this.gnuMbind;
        }
        private Boolean group;

        /**
         * Member of a section group
         */
        public Boolean group() {
            if (this.group != null)
                return this.group;
            this.group = (value() & 512) != 0;
            return this.group;
        }
        private Boolean infoLink;

        /**
         * Section header's `sh_info` field holds a section header table index
         */
        public Boolean infoLink() {
            if (this.infoLink != null)
                return this.infoLink;
            this.infoLink = (value() & 64) != 0;
            return this.infoLink;
        }
        private Boolean linkOrder;

        /**
         * Preserve section ordering when linking
         */
        public Boolean linkOrder() {
            if (this.linkOrder != null)
                return this.linkOrder;
            this.linkOrder = (value() & 128) != 0;
            return this.linkOrder;
        }
        private Boolean maskOs;

        /**
         * OS-specific semantics
         */
        public Boolean maskOs() {
            if (this.maskOs != null)
                return this.maskOs;
            this.maskOs = (value() & 267386880) != 0;
            return this.maskOs;
        }
        private Boolean maskProc;

        /**
         * Processor-specific semantics
         */
        public Boolean maskProc() {
            if (this.maskProc != null)
                return this.maskProc;
            this.maskProc = (value() & 4026531840L) != 0;
            return this.maskProc;
        }
        private Boolean merge;

        /**
         * Data in this section can be merged to eliminate duplication
         */
        public Boolean merge() {
            if (this.merge != null)
                return this.merge;
            this.merge = (value() & 16) != 0;
            return this.merge;
        }
        private Boolean ordered;

        /**
         * Special ordering requirement (Solaris)
         * 
         * From <https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675>:
         * 
         * > `SHF_ORDERED` is an older version of the functionality provided by
         * > `SHF_LINK_ORDER`, and has been superseded by `SHF_LINK_ORDER`.
         * > `SHF_ORDERED` is no longer supported.
         * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L485">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675">Source</a>
         */
        public Boolean ordered() {
            if (this.ordered != null)
                return this.ordered;
            this.ordered = (value() & 1073741824) != 0;
            return this.ordered;
        }
        private Boolean osNonconforming;

        /**
         * Special OS-specific handling required
         */
        public Boolean osNonconforming() {
            if (this.osNonconforming != null)
                return this.osNonconforming;
            this.osNonconforming = (value() & 256) != 0;
            return this.osNonconforming;
        }
        private Boolean retain;

        /**
         * Section should not be garbage collected by the linker
         * @see <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L630">Source</a>
         * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L484">Source</a>
         */
        public Boolean retain() {
            if (this.retain != null)
                return this.retain;
            this.retain = (value() & 2097152) != 0;
            return this.retain;
        }
        private Boolean strings;

        /**
         * Contains null-terminated character strings
         */
        public Boolean strings() {
            if (this.strings != null)
                return this.strings;
            this.strings = (value() & 32) != 0;
            return this.strings;
        }
        private Boolean tls;

        /**
         * Thread-local storage section (`.tbss` or `.tdata` according to [ELF
         * Handling For Thread-Local
         * Storage](https://www.akkadia.org/drepper/tls.pdf))
         */
        public Boolean tls() {
            if (this.tls != null)
                return this.tls;
            this.tls = (value() & 1024) != 0;
            return this.tls;
        }
        private Boolean write;

        /**
         * Writable during execution
         */
        public Boolean write() {
            if (this.write != null)
                return this.write;
            this.write = (value() & 1) != 0;
            return this.write;
        }
        private long value;
        private Elf _root;
        private Elf.EndianElf.SectionHeader _parent;
        public long value() { return value; }
        public Elf _root() { return _root; }
        public Elf.EndianElf.SectionHeader _parent() { return _parent; }
    }
    private Integer shIdxHiOs;
    public Integer shIdxHiOs() {
        if (this.shIdxHiOs != null)
            return this.shIdxHiOs;
        this.shIdxHiOs = ((int) 65343);
        return this.shIdxHiOs;
    }
    private Integer shIdxHiProc;
    public Integer shIdxHiProc() {
        if (this.shIdxHiProc != null)
            return this.shIdxHiProc;
        this.shIdxHiProc = ((int) 65311);
        return this.shIdxHiProc;
    }
    private Integer shIdxHiReserved;
    public Integer shIdxHiReserved() {
        if (this.shIdxHiReserved != null)
            return this.shIdxHiReserved;
        this.shIdxHiReserved = ((int) 65535);
        return this.shIdxHiReserved;
    }
    private Integer shIdxLoOs;
    public Integer shIdxLoOs() {
        if (this.shIdxLoOs != null)
            return this.shIdxLoOs;
        this.shIdxLoOs = ((int) 65312);
        return this.shIdxLoOs;
    }
    private Integer shIdxLoProc;
    public Integer shIdxLoProc() {
        if (this.shIdxLoProc != null)
            return this.shIdxLoProc;
        this.shIdxLoProc = ((int) 65280);
        return this.shIdxLoProc;
    }
    private Integer shIdxLoReserved;
    public Integer shIdxLoReserved() {
        if (this.shIdxLoReserved != null)
            return this.shIdxLoReserved;
        this.shIdxLoReserved = ((int) 65280);
        return this.shIdxLoReserved;
    }
    private byte[] magic;
    private Bits bits;
    private Endian endian;
    private int eiVersion;
    private OsAbi abi;
    private int abiVersion;
    private byte[] pad;
    private EndianElf header;
    private Elf _root;
    private KaitaiStruct _parent;

    /**
     * File identification, must be 0x7f + "ELF".
     */
    public byte[] magic() { return magic; }

    /**
     * File class: designates target machine word size (32 or 64
     * bits). The size of many integer fields in this format will
     * depend on this setting.
     */
    public Bits bits() { return bits; }

    /**
     * Endianness used for all integers.
     */
    public Endian endian() { return endian; }

    /**
     * ELF header version.
     */
    public int eiVersion() { return eiVersion; }

    /**
     * Specifies which OS- and ABI-related extensions will be used
     * in this ELF file.
     */
    public OsAbi abi() { return abi; }

    /**
     * Version of ABI targeted by this ELF file. Interpretation
     * depends on `abi` attribute.
     */
    public int abiVersion() { return abiVersion; }
    public byte[] pad() { return pad; }
    public EndianElf header() { return header; }
    public Elf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
