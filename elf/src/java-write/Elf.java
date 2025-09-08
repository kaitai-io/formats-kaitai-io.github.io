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
 * @see <a href="https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=0f62fe0532">Source</a>
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
        X86(3),
        M68K(4),
        M88K(5),
        IAMCU(6),
        I860(7),
        MIPS(8),
        S370(9),
        MIPS_RS3_LE(10),
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
        RCE(39),
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
        MC68HC16(69),
        MC68HC11(70),
        MC68HC08(71),
        MC68HC05(72),
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
        OPENRISC(92),
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
        COMPACT_RISC(103),
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
        CRAYNV2(172),
        RX(173),
        METAG(174),
        MCST_ELBRUS(175),
        ECOG16(176),
        CR16(177),
        ETPU(178),
        SLE9X(179),
        L10M(180),
        K10M(181),
        AARCH64(183),
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
        ARCV2(195),
        OPEN8(196),
        RL78(197),
        VIDEOCORE5(198),
        RENESAS_78KOR(199),
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
        AMD_GPU(224),
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
        WDC65816(257),
        LOONGARCH(258),
        KF32(259),
        U16_U8CORE(260),
        TACHYUM(261),
        NXP_56800EF(262),
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
        private static final Map<Long, Machine> byId = new HashMap<Long, Machine>(229);
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
        OPENVOS(18);

        private final long id;
        OsAbi(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, OsAbi> byId = new HashMap<Long, OsAbi>(17);
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
        GNU_EH_FRAME(1685382480),
        GNU_STACK(1685382481),
        GNU_RELRO(1685382482),
        GNU_PROPERTY(1685382483),
        PAX_FLAGS(1694766464),
        ARM_EXIDX(1879048193);

        private final long id;
        PhType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PhType> byId = new HashMap<Long, PhType>(14);
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
        SUNW_SYMNSORT(1879048172),
        SUNW_PHNAME(1879048173),
        SUNW_ANCILLARY(1879048174),
        SUNW_CAPCHAIN(1879048175),
        SUNW_CAPINFO(1879048176),
        SUNW_SYMSORT(1879048177),
        SUNW_TLSSORT(1879048178),
        SUNW_LDYNSYM(1879048179),
        SUNW_DOF(1879048180),
        SUNW_CAP(1879048181),
        SUNW_SIGNATURE(1879048182),
        SUNW_ANNOTATE(1879048183),
        SUNW_DEBUGSTR(1879048184),
        SUNW_DEBUG(1879048185),
        SUNW_MOVE(1879048186),
        SUNW_COMDAT(1879048187),
        SUNW_SYMINFO(1879048188),
        SUNW_VERDEF(1879048189),
        SUNW_VERNEED(1879048190),
        SUNW_VERSYM(1879048191),
        SPARC_GOTDATA(1879048192),
        AMD64_UNWIND(1879048193),
        ARM_PREEMPTMAP(1879048194),
        ARM_ATTRIBUTES(1879048195),
        ARM_DEBUGOVERLAY(1879048196),
        ARM_OVERLAYSECTION(1879048197);

        private final long id;
        ShType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ShType> byId = new HashMap<Long, ShType>(44);
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
    public static class DtFlag1Values extends KaitaiStruct.ReadWrite {
        public DtFlag1Values(long value) {
            this(null, null, null, value);
        }

        public DtFlag1Values(KaitaiStream _io, long value) {
            this(_io, null, null, value);
        }

        public DtFlag1Values(KaitaiStream _io, Elf.EndianElf.DynamicSectionEntry _parent, long value) {
            this(_io, _parent, null, value);
        }

        public DtFlag1Values(KaitaiStream _io, Elf.EndianElf.DynamicSectionEntry _parent, Elf _root, long value) {
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
        private Boolean confalt;

        /**
         * Configuration alternative created.
         */
        public Boolean confalt() {
            if (this.confalt != null)
                return this.confalt;
            this.confalt = (value() & 8192) != 0;
            return this.confalt;
        }
        public void _invalidateConfalt() { this.confalt = null; }
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
        private Boolean dispreldne;

        /**
         * Disp reloc applied at build time.
         */
        public Boolean dispreldne() {
            if (this.dispreldne != null)
                return this.dispreldne;
            this.dispreldne = (value() & 32768) != 0;
            return this.dispreldne;
        }
        public void _invalidateDispreldne() { this.dispreldne = null; }
        private Boolean disprelpnd;

        /**
         * Disp reloc applied at run-time.
         */
        public Boolean disprelpnd() {
            if (this.disprelpnd != null)
                return this.disprelpnd;
            this.disprelpnd = (value() & 65536) != 0;
            return this.disprelpnd;
        }
        public void _invalidateDisprelpnd() { this.disprelpnd = null; }
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
        private Boolean endfiltee;

        /**
         * Filtee terminates filters search.
         */
        public Boolean endfiltee() {
            if (this.endfiltee != null)
                return this.endfiltee;
            this.endfiltee = (value() & 16384) != 0;
            return this.endfiltee;
        }
        public void _invalidateEndfiltee() { this.endfiltee = null; }
        private Boolean globaudit;

        /**
         * Global auditing required.
         */
        public Boolean globaudit() {
            if (this.globaudit != null)
                return this.globaudit;
            this.globaudit = (value() & 16777216) != 0;
            return this.globaudit;
        }
        public void _invalidateGlobaudit() { this.globaudit = null; }
        private Boolean group;

        /**
         * Set RTLD_GROUP for this object.
         */
        public Boolean group() {
            if (this.group != null)
                return this.group;
            this.group = (value() & 4) != 0;
            return this.group;
        }
        public void _invalidateGroup() { this.group = null; }
        private Boolean ignmuldef;
        public Boolean ignmuldef() {
            if (this.ignmuldef != null)
                return this.ignmuldef;
            this.ignmuldef = (value() & 262144) != 0;
            return this.ignmuldef;
        }
        public void _invalidateIgnmuldef() { this.ignmuldef = null; }
        private Boolean initfirst;

        /**
         * Set RTLD_INITFIRST for this object
         */
        public Boolean initfirst() {
            if (this.initfirst != null)
                return this.initfirst;
            this.initfirst = (value() & 32) != 0;
            return this.initfirst;
        }
        public void _invalidateInitfirst() { this.initfirst = null; }
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
        private Boolean loadfltr;

        /**
         * Trigger filtee loading at runtime.
         */
        public Boolean loadfltr() {
            if (this.loadfltr != null)
                return this.loadfltr;
            this.loadfltr = (value() & 16) != 0;
            return this.loadfltr;
        }
        public void _invalidateLoadfltr() { this.loadfltr = null; }
        private Boolean nodeflib;

        /**
         * Ignore default lib search path.
         */
        public Boolean nodeflib() {
            if (this.nodeflib != null)
                return this.nodeflib;
            this.nodeflib = (value() & 2048) != 0;
            return this.nodeflib;
        }
        public void _invalidateNodeflib() { this.nodeflib = null; }
        private Boolean nodelete;

        /**
         * Set RTLD_NODELETE for this object.
         */
        public Boolean nodelete() {
            if (this.nodelete != null)
                return this.nodelete;
            this.nodelete = (value() & 8) != 0;
            return this.nodelete;
        }
        public void _invalidateNodelete() { this.nodelete = null; }
        private Boolean nodirect;

        /**
         * Object has no-direct binding.
         */
        public Boolean nodirect() {
            if (this.nodirect != null)
                return this.nodirect;
            this.nodirect = (value() & 131072) != 0;
            return this.nodirect;
        }
        public void _invalidateNodirect() { this.nodirect = null; }
        private Boolean nodump;

        /**
         * Object can't be dldump'ed.
         */
        public Boolean nodump() {
            if (this.nodump != null)
                return this.nodump;
            this.nodump = (value() & 4096) != 0;
            return this.nodump;
        }
        public void _invalidateNodump() { this.nodump = null; }
        private Boolean nohdr;
        public Boolean nohdr() {
            if (this.nohdr != null)
                return this.nohdr;
            this.nohdr = (value() & 1048576) != 0;
            return this.nohdr;
        }
        public void _invalidateNohdr() { this.nohdr = null; }
        private Boolean noksyms;
        public Boolean noksyms() {
            if (this.noksyms != null)
                return this.noksyms;
            this.noksyms = (value() & 524288) != 0;
            return this.noksyms;
        }
        public void _invalidateNoksyms() { this.noksyms = null; }
        private Boolean noopen;

        /**
         * Set RTLD_NOOPEN for this object.
         */
        public Boolean noopen() {
            if (this.noopen != null)
                return this.noopen;
            this.noopen = (value() & 64) != 0;
            return this.noopen;
        }
        public void _invalidateNoopen() { this.noopen = null; }
        private Boolean noreloc;
        public Boolean noreloc() {
            if (this.noreloc != null)
                return this.noreloc;
            this.noreloc = (value() & 4194304) != 0;
            return this.noreloc;
        }
        public void _invalidateNoreloc() { this.noreloc = null; }
        private Boolean now;

        /**
         * Set RTLD_NOW for this object.
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
         * $ORIGIN must be handled.
         */
        public Boolean origin() {
            if (this.origin != null)
                return this.origin;
            this.origin = (value() & 128) != 0;
            return this.origin;
        }
        public void _invalidateOrigin() { this.origin = null; }
        private Boolean pie;
        public Boolean pie() {
            if (this.pie != null)
                return this.pie;
            this.pie = (value() & 134217728) != 0;
            return this.pie;
        }
        public void _invalidatePie() { this.pie = null; }
        private Boolean rtldGlobal;

        /**
         * Set RTLD_GLOBAL for this object.
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
        public Boolean stub() {
            if (this.stub != null)
                return this.stub;
            this.stub = (value() & 67108864) != 0;
            return this.stub;
        }
        public void _invalidateStub() { this.stub = null; }
        private Boolean symintpose;

        /**
         * Object has individual interposers.
         */
        public Boolean symintpose() {
            if (this.symintpose != null)
                return this.symintpose;
            this.symintpose = (value() & 8388608) != 0;
            return this.symintpose;
        }
        public void _invalidateSymintpose() { this.symintpose = null; }
        private Boolean trans;
        public Boolean trans() {
            if (this.trans != null)
                return this.trans;
            this.trans = (value() & 512) != 0;
            return this.trans;
        }
        public void _invalidateTrans() { this.trans = null; }
        private long value;
        private Elf _root;
        private Elf.EndianElf.DynamicSectionEntry _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public Elf _root() { return _root; }
        public void set_root(Elf _v) { _dirty = true; _root = _v; }
        public Elf.EndianElf.DynamicSectionEntry _parent() { return _parent; }
        public void set_parent(Elf.EndianElf.DynamicSectionEntry _v) { _dirty = true; _parent = _v; }
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

        public DtFlagValues(KaitaiStream _io, Elf.EndianElf.DynamicSectionEntry _parent, long value) {
            this(_io, _parent, null, value);
        }

        public DtFlagValues(KaitaiStream _io, Elf.EndianElf.DynamicSectionEntry _parent, Elf _root, long value) {
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
        private Elf.EndianElf.DynamicSectionEntry _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public Elf _root() { return _root; }
        public void set_root(Elf _v) { _dirty = true; _root = _v; }
        public Elf.EndianElf.DynamicSectionEntry _parent() { return _parent; }
        public void set_parent(Elf.EndianElf.DynamicSectionEntry _v) { _dirty = true; _parent = _v; }
    }
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
        public static class DynamicSection extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public DynamicSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
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
                this.entries = new ArrayList<DynamicSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        DynamicSectionEntry _t_entries = new DynamicSectionEntry(this._io, this, _root, _is_le);
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
                this.entries = new ArrayList<DynamicSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        DynamicSectionEntry _t_entries = new DynamicSectionEntry(this._io, this, _root, _is_le);
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
            private List<DynamicSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public List<DynamicSectionEntry> entries() { return entries; }
            public void setEntries(List<DynamicSectionEntry> _v) { _dirty = true; entries = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html#dynamic_section">Source</a>
         */
        public static class DynamicSectionEntry extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public DynamicSectionEntry(KaitaiStream _io, Elf.EndianElf.DynamicSection _parent, Elf _root, boolean _is_le) {
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
            private Elf.EndianElf.DynamicSection _parent;
            public Long tag() { return tag; }
            public void setTag(Long _v) { _dirty = true; tag = _v; }
            public Long valueOrPtr() { return valueOrPtr; }
            public void setValueOrPtr(Long _v) { _dirty = true; valueOrPtr = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.DynamicSection _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.DynamicSection _v) { _dirty = true; _parent = _v; }
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
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html">Source</a>
         * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.symtab.html">Source</a>
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
            public SymbolVisibility visibility() {
                if (this.visibility != null)
                    return this.visibility;
                this.visibility = Elf.SymbolVisibility.byId(other() & 3);
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

            public NoteSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
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
            private Elf.EndianElf.SectionHeader _parent;
            public List<NoteSectionEntry> entries() { return entries; }
            public void setEntries(List<NoteSectionEntry> _v) { _dirty = true; entries = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
            public void set_parent(Elf.EndianElf.SectionHeader _v) { _dirty = true; _parent = _v; }
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
                            this.vaddr = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.vaddr = this._io.readU8le();
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
                            this.paddr = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.paddr = this._io.readU8le();
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
                            this.filesz = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.filesz = this._io.readU8le();
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
                            this.memsz = ((Number) (this._io.readU4le())).longValue();
                            break;
                        }
                        case B64: {
                            this.memsz = this._io.readU8le();
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
                            this.vaddr = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.vaddr = this._io.readU8be();
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
                            this.paddr = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.paddr = this._io.readU8be();
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
                            this.filesz = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.filesz = this._io.readU8be();
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
                            this.memsz = ((Number) (this._io.readU4be())).longValue();
                            break;
                        }
                        case B64: {
                            this.memsz = this._io.readU8be();
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
                            this._io.writeU4le(((Number) (this.vaddr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.vaddr);
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
                            this._io.writeU4le(((Number) (this.paddr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.paddr);
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
                            this._io.writeU4le(((Number) (this.filesz)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.filesz);
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
                            this._io.writeU4le(((Number) (this.memsz)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8le(this.memsz);
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
                            this._io.writeU4be(((Number) (this.vaddr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.vaddr);
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
                            this._io.writeU4be(((Number) (this.paddr)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.paddr);
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
                            this._io.writeU4be(((Number) (this.filesz)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.filesz);
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
                            this._io.writeU4be(((Number) (this.memsz)).longValue());
                            break;
                        }
                        case B64: {
                            this._io.writeU8be(this.memsz);
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
            private Long offset;
            private Long vaddr;
            private Long paddr;
            private Long filesz;
            private Long memsz;
            private Long flags32;
            private Long align;
            private Elf _root;
            private Elf.EndianElf _parent;
            public PhType type() { return type; }
            public void setType(PhType _v) { _dirty = true; type = _v; }
            public Long flags64() { return flags64; }
            public void setFlags64(Long _v) { _dirty = true; flags64 = _v; }
            public Long offset() { return offset; }
            public void setOffset(Long _v) { _dirty = true; offset = _v; }
            public Long vaddr() { return vaddr; }
            public void setVaddr(Long _v) { _dirty = true; vaddr = _v; }
            public Long paddr() { return paddr; }
            public void setPaddr(Long _v) { _dirty = true; paddr = _v; }
            public Long filesz() { return filesz; }
            public void setFilesz(Long _v) { _dirty = true; filesz = _v; }
            public Long memsz() { return memsz; }
            public void setMemsz(Long _v) { _dirty = true; memsz = _v; }
            public Long flags32() { return flags32; }
            public void setFlags32(Long _v) { _dirty = true; flags32 = _v; }
            public Long align() { return align; }
            public void setAlign(Long _v) { _dirty = true; align = _v; }
            public Elf _root() { return _root; }
            public void set_root(Elf _v) { _dirty = true; _root = _v; }
            public Elf.EndianElf _parent() { return _parent; }
            public void set_parent(Elf.EndianElf _v) { _dirty = true; _parent = _v; }
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
                this.info = this._io.readBytes(4);
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
                this.info = this._io.readBytes(4);
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
                                ((DynamicSection) (this.body))._fetchInstances();
                                break;
                            }
                            case DYNSYM: {
                                ((DynsymSection) (this.body))._fetchInstances();
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
                this._io.writeBytes(this.info);
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
                this._io.writeBytes(this.info);
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
                if (this.info.length != 4)
                    throw new ConsistencyError("info", 4, this.info.length);
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
                                    if (!Objects.equals(((Elf.EndianElf.DynamicSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.DynamicSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.DynamicSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.DynamicSection) (this.body))._parent());
                                    break;
                                }
                                case DYNSYM: {
                                    if (!Objects.equals(((Elf.EndianElf.DynsymSection) (this.body))._root(), _root()))
                                        throw new ConsistencyError("body", _root(), ((Elf.EndianElf.DynsymSection) (this.body))._root());
                                    if (!Objects.equals(((Elf.EndianElf.DynsymSection) (this.body))._parent(), this))
                                        throw new ConsistencyError("body", this, ((Elf.EndianElf.DynsymSection) (this.body))._parent());
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
                                    this.body = new DynamicSection(_io__raw_body, this, _root, _is_le);
                                    ((DynamicSection) (this.body))._read();
                                    break;
                                }
                                case DYNSYM: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    ((DynsymSection) (this.body))._read();
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
                                    this.body = new DynamicSection(_io__raw_body, this, _root, _is_le);
                                    ((DynamicSection) (this.body))._read();
                                    break;
                                }
                                case DYNSYM: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    ((DynsymSection) (this.body))._read();
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
                                    ((DynamicSection) (this.body))._write_Seq(_io__raw_body);
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
                                    ((DynamicSection) (this.body))._write_Seq(_io__raw_body);
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
            private byte[] info;
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
            public byte[] info() { return info; }
            public void setInfo(byte[] _v) { _dirty = true; info = _v; }
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
         * occupies memory during execution
         */
        public Boolean alloc() {
            if (this.alloc != null)
                return this.alloc;
            this.alloc = (value() & 2) != 0;
            return this.alloc;
        }
        public void _invalidateAlloc() { this.alloc = null; }
        private Boolean exclude;

        /**
         * section is excluded unless referenced or allocated (Solaris)
         */
        public Boolean exclude() {
            if (this.exclude != null)
                return this.exclude;
            this.exclude = (value() & 134217728) != 0;
            return this.exclude;
        }
        public void _invalidateExclude() { this.exclude = null; }
        private Boolean execInstr;

        /**
         * executable
         */
        public Boolean execInstr() {
            if (this.execInstr != null)
                return this.execInstr;
            this.execInstr = (value() & 4) != 0;
            return this.execInstr;
        }
        public void _invalidateExecInstr() { this.execInstr = null; }
        private Boolean group;

        /**
         * section is member of a group
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
         * 'sh_info' contains SHT index
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
         * preserve order after combining
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
         * OS-specific
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
         * Processor-specific
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
         * might be merged
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
         * special ordering requirement (Solaris)
         */
        public Boolean ordered() {
            if (this.ordered != null)
                return this.ordered;
            this.ordered = (value() & 67108864) != 0;
            return this.ordered;
        }
        public void _invalidateOrdered() { this.ordered = null; }
        private Boolean osNonConforming;

        /**
         * non-standard OS specific handling required
         */
        public Boolean osNonConforming() {
            if (this.osNonConforming != null)
                return this.osNonConforming;
            this.osNonConforming = (value() & 256) != 0;
            return this.osNonConforming;
        }
        public void _invalidateOsNonConforming() { this.osNonConforming = null; }
        private Boolean strings;

        /**
         * contains nul-terminated strings
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
         * section hold thread-local data
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
         * writable
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
