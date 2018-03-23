// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * @see <a href="https://github.com/lattera/glibc/blob/master/elf/elf.h">Source</a>
 */
public class Elf extends KaitaiStruct {
    public static Elf fromFile(String fileName) throws IOException {
        return new Elf(new ByteBufferKaitaiStream(fileName));
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
        AMD64_UNWIND(1879048193);

        private final long id;
        ShType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ShType> byId = new HashMap<Long, ShType>(36);
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
        NOT_SET(0),
        SPARC(2),
        X86(3),
        MIPS(8),
        POWERPC(20),
        ARM(40),
        SUPERH(42),
        IA_64(50),
        X86_64(62),
        AARCH64(183);

        private final long id;
        Machine(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Machine> byId = new HashMap<Long, Machine>(10);
        static {
            for (Machine e : Machine.values())
                byId.put(e.id(), e);
        }
        public static Machine byId(long id) { return byId.get(id); }
    }

    public enum PhdrType {
        READ(1),
        WRITE(2),
        EXECUTE(4),
        MASK_PROC(4026531840);

        private final long id;
        PhdrType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PhdrType> byId = new HashMap<Long, PhdrType>(4);
        static {
            for (PhdrType e : PhdrType.values())
                byId.put(e.id(), e);
        }
        public static PhdrType byId(long id) { return byId.get(id); }
    }

    public enum SectionHeaderFlags {
        WRITE(1),
        ALLOC(2),
        EXEC_INSTR(4),
        MERGE(16),
        STRINGS(32),
        INFO_LINK(64),
        LINK_ORDER(128),
        OS_NON_CONFORMING(256),
        GROUP(512),
        TLS(1024),
        ORDERED(67108864),
        EXCLUDE(134217728),
        MASK_PROC(4026531840);

        private final long id;
        SectionHeaderFlags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SectionHeaderFlags> byId = new HashMap<Long, SectionHeaderFlags>(13);
        static {
            for (SectionHeaderFlags e : SectionHeaderFlags.values())
                byId.put(e.id(), e);
        }
        public static SectionHeaderFlags byId(long id) { return byId.get(id); }
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
        MAXPOSTAGS(34),
        SUNW_AUXILIARY(1610612749),
        SUNW_FILTER(1610612750),
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
        SUNW_CAPCHAINENT(1610612765),
        SUNW_CAPCHAINSZ(1610612767),
        HIOS(1879044096),
        VALRNGLO(1879047424),
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
        VALRNGHI(1879047679),
        ADDRRNGLO(1879047680),
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
        ADDRRNGHI(1879047935),
        VERSYM(1879048176),
        RELACOUNT(1879048185),
        RELCOUNT(1879048186),
        FLAGS_1(1879048187),
        VERDEF(1879048188),
        VERDEFNUM(1879048189),
        VERNEED(1879048190),
        VERNEEDNUM(1879048191),
        LOPROC(1879048192),
        SPARC_REGISTER(1879048193),
        AUXILIARY(2147483645),
        USED(2147483646),
        HIPROC(2147483647);

        private final long id;
        DynamicArrayTags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DynamicArrayTags> byId = new HashMap<Long, DynamicArrayTags>(88);
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
        PAX_FLAGS(1694766464),
        HIOS(1879048191);

        private final long id;
        PhType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PhType> byId = new HashMap<Long, PhType>(13);
        static {
            for (PhType e : PhType.values())
                byId.put(e.id(), e);
        }
        public static PhType byId(long id) { return byId.get(id); }
    }

    public enum ObjType {
        RELOCATABLE(1),
        EXECUTABLE(2),
        SHARED(3),
        CORE(4);

        private final long id;
        ObjType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ObjType> byId = new HashMap<Long, ObjType>(4);
        static {
            for (ObjType e : ObjType.values())
                byId.put(e.id(), e);
        }
        public static ObjType byId(long id) { return byId.get(id); }
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
        this.magic = this._io.ensureFixedContents(new byte[] { 127, 69, 76, 70 });
        this.bits = Bits.byId(this._io.readU1());
        this.endian = Endian.byId(this._io.readU1());
        this.eiVersion = this._io.readU1();
        this.abi = OsAbi.byId(this._io.readU1());
        this.abiVersion = this._io.readU1();
        this.pad = this._io.readBytes(7);
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
            switch (_root.endian()) {
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
            switch (_root.bits()) {
            case B32: {
                this.entryPoint = (long) (this._io.readU4le());
                break;
            }
            case B64: {
                this.entryPoint = this._io.readU8le();
                break;
            }
            }
            switch (_root.bits()) {
            case B32: {
                this.programHeaderOffset = (long) (this._io.readU4le());
                break;
            }
            case B64: {
                this.programHeaderOffset = this._io.readU8le();
                break;
            }
            }
            switch (_root.bits()) {
            case B32: {
                this.sectionHeaderOffset = (long) (this._io.readU4le());
                break;
            }
            case B64: {
                this.sectionHeaderOffset = this._io.readU8le();
                break;
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
            switch (_root.bits()) {
            case B32: {
                this.entryPoint = (long) (this._io.readU4be());
                break;
            }
            case B64: {
                this.entryPoint = this._io.readU8be();
                break;
            }
            }
            switch (_root.bits()) {
            case B32: {
                this.programHeaderOffset = (long) (this._io.readU4be());
                break;
            }
            case B64: {
                this.programHeaderOffset = this._io.readU8be();
                break;
            }
            }
            switch (_root.bits()) {
            case B32: {
                this.sectionHeaderOffset = (long) (this._io.readU4be());
                break;
            }
            case B64: {
                this.sectionHeaderOffset = this._io.readU8be();
                break;
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
                if (_root.bits() == Elf.Bits.B64) {
                    this.flags64 = Elf.PhdrType.byId(this._io.readU4le());
                }
                switch (_root.bits()) {
                case B32: {
                    this.offset = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.offset = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.vaddr = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.vaddr = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.paddr = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.paddr = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.filesz = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.filesz = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.memsz = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.memsz = this._io.readU8le();
                    break;
                }
                }
                if (_root.bits() == Elf.Bits.B32) {
                    this.flags32 = this._io.readU4le();
                }
                switch (_root.bits()) {
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
            private void _readBE() {
                this.type = Elf.PhType.byId(this._io.readU4be());
                if (_root.bits() == Elf.Bits.B64) {
                    this.flags64 = Elf.PhdrType.byId(this._io.readU4be());
                }
                switch (_root.bits()) {
                case B32: {
                    this.offset = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.offset = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.vaddr = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.vaddr = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.paddr = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.paddr = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.filesz = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.filesz = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.memsz = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.memsz = this._io.readU8be();
                    break;
                }
                }
                if (_root.bits() == Elf.Bits.B32) {
                    this.flags32 = this._io.readU4be();
                }
                switch (_root.bits()) {
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
            private DynamicSection dynamic;
            public DynamicSection dynamic() {
                if (this.dynamic != null)
                    return this.dynamic;
                if (type() == Elf.PhType.DYNAMIC) {
                    KaitaiStream io = _root._io();
                    long _pos = io.pos();
                    io.seek(offset());
                    if (_is_le) {
                        this._raw_dynamic = io.readBytes(filesz());
                        KaitaiStream _io__raw_dynamic = new ByteBufferKaitaiStream(_raw_dynamic);
                        this.dynamic = new DynamicSection(_io__raw_dynamic, this, _root, _is_le);
                    } else {
                        this._raw_dynamic = io.readBytes(filesz());
                        KaitaiStream _io__raw_dynamic = new ByteBufferKaitaiStream(_raw_dynamic);
                        this.dynamic = new DynamicSection(_io__raw_dynamic, this, _root, _is_le);
                    }
                    io.seek(_pos);
                }
                return this.dynamic;
            }
            private PhType type;
            private PhdrType flags64;
            private Long offset;
            private Long vaddr;
            private Long paddr;
            private Long filesz;
            private Long memsz;
            private Long flags32;
            private Long align;
            private Elf _root;
            private Elf.EndianElf _parent;
            private byte[] _raw_dynamic;
            public PhType type() { return type; }
            public PhdrType flags64() { return flags64; }
            public Long offset() { return offset; }
            public Long vaddr() { return vaddr; }
            public Long paddr() { return paddr; }
            public Long filesz() { return filesz; }
            public Long memsz() { return memsz; }
            public Long flags32() { return flags32; }
            public Long align() { return align; }
            public Elf _root() { return _root; }
            public Elf.EndianElf _parent() { return _parent; }
            public byte[] _raw_dynamic() { return _raw_dynamic; }
        }
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
                switch (_root.bits()) {
                case B32: {
                    this.tag = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.tag = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
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
            private void _readBE() {
                switch (_root.bits()) {
                case B32: {
                    this.tag = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.tag = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
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
                this.nameOffset = this._io.readU4le();
                this.type = Elf.ShType.byId(this._io.readU4le());
                switch (_root.bits()) {
                case B32: {
                    this.flags = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.flags = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.addr = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.addr = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.offset = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.offset = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.size = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.size = this._io.readU8le();
                    break;
                }
                }
                this.linkedSectionIdx = this._io.readU4le();
                this.info = this._io.readBytes(4);
                switch (_root.bits()) {
                case B32: {
                    this.align = (long) (this._io.readU4le());
                    break;
                }
                case B64: {
                    this.align = this._io.readU8le();
                    break;
                }
                }
                switch (_root.bits()) {
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
            private void _readBE() {
                this.nameOffset = this._io.readU4be();
                this.type = Elf.ShType.byId(this._io.readU4be());
                switch (_root.bits()) {
                case B32: {
                    this.flags = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.flags = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.addr = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.addr = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.offset = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.offset = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
                case B32: {
                    this.size = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.size = this._io.readU8be();
                    break;
                }
                }
                this.linkedSectionIdx = this._io.readU4be();
                this.info = this._io.readBytes(4);
                switch (_root.bits()) {
                case B32: {
                    this.align = (long) (this._io.readU4be());
                    break;
                }
                case B64: {
                    this.align = this._io.readU8be();
                    break;
                }
                }
                switch (_root.bits()) {
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
            private SectionHeaderFlags flagsEnum;
            public SectionHeaderFlags flagsEnum() {
                if (this.flagsEnum != null)
                    return this.flagsEnum;
                this.flagsEnum = Elf.SectionHeaderFlags.byId(flags());
                return this.flagsEnum;
            }
            private byte[] body;
            public byte[] body() {
                if (this.body != null)
                    return this.body;
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek(offset());
                if (_is_le) {
                    this.body = io.readBytes(size());
                } else {
                    this.body = io.readBytes(size());
                }
                io.seek(_pos);
                return this.body;
            }
            private StringsStruct strtab;
            public StringsStruct strtab() {
                if (this.strtab != null)
                    return this.strtab;
                if (type() == Elf.ShType.STRTAB) {
                    KaitaiStream io = _root._io();
                    long _pos = io.pos();
                    io.seek(offset());
                    if (_is_le) {
                        this._raw_strtab = io.readBytes(size());
                        KaitaiStream _io__raw_strtab = new ByteBufferKaitaiStream(_raw_strtab);
                        this.strtab = new StringsStruct(_io__raw_strtab, this, _root, _is_le);
                    } else {
                        this._raw_strtab = io.readBytes(size());
                        KaitaiStream _io__raw_strtab = new ByteBufferKaitaiStream(_raw_strtab);
                        this.strtab = new StringsStruct(_io__raw_strtab, this, _root, _is_le);
                    }
                    io.seek(_pos);
                }
                return this.strtab;
            }
            private String name;
            public String name() {
                if (this.name != null)
                    return this.name;
                KaitaiStream io = _root.header().strings()._io();
                long _pos = io.pos();
                io.seek(nameOffset());
                if (_is_le) {
                    this.name = new String(io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
                } else {
                    this.name = new String(io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
                }
                io.seek(_pos);
                return this.name;
            }
            private DynamicSection dynamic;
            public DynamicSection dynamic() {
                if (this.dynamic != null)
                    return this.dynamic;
                if (type() == Elf.ShType.DYNAMIC) {
                    KaitaiStream io = _root._io();
                    long _pos = io.pos();
                    io.seek(offset());
                    if (_is_le) {
                        this._raw_dynamic = io.readBytes(size());
                        KaitaiStream _io__raw_dynamic = new ByteBufferKaitaiStream(_raw_dynamic);
                        this.dynamic = new DynamicSection(_io__raw_dynamic, this, _root, _is_le);
                    } else {
                        this._raw_dynamic = io.readBytes(size());
                        KaitaiStream _io__raw_dynamic = new ByteBufferKaitaiStream(_raw_dynamic);
                        this.dynamic = new DynamicSection(_io__raw_dynamic, this, _root, _is_le);
                    }
                    io.seek(_pos);
                }
                return this.dynamic;
            }
            private long nameOffset;
            private ShType type;
            private Long flags;
            private Long addr;
            private Long offset;
            private Long size;
            private long linkedSectionIdx;
            private byte[] info;
            private Long align;
            private Long entrySize;
            private Elf _root;
            private Elf.EndianElf _parent;
            private byte[] _raw_strtab;
            private byte[] _raw_dynamic;
            public long nameOffset() { return nameOffset; }
            public ShType type() { return type; }
            public Long flags() { return flags; }
            public Long addr() { return addr; }
            public Long offset() { return offset; }
            public Long size() { return size; }
            public long linkedSectionIdx() { return linkedSectionIdx; }
            public byte[] info() { return info; }
            public Long align() { return align; }
            public Long entrySize() { return entrySize; }
            public Elf _root() { return _root; }
            public Elf.EndianElf _parent() { return _parent; }
            public byte[] _raw_strtab() { return _raw_strtab; }
            public byte[] _raw_dynamic() { return _raw_dynamic; }
        }
        public static class DynamicSection extends KaitaiStruct {
            private Boolean _is_le;

            public DynamicSection(KaitaiStream _io, KaitaiStruct _parent, Elf _root, boolean _is_le) {
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
            private ArrayList<DynamicSectionEntry> entries;
            private Elf _root;
            private KaitaiStruct _parent;
            public ArrayList<DynamicSectionEntry> entries() { return entries; }
            public Elf _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
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
                        this.entries.add(new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII")));
                        i++;
                    }
                }
            }
            private void _readBE() {
                this.entries = new ArrayList<String>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.entries.add(new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII")));
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
                this._raw_programHeaders = new ArrayList<byte[]>((int) (qtyProgramHeader()));
                programHeaders = new ArrayList<ProgramHeader>((int) (qtyProgramHeader()));
                for (int i = 0; i < qtyProgramHeader(); i++) {
                    this._raw_programHeaders.add(this._io.readBytes(programHeaderEntrySize()));
                    KaitaiStream _io__raw_programHeaders = new ByteBufferKaitaiStream(_raw_programHeaders.get(_raw_programHeaders.size() - 1));
                    this.programHeaders.add(new ProgramHeader(_io__raw_programHeaders, this, _root, _is_le));
                }
            } else {
                this._raw_programHeaders = new ArrayList<byte[]>((int) (qtyProgramHeader()));
                programHeaders = new ArrayList<ProgramHeader>((int) (qtyProgramHeader()));
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
                this._raw_sectionHeaders = new ArrayList<byte[]>((int) (qtySectionHeader()));
                sectionHeaders = new ArrayList<SectionHeader>((int) (qtySectionHeader()));
                for (int i = 0; i < qtySectionHeader(); i++) {
                    this._raw_sectionHeaders.add(this._io.readBytes(sectionHeaderEntrySize()));
                    KaitaiStream _io__raw_sectionHeaders = new ByteBufferKaitaiStream(_raw_sectionHeaders.get(_raw_sectionHeaders.size() - 1));
                    this.sectionHeaders.add(new SectionHeader(_io__raw_sectionHeaders, this, _root, _is_le));
                }
            } else {
                this._raw_sectionHeaders = new ArrayList<byte[]>((int) (qtySectionHeader()));
                sectionHeaders = new ArrayList<SectionHeader>((int) (qtySectionHeader()));
                for (int i = 0; i < qtySectionHeader(); i++) {
                    this._raw_sectionHeaders.add(this._io.readBytes(sectionHeaderEntrySize()));
                    KaitaiStream _io__raw_sectionHeaders = new ByteBufferKaitaiStream(_raw_sectionHeaders.get(_raw_sectionHeaders.size() - 1));
                    this.sectionHeaders.add(new SectionHeader(_io__raw_sectionHeaders, this, _root, _is_le));
                }
            }
            this._io.seek(_pos);
            return this.sectionHeaders;
        }
        private StringsStruct strings;
        public StringsStruct strings() {
            if (this.strings != null)
                return this.strings;
            long _pos = this._io.pos();
            this._io.seek(sectionHeaders().get((int) sectionNamesIdx()).offset());
            if (_is_le) {
                this._raw_strings = this._io.readBytes(sectionHeaders().get((int) sectionNamesIdx()).size());
                KaitaiStream _io__raw_strings = new ByteBufferKaitaiStream(_raw_strings);
                this.strings = new StringsStruct(_io__raw_strings, this, _root, _is_le);
            } else {
                this._raw_strings = this._io.readBytes(sectionHeaders().get((int) sectionNamesIdx()).size());
                KaitaiStream _io__raw_strings = new ByteBufferKaitaiStream(_raw_strings);
                this.strings = new StringsStruct(_io__raw_strings, this, _root, _is_le);
            }
            this._io.seek(_pos);
            return this.strings;
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
        private byte[] _raw_strings;
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
        public byte[] _raw_strings() { return _raw_strings; }
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
