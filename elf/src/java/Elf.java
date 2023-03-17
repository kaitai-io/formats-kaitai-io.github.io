// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * @see <a href="https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=0f62fe0532">Source</a>
 * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html">Source</a>
 * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html">Source</a>
 */
public class Elf extends KaitaiStruct {
    public static Elf fromFile(String fileName) throws IOException {
        return new Elf(new ByteBufferKaitaiStream(fileName));
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
        if (!(Arrays.equals(magic(), new byte[] { 127, 69, 76, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 127, 69, 76, 70 }, magic(), _io(), "/seq/0");
        }
        this.bits = Bits.byId(this._io.readU1());
        this.endian = Endian.byId(this._io.readU1());
        this.eiVersion = this._io.readU1();
        if (!(eiVersion() == 1)) {
            throw new KaitaiStream.ValidationNotEqualError(1, eiVersion(), _io(), "/seq/3");
        }
        this.abi = OsAbi.byId(this._io.readU1());
        this.abiVersion = this._io.readU1();
        this.pad = this._io.readBytes(7);
        if (!(Arrays.equals(pad(), new byte[] { 0, 0, 0, 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0 }, pad(), _io(), "/seq/6");
        }
        this.header = new EndianElf(this._io, this, _root);
    }
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
                        boolean _tmp = (boolean) (true);
                        this._is_le = _tmp;
                        break;
                    }
                    case BE: {
                        boolean _tmp = (boolean) (false);
                        this._is_le = _tmp;
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
            this.eVersion = this._io.readU4le();
            {
                Bits on = _root().bits();
                if (on != null) {
                    switch (_root().bits()) {
                    case B32: {
                        this.entryPoint = (long) (this._io.readU4le());
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
                        this.programHeaderOffset = (long) (this._io.readU4le());
                        break;
                    }
                    case B64: {
                        this.programHeaderOffset = this._io.readU8le();
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
                        this.sectionHeaderOffset = (long) (this._io.readU4le());
                        break;
                    }
                    case B64: {
                        this.sectionHeaderOffset = this._io.readU8le();
                        break;
                    }
                    }
                }
            }
            this.flags = this._io.readBytes(4);
            this.eEhsize = this._io.readU2le();
            this.programHeaderEntrySize = this._io.readU2le();
            this.qtyProgramHeader = this._io.readU2le();
            this.sectionHeaderEntrySize = this._io.readU2le();
            this.qtySectionHeader = this._io.readU2le();
            this.sectionNamesIdx = this._io.readU2le();
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
                        this.entryPoint = (long) (this._io.readU4be());
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
                        this.programHeaderOffset = (long) (this._io.readU4be());
                        break;
                    }
                    case B64: {
                        this.programHeaderOffset = this._io.readU8be();
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
                        this.sectionHeaderOffset = (long) (this._io.readU4be());
                        break;
                    }
                    case B64: {
                        this.sectionHeaderOffset = this._io.readU8be();
                        break;
                    }
                    }
                }
            }
            this.flags = this._io.readBytes(4);
            this.eEhsize = this._io.readU2be();
            this.programHeaderEntrySize = this._io.readU2be();
            this.qtyProgramHeader = this._io.readU2be();
            this.sectionHeaderEntrySize = this._io.readU2be();
            this.qtySectionHeader = this._io.readU2be();
            this.sectionNamesIdx = this._io.readU2be();
        }
        public static class NoteSection extends KaitaiStruct {
            private Boolean _is_le;

            public NoteSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
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
            private ArrayList<NoteSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public ArrayList<NoteSectionEntry> entries() { return entries; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        }
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
                            this.offset = (long) (this._io.readU4le());
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
                            this.vaddr = (long) (this._io.readU4le());
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
                            this.paddr = (long) (this._io.readU4le());
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
                            this.filesz = (long) (this._io.readU4le());
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
                            this.memsz = (long) (this._io.readU4le());
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
                            this.align = (long) (this._io.readU4le());
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
                            this.offset = (long) (this._io.readU4be());
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
                            this.vaddr = (long) (this._io.readU4be());
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
                            this.paddr = (long) (this._io.readU4be());
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
                            this.filesz = (long) (this._io.readU4be());
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
                            this.memsz = (long) (this._io.readU4be());
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
                            this.align = (long) (this._io.readU4be());
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
            public Long flags64() { return flags64; }
            public Long offset() { return offset; }
            public Long vaddr() { return vaddr; }
            public Long paddr() { return paddr; }
            public Long filesz() { return filesz; }
            public Long memsz() { return memsz; }
            public Long flags32() { return flags32; }
            public Long align() { return align; }
            public Elf _root() { return _root; }
            public Elf.EndianElf _parent() { return _parent; }
        }

        /**
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
         * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html#dynamic_section">Source</a>
         */
        public static class DynamicSectionEntry extends KaitaiStruct {
            private Boolean _is_le;

            public DynamicSectionEntry(KaitaiStream _io, Elf.EndianElf.DynamicSection _parent, Elf _root, boolean _is_le) {
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
                            this.tag = (long) (this._io.readU4le());
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
                            this.valueOrPtr = (long) (this._io.readU4le());
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
                            this.tag = (long) (this._io.readU4be());
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
                            this.valueOrPtr = (long) (this._io.readU4be());
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
            private String valueStr;
            public String valueStr() {
                if (this.valueStr != null)
                    return this.valueStr;
                if ( ((isValueStr()) && (_parent().isStringTableLinked())) ) {
                    KaitaiStream io = ((Elf.EndianElf.StringsStruct) (_parent()._parent().linkedSection().body()))._io();
                    long _pos = io.pos();
                    io.seek(valueOrPtr());
                    if (_is_le) {
                        this.valueStr = new String(io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
                    } else {
                        this.valueStr = new String(io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
                    }
                    io.seek(_pos);
                }
                return this.valueStr;
            }
            private DynamicArrayTags tagEnum;
            public DynamicArrayTags tagEnum() {
                if (this.tagEnum != null)
                    return this.tagEnum;
                this.tagEnum = Elf.DynamicArrayTags.byId(tag());
                return this.tagEnum;
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
                boolean _tmp = (boolean) ( ((valueOrPtr() != 0) && ( ((tagEnum() == Elf.DynamicArrayTags.NEEDED) || (tagEnum() == Elf.DynamicArrayTags.SONAME) || (tagEnum() == Elf.DynamicArrayTags.RPATH) || (tagEnum() == Elf.DynamicArrayTags.RUNPATH) || (tagEnum() == Elf.DynamicArrayTags.SUNW_AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.SUNW_FILTER) || (tagEnum() == Elf.DynamicArrayTags.AUXILIARY) || (tagEnum() == Elf.DynamicArrayTags.FILTER) || (tagEnum() == Elf.DynamicArrayTags.CONFIG) || (tagEnum() == Elf.DynamicArrayTags.DEPAUDIT) || (tagEnum() == Elf.DynamicArrayTags.AUDIT)) )) );
                this.isValueStr = _tmp;
                return this.isValueStr;
            }
            private Long tag;
            private Long valueOrPtr;
            private Elf _root;
            private Elf.EndianElf.DynamicSection _parent;
            public Long tag() { return tag; }
            public Long valueOrPtr() { return valueOrPtr; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.DynamicSection _parent() { return _parent; }
        }
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
                            this.flags = (long) (this._io.readU4le());
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
                            this.addr = (long) (this._io.readU4le());
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
                            this.ofsBody = (long) (this._io.readU4le());
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
                            this.lenBody = (long) (this._io.readU4le());
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
                            this.align = (long) (this._io.readU4le());
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
                            this.entrySize = (long) (this._io.readU4le());
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
                            this.flags = (long) (this._io.readU4be());
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
                            this.addr = (long) (this._io.readU4be());
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
                            this.ofsBody = (long) (this._io.readU4be());
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
                            this.lenBody = (long) (this._io.readU4be());
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
                            this.align = (long) (this._io.readU4be());
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
                            this.entrySize = (long) (this._io.readU4be());
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
                                case REL: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new RelocationSection(_io__raw_body, this, _root, _is_le, false);
                                    break;
                                }
                                case NOTE: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new NoteSection(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case SYMTAB: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case STRTAB: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new StringsStruct(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case DYNAMIC: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new DynamicSection(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case DYNSYM: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case RELA: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new RelocationSection(_io__raw_body, this, _root, _is_le, true);
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
                                case REL: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new RelocationSection(_io__raw_body, this, _root, _is_le, false);
                                    break;
                                }
                                case NOTE: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new NoteSection(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case SYMTAB: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case STRTAB: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new StringsStruct(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case DYNAMIC: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new DynamicSection(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case DYNSYM: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new DynsymSection(_io__raw_body, this, _root, _is_le);
                                    break;
                                }
                                case RELA: {
                                    this._raw_body = io.readBytes(lenBody());
                                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                                    this.body = new RelocationSection(_io__raw_body, this, _root, _is_le, true);
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
            private SectionHeader linkedSection;

            /**
             * may reference a later section header, so don't try to access too early (use only lazy `instances`)
             * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link">Source</a>
             */
            public SectionHeader linkedSection() {
                if (this.linkedSection != null)
                    return this.linkedSection;
                if ( ((linkedSectionIdx() != Elf.SectionHeaderIdxSpecial.UNDEFINED.id()) && (linkedSectionIdx() < _root().header().qtySectionHeader())) ) {
                    this.linkedSection = _root().header().sectionHeaders().get((int) linkedSectionIdx());
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
                    this.name = new String(io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
                } else {
                    this.name = new String(io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
                }
                io.seek(_pos);
                return this.name;
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
            public ShType type() { return type; }
            public Long flags() { return flags; }
            public Long addr() { return addr; }
            public Long ofsBody() { return ofsBody; }
            public Long lenBody() { return lenBody; }
            public long linkedSectionIdx() { return linkedSectionIdx; }
            public byte[] info() { return info; }
            public Long align() { return align; }
            public Long entrySize() { return entrySize; }
            public Elf _root() { return _root; }
            public Elf.EndianElf _parent() { return _parent; }
            public byte[] _raw_body() { return _raw_body; }
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
            private ArrayList<RelocationSectionEntry> entries;
            private boolean hasAddend;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public ArrayList<RelocationSectionEntry> entries() { return entries; }
            public boolean hasAddend() { return hasAddend; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
        }
        public static class DynamicSection extends KaitaiStruct {
            private Boolean _is_le;

            public DynamicSection(KaitaiStream _io, Elf.EndianElf.SectionHeader _parent, Elf _root, boolean _is_le) {
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
                this.entries = new ArrayList<DynamicSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new DynamicSectionEntry(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<DynamicSectionEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new DynamicSectionEntry(this._io, this, _root, _is_le));
                        i++;
                    }
                }
            }
            private Boolean isStringTableLinked;
            public Boolean isStringTableLinked() {
                if (this.isStringTableLinked != null)
                    return this.isStringTableLinked;
                boolean _tmp = (boolean) (_parent().linkedSection().type() == Elf.ShType.STRTAB);
                this.isStringTableLinked = _tmp;
                return this.isStringTableLinked;
            }
            private ArrayList<DynamicSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public ArrayList<DynamicSectionEntry> entries() { return entries; }
            public Elf _root() { return _root; }
            public Elf.EndianElf.SectionHeader _parent() { return _parent; }
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
            private Boolean isStringTableLinked;
            public Boolean isStringTableLinked() {
                if (this.isStringTableLinked != null)
                    return this.isStringTableLinked;
                boolean _tmp = (boolean) (_parent().linkedSection().type() == Elf.ShType.STRTAB);
                this.isStringTableLinked = _tmp;
                return this.isStringTableLinked;
            }
            private ArrayList<DynsymSectionEntry> entries;
            private Elf _root;
            private Elf.EndianElf.SectionHeader _parent;
            public ArrayList<DynsymSectionEntry> entries() { return entries; }
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
                            this.offset = (long) (this._io.readU4le());
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
                            this.info = (long) (this._io.readU4le());
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
                                this.addend = (long) (this._io.readS4le());
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
                            this.offset = (long) (this._io.readU4be());
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
                            this.info = (long) (this._io.readU4be());
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
                                this.addend = (long) (this._io.readS4be());
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
         * @see <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html">Source</a>
         * @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.symtab.html">Source</a>
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
                this._io.alignToByte();
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
                this._io.alignToByte();
                this.other = this._io.readU1();
                this.shIdx = this._io.readU2be();
                if (_root().bits() == Elf.Bits.B64) {
                    this.valueB64 = this._io.readU8be();
                }
                if (_root().bits() == Elf.Bits.B64) {
                    this.sizeB64 = this._io.readU8be();
                }
            }
            private Boolean isShIdxReserved;
            public Boolean isShIdxReserved() {
                if (this.isShIdxReserved != null)
                    return this.isShIdxReserved;
                boolean _tmp = (boolean) ( ((shIdx() >= _root().shIdxLoReserved()) && (shIdx() <= _root().shIdxHiReserved())) );
                this.isShIdxReserved = _tmp;
                return this.isShIdxReserved;
            }
            private Boolean isShIdxOs;
            public Boolean isShIdxOs() {
                if (this.isShIdxOs != null)
                    return this.isShIdxOs;
                boolean _tmp = (boolean) ( ((shIdx() >= _root().shIdxLoOs()) && (shIdx() <= _root().shIdxHiOs())) );
                this.isShIdxOs = _tmp;
                return this.isShIdxOs;
            }
            private Boolean isShIdxProc;
            public Boolean isShIdxProc() {
                if (this.isShIdxProc != null)
                    return this.isShIdxProc;
                boolean _tmp = (boolean) ( ((shIdx() >= _root().shIdxLoProc()) && (shIdx() <= _root().shIdxHiProc())) );
                this.isShIdxProc = _tmp;
                return this.isShIdxProc;
            }
            private Long size;
            public Long size() {
                if (this.size != null)
                    return this.size;
                long _tmp = (long) ((_root().bits() == Elf.Bits.B32 ? sizeB32() : (_root().bits() == Elf.Bits.B64 ? sizeB64() : 0)));
                this.size = _tmp;
                return this.size;
            }
            private SymbolVisibility visibility;
            public SymbolVisibility visibility() {
                if (this.visibility != null)
                    return this.visibility;
                this.visibility = Elf.SymbolVisibility.byId((other() & 3));
                return this.visibility;
            }
            private Long value;
            public Long value() {
                if (this.value != null)
                    return this.value;
                long _tmp = (long) ((_root().bits() == Elf.Bits.B32 ? valueB32() : (_root().bits() == Elf.Bits.B64 ? valueB64() : 0)));
                this.value = _tmp;
                return this.value;
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
                        this.name = new String(io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8"));
                    } else {
                        this.name = new String(io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8"));
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
                        this.entries.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8")));
                        i++;
                    }
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<String>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8")));
                        i++;
                    }
                }
            }
            private ArrayList<String> entries;
            private Elf _root;
            private KaitaiStruct _parent;
            public ArrayList<String> entries() { return entries; }
            public Elf _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        private ArrayList<ProgramHeader> programHeaders;
        public ArrayList<ProgramHeader> programHeaders() {
            if (this.programHeaders != null)
                return this.programHeaders;
            long _pos = this._io.pos();
            this._io.seek(programHeaderOffset());
            if (_is_le) {
                this._raw_programHeaders = new ArrayList<byte[]>();
                this.programHeaders = new ArrayList<ProgramHeader>();
                for (int i = 0; i < qtyProgramHeader(); i++) {
                    this._raw_programHeaders.add(this._io.readBytes(programHeaderEntrySize()));
                    KaitaiStream _io__raw_programHeaders = new ByteBufferKaitaiStream(_raw_programHeaders.get(_raw_programHeaders.size() - 1));
                    this.programHeaders.add(new ProgramHeader(_io__raw_programHeaders, this, _root, _is_le));
                }
            } else {
                this._raw_programHeaders = new ArrayList<byte[]>();
                this.programHeaders = new ArrayList<ProgramHeader>();
                for (int i = 0; i < qtyProgramHeader(); i++) {
                    this._raw_programHeaders.add(this._io.readBytes(programHeaderEntrySize()));
                    KaitaiStream _io__raw_programHeaders = new ByteBufferKaitaiStream(_raw_programHeaders.get(_raw_programHeaders.size() - 1));
                    this.programHeaders.add(new ProgramHeader(_io__raw_programHeaders, this, _root, _is_le));
                }
            }
            this._io.seek(_pos);
            return this.programHeaders;
        }
        private ArrayList<SectionHeader> sectionHeaders;
        public ArrayList<SectionHeader> sectionHeaders() {
            if (this.sectionHeaders != null)
                return this.sectionHeaders;
            long _pos = this._io.pos();
            this._io.seek(sectionHeaderOffset());
            if (_is_le) {
                this._raw_sectionHeaders = new ArrayList<byte[]>();
                this.sectionHeaders = new ArrayList<SectionHeader>();
                for (int i = 0; i < qtySectionHeader(); i++) {
                    this._raw_sectionHeaders.add(this._io.readBytes(sectionHeaderEntrySize()));
                    KaitaiStream _io__raw_sectionHeaders = new ByteBufferKaitaiStream(_raw_sectionHeaders.get(_raw_sectionHeaders.size() - 1));
                    this.sectionHeaders.add(new SectionHeader(_io__raw_sectionHeaders, this, _root, _is_le));
                }
            } else {
                this._raw_sectionHeaders = new ArrayList<byte[]>();
                this.sectionHeaders = new ArrayList<SectionHeader>();
                for (int i = 0; i < qtySectionHeader(); i++) {
                    this._raw_sectionHeaders.add(this._io.readBytes(sectionHeaderEntrySize()));
                    KaitaiStream _io__raw_sectionHeaders = new ByteBufferKaitaiStream(_raw_sectionHeaders.get(_raw_sectionHeaders.size() - 1));
                    this.sectionHeaders.add(new SectionHeader(_io__raw_sectionHeaders, this, _root, _is_le));
                }
            }
            this._io.seek(_pos);
            return this.sectionHeaders;
        }
        private StringsStruct sectionNames;
        public StringsStruct sectionNames() {
            if (this.sectionNames != null)
                return this.sectionNames;
            if ( ((sectionNamesIdx() != Elf.SectionHeaderIdxSpecial.UNDEFINED.id()) && (sectionNamesIdx() < _root().header().qtySectionHeader())) ) {
                long _pos = this._io.pos();
                this._io.seek(sectionHeaders().get((int) sectionNamesIdx()).ofsBody());
                if (_is_le) {
                    this._raw_sectionNames = this._io.readBytes(sectionHeaders().get((int) sectionNamesIdx()).lenBody());
                    KaitaiStream _io__raw_sectionNames = new ByteBufferKaitaiStream(_raw_sectionNames);
                    this.sectionNames = new StringsStruct(_io__raw_sectionNames, this, _root, _is_le);
                } else {
                    this._raw_sectionNames = this._io.readBytes(sectionHeaders().get((int) sectionNamesIdx()).lenBody());
                    KaitaiStream _io__raw_sectionNames = new ByteBufferKaitaiStream(_raw_sectionNames);
                    this.sectionNames = new StringsStruct(_io__raw_sectionNames, this, _root, _is_le);
                }
                this._io.seek(_pos);
            }
            return this.sectionNames;
        }
        private ObjType eType;
        private Machine machine;
        private long eVersion;
        private Long entryPoint;
        private Long programHeaderOffset;
        private Long sectionHeaderOffset;
        private byte[] flags;
        private int eEhsize;
        private int programHeaderEntrySize;
        private int qtyProgramHeader;
        private int sectionHeaderEntrySize;
        private int qtySectionHeader;
        private int sectionNamesIdx;
        private Elf _root;
        private Elf _parent;
        private ArrayList<byte[]> _raw_programHeaders;
        private ArrayList<byte[]> _raw_sectionHeaders;
        private byte[] _raw_sectionNames;
        public ObjType eType() { return eType; }
        public Machine machine() { return machine; }
        public long eVersion() { return eVersion; }
        public Long entryPoint() { return entryPoint; }
        public Long programHeaderOffset() { return programHeaderOffset; }
        public Long sectionHeaderOffset() { return sectionHeaderOffset; }
        public byte[] flags() { return flags; }
        public int eEhsize() { return eEhsize; }
        public int programHeaderEntrySize() { return programHeaderEntrySize; }
        public int qtyProgramHeader() { return qtyProgramHeader; }
        public int sectionHeaderEntrySize() { return sectionHeaderEntrySize; }
        public int qtySectionHeader() { return qtySectionHeader; }
        public int sectionNamesIdx() { return sectionNamesIdx; }
        public Elf _root() { return _root; }
        public Elf _parent() { return _parent; }
        public ArrayList<byte[]> _raw_programHeaders() { return _raw_programHeaders; }
        public ArrayList<byte[]> _raw_sectionHeaders() { return _raw_sectionHeaders; }
        public byte[] _raw_sectionNames() { return _raw_sectionNames; }
    }
    public static class DtFlag1Values extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
        }
        private Boolean singleton;

        /**
         * Singleton symbols are used.
         */
        public Boolean singleton() {
            if (this.singleton != null)
                return this.singleton;
            boolean _tmp = (boolean) ((value() & 33554432) != 0);
            this.singleton = _tmp;
            return this.singleton;
        }
        private Boolean ignmuldef;
        public Boolean ignmuldef() {
            if (this.ignmuldef != null)
                return this.ignmuldef;
            boolean _tmp = (boolean) ((value() & 262144) != 0);
            this.ignmuldef = _tmp;
            return this.ignmuldef;
        }
        private Boolean loadfltr;

        /**
         * Trigger filtee loading at runtime.
         */
        public Boolean loadfltr() {
            if (this.loadfltr != null)
                return this.loadfltr;
            boolean _tmp = (boolean) ((value() & 16) != 0);
            this.loadfltr = _tmp;
            return this.loadfltr;
        }
        private Boolean initfirst;

        /**
         * Set RTLD_INITFIRST for this object
         */
        public Boolean initfirst() {
            if (this.initfirst != null)
                return this.initfirst;
            boolean _tmp = (boolean) ((value() & 32) != 0);
            this.initfirst = _tmp;
            return this.initfirst;
        }
        private Boolean symintpose;

        /**
         * Object has individual interposers.
         */
        public Boolean symintpose() {
            if (this.symintpose != null)
                return this.symintpose;
            boolean _tmp = (boolean) ((value() & 8388608) != 0);
            this.symintpose = _tmp;
            return this.symintpose;
        }
        private Boolean noreloc;
        public Boolean noreloc() {
            if (this.noreloc != null)
                return this.noreloc;
            boolean _tmp = (boolean) ((value() & 4194304) != 0);
            this.noreloc = _tmp;
            return this.noreloc;
        }
        private Boolean confalt;

        /**
         * Configuration alternative created.
         */
        public Boolean confalt() {
            if (this.confalt != null)
                return this.confalt;
            boolean _tmp = (boolean) ((value() & 8192) != 0);
            this.confalt = _tmp;
            return this.confalt;
        }
        private Boolean dispreldne;

        /**
         * Disp reloc applied at build time.
         */
        public Boolean dispreldne() {
            if (this.dispreldne != null)
                return this.dispreldne;
            boolean _tmp = (boolean) ((value() & 32768) != 0);
            this.dispreldne = _tmp;
            return this.dispreldne;
        }
        private Boolean rtldGlobal;

        /**
         * Set RTLD_GLOBAL for this object.
         */
        public Boolean rtldGlobal() {
            if (this.rtldGlobal != null)
                return this.rtldGlobal;
            boolean _tmp = (boolean) ((value() & 2) != 0);
            this.rtldGlobal = _tmp;
            return this.rtldGlobal;
        }
        private Boolean nodelete;

        /**
         * Set RTLD_NODELETE for this object.
         */
        public Boolean nodelete() {
            if (this.nodelete != null)
                return this.nodelete;
            boolean _tmp = (boolean) ((value() & 8) != 0);
            this.nodelete = _tmp;
            return this.nodelete;
        }
        private Boolean trans;
        public Boolean trans() {
            if (this.trans != null)
                return this.trans;
            boolean _tmp = (boolean) ((value() & 512) != 0);
            this.trans = _tmp;
            return this.trans;
        }
        private Boolean origin;

        /**
         * $ORIGIN must be handled.
         */
        public Boolean origin() {
            if (this.origin != null)
                return this.origin;
            boolean _tmp = (boolean) ((value() & 128) != 0);
            this.origin = _tmp;
            return this.origin;
        }
        private Boolean now;

        /**
         * Set RTLD_NOW for this object.
         */
        public Boolean now() {
            if (this.now != null)
                return this.now;
            boolean _tmp = (boolean) ((value() & 1) != 0);
            this.now = _tmp;
            return this.now;
        }
        private Boolean nohdr;
        public Boolean nohdr() {
            if (this.nohdr != null)
                return this.nohdr;
            boolean _tmp = (boolean) ((value() & 1048576) != 0);
            this.nohdr = _tmp;
            return this.nohdr;
        }
        private Boolean endfiltee;

        /**
         * Filtee terminates filters search.
         */
        public Boolean endfiltee() {
            if (this.endfiltee != null)
                return this.endfiltee;
            boolean _tmp = (boolean) ((value() & 16384) != 0);
            this.endfiltee = _tmp;
            return this.endfiltee;
        }
        private Boolean nodirect;

        /**
         * Object has no-direct binding.
         */
        public Boolean nodirect() {
            if (this.nodirect != null)
                return this.nodirect;
            boolean _tmp = (boolean) ((value() & 131072) != 0);
            this.nodirect = _tmp;
            return this.nodirect;
        }
        private Boolean globaudit;

        /**
         * Global auditing required.
         */
        public Boolean globaudit() {
            if (this.globaudit != null)
                return this.globaudit;
            boolean _tmp = (boolean) ((value() & 16777216) != 0);
            this.globaudit = _tmp;
            return this.globaudit;
        }
        private Boolean noksyms;
        public Boolean noksyms() {
            if (this.noksyms != null)
                return this.noksyms;
            boolean _tmp = (boolean) ((value() & 524288) != 0);
            this.noksyms = _tmp;
            return this.noksyms;
        }
        private Boolean interpose;

        /**
         * Object is used to interpose.
         */
        public Boolean interpose() {
            if (this.interpose != null)
                return this.interpose;
            boolean _tmp = (boolean) ((value() & 1024) != 0);
            this.interpose = _tmp;
            return this.interpose;
        }
        private Boolean nodump;

        /**
         * Object can't be dldump'ed.
         */
        public Boolean nodump() {
            if (this.nodump != null)
                return this.nodump;
            boolean _tmp = (boolean) ((value() & 4096) != 0);
            this.nodump = _tmp;
            return this.nodump;
        }
        private Boolean disprelpnd;

        /**
         * Disp reloc applied at run-time.
         */
        public Boolean disprelpnd() {
            if (this.disprelpnd != null)
                return this.disprelpnd;
            boolean _tmp = (boolean) ((value() & 65536) != 0);
            this.disprelpnd = _tmp;
            return this.disprelpnd;
        }
        private Boolean noopen;

        /**
         * Set RTLD_NOOPEN for this object.
         */
        public Boolean noopen() {
            if (this.noopen != null)
                return this.noopen;
            boolean _tmp = (boolean) ((value() & 64) != 0);
            this.noopen = _tmp;
            return this.noopen;
        }
        private Boolean stub;
        public Boolean stub() {
            if (this.stub != null)
                return this.stub;
            boolean _tmp = (boolean) ((value() & 67108864) != 0);
            this.stub = _tmp;
            return this.stub;
        }
        private Boolean direct;

        /**
         * Direct binding enabled.
         */
        public Boolean direct() {
            if (this.direct != null)
                return this.direct;
            boolean _tmp = (boolean) ((value() & 256) != 0);
            this.direct = _tmp;
            return this.direct;
        }
        private Boolean edited;

        /**
         * Object is modified after built.
         */
        public Boolean edited() {
            if (this.edited != null)
                return this.edited;
            boolean _tmp = (boolean) ((value() & 2097152) != 0);
            this.edited = _tmp;
            return this.edited;
        }
        private Boolean group;

        /**
         * Set RTLD_GROUP for this object.
         */
        public Boolean group() {
            if (this.group != null)
                return this.group;
            boolean _tmp = (boolean) ((value() & 4) != 0);
            this.group = _tmp;
            return this.group;
        }
        private Boolean pie;
        public Boolean pie() {
            if (this.pie != null)
                return this.pie;
            boolean _tmp = (boolean) ((value() & 134217728) != 0);
            this.pie = _tmp;
            return this.pie;
        }
        private Boolean nodeflib;

        /**
         * Ignore default lib search path.
         */
        public Boolean nodeflib() {
            if (this.nodeflib != null)
                return this.nodeflib;
            boolean _tmp = (boolean) ((value() & 2048) != 0);
            this.nodeflib = _tmp;
            return this.nodeflib;
        }
        private long value;
        private Elf _root;
        private Elf.EndianElf.DynamicSectionEntry _parent;
        public long value() { return value; }
        public Elf _root() { return _root; }
        public Elf.EndianElf.DynamicSectionEntry _parent() { return _parent; }
    }
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
        private Boolean merge;

        /**
         * might be merged
         */
        public Boolean merge() {
            if (this.merge != null)
                return this.merge;
            boolean _tmp = (boolean) ((value() & 16) != 0);
            this.merge = _tmp;
            return this.merge;
        }
        private Boolean maskOs;

        /**
         * OS-specific
         */
        public Boolean maskOs() {
            if (this.maskOs != null)
                return this.maskOs;
            boolean _tmp = (boolean) ((value() & 267386880) != 0);
            this.maskOs = _tmp;
            return this.maskOs;
        }
        private Boolean exclude;

        /**
         * section is excluded unless referenced or allocated (Solaris)
         */
        public Boolean exclude() {
            if (this.exclude != null)
                return this.exclude;
            boolean _tmp = (boolean) ((value() & 134217728) != 0);
            this.exclude = _tmp;
            return this.exclude;
        }
        private Boolean maskProc;

        /**
         * Processor-specific
         */
        public Boolean maskProc() {
            if (this.maskProc != null)
                return this.maskProc;
            boolean _tmp = (boolean) ((value() & 4026531840L) != 0);
            this.maskProc = _tmp;
            return this.maskProc;
        }
        private Boolean strings;

        /**
         * contains nul-terminated strings
         */
        public Boolean strings() {
            if (this.strings != null)
                return this.strings;
            boolean _tmp = (boolean) ((value() & 32) != 0);
            this.strings = _tmp;
            return this.strings;
        }
        private Boolean osNonConforming;

        /**
         * non-standard OS specific handling required
         */
        public Boolean osNonConforming() {
            if (this.osNonConforming != null)
                return this.osNonConforming;
            boolean _tmp = (boolean) ((value() & 256) != 0);
            this.osNonConforming = _tmp;
            return this.osNonConforming;
        }
        private Boolean alloc;

        /**
         * occupies memory during execution
         */
        public Boolean alloc() {
            if (this.alloc != null)
                return this.alloc;
            boolean _tmp = (boolean) ((value() & 2) != 0);
            this.alloc = _tmp;
            return this.alloc;
        }
        private Boolean execInstr;

        /**
         * executable
         */
        public Boolean execInstr() {
            if (this.execInstr != null)
                return this.execInstr;
            boolean _tmp = (boolean) ((value() & 4) != 0);
            this.execInstr = _tmp;
            return this.execInstr;
        }
        private Boolean infoLink;

        /**
         * 'sh_info' contains SHT index
         */
        public Boolean infoLink() {
            if (this.infoLink != null)
                return this.infoLink;
            boolean _tmp = (boolean) ((value() & 64) != 0);
            this.infoLink = _tmp;
            return this.infoLink;
        }
        private Boolean write;

        /**
         * writable
         */
        public Boolean write() {
            if (this.write != null)
                return this.write;
            boolean _tmp = (boolean) ((value() & 1) != 0);
            this.write = _tmp;
            return this.write;
        }
        private Boolean linkOrder;

        /**
         * preserve order after combining
         */
        public Boolean linkOrder() {
            if (this.linkOrder != null)
                return this.linkOrder;
            boolean _tmp = (boolean) ((value() & 128) != 0);
            this.linkOrder = _tmp;
            return this.linkOrder;
        }
        private Boolean ordered;

        /**
         * special ordering requirement (Solaris)
         */
        public Boolean ordered() {
            if (this.ordered != null)
                return this.ordered;
            boolean _tmp = (boolean) ((value() & 67108864) != 0);
            this.ordered = _tmp;
            return this.ordered;
        }
        private Boolean tls;

        /**
         * section hold thread-local data
         */
        public Boolean tls() {
            if (this.tls != null)
                return this.tls;
            boolean _tmp = (boolean) ((value() & 1024) != 0);
            this.tls = _tmp;
            return this.tls;
        }
        private Boolean group;

        /**
         * section is member of a group
         */
        public Boolean group() {
            if (this.group != null)
                return this.group;
            boolean _tmp = (boolean) ((value() & 512) != 0);
            this.group = _tmp;
            return this.group;
        }
        private long value;
        private Elf _root;
        private Elf.EndianElf.SectionHeader _parent;
        public long value() { return value; }
        public Elf _root() { return _root; }
        public Elf.EndianElf.SectionHeader _parent() { return _parent; }
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
        private Boolean read;
        public Boolean read() {
            if (this.read != null)
                return this.read;
            boolean _tmp = (boolean) ((value() & 4) != 0);
            this.read = _tmp;
            return this.read;
        }
        private Boolean write;
        public Boolean write() {
            if (this.write != null)
                return this.write;
            boolean _tmp = (boolean) ((value() & 2) != 0);
            this.write = _tmp;
            return this.write;
        }
        private Boolean execute;
        public Boolean execute() {
            if (this.execute != null)
                return this.execute;
            boolean _tmp = (boolean) ((value() & 1) != 0);
            this.execute = _tmp;
            return this.execute;
        }
        private Boolean maskProc;
        public Boolean maskProc() {
            if (this.maskProc != null)
                return this.maskProc;
            boolean _tmp = (boolean) ((value() & 4026531840L) != 0);
            this.maskProc = _tmp;
            return this.maskProc;
        }
        private long value;
        private Elf _root;
        private Elf.EndianElf.ProgramHeader _parent;
        public long value() { return value; }
        public Elf _root() { return _root; }
        public Elf.EndianElf.ProgramHeader _parent() { return _parent; }
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

        public DtFlagValues(KaitaiStream _io, Elf.EndianElf.DynamicSectionEntry _parent, long value) {
            this(_io, _parent, null, value);
        }

        public DtFlagValues(KaitaiStream _io, Elf.EndianElf.DynamicSectionEntry _parent, Elf _root, long value) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.value = value;
            _read();
        }
        private void _read() {
        }
        private Boolean bindNow;

        /**
         * all relocations for this object must be processed before returning
         * control to the program
         */
        public Boolean bindNow() {
            if (this.bindNow != null)
                return this.bindNow;
            boolean _tmp = (boolean) ((value() & 8) != 0);
            this.bindNow = _tmp;
            return this.bindNow;
        }
        private Boolean origin;

        /**
         * object may reference the $ORIGIN substitution string
         */
        public Boolean origin() {
            if (this.origin != null)
                return this.origin;
            boolean _tmp = (boolean) ((value() & 1) != 0);
            this.origin = _tmp;
            return this.origin;
        }
        private Boolean textrel;

        /**
         * relocation entries might request modifications to a non-writable segment
         */
        public Boolean textrel() {
            if (this.textrel != null)
                return this.textrel;
            boolean _tmp = (boolean) ((value() & 4) != 0);
            this.textrel = _tmp;
            return this.textrel;
        }
        private Boolean staticTls;

        /**
         * object uses static thread-local storage scheme
         */
        public Boolean staticTls() {
            if (this.staticTls != null)
                return this.staticTls;
            boolean _tmp = (boolean) ((value() & 16) != 0);
            this.staticTls = _tmp;
            return this.staticTls;
        }
        private Boolean symbolic;

        /**
         * symbolic linking
         */
        public Boolean symbolic() {
            if (this.symbolic != null)
                return this.symbolic;
            boolean _tmp = (boolean) ((value() & 2) != 0);
            this.symbolic = _tmp;
            return this.symbolic;
        }
        private long value;
        private Elf _root;
        private Elf.EndianElf.DynamicSectionEntry _parent;
        public long value() { return value; }
        public Elf _root() { return _root; }
        public Elf.EndianElf.DynamicSectionEntry _parent() { return _parent; }
    }
    private Integer shIdxLoOs;
    public Integer shIdxLoOs() {
        if (this.shIdxLoOs != null)
            return this.shIdxLoOs;
        int _tmp = (int) (65312);
        this.shIdxLoOs = _tmp;
        return this.shIdxLoOs;
    }
    private Integer shIdxLoReserved;
    public Integer shIdxLoReserved() {
        if (this.shIdxLoReserved != null)
            return this.shIdxLoReserved;
        int _tmp = (int) (65280);
        this.shIdxLoReserved = _tmp;
        return this.shIdxLoReserved;
    }
    private Integer shIdxHiProc;
    public Integer shIdxHiProc() {
        if (this.shIdxHiProc != null)
            return this.shIdxHiProc;
        int _tmp = (int) (65311);
        this.shIdxHiProc = _tmp;
        return this.shIdxHiProc;
    }
    private Integer shIdxLoProc;
    public Integer shIdxLoProc() {
        if (this.shIdxLoProc != null)
            return this.shIdxLoProc;
        int _tmp = (int) (65280);
        this.shIdxLoProc = _tmp;
        return this.shIdxLoProc;
    }
    private Integer shIdxHiOs;
    public Integer shIdxHiOs() {
        if (this.shIdxHiOs != null)
            return this.shIdxHiOs;
        int _tmp = (int) (65343);
        this.shIdxHiOs = _tmp;
        return this.shIdxHiOs;
    }
    private Integer shIdxHiReserved;
    public Integer shIdxHiReserved() {
        if (this.shIdxHiReserved != null)
            return this.shIdxHiReserved;
        int _tmp = (int) (65535);
        this.shIdxHiReserved = _tmp;
        return this.shIdxHiReserved;
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
