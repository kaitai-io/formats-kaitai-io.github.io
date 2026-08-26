// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


/**
 * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h">Source</a>
 * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html">Source</a>
 * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html">Source</a>
 */
public class Elf extends KaitaiStruct.ReadWrite {
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
    public Elf() {
        this(null, null, null);
    }

    public Elf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Elf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Elf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Elf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
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
        this.header._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU1(((Number) (this.bits.id())).intValue());
        this._io.writeU1(((Number) (this.endian.id())).intValue());
        this._io.writeU1(this.eiVersion);
        this._io.writeU1(((Number) (this.abi.id())).intValue());
        this._io.writeU1(this.abiVersion);
        this._io.writeBytes(this.pad);
        this.header._write_Seq(this._io);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 127, 69, 76, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 127, 69, 76, 70 }, this.magic, null, "/seq/0");
        }
        if (!(this.eiVersion == 1)) {
            throw new KaitaiStream.ValidationNotEqualError(1, this.eiVersion, null, "/seq/3");
        }
        if (this.pad.length != 7)
            throw new ConsistencyError("pad", 7, this.pad.length);
        if (!(Arrays.equals(this.pad, new byte[] { 0, 0, 0, 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0 }, this.pad, null, "/seq/6");
        }
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        _dirty = false;
    }

    /**
     * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1008">Source</a>
     * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-53">Source</a>
     */
    public static class DtFlag1Values extends KaitaiStruct.ReadWrite {
        public DtFlag1Values(long value) {
            this(null, null, null, value);
        }

        public DtFlag1Values(KaitaiStream _io, long value) {
            this(_io, null, null, value);
        }

        public DtFlag1Values(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, long value) {
            this(_io, _parent, null, value);
        }

        public DtFlag1Values(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Elf _root, long value) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.value = value;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
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
        public void _invalidateConfAlt() { this.confAlt = null; }
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
        public void _invalidateDirect() { this.direct = null; }
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
        public void _invalidateDispRelDne() { this.dispRelDne = null; }
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
        public void _invalidateDispRelPnd() { this.dispRelPnd = null; }
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
        public void _invalidateEdited() { this.edited = null; }
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
        public void _invalidateEndFiltee() { this.endFiltee = null; }
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
        public void _invalidateGlobAudit() { this.globAudit = null; }
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
        public void _invalidateGroup() { this.group = null; }
        private Boolean ignMulDef;
        public Boolean ignMulDef() {
            if (this.ignMulDef != null)
                return this.ignMulDef;
            this.ignMulDef = (value() & 262144) != 0;
            return this.ignMulDef;
        }
        public void _invalidateIgnMulDef() { this.ignMulDef = null; }
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
        public void _invalidateInitFirst() { this.initFirst = null; }
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
        public void _invalidateInterpose() { this.interpose = null; }
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
        public void _invalidateKmod() { this.kmod = null; }
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
        public void _invalidateLoadFltr() { this.loadFltr = null; }
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
        public void _invalidateNoCommon() { this.noCommon = null; }
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
        public void _invalidateNoDefLib() { this.noDefLib = null; }
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
        public void _invalidateNoDelete() { this.noDelete = null; }
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
        public void _invalidateNoDirect() { this.noDirect = null; }
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
        public void _invalidateNoDump() { this.noDump = null; }
        private Boolean noHdr;
        public Boolean noHdr() {
            if (this.noHdr != null)
                return this.noHdr;
            this.noHdr = (value() & 1048576) != 0;
            return this.noHdr;
        }
        public void _invalidateNoHdr() { this.noHdr = null; }
        private Boolean noKsyms;
        public Boolean noKsyms() {
            if (this.noKsyms != null)
                return this.noKsyms;
            this.noKsyms = (value() & 524288) != 0;
            return this.noKsyms;
        }
        public void _invalidateNoKsyms() { this.noKsyms = null; }
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
        public void _invalidateNoOpen() { this.noOpen = null; }
        private Boolean noReloc;
        public Boolean noReloc() {
            if (this.noReloc != null)
                return this.noReloc;
            this.noReloc = (value() & 4194304) != 0;
            return this.noReloc;
        }
        public void _invalidateNoReloc() { this.noReloc = null; }
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
        public void _invalidateNow() { this.now = null; }
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
        public void _invalidateOrigin() { this.origin = null; }
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
        public void _invalidatePie() { this.pie = null; }
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
        public void _invalidateRtldGlobal() { this.rtldGlobal = null; }
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
        public void _invalidateSingleton() { this.singleton = null; }
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
        public void _invalidateStub() { this.stub = null; }
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
        public void _invalidateSymIntpose() { this.symIntpose = null; }
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
        public void _invalidateTrans() { this.trans = null; }
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
        public void _invalidateWeakFilter() { this.weakFilter = null; }
        private long value;
        private Elf _root;
        private KaitaiStruct.ReadWrite _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public Elf _root() { return _root; }
        public void set_root(Elf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html">Figure 5-11: DT_FLAGS values</a>
     * @see <a href="https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095">Source</a>
     * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER7-TBL-5">Source</a>
     */
    public static class DtFlagValues extends KaitaiStruct.ReadWrite {
        public DtFlagValues(long value) {
            this(null, null, null, value);
        }

        public DtFlagValues(KaitaiStream _io, long value) {
            this(_io, null, null, value);
        }

        public DtFlagValues(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, long value) {
            this(_io, _parent, null, value);
        }

        public DtFlagValues(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Elf _root, long value) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.value = value;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
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
        public void _invalidateBindNow() { this.bindNow = null; }
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
        public void _invalidateOrigin() { this.origin = null; }
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
        public void _invalidateStaticTls() { this.staticTls = null; }
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
        public void _invalidateSymbolic() { this.symbolic = null; }
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
        public void _invalidateTextrel() { this.textrel = null; }
        private long value;
        private Elf _root;
        private KaitaiStruct.ReadWrite _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public Elf _root() { return _root; }
        public void set_root(Elf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://gabi.xinuos.com/v42/elf/02-eheader.html">Source</a>
     * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-header.html">Source</a>
     */
    public static class EndianElf extends KaitaiStruct.ReadWrite {
        public static EndianElf fromFile(String fileName) throws IOException {
            return new EndianElf(new ByteBufferKaitaiStream(fileName));
        }
        private Boolean _is_le;
        public EndianElf() {
            this(null, null, null);
        }

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
        }
        public void _read() {
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
            _dirty = false;
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
            _dirty = false;
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
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();

            if (_is_le == null) {
                throw new KaitaiStream.UndecidedEndiannessError();
            } else if (_is_le) {
                _write_SeqLE();
            } else {
                _write_SeqBE();
            }
        }

        private void _write_SeqLE() {
            _shouldWriteProgramHeaders = _enabledProgramHeaders;
            _shouldWriteSectionHeaders = _enabledSectionHeaders;
            _shouldWriteSectionNames = _enabledSectionNames;
            this._io.writeU2le(((Number) (this.eType.id())).intValue());
            this._io.writeU2le(((Number) (this.machine.id())).intValue());
            this._io.writeU4le(this.eVersion);
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this._io.writeU4le(((Number) (this.entryPoint)).longValue());
                        break;
                    }
                    case B64: {
                        this._io.writeU8le(this.entryPoint);
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
                        this._io.writeU4le(((Number) (this.ofsProgramHeaders)).longValue());
                        break;
                    }
                    case B64: {
                        this._io.writeU8le(this.ofsProgramHeaders);
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
                        this._io.writeU4le(((Number) (this.ofsSectionHeaders)).longValue());
                        break;
                    }
                    case B64: {
                        this._io.writeU8le(this.ofsSectionHeaders);
                        break;
                    }
                    }
                }
            }
            this._io.writeBytes(this.flags);
            this._io.writeU2le(this.eEhsize);
            this._io.writeU2le(this.programHeaderSize);
            this._io.writeU2le(this.numProgramHeaders);
            this._io.writeU2le(this.sectionHeaderSize);
            this._io.writeU2le(this.numSectionHeaders);
            this._io.writeU2le(this.sectionNamesIdx);
        }

        private void _write_SeqBE() {
            _shouldWriteProgramHeaders = _enabledProgramHeaders;
            _shouldWriteSectionHeaders = _enabledSectionHeaders;
            _shouldWriteSectionNames = _enabledSectionNames;
            this._io.writeU2be(((Number) (this.eType.id())).intValue());
            this._io.writeU2be(((Number) (this.machine.id())).intValue());
            this._io.writeU4be(this.eVersion);
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this._io.writeU4be(((Number) (this.entryPoint)).longValue());
                        break;
                    }
                    case B64: {
                        this._io.writeU8be(this.entryPoint);
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
                        this._io.writeU4be(((Number) (this.ofsProgramHeaders)).longValue());
                        break;
                    }
                    case B64: {
                        this._io.writeU8be(this.ofsProgramHeaders);
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
                        this._io.writeU4be(((Number) (this.ofsSectionHeaders)).longValue());
                        break;
                    }
                    case B64: {
                        this._io.writeU8be(this.ofsSectionHeaders);
                        break;
                    }
                    }
                }
            }
            this._io.writeBytes(this.flags);
            this._io.writeU2be(this.eEhsize);
            this._io.writeU2be(this.programHeaderSize);
            this._io.writeU2be(this.numProgramHeaders);
            this._io.writeU2be(this.sectionHeaderSize);
            this._io.writeU2be(this.numSectionHeaders);
            this._io.writeU2be(this.sectionNamesIdx);
        }

        public void _check() {
            if (this.machine == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.machine, null, "/types/endian_elf/seq/1");
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
            if (this.flags.length != 4)
                throw new ConsistencyError("flags", 4, this.flags.length);
            if (_enabledProgramHeaders) {
                if (this.programHeaders.size() != numProgramHeaders())
                    throw new ConsistencyError("program_headers", numProgramHeaders(), this.programHeaders.size());
                for (int i = 0; i < this.programHeaders.size(); i++) {
                    if (!Objects.equals(this.programHeaders.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("program_headers", _root(), this.programHeaders.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.programHeaders.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("program_headers", this, this.programHeaders.get(((Number) (i)).intValue())._parent());
                }
            }
            if (_enabledSectionHeaders) {
                if (this.sectionHeaders.size() != numSectionHeaders())
                    throw new ConsistencyError("section_headers", numSectionHeaders(), this.sectionHeaders.size());
                for (int i = 0; i < this.sectionHeaders.size(); i++) {
                    if (!Objects.equals(this.sectionHeaders.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("section_headers", _root(), this.sectionHeaders.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.sectionHeaders.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("section_headers", this, this.sectionHeaders.get(((Number) (i)).intValue())._parent());
                }
            }
            if (_enabledSectionNames) {
                if ( ((sectionNamesIdx() != Elf.SectionHeaderIdxSpecial.UNDEFINED.id()) && (sectionNamesIdx() < _root().header().numSectionHeaders())) ) {
                    if (!Objects.equals(this.sectionNames._root(), _root()))
                        throw new ConsistencyError("section_names", _root(), this.sectionNames._root());
                    if (!Objects.equals(this.sectionNames._parent(), this))
                        throw new ConsistencyError("section_names", this, this.sectionNames._parent());
                }
            }
            _dirty = false;
        }
        public static class DynsymSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public DynsymSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.entries = new ArrayList<DynsymSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        DynsymSectionEntry _t_entries = new DynsymSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }
            private void _readBE() {
                this.entries = new ArrayList<DynsymSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        DynsymSectionEntry _t_entries = new DynsymSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            private void _write_SeqBE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private Boolean isStringTableLinked;
            public Boolean isStringTableLinked() {
                if (this.isStringTableLinked != null)
                    return this.isStringTableLinked;
                this.isStringTableLinked = _parent().linkedSection().type() == Elf.ShType.STRTAB;
                return this.isStringTableLinked;
            }
            public void _invalidateIsStringTableLinked() { this.isStringTableLinked = null; }
            private List<DynsymSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public List<DynsymSectionEntry> entries() { return entries; }
            public void setEntries(List<DynsymSectionEntry> _v) { _dirty = true; entries = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://gabi.xinuos.com/elf/05-symtab.html">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html">Source</a>
         */
        public static class DynsymSectionEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public DynsymSectionEntry(KaitaiStream _io, Elf.EndianElf.DynsymSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteName = _enabledName;
                this._io.writeU4le(this.ofsName);
                if (_root().bits() == Elf.Bits.B32) {
                    this._io.writeU4le(this.valueB32);
                }
                if (_root().bits() == Elf.Bits.B32) {
                    this._io.writeU4le(this.sizeB32);
                }
                this._io.writeBitsIntBe(4, ((Number) (this.bind.id())).longValue());
                this._io.writeBitsIntBe(4, ((Number) (this.type.id())).longValue());
                this._io.writeU1(this.other);
                this._io.writeU2le(this.shIdx);
                if (_root().bits() == Elf.Bits.B64) {
                    this._io.writeU8le(this.valueB64);
                }
                if (_root().bits() == Elf.Bits.B64) {
                    this._io.writeU8le(this.sizeB64);
                }
            }

            private void _write_SeqBE() {
                _shouldWriteName = _enabledName;
                this._io.writeU4be(this.ofsName);
                if (_root().bits() == Elf.Bits.B32) {
                    this._io.writeU4be(this.valueB32);
                }
                if (_root().bits() == Elf.Bits.B32) {
                    this._io.writeU4be(this.sizeB32);
                }
                this._io.writeBitsIntBe(4, ((Number) (this.bind.id())).longValue());
                this._io.writeBitsIntBe(4, ((Number) (this.type.id())).longValue());
                this._io.writeU1(this.other);
                this._io.writeU2be(this.shIdx);
                if (_root().bits() == Elf.Bits.B64) {
                    this._io.writeU8be(this.valueB64);
                }
                if (_root().bits() == Elf.Bits.B64) {
                    this._io.writeU8be(this.sizeB64);
                }
            }

            public void _check() {
                if (_root().bits() == Elf.Bits.B32) {
                }
                if (_root().bits() == Elf.Bits.B32) {
                }
                if (_root().bits() == Elf.Bits.B64) {
                }
                if (_root().bits() == Elf.Bits.B64) {
                }
                if (_enabledName) {
                    if ( ((ofsName() != 0) && (_parent().isStringTableLinked())) ) {
                        if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                            throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                    }
                }
                _dirty = false;
            }
            private Boolean isShIdxOs;
            public Boolean isShIdxOs() {
                if (this.isShIdxOs != null)
                    return this.isShIdxOs;
                this.isShIdxOs =  ((shIdx() >= _root().shIdxLoOs()) && (shIdx() <= _root().shIdxHiOs())) ;
                return this.isShIdxOs;
            }
            public void _invalidateIsShIdxOs() { this.isShIdxOs = null; }
            private Boolean isShIdxProc;
            public Boolean isShIdxProc() {
                if (this.isShIdxProc != null)
                    return this.isShIdxProc;
                this.isShIdxProc =  ((shIdx() >= _root().shIdxLoProc()) && (shIdx() <= _root().shIdxHiProc())) ;
                return this.isShIdxProc;
            }
            public void _invalidateIsShIdxProc() { this.isShIdxProc = null; }
            private Boolean isShIdxReserved;
            public Boolean isShIdxReserved() {
                if (this.isShIdxReserved != null)
                    return this.isShIdxReserved;
                this.isShIdxReserved =  ((shIdx() >= _root().shIdxLoReserved()) && (shIdx() <= _root().shIdxHiReserved())) ;
                return this.isShIdxReserved;
            }
            public void _invalidateIsShIdxReserved() { this.isShIdxReserved = null; }
            private String name;
            private boolean _shouldWriteName = false;
            private boolean _enabledName = true;
            public String name() {
                if (_shouldWriteName)
                    _writeName();
                if (this.name != null)
                    return this.name;
                if (!_enabledName)
                    return null;
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
            public void setName(String _v) { _dirty = true; name = _v; }
            public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

            private void _writeName() {
                _shouldWriteName = false;
                if ( ((ofsName() != 0) && (_parent().isStringTableLinked())) ) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    if (_is_le) {
                        io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                    } else {
                        io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                    }
                    io.seek(_pos);
                }
            }
            private SectionHeaderIdxSpecial shIdxSpecial;
            public SectionHeaderIdxSpecial shIdxSpecial() {
                if (this.shIdxSpecial != null)
                    return this.shIdxSpecial;
                this.shIdxSpecial = Elf.SectionHeaderIdxSpecial.byId(shIdx());
                return this.shIdxSpecial;
            }
            public void _invalidateShIdxSpecial() { this.shIdxSpecial = null; }
            private Long size;
            public Long size() {
                if (this.size != null)
                    return this.size;
                this.size = ((Number) ((_root().bits() == Elf.Bits.B32 ? sizeB32() : (_root().bits() == Elf.Bits.B64 ? sizeB64() : 0)))).longValue();
                return this.size;
            }
            public void _invalidateSize() { this.size = null; }
            private Long value;
            public Long value() {
                if (this.value != null)
                    return this.value;
                this.value = ((Number) ((_root().bits() == Elf.Bits.B32 ? valueB32() : (_root().bits() == Elf.Bits.B64 ? valueB64() : 0)))).longValue();
                return this.value;
            }
            public void _invalidateValue() { this.value = null; }
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
            public void _invalidateVisibility() { this.visibility = null; }
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
            public void setOfsName(long _v) { _dirty = true; ofsName = _v; }
            public Long valueB32() { return valueB32; }
            public void setValueB32(Long _v) { _dirty = true; valueB32 = _v; }
            public Long sizeB32() { return sizeB32; }
            public void setSizeB32(Long _v) { _dirty = true; sizeB32 = _v; }
            public SymbolBinding bind() { return bind; }
            public void setBind(SymbolBinding _v) { _dirty = true; bind = _v; }
            public SymbolType type() { return type; }
            public void setType(SymbolType _v) { _dirty = true; type = _v; }

            /**
             * don't read this field, access `visibility` instead
             */
            public int other() { return other; }
            public void setOther(int _v) { _dirty = true; other = _v; }

            /**
             * section header index
             */
            public int shIdx() { return shIdx; }
            public void setShIdx(int _v) { _dirty = true; shIdx = _v; }
            public Long valueB64() { return valueB64; }
            public void setValueB64(Long _v) { _dirty = true; valueB64 = _v; }
            public Long sizeB64() { return sizeB64; }
            public void setSizeB64(Long _v) { _dirty = true; sizeB64 = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.DynsymSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.DynsymSection _v) { _dirty = true; _parent = _v; }
        }
        public static class NoteSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public NoteSection(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.entries = new ArrayList<NoteSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        NoteSectionEntry _t_entries = new NoteSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }
            private void _readBE() {
                this.entries = new ArrayList<NoteSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        NoteSectionEntry _t_entries = new NoteSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            private void _write_SeqBE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private List<NoteSectionEntry> entries;
            private Elf _root;
            private KaitaiStruct.ReadWrite _parent;
            public List<NoteSectionEntry> entries() { return entries; }
            public void setEntries(List<NoteSectionEntry> _v) { _dirty = true; entries = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/note-section.html">Source</a>
         * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section">Source</a>
         */
        public static class NoteSectionEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public NoteSectionEntry(KaitaiStream _io, Elf.EndianElf.NoteSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.lenName = this._io.readU4le();
                this.lenDescriptor = this._io.readU4le();
                this.type = this._io.readU4le();
                this.name = KaitaiStream.bytesTerminate(this._io.readBytes(lenName()), (byte) 0, false);
                this.namePadding = this._io.readBytes(KaitaiStream.mod(-(lenName()), 4));
                this.descriptor = this._io.readBytes(lenDescriptor());
                this.descriptorPadding = this._io.readBytes(KaitaiStream.mod(-(lenDescriptor()), 4));
                _dirty = false;
            }
            private void _readBE() {
                this.lenName = this._io.readU4be();
                this.lenDescriptor = this._io.readU4be();
                this.type = this._io.readU4be();
                this.name = KaitaiStream.bytesTerminate(this._io.readBytes(lenName()), (byte) 0, false);
                this.namePadding = this._io.readBytes(KaitaiStream.mod(-(lenName()), 4));
                this.descriptor = this._io.readBytes(lenDescriptor());
                this.descriptorPadding = this._io.readBytes(KaitaiStream.mod(-(lenDescriptor()), 4));
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU4le(this.lenName);
                this._io.writeU4le(this.lenDescriptor);
                this._io.writeU4le(this.type);
                this._io.writeBytesLimit(this.name, lenName(), (byte) 0, (byte) 0);
                this._io.writeBytes(this.namePadding);
                this._io.writeBytes(this.descriptor);
                this._io.writeBytes(this.descriptorPadding);
            }

            private void _write_SeqBE() {
                this._io.writeU4be(this.lenName);
                this._io.writeU4be(this.lenDescriptor);
                this._io.writeU4be(this.type);
                this._io.writeBytesLimit(this.name, lenName(), (byte) 0, (byte) 0);
                this._io.writeBytes(this.namePadding);
                this._io.writeBytes(this.descriptor);
                this._io.writeBytes(this.descriptorPadding);
            }

            public void _check() {
                if (this.name.length > lenName())
                    throw new ConsistencyError("name", lenName(), this.name.length);
                if (KaitaiStream.byteArrayIndexOf(this.name, ((byte) 0)) != -1)
                    throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf(this.name, ((byte) 0)));
                if (this.namePadding.length != KaitaiStream.mod(-(lenName()), 4))
                    throw new ConsistencyError("name_padding", KaitaiStream.mod(-(lenName()), 4), this.namePadding.length);
                if (this.descriptor.length != lenDescriptor())
                    throw new ConsistencyError("descriptor", lenDescriptor(), this.descriptor.length);
                if (this.descriptorPadding.length != KaitaiStream.mod(-(lenDescriptor()), 4))
                    throw new ConsistencyError("descriptor_padding", KaitaiStream.mod(-(lenDescriptor()), 4), this.descriptorPadding.length);
                _dirty = false;
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
            public void setLenName(long _v) { _dirty = true; lenName = _v; }
            public long lenDescriptor() { return lenDescriptor; }
            public void setLenDescriptor(long _v) { _dirty = true; lenDescriptor = _v; }
            public long type() { return type; }
            public void setType(long _v) { _dirty = true; type = _v; }

            /**
             * Although the ELF specification seems to hint that the `note_name` field
             * is ASCII this isn't the case for Linux binaries that have a
             * `.gnu.build.attributes` section.
             * @see <a href="https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes">Source</a>
             */
            public byte[] name() { return name; }
            public void setName(byte[] _v) { _dirty = true; name = _v; }
            public byte[] namePadding() { return namePadding; }
            public void setNamePadding(byte[] _v) { _dirty = true; namePadding = _v; }
            public byte[] descriptor() { return descriptor; }
            public void setDescriptor(byte[] _v) { _dirty = true; descriptor = _v; }
            public byte[] descriptorPadding() { return descriptorPadding; }
            public void setDescriptorPadding(byte[] _v) { _dirty = true; descriptorPadding = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.NoteSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.NoteSection _v) { _dirty = true; _parent = _v; }
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
        public static class PhDynamicSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public PhDynamicSection(KaitaiStream _io, Elf.EndianElf.ProgramHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.entries = new ArrayList<PhDynamicSectionEntry>();
                {
                    PhDynamicSectionEntry _it;
                    int i = 0;
                    do {
                        PhDynamicSectionEntry _t_entries = new PhDynamicSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            _it = _t_entries;
                            this.entries.add(_it);
                        }
                        i++;
                    } while (!(_it.tagEnum() == Elf.DynamicArrayTags.NULL));
                }
                _dirty = false;
            }
            private void _readBE() {
                this.entries = new ArrayList<PhDynamicSectionEntry>();
                {
                    PhDynamicSectionEntry _it;
                    int i = 0;
                    do {
                        PhDynamicSectionEntry _t_entries = new PhDynamicSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            _it = _t_entries;
                            this.entries.add(_it);
                        }
                        i++;
                    } while (!(_it.tagEnum() == Elf.DynamicArrayTags.NULL));
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            private void _write_SeqBE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.entries.size() == 0)
                    throw new ConsistencyError("entries", 0, this.entries.size());
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                    {
                        PhDynamicSectionEntry _it = this.entries.get(((Number) (i)).intValue());
                        if ((_it.tagEnum() == Elf.DynamicArrayTags.NULL) != (i == this.entries.size() - 1))
                            throw new ConsistencyError("entries", i == this.entries.size() - 1, _it.tagEnum() == Elf.DynamicArrayTags.NULL);
                    }
                }
                _dirty = false;
            }
            private List<PhDynamicSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.ProgramHeader _parent;
            public List<PhDynamicSectionEntry> entries() { return entries; }
            public void setEntries(List<PhDynamicSectionEntry> _v) { _dirty = true; entries = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.ProgramHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.ProgramHeader _v) { _dirty = true; _parent = _v; }
        }

        /**
         * Same type as `sh_dynamic_section_entry`, but without the `value_str`
         * instance - see the documentation for `ph_dynamic_section` for more
         * details.
         * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         */
        public static class PhDynamicSectionEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public PhDynamicSectionEntry(KaitaiStream _io, Elf.EndianElf.PhDynamicSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteFlag1Values = _enabledFlag1Values;
                _shouldWriteFlagValues = _enabledFlagValues;
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4le(((Number) (this.tag)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.tag);
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
                            this._io.writeU4le(((Number) (this.valueOrPtr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.valueOrPtr);
                            break;
                        }
                        }
                    }
                }
            }

            private void _write_SeqBE() {
                _shouldWriteFlag1Values = _enabledFlag1Values;
                _shouldWriteFlagValues = _enabledFlagValues;
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4be(((Number) (this.tag)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.tag);
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
                            this._io.writeU4be(((Number) (this.valueOrPtr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.valueOrPtr);
                            break;
                        }
                        }
                    }
                }
            }

            public void _check() {
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
                if (_enabledFlag1Values) {
                    if (tagEnum() == Elf.DynamicArrayTags.FLAGS_1) {
                        if (!Objects.equals(this.flag1Values._root(), _root()))
                            throw new ConsistencyError("flag_1_values", _root(), this.flag1Values._root());
                        if (!Objects.equals(this.flag1Values._parent(), this))
                            throw new ConsistencyError("flag_1_values", this, this.flag1Values._parent());
                        if (this.flag1Values.value() != valueOrPtr())
                            throw new ConsistencyError("flag_1_values", valueOrPtr(), this.flag1Values.value());
                    }
                }
                if (_enabledFlagValues) {
                    if (tagEnum() == Elf.DynamicArrayTags.FLAGS) {
                        if (!Objects.equals(this.flagValues._root(), _root()))
                            throw new ConsistencyError("flag_values", _root(), this.flagValues._root());
                        if (!Objects.equals(this.flagValues._parent(), this))
                            throw new ConsistencyError("flag_values", this, this.flagValues._parent());
                        if (this.flagValues.value() != valueOrPtr())
                            throw new ConsistencyError("flag_values", valueOrPtr(), this.flagValues.value());
                    }
                }
                _dirty = false;
            }
            private DtFlag1Values flag1Values;
            private boolean _shouldWriteFlag1Values = false;
            private boolean _enabledFlag1Values = true;
            public DtFlag1Values flag1Values() {
                if (_shouldWriteFlag1Values)
                    _writeFlag1Values();
                if (this.flag1Values != null)
                    return this.flag1Values;
                if (!_enabledFlag1Values)
                    return null;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS_1) {
                    if (_is_le) {
                        this.flag1Values = new DtFlag1Values(this._io, this, _root, valueOrPtr());
                        this.flag1Values._read();
                    } else {
                        this.flag1Values = new DtFlag1Values(this._io, this, _root, valueOrPtr());
                        this.flag1Values._read();
                    }
                }
                return this.flag1Values;
            }
            public void setFlag1Values(DtFlag1Values _v) { _dirty = true; flag1Values = _v; }
            public void setFlag1Values_Enabled(boolean _v) { _dirty = true; _enabledFlag1Values = _v; }

            private void _writeFlag1Values() {
                _shouldWriteFlag1Values = false;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS_1) {
                    if (_is_le) {
                        this.flag1Values._write_Seq(this._io);
                    } else {
                        this.flag1Values._write_Seq(this._io);
                    }
                }
            }
            private DtFlagValues flagValues;
            private boolean _shouldWriteFlagValues = false;
            private boolean _enabledFlagValues = true;
            public DtFlagValues flagValues() {
                if (_shouldWriteFlagValues)
                    _writeFlagValues();
                if (this.flagValues != null)
                    return this.flagValues;
                if (!_enabledFlagValues)
                    return null;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS) {
                    if (_is_le) {
                        this.flagValues = new DtFlagValues(this._io, this, _root, valueOrPtr());
                        this.flagValues._read();
                    } else {
                        this.flagValues = new DtFlagValues(this._io, this, _root, valueOrPtr());
                        this.flagValues._read();
                    }
                }
                return this.flagValues;
            }
            public void setFlagValues(DtFlagValues _v) { _dirty = true; flagValues = _v; }
            public void setFlagValues_Enabled(boolean _v) { _dirty = true; _enabledFlagValues = _v; }

            private void _writeFlagValues() {
                _shouldWriteFlagValues = false;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS) {
                    if (_is_le) {
                        this.flagValues._write_Seq(this._io);
                    } else {
                        this.flagValues._write_Seq(this._io);
                    }
                }
            }
            private Boolean isValueStr;
            public Boolean isValueStr() {
                if (this.isValueStr != null)
                    return this.isValueStr;
                this.isValueStr =  ((valueOrPtr() != 0) && ( ((tagEnum() == Elf.DynamicArrayTags.NEEDED) || (tagEnum() == Elf.DynamicArrayTags.SONAME) || (tagEnum() == Elf.DynamicArrayTags.RPATH) || (tagEnum() == Elf.DynamicArrayTags.RUNPATH) || (tagEnum() == Elf.DynamicArrayTags.SUNW_AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.SUNW_FILTER) || (tagEnum() == Elf.DynamicArrayTags.AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.FILTER) || (tagEnum() == Elf.DynamicArrayTags.CONFIG) || (tagEnum() == Elf.DynamicArrayTags.DEPAUDIT) || (tagEnum() == Elf.DynamicArrayTags.AUDIT)) )) ;
                return this.isValueStr;
            }
            public void _invalidateIsValueStr() { this.isValueStr = null; }
            private DynamicArrayTags tagEnum;
            public DynamicArrayTags tagEnum() {
                if (this.tagEnum != null)
                    return this.tagEnum;
                this.tagEnum = Elf.DynamicArrayTags.byId(tag());
                return this.tagEnum;
            }
            public void _invalidateTagEnum() { this.tagEnum = null; }
            private Long tag;
            private Long valueOrPtr;
            private Elf _root;
            private Elf.EndianElf.PhDynamicSection _parent;
            public Long tag() { return tag; }
            public void setTag(Long _v) { _dirty = true; tag = _v; }
            public Long valueOrPtr() { return valueOrPtr; }
            public void setValueOrPtr(Long _v) { _dirty = true; valueOrPtr = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.PhDynamicSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.PhDynamicSection _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://gabi.xinuos.com/v42/elf/07-pheader.html#program-header-entry">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-header.html">Source</a>
         */
        public static class ProgramHeader extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public ProgramHeader(KaitaiStream _io, Elf.EndianElf _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteBody = _enabledBody;
                _shouldWriteFlagsObj = _enabledFlagsObj;
                this._io.writeU4le(((Number) (this.type.id())).longValue());
                if (_root().bits() == Elf.Bits.B64) {
                    this._io.writeU4le(this.flags64);
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4le(((Number) (this.ofsBody)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.ofsBody);
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
                            this._io.writeU4le(((Number) (this.virtAddr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.virtAddr);
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
                            this._io.writeU4le(((Number) (this.physAddr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.physAddr);
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
                            this._io.writeU4le(((Number) (this.lenBody)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.lenBody);
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
                            this._io.writeU4le(((Number) (this.memorySize)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.memorySize);
                            break;
                        }
                        }
                    }
                }
                if (_root().bits() == Elf.Bits.B32) {
                    this._io.writeU4le(this.flags32);
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4le(((Number) (this.align)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.align);
                            break;
                        }
                        }
                    }
                }
            }

            private void _write_SeqBE() {
                _shouldWriteBody = _enabledBody;
                _shouldWriteFlagsObj = _enabledFlagsObj;
                this._io.writeU4be(((Number) (this.type.id())).longValue());
                if (_root().bits() == Elf.Bits.B64) {
                    this._io.writeU4be(this.flags64);
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4be(((Number) (this.ofsBody)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.ofsBody);
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
                            this._io.writeU4be(((Number) (this.virtAddr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.virtAddr);
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
                            this._io.writeU4be(((Number) (this.physAddr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.physAddr);
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
                            this._io.writeU4be(((Number) (this.lenBody)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.lenBody);
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
                            this._io.writeU4be(((Number) (this.memorySize)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.memorySize);
                            break;
                        }
                        }
                    }
                }
                if (_root().bits() == Elf.Bits.B32) {
                    this._io.writeU4be(this.flags32);
                }
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4be(((Number) (this.align)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.align);
                            break;
                        }
                        }
                    }
                }
            }

            public void _check() {
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
                if (_enabledBody) {
                    if (lenBody() != 0) {
                        {
                            PhType on = type();
                            if (on != null) {
                                switch (type()) {
                                case DYNAMIC: {
                                    if (!Objects.equals(((Elf.EndianElf.PhDynamicSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.PhDynamicSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.PhDynamicSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.PhDynamicSection) (this.body))._parent());
                                    break;
                                }
                                case INTERP: {
                                    if (!Objects.equals(((Elf.EndianElf.ProgramHeader.PhInterpreter) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.ProgramHeader.PhInterpreter) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.ProgramHeader.PhInterpreter) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.ProgramHeader.PhInterpreter) (this.body))._parent());
                                    break;
                                }
                                case NOTE: {
                                    if (!Objects.equals(((Elf.EndianElf.NoteSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.NoteSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.NoteSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.NoteSection) (this.body))._parent());
                                    break;
                                }
                                default: {
                                    if (((byte[]) (this.body)).length != lenBody())
                                        throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                                    break;
                                }
                                }
                            } else {
                                if (((byte[]) (this.body)).length != lenBody())
                                    throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                            }
                        }
                    }
                }
                if (_enabledFlagsObj) {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                if (!Objects.equals(this.flagsObj._root(), _root()))
                                    throw new ConsistencyError("flags_obj", _root(), this.flagsObj._root());
                                if (!Objects.equals(this.flagsObj._parent(), this))
                                    throw new ConsistencyError("flags_obj", this, this.flagsObj._parent());
                                if (this.flagsObj.value() != flags32())
                                    throw new ConsistencyError("flags_obj", flags32(), this.flagsObj.value());
                                break;
                            }
                            case B64: {
                                if (!Objects.equals(this.flagsObj._root(), _root()))
                                    throw new ConsistencyError("flags_obj", _root(), this.flagsObj._root());
                                if (!Objects.equals(this.flagsObj._parent(), this))
                                    throw new ConsistencyError("flags_obj", this, this.flagsObj._parent());
                                if (this.flagsObj.value() != flags64())
                                    throw new ConsistencyError("flags_obj", flags64(), this.flagsObj.value());
                                break;
                            }
                            }
                        }
                    }
                }
                _dirty = false;
            }

            /**
             * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#program-interpreter">Source</a>
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-interpreter.html">Source</a>
             */
            public static class PhInterpreter extends KaitaiStruct.ReadWrite {
                private Boolean _is_le;

                public PhInterpreter(KaitaiStream _io, Elf.EndianElf.ProgramHeader _parent, Elf _root, boolean _is_le) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this._is_le = _is_le;
                }
                public void _read() {

                    if (_is_le == null) {
                        throw new KaitaiStream.UndecidedEndiannessError();
                    } else if (_is_le) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                    _dirty = false;
                }
                private void _readLE() {
                    this.pathName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                    _dirty = false;
                }
                private void _readBE() {
                    this.pathName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();

                    if (_is_le == null) {
                        throw new KaitaiStream.UndecidedEndiannessError();
                    } else if (_is_le) {
                        _write_SeqLE();
                    } else {
                        _write_SeqBE();
                    }
                }

                private void _write_SeqLE() {
                    this._io.writeBytes((this.pathName).getBytes(Charset.forName("ASCII")));
                    this._io.writeU1(0);
                }

                private void _write_SeqBE() {
                    this._io.writeBytes((this.pathName).getBytes(Charset.forName("ASCII")));
                    this._io.writeU1(0);
                }

                public void _check() {
                    if (KaitaiStream.byteArrayIndexOf((this.pathName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                        throw new ConsistencyError("path_name", -1, KaitaiStream.byteArrayIndexOf((this.pathName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                    _dirty = false;
                }
                private String pathName;
                private Elf _root;
                private Elf.EndianElf.ProgramHeader _parent;
                public String pathName() { return pathName; }
                public void setPathName(String _v) { _dirty = true; pathName = _v; }
                public Elf _root() { return _root; }
                public void set_root(Elf _v) { _dirty = true; _root = _v; }
                public Elf.EndianElf.ProgramHeader _parent() { return _parent; }
                public void set_parent(Elf.EndianElf.ProgramHeader _v) { _dirty = true; _parent = _v; }
            }
            private Object body;
            private boolean _shouldWriteBody = false;
            private boolean _enabledBody = true;

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
                if (_shouldWriteBody)
                    _writeBody();
                if (this.body != null)
                    return this.body;
                if (!_enabledBody)
                    return null;
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
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new PhDynamicSection(_io__raw_body, this, _root, _is_le);
                                    ((PhDynamicSection) (this.body))._read();
                                    break;
                                }
                                case INTERP: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new PhInterpreter(_io__raw_body, this, _root, _is_le);
                                    ((PhInterpreter) (this.body))._read();
                                    break;
                                }
                                case NOTE: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new NoteSection(_io__raw_body, this, _root, _is_le);
                                    ((NoteSection) (this.body))._read();
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
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new PhDynamicSection(_io__raw_body, this, _root, _is_le);
                                    ((PhDynamicSection) (this.body))._read();
                                    break;
                                }
                                case INTERP: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new PhInterpreter(_io__raw_body, this, _root, _is_le);
                                    ((PhInterpreter) (this.body))._read();
                                    break;
                                }
                                case NOTE: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new NoteSection(_io__raw_body, this, _root, _is_le);
                                    ((NoteSection) (this.body))._read();
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
            public void setBody(Object _v) { _dirty = true; body = _v; }
            public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

            private void _writeBody() {
                _shouldWriteBody = false;
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
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final ProgramHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((PhDynamicSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case INTERP: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final ProgramHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((PhInterpreter) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case NOTE: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final ProgramHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((NoteSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                default: {
                                    io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                                    break;
                                }
                                }
                            } else {
                                io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                            }
                        }
                    } else {
                        {
                            PhType on = type();
                            if (on != null) {
                                switch (type()) {
                                case DYNAMIC: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final ProgramHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((PhDynamicSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case INTERP: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final ProgramHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((PhInterpreter) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case NOTE: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final ProgramHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((NoteSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                default: {
                                    io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                                    break;
                                }
                                }
                            } else {
                                io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                            }
                        }
                    }
                    io.seek(_pos);
                }
            }
            private PhdrTypeFlags flagsObj;
            private boolean _shouldWriteFlagsObj = false;
            private boolean _enabledFlagsObj = true;
            public PhdrTypeFlags flagsObj() {
                if (_shouldWriteFlagsObj)
                    _writeFlagsObj();
                if (this.flagsObj != null)
                    return this.flagsObj;
                if (!_enabledFlagsObj)
                    return null;
                if (_is_le) {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                this.flagsObj = new PhdrTypeFlags(this._io, this, _root, flags32());
                                this.flagsObj._read();
                                break;
                            }
                            case B64: {
                                this.flagsObj = new PhdrTypeFlags(this._io, this, _root, flags64());
                                ((PhdrTypeFlags) (this.flagsObj))._read();
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
                                this.flagsObj._read();
                                break;
                            }
                            case B64: {
                                this.flagsObj = new PhdrTypeFlags(this._io, this, _root, flags64());
                                ((PhdrTypeFlags) (this.flagsObj))._read();
                                break;
                            }
                            }
                        }
                    }
                }
                return this.flagsObj;
            }
            public void setFlagsObj(PhdrTypeFlags _v) { _dirty = true; flagsObj = _v; }
            public void setFlagsObj_Enabled(boolean _v) { _dirty = true; _enabledFlagsObj = _v; }

            private void _writeFlagsObj() {
                _shouldWriteFlagsObj = false;
                if (_is_le) {
                    {
                        Bits on = _root().bits();
                        if (on != null) {
                            switch (_root().bits()) {
                            case B32: {
                                this.flagsObj._write_Seq(this._io);
                                break;
                            }
                            case B64: {
                                ((PhdrTypeFlags) (this.flagsObj))._write_Seq(this._io);
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
                                this.flagsObj._write_Seq(this._io);
                                break;
                            }
                            case B64: {
                                ((PhdrTypeFlags) (this.flagsObj))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }
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
            private byte[] _raw_body;
            public PhType type() { return type; }
            public void setType(PhType _v) { _dirty = true; type = _v; }
            public Long flags64() { return flags64; }
            public void setFlags64(Long _v) { _dirty = true; flags64 = _v; }
            public Long ofsBody() { return ofsBody; }
            public void setOfsBody(Long _v) { _dirty = true; ofsBody = _v; }
            public Long virtAddr() { return virtAddr; }
            public void setVirtAddr(Long _v) { _dirty = true; virtAddr = _v; }
            public Long physAddr() { return physAddr; }
            public void setPhysAddr(Long _v) { _dirty = true; physAddr = _v; }
            public Long lenBody() { return lenBody; }
            public void setLenBody(Long _v) { _dirty = true; lenBody = _v; }
            public Long memorySize() { return memorySize; }
            public void setMemorySize(Long _v) { _dirty = true; memorySize = _v; }
            public Long flags32() { return flags32; }
            public void setFlags32(Long _v) { _dirty = true; flags32 = _v; }
            public Long align() { return align; }
            public void setAlign(Long _v) { _dirty = true; align = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf _parent() { return _parent; }
            public void set_parent(Elf.EndianElf _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_body() { return _raw_body; }
            public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
        }

        /**
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/relocation-sections.html">Source</a>
         * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html">Source</a>
         */
        public static class RelocationSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public RelocationSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le, boolean hasAddend) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.hasAddend = hasAddend;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.entries = new ArrayList<RelocationSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        RelocationSectionEntry _t_entries = new RelocationSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }
            private void _readBE() {
                this.entries = new ArrayList<RelocationSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        RelocationSectionEntry _t_entries = new RelocationSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            private void _write_SeqBE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private List<RelocationSectionEntry> entries;
            private boolean hasAddend;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public List<RelocationSectionEntry> entries() { return entries; }
            public void setEntries(List<RelocationSectionEntry> _v) { _dirty = true; entries = _v; }
            public boolean hasAddend() { return hasAddend; }
            public void setHasAddend(boolean _v) { _dirty = true; hasAddend = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
        }
        public static class RelocationSectionEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public RelocationSectionEntry(KaitaiStream _io, Elf.EndianElf.RelocationSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4le(((Number) (this.offset)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.offset);
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
                            this._io.writeU4le(((Number) (this.info)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.info);
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
                                this._io.writeS4le(((Number) (this.addend)).intValue());
                                break;
                            }
                            case B64: {
                                this._io.writeS8le(this.addend);
                                break;
                            }
                            }
                        }
                    }
                }
            }

            private void _write_SeqBE() {
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4be(((Number) (this.offset)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.offset);
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
                            this._io.writeU4be(((Number) (this.info)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.info);
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
                                this._io.writeS4be(((Number) (this.addend)).intValue());
                                break;
                            }
                            case B64: {
                                this._io.writeS8be(this.addend);
                                break;
                            }
                            }
                        }
                    }
                }
            }

            public void _check() {
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
                _dirty = false;
            }
            private Long offset;
            private Long info;
            private Long addend;
            private Elf _root;
            private Elf.EndianElf.RelocationSection _parent;
            public Long offset() { return offset; }
            public void setOffset(Long _v) { _dirty = true; offset = _v; }
            public Long info() { return info; }
            public void setInfo(Long _v) { _dirty = true; info = _v; }
            public Long addend() { return addend; }
            public void setAddend(Long _v) { _dirty = true; addend = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.RelocationSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.RelocationSection _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://gabi.xinuos.com/v42/elf/03-sheader.html#section-header-table-entry">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html">Source</a>
         */
        public static class SectionHeader extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public SectionHeader(KaitaiStream _io, Elf.EndianElf _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteBody = _enabledBody;
                _shouldWriteFlagsObj = _enabledFlagsObj;
                _shouldWriteName = _enabledName;
                this._io.writeU4le(this.ofsName);
                this._io.writeU4le(((Number) (this.type.id())).longValue());
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4le(((Number) (this.flags)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.flags);
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
                            this._io.writeU4le(((Number) (this.addr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.addr);
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
                            this._io.writeU4le(((Number) (this.ofsBody)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.ofsBody);
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
                            this._io.writeU4le(((Number) (this.lenBody)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.lenBody);
                            break;
                        }
                        }
                    }
                }
                this._io.writeU4le(this.linkedSectionIdx);
                this._io.writeU4le(this.info);
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4le(((Number) (this.align)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.align);
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
                            this._io.writeU4le(((Number) (this.entrySize)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.entrySize);
                            break;
                        }
                        }
                    }
                }
            }

            private void _write_SeqBE() {
                _shouldWriteBody = _enabledBody;
                _shouldWriteFlagsObj = _enabledFlagsObj;
                _shouldWriteName = _enabledName;
                this._io.writeU4be(this.ofsName);
                this._io.writeU4be(((Number) (this.type.id())).longValue());
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4be(((Number) (this.flags)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.flags);
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
                            this._io.writeU4be(((Number) (this.addr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.addr);
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
                            this._io.writeU4be(((Number) (this.ofsBody)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.ofsBody);
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
                            this._io.writeU4be(((Number) (this.lenBody)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.lenBody);
                            break;
                        }
                        }
                    }
                }
                this._io.writeU4be(this.linkedSectionIdx);
                this._io.writeU4be(this.info);
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4be(((Number) (this.align)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.align);
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
                            this._io.writeU4be(((Number) (this.entrySize)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.entrySize);
                            break;
                        }
                        }
                    }
                }
            }

            public void _check() {
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
                if (_enabledBody) {
                    if (type() != Elf.ShType.NOBITS) {
                        {
                            ShType on = type();
                            if (on != null) {
                                switch (type()) {
                                case DYNAMIC: {
                                    if (!Objects.equals(((Elf.EndianElf.ShDynamicSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.ShDynamicSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.ShDynamicSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.ShDynamicSection) (this.body))._parent());
                                    break;
                                }
                                case DYNSYM: {
                                    if (!Objects.equals(((Elf.EndianElf.DynsymSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.DynsymSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.DynsymSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.DynsymSection) (this.body))._parent());
                                    break;
                                }
                                case GNU_VERDEF: {
                                    if (!Objects.equals(((Elf.EndianElf.VerdefSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.VerdefSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.VerdefSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.VerdefSection) (this.body))._parent());
                                    break;
                                }
                                case GNU_VERNEED: {
                                    if (!Objects.equals(((Elf.EndianElf.VerneedSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.VerneedSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.VerneedSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.VerneedSection) (this.body))._parent());
                                    break;
                                }
                                case GNU_VERSYM: {
                                    if (!Objects.equals(((Elf.EndianElf.VersymSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.VersymSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.VersymSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.VersymSection) (this.body))._parent());
                                    break;
                                }
                                case NOTE: {
                                    if (!Objects.equals(((Elf.EndianElf.NoteSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.NoteSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.NoteSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.NoteSection) (this.body))._parent());
                                    break;
                                }
                                case REL: {
                                    if (!Objects.equals(((Elf.EndianElf.RelocationSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.RelocationSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.RelocationSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.RelocationSection) (this.body))._parent());
                                    if (((Elf.EndianElf.RelocationSection) (this.body)).hasAddend() != false)
                                        throw new ConsistencyError("body", false, ((Elf.EndianElf.RelocationSection) (this.body)).hasAddend());
                                    break;
                                }
                                case RELA: {
                                    if (!Objects.equals(((Elf.EndianElf.RelocationSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.RelocationSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.RelocationSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.RelocationSection) (this.body))._parent());
                                    if (((Elf.EndianElf.RelocationSection) (this.body)).hasAddend() != true)
                                        throw new ConsistencyError("body", true, ((Elf.EndianElf.RelocationSection) (this.body)).hasAddend());
                                    break;
                                }
                                case STRTAB: {
                                    if (!Objects.equals(((Elf.EndianElf.StringsStruct) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.StringsStruct) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.StringsStruct) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.StringsStruct) (this.body))._parent());
                                    break;
                                }
                                case SYMTAB: {
                                    if (!Objects.equals(((Elf.EndianElf.DynsymSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.DynsymSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.DynsymSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.DynsymSection) (this.body))._parent());
                                    break;
                                }
                                default: {
                                    if (((byte[]) (this.body)).length != lenBody())
                                        throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                                    break;
                                }
                                }
                            } else {
                                if (((byte[]) (this.body)).length != lenBody())
                                    throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                            }
                        }
                    }
                }
                if (_enabledFlagsObj) {
                    if (!Objects.equals(this.flagsObj._root(), _root()))
                        throw new ConsistencyError("flags_obj", _root(), this.flagsObj._root());
                    if (!Objects.equals(this.flagsObj._parent(), this))
                        throw new ConsistencyError("flags_obj", this, this.flagsObj._parent());
                    if (this.flagsObj.value() != flags())
                        throw new ConsistencyError("flags_obj", flags(), this.flagsObj.value());
                }
                if (_enabledName) {
                    if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                        throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                }
                _dirty = false;
            }
            private Object body;
            private boolean _shouldWriteBody = false;
            private boolean _enabledBody = true;
            public Object body() {
                if (_shouldWriteBody)
                    _writeBody();
                if (this.body != null)
                    return this.body;
                if (!_enabledBody)
                    return null;
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
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new ShDynamicSection(_io__raw_body, this, _root, _is_le);
                                    ((ShDynamicSection) (this.body))._read();
                                    break;
                                }
                                case DYNSYM: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    ((DynsymSection) (this.body))._read();
                                    break;
                                }
                                case GNU_VERDEF: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new VerdefSection(_io__raw_body, this, _root, _is_le);
                                    ((VerdefSection) (this.body))._read();
                                    break;
                                }
                                case GNU_VERNEED: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new VerneedSection(_io__raw_body, this, _root, _is_le);
                                    ((VerneedSection) (this.body))._read();
                                    break;
                                }
                                case GNU_VERSYM: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new VersymSection(_io__raw_body, this, _root, _is_le);
                                    ((VersymSection) (this.body))._read();
                                    break;
                                }
                                case NOTE: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new NoteSection(_io__raw_body, this, _root, _is_le);
                                    ((NoteSection) (this.body))._read();
                                    break;
                                }
                                case REL: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new RelocationSection(_io__raw_body, this, _root, _is_le, false);
                                    ((RelocationSection) (this.body))._read();
                                    break;
                                }
                                case RELA: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new RelocationSection(_io__raw_body, this, _root, _is_le, true);
                                    ((RelocationSection) (this.body))._read();
                                    break;
                                }
                                case STRTAB: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new StringsStruct(_io__raw_body, this, _root, _is_le);
                                    ((StringsStruct) (this.body))._read();
                                    break;
                                }
                                case SYMTAB: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    ((DynsymSection) (this.body))._read();
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
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new ShDynamicSection(_io__raw_body, this, _root, _is_le);
                                    ((ShDynamicSection) (this.body))._read();
                                    break;
                                }
                                case DYNSYM: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    ((DynsymSection) (this.body))._read();
                                    break;
                                }
                                case GNU_VERDEF: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new VerdefSection(_io__raw_body, this, _root, _is_le);
                                    ((VerdefSection) (this.body))._read();
                                    break;
                                }
                                case GNU_VERNEED: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new VerneedSection(_io__raw_body, this, _root, _is_le);
                                    ((VerneedSection) (this.body))._read();
                                    break;
                                }
                                case GNU_VERSYM: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new VersymSection(_io__raw_body, this, _root, _is_le);
                                    ((VersymSection) (this.body))._read();
                                    break;
                                }
                                case NOTE: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new NoteSection(_io__raw_body, this, _root, _is_le);
                                    ((NoteSection) (this.body))._read();
                                    break;
                                }
                                case REL: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new RelocationSection(_io__raw_body, this, _root, _is_le, false);
                                    ((RelocationSection) (this.body))._read();
                                    break;
                                }
                                case RELA: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new RelocationSection(_io__raw_body, this, _root, _is_le, true);
                                    ((RelocationSection) (this.body))._read();
                                    break;
                                }
                                case STRTAB: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new StringsStruct(_io__raw_body, this, _root, _is_le);
                                    ((StringsStruct) (this.body))._read();
                                    break;
                                }
                                case SYMTAB: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    ((DynsymSection) (this.body))._read();
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
            public void setBody(Object _v) { _dirty = true; body = _v; }
            public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

            private void _writeBody() {
                _shouldWriteBody = false;
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
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((ShDynamicSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case DYNSYM: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((DynsymSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case GNU_VERDEF: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((VerdefSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case GNU_VERNEED: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((VerneedSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case GNU_VERSYM: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((VersymSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case NOTE: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((NoteSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case REL: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((RelocationSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case RELA: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((RelocationSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case STRTAB: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((StringsStruct) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case SYMTAB: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((DynsymSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                default: {
                                    io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                                    break;
                                }
                                }
                            } else {
                                io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                            }
                        }
                    } else {
                        {
                            ShType on = type();
                            if (on != null) {
                                switch (type()) {
                                case DYNAMIC: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((ShDynamicSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case DYNSYM: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((DynsymSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case GNU_VERDEF: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((VerdefSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case GNU_VERNEED: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((VerneedSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case GNU_VERSYM: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((VersymSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case NOTE: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((NoteSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case REL: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((RelocationSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case RELA: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((RelocationSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case STRTAB: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((StringsStruct) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                case SYMTAB: {
                                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                                    io.addChildStream(_io__raw_body);
                                    {
                                        long _pos2 = io.pos();
                                        io.seek(io.pos() + (lenBody()));
                                        final SectionHeader _this = this;
                                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                            @Override
                                            protected void write(KaitaiStream parent) {
                                                _this._raw_body = _io__raw_body.toByteArray();
                                                if (((byte[]) (_this._raw_body)).length != lenBody())
                                                    throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                            }
                                        });
                                    }
                                    ((DynsymSection) (this.body))._write_Seq(_io__raw_body);
                                    break;
                                }
                                default: {
                                    io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                                    break;
                                }
                                }
                            } else {
                                io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                            }
                        }
                    }
                    io.seek(_pos);
                }
            }
            private SectionHeaderFlags flagsObj;
            private boolean _shouldWriteFlagsObj = false;
            private boolean _enabledFlagsObj = true;
            public SectionHeaderFlags flagsObj() {
                if (_shouldWriteFlagsObj)
                    _writeFlagsObj();
                if (this.flagsObj != null)
                    return this.flagsObj;
                if (!_enabledFlagsObj)
                    return null;
                if (_is_le) {
                    this.flagsObj = new SectionHeaderFlags(this._io, this, _root, flags());
                    this.flagsObj._read();
                } else {
                    this.flagsObj = new SectionHeaderFlags(this._io, this, _root, flags());
                    this.flagsObj._read();
                }
                return this.flagsObj;
            }
            public void setFlagsObj(SectionHeaderFlags _v) { _dirty = true; flagsObj = _v; }
            public void setFlagsObj_Enabled(boolean _v) { _dirty = true; _enabledFlagsObj = _v; }

            private void _writeFlagsObj() {
                _shouldWriteFlagsObj = false;
                if (_is_le) {
                    this.flagsObj._write_Seq(this._io);
                } else {
                    this.flagsObj._write_Seq(this._io);
                }
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
            public void _invalidateLinkedSection() { this.linkedSection = null; }
            private String name;
            private boolean _shouldWriteName = false;
            private boolean _enabledName = true;
            public String name() {
                if (_shouldWriteName)
                    _writeName();
                if (this.name != null)
                    return this.name;
                if (!_enabledName)
                    return null;
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
            public void setName(String _v) { _dirty = true; name = _v; }
            public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

            private void _writeName() {
                _shouldWriteName = false;
                KaitaiStream io = _root().header().sectionNames()._io();
                long _pos = io.pos();
                io.seek(ofsName());
                if (_is_le) {
                    io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
                    io.writeU1(0);
                } else {
                    io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
                    io.writeU1(0);
                }
                io.seek(_pos);
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
            private byte[] _raw_body;
            public long ofsName() { return ofsName; }
            public void setOfsName(long _v) { _dirty = true; ofsName = _v; }
            public ShType type() { return type; }
            public void setType(ShType _v) { _dirty = true; type = _v; }
            public Long flags() { return flags; }
            public void setFlags(Long _v) { _dirty = true; flags = _v; }
            public Long addr() { return addr; }
            public void setAddr(Long _v) { _dirty = true; addr = _v; }
            public Long ofsBody() { return ofsBody; }
            public void setOfsBody(Long _v) { _dirty = true; ofsBody = _v; }
            public Long lenBody() { return lenBody; }
            public void setLenBody(Long _v) { _dirty = true; lenBody = _v; }
            public long linkedSectionIdx() { return linkedSectionIdx; }
            public void setLinkedSectionIdx(long _v) { _dirty = true; linkedSectionIdx = _v; }
            public long info() { return info; }
            public void setInfo(long _v) { _dirty = true; info = _v; }
            public Long align() { return align; }
            public void setAlign(Long _v) { _dirty = true; align = _v; }
            public Long entrySize() { return entrySize; }
            public void setEntrySize(Long _v) { _dirty = true; entrySize = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf _parent() { return _parent; }
            public void set_parent(Elf.EndianElf _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_body() { return _raw_body; }
            public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
        }

        /**
         * Same type as `ph_dynamic_section`, but it depends on
         * `_parent.linked_section`, so it can be used only in the
         * `section_header` type. See the documentation for `ph_dynamic_section`
         * for more details.
         * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         */
        public static class ShDynamicSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public ShDynamicSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.entries = new ArrayList<ShDynamicSectionEntry>();
                {
                    ShDynamicSectionEntry _it;
                    int i = 0;
                    do {
                        ShDynamicSectionEntry _t_entries = new ShDynamicSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            _it = _t_entries;
                            this.entries.add(_it);
                        }
                        i++;
                    } while (!(_it.tagEnum() == Elf.DynamicArrayTags.NULL));
                }
                _dirty = false;
            }
            private void _readBE() {
                this.entries = new ArrayList<ShDynamicSectionEntry>();
                {
                    ShDynamicSectionEntry _it;
                    int i = 0;
                    do {
                        ShDynamicSectionEntry _t_entries = new ShDynamicSectionEntry(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            _it = _t_entries;
                            this.entries.add(_it);
                        }
                        i++;
                    } while (!(_it.tagEnum() == Elf.DynamicArrayTags.NULL));
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            private void _write_SeqBE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.entries.size() == 0)
                    throw new ConsistencyError("entries", 0, this.entries.size());
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                    {
                        ShDynamicSectionEntry _it = this.entries.get(((Number) (i)).intValue());
                        if ((_it.tagEnum() == Elf.DynamicArrayTags.NULL) != (i == this.entries.size() - 1))
                            throw new ConsistencyError("entries", i == this.entries.size() - 1, _it.tagEnum() == Elf.DynamicArrayTags.NULL);
                    }
                }
                _dirty = false;
            }
            private Boolean isStringTableLinked;
            public Boolean isStringTableLinked() {
                if (this.isStringTableLinked != null)
                    return this.isStringTableLinked;
                this.isStringTableLinked = _parent().linkedSection().type() == Elf.ShType.STRTAB;
                return this.isStringTableLinked;
            }
            public void _invalidateIsStringTableLinked() { this.isStringTableLinked = null; }
            private List<ShDynamicSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public List<ShDynamicSectionEntry> entries() { return entries; }
            public void setEntries(List<ShDynamicSectionEntry> _v) { _dirty = true; entries = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
        }

        /**
         * Same type as `ph_dynamic_section_entry`, but with the `value_str`
         * instance - see the documentation for `ph_dynamic_section` for more
         * details.
         * @see <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         */
        public static class ShDynamicSectionEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public ShDynamicSectionEntry(KaitaiStream _io, Elf.EndianElf.ShDynamicSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteFlag1Values = _enabledFlag1Values;
                _shouldWriteFlagValues = _enabledFlagValues;
                _shouldWriteValueStr = _enabledValueStr;
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4le(((Number) (this.tag)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.tag);
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
                            this._io.writeU4le(((Number) (this.valueOrPtr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.valueOrPtr);
                            break;
                        }
                        }
                    }
                }
            }

            private void _write_SeqBE() {
                _shouldWriteFlag1Values = _enabledFlag1Values;
                _shouldWriteFlagValues = _enabledFlagValues;
                _shouldWriteValueStr = _enabledValueStr;
                {
                    Bits on = _root().bits();
                    if (on != null) {
                        switch (_root().bits()) {
                        case B32: {
                            this._io.writeU4be(((Number) (this.tag)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.tag);
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
                            this._io.writeU4be(((Number) (this.valueOrPtr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.valueOrPtr);
                            break;
                        }
                        }
                    }
                }
            }

            public void _check() {
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
                if (_enabledFlag1Values) {
                    if (tagEnum() == Elf.DynamicArrayTags.FLAGS_1) {
                        if (!Objects.equals(this.flag1Values._root(), _root()))
                            throw new ConsistencyError("flag_1_values", _root(), this.flag1Values._root());
                        if (!Objects.equals(this.flag1Values._parent(), this))
                            throw new ConsistencyError("flag_1_values", this, this.flag1Values._parent());
                        if (this.flag1Values.value() != valueOrPtr())
                            throw new ConsistencyError("flag_1_values", valueOrPtr(), this.flag1Values.value());
                    }
                }
                if (_enabledFlagValues) {
                    if (tagEnum() == Elf.DynamicArrayTags.FLAGS) {
                        if (!Objects.equals(this.flagValues._root(), _root()))
                            throw new ConsistencyError("flag_values", _root(), this.flagValues._root());
                        if (!Objects.equals(this.flagValues._parent(), this))
                            throw new ConsistencyError("flag_values", this, this.flagValues._parent());
                        if (this.flagValues.value() != valueOrPtr())
                            throw new ConsistencyError("flag_values", valueOrPtr(), this.flagValues.value());
                    }
                }
                if (_enabledValueStr) {
                    if ( ((isValueStr()) && (_parent().isStringTableLinked())) ) {
                        if (KaitaiStream.byteArrayIndexOf((this.valueStr).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                            throw new ConsistencyError("value_str", -1, KaitaiStream.byteArrayIndexOf((this.valueStr).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                    }
                }
                _dirty = false;
            }
            private DtFlag1Values flag1Values;
            private boolean _shouldWriteFlag1Values = false;
            private boolean _enabledFlag1Values = true;
            public DtFlag1Values flag1Values() {
                if (_shouldWriteFlag1Values)
                    _writeFlag1Values();
                if (this.flag1Values != null)
                    return this.flag1Values;
                if (!_enabledFlag1Values)
                    return null;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS_1) {
                    if (_is_le) {
                        this.flag1Values = new DtFlag1Values(this._io, this, _root, valueOrPtr());
                        this.flag1Values._read();
                    } else {
                        this.flag1Values = new DtFlag1Values(this._io, this, _root, valueOrPtr());
                        this.flag1Values._read();
                    }
                }
                return this.flag1Values;
            }
            public void setFlag1Values(DtFlag1Values _v) { _dirty = true; flag1Values = _v; }
            public void setFlag1Values_Enabled(boolean _v) { _dirty = true; _enabledFlag1Values = _v; }

            private void _writeFlag1Values() {
                _shouldWriteFlag1Values = false;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS_1) {
                    if (_is_le) {
                        this.flag1Values._write_Seq(this._io);
                    } else {
                        this.flag1Values._write_Seq(this._io);
                    }
                }
            }
            private DtFlagValues flagValues;
            private boolean _shouldWriteFlagValues = false;
            private boolean _enabledFlagValues = true;
            public DtFlagValues flagValues() {
                if (_shouldWriteFlagValues)
                    _writeFlagValues();
                if (this.flagValues != null)
                    return this.flagValues;
                if (!_enabledFlagValues)
                    return null;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS) {
                    if (_is_le) {
                        this.flagValues = new DtFlagValues(this._io, this, _root, valueOrPtr());
                        this.flagValues._read();
                    } else {
                        this.flagValues = new DtFlagValues(this._io, this, _root, valueOrPtr());
                        this.flagValues._read();
                    }
                }
                return this.flagValues;
            }
            public void setFlagValues(DtFlagValues _v) { _dirty = true; flagValues = _v; }
            public void setFlagValues_Enabled(boolean _v) { _dirty = true; _enabledFlagValues = _v; }

            private void _writeFlagValues() {
                _shouldWriteFlagValues = false;
                if (tagEnum() == Elf.DynamicArrayTags.FLAGS) {
                    if (_is_le) {
                        this.flagValues._write_Seq(this._io);
                    } else {
                        this.flagValues._write_Seq(this._io);
                    }
                }
            }
            private Boolean isValueStr;
            public Boolean isValueStr() {
                if (this.isValueStr != null)
                    return this.isValueStr;
                this.isValueStr =  ((valueOrPtr() != 0) && ( ((tagEnum() == Elf.DynamicArrayTags.NEEDED) || (tagEnum() == Elf.DynamicArrayTags.SONAME) || (tagEnum() == Elf.DynamicArrayTags.RPATH) || (tagEnum() == Elf.DynamicArrayTags.RUNPATH) || (tagEnum() == Elf.DynamicArrayTags.SUNW_AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.SUNW_FILTER) || (tagEnum() == Elf.DynamicArrayTags.AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.FILTER) || (tagEnum() == Elf.DynamicArrayTags.CONFIG) || (tagEnum() == Elf.DynamicArrayTags.DEPAUDIT) || (tagEnum() == Elf.DynamicArrayTags.AUDIT)) )) ;
                return this.isValueStr;
            }
            public void _invalidateIsValueStr() { this.isValueStr = null; }
            private DynamicArrayTags tagEnum;
            public DynamicArrayTags tagEnum() {
                if (this.tagEnum != null)
                    return this.tagEnum;
                this.tagEnum = Elf.DynamicArrayTags.byId(tag());
                return this.tagEnum;
            }
            public void _invalidateTagEnum() { this.tagEnum = null; }
            private String valueStr;
            private boolean _shouldWriteValueStr = false;
            private boolean _enabledValueStr = true;
            public String valueStr() {
                if (_shouldWriteValueStr)
                    _writeValueStr();
                if (this.valueStr != null)
                    return this.valueStr;
                if (!_enabledValueStr)
                    return null;
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
            public void setValueStr(String _v) { _dirty = true; valueStr = _v; }
            public void setValueStr_Enabled(boolean _v) { _dirty = true; _enabledValueStr = _v; }

            private void _writeValueStr() {
                _shouldWriteValueStr = false;
                if ( ((isValueStr()) && (_parent().isStringTableLinked())) ) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(valueOrPtr());
                    if (_is_le) {
                        io.writeBytes((this.valueStr).getBytes(Charset.forName("ASCII")));
                        io.writeU1(0);
                    } else {
                        io.writeBytes((this.valueStr).getBytes(Charset.forName("ASCII")));
                        io.writeU1(0);
                    }
                    io.seek(_pos);
                }
            }
            private Long tag;
            private Long valueOrPtr;
            private Elf _root;
            private Elf.EndianElf.ShDynamicSection _parent;
            public Long tag() { return tag; }
            public void setTag(Long _v) { _dirty = true; tag = _v; }
            public Long valueOrPtr() { return valueOrPtr; }
            public void setValueOrPtr(Long _v) { _dirty = true; valueOrPtr = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.ShDynamicSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.ShDynamicSection _v) { _dirty = true; _parent = _v; }
        }
        public static class StringsStruct extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public StringsStruct(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this._io.writeBytes((this.entries.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                    this._io.writeU1(0);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            private void _write_SeqBE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this._io.writeBytes((this.entries.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                    this._io.writeU1(0);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (KaitaiStream.byteArrayIndexOf((this.entries.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                        throw new ConsistencyError("entries", -1, KaitaiStream.byteArrayIndexOf((this.entries.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                }
                _dirty = false;
            }
            private List<String> entries;
            private Elf _root;
            private KaitaiStruct.ReadWrite _parent;
            public List<String> entries() { return entries; }
            public void setEntries(List<String> _v) { _dirty = true; entries = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFEXTS">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VerdauxEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VerdauxEntry(KaitaiStream _io, Elf.EndianElf.VerdefSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteName = _enabledName;
                _shouldWriteNext = _enabledNext;
                if (ofsStart() < 0) {
                    if (this._unnamed0.length != 0)
                        throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                    this._io.writeBytes(this._unnamed0);
                }
                this._io.writeU4le(this.ofsName);
                this._io.writeU4le(this.ofsNext);
            }

            private void _write_SeqBE() {
                _shouldWriteName = _enabledName;
                _shouldWriteNext = _enabledNext;
                if (ofsStart() < 0) {
                    if (this._unnamed0.length != 0)
                        throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                    this._io.writeBytes(this._unnamed0);
                }
                this._io.writeU4be(this.ofsName);
                this._io.writeU4be(this.ofsNext);
            }

            public void _check() {
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 8)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, null, "/types/endian_elf/types/verdaux_entry/seq/2");
                    }
                }
                if (_enabledName) {
                    if (_parent().isStringTableLinked()) {
                        if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                            throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                    }
                }
                if (_enabledNext) {
                    if (ofsNext() != 0) {
                        if (!Objects.equals(this.next._root(), _root()))
                            throw new ConsistencyError("next", _root(), this.next._root());
                        if (!Objects.equals(this.next._parent(), _parent()))
                            throw new ConsistencyError("next", _parent(), this.next._parent());
                    }
                }
                _dirty = false;
            }
            private String name;
            private boolean _shouldWriteName = false;
            private boolean _enabledName = true;
            public String name() {
                if (_shouldWriteName)
                    _writeName();
                if (this.name != null)
                    return this.name;
                if (!_enabledName)
                    return null;
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
            public void setName(String _v) { _dirty = true; name = _v; }
            public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

            private void _writeName() {
                _shouldWriteName = false;
                if (_parent().isStringTableLinked()) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    if (_is_le) {
                        io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                    } else {
                        io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                    }
                    io.seek(_pos);
                }
            }
            private VerdauxEntry next;
            private boolean _shouldWriteNext = false;
            private boolean _enabledNext = true;
            public VerdauxEntry next() {
                if (_shouldWriteNext)
                    _writeNext();
                if (this.next != null)
                    return this.next;
                if (!_enabledNext)
                    return null;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next = new VerdauxEntry(this._io, _parent(), _root, _is_le);
                        this.next._read();
                    } else {
                        this.next = new VerdauxEntry(this._io, _parent(), _root, _is_le);
                        this.next._read();
                    }
                    this._io.seek(_pos);
                }
                return this.next;
            }
            public void setNext(VerdauxEntry _v) { _dirty = true; next = _v; }
            public void setNext_Enabled(boolean _v) { _dirty = true; _enabledNext = _v; }

            private void _writeNext() {
                _shouldWriteNext = false;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next._write_Seq(this._io);
                    } else {
                        this.next._write_Seq(this._io);
                    }
                    this._io.seek(_pos);
                }
            }
            private Integer ofsStart;
            public Integer ofsStart() {
                if (this.ofsStart != null)
                    return this.ofsStart;
                this.ofsStart = ((Number) (_io().pos())).intValue();
                return this.ofsStart;
            }
            public void _invalidateOfsStart() { this.ofsStart = null; }
            private byte[] _unnamed0;
            private long ofsName;
            private long ofsNext;
            private Elf _root;
            private Elf.EndianElf.VerdefSection _parent;
            public byte[] _unnamed0() { return _unnamed0; }
            public void set_unnamed0(byte[] _v) { _dirty = true; _unnamed0 = _v; }

            /**
             * Byte offset to the version or dependency name string in the linked
             * string table.
             */
            public long ofsName() { return ofsName; }
            public void setOfsName(long _v) { _dirty = true; ofsName = _v; }

            /**
             * Byte offset to the next verdaux entry, relative to the start of
             * this `verdaux_entry`. A value of zero means that there is no next
             * entry.
             */
            public long ofsNext() { return ofsNext; }
            public void setOfsNext(long _v) { _dirty = true; ofsNext = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.VerdefSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.VerdefSection _v) { _dirty = true; _parent = _v; }
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
        public static class VerdefSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VerdefSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.firstEntry = new VerdefSectionEntry(this._io, this, _root, _is_le);
                this.firstEntry._read();
                _dirty = false;
            }
            private void _readBE() {
                this.firstEntry = new VerdefSectionEntry(this._io, this, _root, _is_le);
                this.firstEntry._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.firstEntry._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this.firstEntry._write_Seq(this._io);
            }

            private void _write_SeqBE() {
                this.firstEntry._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.firstEntry._root(), _root()))
                    throw new ConsistencyError("first_entry", _root(), this.firstEntry._root());
                if (!Objects.equals(this.firstEntry._parent(), this))
                    throw new ConsistencyError("first_entry", this, this.firstEntry._parent());
                _dirty = false;
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
            public void _invalidateIsStringTableLinked() { this.isStringTableLinked = null; }
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
            public void _invalidateNumEntries() { this.numEntries = null; }
            private VerdefSectionEntry firstEntry;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public VerdefSectionEntry firstEntry() { return firstEntry; }
            public void setFirstEntry(VerdefSectionEntry _v) { _dirty = true; firstEntry = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFENTRIES">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VerdefSectionEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VerdefSectionEntry(KaitaiStream _io, Elf.EndianElf.VerdefSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteFirstAux = _enabledFirstAux;
                _shouldWriteFlagsObj = _enabledFlagsObj;
                _shouldWriteNext = _enabledNext;
                if (ofsStart() < 0) {
                    if (this._unnamed0.length != 0)
                        throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                    this._io.writeBytes(this._unnamed0);
                }
                this._io.writeU2le(this.version);
                this._io.writeU2le(this.flags);
                this._io.writeU2le(this.versionIndex);
                this._io.writeU2le(this.numAuxEntries);
                this._io.writeU4le(this.hash);
                this._io.writeU4le(this.ofsFirstAux);
                this._io.writeU4le(this.ofsNext);
            }

            private void _write_SeqBE() {
                _shouldWriteFirstAux = _enabledFirstAux;
                _shouldWriteFlagsObj = _enabledFlagsObj;
                _shouldWriteNext = _enabledNext;
                if (ofsStart() < 0) {
                    if (this._unnamed0.length != 0)
                        throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                    this._io.writeBytes(this._unnamed0);
                }
                this._io.writeU2be(this.version);
                this._io.writeU2be(this.flags);
                this._io.writeU2be(this.versionIndex);
                this._io.writeU2be(this.numAuxEntries);
                this._io.writeU4be(this.hash);
                this._io.writeU4be(this.ofsFirstAux);
                this._io.writeU4be(this.ofsNext);
            }

            public void _check() {
                if (!(this.version == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, this.version, null, "/types/endian_elf/types/verdef_section_entry/seq/1");
                }
                {
                    int _it = this.versionIndex;
                    if (!((_it & 32768) == 0)) {
                        throw new KaitaiStream.ValidationExprError(this.versionIndex, null, "/types/endian_elf/types/verdef_section_entry/seq/3");
                    }
                }
                if (!(this.numAuxEntries >= 1)) {
                    throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, null, "/types/endian_elf/types/verdef_section_entry/seq/4");
                }
                if (!(this.ofsFirstAux >= 20)) {
                    throw new KaitaiStream.ValidationLessThanError(20, this.ofsFirstAux, null, "/types/endian_elf/types/verdef_section_entry/seq/6");
                }
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 20)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, null, "/types/endian_elf/types/verdef_section_entry/seq/7");
                    }
                }
                if (_enabledFirstAux) {
                    if (!Objects.equals(this.firstAux._root(), _root()))
                        throw new ConsistencyError("first_aux", _root(), this.firstAux._root());
                    if (!Objects.equals(this.firstAux._parent(), _parent()))
                        throw new ConsistencyError("first_aux", _parent(), this.firstAux._parent());
                }
                if (_enabledFlagsObj) {
                    if (!Objects.equals(this.flagsObj._root(), _root()))
                        throw new ConsistencyError("flags_obj", _root(), this.flagsObj._root());
                    if (!Objects.equals(this.flagsObj._parent(), this))
                        throw new ConsistencyError("flags_obj", this, this.flagsObj._parent());
                    if (this.flagsObj.value() != flags())
                        throw new ConsistencyError("flags_obj", flags(), this.flagsObj.value());
                }
                if (_enabledNext) {
                    if (ofsNext() != 0) {
                        if (!Objects.equals(this.next._root(), _root()))
                            throw new ConsistencyError("next", _root(), this.next._root());
                        if (!Objects.equals(this.next._parent(), _parent()))
                            throw new ConsistencyError("next", _parent(), this.next._parent());
                    }
                }
                _dirty = false;
            }
            private VerdauxEntry firstAux;
            private boolean _shouldWriteFirstAux = false;
            private boolean _enabledFirstAux = true;

            /**
             * First auxiliary entry of type `verdaux_entry` (`Elfxx_Verdaux`).
             * The rest follow its `next` instance.
             */
            public VerdauxEntry firstAux() {
                if (_shouldWriteFirstAux)
                    _writeFirstAux();
                if (this.firstAux != null)
                    return this.firstAux;
                if (!_enabledFirstAux)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(ofsStart() + ofsFirstAux());
                if (_is_le) {
                    this.firstAux = new VerdauxEntry(this._io, _parent(), _root, _is_le);
                    this.firstAux._read();
                } else {
                    this.firstAux = new VerdauxEntry(this._io, _parent(), _root, _is_le);
                    this.firstAux._read();
                }
                this._io.seek(_pos);
                return this.firstAux;
            }
            public void setFirstAux(VerdauxEntry _v) { _dirty = true; firstAux = _v; }
            public void setFirstAux_Enabled(boolean _v) { _dirty = true; _enabledFirstAux = _v; }

            private void _writeFirstAux() {
                _shouldWriteFirstAux = false;
                long _pos = this._io.pos();
                this._io.seek(ofsStart() + ofsFirstAux());
                if (_is_le) {
                    this.firstAux._write_Seq(this._io);
                } else {
                    this.firstAux._write_Seq(this._io);
                }
                this._io.seek(_pos);
            }
            private VersionFlags flagsObj;
            private boolean _shouldWriteFlagsObj = false;
            private boolean _enabledFlagsObj = true;
            public VersionFlags flagsObj() {
                if (_shouldWriteFlagsObj)
                    _writeFlagsObj();
                if (this.flagsObj != null)
                    return this.flagsObj;
                if (!_enabledFlagsObj)
                    return null;
                if (_is_le) {
                    this.flagsObj = new VersionFlags(this._io, this, _root, _is_le, flags());
                    this.flagsObj._read();
                } else {
                    this.flagsObj = new VersionFlags(this._io, this, _root, _is_le, flags());
                    this.flagsObj._read();
                }
                return this.flagsObj;
            }
            public void setFlagsObj(VersionFlags _v) { _dirty = true; flagsObj = _v; }
            public void setFlagsObj_Enabled(boolean _v) { _dirty = true; _enabledFlagsObj = _v; }

            private void _writeFlagsObj() {
                _shouldWriteFlagsObj = false;
                if (_is_le) {
                    this.flagsObj._write_Seq(this._io);
                } else {
                    this.flagsObj._write_Seq(this._io);
                }
            }
            private VerdefSectionEntry next;
            private boolean _shouldWriteNext = false;
            private boolean _enabledNext = true;
            public VerdefSectionEntry next() {
                if (_shouldWriteNext)
                    _writeNext();
                if (this.next != null)
                    return this.next;
                if (!_enabledNext)
                    return null;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next = new VerdefSectionEntry(this._io, _parent(), _root, _is_le);
                        this.next._read();
                    } else {
                        this.next = new VerdefSectionEntry(this._io, _parent(), _root, _is_le);
                        this.next._read();
                    }
                    this._io.seek(_pos);
                }
                return this.next;
            }
            public void setNext(VerdefSectionEntry _v) { _dirty = true; next = _v; }
            public void setNext_Enabled(boolean _v) { _dirty = true; _enabledNext = _v; }

            private void _writeNext() {
                _shouldWriteNext = false;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next._write_Seq(this._io);
                    } else {
                        this.next._write_Seq(this._io);
                    }
                    this._io.seek(_pos);
                }
            }
            private Integer ofsStart;
            public Integer ofsStart() {
                if (this.ofsStart != null)
                    return this.ofsStart;
                this.ofsStart = ((Number) (_io().pos())).intValue();
                return this.ofsStart;
            }
            public void _invalidateOfsStart() { this.ofsStart = null; }
            private VersionIndexSpecial versionIndexSpecial;
            public VersionIndexSpecial versionIndexSpecial() {
                if (this.versionIndexSpecial != null)
                    return this.versionIndexSpecial;
                this.versionIndexSpecial = Elf.VersionIndexSpecial.byId(versionIndex());
                return this.versionIndexSpecial;
            }
            public void _invalidateVersionIndexSpecial() { this.versionIndexSpecial = null; }
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
            public void set_unnamed0(byte[] _v) { _dirty = true; _unnamed0 = _v; }

            /**
             * Version of the structure. Must be set to 1.
             */
            public int version() { return version; }
            public void setVersion(int _v) { _dirty = true; version = _v; }

            /**
             * Version information flag bitmask. Access `flags_obj` instead.
             */
            public int flags() { return flags; }
            public void setFlags(int _v) { _dirty = true; flags = _v; }

            /**
             * Version index assigned to this version definition. A unique index
             * that entries in the Symbol Version Table (the `versym_section`
             * type) use to reference the corresponding version definition.
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
             */
            public int versionIndex() { return versionIndex; }
            public void setVersionIndex(int _v) { _dirty = true; versionIndex = _v; }

            /**
             * Number of associated auxiliary entries.
             */
            public int numAuxEntries() { return numAuxEntries; }
            public void setNumAuxEntries(int _v) { _dirty = true; numAuxEntries = _v; }

            /**
             * Version name hash value (ELF hash function).
             */
            public long hash() { return hash; }
            public void setHash(long _v) { _dirty = true; hash = _v; }

            /**
             * Byte offset to the first `verdaux_entry` (`Elfxx_Verdaux`)
             * associated with this version definition. The offset is relative to
             * the start of this `verdef_section_entry`.
             */
            public long ofsFirstAux() { return ofsFirstAux; }
            public void setOfsFirstAux(long _v) { _dirty = true; ofsFirstAux = _v; }

            /**
             * Byte offset to the next verdef entry, relative to the start of
             * this `verdef_section_entry`. A value of zero means that there is
             * no next entry.
             */
            public long ofsNext() { return ofsNext; }
            public void setOfsNext(long _v) { _dirty = true; ofsNext = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.VerdefSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.VerdefSection _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDEXTFIG">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VernauxEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VernauxEntry(KaitaiStream _io, Elf.EndianElf.VerneedSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.hash = this._io.readU4le();
                this.flags = this._io.readU2le();
                this.versionIndex = new VersionIndex(this._io, this, _root, _is_le);
                this.versionIndex._read();
                this.ofsName = this._io.readU4le();
                this.ofsNext = this._io.readU4le();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 16)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/vernaux_entry/seq/5");
                    }
                }
                _dirty = false;
            }
            private void _readBE() {
                if (ofsStart() < 0) {
                    this._unnamed0 = this._io.readBytes(0);
                }
                this.hash = this._io.readU4be();
                this.flags = this._io.readU2be();
                this.versionIndex = new VersionIndex(this._io, this, _root, _is_le);
                this.versionIndex._read();
                this.ofsName = this._io.readU4be();
                this.ofsNext = this._io.readU4be();
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 16)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, this._io, "/types/endian_elf/types/vernaux_entry/seq/5");
                    }
                }
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteFlagsObj = _enabledFlagsObj;
                _shouldWriteName = _enabledName;
                _shouldWriteNext = _enabledNext;
                if (ofsStart() < 0) {
                    if (this._unnamed0.length != 0)
                        throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                    this._io.writeBytes(this._unnamed0);
                }
                this._io.writeU4le(this.hash);
                this._io.writeU2le(this.flags);
                this.versionIndex._write_Seq(this._io);
                this._io.writeU4le(this.ofsName);
                this._io.writeU4le(this.ofsNext);
            }

            private void _write_SeqBE() {
                _shouldWriteFlagsObj = _enabledFlagsObj;
                _shouldWriteName = _enabledName;
                _shouldWriteNext = _enabledNext;
                if (ofsStart() < 0) {
                    if (this._unnamed0.length != 0)
                        throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                    this._io.writeBytes(this._unnamed0);
                }
                this._io.writeU4be(this.hash);
                this._io.writeU2be(this.flags);
                this.versionIndex._write_Seq(this._io);
                this._io.writeU4be(this.ofsName);
                this._io.writeU4be(this.ofsNext);
            }

            public void _check() {
                if (!Objects.equals(this.versionIndex._root(), _root()))
                    throw new ConsistencyError("version_index", _root(), this.versionIndex._root());
                if (!Objects.equals(this.versionIndex._parent(), this))
                    throw new ConsistencyError("version_index", this, this.versionIndex._parent());
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 16)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, null, "/types/endian_elf/types/vernaux_entry/seq/5");
                    }
                }
                if (_enabledFlagsObj) {
                    if (!Objects.equals(this.flagsObj._root(), _root()))
                        throw new ConsistencyError("flags_obj", _root(), this.flagsObj._root());
                    if (!Objects.equals(this.flagsObj._parent(), this))
                        throw new ConsistencyError("flags_obj", this, this.flagsObj._parent());
                    if (this.flagsObj.value() != flags())
                        throw new ConsistencyError("flags_obj", flags(), this.flagsObj.value());
                }
                if (_enabledName) {
                    if (_parent().isStringTableLinked()) {
                        if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                            throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                    }
                }
                if (_enabledNext) {
                    if (ofsNext() != 0) {
                        if (!Objects.equals(this.next._root(), _root()))
                            throw new ConsistencyError("next", _root(), this.next._root());
                        if (!Objects.equals(this.next._parent(), _parent()))
                            throw new ConsistencyError("next", _parent(), this.next._parent());
                    }
                }
                _dirty = false;
            }
            private VersionFlags flagsObj;
            private boolean _shouldWriteFlagsObj = false;
            private boolean _enabledFlagsObj = true;
            public VersionFlags flagsObj() {
                if (_shouldWriteFlagsObj)
                    _writeFlagsObj();
                if (this.flagsObj != null)
                    return this.flagsObj;
                if (!_enabledFlagsObj)
                    return null;
                if (_is_le) {
                    this.flagsObj = new VersionFlags(this._io, this, _root, _is_le, flags());
                    this.flagsObj._read();
                } else {
                    this.flagsObj = new VersionFlags(this._io, this, _root, _is_le, flags());
                    this.flagsObj._read();
                }
                return this.flagsObj;
            }
            public void setFlagsObj(VersionFlags _v) { _dirty = true; flagsObj = _v; }
            public void setFlagsObj_Enabled(boolean _v) { _dirty = true; _enabledFlagsObj = _v; }

            private void _writeFlagsObj() {
                _shouldWriteFlagsObj = false;
                if (_is_le) {
                    this.flagsObj._write_Seq(this._io);
                } else {
                    this.flagsObj._write_Seq(this._io);
                }
            }
            private String name;
            private boolean _shouldWriteName = false;
            private boolean _enabledName = true;
            public String name() {
                if (_shouldWriteName)
                    _writeName();
                if (this.name != null)
                    return this.name;
                if (!_enabledName)
                    return null;
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
            public void setName(String _v) { _dirty = true; name = _v; }
            public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

            private void _writeName() {
                _shouldWriteName = false;
                if (_parent().isStringTableLinked()) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    if (_is_le) {
                        io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                    } else {
                        io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                    }
                    io.seek(_pos);
                }
            }
            private VernauxEntry next;
            private boolean _shouldWriteNext = false;
            private boolean _enabledNext = true;
            public VernauxEntry next() {
                if (_shouldWriteNext)
                    _writeNext();
                if (this.next != null)
                    return this.next;
                if (!_enabledNext)
                    return null;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next = new VernauxEntry(this._io, _parent(), _root, _is_le);
                        this.next._read();
                    } else {
                        this.next = new VernauxEntry(this._io, _parent(), _root, _is_le);
                        this.next._read();
                    }
                    this._io.seek(_pos);
                }
                return this.next;
            }
            public void setNext(VernauxEntry _v) { _dirty = true; next = _v; }
            public void setNext_Enabled(boolean _v) { _dirty = true; _enabledNext = _v; }

            private void _writeNext() {
                _shouldWriteNext = false;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next._write_Seq(this._io);
                    } else {
                        this.next._write_Seq(this._io);
                    }
                    this._io.seek(_pos);
                }
            }
            private Integer ofsStart;
            public Integer ofsStart() {
                if (this.ofsStart != null)
                    return this.ofsStart;
                this.ofsStart = ((Number) (_io().pos())).intValue();
                return this.ofsStart;
            }
            public void _invalidateOfsStart() { this.ofsStart = null; }
            private byte[] _unnamed0;
            private long hash;
            private int flags;
            private VersionIndex versionIndex;
            private long ofsName;
            private long ofsNext;
            private Elf _root;
            private Elf.EndianElf.VerneedSection _parent;
            public byte[] _unnamed0() { return _unnamed0; }
            public void set_unnamed0(byte[] _v) { _dirty = true; _unnamed0 = _v; }

            /**
             * Dependency name hash value (ELF hash function).
             */
            public long hash() { return hash; }
            public void setHash(long _v) { _dirty = true; hash = _v; }

            /**
             * Dependency information flag bitmask. Access `flags_obj` instead.
             */
            public int flags() { return flags; }
            public void setFlags(int _v) { _dirty = true; flags = _v; }

            /**
             * Version index assigned to this dependency version. A unique index
             * that entries in the Symbol Version Table (the `versym_section`
             * type) use to reference the corresponding dependency version.
             * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
             */
            public VersionIndex versionIndex() { return versionIndex; }
            public void setVersionIndex(VersionIndex _v) { _dirty = true; versionIndex = _v; }

            /**
             * Byte offset to the dependency name string in the linked string
             * table.
             */
            public long ofsName() { return ofsName; }
            public void setOfsName(long _v) { _dirty = true; ofsName = _v; }

            /**
             * Byte offset to the next vernaux entry, relative to the start of
             * this `vernaux_entry`. A value of zero means that there is no next
             * entry.
             */
            public long ofsNext() { return ofsNext; }
            public void setOfsNext(long _v) { _dirty = true; ofsNext = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.VerneedSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.VerneedSection _v) { _dirty = true; _parent = _v; }
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
        public static class VerneedSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VerneedSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.firstEntry = new VerneedSectionEntry(this._io, this, _root, _is_le);
                this.firstEntry._read();
                _dirty = false;
            }
            private void _readBE() {
                this.firstEntry = new VerneedSectionEntry(this._io, this, _root, _is_le);
                this.firstEntry._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.firstEntry._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this.firstEntry._write_Seq(this._io);
            }

            private void _write_SeqBE() {
                this.firstEntry._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.firstEntry._root(), _root()))
                    throw new ConsistencyError("first_entry", _root(), this.firstEntry._root());
                if (!Objects.equals(this.firstEntry._parent(), this))
                    throw new ConsistencyError("first_entry", this, this.firstEntry._parent());
                _dirty = false;
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
            public void _invalidateIsStringTableLinked() { this.isStringTableLinked = null; }
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
            public void _invalidateNumEntries() { this.numEntries = null; }
            private VerneedSectionEntry firstEntry;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public VerneedSectionEntry firstEntry() { return firstEntry; }
            public void setFirstEntry(VerneedSectionEntry _v) { _dirty = true; firstEntry = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDFIG">Source</a>
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VerneedSectionEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VerneedSectionEntry(KaitaiStream _io, Elf.EndianElf.VerneedSection _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
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
                _dirty = false;
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteFileName = _enabledFileName;
                _shouldWriteFirstAux = _enabledFirstAux;
                _shouldWriteNext = _enabledNext;
                if (ofsStart() < 0) {
                    if (this._unnamed0.length != 0)
                        throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                    this._io.writeBytes(this._unnamed0);
                }
                this._io.writeU2le(this.version);
                this._io.writeU2le(this.numAuxEntries);
                this._io.writeU4le(this.ofsFileName);
                this._io.writeU4le(this.ofsFirstAux);
                this._io.writeU4le(this.ofsNext);
            }

            private void _write_SeqBE() {
                _shouldWriteFileName = _enabledFileName;
                _shouldWriteFirstAux = _enabledFirstAux;
                _shouldWriteNext = _enabledNext;
                if (ofsStart() < 0) {
                    if (this._unnamed0.length != 0)
                        throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                    this._io.writeBytes(this._unnamed0);
                }
                this._io.writeU2be(this.version);
                this._io.writeU2be(this.numAuxEntries);
                this._io.writeU4be(this.ofsFileName);
                this._io.writeU4be(this.ofsFirstAux);
                this._io.writeU4be(this.ofsNext);
            }

            public void _check() {
                if (!(this.version == 1)) {
                    throw new KaitaiStream.ValidationNotEqualError(1, this.version, null, "/types/endian_elf/types/verneed_section_entry/seq/1");
                }
                if (!(this.numAuxEntries >= 1)) {
                    throw new KaitaiStream.ValidationLessThanError(1, this.numAuxEntries, null, "/types/endian_elf/types/verneed_section_entry/seq/2");
                }
                if (!(this.ofsFirstAux >= 16)) {
                    throw new KaitaiStream.ValidationLessThanError(16, this.ofsFirstAux, null, "/types/endian_elf/types/verneed_section_entry/seq/4");
                }
                {
                    long _it = this.ofsNext;
                    if (!( ((_it == 0) || (_it >= 16)) )) {
                        throw new KaitaiStream.ValidationExprError(this.ofsNext, null, "/types/endian_elf/types/verneed_section_entry/seq/5");
                    }
                }
                if (_enabledFileName) {
                    if (_parent().isStringTableLinked()) {
                        if (KaitaiStream.byteArrayIndexOf((this.fileName).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                            throw new ConsistencyError("file_name", -1, KaitaiStream.byteArrayIndexOf((this.fileName).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                    }
                }
                if (_enabledFirstAux) {
                    if (!Objects.equals(this.firstAux._root(), _root()))
                        throw new ConsistencyError("first_aux", _root(), this.firstAux._root());
                    if (!Objects.equals(this.firstAux._parent(), _parent()))
                        throw new ConsistencyError("first_aux", _parent(), this.firstAux._parent());
                }
                if (_enabledNext) {
                    if (ofsNext() != 0) {
                        if (!Objects.equals(this.next._root(), _root()))
                            throw new ConsistencyError("next", _root(), this.next._root());
                        if (!Objects.equals(this.next._parent(), _parent()))
                            throw new ConsistencyError("next", _parent(), this.next._parent());
                    }
                }
                _dirty = false;
            }
            private String fileName;
            private boolean _shouldWriteFileName = false;
            private boolean _enabledFileName = true;
            public String fileName() {
                if (_shouldWriteFileName)
                    _writeFileName();
                if (this.fileName != null)
                    return this.fileName;
                if (!_enabledFileName)
                    return null;
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
            public void setFileName(String _v) { _dirty = true; fileName = _v; }
            public void setFileName_Enabled(boolean _v) { _dirty = true; _enabledFileName = _v; }

            private void _writeFileName() {
                _shouldWriteFileName = false;
                if (_parent().isStringTableLinked()) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(ofsFileName());
                    if (_is_le) {
                        io.writeBytes((this.fileName).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                    } else {
                        io.writeBytes((this.fileName).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                    }
                    io.seek(_pos);
                }
            }
            private VernauxEntry firstAux;
            private boolean _shouldWriteFirstAux = false;
            private boolean _enabledFirstAux = true;

            /**
             * First auxiliary entry of type `vernaux_entry` (`Elfxx_Vernaux`).
             * The rest follow its `next` instance.
             */
            public VernauxEntry firstAux() {
                if (_shouldWriteFirstAux)
                    _writeFirstAux();
                if (this.firstAux != null)
                    return this.firstAux;
                if (!_enabledFirstAux)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(ofsStart() + ofsFirstAux());
                if (_is_le) {
                    this.firstAux = new VernauxEntry(this._io, _parent(), _root, _is_le);
                    this.firstAux._read();
                } else {
                    this.firstAux = new VernauxEntry(this._io, _parent(), _root, _is_le);
                    this.firstAux._read();
                }
                this._io.seek(_pos);
                return this.firstAux;
            }
            public void setFirstAux(VernauxEntry _v) { _dirty = true; firstAux = _v; }
            public void setFirstAux_Enabled(boolean _v) { _dirty = true; _enabledFirstAux = _v; }

            private void _writeFirstAux() {
                _shouldWriteFirstAux = false;
                long _pos = this._io.pos();
                this._io.seek(ofsStart() + ofsFirstAux());
                if (_is_le) {
                    this.firstAux._write_Seq(this._io);
                } else {
                    this.firstAux._write_Seq(this._io);
                }
                this._io.seek(_pos);
            }
            private VerneedSectionEntry next;
            private boolean _shouldWriteNext = false;
            private boolean _enabledNext = true;
            public VerneedSectionEntry next() {
                if (_shouldWriteNext)
                    _writeNext();
                if (this.next != null)
                    return this.next;
                if (!_enabledNext)
                    return null;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next = new VerneedSectionEntry(this._io, _parent(), _root, _is_le);
                        this.next._read();
                    } else {
                        this.next = new VerneedSectionEntry(this._io, _parent(), _root, _is_le);
                        this.next._read();
                    }
                    this._io.seek(_pos);
                }
                return this.next;
            }
            public void setNext(VerneedSectionEntry _v) { _dirty = true; next = _v; }
            public void setNext_Enabled(boolean _v) { _dirty = true; _enabledNext = _v; }

            private void _writeNext() {
                _shouldWriteNext = false;
                if (ofsNext() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsStart() + ofsNext());
                    if (_is_le) {
                        this.next._write_Seq(this._io);
                    } else {
                        this.next._write_Seq(this._io);
                    }
                    this._io.seek(_pos);
                }
            }
            private Integer ofsStart;
            public Integer ofsStart() {
                if (this.ofsStart != null)
                    return this.ofsStart;
                this.ofsStart = ((Number) (_io().pos())).intValue();
                return this.ofsStart;
            }
            public void _invalidateOfsStart() { this.ofsStart = null; }
            private byte[] _unnamed0;
            private int version;
            private int numAuxEntries;
            private long ofsFileName;
            private long ofsFirstAux;
            private long ofsNext;
            private Elf _root;
            private Elf.EndianElf.VerneedSection _parent;
            public byte[] _unnamed0() { return _unnamed0; }
            public void set_unnamed0(byte[] _v) { _dirty = true; _unnamed0 = _v; }

            /**
             * Version of the structure. Must be set to 1.
             */
            public int version() { return version; }
            public void setVersion(int _v) { _dirty = true; version = _v; }

            /**
             * Number of associated auxiliary entries.
             */
            public int numAuxEntries() { return numAuxEntries; }
            public void setNumAuxEntries(int _v) { _dirty = true; numAuxEntries = _v; }

            /**
             * Byte offset to the file name string in the linked string table.
             */
            public long ofsFileName() { return ofsFileName; }
            public void setOfsFileName(long _v) { _dirty = true; ofsFileName = _v; }

            /**
             * Byte offset to the first associated `vernaux_entry`
             * (`Elfxx_Vernaux`). The offset is relative to the start of this
             * `verneed_section_entry`.
             */
            public long ofsFirstAux() { return ofsFirstAux; }
            public void setOfsFirstAux(long _v) { _dirty = true; ofsFirstAux = _v; }

            /**
             * Byte offset to the next verneed entry, relative to the start of
             * this `verneed_section_entry`. A value of zero means that there is
             * no next entry.
             */
            public long ofsNext() { return ofsNext; }
            public void setOfsNext(long _v) { _dirty = true; ofsNext = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.VerneedSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.VerneedSection _v) { _dirty = true; _parent = _v; }
        }

        /**
         * Version information flag bitmask, shared by the `flags` (`vd_flags`)
         * field of `verdef_section_entry` (`Elfxx_Verdef`) and the `flags`
         * (`vna_flags`) field of `vernaux_entry` (`Elfxx_Vernaux`).
         * @see <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMSTARTSEQ">Source</a>
         * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1078">Source</a>
         * @see <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
         */
        public static class VersionFlags extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VersionFlags(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Elf _root, boolean _is_le, int value) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.value = value;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                _dirty = false;
            }
            private void _readBE() {
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
            }

            private void _write_SeqBE() {
            }

            public void _check() {
                _dirty = false;
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
            public void _invalidateBase() { this.base = null; }
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
            public void _invalidateInfo() { this.info = null; }
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
            public void _invalidateWeak() { this.weak = null; }
            private int value;
            private Elf _root;
            private KaitaiStruct.ReadWrite _parent;
            public int value() { return value; }
            public void setValue(int _v) { _dirty = true; value = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        public static class VersionIndex extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VersionIndex(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.raw = this._io.readU2le();
                _dirty = false;
            }
            private void _readBE() {
                this.raw = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU2le(this.raw);
            }

            private void _write_SeqBE() {
                this._io.writeU2be(this.raw);
            }

            public void _check() {
                _dirty = false;
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
            public void _invalidateIsHidden() { this.isHidden = null; }
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
            public void _invalidateValue() { this.value = null; }
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
            public void _invalidateVersionIndexSpecial() { this.versionIndexSpecial = null; }
            private int raw;
            private Elf _root;
            private KaitaiStruct.ReadWrite _parent;

            /**
             * Raw value, don't read this field - access `value`,
             * `version_index_special` and `is_hidden` instead.
             */
            public int raw() { return raw; }
            public void setRaw(int _v) { _dirty = true; raw = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
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
        public static class VersymSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public VersymSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.entries = new ArrayList<VersionIndex>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        VersionIndex _t_entries = new VersionIndex(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }
            private void _readBE() {
                this.entries = new ArrayList<VersionIndex>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        VersionIndex _t_entries = new VersionIndex(this._io, this, _root, _is_le);
                        try {
                            _t_entries._read();
                        } finally {
                            this.entries.add(_t_entries);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            private void _write_SeqBE() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
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
            public void setEntries(List<VersionIndex> _v) { _dirty = true; entries = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
        }
        private List<ProgramHeader> programHeaders;
        private boolean _shouldWriteProgramHeaders = false;
        private boolean _enabledProgramHeaders = true;
        public List<ProgramHeader> programHeaders() {
            if (_shouldWriteProgramHeaders)
                _writeProgramHeaders();
            if (this.programHeaders != null)
                return this.programHeaders;
            if (!_enabledProgramHeaders)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsProgramHeaders());
            if (_is_le) {
                this._raw_programHeaders = new ArrayList<byte[]>();
                this.programHeaders = new ArrayList<ProgramHeader>();
                for (int i = 0; i < numProgramHeaders(); i++) {
                    this._raw_programHeaders.add(this._io.readBytes(programHeaderSize()));
                    KaitaiStream _io__raw_programHeaders = new ByteBufferKaitaiStream(this._raw_programHeaders.get(i));
                    ProgramHeader _t_programHeaders = new ProgramHeader(_io__raw_programHeaders, this, _root, _is_le);
                    try {
                        _t_programHeaders._read();
                    } finally {
                        this.programHeaders.add(_t_programHeaders);
                    }
                }
            } else {
                this._raw_programHeaders = new ArrayList<byte[]>();
                this.programHeaders = new ArrayList<ProgramHeader>();
                for (int i = 0; i < numProgramHeaders(); i++) {
                    this._raw_programHeaders.add(this._io.readBytes(programHeaderSize()));
                    KaitaiStream _io__raw_programHeaders = new ByteBufferKaitaiStream(this._raw_programHeaders.get(i));
                    ProgramHeader _t_programHeaders = new ProgramHeader(_io__raw_programHeaders, this, _root, _is_le);
                    try {
                        _t_programHeaders._read();
                    } finally {
                        this.programHeaders.add(_t_programHeaders);
                    }
                }
            }
            this._io.seek(_pos);
            return this.programHeaders;
        }
        public void setProgramHeaders(List<ProgramHeader> _v) { _dirty = true; programHeaders = _v; }
        public void setProgramHeaders_Enabled(boolean _v) { _dirty = true; _enabledProgramHeaders = _v; }

        private void _writeProgramHeaders() {
            _shouldWriteProgramHeaders = false;
            long _pos = this._io.pos();
            this._io.seek(ofsProgramHeaders());
            if (_is_le) {
                this._raw_programHeaders = new ArrayList<byte[]>();
                for (int i = 0; i < this.programHeaders.size(); i++) {
                    final KaitaiStream _io__raw_programHeaders = new ByteBufferKaitaiStream(programHeaderSize());
                    this._io.addChildStream(_io__raw_programHeaders);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (programHeaderSize()));
                        final EndianElf _this = this;
                        final int _i = i;
                        _io__raw_programHeaders.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_programHeaders.add(_io__raw_programHeaders.toByteArray());
                                if (_this._raw_programHeaders.get(((Number) (_i)).intValue()).length != programHeaderSize())
                                    throw new ConsistencyError("raw(program_headers)", programHeaderSize(), _this._raw_programHeaders.get(((Number) (_i)).intValue()).length);
                                parent.writeBytes(_this._raw_programHeaders.get(((Number) (_i)).intValue()));
                            }
                        });
                    }
                    this.programHeaders.get(((Number) (i)).intValue())._write_Seq(_io__raw_programHeaders);
                }
            } else {
                this._raw_programHeaders = new ArrayList<byte[]>();
                for (int i = 0; i < this.programHeaders.size(); i++) {
                    final KaitaiStream _io__raw_programHeaders = new ByteBufferKaitaiStream(programHeaderSize());
                    this._io.addChildStream(_io__raw_programHeaders);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (programHeaderSize()));
                        final EndianElf _this = this;
                        final int _i = i;
                        _io__raw_programHeaders.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_programHeaders.add(_io__raw_programHeaders.toByteArray());
                                if (_this._raw_programHeaders.get(((Number) (_i)).intValue()).length != programHeaderSize())
                                    throw new ConsistencyError("raw(program_headers)", programHeaderSize(), _this._raw_programHeaders.get(((Number) (_i)).intValue()).length);
                                parent.writeBytes(_this._raw_programHeaders.get(((Number) (_i)).intValue()));
                            }
                        });
                    }
                    this.programHeaders.get(((Number) (i)).intValue())._write_Seq(_io__raw_programHeaders);
                }
            }
            this._io.seek(_pos);
        }
        private List<SectionHeader> sectionHeaders;
        private boolean _shouldWriteSectionHeaders = false;
        private boolean _enabledSectionHeaders = true;
        public List<SectionHeader> sectionHeaders() {
            if (_shouldWriteSectionHeaders)
                _writeSectionHeaders();
            if (this.sectionHeaders != null)
                return this.sectionHeaders;
            if (!_enabledSectionHeaders)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsSectionHeaders());
            if (_is_le) {
                this._raw_sectionHeaders = new ArrayList<byte[]>();
                this.sectionHeaders = new ArrayList<SectionHeader>();
                for (int i = 0; i < numSectionHeaders(); i++) {
                    this._raw_sectionHeaders.add(this._io.readBytes(sectionHeaderSize()));
                    KaitaiStream _io__raw_sectionHeaders = new ByteBufferKaitaiStream(this._raw_sectionHeaders.get(i));
                    SectionHeader _t_sectionHeaders = new SectionHeader(_io__raw_sectionHeaders, this, _root, _is_le);
                    try {
                        _t_sectionHeaders._read();
                    } finally {
                        this.sectionHeaders.add(_t_sectionHeaders);
                    }
                }
            } else {
                this._raw_sectionHeaders = new ArrayList<byte[]>();
                this.sectionHeaders = new ArrayList<SectionHeader>();
                for (int i = 0; i < numSectionHeaders(); i++) {
                    this._raw_sectionHeaders.add(this._io.readBytes(sectionHeaderSize()));
                    KaitaiStream _io__raw_sectionHeaders = new ByteBufferKaitaiStream(this._raw_sectionHeaders.get(i));
                    SectionHeader _t_sectionHeaders = new SectionHeader(_io__raw_sectionHeaders, this, _root, _is_le);
                    try {
                        _t_sectionHeaders._read();
                    } finally {
                        this.sectionHeaders.add(_t_sectionHeaders);
                    }
                }
            }
            this._io.seek(_pos);
            return this.sectionHeaders;
        }
        public void setSectionHeaders(List<SectionHeader> _v) { _dirty = true; sectionHeaders = _v; }
        public void setSectionHeaders_Enabled(boolean _v) { _dirty = true; _enabledSectionHeaders = _v; }

        private void _writeSectionHeaders() {
            _shouldWriteSectionHeaders = false;
            long _pos = this._io.pos();
            this._io.seek(ofsSectionHeaders());
            if (_is_le) {
                this._raw_sectionHeaders = new ArrayList<byte[]>();
                for (int i = 0; i < this.sectionHeaders.size(); i++) {
                    final KaitaiStream _io__raw_sectionHeaders = new ByteBufferKaitaiStream(sectionHeaderSize());
                    this._io.addChildStream(_io__raw_sectionHeaders);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (sectionHeaderSize()));
                        final EndianElf _this = this;
                        final int _i = i;
                        _io__raw_sectionHeaders.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_sectionHeaders.add(_io__raw_sectionHeaders.toByteArray());
                                if (_this._raw_sectionHeaders.get(((Number) (_i)).intValue()).length != sectionHeaderSize())
                                    throw new ConsistencyError("raw(section_headers)", sectionHeaderSize(), _this._raw_sectionHeaders.get(((Number) (_i)).intValue()).length);
                                parent.writeBytes(_this._raw_sectionHeaders.get(((Number) (_i)).intValue()));
                            }
                        });
                    }
                    this.sectionHeaders.get(((Number) (i)).intValue())._write_Seq(_io__raw_sectionHeaders);
                }
            } else {
                this._raw_sectionHeaders = new ArrayList<byte[]>();
                for (int i = 0; i < this.sectionHeaders.size(); i++) {
                    final KaitaiStream _io__raw_sectionHeaders = new ByteBufferKaitaiStream(sectionHeaderSize());
                    this._io.addChildStream(_io__raw_sectionHeaders);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (sectionHeaderSize()));
                        final EndianElf _this = this;
                        final int _i = i;
                        _io__raw_sectionHeaders.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_sectionHeaders.add(_io__raw_sectionHeaders.toByteArray());
                                if (_this._raw_sectionHeaders.get(((Number) (_i)).intValue()).length != sectionHeaderSize())
                                    throw new ConsistencyError("raw(section_headers)", sectionHeaderSize(), _this._raw_sectionHeaders.get(((Number) (_i)).intValue()).length);
                                parent.writeBytes(_this._raw_sectionHeaders.get(((Number) (_i)).intValue()));
                            }
                        });
                    }
                    this.sectionHeaders.get(((Number) (i)).intValue())._write_Seq(_io__raw_sectionHeaders);
                }
            }
            this._io.seek(_pos);
        }
        private StringsStruct sectionNames;
        private boolean _shouldWriteSectionNames = false;
        private boolean _enabledSectionNames = true;
        public StringsStruct sectionNames() {
            if (_shouldWriteSectionNames)
                _writeSectionNames();
            if (this.sectionNames != null)
                return this.sectionNames;
            if (!_enabledSectionNames)
                return null;
            if ( ((sectionNamesIdx() != Elf.SectionHeaderIdxSpecial.UNDEFINED.id()) && (sectionNamesIdx() < _root().header().numSectionHeaders())) ) {
                long _pos = this._io.pos();
                this._io.seek(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).ofsBody());
                if (_is_le) {
                    this._raw_sectionNames = this._io.readBytes(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody());
                    KaitaiStream _io__raw_sectionNames = new ByteBufferKaitaiStream(this._raw_sectionNames);
                    this.sectionNames = new StringsStruct(_io__raw_sectionNames, this, _root, _is_le);
                    this.sectionNames._read();
                } else {
                    this._raw_sectionNames = this._io.readBytes(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody());
                    KaitaiStream _io__raw_sectionNames = new ByteBufferKaitaiStream(this._raw_sectionNames);
                    this.sectionNames = new StringsStruct(_io__raw_sectionNames, this, _root, _is_le);
                    this.sectionNames._read();
                }
                this._io.seek(_pos);
            }
            return this.sectionNames;
        }
        public void setSectionNames(StringsStruct _v) { _dirty = true; sectionNames = _v; }
        public void setSectionNames_Enabled(boolean _v) { _dirty = true; _enabledSectionNames = _v; }

        private void _writeSectionNames() {
            _shouldWriteSectionNames = false;
            if ( ((sectionNamesIdx() != Elf.SectionHeaderIdxSpecial.UNDEFINED.id()) && (sectionNamesIdx() < _root().header().numSectionHeaders())) ) {
                long _pos = this._io.pos();
                this._io.seek(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).ofsBody());
                if (_is_le) {
                    final KaitaiStream _io__raw_sectionNames = new ByteBufferKaitaiStream(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody());
                    this._io.addChildStream(_io__raw_sectionNames);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody()));
                        final EndianElf _this = this;
                        _io__raw_sectionNames.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_sectionNames = _io__raw_sectionNames.toByteArray();
                                if (_this._raw_sectionNames.length != sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody())
                                    throw new ConsistencyError("raw(section_names)", sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody(), _this._raw_sectionNames.length);
                                parent.writeBytes(_this._raw_sectionNames);
                            }
                        });
                    }
                    this.sectionNames._write_Seq(_io__raw_sectionNames);
                } else {
                    final KaitaiStream _io__raw_sectionNames = new ByteBufferKaitaiStream(sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody());
                    this._io.addChildStream(_io__raw_sectionNames);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody()));
                        final EndianElf _this = this;
                        _io__raw_sectionNames.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_sectionNames = _io__raw_sectionNames.toByteArray();
                                if (_this._raw_sectionNames.length != sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody())
                                    throw new ConsistencyError("raw(section_names)", sectionHeaders().get(((Number) (sectionNamesIdx())).intValue()).lenBody(), _this._raw_sectionNames.length);
                                parent.writeBytes(_this._raw_sectionNames);
                            }
                        });
                    }
                    this.sectionNames._write_Seq(_io__raw_sectionNames);
                }
                this._io.seek(_pos);
            }
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
        private List<byte[]> _raw_programHeaders;
        private List<byte[]> _raw_sectionHeaders;
        private byte[] _raw_sectionNames;
        public ObjType eType() { return eType; }
        public void setEType(ObjType _v) { _dirty = true; eType = _v; }
        public Machine machine() { return machine; }
        public void setMachine(Machine _v) { _dirty = true; machine = _v; }
        public long eVersion() { return eVersion; }
        public void setEVersion(long _v) { _dirty = true; eVersion = _v; }
        public Long entryPoint() { return entryPoint; }
        public void setEntryPoint(Long _v) { _dirty = true; entryPoint = _v; }
        public Long ofsProgramHeaders() { return ofsProgramHeaders; }
        public void setOfsProgramHeaders(Long _v) { _dirty = true; ofsProgramHeaders = _v; }
        public Long ofsSectionHeaders() { return ofsSectionHeaders; }
        public void setOfsSectionHeaders(Long _v) { _dirty = true; ofsSectionHeaders = _v; }
        public byte[] flags() { return flags; }
        public void setFlags(byte[] _v) { _dirty = true; flags = _v; }
        public int eEhsize() { return eEhsize; }
        public void setEEhsize(int _v) { _dirty = true; eEhsize = _v; }
        public int programHeaderSize() { return programHeaderSize; }
        public void setProgramHeaderSize(int _v) { _dirty = true; programHeaderSize = _v; }
        public int numProgramHeaders() { return numProgramHeaders; }
        public void setNumProgramHeaders(int _v) { _dirty = true; numProgramHeaders = _v; }
        public int sectionHeaderSize() { return sectionHeaderSize; }
        public void setSectionHeaderSize(int _v) { _dirty = true; sectionHeaderSize = _v; }
        public int numSectionHeaders() { return numSectionHeaders; }
        public void setNumSectionHeaders(int _v) { _dirty = true; numSectionHeaders = _v; }
        public int sectionNamesIdx() { return sectionNamesIdx; }
        public void setSectionNamesIdx(int _v) { _dirty = true; sectionNamesIdx = _v; }
        public Elf _root() { return _root; }
        public void set_root(Elf _v) { _dirty = true; _root = _v; }
        public Elf _parent() { return _parent; }
        public void set_parent(Elf _v) { _dirty = true; _parent = _v; }
        public List<byte[]> _raw_programHeaders() { return _raw_programHeaders; }
        public void set_raw_ProgramHeaders(List<byte[]> _v) { _dirty = true; _raw_programHeaders = _v; }
        public List<byte[]> _raw_sectionHeaders() { return _raw_sectionHeaders; }
        public void set_raw_SectionHeaders(List<byte[]> _v) { _dirty = true; _raw_sectionHeaders = _v; }
        public byte[] _raw_sectionNames() { return _raw_sectionNames; }
        public void set_raw_SectionNames(byte[] _v) { _dirty = true; _raw_sectionNames = _v; }
    }
    public static class PhdrTypeFlags extends KaitaiStruct.ReadWrite {
        public PhdrTypeFlags(long value) {
            this(null, null, null, value);
        }

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
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
        }
        private Boolean execute;
        public Boolean execute() {
            if (this.execute != null)
                return this.execute;
            this.execute = (value() & 1) != 0;
            return this.execute;
        }
        public void _invalidateExecute() { this.execute = null; }
        private Boolean maskProc;
        public Boolean maskProc() {
            if (this.maskProc != null)
                return this.maskProc;
            this.maskProc = (value() & 4026531840L) != 0;
            return this.maskProc;
        }
        public void _invalidateMaskProc() { this.maskProc = null; }
        private Boolean read;
        public Boolean read() {
            if (this.read != null)
                return this.read;
            this.read = (value() & 4) != 0;
            return this.read;
        }
        public void _invalidateRead() { this.read = null; }
        private Boolean write;
        public Boolean write() {
            if (this.write != null)
                return this.write;
            this.write = (value() & 2) != 0;
            return this.write;
        }
        public void _invalidateWrite() { this.write = null; }
        private long value;
        private Elf _root;
        private Elf.EndianElf.ProgramHeader _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public Elf _root() { return _root; }
        public void set_root(Elf _v) { _dirty = true; _root = _v; }
        public Elf.EndianElf.ProgramHeader _parent() { return _parent; }
        public void set_parent(Elf.EndianElf.ProgramHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675">Source</a>
     * @see <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L614">Source</a>
     * @see <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L468">Source</a>
     */
    public static class SectionHeaderFlags extends KaitaiStruct.ReadWrite {
        public SectionHeaderFlags(long value) {
            this(null, null, null, value);
        }

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
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
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
        public void _invalidateAlloc() { this.alloc = null; }
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
        public void _invalidateCompressed() { this.compressed = null; }
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
        public void _invalidateExclude() { this.exclude = null; }
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
        public void _invalidateExecInstr() { this.execInstr = null; }
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
        public void _invalidateGnuMbind() { this.gnuMbind = null; }
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
        public void _invalidateGroup() { this.group = null; }
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
        public void _invalidateInfoLink() { this.infoLink = null; }
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
        public void _invalidateLinkOrder() { this.linkOrder = null; }
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
        public void _invalidateMaskOs() { this.maskOs = null; }
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
        public void _invalidateMaskProc() { this.maskProc = null; }
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
        public void _invalidateMerge() { this.merge = null; }
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
        public void _invalidateOrdered() { this.ordered = null; }
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
        public void _invalidateOsNonconforming() { this.osNonconforming = null; }
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
        public void _invalidateRetain() { this.retain = null; }
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
        public void _invalidateStrings() { this.strings = null; }
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
        public void _invalidateTls() { this.tls = null; }
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
        public void _invalidateWrite() { this.write = null; }
        private long value;
        private Elf _root;
        private Elf.EndianElf.SectionHeader _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public Elf _root() { return _root; }
        public void set_root(Elf _v) { _dirty = true; _root = _v; }
        public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
    }
    private Integer shIdxHiOs;
    public Integer shIdxHiOs() {
        if (this.shIdxHiOs != null)
            return this.shIdxHiOs;
        this.shIdxHiOs = ((int) 65343);
        return this.shIdxHiOs;
    }
    public void _invalidateShIdxHiOs() { this.shIdxHiOs = null; }
    private Integer shIdxHiProc;
    public Integer shIdxHiProc() {
        if (this.shIdxHiProc != null)
            return this.shIdxHiProc;
        this.shIdxHiProc = ((int) 65311);
        return this.shIdxHiProc;
    }
    public void _invalidateShIdxHiProc() { this.shIdxHiProc = null; }
    private Integer shIdxHiReserved;
    public Integer shIdxHiReserved() {
        if (this.shIdxHiReserved != null)
            return this.shIdxHiReserved;
        this.shIdxHiReserved = ((int) 65535);
        return this.shIdxHiReserved;
    }
    public void _invalidateShIdxHiReserved() { this.shIdxHiReserved = null; }
    private Integer shIdxLoOs;
    public Integer shIdxLoOs() {
        if (this.shIdxLoOs != null)
            return this.shIdxLoOs;
        this.shIdxLoOs = ((int) 65312);
        return this.shIdxLoOs;
    }
    public void _invalidateShIdxLoOs() { this.shIdxLoOs = null; }
    private Integer shIdxLoProc;
    public Integer shIdxLoProc() {
        if (this.shIdxLoProc != null)
            return this.shIdxLoProc;
        this.shIdxLoProc = ((int) 65280);
        return this.shIdxLoProc;
    }
    public void _invalidateShIdxLoProc() { this.shIdxLoProc = null; }
    private Integer shIdxLoReserved;
    public Integer shIdxLoReserved() {
        if (this.shIdxLoReserved != null)
            return this.shIdxLoReserved;
        this.shIdxLoReserved = ((int) 65280);
        return this.shIdxLoReserved;
    }
    public void _invalidateShIdxLoReserved() { this.shIdxLoReserved = null; }
    private byte[] magic;
    private Bits bits;
    private Endian endian;
    private int eiVersion;
    private OsAbi abi;
    private int abiVersion;
    private byte[] pad;
    private EndianElf header;
    private Elf _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * File identification, must be 0x7f + "ELF".
     */
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * File class: designates target machine word size (32 or 64
     * bits). The size of many integer fields in this format will
     * depend on this setting.
     */
    public Bits bits() { return bits; }
    public void setBits(Bits _v) { _dirty = true; bits = _v; }

    /**
     * Endianness used for all integers.
     */
    public Endian endian() { return endian; }
    public void setEndian(Endian _v) { _dirty = true; endian = _v; }

    /**
     * ELF header version.
     */
    public int eiVersion() { return eiVersion; }
    public void setEiVersion(int _v) { _dirty = true; eiVersion = _v; }

    /**
     * Specifies which OS- and ABI-related extensions will be used
     * in this ELF file.
     */
    public OsAbi abi() { return abi; }
    public void setAbi(OsAbi _v) { _dirty = true; abi = _v; }

    /**
     * Version of ABI targeted by this ELF file. Interpretation
     * depends on `abi` attribute.
     */
    public int abiVersion() { return abiVersion; }
    public void setAbiVersion(int _v) { _dirty = true; abiVersion = _v; }
    public byte[] pad() { return pad; }
    public void setPad(byte[] _v) { _dirty = true; pad = _v; }
    public EndianElf header() { return header; }
    public void setHeader(EndianElf _v) { _dirty = true; header = _v; }
    public Elf _root() { return _root; }
    public void set_root(Elf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
