// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.List;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


/**
 * @see <a href="https://www.stonedcoder.org/~kd/lib/MachORuntime.pdf">Source</a>
 * @see <a href="https://opensource.apple.com/source/python_modules/python_modules-43/Modules/macholib-1.5.1/macholib-1.5.1.tar.gz">Source</a>
 * @see <a href="https://github.com/comex/cs/blob/07a88f9/macho_cs.py">Source</a>
 * @see <a href="https://opensource.apple.com/source/Security/Security-55471/libsecurity_codesigning/requirements.grammar.auto.html">Source</a>
 * @see <a href="https://github.com/apple/darwin-xnu/blob/xnu-2782.40.9/bsd/sys/codesign.h">Source</a>
 * @see <a href="https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachO.cpp.auto.html">Source</a>
 * @see <a href="https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachOCompressed.cpp.auto.html">Source</a>
 */
public class MachO extends KaitaiStruct.ReadWrite {
    public static MachO fromFile(String fileName) throws IOException {
        return new MachO(new ByteBufferKaitaiStream(fileName));
    }

    public enum CpuType {
        VAX(1),
        ROMP(2),
        NS32032(4),
        NS32332(5),
        I386(7),
        MIPS(8),
        NS32532(9),
        HPPA(11),
        ARM(12),
        MC88000(13),
        SPARC(14),
        I860(15),
        I860_LITTLE(16),
        RS6000(17),
        POWERPC(18),
        ABI64(16777216),
        X86_64(16777223),
        ARM64(16777228),
        POWERPC64(16777234),
        ANY(4294967295L);

        private final long id;
        CpuType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CpuType> byId = new HashMap<Long, CpuType>(20);
        static {
            for (CpuType e : CpuType.values())
                byId.put(e.id(), e);
        }
        public static CpuType byId(long id) { return byId.get(id); }
    }

    public enum FileType {
        OBJECT(1),
        EXECUTE(2),
        FVMLIB(3),
        CORE(4),
        PRELOAD(5),
        DYLIB(6),
        DYLINKER(7),
        BUNDLE(8),
        DYLIB_STUB(9),
        DSYM(10),
        KEXT_BUNDLE(11);

        private final long id;
        FileType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, FileType> byId = new HashMap<Long, FileType>(11);
        static {
            for (FileType e : FileType.values())
                byId.put(e.id(), e);
        }
        public static FileType byId(long id) { return byId.get(id); }
    }

    public enum LoadCommandType {
        SEGMENT(1),
        SYMTAB(2),
        SYMSEG(3),
        THREAD(4),
        UNIX_THREAD(5),
        LOAD_FVM_LIB(6),
        ID_FVM_LIB(7),
        IDENT(8),
        FVM_FILE(9),
        PREPAGE(10),
        DYSYMTAB(11),
        LOAD_DYLIB(12),
        ID_DYLIB(13),
        LOAD_DYLINKER(14),
        ID_DYLINKER(15),
        PREBOUND_DYLIB(16),
        ROUTINES(17),
        SUB_FRAMEWORK(18),
        SUB_UMBRELLA(19),
        SUB_CLIENT(20),
        SUB_LIBRARY(21),
        TWOLEVEL_HINTS(22),
        PREBIND_CKSUM(23),
        SEGMENT_64(25),
        ROUTINES_64(26),
        UUID(27),
        CODE_SIGNATURE(29),
        SEGMENT_SPLIT_INFO(30),
        LAZY_LOAD_DYLIB(32),
        ENCRYPTION_INFO(33),
        DYLD_INFO(34),
        VERSION_MIN_MACOSX(36),
        VERSION_MIN_IPHONEOS(37),
        FUNCTION_STARTS(38),
        DYLD_ENVIRONMENT(39),
        DATA_IN_CODE(41),
        SOURCE_VERSION(42),
        DYLIB_CODE_SIGN_DRS(43),
        ENCRYPTION_INFO_64(44),
        LINKER_OPTION(45),
        LINKER_OPTIMIZATION_HINT(46),
        VERSION_MIN_TVOS(47),
        VERSION_MIN_WATCHOS(48),
        BUILD_VERSION(50),
        REQ_DYLD(2147483648L),
        LOAD_WEAK_DYLIB(2147483672L),
        RPATH(2147483676L),
        REEXPORT_DYLIB(2147483679L),
        DYLD_INFO_ONLY(2147483682L),
        LOAD_UPWARD_DYLIB(2147483683L),
        MAIN(2147483688L);

        private final long id;
        LoadCommandType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, LoadCommandType> byId = new HashMap<Long, LoadCommandType>(51);
        static {
            for (LoadCommandType e : LoadCommandType.values())
                byId.put(e.id(), e);
        }
        public static LoadCommandType byId(long id) { return byId.get(id); }
    }

    public enum MagicType {
        MACHO_LE_X86(3472551422L),
        MACHO_LE_X64(3489328638L),
        MACHO_BE_X86(4277009102L),
        MACHO_BE_X64(4277009103L);

        private final long id;
        MagicType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, MagicType> byId = new HashMap<Long, MagicType>(4);
        static {
            for (MagicType e : MagicType.values())
                byId.put(e.id(), e);
        }
        public static MagicType byId(long id) { return byId.get(id); }
    }
    public MachO() {
        this(null, null, null);
    }

    public MachO(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MachO(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MachO(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = MagicType.byId(this._io.readU4be());
        this.header = new MachHeader(this._io, this, _root);
        this.header._read();
        this.loadCommands = new ArrayList<LoadCommand>();
        for (int i = 0; i < header().ncmds(); i++) {
            LoadCommand _t_loadCommands = new LoadCommand(this._io, this, _root);
            try {
                _t_loadCommands._read();
            } finally {
                this.loadCommands.add(_t_loadCommands);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.loadCommands.size(); i++) {
            this.loadCommands.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4be(((Number) (this.magic.id())).longValue());
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.loadCommands.size(); i++) {
            this.loadCommands.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.loadCommands.size() != header().ncmds())
            throw new ConsistencyError("load_commands", header().ncmds(), this.loadCommands.size());
        for (int i = 0; i < this.loadCommands.size(); i++) {
            if (!Objects.equals(this.loadCommands.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("load_commands", _root(), this.loadCommands.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.loadCommands.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("load_commands", this, this.loadCommands.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class BuildVersionCommand extends KaitaiStruct.ReadWrite {
        public static BuildVersionCommand fromFile(String fileName) throws IOException {
            return new BuildVersionCommand(new ByteBufferKaitaiStream(fileName));
        }
        public BuildVersionCommand() {
            this(null, null, null);
        }

        public BuildVersionCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BuildVersionCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public BuildVersionCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.platform = this._io.readU4le();
            this.minos = this._io.readU4le();
            this.sdk = this._io.readU4le();
            this.ntools = this._io.readU4le();
            this.tools = new ArrayList<BuildToolVersion>();
            for (int i = 0; i < ntools(); i++) {
                BuildToolVersion _t_tools = new BuildToolVersion(this._io, this, _root);
                try {
                    _t_tools._read();
                } finally {
                    this.tools.add(_t_tools);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.tools.size(); i++) {
                this.tools.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.platform);
            this._io.writeU4le(this.minos);
            this._io.writeU4le(this.sdk);
            this._io.writeU4le(this.ntools);
            for (int i = 0; i < this.tools.size(); i++) {
                this.tools.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.tools.size() != ntools())
                throw new ConsistencyError("tools", ntools(), this.tools.size());
            for (int i = 0; i < this.tools.size(); i++) {
                if (!Objects.equals(this.tools.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("tools", _root(), this.tools.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.tools.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("tools", this, this.tools.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class BuildToolVersion extends KaitaiStruct.ReadWrite {
            public static BuildToolVersion fromFile(String fileName) throws IOException {
                return new BuildToolVersion(new ByteBufferKaitaiStream(fileName));
            }
            public BuildToolVersion() {
                this(null, null, null);
            }

            public BuildToolVersion(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BuildToolVersion(KaitaiStream _io, MachO.BuildVersionCommand _parent) {
                this(_io, _parent, null);
            }

            public BuildToolVersion(KaitaiStream _io, MachO.BuildVersionCommand _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.tool = this._io.readU4le();
                this.version = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.tool);
                this._io.writeU4le(this.version);
            }

            public void _check() {
                _dirty = false;
            }
            private long tool;
            private long version;
            private MachO _root;
            private MachO.BuildVersionCommand _parent;
            public long tool() { return tool; }
            public void setTool(long _v) { _dirty = true; tool = _v; }
            public long version() { return version; }
            public void setVersion(long _v) { _dirty = true; version = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.BuildVersionCommand _parent() { return _parent; }
            public void set_parent(MachO.BuildVersionCommand _v) { _dirty = true; _parent = _v; }
        }
        private long platform;
        private long minos;
        private long sdk;
        private long ntools;
        private List<BuildToolVersion> tools;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long platform() { return platform; }
        public void setPlatform(long _v) { _dirty = true; platform = _v; }
        public long minos() { return minos; }
        public void setMinos(long _v) { _dirty = true; minos = _v; }
        public long sdk() { return sdk; }
        public void setSdk(long _v) { _dirty = true; sdk = _v; }
        public long ntools() { return ntools; }
        public void setNtools(long _v) { _dirty = true; ntools = _v; }
        public List<BuildToolVersion> tools() { return tools; }
        public void setTools(List<BuildToolVersion> _v) { _dirty = true; tools = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class CodeSignatureCommand extends KaitaiStruct.ReadWrite {
        public static CodeSignatureCommand fromFile(String fileName) throws IOException {
            return new CodeSignatureCommand(new ByteBufferKaitaiStream(fileName));
        }
        public CodeSignatureCommand() {
            this(null, null, null);
        }

        public CodeSignatureCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CodeSignatureCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public CodeSignatureCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.dataOff = this._io.readU4le();
            this.dataSize = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            codeSignature();
            if (this.codeSignature != null) {
                this.codeSignature._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteCodeSignature = _enabledCodeSignature;
            this._io.writeU4le(this.dataOff);
            this._io.writeU4le(this.dataSize);
        }

        public void _check() {
            if (_enabledCodeSignature) {
                if (!Objects.equals(this.codeSignature._root(), _root()))
                    throw new ConsistencyError("code_signature", _root(), this.codeSignature._root());
                if (!Objects.equals(this.codeSignature._parent(), this))
                    throw new ConsistencyError("code_signature", this, this.codeSignature._parent());
            }
            _dirty = false;
        }
        private CsBlob codeSignature;
        private boolean _shouldWriteCodeSignature = false;
        private boolean _enabledCodeSignature = true;
        public CsBlob codeSignature() {
            if (_shouldWriteCodeSignature)
                _writeCodeSignature();
            if (this.codeSignature != null)
                return this.codeSignature;
            if (!_enabledCodeSignature)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(dataOff());
            this._raw_codeSignature = io.readBytes(dataSize());
            KaitaiStream _io__raw_codeSignature = new ByteBufferKaitaiStream(this._raw_codeSignature);
            this.codeSignature = new CsBlob(_io__raw_codeSignature, this, _root);
            this.codeSignature._read();
            io.seek(_pos);
            return this.codeSignature;
        }
        public void setCodeSignature(CsBlob _v) { _dirty = true; codeSignature = _v; }
        public void setCodeSignature_Enabled(boolean _v) { _dirty = true; _enabledCodeSignature = _v; }

        private void _writeCodeSignature() {
            _shouldWriteCodeSignature = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(dataOff());
            final KaitaiStream _io__raw_codeSignature = new ByteBufferKaitaiStream(dataSize());
            io.addChildStream(_io__raw_codeSignature);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (dataSize()));
                final CodeSignatureCommand _this = this;
                _io__raw_codeSignature.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_codeSignature = _io__raw_codeSignature.toByteArray();
                        if (_this._raw_codeSignature.length != dataSize())
                            throw new ConsistencyError("raw(code_signature)", dataSize(), _this._raw_codeSignature.length);
                        parent.writeBytes(_this._raw_codeSignature);
                    }
                });
            }
            this.codeSignature._write_Seq(_io__raw_codeSignature);
            io.seek(_pos);
        }
        private long dataOff;
        private long dataSize;
        private MachO _root;
        private MachO.LoadCommand _parent;
        private byte[] _raw_codeSignature;
        public long dataOff() { return dataOff; }
        public void setDataOff(long _v) { _dirty = true; dataOff = _v; }
        public long dataSize() { return dataSize; }
        public void setDataSize(long _v) { _dirty = true; dataSize = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_codeSignature() { return _raw_codeSignature; }
        public void set_raw_CodeSignature(byte[] _v) { _dirty = true; _raw_codeSignature = _v; }
    }
    public static class CsBlob extends KaitaiStruct.ReadWrite {
        public static CsBlob fromFile(String fileName) throws IOException {
            return new CsBlob(new ByteBufferKaitaiStream(fileName));
        }

        public enum CsMagic {
            BLOB_WRAPPER(4208855809L),
            REQUIREMENT(4208856064L),
            REQUIREMENTS(4208856065L),
            CODE_DIRECTORY(4208856066L),
            EMBEDDED_SIGNATURE(4208856256L),
            DETACHED_SIGNATURE(4208856257L),
            ENTITLEMENTS(4208882033L),
            DER_ENTITLEMENTS(4208882034L);

            private final long id;
            CsMagic(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, CsMagic> byId = new HashMap<Long, CsMagic>(8);
            static {
                for (CsMagic e : CsMagic.values())
                    byId.put(e.id(), e);
            }
            public static CsMagic byId(long id) { return byId.get(id); }
        }
        public CsBlob() {
            this(null, null, null);
        }

        public CsBlob(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CsBlob(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public CsBlob(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = CsMagic.byId(this._io.readU4be());
            this.length = this._io.readU4be();
            {
                CsMagic on = magic();
                if (on != null) {
                    switch (magic()) {
                    case BLOB_WRAPPER: {
                        this._raw_body = this._io.readBytes(length() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new BlobWrapper(_io__raw_body, this, _root);
                        ((BlobWrapper) (this.body))._read();
                        break;
                    }
                    case CODE_DIRECTORY: {
                        this._raw_body = this._io.readBytes(length() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new CodeDirectory(_io__raw_body, this, _root);
                        ((CodeDirectory) (this.body))._read();
                        break;
                    }
                    case DER_ENTITLEMENTS: {
                        this._raw_body = this._io.readBytes(length() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Asn1Der(_io__raw_body);
                        ((Asn1Der) (this.body))._read();
                        break;
                    }
                    case DETACHED_SIGNATURE: {
                        this._raw_body = this._io.readBytes(length() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SuperBlob(_io__raw_body, this, _root);
                        ((SuperBlob) (this.body))._read();
                        break;
                    }
                    case EMBEDDED_SIGNATURE: {
                        this._raw_body = this._io.readBytes(length() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SuperBlob(_io__raw_body, this, _root);
                        ((SuperBlob) (this.body))._read();
                        break;
                    }
                    case ENTITLEMENTS: {
                        this._raw_body = this._io.readBytes(length() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Entitlements(_io__raw_body, this, _root);
                        ((Entitlements) (this.body))._read();
                        break;
                    }
                    case REQUIREMENT: {
                        this._raw_body = this._io.readBytes(length() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Requirement(_io__raw_body, this, _root);
                        ((Requirement) (this.body))._read();
                        break;
                    }
                    case REQUIREMENTS: {
                        this._raw_body = this._io.readBytes(length() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Requirements(_io__raw_body, this, _root);
                        ((Requirements) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(length() - 8);
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(length() - 8);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                CsMagic on = magic();
                if (on != null) {
                    switch (magic()) {
                    case BLOB_WRAPPER: {
                        ((BlobWrapper) (this.body))._fetchInstances();
                        break;
                    }
                    case CODE_DIRECTORY: {
                        ((CodeDirectory) (this.body))._fetchInstances();
                        break;
                    }
                    case DER_ENTITLEMENTS: {
                        ((Asn1Der) (this.body))._fetchInstances();
                        break;
                    }
                    case DETACHED_SIGNATURE: {
                        ((SuperBlob) (this.body))._fetchInstances();
                        break;
                    }
                    case EMBEDDED_SIGNATURE: {
                        ((SuperBlob) (this.body))._fetchInstances();
                        break;
                    }
                    case ENTITLEMENTS: {
                        ((Entitlements) (this.body))._fetchInstances();
                        break;
                    }
                    case REQUIREMENT: {
                        ((Requirement) (this.body))._fetchInstances();
                        break;
                    }
                    case REQUIREMENTS: {
                        ((Requirements) (this.body))._fetchInstances();
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(((Number) (this.magic.id())).longValue());
            this._io.writeU4be(this.length);
            {
                CsMagic on = magic();
                if (on != null) {
                    switch (magic()) {
                    case BLOB_WRAPPER: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (length() - 8));
                            final CsBlob _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != length() - 8)
                                        throw new ConsistencyError("raw(body)", length() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((BlobWrapper) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case CODE_DIRECTORY: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (length() - 8));
                            final CsBlob _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != length() - 8)
                                        throw new ConsistencyError("raw(body)", length() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((CodeDirectory) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DER_ENTITLEMENTS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (length() - 8));
                            final CsBlob _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != length() - 8)
                                        throw new ConsistencyError("raw(body)", length() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Asn1Der) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DETACHED_SIGNATURE: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (length() - 8));
                            final CsBlob _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != length() - 8)
                                        throw new ConsistencyError("raw(body)", length() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SuperBlob) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case EMBEDDED_SIGNATURE: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (length() - 8));
                            final CsBlob _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != length() - 8)
                                        throw new ConsistencyError("raw(body)", length() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SuperBlob) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case ENTITLEMENTS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (length() - 8));
                            final CsBlob _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != length() - 8)
                                        throw new ConsistencyError("raw(body)", length() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Entitlements) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case REQUIREMENT: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (length() - 8));
                            final CsBlob _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != length() - 8)
                                        throw new ConsistencyError("raw(body)", length() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Requirement) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case REQUIREMENTS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (length() - 8));
                            final CsBlob _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != length() - 8)
                                        throw new ConsistencyError("raw(body)", length() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Requirements) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                }
            }
        }

        public void _check() {
            {
                CsMagic on = magic();
                if (on != null) {
                    switch (magic()) {
                    case BLOB_WRAPPER: {
                        if (!Objects.equals(((MachO.CsBlob.BlobWrapper) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.CsBlob.BlobWrapper) (this.body))._root());
                        if (!Objects.equals(((MachO.CsBlob.BlobWrapper) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.CsBlob.BlobWrapper) (this.body))._parent());
                        break;
                    }
                    case CODE_DIRECTORY: {
                        if (!Objects.equals(((MachO.CsBlob.CodeDirectory) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.CsBlob.CodeDirectory) (this.body))._root());
                        if (!Objects.equals(((MachO.CsBlob.CodeDirectory) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.CsBlob.CodeDirectory) (this.body))._parent());
                        break;
                    }
                    case DER_ENTITLEMENTS: {
                        break;
                    }
                    case DETACHED_SIGNATURE: {
                        if (!Objects.equals(((MachO.CsBlob.SuperBlob) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.CsBlob.SuperBlob) (this.body))._root());
                        if (!Objects.equals(((MachO.CsBlob.SuperBlob) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.CsBlob.SuperBlob) (this.body))._parent());
                        break;
                    }
                    case EMBEDDED_SIGNATURE: {
                        if (!Objects.equals(((MachO.CsBlob.SuperBlob) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.CsBlob.SuperBlob) (this.body))._root());
                        if (!Objects.equals(((MachO.CsBlob.SuperBlob) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.CsBlob.SuperBlob) (this.body))._parent());
                        break;
                    }
                    case ENTITLEMENTS: {
                        if (!Objects.equals(((MachO.CsBlob.Entitlements) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.CsBlob.Entitlements) (this.body))._root());
                        if (!Objects.equals(((MachO.CsBlob.Entitlements) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.CsBlob.Entitlements) (this.body))._parent());
                        break;
                    }
                    case REQUIREMENT: {
                        if (!Objects.equals(((MachO.CsBlob.Requirement) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.CsBlob.Requirement) (this.body))._root());
                        if (!Objects.equals(((MachO.CsBlob.Requirement) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.CsBlob.Requirement) (this.body))._parent());
                        break;
                    }
                    case REQUIREMENTS: {
                        if (!Objects.equals(((MachO.CsBlob.Requirements) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.CsBlob.Requirements) (this.body))._root());
                        if (!Objects.equals(((MachO.CsBlob.Requirements) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.CsBlob.Requirements) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != length() - 8)
                            throw new ConsistencyError("body", length() - 8, ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != length() - 8)
                        throw new ConsistencyError("body", length() - 8, ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
        }
        public static class BlobIndex extends KaitaiStruct.ReadWrite {
            public static BlobIndex fromFile(String fileName) throws IOException {
                return new BlobIndex(new ByteBufferKaitaiStream(fileName));
            }

            public enum CsslotType {
                CODE_DIRECTORY(0),
                INFO_SLOT(1),
                REQUIREMENTS(2),
                RESOURCE_DIR(3),
                APPLICATION(4),
                ENTITLEMENTS(5),
                DER_ENTITLEMENTS(7),
                ALTERNATE_CODE_DIRECTORIES(4096),
                SIGNATURE_SLOT(65536);

                private final long id;
                CsslotType(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, CsslotType> byId = new HashMap<Long, CsslotType>(9);
                static {
                    for (CsslotType e : CsslotType.values())
                        byId.put(e.id(), e);
                }
                public static CsslotType byId(long id) { return byId.get(id); }
            }
            public BlobIndex() {
                this(null, null, null);
            }

            public BlobIndex(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BlobIndex(KaitaiStream _io, MachO.CsBlob.SuperBlob _parent) {
                this(_io, _parent, null);
            }

            public BlobIndex(KaitaiStream _io, MachO.CsBlob.SuperBlob _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.type = CsslotType.byId(this._io.readU4be());
                this.offset = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
                blob();
                if (this.blob != null) {
                    this.blob._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteBlob = _enabledBlob;
                this._io.writeU4be(((Number) (this.type.id())).longValue());
                this._io.writeU4be(this.offset);
            }

            public void _check() {
                if (_enabledBlob) {
                    if (!Objects.equals(this.blob._root(), _root()))
                        throw new ConsistencyError("blob", _root(), this.blob._root());
                    if (!Objects.equals(this.blob._parent(), this))
                        throw new ConsistencyError("blob", this, this.blob._parent());
                }
                _dirty = false;
            }
            private CsBlob blob;
            private boolean _shouldWriteBlob = false;
            private boolean _enabledBlob = true;
            public CsBlob blob() {
                if (_shouldWriteBlob)
                    _writeBlob();
                if (this.blob != null)
                    return this.blob;
                if (!_enabledBlob)
                    return null;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(offset() - 8);
                this._raw_blob = io.readBytesFull();
                KaitaiStream _io__raw_blob = new ByteBufferKaitaiStream(this._raw_blob);
                this.blob = new CsBlob(_io__raw_blob, this, _root);
                this.blob._read();
                io.seek(_pos);
                return this.blob;
            }
            public void setBlob(CsBlob _v) { _dirty = true; blob = _v; }
            public void setBlob_Enabled(boolean _v) { _dirty = true; _enabledBlob = _v; }

            private void _writeBlob() {
                _shouldWriteBlob = false;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(offset() - 8);
                final KaitaiStream _io__raw_blob = new ByteBufferKaitaiStream(io.size() - io.pos());
                io.addChildStream(_io__raw_blob);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (io.size() - io.pos()));
                    final BlobIndex _this = this;
                    _io__raw_blob.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_blob = _io__raw_blob.toByteArray();
                            parent.writeBytes(_this._raw_blob);
                            if (!(parent.isEof()))
                                throw new ConsistencyError("raw(blob)", 0, parent.size() - parent.pos());
                        }
                    });
                }
                this.blob._write_Seq(_io__raw_blob);
                io.seek(_pos);
            }
            private CsslotType type;
            private long offset;
            private MachO _root;
            private MachO.CsBlob.SuperBlob _parent;
            private byte[] _raw_blob;
            public CsslotType type() { return type; }
            public void setType(CsslotType _v) { _dirty = true; type = _v; }
            public long offset() { return offset; }
            public void setOffset(long _v) { _dirty = true; offset = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.CsBlob.SuperBlob _parent() { return _parent; }
            public void set_parent(MachO.CsBlob.SuperBlob _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_blob() { return _raw_blob; }
            public void set_raw_Blob(byte[] _v) { _dirty = true; _raw_blob = _v; }
        }
        public static class BlobWrapper extends KaitaiStruct.ReadWrite {
            public static BlobWrapper fromFile(String fileName) throws IOException {
                return new BlobWrapper(new ByteBufferKaitaiStream(fileName));
            }
            public BlobWrapper() {
                this(null, null, null);
            }

            public BlobWrapper(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BlobWrapper(KaitaiStream _io, MachO.CsBlob _parent) {
                this(_io, _parent, null);
            }

            public BlobWrapper(KaitaiStream _io, MachO.CsBlob _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.data = this._io.readBytesFull();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.data);
                if (!(this._io.isEof()))
                    throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                _dirty = false;
            }
            private byte[] data;
            private MachO _root;
            private MachO.CsBlob _parent;
            public byte[] data() { return data; }
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.CsBlob _parent() { return _parent; }
            public void set_parent(MachO.CsBlob _v) { _dirty = true; _parent = _v; }
        }
        public static class CodeDirectory extends KaitaiStruct.ReadWrite {
            public static CodeDirectory fromFile(String fileName) throws IOException {
                return new CodeDirectory(new ByteBufferKaitaiStream(fileName));
            }
            public CodeDirectory() {
                this(null, null, null);
            }

            public CodeDirectory(KaitaiStream _io) {
                this(_io, null, null);
            }

            public CodeDirectory(KaitaiStream _io, MachO.CsBlob _parent) {
                this(_io, _parent, null);
            }

            public CodeDirectory(KaitaiStream _io, MachO.CsBlob _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.version = this._io.readU4be();
                this.flags = this._io.readU4be();
                this.hashOffset = this._io.readU4be();
                this.identOffset = this._io.readU4be();
                this.nSpecialSlots = this._io.readU4be();
                this.nCodeSlots = this._io.readU4be();
                this.codeLimit = this._io.readU4be();
                this.hashSize = this._io.readU1();
                this.hashType = this._io.readU1();
                this.spare1 = this._io.readU1();
                this.pageSize = this._io.readU1();
                this.spare2 = this._io.readU4be();
                if (version() >= 131328) {
                    this.scatterOffset = this._io.readU4be();
                }
                if (version() >= 131584) {
                    this.teamIdOffset = this._io.readU4be();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (version() >= 131328) {
                }
                if (version() >= 131584) {
                }
                hashes();
                if (this.hashes != null) {
                    for (int i = 0; i < this.hashes.size(); i++) {
                    }
                }
                ident();
                if (this.ident != null) {
                }
                teamId();
                if (this.teamId != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteHashes = _enabledHashes;
                _shouldWriteIdent = _enabledIdent;
                _shouldWriteTeamId = _enabledTeamId;
                this._io.writeU4be(this.version);
                this._io.writeU4be(this.flags);
                this._io.writeU4be(this.hashOffset);
                this._io.writeU4be(this.identOffset);
                this._io.writeU4be(this.nSpecialSlots);
                this._io.writeU4be(this.nCodeSlots);
                this._io.writeU4be(this.codeLimit);
                this._io.writeU1(this.hashSize);
                this._io.writeU1(this.hashType);
                this._io.writeU1(this.spare1);
                this._io.writeU1(this.pageSize);
                this._io.writeU4be(this.spare2);
                if (version() >= 131328) {
                    this._io.writeU4be(this.scatterOffset);
                }
                if (version() >= 131584) {
                    this._io.writeU4be(this.teamIdOffset);
                }
            }

            public void _check() {
                if (version() >= 131328) {
                }
                if (version() >= 131584) {
                }
                if (_enabledHashes) {
                    if (this.hashes.size() != nSpecialSlots() + nCodeSlots())
                        throw new ConsistencyError("hashes", nSpecialSlots() + nCodeSlots(), this.hashes.size());
                    for (int i = 0; i < this.hashes.size(); i++) {
                        if (this.hashes.get(((Number) (i)).intValue()).length != hashSize())
                            throw new ConsistencyError("hashes", hashSize(), this.hashes.get(((Number) (i)).intValue()).length);
                    }
                }
                if (_enabledIdent) {
                    if (KaitaiStream.byteArrayIndexOf((this.ident).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                        throw new ConsistencyError("ident", -1, KaitaiStream.byteArrayIndexOf((this.ident).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                }
                if (_enabledTeamId) {
                    if (KaitaiStream.byteArrayIndexOf((this.teamId).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                        throw new ConsistencyError("team_id", -1, KaitaiStream.byteArrayIndexOf((this.teamId).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                }
                _dirty = false;
            }
            private List<byte[]> hashes;
            private boolean _shouldWriteHashes = false;
            private boolean _enabledHashes = true;
            public List<byte[]> hashes() {
                if (_shouldWriteHashes)
                    _writeHashes();
                if (this.hashes != null)
                    return this.hashes;
                if (!_enabledHashes)
                    return null;
                long _pos = this._io.pos();
                this._io.seek((hashOffset() - 8) - hashSize() * nSpecialSlots());
                this.hashes = new ArrayList<byte[]>();
                for (int i = 0; i < nSpecialSlots() + nCodeSlots(); i++) {
                    this.hashes.add(this._io.readBytes(hashSize()));
                }
                this._io.seek(_pos);
                return this.hashes;
            }
            public void setHashes(List<byte[]> _v) { _dirty = true; hashes = _v; }
            public void setHashes_Enabled(boolean _v) { _dirty = true; _enabledHashes = _v; }

            private void _writeHashes() {
                _shouldWriteHashes = false;
                long _pos = this._io.pos();
                this._io.seek((hashOffset() - 8) - hashSize() * nSpecialSlots());
                for (int i = 0; i < this.hashes.size(); i++) {
                    this._io.writeBytes(this.hashes.get(((Number) (i)).intValue()));
                }
                this._io.seek(_pos);
            }
            private String ident;
            private boolean _shouldWriteIdent = false;
            private boolean _enabledIdent = true;
            public String ident() {
                if (_shouldWriteIdent)
                    _writeIdent();
                if (this.ident != null)
                    return this.ident;
                if (!_enabledIdent)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(identOffset() - 8);
                this.ident = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                this._io.seek(_pos);
                return this.ident;
            }
            public void setIdent(String _v) { _dirty = true; ident = _v; }
            public void setIdent_Enabled(boolean _v) { _dirty = true; _enabledIdent = _v; }

            private void _writeIdent() {
                _shouldWriteIdent = false;
                long _pos = this._io.pos();
                this._io.seek(identOffset() - 8);
                this._io.writeBytes((this.ident).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(0);
                this._io.seek(_pos);
            }
            private String teamId;
            private boolean _shouldWriteTeamId = false;
            private boolean _enabledTeamId = true;
            public String teamId() {
                if (_shouldWriteTeamId)
                    _writeTeamId();
                if (this.teamId != null)
                    return this.teamId;
                if (!_enabledTeamId)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(teamIdOffset() - 8);
                this.teamId = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                this._io.seek(_pos);
                return this.teamId;
            }
            public void setTeamId(String _v) { _dirty = true; teamId = _v; }
            public void setTeamId_Enabled(boolean _v) { _dirty = true; _enabledTeamId = _v; }

            private void _writeTeamId() {
                _shouldWriteTeamId = false;
                long _pos = this._io.pos();
                this._io.seek(teamIdOffset() - 8);
                this._io.writeBytes((this.teamId).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(0);
                this._io.seek(_pos);
            }
            private long version;
            private long flags;
            private long hashOffset;
            private long identOffset;
            private long nSpecialSlots;
            private long nCodeSlots;
            private long codeLimit;
            private int hashSize;
            private int hashType;
            private int spare1;
            private int pageSize;
            private long spare2;
            private Long scatterOffset;
            private Long teamIdOffset;
            private MachO _root;
            private MachO.CsBlob _parent;
            public long version() { return version; }
            public void setVersion(long _v) { _dirty = true; version = _v; }
            public long flags() { return flags; }
            public void setFlags(long _v) { _dirty = true; flags = _v; }
            public long hashOffset() { return hashOffset; }
            public void setHashOffset(long _v) { _dirty = true; hashOffset = _v; }
            public long identOffset() { return identOffset; }
            public void setIdentOffset(long _v) { _dirty = true; identOffset = _v; }
            public long nSpecialSlots() { return nSpecialSlots; }
            public void setNSpecialSlots(long _v) { _dirty = true; nSpecialSlots = _v; }
            public long nCodeSlots() { return nCodeSlots; }
            public void setNCodeSlots(long _v) { _dirty = true; nCodeSlots = _v; }
            public long codeLimit() { return codeLimit; }
            public void setCodeLimit(long _v) { _dirty = true; codeLimit = _v; }
            public int hashSize() { return hashSize; }
            public void setHashSize(int _v) { _dirty = true; hashSize = _v; }
            public int hashType() { return hashType; }
            public void setHashType(int _v) { _dirty = true; hashType = _v; }
            public int spare1() { return spare1; }
            public void setSpare1(int _v) { _dirty = true; spare1 = _v; }
            public int pageSize() { return pageSize; }
            public void setPageSize(int _v) { _dirty = true; pageSize = _v; }
            public long spare2() { return spare2; }
            public void setSpare2(long _v) { _dirty = true; spare2 = _v; }
            public Long scatterOffset() { return scatterOffset; }
            public void setScatterOffset(Long _v) { _dirty = true; scatterOffset = _v; }
            public Long teamIdOffset() { return teamIdOffset; }
            public void setTeamIdOffset(Long _v) { _dirty = true; teamIdOffset = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.CsBlob _parent() { return _parent; }
            public void set_parent(MachO.CsBlob _v) { _dirty = true; _parent = _v; }
        }
        public static class Data extends KaitaiStruct.ReadWrite {
            public static Data fromFile(String fileName) throws IOException {
                return new Data(new ByteBufferKaitaiStream(fileName));
            }
            public Data() {
                this(null, null, null);
            }

            public Data(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Data(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                this(_io, _parent, null);
            }

            public Data(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.length = this._io.readU4be();
                this.value = this._io.readBytes(length());
                this.padding = this._io.readBytes(KaitaiStream.mod(-(length()), 4));
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(this.length);
                this._io.writeBytes(this.value);
                this._io.writeBytes(this.padding);
            }

            public void _check() {
                if (this.value.length != length())
                    throw new ConsistencyError("value", length(), this.value.length);
                if (this.padding.length != KaitaiStream.mod(-(length()), 4))
                    throw new ConsistencyError("padding", KaitaiStream.mod(-(length()), 4), this.padding.length);
                _dirty = false;
            }
            private long length;
            private byte[] value;
            private byte[] padding;
            private MachO _root;
            private KaitaiStruct.ReadWrite _parent;
            public long length() { return length; }
            public void setLength(long _v) { _dirty = true; length = _v; }
            public byte[] value() { return value; }
            public void setValue(byte[] _v) { _dirty = true; value = _v; }
            public byte[] padding() { return padding; }
            public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        public static class Entitlements extends KaitaiStruct.ReadWrite {
            public static Entitlements fromFile(String fileName) throws IOException {
                return new Entitlements(new ByteBufferKaitaiStream(fileName));
            }
            public Entitlements() {
                this(null, null, null);
            }

            public Entitlements(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Entitlements(KaitaiStream _io, MachO.CsBlob _parent) {
                this(_io, _parent, null);
            }

            public Entitlements(KaitaiStream _io, MachO.CsBlob _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.data = this._io.readBytesFull();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.data);
                if (!(this._io.isEof()))
                    throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                _dirty = false;
            }
            private byte[] data;
            private MachO _root;
            private MachO.CsBlob _parent;
            public byte[] data() { return data; }
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.CsBlob _parent() { return _parent; }
            public void set_parent(MachO.CsBlob _v) { _dirty = true; _parent = _v; }
        }
        public static class Expr extends KaitaiStruct.ReadWrite {
            public static Expr fromFile(String fileName) throws IOException {
                return new Expr(new ByteBufferKaitaiStream(fileName));
            }

            public enum CertSlot {
                LEFT_CERT(0),
                ANCHOR_CERT(4294967295L);

                private final long id;
                CertSlot(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, CertSlot> byId = new HashMap<Long, CertSlot>(2);
                static {
                    for (CertSlot e : CertSlot.values())
                        byId.put(e.id(), e);
                }
                public static CertSlot byId(long id) { return byId.get(id); }
            }

            public enum OpEnum {
                FALSE(0),
                TRUE(1),
                IDENT(2),
                APPLE_ANCHOR(3),
                ANCHOR_HASH(4),
                INFO_KEY_VALUE(5),
                AND_OP(6),
                OR_OP(7),
                CD_HASH(8),
                NOT_OP(9),
                INFO_KEY_FIELD(10),
                CERT_FIELD(11),
                TRUSTED_CERT(12),
                TRUSTED_CERTS(13),
                CERT_GENERIC(14),
                APPLE_GENERIC_ANCHOR(15),
                ENTITLEMENT_FIELD(16);

                private final long id;
                OpEnum(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, OpEnum> byId = new HashMap<Long, OpEnum>(17);
                static {
                    for (OpEnum e : OpEnum.values())
                        byId.put(e.id(), e);
                }
                public static OpEnum byId(long id) { return byId.get(id); }
            }
            public Expr() {
                this(null, null, null);
            }

            public Expr(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Expr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                this(_io, _parent, null);
            }

            public Expr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.op = OpEnum.byId(this._io.readU4be());
                {
                    OpEnum on = op();
                    if (on != null) {
                        switch (op()) {
                        case ANCHOR_HASH: {
                            this.data = new AnchorHashExpr(this._io, this, _root);
                            ((AnchorHashExpr) (this.data))._read();
                            break;
                        }
                        case AND_OP: {
                            this.data = new AndExpr(this._io, this, _root);
                            ((AndExpr) (this.data))._read();
                            break;
                        }
                        case APPLE_GENERIC_ANCHOR: {
                            this.data = new AppleGenericAnchorExpr(this._io, this, _root);
                            ((AppleGenericAnchorExpr) (this.data))._read();
                            break;
                        }
                        case CD_HASH: {
                            this.data = new Data(this._io, this, _root);
                            ((Data) (this.data))._read();
                            break;
                        }
                        case CERT_FIELD: {
                            this.data = new CertFieldExpr(this._io, this, _root);
                            ((CertFieldExpr) (this.data))._read();
                            break;
                        }
                        case CERT_GENERIC: {
                            this.data = new CertGenericExpr(this._io, this, _root);
                            ((CertGenericExpr) (this.data))._read();
                            break;
                        }
                        case ENTITLEMENT_FIELD: {
                            this.data = new EntitlementFieldExpr(this._io, this, _root);
                            ((EntitlementFieldExpr) (this.data))._read();
                            break;
                        }
                        case IDENT: {
                            this.data = new IdentExpr(this._io, this, _root);
                            ((IdentExpr) (this.data))._read();
                            break;
                        }
                        case INFO_KEY_FIELD: {
                            this.data = new InfoKeyFieldExpr(this._io, this, _root);
                            ((InfoKeyFieldExpr) (this.data))._read();
                            break;
                        }
                        case INFO_KEY_VALUE: {
                            this.data = new Data(this._io, this, _root);
                            ((Data) (this.data))._read();
                            break;
                        }
                        case NOT_OP: {
                            this.data = new Expr(this._io, this, _root);
                            ((Expr) (this.data))._read();
                            break;
                        }
                        case OR_OP: {
                            this.data = new OrExpr(this._io, this, _root);
                            ((OrExpr) (this.data))._read();
                            break;
                        }
                        case TRUSTED_CERT: {
                            this.data = new CertSlotExpr(this._io, this, _root);
                            ((CertSlotExpr) (this.data))._read();
                            break;
                        }
                        }
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                {
                    OpEnum on = op();
                    if (on != null) {
                        switch (op()) {
                        case ANCHOR_HASH: {
                            ((AnchorHashExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case AND_OP: {
                            ((AndExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case APPLE_GENERIC_ANCHOR: {
                            ((AppleGenericAnchorExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case CD_HASH: {
                            ((Data) (this.data))._fetchInstances();
                            break;
                        }
                        case CERT_FIELD: {
                            ((CertFieldExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case CERT_GENERIC: {
                            ((CertGenericExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case ENTITLEMENT_FIELD: {
                            ((EntitlementFieldExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case IDENT: {
                            ((IdentExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case INFO_KEY_FIELD: {
                            ((InfoKeyFieldExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case INFO_KEY_VALUE: {
                            ((Data) (this.data))._fetchInstances();
                            break;
                        }
                        case NOT_OP: {
                            ((Expr) (this.data))._fetchInstances();
                            break;
                        }
                        case OR_OP: {
                            ((OrExpr) (this.data))._fetchInstances();
                            break;
                        }
                        case TRUSTED_CERT: {
                            ((CertSlotExpr) (this.data))._fetchInstances();
                            break;
                        }
                        }
                    }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(((Number) (this.op.id())).longValue());
                {
                    OpEnum on = op();
                    if (on != null) {
                        switch (op()) {
                        case ANCHOR_HASH: {
                            ((AnchorHashExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case AND_OP: {
                            ((AndExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case APPLE_GENERIC_ANCHOR: {
                            ((AppleGenericAnchorExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case CD_HASH: {
                            ((Data) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case CERT_FIELD: {
                            ((CertFieldExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case CERT_GENERIC: {
                            ((CertGenericExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case ENTITLEMENT_FIELD: {
                            ((EntitlementFieldExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case IDENT: {
                            ((IdentExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case INFO_KEY_FIELD: {
                            ((InfoKeyFieldExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case INFO_KEY_VALUE: {
                            ((Data) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case NOT_OP: {
                            ((Expr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case OR_OP: {
                            ((OrExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        case TRUSTED_CERT: {
                            ((CertSlotExpr) (this.data))._write_Seq(this._io);
                            break;
                        }
                        }
                    }
                }
            }

            public void _check() {
                {
                    OpEnum on = op();
                    if (on != null) {
                        switch (op()) {
                        case ANCHOR_HASH: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.AnchorHashExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.AnchorHashExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.AnchorHashExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.AnchorHashExpr) (this.data))._parent());
                            break;
                        }
                        case AND_OP: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.AndExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.AndExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.AndExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.AndExpr) (this.data))._parent());
                            break;
                        }
                        case APPLE_GENERIC_ANCHOR: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.AppleGenericAnchorExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.AppleGenericAnchorExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.AppleGenericAnchorExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.AppleGenericAnchorExpr) (this.data))._parent());
                            break;
                        }
                        case CD_HASH: {
                            if (!Objects.equals(((MachO.CsBlob.Data) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Data) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Data) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Data) (this.data))._parent());
                            break;
                        }
                        case CERT_FIELD: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.CertFieldExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.CertFieldExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.CertFieldExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.CertFieldExpr) (this.data))._parent());
                            break;
                        }
                        case CERT_GENERIC: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.CertGenericExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.CertGenericExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.CertGenericExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.CertGenericExpr) (this.data))._parent());
                            break;
                        }
                        case ENTITLEMENT_FIELD: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.EntitlementFieldExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.EntitlementFieldExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.EntitlementFieldExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.EntitlementFieldExpr) (this.data))._parent());
                            break;
                        }
                        case IDENT: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.IdentExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.IdentExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.IdentExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.IdentExpr) (this.data))._parent());
                            break;
                        }
                        case INFO_KEY_FIELD: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.InfoKeyFieldExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.InfoKeyFieldExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.InfoKeyFieldExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.InfoKeyFieldExpr) (this.data))._parent());
                            break;
                        }
                        case INFO_KEY_VALUE: {
                            if (!Objects.equals(((MachO.CsBlob.Data) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Data) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Data) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Data) (this.data))._parent());
                            break;
                        }
                        case NOT_OP: {
                            if (!Objects.equals(((MachO.CsBlob.Expr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr) (this.data))._parent());
                            break;
                        }
                        case OR_OP: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.OrExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.OrExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.OrExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.OrExpr) (this.data))._parent());
                            break;
                        }
                        case TRUSTED_CERT: {
                            if (!Objects.equals(((MachO.CsBlob.Expr.CertSlotExpr) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((MachO.CsBlob.Expr.CertSlotExpr) (this.data))._root());
                            if (!Objects.equals(((MachO.CsBlob.Expr.CertSlotExpr) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((MachO.CsBlob.Expr.CertSlotExpr) (this.data))._parent());
                            break;
                        }
                        }
                    }
                }
                _dirty = false;
            }
            public static class AnchorHashExpr extends KaitaiStruct.ReadWrite {
                public static AnchorHashExpr fromFile(String fileName) throws IOException {
                    return new AnchorHashExpr(new ByteBufferKaitaiStream(fileName));
                }
                public AnchorHashExpr() {
                    this(null, null, null);
                }

                public AnchorHashExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public AnchorHashExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public AnchorHashExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.certSlot = MachO.CsBlob.Expr.CertSlot.byId(this._io.readU4be());
                    this.data = new Data(this._io, this, _root);
                    this.data._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.data._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.certSlot.id())).longValue());
                    this.data._write_Seq(this._io);
                }

                public void _check() {
                    if (!Objects.equals(this.data._root(), _root()))
                        throw new ConsistencyError("data", _root(), this.data._root());
                    if (!Objects.equals(this.data._parent(), this))
                        throw new ConsistencyError("data", this, this.data._parent());
                    _dirty = false;
                }
                private CertSlot certSlot;
                private Data data;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public CertSlot certSlot() { return certSlot; }
                public void setCertSlot(CertSlot _v) { _dirty = true; certSlot = _v; }
                public Data data() { return data; }
                public void setData(Data _v) { _dirty = true; data = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class AndExpr extends KaitaiStruct.ReadWrite {
                public static AndExpr fromFile(String fileName) throws IOException {
                    return new AndExpr(new ByteBufferKaitaiStream(fileName));
                }
                public AndExpr() {
                    this(null, null, null);
                }

                public AndExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public AndExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public AndExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.left = new Expr(this._io, this, _root);
                    this.left._read();
                    this.right = new Expr(this._io, this, _root);
                    this.right._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.left._fetchInstances();
                    this.right._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.left._write_Seq(this._io);
                    this.right._write_Seq(this._io);
                }

                public void _check() {
                    if (!Objects.equals(this.left._root(), _root()))
                        throw new ConsistencyError("left", _root(), this.left._root());
                    if (!Objects.equals(this.left._parent(), this))
                        throw new ConsistencyError("left", this, this.left._parent());
                    if (!Objects.equals(this.right._root(), _root()))
                        throw new ConsistencyError("right", _root(), this.right._root());
                    if (!Objects.equals(this.right._parent(), this))
                        throw new ConsistencyError("right", this, this.right._parent());
                    _dirty = false;
                }
                private Expr left;
                private Expr right;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public Expr left() { return left; }
                public void setLeft(Expr _v) { _dirty = true; left = _v; }
                public Expr right() { return right; }
                public void setRight(Expr _v) { _dirty = true; right = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class AppleGenericAnchorExpr extends KaitaiStruct.ReadWrite {
                public static AppleGenericAnchorExpr fromFile(String fileName) throws IOException {
                    return new AppleGenericAnchorExpr(new ByteBufferKaitaiStream(fileName));
                }
                public AppleGenericAnchorExpr() {
                    this(null, null, null);
                }

                public AppleGenericAnchorExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public AppleGenericAnchorExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public AppleGenericAnchorExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
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
                private String value;
                public String value() {
                    if (this.value != null)
                        return this.value;
                    this.value = "anchor apple generic";
                    return this.value;
                }
                public void _invalidateValue() { this.value = null; }
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class CertFieldExpr extends KaitaiStruct.ReadWrite {
                public static CertFieldExpr fromFile(String fileName) throws IOException {
                    return new CertFieldExpr(new ByteBufferKaitaiStream(fileName));
                }
                public CertFieldExpr() {
                    this(null, null, null);
                }

                public CertFieldExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CertFieldExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public CertFieldExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.certSlot = MachO.CsBlob.Expr.CertSlot.byId(this._io.readU4be());
                    this.data = new Data(this._io, this, _root);
                    this.data._read();
                    this.match = new Match(this._io, this, _root);
                    this.match._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.data._fetchInstances();
                    this.match._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.certSlot.id())).longValue());
                    this.data._write_Seq(this._io);
                    this.match._write_Seq(this._io);
                }

                public void _check() {
                    if (!Objects.equals(this.data._root(), _root()))
                        throw new ConsistencyError("data", _root(), this.data._root());
                    if (!Objects.equals(this.data._parent(), this))
                        throw new ConsistencyError("data", this, this.data._parent());
                    if (!Objects.equals(this.match._root(), _root()))
                        throw new ConsistencyError("match", _root(), this.match._root());
                    if (!Objects.equals(this.match._parent(), this))
                        throw new ConsistencyError("match", this, this.match._parent());
                    _dirty = false;
                }
                private CertSlot certSlot;
                private Data data;
                private Match match;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public CertSlot certSlot() { return certSlot; }
                public void setCertSlot(CertSlot _v) { _dirty = true; certSlot = _v; }
                public Data data() { return data; }
                public void setData(Data _v) { _dirty = true; data = _v; }
                public Match match() { return match; }
                public void setMatch(Match _v) { _dirty = true; match = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class CertGenericExpr extends KaitaiStruct.ReadWrite {
                public static CertGenericExpr fromFile(String fileName) throws IOException {
                    return new CertGenericExpr(new ByteBufferKaitaiStream(fileName));
                }
                public CertGenericExpr() {
                    this(null, null, null);
                }

                public CertGenericExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CertGenericExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public CertGenericExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.certSlot = MachO.CsBlob.Expr.CertSlot.byId(this._io.readU4be());
                    this.data = new Data(this._io, this, _root);
                    this.data._read();
                    this.match = new Match(this._io, this, _root);
                    this.match._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.data._fetchInstances();
                    this.match._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.certSlot.id())).longValue());
                    this.data._write_Seq(this._io);
                    this.match._write_Seq(this._io);
                }

                public void _check() {
                    if (!Objects.equals(this.data._root(), _root()))
                        throw new ConsistencyError("data", _root(), this.data._root());
                    if (!Objects.equals(this.data._parent(), this))
                        throw new ConsistencyError("data", this, this.data._parent());
                    if (!Objects.equals(this.match._root(), _root()))
                        throw new ConsistencyError("match", _root(), this.match._root());
                    if (!Objects.equals(this.match._parent(), this))
                        throw new ConsistencyError("match", this, this.match._parent());
                    _dirty = false;
                }
                private CertSlot certSlot;
                private Data data;
                private Match match;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public CertSlot certSlot() { return certSlot; }
                public void setCertSlot(CertSlot _v) { _dirty = true; certSlot = _v; }
                public Data data() { return data; }
                public void setData(Data _v) { _dirty = true; data = _v; }
                public Match match() { return match; }
                public void setMatch(Match _v) { _dirty = true; match = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class CertSlotExpr extends KaitaiStruct.ReadWrite {
                public static CertSlotExpr fromFile(String fileName) throws IOException {
                    return new CertSlotExpr(new ByteBufferKaitaiStream(fileName));
                }
                public CertSlotExpr() {
                    this(null, null, null);
                }

                public CertSlotExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CertSlotExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public CertSlotExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.value = MachO.CsBlob.Expr.CertSlot.byId(this._io.readU4be());
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.value.id())).longValue());
                }

                public void _check() {
                    _dirty = false;
                }
                private CertSlot value;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public CertSlot value() { return value; }
                public void setValue(CertSlot _v) { _dirty = true; value = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class EntitlementFieldExpr extends KaitaiStruct.ReadWrite {
                public static EntitlementFieldExpr fromFile(String fileName) throws IOException {
                    return new EntitlementFieldExpr(new ByteBufferKaitaiStream(fileName));
                }
                public EntitlementFieldExpr() {
                    this(null, null, null);
                }

                public EntitlementFieldExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public EntitlementFieldExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public EntitlementFieldExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.data = new Data(this._io, this, _root);
                    this.data._read();
                    this.match = new Match(this._io, this, _root);
                    this.match._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.data._fetchInstances();
                    this.match._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.data._write_Seq(this._io);
                    this.match._write_Seq(this._io);
                }

                public void _check() {
                    if (!Objects.equals(this.data._root(), _root()))
                        throw new ConsistencyError("data", _root(), this.data._root());
                    if (!Objects.equals(this.data._parent(), this))
                        throw new ConsistencyError("data", this, this.data._parent());
                    if (!Objects.equals(this.match._root(), _root()))
                        throw new ConsistencyError("match", _root(), this.match._root());
                    if (!Objects.equals(this.match._parent(), this))
                        throw new ConsistencyError("match", this, this.match._parent());
                    _dirty = false;
                }
                private Data data;
                private Match match;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public Data data() { return data; }
                public void setData(Data _v) { _dirty = true; data = _v; }
                public Match match() { return match; }
                public void setMatch(Match _v) { _dirty = true; match = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class IdentExpr extends KaitaiStruct.ReadWrite {
                public static IdentExpr fromFile(String fileName) throws IOException {
                    return new IdentExpr(new ByteBufferKaitaiStream(fileName));
                }
                public IdentExpr() {
                    this(null, null, null);
                }

                public IdentExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public IdentExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public IdentExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.identifier = new Data(this._io, this, _root);
                    this.identifier._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.identifier._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.identifier._write_Seq(this._io);
                }

                public void _check() {
                    if (!Objects.equals(this.identifier._root(), _root()))
                        throw new ConsistencyError("identifier", _root(), this.identifier._root());
                    if (!Objects.equals(this.identifier._parent(), this))
                        throw new ConsistencyError("identifier", this, this.identifier._parent());
                    _dirty = false;
                }
                private Data identifier;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public Data identifier() { return identifier; }
                public void setIdentifier(Data _v) { _dirty = true; identifier = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class InfoKeyFieldExpr extends KaitaiStruct.ReadWrite {
                public static InfoKeyFieldExpr fromFile(String fileName) throws IOException {
                    return new InfoKeyFieldExpr(new ByteBufferKaitaiStream(fileName));
                }
                public InfoKeyFieldExpr() {
                    this(null, null, null);
                }

                public InfoKeyFieldExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public InfoKeyFieldExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public InfoKeyFieldExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.data = new Data(this._io, this, _root);
                    this.data._read();
                    this.match = new Match(this._io, this, _root);
                    this.match._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.data._fetchInstances();
                    this.match._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.data._write_Seq(this._io);
                    this.match._write_Seq(this._io);
                }

                public void _check() {
                    if (!Objects.equals(this.data._root(), _root()))
                        throw new ConsistencyError("data", _root(), this.data._root());
                    if (!Objects.equals(this.data._parent(), this))
                        throw new ConsistencyError("data", this, this.data._parent());
                    if (!Objects.equals(this.match._root(), _root()))
                        throw new ConsistencyError("match", _root(), this.match._root());
                    if (!Objects.equals(this.match._parent(), this))
                        throw new ConsistencyError("match", this, this.match._parent());
                    _dirty = false;
                }
                private Data data;
                private Match match;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public Data data() { return data; }
                public void setData(Data _v) { _dirty = true; data = _v; }
                public Match match() { return match; }
                public void setMatch(Match _v) { _dirty = true; match = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            public static class OrExpr extends KaitaiStruct.ReadWrite {
                public static OrExpr fromFile(String fileName) throws IOException {
                    return new OrExpr(new ByteBufferKaitaiStream(fileName));
                }
                public OrExpr() {
                    this(null, null, null);
                }

                public OrExpr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public OrExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent) {
                    this(_io, _parent, null);
                }

                public OrExpr(KaitaiStream _io, MachO.CsBlob.Expr _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.left = new Expr(this._io, this, _root);
                    this.left._read();
                    this.right = new Expr(this._io, this, _root);
                    this.right._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.left._fetchInstances();
                    this.right._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.left._write_Seq(this._io);
                    this.right._write_Seq(this._io);
                }

                public void _check() {
                    if (!Objects.equals(this.left._root(), _root()))
                        throw new ConsistencyError("left", _root(), this.left._root());
                    if (!Objects.equals(this.left._parent(), this))
                        throw new ConsistencyError("left", this, this.left._parent());
                    if (!Objects.equals(this.right._root(), _root()))
                        throw new ConsistencyError("right", _root(), this.right._root());
                    if (!Objects.equals(this.right._parent(), this))
                        throw new ConsistencyError("right", this, this.right._parent());
                    _dirty = false;
                }
                private Expr left;
                private Expr right;
                private MachO _root;
                private MachO.CsBlob.Expr _parent;
                public Expr left() { return left; }
                public void setLeft(Expr _v) { _dirty = true; left = _v; }
                public Expr right() { return right; }
                public void setRight(Expr _v) { _dirty = true; right = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.CsBlob.Expr _parent() { return _parent; }
                public void set_parent(MachO.CsBlob.Expr _v) { _dirty = true; _parent = _v; }
            }
            private OpEnum op;
            private KaitaiStruct.ReadWrite data;
            private MachO _root;
            private KaitaiStruct.ReadWrite _parent;
            public OpEnum op() { return op; }
            public void setOp(OpEnum _v) { _dirty = true; op = _v; }
            public KaitaiStruct.ReadWrite data() { return data; }
            public void setData(KaitaiStruct.ReadWrite _v) { _dirty = true; data = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        public static class Match extends KaitaiStruct.ReadWrite {
            public static Match fromFile(String fileName) throws IOException {
                return new Match(new ByteBufferKaitaiStream(fileName));
            }

            public enum Op {
                EXISTS(0),
                EQUAL(1),
                CONTAINS(2),
                BEGINS_WITH(3),
                ENDS_WITH(4),
                LESS_THAN(5),
                GREATER_THAN(6),
                LESS_EQUAL(7),
                GREATER_EQUAL(8);

                private final long id;
                Op(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Op> byId = new HashMap<Long, Op>(9);
                static {
                    for (Op e : Op.values())
                        byId.put(e.id(), e);
                }
                public static Op byId(long id) { return byId.get(id); }
            }
            public Match() {
                this(null, null, null);
            }

            public Match(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Match(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                this(_io, _parent, null);
            }

            public Match(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.matchOp = Op.byId(this._io.readU4be());
                if (matchOp() != Op.EXISTS) {
                    this.data = new Data(this._io, this, _root);
                    this.data._read();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (matchOp() != Op.EXISTS) {
                    this.data._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(((Number) (this.matchOp.id())).longValue());
                if (matchOp() != Op.EXISTS) {
                    this.data._write_Seq(this._io);
                }
            }

            public void _check() {
                if (matchOp() != Op.EXISTS) {
                    if (!Objects.equals(this.data._root(), _root()))
                        throw new ConsistencyError("data", _root(), this.data._root());
                    if (!Objects.equals(this.data._parent(), this))
                        throw new ConsistencyError("data", this, this.data._parent());
                }
                _dirty = false;
            }
            private Op matchOp;
            private Data data;
            private MachO _root;
            private KaitaiStruct.ReadWrite _parent;
            public Op matchOp() { return matchOp; }
            public void setMatchOp(Op _v) { _dirty = true; matchOp = _v; }
            public Data data() { return data; }
            public void setData(Data _v) { _dirty = true; data = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        public static class Requirement extends KaitaiStruct.ReadWrite {
            public static Requirement fromFile(String fileName) throws IOException {
                return new Requirement(new ByteBufferKaitaiStream(fileName));
            }
            public Requirement() {
                this(null, null, null);
            }

            public Requirement(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Requirement(KaitaiStream _io, MachO.CsBlob _parent) {
                this(_io, _parent, null);
            }

            public Requirement(KaitaiStream _io, MachO.CsBlob _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.kind = this._io.readU4be();
                this.expr = new Expr(this._io, this, _root);
                this.expr._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.expr._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(this.kind);
                this.expr._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.expr._root(), _root()))
                    throw new ConsistencyError("expr", _root(), this.expr._root());
                if (!Objects.equals(this.expr._parent(), this))
                    throw new ConsistencyError("expr", this, this.expr._parent());
                _dirty = false;
            }
            private long kind;
            private Expr expr;
            private MachO _root;
            private MachO.CsBlob _parent;
            public long kind() { return kind; }
            public void setKind(long _v) { _dirty = true; kind = _v; }
            public Expr expr() { return expr; }
            public void setExpr(Expr _v) { _dirty = true; expr = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.CsBlob _parent() { return _parent; }
            public void set_parent(MachO.CsBlob _v) { _dirty = true; _parent = _v; }
        }
        public static class Requirements extends KaitaiStruct.ReadWrite {
            public static Requirements fromFile(String fileName) throws IOException {
                return new Requirements(new ByteBufferKaitaiStream(fileName));
            }
            public Requirements() {
                this(null, null, null);
            }

            public Requirements(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Requirements(KaitaiStream _io, MachO.CsBlob _parent) {
                this(_io, _parent, null);
            }

            public Requirements(KaitaiStream _io, MachO.CsBlob _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.count = this._io.readU4be();
                this.items = new ArrayList<RequirementsBlobIndex>();
                for (int i = 0; i < count(); i++) {
                    RequirementsBlobIndex _t_items = new RequirementsBlobIndex(this._io, this, _root);
                    try {
                        _t_items._read();
                    } finally {
                        this.items.add(_t_items);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(this.count);
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.items.size() != count())
                    throw new ConsistencyError("items", count(), this.items.size());
                for (int i = 0; i < this.items.size(); i++) {
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private long count;
            private List<RequirementsBlobIndex> items;
            private MachO _root;
            private MachO.CsBlob _parent;
            public long count() { return count; }
            public void setCount(long _v) { _dirty = true; count = _v; }
            public List<RequirementsBlobIndex> items() { return items; }
            public void setItems(List<RequirementsBlobIndex> _v) { _dirty = true; items = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.CsBlob _parent() { return _parent; }
            public void set_parent(MachO.CsBlob _v) { _dirty = true; _parent = _v; }
        }
        public static class RequirementsBlobIndex extends KaitaiStruct.ReadWrite {
            public static RequirementsBlobIndex fromFile(String fileName) throws IOException {
                return new RequirementsBlobIndex(new ByteBufferKaitaiStream(fileName));
            }

            public enum RequirementType {
                HOST(1),
                GUEST(2),
                DESIGNATED(3),
                LIBRARY(4);

                private final long id;
                RequirementType(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, RequirementType> byId = new HashMap<Long, RequirementType>(4);
                static {
                    for (RequirementType e : RequirementType.values())
                        byId.put(e.id(), e);
                }
                public static RequirementType byId(long id) { return byId.get(id); }
            }
            public RequirementsBlobIndex() {
                this(null, null, null);
            }

            public RequirementsBlobIndex(KaitaiStream _io) {
                this(_io, null, null);
            }

            public RequirementsBlobIndex(KaitaiStream _io, MachO.CsBlob.Requirements _parent) {
                this(_io, _parent, null);
            }

            public RequirementsBlobIndex(KaitaiStream _io, MachO.CsBlob.Requirements _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.type = RequirementType.byId(this._io.readU4be());
                this.offset = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
                value();
                if (this.value != null) {
                    this.value._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteValue = _enabledValue;
                this._io.writeU4be(((Number) (this.type.id())).longValue());
                this._io.writeU4be(this.offset);
            }

            public void _check() {
                if (_enabledValue) {
                    if (!Objects.equals(this.value._root(), _root()))
                        throw new ConsistencyError("value", _root(), this.value._root());
                    if (!Objects.equals(this.value._parent(), this))
                        throw new ConsistencyError("value", this, this.value._parent());
                }
                _dirty = false;
            }
            private CsBlob value;
            private boolean _shouldWriteValue = false;
            private boolean _enabledValue = true;
            public CsBlob value() {
                if (_shouldWriteValue)
                    _writeValue();
                if (this.value != null)
                    return this.value;
                if (!_enabledValue)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(offset() - 8);
                this.value = new CsBlob(this._io, this, _root);
                this.value._read();
                this._io.seek(_pos);
                return this.value;
            }
            public void setValue(CsBlob _v) { _dirty = true; value = _v; }
            public void setValue_Enabled(boolean _v) { _dirty = true; _enabledValue = _v; }

            private void _writeValue() {
                _shouldWriteValue = false;
                long _pos = this._io.pos();
                this._io.seek(offset() - 8);
                this.value._write_Seq(this._io);
                this._io.seek(_pos);
            }
            private RequirementType type;
            private long offset;
            private MachO _root;
            private MachO.CsBlob.Requirements _parent;
            public RequirementType type() { return type; }
            public void setType(RequirementType _v) { _dirty = true; type = _v; }
            public long offset() { return offset; }
            public void setOffset(long _v) { _dirty = true; offset = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.CsBlob.Requirements _parent() { return _parent; }
            public void set_parent(MachO.CsBlob.Requirements _v) { _dirty = true; _parent = _v; }
        }
        public static class SuperBlob extends KaitaiStruct.ReadWrite {
            public static SuperBlob fromFile(String fileName) throws IOException {
                return new SuperBlob(new ByteBufferKaitaiStream(fileName));
            }
            public SuperBlob() {
                this(null, null, null);
            }

            public SuperBlob(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SuperBlob(KaitaiStream _io, MachO.CsBlob _parent) {
                this(_io, _parent, null);
            }

            public SuperBlob(KaitaiStream _io, MachO.CsBlob _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.count = this._io.readU4be();
                this.blobs = new ArrayList<BlobIndex>();
                for (int i = 0; i < count(); i++) {
                    BlobIndex _t_blobs = new BlobIndex(this._io, this, _root);
                    try {
                        _t_blobs._read();
                    } finally {
                        this.blobs.add(_t_blobs);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.blobs.size(); i++) {
                    this.blobs.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(this.count);
                for (int i = 0; i < this.blobs.size(); i++) {
                    this.blobs.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.blobs.size() != count())
                    throw new ConsistencyError("blobs", count(), this.blobs.size());
                for (int i = 0; i < this.blobs.size(); i++) {
                    if (!Objects.equals(this.blobs.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("blobs", _root(), this.blobs.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.blobs.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("blobs", this, this.blobs.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private long count;
            private List<BlobIndex> blobs;
            private MachO _root;
            private MachO.CsBlob _parent;
            public long count() { return count; }
            public void setCount(long _v) { _dirty = true; count = _v; }
            public List<BlobIndex> blobs() { return blobs; }
            public void setBlobs(List<BlobIndex> _v) { _dirty = true; blobs = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.CsBlob _parent() { return _parent; }
            public void set_parent(MachO.CsBlob _v) { _dirty = true; _parent = _v; }
        }
        private CsMagic magic;
        private long length;
        private Object body;
        private MachO _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_body;
        public CsMagic magic() { return magic; }
        public void setMagic(CsMagic _v) { _dirty = true; magic = _v; }
        public long length() { return length; }
        public void setLength(long _v) { _dirty = true; length = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class DyldInfoCommand extends KaitaiStruct.ReadWrite {
        public static DyldInfoCommand fromFile(String fileName) throws IOException {
            return new DyldInfoCommand(new ByteBufferKaitaiStream(fileName));
        }

        public enum BindOpcode {
            DONE(0),
            SET_DYLIB_ORDINAL_IMMEDIATE(16),
            SET_DYLIB_ORDINAL_ULEB(32),
            SET_DYLIB_SPECIAL_IMMEDIATE(48),
            SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE(64),
            SET_TYPE_IMMEDIATE(80),
            SET_APPEND_SLEB(96),
            SET_SEGMENT_AND_OFFSET_ULEB(112),
            ADD_ADDRESS_ULEB(128),
            DO_BIND(144),
            DO_BIND_ADD_ADDRESS_ULEB(160),
            DO_BIND_ADD_ADDRESS_IMMEDIATE_SCALED(176),
            DO_BIND_ULEB_TIMES_SKIPPING_ULEB(192);

            private final long id;
            BindOpcode(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, BindOpcode> byId = new HashMap<Long, BindOpcode>(13);
            static {
                for (BindOpcode e : BindOpcode.values())
                    byId.put(e.id(), e);
            }
            public static BindOpcode byId(long id) { return byId.get(id); }
        }
        public DyldInfoCommand() {
            this(null, null, null);
        }

        public DyldInfoCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DyldInfoCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public DyldInfoCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.rebaseOff = this._io.readU4le();
            this.rebaseSize = this._io.readU4le();
            this.bindOff = this._io.readU4le();
            this.bindSize = this._io.readU4le();
            this.weakBindOff = this._io.readU4le();
            this.weakBindSize = this._io.readU4le();
            this.lazyBindOff = this._io.readU4le();
            this.lazyBindSize = this._io.readU4le();
            this.exportOff = this._io.readU4le();
            this.exportSize = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            bind();
            if (this.bind != null) {
                this.bind._fetchInstances();
            }
            exports();
            if (this.exports != null) {
                this.exports._fetchInstances();
            }
            lazyBind();
            if (this.lazyBind != null) {
                this.lazyBind._fetchInstances();
            }
            rebase();
            if (this.rebase != null) {
                this.rebase._fetchInstances();
            }
            weakBind();
            if (this.weakBind != null) {
                this.weakBind._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBind = _enabledBind;
            _shouldWriteExports = _enabledExports;
            _shouldWriteLazyBind = _enabledLazyBind;
            _shouldWriteRebase = _enabledRebase;
            _shouldWriteWeakBind = _enabledWeakBind;
            this._io.writeU4le(this.rebaseOff);
            this._io.writeU4le(this.rebaseSize);
            this._io.writeU4le(this.bindOff);
            this._io.writeU4le(this.bindSize);
            this._io.writeU4le(this.weakBindOff);
            this._io.writeU4le(this.weakBindSize);
            this._io.writeU4le(this.lazyBindOff);
            this._io.writeU4le(this.lazyBindSize);
            this._io.writeU4le(this.exportOff);
            this._io.writeU4le(this.exportSize);
        }

        public void _check() {
            if (_enabledBind) {
                if (bindSize() != 0) {
                    if (!Objects.equals(this.bind._root(), _root()))
                        throw new ConsistencyError("bind", _root(), this.bind._root());
                    if (!Objects.equals(this.bind._parent(), this))
                        throw new ConsistencyError("bind", this, this.bind._parent());
                }
            }
            if (_enabledExports) {
                if (exportSize() != 0) {
                    if (!Objects.equals(this.exports._root(), _root()))
                        throw new ConsistencyError("exports", _root(), this.exports._root());
                    if (!Objects.equals(this.exports._parent(), this))
                        throw new ConsistencyError("exports", this, this.exports._parent());
                }
            }
            if (_enabledLazyBind) {
                if (lazyBindSize() != 0) {
                    if (!Objects.equals(this.lazyBind._root(), _root()))
                        throw new ConsistencyError("lazy_bind", _root(), this.lazyBind._root());
                    if (!Objects.equals(this.lazyBind._parent(), this))
                        throw new ConsistencyError("lazy_bind", this, this.lazyBind._parent());
                }
            }
            if (_enabledRebase) {
                if (rebaseSize() != 0) {
                    if (!Objects.equals(this.rebase._root(), _root()))
                        throw new ConsistencyError("rebase", _root(), this.rebase._root());
                    if (!Objects.equals(this.rebase._parent(), this))
                        throw new ConsistencyError("rebase", this, this.rebase._parent());
                }
            }
            if (_enabledWeakBind) {
                if (weakBindSize() != 0) {
                    if (!Objects.equals(this.weakBind._root(), _root()))
                        throw new ConsistencyError("weak_bind", _root(), this.weakBind._root());
                    if (!Objects.equals(this.weakBind._parent(), this))
                        throw new ConsistencyError("weak_bind", this, this.weakBind._parent());
                }
            }
            _dirty = false;
        }
        public static class BindData extends KaitaiStruct.ReadWrite {
            public static BindData fromFile(String fileName) throws IOException {
                return new BindData(new ByteBufferKaitaiStream(fileName));
            }
            public BindData() {
                this(null, null, null);
            }

            public BindData(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BindData(KaitaiStream _io, MachO.DyldInfoCommand _parent) {
                this(_io, _parent, null);
            }

            public BindData(KaitaiStream _io, MachO.DyldInfoCommand _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.items = new ArrayList<BindItem>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        BindItem _t_items = new BindItem(this._io, this, _root);
                        try {
                            _t_items._read();
                        } finally {
                            this.items.add(_t_items);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                for (int i = 0; i < this.items.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                    this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.items.size(); i++) {
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private List<BindItem> items;
            private MachO _root;
            private MachO.DyldInfoCommand _parent;
            public List<BindItem> items() { return items; }
            public void setItems(List<BindItem> _v) { _dirty = true; items = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.DyldInfoCommand _parent() { return _parent; }
            public void set_parent(MachO.DyldInfoCommand _v) { _dirty = true; _parent = _v; }
        }
        public static class BindItem extends KaitaiStruct.ReadWrite {
            public static BindItem fromFile(String fileName) throws IOException {
                return new BindItem(new ByteBufferKaitaiStream(fileName));
            }
            public BindItem() {
                this(null, null, null);
            }

            public BindItem(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BindItem(KaitaiStream _io, MachO.DyldInfoCommand.BindData _parent) {
                this(_io, _parent, null);
            }

            public BindItem(KaitaiStream _io, MachO.DyldInfoCommand.BindData _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.opcodeAndImmediate = this._io.readU1();
                if ( ((opcode() == MachO.DyldInfoCommand.BindOpcode.SET_DYLIB_ORDINAL_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_APPEND_SLEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ULEB_TIMES_SKIPPING_ULEB)) ) {
                    this.uleb = new Uleb128(this._io, this, _root);
                    this.uleb._read();
                }
                if (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ULEB_TIMES_SKIPPING_ULEB) {
                    this.skip = new Uleb128(this._io, this, _root);
                    this.skip._read();
                }
                if (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE) {
                    this.symbol = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if ( ((opcode() == MachO.DyldInfoCommand.BindOpcode.SET_DYLIB_ORDINAL_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_APPEND_SLEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ULEB_TIMES_SKIPPING_ULEB)) ) {
                    this.uleb._fetchInstances();
                }
                if (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ULEB_TIMES_SKIPPING_ULEB) {
                    this.skip._fetchInstances();
                }
                if (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.opcodeAndImmediate);
                if ( ((opcode() == MachO.DyldInfoCommand.BindOpcode.SET_DYLIB_ORDINAL_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_APPEND_SLEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ULEB_TIMES_SKIPPING_ULEB)) ) {
                    this.uleb._write_Seq(this._io);
                }
                if (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ULEB_TIMES_SKIPPING_ULEB) {
                    this.skip._write_Seq(this._io);
                }
                if (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE) {
                    this._io.writeBytes((this.symbol).getBytes(Charset.forName("ASCII")));
                    this._io.writeU1(0);
                }
            }

            public void _check() {
                if ( ((opcode() == MachO.DyldInfoCommand.BindOpcode.SET_DYLIB_ORDINAL_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_APPEND_SLEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ULEB_TIMES_SKIPPING_ULEB)) ) {
                    if (!Objects.equals(this.uleb._root(), _root()))
                        throw new ConsistencyError("uleb", _root(), this.uleb._root());
                    if (!Objects.equals(this.uleb._parent(), this))
                        throw new ConsistencyError("uleb", this, this.uleb._parent());
                }
                if (opcode() == MachO.DyldInfoCommand.BindOpcode.DO_BIND_ULEB_TIMES_SKIPPING_ULEB) {
                    if (!Objects.equals(this.skip._root(), _root()))
                        throw new ConsistencyError("skip", _root(), this.skip._root());
                    if (!Objects.equals(this.skip._parent(), this))
                        throw new ConsistencyError("skip", this, this.skip._parent());
                }
                if (opcode() == MachO.DyldInfoCommand.BindOpcode.SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE) {
                    if (KaitaiStream.byteArrayIndexOf((this.symbol).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                        throw new ConsistencyError("symbol", -1, KaitaiStream.byteArrayIndexOf((this.symbol).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                }
                _dirty = false;
            }
            private Integer immediate;
            public Integer immediate() {
                if (this.immediate != null)
                    return this.immediate;
                this.immediate = ((Number) (opcodeAndImmediate() & 15)).intValue();
                return this.immediate;
            }
            public void _invalidateImmediate() { this.immediate = null; }
            private BindOpcode opcode;
            public BindOpcode opcode() {
                if (this.opcode != null)
                    return this.opcode;
                this.opcode = MachO.DyldInfoCommand.BindOpcode.byId(opcodeAndImmediate() & 240);
                return this.opcode;
            }
            public void _invalidateOpcode() { this.opcode = null; }
            private int opcodeAndImmediate;
            private Uleb128 uleb;
            private Uleb128 skip;
            private String symbol;
            private MachO _root;
            private MachO.DyldInfoCommand.BindData _parent;
            public int opcodeAndImmediate() { return opcodeAndImmediate; }
            public void setOpcodeAndImmediate(int _v) { _dirty = true; opcodeAndImmediate = _v; }
            public Uleb128 uleb() { return uleb; }
            public void setUleb(Uleb128 _v) { _dirty = true; uleb = _v; }
            public Uleb128 skip() { return skip; }
            public void setSkip(Uleb128 _v) { _dirty = true; skip = _v; }
            public String symbol() { return symbol; }
            public void setSymbol(String _v) { _dirty = true; symbol = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.DyldInfoCommand.BindData _parent() { return _parent; }
            public void set_parent(MachO.DyldInfoCommand.BindData _v) { _dirty = true; _parent = _v; }
        }
        public static class ExportNode extends KaitaiStruct.ReadWrite {
            public static ExportNode fromFile(String fileName) throws IOException {
                return new ExportNode(new ByteBufferKaitaiStream(fileName));
            }
            public ExportNode() {
                this(null, null, null);
            }

            public ExportNode(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ExportNode(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                this(_io, _parent, null);
            }

            public ExportNode(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.terminalSize = new Uleb128(this._io, this, _root);
                this.terminalSize._read();
                this.childrenCount = this._io.readU1();
                this.children = new ArrayList<Child>();
                for (int i = 0; i < childrenCount(); i++) {
                    Child _t_children = new Child(this._io, this, _root);
                    try {
                        _t_children._read();
                    } finally {
                        this.children.add(_t_children);
                    }
                }
                this.terminal = this._io.readBytes(terminalSize().value());
                _dirty = false;
            }

            public void _fetchInstances() {
                this.terminalSize._fetchInstances();
                for (int i = 0; i < this.children.size(); i++) {
                    this.children.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.terminalSize._write_Seq(this._io);
                this._io.writeU1(this.childrenCount);
                for (int i = 0; i < this.children.size(); i++) {
                    this.children.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.writeBytes(this.terminal);
            }

            public void _check() {
                if (!Objects.equals(this.terminalSize._root(), _root()))
                    throw new ConsistencyError("terminal_size", _root(), this.terminalSize._root());
                if (!Objects.equals(this.terminalSize._parent(), this))
                    throw new ConsistencyError("terminal_size", this, this.terminalSize._parent());
                if (this.children.size() != childrenCount())
                    throw new ConsistencyError("children", childrenCount(), this.children.size());
                for (int i = 0; i < this.children.size(); i++) {
                    if (!Objects.equals(this.children.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("children", _root(), this.children.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.children.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("children", this, this.children.get(((Number) (i)).intValue())._parent());
                }
                if (this.terminal.length != terminalSize().value())
                    throw new ConsistencyError("terminal", terminalSize().value(), this.terminal.length);
                _dirty = false;
            }
            public static class Child extends KaitaiStruct.ReadWrite {
                public static Child fromFile(String fileName) throws IOException {
                    return new Child(new ByteBufferKaitaiStream(fileName));
                }
                public Child() {
                    this(null, null, null);
                }

                public Child(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Child(KaitaiStream _io, MachO.DyldInfoCommand.ExportNode _parent) {
                    this(_io, _parent, null);
                }

                public Child(KaitaiStream _io, MachO.DyldInfoCommand.ExportNode _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                    this.nodeOffset = new Uleb128(this._io, this, _root);
                    this.nodeOffset._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.nodeOffset._fetchInstances();
                    value();
                    if (this.value != null) {
                        this.value._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    _shouldWriteValue = _enabledValue;
                    this._io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
                    this._io.writeU1(0);
                    this.nodeOffset._write_Seq(this._io);
                }

                public void _check() {
                    if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                        throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                    if (!Objects.equals(this.nodeOffset._root(), _root()))
                        throw new ConsistencyError("node_offset", _root(), this.nodeOffset._root());
                    if (!Objects.equals(this.nodeOffset._parent(), this))
                        throw new ConsistencyError("node_offset", this, this.nodeOffset._parent());
                    if (_enabledValue) {
                        if (!Objects.equals(this.value._root(), _root()))
                            throw new ConsistencyError("value", _root(), this.value._root());
                        if (!Objects.equals(this.value._parent(), this))
                            throw new ConsistencyError("value", this, this.value._parent());
                    }
                    _dirty = false;
                }
                private ExportNode value;
                private boolean _shouldWriteValue = false;
                private boolean _enabledValue = true;
                public ExportNode value() {
                    if (_shouldWriteValue)
                        _writeValue();
                    if (this.value != null)
                        return this.value;
                    if (!_enabledValue)
                        return null;
                    long _pos = this._io.pos();
                    this._io.seek(nodeOffset().value());
                    this.value = new ExportNode(this._io, this, _root);
                    this.value._read();
                    this._io.seek(_pos);
                    return this.value;
                }
                public void setValue(ExportNode _v) { _dirty = true; value = _v; }
                public void setValue_Enabled(boolean _v) { _dirty = true; _enabledValue = _v; }

                private void _writeValue() {
                    _shouldWriteValue = false;
                    long _pos = this._io.pos();
                    this._io.seek(nodeOffset().value());
                    this.value._write_Seq(this._io);
                    this._io.seek(_pos);
                }
                private String name;
                private Uleb128 nodeOffset;
                private MachO _root;
                private MachO.DyldInfoCommand.ExportNode _parent;
                public String name() { return name; }
                public void setName(String _v) { _dirty = true; name = _v; }
                public Uleb128 nodeOffset() { return nodeOffset; }
                public void setNodeOffset(Uleb128 _v) { _dirty = true; nodeOffset = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.DyldInfoCommand.ExportNode _parent() { return _parent; }
                public void set_parent(MachO.DyldInfoCommand.ExportNode _v) { _dirty = true; _parent = _v; }
            }
            private Uleb128 terminalSize;
            private int childrenCount;
            private List<Child> children;
            private byte[] terminal;
            private MachO _root;
            private KaitaiStruct.ReadWrite _parent;
            public Uleb128 terminalSize() { return terminalSize; }
            public void setTerminalSize(Uleb128 _v) { _dirty = true; terminalSize = _v; }
            public int childrenCount() { return childrenCount; }
            public void setChildrenCount(int _v) { _dirty = true; childrenCount = _v; }
            public List<Child> children() { return children; }
            public void setChildren(List<Child> _v) { _dirty = true; children = _v; }
            public byte[] terminal() { return terminal; }
            public void setTerminal(byte[] _v) { _dirty = true; terminal = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        public static class RebaseData extends KaitaiStruct.ReadWrite {
            public static RebaseData fromFile(String fileName) throws IOException {
                return new RebaseData(new ByteBufferKaitaiStream(fileName));
            }

            public enum Opcode {
                DONE(0),
                SET_TYPE_IMMEDIATE(16),
                SET_SEGMENT_AND_OFFSET_ULEB(32),
                ADD_ADDRESS_ULEB(48),
                ADD_ADDRESS_IMMEDIATE_SCALED(64),
                DO_REBASE_IMMEDIATE_TIMES(80),
                DO_REBASE_ULEB_TIMES(96),
                DO_REBASE_ADD_ADDRESS_ULEB(112),
                DO_REBASE_ULEB_TIMES_SKIPPING_ULEB(128);

                private final long id;
                Opcode(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Opcode> byId = new HashMap<Long, Opcode>(9);
                static {
                    for (Opcode e : Opcode.values())
                        byId.put(e.id(), e);
                }
                public static Opcode byId(long id) { return byId.get(id); }
            }
            public RebaseData() {
                this(null, null, null);
            }

            public RebaseData(KaitaiStream _io) {
                this(_io, null, null);
            }

            public RebaseData(KaitaiStream _io, MachO.DyldInfoCommand _parent) {
                this(_io, _parent, null);
            }

            public RebaseData(KaitaiStream _io, MachO.DyldInfoCommand _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.items = new ArrayList<RebaseItem>();
                {
                    RebaseItem _it;
                    int i = 0;
                    do {
                        RebaseItem _t_items = new RebaseItem(this._io, this, _root);
                        try {
                            _t_items._read();
                        } finally {
                            _it = _t_items;
                            this.items.add(_it);
                        }
                        i++;
                    } while (!(_it.opcode() == Opcode.DONE));
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.items.size() == 0)
                    throw new ConsistencyError("items", 0, this.items.size());
                for (int i = 0; i < this.items.size(); i++) {
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                    {
                        RebaseItem _it = this.items.get(((Number) (i)).intValue());
                        if ((_it.opcode() == Opcode.DONE) != (i == this.items.size() - 1))
                            throw new ConsistencyError("items", i == this.items.size() - 1, _it.opcode() == Opcode.DONE);
                    }
                }
                _dirty = false;
            }
            public static class RebaseItem extends KaitaiStruct.ReadWrite {
                public static RebaseItem fromFile(String fileName) throws IOException {
                    return new RebaseItem(new ByteBufferKaitaiStream(fileName));
                }
                public RebaseItem() {
                    this(null, null, null);
                }

                public RebaseItem(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public RebaseItem(KaitaiStream _io, MachO.DyldInfoCommand.RebaseData _parent) {
                    this(_io, _parent, null);
                }

                public RebaseItem(KaitaiStream _io, MachO.DyldInfoCommand.RebaseData _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.opcodeAndImmediate = this._io.readU1();
                    if ( ((opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES_SKIPPING_ULEB)) ) {
                        this.uleb = new Uleb128(this._io, this, _root);
                        this.uleb._read();
                    }
                    if (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES_SKIPPING_ULEB) {
                        this.skip = new Uleb128(this._io, this, _root);
                        this.skip._read();
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    if ( ((opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES_SKIPPING_ULEB)) ) {
                        this.uleb._fetchInstances();
                    }
                    if (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES_SKIPPING_ULEB) {
                        this.skip._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU1(this.opcodeAndImmediate);
                    if ( ((opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES_SKIPPING_ULEB)) ) {
                        this.uleb._write_Seq(this._io);
                    }
                    if (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES_SKIPPING_ULEB) {
                        this.skip._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if ( ((opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ADD_ADDRESS_ULEB) || (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES_SKIPPING_ULEB)) ) {
                        if (!Objects.equals(this.uleb._root(), _root()))
                            throw new ConsistencyError("uleb", _root(), this.uleb._root());
                        if (!Objects.equals(this.uleb._parent(), this))
                            throw new ConsistencyError("uleb", this, this.uleb._parent());
                    }
                    if (opcode() == MachO.DyldInfoCommand.RebaseData.Opcode.DO_REBASE_ULEB_TIMES_SKIPPING_ULEB) {
                        if (!Objects.equals(this.skip._root(), _root()))
                            throw new ConsistencyError("skip", _root(), this.skip._root());
                        if (!Objects.equals(this.skip._parent(), this))
                            throw new ConsistencyError("skip", this, this.skip._parent());
                    }
                    _dirty = false;
                }
                private Integer immediate;
                public Integer immediate() {
                    if (this.immediate != null)
                        return this.immediate;
                    this.immediate = ((Number) (opcodeAndImmediate() & 15)).intValue();
                    return this.immediate;
                }
                public void _invalidateImmediate() { this.immediate = null; }
                private Opcode opcode;
                public Opcode opcode() {
                    if (this.opcode != null)
                        return this.opcode;
                    this.opcode = MachO.DyldInfoCommand.RebaseData.Opcode.byId(opcodeAndImmediate() & 240);
                    return this.opcode;
                }
                public void _invalidateOpcode() { this.opcode = null; }
                private int opcodeAndImmediate;
                private Uleb128 uleb;
                private Uleb128 skip;
                private MachO _root;
                private MachO.DyldInfoCommand.RebaseData _parent;
                public int opcodeAndImmediate() { return opcodeAndImmediate; }
                public void setOpcodeAndImmediate(int _v) { _dirty = true; opcodeAndImmediate = _v; }
                public Uleb128 uleb() { return uleb; }
                public void setUleb(Uleb128 _v) { _dirty = true; uleb = _v; }
                public Uleb128 skip() { return skip; }
                public void setSkip(Uleb128 _v) { _dirty = true; skip = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.DyldInfoCommand.RebaseData _parent() { return _parent; }
                public void set_parent(MachO.DyldInfoCommand.RebaseData _v) { _dirty = true; _parent = _v; }
            }
            private List<RebaseItem> items;
            private MachO _root;
            private MachO.DyldInfoCommand _parent;
            public List<RebaseItem> items() { return items; }
            public void setItems(List<RebaseItem> _v) { _dirty = true; items = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.DyldInfoCommand _parent() { return _parent; }
            public void set_parent(MachO.DyldInfoCommand _v) { _dirty = true; _parent = _v; }
        }
        private BindData bind;
        private boolean _shouldWriteBind = false;
        private boolean _enabledBind = true;
        public BindData bind() {
            if (_shouldWriteBind)
                _writeBind();
            if (this.bind != null)
                return this.bind;
            if (!_enabledBind)
                return null;
            if (bindSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(bindOff());
                this._raw_bind = io.readBytes(bindSize());
                KaitaiStream _io__raw_bind = new ByteBufferKaitaiStream(this._raw_bind);
                this.bind = new BindData(_io__raw_bind, this, _root);
                this.bind._read();
                io.seek(_pos);
            }
            return this.bind;
        }
        public void setBind(BindData _v) { _dirty = true; bind = _v; }
        public void setBind_Enabled(boolean _v) { _dirty = true; _enabledBind = _v; }

        private void _writeBind() {
            _shouldWriteBind = false;
            if (bindSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(bindOff());
                final KaitaiStream _io__raw_bind = new ByteBufferKaitaiStream(bindSize());
                io.addChildStream(_io__raw_bind);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (bindSize()));
                    final DyldInfoCommand _this = this;
                    _io__raw_bind.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_bind = _io__raw_bind.toByteArray();
                            if (_this._raw_bind.length != bindSize())
                                throw new ConsistencyError("raw(bind)", bindSize(), _this._raw_bind.length);
                            parent.writeBytes(_this._raw_bind);
                        }
                    });
                }
                this.bind._write_Seq(_io__raw_bind);
                io.seek(_pos);
            }
        }
        private ExportNode exports;
        private boolean _shouldWriteExports = false;
        private boolean _enabledExports = true;
        public ExportNode exports() {
            if (_shouldWriteExports)
                _writeExports();
            if (this.exports != null)
                return this.exports;
            if (!_enabledExports)
                return null;
            if (exportSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(exportOff());
                this._raw_exports = io.readBytes(exportSize());
                KaitaiStream _io__raw_exports = new ByteBufferKaitaiStream(this._raw_exports);
                this.exports = new ExportNode(_io__raw_exports, this, _root);
                this.exports._read();
                io.seek(_pos);
            }
            return this.exports;
        }
        public void setExports(ExportNode _v) { _dirty = true; exports = _v; }
        public void setExports_Enabled(boolean _v) { _dirty = true; _enabledExports = _v; }

        private void _writeExports() {
            _shouldWriteExports = false;
            if (exportSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(exportOff());
                final KaitaiStream _io__raw_exports = new ByteBufferKaitaiStream(exportSize());
                io.addChildStream(_io__raw_exports);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (exportSize()));
                    final DyldInfoCommand _this = this;
                    _io__raw_exports.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_exports = _io__raw_exports.toByteArray();
                            if (_this._raw_exports.length != exportSize())
                                throw new ConsistencyError("raw(exports)", exportSize(), _this._raw_exports.length);
                            parent.writeBytes(_this._raw_exports);
                        }
                    });
                }
                this.exports._write_Seq(_io__raw_exports);
                io.seek(_pos);
            }
        }
        private BindData lazyBind;
        private boolean _shouldWriteLazyBind = false;
        private boolean _enabledLazyBind = true;
        public BindData lazyBind() {
            if (_shouldWriteLazyBind)
                _writeLazyBind();
            if (this.lazyBind != null)
                return this.lazyBind;
            if (!_enabledLazyBind)
                return null;
            if (lazyBindSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(lazyBindOff());
                this._raw_lazyBind = io.readBytes(lazyBindSize());
                KaitaiStream _io__raw_lazyBind = new ByteBufferKaitaiStream(this._raw_lazyBind);
                this.lazyBind = new BindData(_io__raw_lazyBind, this, _root);
                this.lazyBind._read();
                io.seek(_pos);
            }
            return this.lazyBind;
        }
        public void setLazyBind(BindData _v) { _dirty = true; lazyBind = _v; }
        public void setLazyBind_Enabled(boolean _v) { _dirty = true; _enabledLazyBind = _v; }

        private void _writeLazyBind() {
            _shouldWriteLazyBind = false;
            if (lazyBindSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(lazyBindOff());
                final KaitaiStream _io__raw_lazyBind = new ByteBufferKaitaiStream(lazyBindSize());
                io.addChildStream(_io__raw_lazyBind);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (lazyBindSize()));
                    final DyldInfoCommand _this = this;
                    _io__raw_lazyBind.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_lazyBind = _io__raw_lazyBind.toByteArray();
                            if (_this._raw_lazyBind.length != lazyBindSize())
                                throw new ConsistencyError("raw(lazy_bind)", lazyBindSize(), _this._raw_lazyBind.length);
                            parent.writeBytes(_this._raw_lazyBind);
                        }
                    });
                }
                this.lazyBind._write_Seq(_io__raw_lazyBind);
                io.seek(_pos);
            }
        }
        private RebaseData rebase;
        private boolean _shouldWriteRebase = false;
        private boolean _enabledRebase = true;
        public RebaseData rebase() {
            if (_shouldWriteRebase)
                _writeRebase();
            if (this.rebase != null)
                return this.rebase;
            if (!_enabledRebase)
                return null;
            if (rebaseSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(rebaseOff());
                this._raw_rebase = io.readBytes(rebaseSize());
                KaitaiStream _io__raw_rebase = new ByteBufferKaitaiStream(this._raw_rebase);
                this.rebase = new RebaseData(_io__raw_rebase, this, _root);
                this.rebase._read();
                io.seek(_pos);
            }
            return this.rebase;
        }
        public void setRebase(RebaseData _v) { _dirty = true; rebase = _v; }
        public void setRebase_Enabled(boolean _v) { _dirty = true; _enabledRebase = _v; }

        private void _writeRebase() {
            _shouldWriteRebase = false;
            if (rebaseSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(rebaseOff());
                final KaitaiStream _io__raw_rebase = new ByteBufferKaitaiStream(rebaseSize());
                io.addChildStream(_io__raw_rebase);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (rebaseSize()));
                    final DyldInfoCommand _this = this;
                    _io__raw_rebase.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_rebase = _io__raw_rebase.toByteArray();
                            if (_this._raw_rebase.length != rebaseSize())
                                throw new ConsistencyError("raw(rebase)", rebaseSize(), _this._raw_rebase.length);
                            parent.writeBytes(_this._raw_rebase);
                        }
                    });
                }
                this.rebase._write_Seq(_io__raw_rebase);
                io.seek(_pos);
            }
        }
        private BindData weakBind;
        private boolean _shouldWriteWeakBind = false;
        private boolean _enabledWeakBind = true;
        public BindData weakBind() {
            if (_shouldWriteWeakBind)
                _writeWeakBind();
            if (this.weakBind != null)
                return this.weakBind;
            if (!_enabledWeakBind)
                return null;
            if (weakBindSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(weakBindOff());
                this._raw_weakBind = io.readBytes(weakBindSize());
                KaitaiStream _io__raw_weakBind = new ByteBufferKaitaiStream(this._raw_weakBind);
                this.weakBind = new BindData(_io__raw_weakBind, this, _root);
                this.weakBind._read();
                io.seek(_pos);
            }
            return this.weakBind;
        }
        public void setWeakBind(BindData _v) { _dirty = true; weakBind = _v; }
        public void setWeakBind_Enabled(boolean _v) { _dirty = true; _enabledWeakBind = _v; }

        private void _writeWeakBind() {
            _shouldWriteWeakBind = false;
            if (weakBindSize() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(weakBindOff());
                final KaitaiStream _io__raw_weakBind = new ByteBufferKaitaiStream(weakBindSize());
                io.addChildStream(_io__raw_weakBind);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (weakBindSize()));
                    final DyldInfoCommand _this = this;
                    _io__raw_weakBind.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_weakBind = _io__raw_weakBind.toByteArray();
                            if (_this._raw_weakBind.length != weakBindSize())
                                throw new ConsistencyError("raw(weak_bind)", weakBindSize(), _this._raw_weakBind.length);
                            parent.writeBytes(_this._raw_weakBind);
                        }
                    });
                }
                this.weakBind._write_Seq(_io__raw_weakBind);
                io.seek(_pos);
            }
        }
        private long rebaseOff;
        private long rebaseSize;
        private long bindOff;
        private long bindSize;
        private long weakBindOff;
        private long weakBindSize;
        private long lazyBindOff;
        private long lazyBindSize;
        private long exportOff;
        private long exportSize;
        private MachO _root;
        private MachO.LoadCommand _parent;
        private byte[] _raw_bind;
        private byte[] _raw_exports;
        private byte[] _raw_lazyBind;
        private byte[] _raw_rebase;
        private byte[] _raw_weakBind;
        public long rebaseOff() { return rebaseOff; }
        public void setRebaseOff(long _v) { _dirty = true; rebaseOff = _v; }
        public long rebaseSize() { return rebaseSize; }
        public void setRebaseSize(long _v) { _dirty = true; rebaseSize = _v; }
        public long bindOff() { return bindOff; }
        public void setBindOff(long _v) { _dirty = true; bindOff = _v; }
        public long bindSize() { return bindSize; }
        public void setBindSize(long _v) { _dirty = true; bindSize = _v; }
        public long weakBindOff() { return weakBindOff; }
        public void setWeakBindOff(long _v) { _dirty = true; weakBindOff = _v; }
        public long weakBindSize() { return weakBindSize; }
        public void setWeakBindSize(long _v) { _dirty = true; weakBindSize = _v; }
        public long lazyBindOff() { return lazyBindOff; }
        public void setLazyBindOff(long _v) { _dirty = true; lazyBindOff = _v; }
        public long lazyBindSize() { return lazyBindSize; }
        public void setLazyBindSize(long _v) { _dirty = true; lazyBindSize = _v; }
        public long exportOff() { return exportOff; }
        public void setExportOff(long _v) { _dirty = true; exportOff = _v; }
        public long exportSize() { return exportSize; }
        public void setExportSize(long _v) { _dirty = true; exportSize = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_bind() { return _raw_bind; }
        public void set_raw_Bind(byte[] _v) { _dirty = true; _raw_bind = _v; }
        public byte[] _raw_exports() { return _raw_exports; }
        public void set_raw_Exports(byte[] _v) { _dirty = true; _raw_exports = _v; }
        public byte[] _raw_lazyBind() { return _raw_lazyBind; }
        public void set_raw_LazyBind(byte[] _v) { _dirty = true; _raw_lazyBind = _v; }
        public byte[] _raw_rebase() { return _raw_rebase; }
        public void set_raw_Rebase(byte[] _v) { _dirty = true; _raw_rebase = _v; }
        public byte[] _raw_weakBind() { return _raw_weakBind; }
        public void set_raw_WeakBind(byte[] _v) { _dirty = true; _raw_weakBind = _v; }
    }
    public static class DylibCommand extends KaitaiStruct.ReadWrite {
        public static DylibCommand fromFile(String fileName) throws IOException {
            return new DylibCommand(new ByteBufferKaitaiStream(fileName));
        }
        public DylibCommand() {
            this(null, null, null);
        }

        public DylibCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DylibCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public DylibCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.nameOffset = this._io.readU4le();
            this.timestamp = this._io.readU4le();
            this.currentVersion = this._io.readU4le();
            this.compatibilityVersion = this._io.readU4le();
            this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.nameOffset);
            this._io.writeU4le(this.timestamp);
            this._io.writeU4le(this.currentVersion);
            this._io.writeU4le(this.compatibilityVersion);
            this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private long nameOffset;
        private long timestamp;
        private long currentVersion;
        private long compatibilityVersion;
        private String name;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long nameOffset() { return nameOffset; }
        public void setNameOffset(long _v) { _dirty = true; nameOffset = _v; }
        public long timestamp() { return timestamp; }
        public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
        public long currentVersion() { return currentVersion; }
        public void setCurrentVersion(long _v) { _dirty = true; currentVersion = _v; }
        public long compatibilityVersion() { return compatibilityVersion; }
        public void setCompatibilityVersion(long _v) { _dirty = true; compatibilityVersion = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class DylinkerCommand extends KaitaiStruct.ReadWrite {
        public static DylinkerCommand fromFile(String fileName) throws IOException {
            return new DylinkerCommand(new ByteBufferKaitaiStream(fileName));
        }
        public DylinkerCommand() {
            this(null, null, null);
        }

        public DylinkerCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DylinkerCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public DylinkerCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new LcStr(this._io, this, _root);
            this.name._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.name._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            _dirty = false;
        }
        private LcStr name;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public LcStr name() { return name; }
        public void setName(LcStr _v) { _dirty = true; name = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class DysymtabCommand extends KaitaiStruct.ReadWrite {
        public static DysymtabCommand fromFile(String fileName) throws IOException {
            return new DysymtabCommand(new ByteBufferKaitaiStream(fileName));
        }
        public DysymtabCommand() {
            this(null, null, null);
        }

        public DysymtabCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DysymtabCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public DysymtabCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.iLocalSym = this._io.readU4le();
            this.nLocalSym = this._io.readU4le();
            this.iExtDefSym = this._io.readU4le();
            this.nExtDefSym = this._io.readU4le();
            this.iUndefSym = this._io.readU4le();
            this.nUndefSym = this._io.readU4le();
            this.tocOff = this._io.readU4le();
            this.nToc = this._io.readU4le();
            this.modTabOff = this._io.readU4le();
            this.nModTab = this._io.readU4le();
            this.extRefSymOff = this._io.readU4le();
            this.nExtRefSyms = this._io.readU4le();
            this.indirectSymOff = this._io.readU4le();
            this.nIndirectSyms = this._io.readU4le();
            this.extRelOff = this._io.readU4le();
            this.nExtRel = this._io.readU4le();
            this.locRelOff = this._io.readU4le();
            this.nLocRel = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            indirectSymbols();
            if (this.indirectSymbols != null) {
                for (int i = 0; i < this.indirectSymbols.size(); i++) {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteIndirectSymbols = _enabledIndirectSymbols;
            this._io.writeU4le(this.iLocalSym);
            this._io.writeU4le(this.nLocalSym);
            this._io.writeU4le(this.iExtDefSym);
            this._io.writeU4le(this.nExtDefSym);
            this._io.writeU4le(this.iUndefSym);
            this._io.writeU4le(this.nUndefSym);
            this._io.writeU4le(this.tocOff);
            this._io.writeU4le(this.nToc);
            this._io.writeU4le(this.modTabOff);
            this._io.writeU4le(this.nModTab);
            this._io.writeU4le(this.extRefSymOff);
            this._io.writeU4le(this.nExtRefSyms);
            this._io.writeU4le(this.indirectSymOff);
            this._io.writeU4le(this.nIndirectSyms);
            this._io.writeU4le(this.extRelOff);
            this._io.writeU4le(this.nExtRel);
            this._io.writeU4le(this.locRelOff);
            this._io.writeU4le(this.nLocRel);
        }

        public void _check() {
            if (_enabledIndirectSymbols) {
                if (this.indirectSymbols.size() != nIndirectSyms())
                    throw new ConsistencyError("indirect_symbols", nIndirectSyms(), this.indirectSymbols.size());
                for (int i = 0; i < this.indirectSymbols.size(); i++) {
                }
            }
            _dirty = false;
        }
        private List<Long> indirectSymbols;
        private boolean _shouldWriteIndirectSymbols = false;
        private boolean _enabledIndirectSymbols = true;
        public List<Long> indirectSymbols() {
            if (_shouldWriteIndirectSymbols)
                _writeIndirectSymbols();
            if (this.indirectSymbols != null)
                return this.indirectSymbols;
            if (!_enabledIndirectSymbols)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(indirectSymOff());
            this.indirectSymbols = new ArrayList<Long>();
            for (int i = 0; i < nIndirectSyms(); i++) {
                this.indirectSymbols.add(io.readU4le());
            }
            io.seek(_pos);
            return this.indirectSymbols;
        }
        public void setIndirectSymbols(List<Long> _v) { _dirty = true; indirectSymbols = _v; }
        public void setIndirectSymbols_Enabled(boolean _v) { _dirty = true; _enabledIndirectSymbols = _v; }

        private void _writeIndirectSymbols() {
            _shouldWriteIndirectSymbols = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(indirectSymOff());
            for (int i = 0; i < this.indirectSymbols.size(); i++) {
                io.writeU4le(this.indirectSymbols.get(((Number) (i)).intValue()));
            }
            io.seek(_pos);
        }
        private long iLocalSym;
        private long nLocalSym;
        private long iExtDefSym;
        private long nExtDefSym;
        private long iUndefSym;
        private long nUndefSym;
        private long tocOff;
        private long nToc;
        private long modTabOff;
        private long nModTab;
        private long extRefSymOff;
        private long nExtRefSyms;
        private long indirectSymOff;
        private long nIndirectSyms;
        private long extRelOff;
        private long nExtRel;
        private long locRelOff;
        private long nLocRel;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long iLocalSym() { return iLocalSym; }
        public void setILocalSym(long _v) { _dirty = true; iLocalSym = _v; }
        public long nLocalSym() { return nLocalSym; }
        public void setNLocalSym(long _v) { _dirty = true; nLocalSym = _v; }
        public long iExtDefSym() { return iExtDefSym; }
        public void setIExtDefSym(long _v) { _dirty = true; iExtDefSym = _v; }
        public long nExtDefSym() { return nExtDefSym; }
        public void setNExtDefSym(long _v) { _dirty = true; nExtDefSym = _v; }
        public long iUndefSym() { return iUndefSym; }
        public void setIUndefSym(long _v) { _dirty = true; iUndefSym = _v; }
        public long nUndefSym() { return nUndefSym; }
        public void setNUndefSym(long _v) { _dirty = true; nUndefSym = _v; }
        public long tocOff() { return tocOff; }
        public void setTocOff(long _v) { _dirty = true; tocOff = _v; }
        public long nToc() { return nToc; }
        public void setNToc(long _v) { _dirty = true; nToc = _v; }
        public long modTabOff() { return modTabOff; }
        public void setModTabOff(long _v) { _dirty = true; modTabOff = _v; }
        public long nModTab() { return nModTab; }
        public void setNModTab(long _v) { _dirty = true; nModTab = _v; }
        public long extRefSymOff() { return extRefSymOff; }
        public void setExtRefSymOff(long _v) { _dirty = true; extRefSymOff = _v; }
        public long nExtRefSyms() { return nExtRefSyms; }
        public void setNExtRefSyms(long _v) { _dirty = true; nExtRefSyms = _v; }
        public long indirectSymOff() { return indirectSymOff; }
        public void setIndirectSymOff(long _v) { _dirty = true; indirectSymOff = _v; }
        public long nIndirectSyms() { return nIndirectSyms; }
        public void setNIndirectSyms(long _v) { _dirty = true; nIndirectSyms = _v; }
        public long extRelOff() { return extRelOff; }
        public void setExtRelOff(long _v) { _dirty = true; extRelOff = _v; }
        public long nExtRel() { return nExtRel; }
        public void setNExtRel(long _v) { _dirty = true; nExtRel = _v; }
        public long locRelOff() { return locRelOff; }
        public void setLocRelOff(long _v) { _dirty = true; locRelOff = _v; }
        public long nLocRel() { return nLocRel; }
        public void setNLocRel(long _v) { _dirty = true; nLocRel = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class EncryptionInfoCommand extends KaitaiStruct.ReadWrite {
        public static EncryptionInfoCommand fromFile(String fileName) throws IOException {
            return new EncryptionInfoCommand(new ByteBufferKaitaiStream(fileName));
        }
        public EncryptionInfoCommand() {
            this(null, null, null);
        }

        public EncryptionInfoCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncryptionInfoCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public EncryptionInfoCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.cryptoff = this._io.readU4le();
            this.cryptsize = this._io.readU4le();
            this.cryptid = this._io.readU4le();
            if ( ((_root().magic() == MachO.MagicType.MACHO_BE_X64) || (_root().magic() == MachO.MagicType.MACHO_LE_X64)) ) {
                this.pad = this._io.readU4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if ( ((_root().magic() == MachO.MagicType.MACHO_BE_X64) || (_root().magic() == MachO.MagicType.MACHO_LE_X64)) ) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.cryptoff);
            this._io.writeU4le(this.cryptsize);
            this._io.writeU4le(this.cryptid);
            if ( ((_root().magic() == MachO.MagicType.MACHO_BE_X64) || (_root().magic() == MachO.MagicType.MACHO_LE_X64)) ) {
                this._io.writeU4le(this.pad);
            }
        }

        public void _check() {
            if ( ((_root().magic() == MachO.MagicType.MACHO_BE_X64) || (_root().magic() == MachO.MagicType.MACHO_LE_X64)) ) {
            }
            _dirty = false;
        }
        private long cryptoff;
        private long cryptsize;
        private long cryptid;
        private Long pad;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long cryptoff() { return cryptoff; }
        public void setCryptoff(long _v) { _dirty = true; cryptoff = _v; }
        public long cryptsize() { return cryptsize; }
        public void setCryptsize(long _v) { _dirty = true; cryptsize = _v; }
        public long cryptid() { return cryptid; }
        public void setCryptid(long _v) { _dirty = true; cryptid = _v; }
        public Long pad() { return pad; }
        public void setPad(Long _v) { _dirty = true; pad = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class EntryPointCommand extends KaitaiStruct.ReadWrite {
        public static EntryPointCommand fromFile(String fileName) throws IOException {
            return new EntryPointCommand(new ByteBufferKaitaiStream(fileName));
        }
        public EntryPointCommand() {
            this(null, null, null);
        }

        public EntryPointCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EntryPointCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public EntryPointCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entryOff = this._io.readU8le();
            this.stackSize = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.entryOff);
            this._io.writeU8le(this.stackSize);
        }

        public void _check() {
            _dirty = false;
        }
        private long entryOff;
        private long stackSize;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long entryOff() { return entryOff; }
        public void setEntryOff(long _v) { _dirty = true; entryOff = _v; }
        public long stackSize() { return stackSize; }
        public void setStackSize(long _v) { _dirty = true; stackSize = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class LcStr extends KaitaiStruct.ReadWrite {
        public static LcStr fromFile(String fileName) throws IOException {
            return new LcStr(new ByteBufferKaitaiStream(fileName));
        }
        public LcStr() {
            this(null, null, null);
        }

        public LcStr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LcStr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public LcStr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.length = this._io.readU4le();
            this.value = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.length);
            this._io.writeBytes((this.value).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.value).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("value", -1, KaitaiStream.byteArrayIndexOf((this.value).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private long length;
        private String value;
        private MachO _root;
        private KaitaiStruct.ReadWrite _parent;
        public long length() { return length; }
        public void setLength(long _v) { _dirty = true; length = _v; }
        public String value() { return value; }
        public void setValue(String _v) { _dirty = true; value = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class LinkeditDataCommand extends KaitaiStruct.ReadWrite {
        public static LinkeditDataCommand fromFile(String fileName) throws IOException {
            return new LinkeditDataCommand(new ByteBufferKaitaiStream(fileName));
        }
        public LinkeditDataCommand() {
            this(null, null, null);
        }

        public LinkeditDataCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LinkeditDataCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public LinkeditDataCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.dataOff = this._io.readU4le();
            this.dataSize = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.dataOff);
            this._io.writeU4le(this.dataSize);
        }

        public void _check() {
            _dirty = false;
        }
        private long dataOff;
        private long dataSize;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long dataOff() { return dataOff; }
        public void setDataOff(long _v) { _dirty = true; dataOff = _v; }
        public long dataSize() { return dataSize; }
        public void setDataSize(long _v) { _dirty = true; dataSize = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class LinkerOptionCommand extends KaitaiStruct.ReadWrite {
        public static LinkerOptionCommand fromFile(String fileName) throws IOException {
            return new LinkerOptionCommand(new ByteBufferKaitaiStream(fileName));
        }
        public LinkerOptionCommand() {
            this(null, null, null);
        }

        public LinkerOptionCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LinkerOptionCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public LinkerOptionCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numStrings = this._io.readU4le();
            this.strings = new ArrayList<String>();
            for (int i = 0; i < numStrings(); i++) {
                this.strings.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.strings.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numStrings);
            for (int i = 0; i < this.strings.size(); i++) {
                this._io.writeBytes((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(0);
            }
        }

        public void _check() {
            if (this.strings.size() != numStrings())
                throw new ConsistencyError("strings", numStrings(), this.strings.size());
            for (int i = 0; i < this.strings.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("strings", -1, KaitaiStream.byteArrayIndexOf((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            }
            _dirty = false;
        }
        private long numStrings;
        private List<String> strings;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long numStrings() { return numStrings; }
        public void setNumStrings(long _v) { _dirty = true; numStrings = _v; }
        public List<String> strings() { return strings; }
        public void setStrings(List<String> _v) { _dirty = true; strings = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class LoadCommand extends KaitaiStruct.ReadWrite {
        public static LoadCommand fromFile(String fileName) throws IOException {
            return new LoadCommand(new ByteBufferKaitaiStream(fileName));
        }
        public LoadCommand() {
            this(null, null, null);
        }

        public LoadCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LoadCommand(KaitaiStream _io, MachO _parent) {
            this(_io, _parent, null);
        }

        public LoadCommand(KaitaiStream _io, MachO _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.type = MachO.LoadCommandType.byId(this._io.readU4le());
            this.size = this._io.readU4le();
            {
                LoadCommandType on = type();
                if (on != null) {
                    switch (type()) {
                    case BUILD_VERSION: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new BuildVersionCommand(_io__raw_body, this, _root);
                        ((BuildVersionCommand) (this.body))._read();
                        break;
                    }
                    case CODE_SIGNATURE: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new CodeSignatureCommand(_io__raw_body, this, _root);
                        ((CodeSignatureCommand) (this.body))._read();
                        break;
                    }
                    case DATA_IN_CODE: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new LinkeditDataCommand(_io__raw_body, this, _root);
                        ((LinkeditDataCommand) (this.body))._read();
                        break;
                    }
                    case DYLD_ENVIRONMENT: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylinkerCommand(_io__raw_body, this, _root);
                        ((DylinkerCommand) (this.body))._read();
                        break;
                    }
                    case DYLD_INFO: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DyldInfoCommand(_io__raw_body, this, _root);
                        ((DyldInfoCommand) (this.body))._read();
                        break;
                    }
                    case DYLD_INFO_ONLY: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DyldInfoCommand(_io__raw_body, this, _root);
                        ((DyldInfoCommand) (this.body))._read();
                        break;
                    }
                    case DYLIB_CODE_SIGN_DRS: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new LinkeditDataCommand(_io__raw_body, this, _root);
                        ((LinkeditDataCommand) (this.body))._read();
                        break;
                    }
                    case DYSYMTAB: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DysymtabCommand(_io__raw_body, this, _root);
                        ((DysymtabCommand) (this.body))._read();
                        break;
                    }
                    case ENCRYPTION_INFO: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new EncryptionInfoCommand(_io__raw_body, this, _root);
                        ((EncryptionInfoCommand) (this.body))._read();
                        break;
                    }
                    case ENCRYPTION_INFO_64: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new EncryptionInfoCommand(_io__raw_body, this, _root);
                        ((EncryptionInfoCommand) (this.body))._read();
                        break;
                    }
                    case FUNCTION_STARTS: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new LinkeditDataCommand(_io__raw_body, this, _root);
                        ((LinkeditDataCommand) (this.body))._read();
                        break;
                    }
                    case ID_DYLIB: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylibCommand(_io__raw_body, this, _root);
                        ((DylibCommand) (this.body))._read();
                        break;
                    }
                    case ID_DYLINKER: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylinkerCommand(_io__raw_body, this, _root);
                        ((DylinkerCommand) (this.body))._read();
                        break;
                    }
                    case LAZY_LOAD_DYLIB: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylibCommand(_io__raw_body, this, _root);
                        ((DylibCommand) (this.body))._read();
                        break;
                    }
                    case LINKER_OPTIMIZATION_HINT: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new LinkeditDataCommand(_io__raw_body, this, _root);
                        ((LinkeditDataCommand) (this.body))._read();
                        break;
                    }
                    case LINKER_OPTION: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new LinkerOptionCommand(_io__raw_body, this, _root);
                        ((LinkerOptionCommand) (this.body))._read();
                        break;
                    }
                    case LOAD_DYLIB: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylibCommand(_io__raw_body, this, _root);
                        ((DylibCommand) (this.body))._read();
                        break;
                    }
                    case LOAD_DYLINKER: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylinkerCommand(_io__raw_body, this, _root);
                        ((DylinkerCommand) (this.body))._read();
                        break;
                    }
                    case LOAD_UPWARD_DYLIB: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylibCommand(_io__raw_body, this, _root);
                        ((DylibCommand) (this.body))._read();
                        break;
                    }
                    case LOAD_WEAK_DYLIB: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylibCommand(_io__raw_body, this, _root);
                        ((DylibCommand) (this.body))._read();
                        break;
                    }
                    case MAIN: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new EntryPointCommand(_io__raw_body, this, _root);
                        ((EntryPointCommand) (this.body))._read();
                        break;
                    }
                    case REEXPORT_DYLIB: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DylibCommand(_io__raw_body, this, _root);
                        ((DylibCommand) (this.body))._read();
                        break;
                    }
                    case ROUTINES: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new RoutinesCommand(_io__raw_body, this, _root);
                        ((RoutinesCommand) (this.body))._read();
                        break;
                    }
                    case ROUTINES_64: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new RoutinesCommand64(_io__raw_body, this, _root);
                        ((RoutinesCommand64) (this.body))._read();
                        break;
                    }
                    case RPATH: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new RpathCommand(_io__raw_body, this, _root);
                        ((RpathCommand) (this.body))._read();
                        break;
                    }
                    case SEGMENT: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SegmentCommand(_io__raw_body, this, _root);
                        ((SegmentCommand) (this.body))._read();
                        break;
                    }
                    case SEGMENT_64: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SegmentCommand64(_io__raw_body, this, _root);
                        ((SegmentCommand64) (this.body))._read();
                        break;
                    }
                    case SEGMENT_SPLIT_INFO: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new LinkeditDataCommand(_io__raw_body, this, _root);
                        ((LinkeditDataCommand) (this.body))._read();
                        break;
                    }
                    case SOURCE_VERSION: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SourceVersionCommand(_io__raw_body, this, _root);
                        ((SourceVersionCommand) (this.body))._read();
                        break;
                    }
                    case SUB_CLIENT: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SubCommand(_io__raw_body, this, _root);
                        ((SubCommand) (this.body))._read();
                        break;
                    }
                    case SUB_FRAMEWORK: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SubCommand(_io__raw_body, this, _root);
                        ((SubCommand) (this.body))._read();
                        break;
                    }
                    case SUB_LIBRARY: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SubCommand(_io__raw_body, this, _root);
                        ((SubCommand) (this.body))._read();
                        break;
                    }
                    case SUB_UMBRELLA: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SubCommand(_io__raw_body, this, _root);
                        ((SubCommand) (this.body))._read();
                        break;
                    }
                    case SYMTAB: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SymtabCommand(_io__raw_body, this, _root);
                        ((SymtabCommand) (this.body))._read();
                        break;
                    }
                    case TWOLEVEL_HINTS: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new TwolevelHintsCommand(_io__raw_body, this, _root);
                        ((TwolevelHintsCommand) (this.body))._read();
                        break;
                    }
                    case UUID: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new UuidCommand(_io__raw_body, this, _root);
                        ((UuidCommand) (this.body))._read();
                        break;
                    }
                    case VERSION_MIN_IPHONEOS: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new VersionMinCommand(_io__raw_body, this, _root);
                        ((VersionMinCommand) (this.body))._read();
                        break;
                    }
                    case VERSION_MIN_MACOSX: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new VersionMinCommand(_io__raw_body, this, _root);
                        ((VersionMinCommand) (this.body))._read();
                        break;
                    }
                    case VERSION_MIN_TVOS: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new VersionMinCommand(_io__raw_body, this, _root);
                        ((VersionMinCommand) (this.body))._read();
                        break;
                    }
                    case VERSION_MIN_WATCHOS: {
                        this._raw_body = this._io.readBytes(size() - 8);
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new VersionMinCommand(_io__raw_body, this, _root);
                        ((VersionMinCommand) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(size() - 8);
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(size() - 8);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                LoadCommandType on = type();
                if (on != null) {
                    switch (type()) {
                    case BUILD_VERSION: {
                        ((BuildVersionCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case CODE_SIGNATURE: {
                        ((CodeSignatureCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case DATA_IN_CODE: {
                        ((LinkeditDataCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case DYLD_ENVIRONMENT: {
                        ((DylinkerCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case DYLD_INFO: {
                        ((DyldInfoCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case DYLD_INFO_ONLY: {
                        ((DyldInfoCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case DYLIB_CODE_SIGN_DRS: {
                        ((LinkeditDataCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case DYSYMTAB: {
                        ((DysymtabCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case ENCRYPTION_INFO: {
                        ((EncryptionInfoCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case ENCRYPTION_INFO_64: {
                        ((EncryptionInfoCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case FUNCTION_STARTS: {
                        ((LinkeditDataCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case ID_DYLIB: {
                        ((DylibCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case ID_DYLINKER: {
                        ((DylinkerCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case LAZY_LOAD_DYLIB: {
                        ((DylibCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case LINKER_OPTIMIZATION_HINT: {
                        ((LinkeditDataCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case LINKER_OPTION: {
                        ((LinkerOptionCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case LOAD_DYLIB: {
                        ((DylibCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case LOAD_DYLINKER: {
                        ((DylinkerCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case LOAD_UPWARD_DYLIB: {
                        ((DylibCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case LOAD_WEAK_DYLIB: {
                        ((DylibCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case MAIN: {
                        ((EntryPointCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case REEXPORT_DYLIB: {
                        ((DylibCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case ROUTINES: {
                        ((RoutinesCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case ROUTINES_64: {
                        ((RoutinesCommand64) (this.body))._fetchInstances();
                        break;
                    }
                    case RPATH: {
                        ((RpathCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case SEGMENT: {
                        ((SegmentCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case SEGMENT_64: {
                        ((SegmentCommand64) (this.body))._fetchInstances();
                        break;
                    }
                    case SEGMENT_SPLIT_INFO: {
                        ((LinkeditDataCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case SOURCE_VERSION: {
                        ((SourceVersionCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case SUB_CLIENT: {
                        ((SubCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case SUB_FRAMEWORK: {
                        ((SubCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case SUB_LIBRARY: {
                        ((SubCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case SUB_UMBRELLA: {
                        ((SubCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case SYMTAB: {
                        ((SymtabCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case TWOLEVEL_HINTS: {
                        ((TwolevelHintsCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case UUID: {
                        ((UuidCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case VERSION_MIN_IPHONEOS: {
                        ((VersionMinCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case VERSION_MIN_MACOSX: {
                        ((VersionMinCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case VERSION_MIN_TVOS: {
                        ((VersionMinCommand) (this.body))._fetchInstances();
                        break;
                    }
                    case VERSION_MIN_WATCHOS: {
                        ((VersionMinCommand) (this.body))._fetchInstances();
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(((Number) (this.type.id())).longValue());
            this._io.writeU4le(this.size);
            {
                LoadCommandType on = type();
                if (on != null) {
                    switch (type()) {
                    case BUILD_VERSION: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((BuildVersionCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case CODE_SIGNATURE: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((CodeSignatureCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DATA_IN_CODE: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((LinkeditDataCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DYLD_ENVIRONMENT: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylinkerCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DYLD_INFO: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DyldInfoCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DYLD_INFO_ONLY: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DyldInfoCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DYLIB_CODE_SIGN_DRS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((LinkeditDataCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DYSYMTAB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DysymtabCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case ENCRYPTION_INFO: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((EncryptionInfoCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case ENCRYPTION_INFO_64: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((EncryptionInfoCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case FUNCTION_STARTS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((LinkeditDataCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case ID_DYLIB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylibCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case ID_DYLINKER: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylinkerCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case LAZY_LOAD_DYLIB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylibCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case LINKER_OPTIMIZATION_HINT: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((LinkeditDataCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case LINKER_OPTION: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((LinkerOptionCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case LOAD_DYLIB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylibCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case LOAD_DYLINKER: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylinkerCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case LOAD_UPWARD_DYLIB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylibCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case LOAD_WEAK_DYLIB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylibCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case MAIN: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((EntryPointCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case REEXPORT_DYLIB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DylibCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case ROUTINES: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((RoutinesCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case ROUTINES_64: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((RoutinesCommand64) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case RPATH: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((RpathCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SEGMENT: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SegmentCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SEGMENT_64: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SegmentCommand64) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SEGMENT_SPLIT_INFO: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((LinkeditDataCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SOURCE_VERSION: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SourceVersionCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SUB_CLIENT: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SubCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SUB_FRAMEWORK: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SubCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SUB_LIBRARY: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SubCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SUB_UMBRELLA: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SubCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SYMTAB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SymtabCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case TWOLEVEL_HINTS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((TwolevelHintsCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case UUID: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((UuidCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case VERSION_MIN_IPHONEOS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((VersionMinCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case VERSION_MIN_MACOSX: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((VersionMinCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case VERSION_MIN_TVOS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((VersionMinCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case VERSION_MIN_WATCHOS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size() - 8);
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (size() - 8));
                            final LoadCommand _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != size() - 8)
                                        throw new ConsistencyError("raw(body)", size() - 8, ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((VersionMinCommand) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                }
            }
        }

        public void _check() {
            {
                LoadCommandType on = type();
                if (on != null) {
                    switch (type()) {
                    case BUILD_VERSION: {
                        if (!Objects.equals(((MachO.BuildVersionCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.BuildVersionCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.BuildVersionCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.BuildVersionCommand) (this.body))._parent());
                        break;
                    }
                    case CODE_SIGNATURE: {
                        if (!Objects.equals(((MachO.CodeSignatureCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.CodeSignatureCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.CodeSignatureCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.CodeSignatureCommand) (this.body))._parent());
                        break;
                    }
                    case DATA_IN_CODE: {
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.LinkeditDataCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.LinkeditDataCommand) (this.body))._parent());
                        break;
                    }
                    case DYLD_ENVIRONMENT: {
                        if (!Objects.equals(((MachO.DylinkerCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylinkerCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylinkerCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylinkerCommand) (this.body))._parent());
                        break;
                    }
                    case DYLD_INFO: {
                        if (!Objects.equals(((MachO.DyldInfoCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DyldInfoCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DyldInfoCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DyldInfoCommand) (this.body))._parent());
                        break;
                    }
                    case DYLD_INFO_ONLY: {
                        if (!Objects.equals(((MachO.DyldInfoCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DyldInfoCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DyldInfoCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DyldInfoCommand) (this.body))._parent());
                        break;
                    }
                    case DYLIB_CODE_SIGN_DRS: {
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.LinkeditDataCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.LinkeditDataCommand) (this.body))._parent());
                        break;
                    }
                    case DYSYMTAB: {
                        if (!Objects.equals(((MachO.DysymtabCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DysymtabCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DysymtabCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DysymtabCommand) (this.body))._parent());
                        break;
                    }
                    case ENCRYPTION_INFO: {
                        if (!Objects.equals(((MachO.EncryptionInfoCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.EncryptionInfoCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.EncryptionInfoCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.EncryptionInfoCommand) (this.body))._parent());
                        break;
                    }
                    case ENCRYPTION_INFO_64: {
                        if (!Objects.equals(((MachO.EncryptionInfoCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.EncryptionInfoCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.EncryptionInfoCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.EncryptionInfoCommand) (this.body))._parent());
                        break;
                    }
                    case FUNCTION_STARTS: {
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.LinkeditDataCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.LinkeditDataCommand) (this.body))._parent());
                        break;
                    }
                    case ID_DYLIB: {
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylibCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylibCommand) (this.body))._parent());
                        break;
                    }
                    case ID_DYLINKER: {
                        if (!Objects.equals(((MachO.DylinkerCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylinkerCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylinkerCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylinkerCommand) (this.body))._parent());
                        break;
                    }
                    case LAZY_LOAD_DYLIB: {
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylibCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylibCommand) (this.body))._parent());
                        break;
                    }
                    case LINKER_OPTIMIZATION_HINT: {
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.LinkeditDataCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.LinkeditDataCommand) (this.body))._parent());
                        break;
                    }
                    case LINKER_OPTION: {
                        if (!Objects.equals(((MachO.LinkerOptionCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.LinkerOptionCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.LinkerOptionCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.LinkerOptionCommand) (this.body))._parent());
                        break;
                    }
                    case LOAD_DYLIB: {
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylibCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylibCommand) (this.body))._parent());
                        break;
                    }
                    case LOAD_DYLINKER: {
                        if (!Objects.equals(((MachO.DylinkerCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylinkerCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylinkerCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylinkerCommand) (this.body))._parent());
                        break;
                    }
                    case LOAD_UPWARD_DYLIB: {
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylibCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylibCommand) (this.body))._parent());
                        break;
                    }
                    case LOAD_WEAK_DYLIB: {
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylibCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylibCommand) (this.body))._parent());
                        break;
                    }
                    case MAIN: {
                        if (!Objects.equals(((MachO.EntryPointCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.EntryPointCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.EntryPointCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.EntryPointCommand) (this.body))._parent());
                        break;
                    }
                    case REEXPORT_DYLIB: {
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.DylibCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.DylibCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.DylibCommand) (this.body))._parent());
                        break;
                    }
                    case ROUTINES: {
                        if (!Objects.equals(((MachO.RoutinesCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.RoutinesCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.RoutinesCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.RoutinesCommand) (this.body))._parent());
                        break;
                    }
                    case ROUTINES_64: {
                        if (!Objects.equals(((MachO.RoutinesCommand64) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.RoutinesCommand64) (this.body))._root());
                        if (!Objects.equals(((MachO.RoutinesCommand64) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.RoutinesCommand64) (this.body))._parent());
                        break;
                    }
                    case RPATH: {
                        if (!Objects.equals(((MachO.RpathCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.RpathCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.RpathCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.RpathCommand) (this.body))._parent());
                        break;
                    }
                    case SEGMENT: {
                        if (!Objects.equals(((MachO.SegmentCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.SegmentCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.SegmentCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.SegmentCommand) (this.body))._parent());
                        break;
                    }
                    case SEGMENT_64: {
                        if (!Objects.equals(((MachO.SegmentCommand64) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.SegmentCommand64) (this.body))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.SegmentCommand64) (this.body))._parent());
                        break;
                    }
                    case SEGMENT_SPLIT_INFO: {
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.LinkeditDataCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.LinkeditDataCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.LinkeditDataCommand) (this.body))._parent());
                        break;
                    }
                    case SOURCE_VERSION: {
                        if (!Objects.equals(((MachO.SourceVersionCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.SourceVersionCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.SourceVersionCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.SourceVersionCommand) (this.body))._parent());
                        break;
                    }
                    case SUB_CLIENT: {
                        if (!Objects.equals(((MachO.SubCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.SubCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.SubCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.SubCommand) (this.body))._parent());
                        break;
                    }
                    case SUB_FRAMEWORK: {
                        if (!Objects.equals(((MachO.SubCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.SubCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.SubCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.SubCommand) (this.body))._parent());
                        break;
                    }
                    case SUB_LIBRARY: {
                        if (!Objects.equals(((MachO.SubCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.SubCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.SubCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.SubCommand) (this.body))._parent());
                        break;
                    }
                    case SUB_UMBRELLA: {
                        if (!Objects.equals(((MachO.SubCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.SubCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.SubCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.SubCommand) (this.body))._parent());
                        break;
                    }
                    case SYMTAB: {
                        if (!Objects.equals(((MachO.SymtabCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.SymtabCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.SymtabCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.SymtabCommand) (this.body))._parent());
                        break;
                    }
                    case TWOLEVEL_HINTS: {
                        if (!Objects.equals(((MachO.TwolevelHintsCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.TwolevelHintsCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.TwolevelHintsCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.TwolevelHintsCommand) (this.body))._parent());
                        break;
                    }
                    case UUID: {
                        if (!Objects.equals(((MachO.UuidCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.UuidCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.UuidCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.UuidCommand) (this.body))._parent());
                        break;
                    }
                    case VERSION_MIN_IPHONEOS: {
                        if (!Objects.equals(((MachO.VersionMinCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.VersionMinCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.VersionMinCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.VersionMinCommand) (this.body))._parent());
                        break;
                    }
                    case VERSION_MIN_MACOSX: {
                        if (!Objects.equals(((MachO.VersionMinCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.VersionMinCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.VersionMinCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.VersionMinCommand) (this.body))._parent());
                        break;
                    }
                    case VERSION_MIN_TVOS: {
                        if (!Objects.equals(((MachO.VersionMinCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.VersionMinCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.VersionMinCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.VersionMinCommand) (this.body))._parent());
                        break;
                    }
                    case VERSION_MIN_WATCHOS: {
                        if (!Objects.equals(((MachO.VersionMinCommand) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((MachO.VersionMinCommand) (this.body))._root());
                        if (!Objects.equals(((MachO.VersionMinCommand) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((MachO.VersionMinCommand) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != size() - 8)
                            throw new ConsistencyError("body", size() - 8, ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != size() - 8)
                        throw new ConsistencyError("body", size() - 8, ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
        }
        private LoadCommandType type;
        private long size;
        private Object body;
        private MachO _root;
        private MachO _parent;
        private byte[] _raw_body;
        public LoadCommandType type() { return type; }
        public void setType(LoadCommandType _v) { _dirty = true; type = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO _parent() { return _parent; }
        public void set_parent(MachO _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class MachHeader extends KaitaiStruct.ReadWrite {
        public static MachHeader fromFile(String fileName) throws IOException {
            return new MachHeader(new ByteBufferKaitaiStream(fileName));
        }
        public MachHeader() {
            this(null, null, null);
        }

        public MachHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MachHeader(KaitaiStream _io, MachO _parent) {
            this(_io, _parent, null);
        }

        public MachHeader(KaitaiStream _io, MachO _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.cputype = MachO.CpuType.byId(this._io.readU4le());
            this.cpusubtype = this._io.readU4le();
            this.filetype = MachO.FileType.byId(this._io.readU4le());
            this.ncmds = this._io.readU4le();
            this.sizeofcmds = this._io.readU4le();
            this.flags = this._io.readU4le();
            if ( ((_root().magic() == MachO.MagicType.MACHO_BE_X64) || (_root().magic() == MachO.MagicType.MACHO_LE_X64)) ) {
                this.reserved = this._io.readU4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if ( ((_root().magic() == MachO.MagicType.MACHO_BE_X64) || (_root().magic() == MachO.MagicType.MACHO_LE_X64)) ) {
            }
            flagsObj();
            if (this.flagsObj != null) {
                this.flagsObj._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteFlagsObj = _enabledFlagsObj;
            this._io.writeU4le(((Number) (this.cputype.id())).longValue());
            this._io.writeU4le(this.cpusubtype);
            this._io.writeU4le(((Number) (this.filetype.id())).longValue());
            this._io.writeU4le(this.ncmds);
            this._io.writeU4le(this.sizeofcmds);
            this._io.writeU4le(this.flags);
            if ( ((_root().magic() == MachO.MagicType.MACHO_BE_X64) || (_root().magic() == MachO.MagicType.MACHO_LE_X64)) ) {
                this._io.writeU4le(this.reserved);
            }
        }

        public void _check() {
            if ( ((_root().magic() == MachO.MagicType.MACHO_BE_X64) || (_root().magic() == MachO.MagicType.MACHO_LE_X64)) ) {
            }
            if (_enabledFlagsObj) {
                if (!Objects.equals(this.flagsObj._root(), _root()))
                    throw new ConsistencyError("flags_obj", _root(), this.flagsObj._root());
                if (!Objects.equals(this.flagsObj._parent(), this))
                    throw new ConsistencyError("flags_obj", this, this.flagsObj._parent());
                if (this.flagsObj.value() != flags())
                    throw new ConsistencyError("flags_obj", flags(), this.flagsObj.value());
            }
            _dirty = false;
        }
        private MachoFlags flagsObj;
        private boolean _shouldWriteFlagsObj = false;
        private boolean _enabledFlagsObj = true;
        public MachoFlags flagsObj() {
            if (_shouldWriteFlagsObj)
                _writeFlagsObj();
            if (this.flagsObj != null)
                return this.flagsObj;
            if (!_enabledFlagsObj)
                return null;
            this.flagsObj = new MachoFlags(this._io, this, _root, flags());
            this.flagsObj._read();
            return this.flagsObj;
        }
        public void setFlagsObj(MachoFlags _v) { _dirty = true; flagsObj = _v; }
        public void setFlagsObj_Enabled(boolean _v) { _dirty = true; _enabledFlagsObj = _v; }

        private void _writeFlagsObj() {
            _shouldWriteFlagsObj = false;
            this.flagsObj._write_Seq(this._io);
        }
        private CpuType cputype;
        private long cpusubtype;
        private FileType filetype;
        private long ncmds;
        private long sizeofcmds;
        private long flags;
        private Long reserved;
        private MachO _root;
        private MachO _parent;
        public CpuType cputype() { return cputype; }
        public void setCputype(CpuType _v) { _dirty = true; cputype = _v; }
        public long cpusubtype() { return cpusubtype; }
        public void setCpusubtype(long _v) { _dirty = true; cpusubtype = _v; }
        public FileType filetype() { return filetype; }
        public void setFiletype(FileType _v) { _dirty = true; filetype = _v; }
        public long ncmds() { return ncmds; }
        public void setNcmds(long _v) { _dirty = true; ncmds = _v; }
        public long sizeofcmds() { return sizeofcmds; }
        public void setSizeofcmds(long _v) { _dirty = true; sizeofcmds = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public Long reserved() { return reserved; }
        public void setReserved(Long _v) { _dirty = true; reserved = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO _parent() { return _parent; }
        public void set_parent(MachO _v) { _dirty = true; _parent = _v; }
    }
    public static class MachoFlags extends KaitaiStruct.ReadWrite {
        public MachoFlags(long value) {
            this(null, null, null, value);
        }

        public MachoFlags(KaitaiStream _io, long value) {
            this(_io, null, null, value);
        }

        public MachoFlags(KaitaiStream _io, MachO.MachHeader _parent, long value) {
            this(_io, _parent, null, value);
        }

        public MachoFlags(KaitaiStream _io, MachO.MachHeader _parent, MachO _root, long value) {
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
        private Boolean allModsBound;

        /**
         * indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
         */
        public Boolean allModsBound() {
            if (this.allModsBound != null)
                return this.allModsBound;
            this.allModsBound = (value() & 4096) != 0;
            return this.allModsBound;
        }
        public void _invalidateAllModsBound() { this.allModsBound = null; }
        private Boolean allowStackExecution;

        /**
         * When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
         */
        public Boolean allowStackExecution() {
            if (this.allowStackExecution != null)
                return this.allowStackExecution;
            this.allowStackExecution = (value() & 131072) != 0;
            return this.allowStackExecution;
        }
        public void _invalidateAllowStackExecution() { this.allowStackExecution = null; }
        private Boolean appExtensionSafe;
        public Boolean appExtensionSafe() {
            if (this.appExtensionSafe != null)
                return this.appExtensionSafe;
            this.appExtensionSafe = (value() & 33554432) != 0;
            return this.appExtensionSafe;
        }
        public void _invalidateAppExtensionSafe() { this.appExtensionSafe = null; }
        private Boolean bindAtLoad;

        /**
         * the object file's undefined references are bound by the dynamic linker when loaded.
         */
        public Boolean bindAtLoad() {
            if (this.bindAtLoad != null)
                return this.bindAtLoad;
            this.bindAtLoad = (value() & 8) != 0;
            return this.bindAtLoad;
        }
        public void _invalidateBindAtLoad() { this.bindAtLoad = null; }
        private Boolean bindsToWeak;

        /**
         * the final linked image uses weak symbols
         */
        public Boolean bindsToWeak() {
            if (this.bindsToWeak != null)
                return this.bindsToWeak;
            this.bindsToWeak = (value() & 65536) != 0;
            return this.bindsToWeak;
        }
        public void _invalidateBindsToWeak() { this.bindsToWeak = null; }
        private Boolean canonical;

        /**
         * the binary has been canonicalized via the unprebind operation
         */
        public Boolean canonical() {
            if (this.canonical != null)
                return this.canonical;
            this.canonical = (value() & 16384) != 0;
            return this.canonical;
        }
        public void _invalidateCanonical() { this.canonical = null; }
        private Boolean deadStrippableDylib;
        public Boolean deadStrippableDylib() {
            if (this.deadStrippableDylib != null)
                return this.deadStrippableDylib;
            this.deadStrippableDylib = (value() & 4194304) != 0;
            return this.deadStrippableDylib;
        }
        public void _invalidateDeadStrippableDylib() { this.deadStrippableDylib = null; }
        private Boolean dyldLink;

        /**
         * the object file is input for the dynamic linker and can't be staticly link edited again
         */
        public Boolean dyldLink() {
            if (this.dyldLink != null)
                return this.dyldLink;
            this.dyldLink = (value() & 4) != 0;
            return this.dyldLink;
        }
        public void _invalidateDyldLink() { this.dyldLink = null; }
        private Boolean forceFlat;

        /**
         * the executable is forcing all images to use flat name space bindings
         */
        public Boolean forceFlat() {
            if (this.forceFlat != null)
                return this.forceFlat;
            this.forceFlat = (value() & 256) != 0;
            return this.forceFlat;
        }
        public void _invalidateForceFlat() { this.forceFlat = null; }
        private Boolean hasTlvDescriptors;
        public Boolean hasTlvDescriptors() {
            if (this.hasTlvDescriptors != null)
                return this.hasTlvDescriptors;
            this.hasTlvDescriptors = (value() & 8388608) != 0;
            return this.hasTlvDescriptors;
        }
        public void _invalidateHasTlvDescriptors() { this.hasTlvDescriptors = null; }
        private Boolean incrLink;

        /**
         * the object file is the output of an incremental link against a base file and can't be link edited again
         */
        public Boolean incrLink() {
            if (this.incrLink != null)
                return this.incrLink;
            this.incrLink = (value() & 2) != 0;
            return this.incrLink;
        }
        public void _invalidateIncrLink() { this.incrLink = null; }
        private Boolean lazyInit;

        /**
         * the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)
         */
        public Boolean lazyInit() {
            if (this.lazyInit != null)
                return this.lazyInit;
            this.lazyInit = (value() & 64) != 0;
            return this.lazyInit;
        }
        public void _invalidateLazyInit() { this.lazyInit = null; }
        private Boolean noFixPrebinding;

        /**
         * do not have dyld notify the prebinding agent about this executable
         */
        public Boolean noFixPrebinding() {
            if (this.noFixPrebinding != null)
                return this.noFixPrebinding;
            this.noFixPrebinding = (value() & 1024) != 0;
            return this.noFixPrebinding;
        }
        public void _invalidateNoFixPrebinding() { this.noFixPrebinding = null; }
        private Boolean noHeapExecution;
        public Boolean noHeapExecution() {
            if (this.noHeapExecution != null)
                return this.noHeapExecution;
            this.noHeapExecution = (value() & 16777216) != 0;
            return this.noHeapExecution;
        }
        public void _invalidateNoHeapExecution() { this.noHeapExecution = null; }
        private Boolean noMultiDefs;

        /**
         * this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
         */
        public Boolean noMultiDefs() {
            if (this.noMultiDefs != null)
                return this.noMultiDefs;
            this.noMultiDefs = (value() & 512) != 0;
            return this.noMultiDefs;
        }
        public void _invalidateNoMultiDefs() { this.noMultiDefs = null; }
        private Boolean noReexportedDylibs;

        /**
         * When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported
         */
        public Boolean noReexportedDylibs() {
            if (this.noReexportedDylibs != null)
                return this.noReexportedDylibs;
            this.noReexportedDylibs = (value() & 1048576) != 0;
            return this.noReexportedDylibs;
        }
        public void _invalidateNoReexportedDylibs() { this.noReexportedDylibs = null; }
        private Boolean noUndefs;

        /**
         * the object file has no undefined references
         */
        public Boolean noUndefs() {
            if (this.noUndefs != null)
                return this.noUndefs;
            this.noUndefs = (value() & 1) != 0;
            return this.noUndefs;
        }
        public void _invalidateNoUndefs() { this.noUndefs = null; }
        private Boolean pie;

        /**
         * When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
         */
        public Boolean pie() {
            if (this.pie != null)
                return this.pie;
            this.pie = (value() & 2097152) != 0;
            return this.pie;
        }
        public void _invalidatePie() { this.pie = null; }
        private Boolean prebindable;

        /**
         * the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
         */
        public Boolean prebindable() {
            if (this.prebindable != null)
                return this.prebindable;
            this.prebindable = (value() & 2048) != 0;
            return this.prebindable;
        }
        public void _invalidatePrebindable() { this.prebindable = null; }
        private Boolean prebound;

        /**
         * the file has its dynamic undefined references prebound.
         */
        public Boolean prebound() {
            if (this.prebound != null)
                return this.prebound;
            this.prebound = (value() & 16) != 0;
            return this.prebound;
        }
        public void _invalidatePrebound() { this.prebound = null; }
        private Boolean rootSafe;

        /**
         * When this bit is set, the binary declares it is safe for use in processes with uid zero
         */
        public Boolean rootSafe() {
            if (this.rootSafe != null)
                return this.rootSafe;
            this.rootSafe = (value() & 262144) != 0;
            return this.rootSafe;
        }
        public void _invalidateRootSafe() { this.rootSafe = null; }
        private Boolean setuidSafe;

        /**
         * When this bit is set, the binary declares it is safe for use in processes when issetugid() is true
         */
        public Boolean setuidSafe() {
            if (this.setuidSafe != null)
                return this.setuidSafe;
            this.setuidSafe = (value() & 524288) != 0;
            return this.setuidSafe;
        }
        public void _invalidateSetuidSafe() { this.setuidSafe = null; }
        private Boolean splitSegs;

        /**
         * the file has its read-only and read-write segments split
         */
        public Boolean splitSegs() {
            if (this.splitSegs != null)
                return this.splitSegs;
            this.splitSegs = (value() & 32) != 0;
            return this.splitSegs;
        }
        public void _invalidateSplitSegs() { this.splitSegs = null; }
        private Boolean subsectionsViaSymbols;

        /**
         * safe to divide up the sections into sub-sections via symbols for dead code stripping
         */
        public Boolean subsectionsViaSymbols() {
            if (this.subsectionsViaSymbols != null)
                return this.subsectionsViaSymbols;
            this.subsectionsViaSymbols = (value() & 8192) != 0;
            return this.subsectionsViaSymbols;
        }
        public void _invalidateSubsectionsViaSymbols() { this.subsectionsViaSymbols = null; }
        private Boolean twoLevel;

        /**
         * the image is using two-level name space bindings
         */
        public Boolean twoLevel() {
            if (this.twoLevel != null)
                return this.twoLevel;
            this.twoLevel = (value() & 128) != 0;
            return this.twoLevel;
        }
        public void _invalidateTwoLevel() { this.twoLevel = null; }
        private Boolean weakDefines;

        /**
         * the final linked image contains external weak symbols
         */
        public Boolean weakDefines() {
            if (this.weakDefines != null)
                return this.weakDefines;
            this.weakDefines = (value() & 32768) != 0;
            return this.weakDefines;
        }
        public void _invalidateWeakDefines() { this.weakDefines = null; }
        private long value;
        private MachO _root;
        private MachO.MachHeader _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.MachHeader _parent() { return _parent; }
        public void set_parent(MachO.MachHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class RoutinesCommand extends KaitaiStruct.ReadWrite {
        public static RoutinesCommand fromFile(String fileName) throws IOException {
            return new RoutinesCommand(new ByteBufferKaitaiStream(fileName));
        }
        public RoutinesCommand() {
            this(null, null, null);
        }

        public RoutinesCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RoutinesCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public RoutinesCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.initAddress = this._io.readU4le();
            this.initModule = this._io.readU4le();
            this.reserved = this._io.readBytes(24);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.initAddress);
            this._io.writeU4le(this.initModule);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (this.reserved.length != 24)
                throw new ConsistencyError("reserved", 24, this.reserved.length);
            _dirty = false;
        }
        private long initAddress;
        private long initModule;
        private byte[] reserved;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long initAddress() { return initAddress; }
        public void setInitAddress(long _v) { _dirty = true; initAddress = _v; }
        public long initModule() { return initModule; }
        public void setInitModule(long _v) { _dirty = true; initModule = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class RoutinesCommand64 extends KaitaiStruct.ReadWrite {
        public static RoutinesCommand64 fromFile(String fileName) throws IOException {
            return new RoutinesCommand64(new ByteBufferKaitaiStream(fileName));
        }
        public RoutinesCommand64() {
            this(null, null, null);
        }

        public RoutinesCommand64(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RoutinesCommand64(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public RoutinesCommand64(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.initAddress = this._io.readU8le();
            this.initModule = this._io.readU8le();
            this.reserved = this._io.readBytes(48);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.initAddress);
            this._io.writeU8le(this.initModule);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (this.reserved.length != 48)
                throw new ConsistencyError("reserved", 48, this.reserved.length);
            _dirty = false;
        }
        private long initAddress;
        private long initModule;
        private byte[] reserved;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long initAddress() { return initAddress; }
        public void setInitAddress(long _v) { _dirty = true; initAddress = _v; }
        public long initModule() { return initModule; }
        public void setInitModule(long _v) { _dirty = true; initModule = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class RpathCommand extends KaitaiStruct.ReadWrite {
        public static RpathCommand fromFile(String fileName) throws IOException {
            return new RpathCommand(new ByteBufferKaitaiStream(fileName));
        }
        public RpathCommand() {
            this(null, null, null);
        }

        public RpathCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RpathCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public RpathCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.pathOffset = this._io.readU4le();
            this.path = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.pathOffset);
            this._io.writeBytes((this.path).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.path).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("path", -1, KaitaiStream.byteArrayIndexOf((this.path).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private long pathOffset;
        private String path;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long pathOffset() { return pathOffset; }
        public void setPathOffset(long _v) { _dirty = true; pathOffset = _v; }
        public String path() { return path; }
        public void setPath(String _v) { _dirty = true; path = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class SegmentCommand extends KaitaiStruct.ReadWrite {
        public static SegmentCommand fromFile(String fileName) throws IOException {
            return new SegmentCommand(new ByteBufferKaitaiStream(fileName));
        }
        public SegmentCommand() {
            this(null, null, null);
        }

        public SegmentCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public SegmentCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.segname = new String(KaitaiStream.bytesStripRight(this._io.readBytes(16), (byte) 0), StandardCharsets.US_ASCII);
            this.vmaddr = this._io.readU4le();
            this.vmsize = this._io.readU4le();
            this.fileoff = this._io.readU4le();
            this.filesize = this._io.readU4le();
            this.maxprot = new VmProt(this._io, this, _root);
            this.maxprot._read();
            this.initprot = new VmProt(this._io, this, _root);
            this.initprot._read();
            this.nsects = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.sections = new ArrayList<Section>();
            for (int i = 0; i < nsects(); i++) {
                Section _t_sections = new Section(this._io, this, _root);
                try {
                    _t_sections._read();
                } finally {
                    this.sections.add(_t_sections);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.maxprot._fetchInstances();
            this.initprot._fetchInstances();
            for (int i = 0; i < this.sections.size(); i++) {
                this.sections.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytesLimit((this.segname).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
            this._io.writeU4le(this.vmaddr);
            this._io.writeU4le(this.vmsize);
            this._io.writeU4le(this.fileoff);
            this._io.writeU4le(this.filesize);
            this.maxprot._write_Seq(this._io);
            this.initprot._write_Seq(this._io);
            this._io.writeU4le(this.nsects);
            this._io.writeU4le(this.flags);
            for (int i = 0; i < this.sections.size(); i++) {
                this.sections.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if ((this.segname).getBytes(Charset.forName("ASCII")).length > 16)
                throw new ConsistencyError("segname", 16, (this.segname).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.segname).getBytes(Charset.forName("ASCII")).length != 0) && (((this.segname).getBytes(Charset.forName("ASCII"))[((Number) ((this.segname).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                throw new ConsistencyError("segname", 0, ((this.segname).getBytes(Charset.forName("ASCII"))[((Number) ((this.segname).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            if (!Objects.equals(this.maxprot._root(), _root()))
                throw new ConsistencyError("maxprot", _root(), this.maxprot._root());
            if (!Objects.equals(this.maxprot._parent(), this))
                throw new ConsistencyError("maxprot", this, this.maxprot._parent());
            if (!Objects.equals(this.initprot._root(), _root()))
                throw new ConsistencyError("initprot", _root(), this.initprot._root());
            if (!Objects.equals(this.initprot._parent(), this))
                throw new ConsistencyError("initprot", this, this.initprot._parent());
            if (this.sections.size() != nsects())
                throw new ConsistencyError("sections", nsects(), this.sections.size());
            for (int i = 0; i < this.sections.size(); i++) {
                if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("sections", _root(), this.sections.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("sections", this, this.sections.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Section extends KaitaiStruct.ReadWrite {
            public static Section fromFile(String fileName) throws IOException {
                return new Section(new ByteBufferKaitaiStream(fileName));
            }
            public Section() {
                this(null, null, null);
            }

            public Section(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Section(KaitaiStream _io, MachO.SegmentCommand _parent) {
                this(_io, _parent, null);
            }

            public Section(KaitaiStream _io, MachO.SegmentCommand _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.sectName = new String(KaitaiStream.bytesStripRight(this._io.readBytes(16), (byte) 0), StandardCharsets.US_ASCII);
                this.segName = new String(KaitaiStream.bytesStripRight(this._io.readBytes(16), (byte) 0), StandardCharsets.US_ASCII);
                this.addr = this._io.readU4le();
                this.size = this._io.readU4le();
                this.offset = this._io.readU4le();
                this.align = this._io.readU4le();
                this.reloff = this._io.readU4le();
                this.nreloc = this._io.readU4le();
                this.flags = this._io.readU4le();
                this.reserved1 = this._io.readU4le();
                this.reserved2 = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
                data();
                if (this.data != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteData = _enabledData;
                this._io.writeBytesLimit((this.sectName).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
                this._io.writeBytesLimit((this.segName).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
                this._io.writeU4le(this.addr);
                this._io.writeU4le(this.size);
                this._io.writeU4le(this.offset);
                this._io.writeU4le(this.align);
                this._io.writeU4le(this.reloff);
                this._io.writeU4le(this.nreloc);
                this._io.writeU4le(this.flags);
                this._io.writeU4le(this.reserved1);
                this._io.writeU4le(this.reserved2);
            }

            public void _check() {
                if ((this.sectName).getBytes(Charset.forName("ASCII")).length > 16)
                    throw new ConsistencyError("sect_name", 16, (this.sectName).getBytes(Charset.forName("ASCII")).length);
                if ( (((this.sectName).getBytes(Charset.forName("ASCII")).length != 0) && (((this.sectName).getBytes(Charset.forName("ASCII"))[((Number) ((this.sectName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                    throw new ConsistencyError("sect_name", 0, ((this.sectName).getBytes(Charset.forName("ASCII"))[((Number) ((this.sectName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
                if ((this.segName).getBytes(Charset.forName("ASCII")).length > 16)
                    throw new ConsistencyError("seg_name", 16, (this.segName).getBytes(Charset.forName("ASCII")).length);
                if ( (((this.segName).getBytes(Charset.forName("ASCII")).length != 0) && (((this.segName).getBytes(Charset.forName("ASCII"))[((Number) ((this.segName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                    throw new ConsistencyError("seg_name", 0, ((this.segName).getBytes(Charset.forName("ASCII"))[((Number) ((this.segName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
                if (_enabledData) {
                    if (this.data.length != size())
                        throw new ConsistencyError("data", size(), this.data.length);
                }
                _dirty = false;
            }
            private byte[] data;
            private boolean _shouldWriteData = false;
            private boolean _enabledData = true;
            public byte[] data() {
                if (_shouldWriteData)
                    _writeData();
                if (this.data != null)
                    return this.data;
                if (!_enabledData)
                    return null;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                this.data = io.readBytes(size());
                io.seek(_pos);
                return this.data;
            }
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

            private void _writeData() {
                _shouldWriteData = false;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                io.writeBytes(this.data);
                io.seek(_pos);
            }
            private String sectName;
            private String segName;
            private long addr;
            private long size;
            private long offset;
            private long align;
            private long reloff;
            private long nreloc;
            private long flags;
            private long reserved1;
            private long reserved2;
            private MachO _root;
            private MachO.SegmentCommand _parent;
            public String sectName() { return sectName; }
            public void setSectName(String _v) { _dirty = true; sectName = _v; }
            public String segName() { return segName; }
            public void setSegName(String _v) { _dirty = true; segName = _v; }
            public long addr() { return addr; }
            public void setAddr(long _v) { _dirty = true; addr = _v; }
            public long size() { return size; }
            public void setSize(long _v) { _dirty = true; size = _v; }
            public long offset() { return offset; }
            public void setOffset(long _v) { _dirty = true; offset = _v; }
            public long align() { return align; }
            public void setAlign(long _v) { _dirty = true; align = _v; }
            public long reloff() { return reloff; }
            public void setReloff(long _v) { _dirty = true; reloff = _v; }
            public long nreloc() { return nreloc; }
            public void setNreloc(long _v) { _dirty = true; nreloc = _v; }
            public long flags() { return flags; }
            public void setFlags(long _v) { _dirty = true; flags = _v; }
            public long reserved1() { return reserved1; }
            public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.SegmentCommand _parent() { return _parent; }
            public void set_parent(MachO.SegmentCommand _v) { _dirty = true; _parent = _v; }
        }
        private String segname;
        private long vmaddr;
        private long vmsize;
        private long fileoff;
        private long filesize;
        private VmProt maxprot;
        private VmProt initprot;
        private long nsects;
        private long flags;
        private List<Section> sections;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public String segname() { return segname; }
        public void setSegname(String _v) { _dirty = true; segname = _v; }
        public long vmaddr() { return vmaddr; }
        public void setVmaddr(long _v) { _dirty = true; vmaddr = _v; }
        public long vmsize() { return vmsize; }
        public void setVmsize(long _v) { _dirty = true; vmsize = _v; }
        public long fileoff() { return fileoff; }
        public void setFileoff(long _v) { _dirty = true; fileoff = _v; }
        public long filesize() { return filesize; }
        public void setFilesize(long _v) { _dirty = true; filesize = _v; }
        public VmProt maxprot() { return maxprot; }
        public void setMaxprot(VmProt _v) { _dirty = true; maxprot = _v; }
        public VmProt initprot() { return initprot; }
        public void setInitprot(VmProt _v) { _dirty = true; initprot = _v; }
        public long nsects() { return nsects; }
        public void setNsects(long _v) { _dirty = true; nsects = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public List<Section> sections() { return sections; }
        public void setSections(List<Section> _v) { _dirty = true; sections = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class SegmentCommand64 extends KaitaiStruct.ReadWrite {
        public static SegmentCommand64 fromFile(String fileName) throws IOException {
            return new SegmentCommand64(new ByteBufferKaitaiStream(fileName));
        }
        public SegmentCommand64() {
            this(null, null, null);
        }

        public SegmentCommand64(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentCommand64(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public SegmentCommand64(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.segname = new String(KaitaiStream.bytesStripRight(this._io.readBytes(16), (byte) 0), StandardCharsets.US_ASCII);
            this.vmaddr = this._io.readU8le();
            this.vmsize = this._io.readU8le();
            this.fileoff = this._io.readU8le();
            this.filesize = this._io.readU8le();
            this.maxprot = new VmProt(this._io, this, _root);
            this.maxprot._read();
            this.initprot = new VmProt(this._io, this, _root);
            this.initprot._read();
            this.nsects = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.sections = new ArrayList<Section64>();
            for (int i = 0; i < nsects(); i++) {
                Section64 _t_sections = new Section64(this._io, this, _root);
                try {
                    _t_sections._read();
                } finally {
                    this.sections.add(_t_sections);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.maxprot._fetchInstances();
            this.initprot._fetchInstances();
            for (int i = 0; i < this.sections.size(); i++) {
                this.sections.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytesLimit((this.segname).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
            this._io.writeU8le(this.vmaddr);
            this._io.writeU8le(this.vmsize);
            this._io.writeU8le(this.fileoff);
            this._io.writeU8le(this.filesize);
            this.maxprot._write_Seq(this._io);
            this.initprot._write_Seq(this._io);
            this._io.writeU4le(this.nsects);
            this._io.writeU4le(this.flags);
            for (int i = 0; i < this.sections.size(); i++) {
                this.sections.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if ((this.segname).getBytes(Charset.forName("ASCII")).length > 16)
                throw new ConsistencyError("segname", 16, (this.segname).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.segname).getBytes(Charset.forName("ASCII")).length != 0) && (((this.segname).getBytes(Charset.forName("ASCII"))[((Number) ((this.segname).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                throw new ConsistencyError("segname", 0, ((this.segname).getBytes(Charset.forName("ASCII"))[((Number) ((this.segname).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            if (!Objects.equals(this.maxprot._root(), _root()))
                throw new ConsistencyError("maxprot", _root(), this.maxprot._root());
            if (!Objects.equals(this.maxprot._parent(), this))
                throw new ConsistencyError("maxprot", this, this.maxprot._parent());
            if (!Objects.equals(this.initprot._root(), _root()))
                throw new ConsistencyError("initprot", _root(), this.initprot._root());
            if (!Objects.equals(this.initprot._parent(), this))
                throw new ConsistencyError("initprot", this, this.initprot._parent());
            if (this.sections.size() != nsects())
                throw new ConsistencyError("sections", nsects(), this.sections.size());
            for (int i = 0; i < this.sections.size(); i++) {
                if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("sections", _root(), this.sections.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("sections", this, this.sections.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Section64 extends KaitaiStruct.ReadWrite {
            public static Section64 fromFile(String fileName) throws IOException {
                return new Section64(new ByteBufferKaitaiStream(fileName));
            }
            public Section64() {
                this(null, null, null);
            }

            public Section64(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Section64(KaitaiStream _io, MachO.SegmentCommand64 _parent) {
                this(_io, _parent, null);
            }

            public Section64(KaitaiStream _io, MachO.SegmentCommand64 _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.sectName = new String(KaitaiStream.bytesStripRight(this._io.readBytes(16), (byte) 0), StandardCharsets.US_ASCII);
                this.segName = new String(KaitaiStream.bytesStripRight(this._io.readBytes(16), (byte) 0), StandardCharsets.US_ASCII);
                this.addr = this._io.readU8le();
                this.size = this._io.readU8le();
                this.offset = this._io.readU4le();
                this.align = this._io.readU4le();
                this.reloff = this._io.readU4le();
                this.nreloc = this._io.readU4le();
                this.flags = this._io.readU4le();
                this.reserved1 = this._io.readU4le();
                this.reserved2 = this._io.readU4le();
                this.reserved3 = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
                data();
                if (this.data != null) {
                    switch (sectName()) {
                    case "__cfstring": {
                        ((CfStringList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__cstring": {
                        ((StringList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__eh_frame": {
                        ((EhFrame) (this.data))._fetchInstances();
                        break;
                    }
                    case "__got": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__la_symbol_ptr": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__nl_symbol_ptr": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_classlist": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_classname": {
                        ((StringList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_classrefs": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_imageinfo": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_methname": {
                        ((StringList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_methtype": {
                        ((StringList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_nlclslist": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_protolist": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_protorefs": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_selrefs": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    case "__objc_superrefs": {
                        ((PointerList) (this.data))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteData = _enabledData;
                this._io.writeBytesLimit((this.sectName).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
                this._io.writeBytesLimit((this.segName).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
                this._io.writeU8le(this.addr);
                this._io.writeU8le(this.size);
                this._io.writeU4le(this.offset);
                this._io.writeU4le(this.align);
                this._io.writeU4le(this.reloff);
                this._io.writeU4le(this.nreloc);
                this._io.writeU4le(this.flags);
                this._io.writeU4le(this.reserved1);
                this._io.writeU4le(this.reserved2);
                this._io.writeU4le(this.reserved3);
            }

            public void _check() {
                if ((this.sectName).getBytes(Charset.forName("ASCII")).length > 16)
                    throw new ConsistencyError("sect_name", 16, (this.sectName).getBytes(Charset.forName("ASCII")).length);
                if ( (((this.sectName).getBytes(Charset.forName("ASCII")).length != 0) && (((this.sectName).getBytes(Charset.forName("ASCII"))[((Number) ((this.sectName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                    throw new ConsistencyError("sect_name", 0, ((this.sectName).getBytes(Charset.forName("ASCII"))[((Number) ((this.sectName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
                if ((this.segName).getBytes(Charset.forName("ASCII")).length > 16)
                    throw new ConsistencyError("seg_name", 16, (this.segName).getBytes(Charset.forName("ASCII")).length);
                if ( (((this.segName).getBytes(Charset.forName("ASCII")).length != 0) && (((this.segName).getBytes(Charset.forName("ASCII"))[((Number) ((this.segName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                    throw new ConsistencyError("seg_name", 0, ((this.segName).getBytes(Charset.forName("ASCII"))[((Number) ((this.segName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
                if (_enabledData) {
                    switch (sectName()) {
                    case "__cfstring": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.CfStringList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.CfStringList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.CfStringList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.CfStringList) (this.data))._parent());
                        break;
                    }
                    case "__cstring": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.StringList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.StringList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.StringList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.StringList) (this.data))._parent());
                        break;
                    }
                    case "__eh_frame": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.EhFrame) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.EhFrame) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.EhFrame) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.EhFrame) (this.data))._parent());
                        break;
                    }
                    case "__got": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__la_symbol_ptr": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__nl_symbol_ptr": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__objc_classlist": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__objc_classname": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.StringList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.StringList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.StringList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.StringList) (this.data))._parent());
                        break;
                    }
                    case "__objc_classrefs": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__objc_imageinfo": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__objc_methname": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.StringList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.StringList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.StringList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.StringList) (this.data))._parent());
                        break;
                    }
                    case "__objc_methtype": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.StringList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.StringList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.StringList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.StringList) (this.data))._parent());
                        break;
                    }
                    case "__objc_nlclslist": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__objc_protolist": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__objc_protorefs": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__objc_selrefs": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    case "__objc_superrefs": {
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._root());
                        if (!Objects.equals(((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((MachO.SegmentCommand64.Section64.PointerList) (this.data))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.data)).length != size())
                            throw new ConsistencyError("data", size(), ((byte[]) (this.data)).length);
                        break;
                    }
                    }
                }
                _dirty = false;
            }
            public static class CfString extends KaitaiStruct.ReadWrite {
                public static CfString fromFile(String fileName) throws IOException {
                    return new CfString(new ByteBufferKaitaiStream(fileName));
                }
                public CfString() {
                    this(null, null, null);
                }

                public CfString(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CfString(KaitaiStream _io, MachO.SegmentCommand64.Section64.CfStringList _parent) {
                    this(_io, _parent, null);
                }

                public CfString(KaitaiStream _io, MachO.SegmentCommand64.Section64.CfStringList _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.isa = this._io.readU8le();
                    this.info = this._io.readU8le();
                    this.data = this._io.readU8le();
                    this.length = this._io.readU8le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU8le(this.isa);
                    this._io.writeU8le(this.info);
                    this._io.writeU8le(this.data);
                    this._io.writeU8le(this.length);
                }

                public void _check() {
                    _dirty = false;
                }
                private long isa;
                private long info;
                private long data;
                private long length;
                private MachO _root;
                private MachO.SegmentCommand64.Section64.CfStringList _parent;
                public long isa() { return isa; }
                public void setIsa(long _v) { _dirty = true; isa = _v; }
                public long info() { return info; }
                public void setInfo(long _v) { _dirty = true; info = _v; }
                public long data() { return data; }
                public void setData(long _v) { _dirty = true; data = _v; }
                public long length() { return length; }
                public void setLength(long _v) { _dirty = true; length = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.SegmentCommand64.Section64.CfStringList _parent() { return _parent; }
                public void set_parent(MachO.SegmentCommand64.Section64.CfStringList _v) { _dirty = true; _parent = _v; }
            }
            public static class CfStringList extends KaitaiStruct.ReadWrite {
                public static CfStringList fromFile(String fileName) throws IOException {
                    return new CfStringList(new ByteBufferKaitaiStream(fileName));
                }
                public CfStringList() {
                    this(null, null, null);
                }

                public CfStringList(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CfStringList(KaitaiStream _io, MachO.SegmentCommand64.Section64 _parent) {
                    this(_io, _parent, null);
                }

                public CfStringList(KaitaiStream _io, MachO.SegmentCommand64.Section64 _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.items = new ArrayList<CfString>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            CfString _t_items = new CfString(this._io, this, _root);
                            try {
                                _t_items._read();
                            } finally {
                                this.items.add(_t_items);
                            }
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.items.size(); i++) {
                        this.items.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.items.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                        this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    for (int i = 0; i < this.items.size(); i++) {
                        if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                private List<CfString> items;
                private MachO _root;
                private MachO.SegmentCommand64.Section64 _parent;
                public List<CfString> items() { return items; }
                public void setItems(List<CfString> _v) { _dirty = true; items = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.SegmentCommand64.Section64 _parent() { return _parent; }
                public void set_parent(MachO.SegmentCommand64.Section64 _v) { _dirty = true; _parent = _v; }
            }
            public static class EhFrame extends KaitaiStruct.ReadWrite {
                public static EhFrame fromFile(String fileName) throws IOException {
                    return new EhFrame(new ByteBufferKaitaiStream(fileName));
                }
                public EhFrame() {
                    this(null, null, null);
                }

                public EhFrame(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public EhFrame(KaitaiStream _io, MachO.SegmentCommand64.Section64 _parent) {
                    this(_io, _parent, null);
                }

                public EhFrame(KaitaiStream _io, MachO.SegmentCommand64.Section64 _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.items = new ArrayList<EhFrameItem>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            EhFrameItem _t_items = new EhFrameItem(this._io, this, _root);
                            try {
                                _t_items._read();
                            } finally {
                                this.items.add(_t_items);
                            }
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.items.size(); i++) {
                        this.items.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.items.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                        this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    for (int i = 0; i < this.items.size(); i++) {
                        if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                private List<EhFrameItem> items;
                private MachO _root;
                private MachO.SegmentCommand64.Section64 _parent;
                public List<EhFrameItem> items() { return items; }
                public void setItems(List<EhFrameItem> _v) { _dirty = true; items = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.SegmentCommand64.Section64 _parent() { return _parent; }
                public void set_parent(MachO.SegmentCommand64.Section64 _v) { _dirty = true; _parent = _v; }
            }
            public static class EhFrameItem extends KaitaiStruct.ReadWrite {
                public static EhFrameItem fromFile(String fileName) throws IOException {
                    return new EhFrameItem(new ByteBufferKaitaiStream(fileName));
                }
                public EhFrameItem() {
                    this(null, null, null);
                }

                public EhFrameItem(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public EhFrameItem(KaitaiStream _io, MachO.SegmentCommand64.Section64.EhFrame _parent) {
                    this(_io, _parent, null);
                }

                public EhFrameItem(KaitaiStream _io, MachO.SegmentCommand64.Section64.EhFrame _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.length = this._io.readU4le();
                    if (length() == 4294967295L) {
                        this.length64 = this._io.readU8le();
                    }
                    this.id = this._io.readU4le();
                    if (length() > 0) {
                        switch (id()) {
                        case 0: {
                            this._raw_body = this._io.readBytes(length() - 4);
                            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                            this.body = new Cie(_io__raw_body, this, _root);
                            ((Cie) (this.body))._read();
                            break;
                        }
                        default: {
                            this.body = this._io.readBytes(length() - 4);
                            break;
                        }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    if (length() == 4294967295L) {
                    }
                    if (length() > 0) {
                        switch (id()) {
                        case 0: {
                            ((Cie) (this.body))._fetchInstances();
                            break;
                        }
                        default: {
                            break;
                        }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4le(this.length);
                    if (length() == 4294967295L) {
                        this._io.writeU8le(this.length64);
                    }
                    this._io.writeU4le(this.id);
                    if (length() > 0) {
                        switch (id()) {
                        case 0: {
                            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(length() - 4);
                            this._io.addChildStream(_io__raw_body);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 4));
                                final EhFrameItem _this = this;
                                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_body = _io__raw_body.toByteArray();
                                        if (((byte[]) (_this._raw_body)).length != length() - 4)
                                            throw new ConsistencyError("raw(body)", length() - 4, ((byte[]) (_this._raw_body)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                    }
                                });
                            }
                            ((Cie) (this.body))._write_Seq(_io__raw_body);
                            break;
                        }
                        default: {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                            break;
                        }
                        }
                    }
                }

                public void _check() {
                    if (length() == 4294967295L) {
                    }
                    if (length() > 0) {
                        switch (id()) {
                        case 0: {
                            if (!Objects.equals(((MachO.SegmentCommand64.Section64.EhFrameItem.Cie) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((MachO.SegmentCommand64.Section64.EhFrameItem.Cie) (this.body))._root());
                            if (!Objects.equals(((MachO.SegmentCommand64.Section64.EhFrameItem.Cie) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((MachO.SegmentCommand64.Section64.EhFrameItem.Cie) (this.body))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.body)).length != length() - 4)
                                throw new ConsistencyError("body", length() - 4, ((byte[]) (this.body)).length);
                            break;
                        }
                        }
                    }
                    _dirty = false;
                }
                public static class AugmentationEntry extends KaitaiStruct.ReadWrite {
                    public static AugmentationEntry fromFile(String fileName) throws IOException {
                        return new AugmentationEntry(new ByteBufferKaitaiStream(fileName));
                    }
                    public AugmentationEntry() {
                        this(null, null, null);
                    }

                    public AugmentationEntry(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public AugmentationEntry(KaitaiStream _io, MachO.SegmentCommand64.Section64.EhFrameItem.Cie _parent) {
                        this(_io, _parent, null);
                    }

                    public AugmentationEntry(KaitaiStream _io, MachO.SegmentCommand64.Section64.EhFrameItem.Cie _parent, MachO _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.length = new Uleb128(this._io, this, _root);
                        this.length._read();
                        if (_parent().augStr().next().chr() == 82) {
                            this.fdePointerEncoding = this._io.readU1();
                        }
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        this.length._fetchInstances();
                        if (_parent().augStr().next().chr() == 82) {
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this.length._write_Seq(this._io);
                        if (_parent().augStr().next().chr() == 82) {
                            this._io.writeU1(this.fdePointerEncoding);
                        }
                    }

                    public void _check() {
                        if (!Objects.equals(this.length._root(), _root()))
                            throw new ConsistencyError("length", _root(), this.length._root());
                        if (!Objects.equals(this.length._parent(), this))
                            throw new ConsistencyError("length", this, this.length._parent());
                        if (_parent().augStr().next().chr() == 82) {
                        }
                        _dirty = false;
                    }
                    private Uleb128 length;
                    private Integer fdePointerEncoding;
                    private MachO _root;
                    private MachO.SegmentCommand64.Section64.EhFrameItem.Cie _parent;
                    public Uleb128 length() { return length; }
                    public void setLength(Uleb128 _v) { _dirty = true; length = _v; }
                    public Integer fdePointerEncoding() { return fdePointerEncoding; }
                    public void setFdePointerEncoding(Integer _v) { _dirty = true; fdePointerEncoding = _v; }
                    public MachO _root() { return _root; }
                    public void set_root(MachO _v) { _dirty = true; _root = _v; }
                    public MachO.SegmentCommand64.Section64.EhFrameItem.Cie _parent() { return _parent; }
                    public void set_parent(MachO.SegmentCommand64.Section64.EhFrameItem.Cie _v) { _dirty = true; _parent = _v; }
                }
                public static class CharChain extends KaitaiStruct.ReadWrite {
                    public static CharChain fromFile(String fileName) throws IOException {
                        return new CharChain(new ByteBufferKaitaiStream(fileName));
                    }
                    public CharChain() {
                        this(null, null, null);
                    }

                    public CharChain(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public CharChain(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                        this(_io, _parent, null);
                    }

                    public CharChain(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.chr = this._io.readU1();
                        if (chr() != 0) {
                            this.next = new CharChain(this._io, this, _root);
                            this.next._read();
                        }
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        if (chr() != 0) {
                            this.next._fetchInstances();
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeU1(this.chr);
                        if (chr() != 0) {
                            this.next._write_Seq(this._io);
                        }
                    }

                    public void _check() {
                        if (chr() != 0) {
                            if (!Objects.equals(this.next._root(), _root()))
                                throw new ConsistencyError("next", _root(), this.next._root());
                            if (!Objects.equals(this.next._parent(), this))
                                throw new ConsistencyError("next", this, this.next._parent());
                        }
                        _dirty = false;
                    }
                    private int chr;
                    private CharChain next;
                    private MachO _root;
                    private KaitaiStruct.ReadWrite _parent;
                    public int chr() { return chr; }
                    public void setChr(int _v) { _dirty = true; chr = _v; }
                    public CharChain next() { return next; }
                    public void setNext(CharChain _v) { _dirty = true; next = _v; }
                    public MachO _root() { return _root; }
                    public void set_root(MachO _v) { _dirty = true; _root = _v; }
                    public KaitaiStruct.ReadWrite _parent() { return _parent; }
                    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
                }
                public static class Cie extends KaitaiStruct.ReadWrite {
                    public static Cie fromFile(String fileName) throws IOException {
                        return new Cie(new ByteBufferKaitaiStream(fileName));
                    }
                    public Cie() {
                        this(null, null, null);
                    }

                    public Cie(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public Cie(KaitaiStream _io, MachO.SegmentCommand64.Section64.EhFrameItem _parent) {
                        this(_io, _parent, null);
                    }

                    public Cie(KaitaiStream _io, MachO.SegmentCommand64.Section64.EhFrameItem _parent, MachO _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.version = this._io.readU1();
                        this.augStr = new CharChain(this._io, this, _root);
                        this.augStr._read();
                        this.codeAlignmentFactor = new Uleb128(this._io, this, _root);
                        this.codeAlignmentFactor._read();
                        this.dataAlignmentFactor = new Uleb128(this._io, this, _root);
                        this.dataAlignmentFactor._read();
                        this.returnAddressRegister = this._io.readU1();
                        if (augStr().chr() == 122) {
                            this.augmentation = new AugmentationEntry(this._io, this, _root);
                            this.augmentation._read();
                        }
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        this.augStr._fetchInstances();
                        this.codeAlignmentFactor._fetchInstances();
                        this.dataAlignmentFactor._fetchInstances();
                        if (augStr().chr() == 122) {
                            this.augmentation._fetchInstances();
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeU1(this.version);
                        this.augStr._write_Seq(this._io);
                        this.codeAlignmentFactor._write_Seq(this._io);
                        this.dataAlignmentFactor._write_Seq(this._io);
                        this._io.writeU1(this.returnAddressRegister);
                        if (augStr().chr() == 122) {
                            this.augmentation._write_Seq(this._io);
                        }
                    }

                    public void _check() {
                        if (!Objects.equals(this.augStr._root(), _root()))
                            throw new ConsistencyError("aug_str", _root(), this.augStr._root());
                        if (!Objects.equals(this.augStr._parent(), this))
                            throw new ConsistencyError("aug_str", this, this.augStr._parent());
                        if (!Objects.equals(this.codeAlignmentFactor._root(), _root()))
                            throw new ConsistencyError("code_alignment_factor", _root(), this.codeAlignmentFactor._root());
                        if (!Objects.equals(this.codeAlignmentFactor._parent(), this))
                            throw new ConsistencyError("code_alignment_factor", this, this.codeAlignmentFactor._parent());
                        if (!Objects.equals(this.dataAlignmentFactor._root(), _root()))
                            throw new ConsistencyError("data_alignment_factor", _root(), this.dataAlignmentFactor._root());
                        if (!Objects.equals(this.dataAlignmentFactor._parent(), this))
                            throw new ConsistencyError("data_alignment_factor", this, this.dataAlignmentFactor._parent());
                        if (augStr().chr() == 122) {
                            if (!Objects.equals(this.augmentation._root(), _root()))
                                throw new ConsistencyError("augmentation", _root(), this.augmentation._root());
                            if (!Objects.equals(this.augmentation._parent(), this))
                                throw new ConsistencyError("augmentation", this, this.augmentation._parent());
                        }
                        _dirty = false;
                    }
                    private int version;
                    private CharChain augStr;
                    private Uleb128 codeAlignmentFactor;
                    private Uleb128 dataAlignmentFactor;
                    private int returnAddressRegister;
                    private AugmentationEntry augmentation;
                    private MachO _root;
                    private MachO.SegmentCommand64.Section64.EhFrameItem _parent;
                    public int version() { return version; }
                    public void setVersion(int _v) { _dirty = true; version = _v; }
                    public CharChain augStr() { return augStr; }
                    public void setAugStr(CharChain _v) { _dirty = true; augStr = _v; }
                    public Uleb128 codeAlignmentFactor() { return codeAlignmentFactor; }
                    public void setCodeAlignmentFactor(Uleb128 _v) { _dirty = true; codeAlignmentFactor = _v; }
                    public Uleb128 dataAlignmentFactor() { return dataAlignmentFactor; }
                    public void setDataAlignmentFactor(Uleb128 _v) { _dirty = true; dataAlignmentFactor = _v; }
                    public int returnAddressRegister() { return returnAddressRegister; }
                    public void setReturnAddressRegister(int _v) { _dirty = true; returnAddressRegister = _v; }
                    public AugmentationEntry augmentation() { return augmentation; }
                    public void setAugmentation(AugmentationEntry _v) { _dirty = true; augmentation = _v; }
                    public MachO _root() { return _root; }
                    public void set_root(MachO _v) { _dirty = true; _root = _v; }
                    public MachO.SegmentCommand64.Section64.EhFrameItem _parent() { return _parent; }
                    public void set_parent(MachO.SegmentCommand64.Section64.EhFrameItem _v) { _dirty = true; _parent = _v; }
                }
                private long length;
                private Long length64;
                private long id;
                private Object body;
                private MachO _root;
                private MachO.SegmentCommand64.Section64.EhFrame _parent;
                private byte[] _raw_body;
                public long length() { return length; }
                public void setLength(long _v) { _dirty = true; length = _v; }
                public Long length64() { return length64; }
                public void setLength64(Long _v) { _dirty = true; length64 = _v; }
                public long id() { return id; }
                public void setId(long _v) { _dirty = true; id = _v; }
                public Object body() { return body; }
                public void setBody(Object _v) { _dirty = true; body = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.SegmentCommand64.Section64.EhFrame _parent() { return _parent; }
                public void set_parent(MachO.SegmentCommand64.Section64.EhFrame _v) { _dirty = true; _parent = _v; }
                public byte[] _raw_body() { return _raw_body; }
                public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
            }
            public static class PointerList extends KaitaiStruct.ReadWrite {
                public static PointerList fromFile(String fileName) throws IOException {
                    return new PointerList(new ByteBufferKaitaiStream(fileName));
                }
                public PointerList() {
                    this(null, null, null);
                }

                public PointerList(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public PointerList(KaitaiStream _io, MachO.SegmentCommand64.Section64 _parent) {
                    this(_io, _parent, null);
                }

                public PointerList(KaitaiStream _io, MachO.SegmentCommand64.Section64 _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.items = new ArrayList<Long>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.items.add(this._io.readU8le());
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.items.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.items.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                        this._io.writeU8le(this.items.get(((Number) (i)).intValue()));
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    for (int i = 0; i < this.items.size(); i++) {
                    }
                    _dirty = false;
                }
                private List<Long> items;
                private MachO _root;
                private MachO.SegmentCommand64.Section64 _parent;
                public List<Long> items() { return items; }
                public void setItems(List<Long> _v) { _dirty = true; items = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.SegmentCommand64.Section64 _parent() { return _parent; }
                public void set_parent(MachO.SegmentCommand64.Section64 _v) { _dirty = true; _parent = _v; }
            }
            public static class StringList extends KaitaiStruct.ReadWrite {
                public static StringList fromFile(String fileName) throws IOException {
                    return new StringList(new ByteBufferKaitaiStream(fileName));
                }
                public StringList() {
                    this(null, null, null);
                }

                public StringList(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public StringList(KaitaiStream _io, MachO.SegmentCommand64.Section64 _parent) {
                    this(_io, _parent, null);
                }

                public StringList(KaitaiStream _io, MachO.SegmentCommand64.Section64 _parent, MachO _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.strings = new ArrayList<String>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.strings.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII));
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.strings.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.strings.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("strings", 0, this._io.size() - this._io.pos());
                        this._io.writeBytes((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")));
                        this._io.writeU1(0);
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("strings", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    for (int i = 0; i < this.strings.size(); i++) {
                        if (KaitaiStream.byteArrayIndexOf((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                            throw new ConsistencyError("strings", -1, KaitaiStream.byteArrayIndexOf((this.strings.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                    }
                    _dirty = false;
                }
                private List<String> strings;
                private MachO _root;
                private MachO.SegmentCommand64.Section64 _parent;
                public List<String> strings() { return strings; }
                public void setStrings(List<String> _v) { _dirty = true; strings = _v; }
                public MachO _root() { return _root; }
                public void set_root(MachO _v) { _dirty = true; _root = _v; }
                public MachO.SegmentCommand64.Section64 _parent() { return _parent; }
                public void set_parent(MachO.SegmentCommand64.Section64 _v) { _dirty = true; _parent = _v; }
            }
            private Object data;
            private boolean _shouldWriteData = false;
            private boolean _enabledData = true;
            public Object data() {
                if (_shouldWriteData)
                    _writeData();
                if (this.data != null)
                    return this.data;
                if (!_enabledData)
                    return null;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                switch (sectName()) {
                case "__cfstring": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new CfStringList(_io__raw_data, this, _root);
                    ((CfStringList) (this.data))._read();
                    break;
                }
                case "__cstring": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new StringList(_io__raw_data, this, _root);
                    ((StringList) (this.data))._read();
                    break;
                }
                case "__eh_frame": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new EhFrame(_io__raw_data, this, _root);
                    ((EhFrame) (this.data))._read();
                    break;
                }
                case "__got": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__la_symbol_ptr": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__nl_symbol_ptr": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__objc_classlist": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__objc_classname": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new StringList(_io__raw_data, this, _root);
                    ((StringList) (this.data))._read();
                    break;
                }
                case "__objc_classrefs": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__objc_imageinfo": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__objc_methname": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new StringList(_io__raw_data, this, _root);
                    ((StringList) (this.data))._read();
                    break;
                }
                case "__objc_methtype": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new StringList(_io__raw_data, this, _root);
                    ((StringList) (this.data))._read();
                    break;
                }
                case "__objc_nlclslist": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__objc_protolist": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__objc_protorefs": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__objc_selrefs": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                case "__objc_superrefs": {
                    this._raw_data = io.readBytes(size());
                    KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                    this.data = new PointerList(_io__raw_data, this, _root);
                    ((PointerList) (this.data))._read();
                    break;
                }
                default: {
                    this.data = io.readBytes(size());
                    break;
                }
                }
                io.seek(_pos);
                return this.data;
            }
            public void setData(Object _v) { _dirty = true; data = _v; }
            public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

            private void _writeData() {
                _shouldWriteData = false;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                switch (sectName()) {
                case "__cfstring": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((CfStringList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__cstring": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((StringList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__eh_frame": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((EhFrame) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__got": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__la_symbol_ptr": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__nl_symbol_ptr": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_classlist": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_classname": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((StringList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_classrefs": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_imageinfo": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_methname": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((StringList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_methtype": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((StringList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_nlclslist": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_protolist": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_protorefs": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_selrefs": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                case "__objc_superrefs": {
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                    io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = io.pos();
                        io.seek(io.pos() + (size()));
                        final Section64 _this = this;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data = _io__raw_data.toByteArray();
                                if (((byte[]) (_this._raw_data)).length != size())
                                    throw new ConsistencyError("raw(data)", size(), ((byte[]) (_this._raw_data)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                            }
                        });
                    }
                    ((PointerList) (this.data))._write_Seq(_io__raw_data);
                    break;
                }
                default: {
                    io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                    break;
                }
                }
                io.seek(_pos);
            }
            private String sectName;
            private String segName;
            private long addr;
            private long size;
            private long offset;
            private long align;
            private long reloff;
            private long nreloc;
            private long flags;
            private long reserved1;
            private long reserved2;
            private long reserved3;
            private MachO _root;
            private MachO.SegmentCommand64 _parent;
            private byte[] _raw_data;
            public String sectName() { return sectName; }
            public void setSectName(String _v) { _dirty = true; sectName = _v; }
            public String segName() { return segName; }
            public void setSegName(String _v) { _dirty = true; segName = _v; }
            public long addr() { return addr; }
            public void setAddr(long _v) { _dirty = true; addr = _v; }
            public long size() { return size; }
            public void setSize(long _v) { _dirty = true; size = _v; }
            public long offset() { return offset; }
            public void setOffset(long _v) { _dirty = true; offset = _v; }
            public long align() { return align; }
            public void setAlign(long _v) { _dirty = true; align = _v; }
            public long reloff() { return reloff; }
            public void setReloff(long _v) { _dirty = true; reloff = _v; }
            public long nreloc() { return nreloc; }
            public void setNreloc(long _v) { _dirty = true; nreloc = _v; }
            public long flags() { return flags; }
            public void setFlags(long _v) { _dirty = true; flags = _v; }
            public long reserved1() { return reserved1; }
            public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
            public long reserved3() { return reserved3; }
            public void setReserved3(long _v) { _dirty = true; reserved3 = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.SegmentCommand64 _parent() { return _parent; }
            public void set_parent(MachO.SegmentCommand64 _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_data() { return _raw_data; }
            public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
        }
        private String segname;
        private long vmaddr;
        private long vmsize;
        private long fileoff;
        private long filesize;
        private VmProt maxprot;
        private VmProt initprot;
        private long nsects;
        private long flags;
        private List<Section64> sections;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public String segname() { return segname; }
        public void setSegname(String _v) { _dirty = true; segname = _v; }
        public long vmaddr() { return vmaddr; }
        public void setVmaddr(long _v) { _dirty = true; vmaddr = _v; }
        public long vmsize() { return vmsize; }
        public void setVmsize(long _v) { _dirty = true; vmsize = _v; }
        public long fileoff() { return fileoff; }
        public void setFileoff(long _v) { _dirty = true; fileoff = _v; }
        public long filesize() { return filesize; }
        public void setFilesize(long _v) { _dirty = true; filesize = _v; }
        public VmProt maxprot() { return maxprot; }
        public void setMaxprot(VmProt _v) { _dirty = true; maxprot = _v; }
        public VmProt initprot() { return initprot; }
        public void setInitprot(VmProt _v) { _dirty = true; initprot = _v; }
        public long nsects() { return nsects; }
        public void setNsects(long _v) { _dirty = true; nsects = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public List<Section64> sections() { return sections; }
        public void setSections(List<Section64> _v) { _dirty = true; sections = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class SourceVersionCommand extends KaitaiStruct.ReadWrite {
        public static SourceVersionCommand fromFile(String fileName) throws IOException {
            return new SourceVersionCommand(new ByteBufferKaitaiStream(fileName));
        }
        public SourceVersionCommand() {
            this(null, null, null);
        }

        public SourceVersionCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SourceVersionCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public SourceVersionCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.version);
        }

        public void _check() {
            _dirty = false;
        }
        private long version;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class SubCommand extends KaitaiStruct.ReadWrite {
        public static SubCommand fromFile(String fileName) throws IOException {
            return new SubCommand(new ByteBufferKaitaiStream(fileName));
        }
        public SubCommand() {
            this(null, null, null);
        }

        public SubCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SubCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public SubCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new LcStr(this._io, this, _root);
            this.name._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.name._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            _dirty = false;
        }
        private LcStr name;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public LcStr name() { return name; }
        public void setName(LcStr _v) { _dirty = true; name = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class SymtabCommand extends KaitaiStruct.ReadWrite {
        public static SymtabCommand fromFile(String fileName) throws IOException {
            return new SymtabCommand(new ByteBufferKaitaiStream(fileName));
        }
        public SymtabCommand() {
            this(null, null, null);
        }

        public SymtabCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SymtabCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public SymtabCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.symOff = this._io.readU4le();
            this.nSyms = this._io.readU4le();
            this.strOff = this._io.readU4le();
            this.strSize = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            strs();
            if (this.strs != null) {
                this.strs._fetchInstances();
            }
            symbols();
            if (this.symbols != null) {
                for (int i = 0; i < this.symbols.size(); i++) {
                    {
                        MagicType on = _root().magic();
                        if (on != null) {
                            switch (_root().magic()) {
                            case MACHO_BE_X64: {
                                ((Nlist64) (this.symbols.get(((Number) (i)).intValue())))._fetchInstances();
                                break;
                            }
                            case MACHO_BE_X86: {
                                ((Nlist) (this.symbols.get(((Number) (i)).intValue())))._fetchInstances();
                                break;
                            }
                            case MACHO_LE_X64: {
                                ((Nlist64) (this.symbols.get(((Number) (i)).intValue())))._fetchInstances();
                                break;
                            }
                            case MACHO_LE_X86: {
                                ((Nlist) (this.symbols.get(((Number) (i)).intValue())))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteStrs = _enabledStrs;
            _shouldWriteSymbols = _enabledSymbols;
            this._io.writeU4le(this.symOff);
            this._io.writeU4le(this.nSyms);
            this._io.writeU4le(this.strOff);
            this._io.writeU4le(this.strSize);
        }

        public void _check() {
            if (_enabledStrs) {
                if (!Objects.equals(this.strs._root(), _root()))
                    throw new ConsistencyError("strs", _root(), this.strs._root());
                if (!Objects.equals(this.strs._parent(), this))
                    throw new ConsistencyError("strs", this, this.strs._parent());
            }
            if (_enabledSymbols) {
                if (this.symbols.size() != nSyms())
                    throw new ConsistencyError("symbols", nSyms(), this.symbols.size());
                for (int i = 0; i < this.symbols.size(); i++) {
                    {
                        MagicType on = _root().magic();
                        if (on != null) {
                            switch (_root().magic()) {
                            case MACHO_BE_X64: {
                                if (!Objects.equals(((MachO.SymtabCommand.Nlist64) (this.symbols.get(((Number) (i)).intValue())))._root(), _root()))
                                    throw new ConsistencyError("symbols", _root(), ((MachO.SymtabCommand.Nlist64) (this.symbols.get(((Number) (i)).intValue())))._root());
                                if (!Objects.equals(((MachO.SymtabCommand.Nlist64) (this.symbols.get(((Number) (i)).intValue())))._parent(), this))
                                    throw new ConsistencyError("symbols", this, ((MachO.SymtabCommand.Nlist64) (this.symbols.get(((Number) (i)).intValue())))._parent());
                                break;
                            }
                            case MACHO_BE_X86: {
                                if (!Objects.equals(((MachO.SymtabCommand.Nlist) (this.symbols.get(((Number) (i)).intValue())))._root(), _root()))
                                    throw new ConsistencyError("symbols", _root(), ((MachO.SymtabCommand.Nlist) (this.symbols.get(((Number) (i)).intValue())))._root());
                                if (!Objects.equals(((MachO.SymtabCommand.Nlist) (this.symbols.get(((Number) (i)).intValue())))._parent(), this))
                                    throw new ConsistencyError("symbols", this, ((MachO.SymtabCommand.Nlist) (this.symbols.get(((Number) (i)).intValue())))._parent());
                                break;
                            }
                            case MACHO_LE_X64: {
                                if (!Objects.equals(((MachO.SymtabCommand.Nlist64) (this.symbols.get(((Number) (i)).intValue())))._root(), _root()))
                                    throw new ConsistencyError("symbols", _root(), ((MachO.SymtabCommand.Nlist64) (this.symbols.get(((Number) (i)).intValue())))._root());
                                if (!Objects.equals(((MachO.SymtabCommand.Nlist64) (this.symbols.get(((Number) (i)).intValue())))._parent(), this))
                                    throw new ConsistencyError("symbols", this, ((MachO.SymtabCommand.Nlist64) (this.symbols.get(((Number) (i)).intValue())))._parent());
                                break;
                            }
                            case MACHO_LE_X86: {
                                if (!Objects.equals(((MachO.SymtabCommand.Nlist) (this.symbols.get(((Number) (i)).intValue())))._root(), _root()))
                                    throw new ConsistencyError("symbols", _root(), ((MachO.SymtabCommand.Nlist) (this.symbols.get(((Number) (i)).intValue())))._root());
                                if (!Objects.equals(((MachO.SymtabCommand.Nlist) (this.symbols.get(((Number) (i)).intValue())))._parent(), this))
                                    throw new ConsistencyError("symbols", this, ((MachO.SymtabCommand.Nlist) (this.symbols.get(((Number) (i)).intValue())))._parent());
                                break;
                            }
                            }
                        }
                    }
                }
            }
            _dirty = false;
        }
        public static class Nlist extends KaitaiStruct.ReadWrite {
            public static Nlist fromFile(String fileName) throws IOException {
                return new Nlist(new ByteBufferKaitaiStream(fileName));
            }
            public Nlist() {
                this(null, null, null);
            }

            public Nlist(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Nlist(KaitaiStream _io, MachO.SymtabCommand _parent) {
                this(_io, _parent, null);
            }

            public Nlist(KaitaiStream _io, MachO.SymtabCommand _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.un = this._io.readU4le();
                this.type = this._io.readU1();
                this.sect = this._io.readU1();
                this.desc = this._io.readU2le();
                this.value = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
                name();
                if (this.name != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteName = _enabledName;
                this._io.writeU4le(this.un);
                this._io.writeU1(this.type);
                this._io.writeU1(this.sect);
                this._io.writeU2le(this.desc);
                this._io.writeU4le(this.value);
            }

            public void _check() {
                if (_enabledName) {
                    if (un() != 0) {
                        if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                            throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
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
                if (un() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(_parent().strOff() + un());
                    this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    this._io.seek(_pos);
                }
                return this.name;
            }
            public void setName(String _v) { _dirty = true; name = _v; }
            public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

            private void _writeName() {
                _shouldWriteName = false;
                if (un() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(_parent().strOff() + un());
                    this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                    this._io.writeU1(0);
                    this._io.seek(_pos);
                }
            }
            private long un;
            private int type;
            private int sect;
            private int desc;
            private long value;
            private MachO _root;
            private MachO.SymtabCommand _parent;
            public long un() { return un; }
            public void setUn(long _v) { _dirty = true; un = _v; }
            public int type() { return type; }
            public void setType(int _v) { _dirty = true; type = _v; }
            public int sect() { return sect; }
            public void setSect(int _v) { _dirty = true; sect = _v; }
            public int desc() { return desc; }
            public void setDesc(int _v) { _dirty = true; desc = _v; }
            public long value() { return value; }
            public void setValue(long _v) { _dirty = true; value = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.SymtabCommand _parent() { return _parent; }
            public void set_parent(MachO.SymtabCommand _v) { _dirty = true; _parent = _v; }
        }
        public static class Nlist64 extends KaitaiStruct.ReadWrite {
            public static Nlist64 fromFile(String fileName) throws IOException {
                return new Nlist64(new ByteBufferKaitaiStream(fileName));
            }
            public Nlist64() {
                this(null, null, null);
            }

            public Nlist64(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Nlist64(KaitaiStream _io, MachO.SymtabCommand _parent) {
                this(_io, _parent, null);
            }

            public Nlist64(KaitaiStream _io, MachO.SymtabCommand _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.un = this._io.readU4le();
                this.type = this._io.readU1();
                this.sect = this._io.readU1();
                this.desc = this._io.readU2le();
                this.value = this._io.readU8le();
                _dirty = false;
            }

            public void _fetchInstances() {
                name();
                if (this.name != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteName = _enabledName;
                this._io.writeU4le(this.un);
                this._io.writeU1(this.type);
                this._io.writeU1(this.sect);
                this._io.writeU2le(this.desc);
                this._io.writeU8le(this.value);
            }

            public void _check() {
                if (_enabledName) {
                    if (un() != 0) {
                        if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                            throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
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
                if (un() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(_parent().strOff() + un());
                    this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    this._io.seek(_pos);
                }
                return this.name;
            }
            public void setName(String _v) { _dirty = true; name = _v; }
            public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

            private void _writeName() {
                _shouldWriteName = false;
                if (un() != 0) {
                    long _pos = this._io.pos();
                    this._io.seek(_parent().strOff() + un());
                    this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                    this._io.writeU1(0);
                    this._io.seek(_pos);
                }
            }
            private long un;
            private int type;
            private int sect;
            private int desc;
            private long value;
            private MachO _root;
            private MachO.SymtabCommand _parent;
            public long un() { return un; }
            public void setUn(long _v) { _dirty = true; un = _v; }
            public int type() { return type; }
            public void setType(int _v) { _dirty = true; type = _v; }
            public int sect() { return sect; }
            public void setSect(int _v) { _dirty = true; sect = _v; }
            public int desc() { return desc; }
            public void setDesc(int _v) { _dirty = true; desc = _v; }
            public long value() { return value; }
            public void setValue(long _v) { _dirty = true; value = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.SymtabCommand _parent() { return _parent; }
            public void set_parent(MachO.SymtabCommand _v) { _dirty = true; _parent = _v; }
        }
        public static class StrTable extends KaitaiStruct.ReadWrite {
            public static StrTable fromFile(String fileName) throws IOException {
                return new StrTable(new ByteBufferKaitaiStream(fileName));
            }
            public StrTable() {
                this(null, null, null);
            }

            public StrTable(KaitaiStream _io) {
                this(_io, null, null);
            }

            public StrTable(KaitaiStream _io, MachO.SymtabCommand _parent) {
                this(_io, _parent, null);
            }

            public StrTable(KaitaiStream _io, MachO.SymtabCommand _parent, MachO _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.unknown = this._io.readU4le();
                this.items = new ArrayList<String>();
                {
                    String _it;
                    int i = 0;
                    do {
                        _it = new String(this._io.readBytesTerm((byte) 0, false, true, false), StandardCharsets.UTF_8);
                        this.items.add(_it);
                        i++;
                    } while (!(_it.equals("")));
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.unknown);
                for (int i = 0; i < this.items.size(); i++) {
                    this._io.writeBytes((this.items.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                    if (!(this._io.isEof())) {
                        this._io.writeU1(0);
                    }
                }
            }

            public void _check() {
                if (this.items.size() == 0)
                    throw new ConsistencyError("items", 0, this.items.size());
                for (int i = 0; i < this.items.size(); i++) {
                    if (KaitaiStream.byteArrayIndexOf((this.items.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                        throw new ConsistencyError("items", -1, KaitaiStream.byteArrayIndexOf((this.items.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                    {
                        String _it = this.items.get(((Number) (i)).intValue());
                        if (_it.equals("") != (i == this.items.size() - 1))
                            throw new ConsistencyError("items", i == this.items.size() - 1, _it.equals(""));
                    }
                }
                _dirty = false;
            }
            private long unknown;
            private List<String> items;
            private MachO _root;
            private MachO.SymtabCommand _parent;
            public long unknown() { return unknown; }
            public void setUnknown(long _v) { _dirty = true; unknown = _v; }
            public List<String> items() { return items; }
            public void setItems(List<String> _v) { _dirty = true; items = _v; }
            public MachO _root() { return _root; }
            public void set_root(MachO _v) { _dirty = true; _root = _v; }
            public MachO.SymtabCommand _parent() { return _parent; }
            public void set_parent(MachO.SymtabCommand _v) { _dirty = true; _parent = _v; }
        }
        private StrTable strs;
        private boolean _shouldWriteStrs = false;
        private boolean _enabledStrs = true;
        public StrTable strs() {
            if (_shouldWriteStrs)
                _writeStrs();
            if (this.strs != null)
                return this.strs;
            if (!_enabledStrs)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(strOff());
            this._raw_strs = io.readBytes(strSize());
            KaitaiStream _io__raw_strs = new ByteBufferKaitaiStream(this._raw_strs);
            this.strs = new StrTable(_io__raw_strs, this, _root);
            this.strs._read();
            io.seek(_pos);
            return this.strs;
        }
        public void setStrs(StrTable _v) { _dirty = true; strs = _v; }
        public void setStrs_Enabled(boolean _v) { _dirty = true; _enabledStrs = _v; }

        private void _writeStrs() {
            _shouldWriteStrs = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(strOff());
            final KaitaiStream _io__raw_strs = new ByteBufferKaitaiStream(strSize());
            io.addChildStream(_io__raw_strs);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (strSize()));
                final SymtabCommand _this = this;
                _io__raw_strs.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_strs = _io__raw_strs.toByteArray();
                        if (_this._raw_strs.length != strSize())
                            throw new ConsistencyError("raw(strs)", strSize(), _this._raw_strs.length);
                        parent.writeBytes(_this._raw_strs);
                    }
                });
            }
            this.strs._write_Seq(_io__raw_strs);
            io.seek(_pos);
        }
        private List<KaitaiStruct.ReadWrite> symbols;
        private boolean _shouldWriteSymbols = false;
        private boolean _enabledSymbols = true;
        public List<KaitaiStruct.ReadWrite> symbols() {
            if (_shouldWriteSymbols)
                _writeSymbols();
            if (this.symbols != null)
                return this.symbols;
            if (!_enabledSymbols)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(symOff());
            this.symbols = new ArrayList<KaitaiStruct.ReadWrite>();
            for (int i = 0; i < nSyms(); i++) {
                {
                    MagicType on = _root().magic();
                    if (on != null) {
                        switch (_root().magic()) {
                        case MACHO_BE_X64: {
                            Nlist64 _t_symbols = new Nlist64(io, this, _root);
                            try {
                                ((Nlist64) (_t_symbols))._read();
                            } finally {
                                this.symbols.add(_t_symbols);
                            }
                            break;
                        }
                        case MACHO_BE_X86: {
                            Nlist _t_symbols = new Nlist(io, this, _root);
                            try {
                                ((Nlist) (_t_symbols))._read();
                            } finally {
                                this.symbols.add(_t_symbols);
                            }
                            break;
                        }
                        case MACHO_LE_X64: {
                            Nlist64 _t_symbols = new Nlist64(io, this, _root);
                            try {
                                ((Nlist64) (_t_symbols))._read();
                            } finally {
                                this.symbols.add(_t_symbols);
                            }
                            break;
                        }
                        case MACHO_LE_X86: {
                            Nlist _t_symbols = new Nlist(io, this, _root);
                            try {
                                ((Nlist) (_t_symbols))._read();
                            } finally {
                                this.symbols.add(_t_symbols);
                            }
                            break;
                        }
                        }
                    }
                }
            }
            io.seek(_pos);
            return this.symbols;
        }
        public void setSymbols(List<KaitaiStruct.ReadWrite> _v) { _dirty = true; symbols = _v; }
        public void setSymbols_Enabled(boolean _v) { _dirty = true; _enabledSymbols = _v; }

        private void _writeSymbols() {
            _shouldWriteSymbols = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(symOff());
            for (int i = 0; i < this.symbols.size(); i++) {
                {
                    MagicType on = _root().magic();
                    if (on != null) {
                        switch (_root().magic()) {
                        case MACHO_BE_X64: {
                            ((Nlist64) (this.symbols.get(((Number) (i)).intValue())))._write_Seq(io);
                            break;
                        }
                        case MACHO_BE_X86: {
                            ((Nlist) (this.symbols.get(((Number) (i)).intValue())))._write_Seq(io);
                            break;
                        }
                        case MACHO_LE_X64: {
                            ((Nlist64) (this.symbols.get(((Number) (i)).intValue())))._write_Seq(io);
                            break;
                        }
                        case MACHO_LE_X86: {
                            ((Nlist) (this.symbols.get(((Number) (i)).intValue())))._write_Seq(io);
                            break;
                        }
                        }
                    }
                }
            }
            io.seek(_pos);
        }
        private long symOff;
        private long nSyms;
        private long strOff;
        private long strSize;
        private MachO _root;
        private MachO.LoadCommand _parent;
        private byte[] _raw_strs;
        public long symOff() { return symOff; }
        public void setSymOff(long _v) { _dirty = true; symOff = _v; }
        public long nSyms() { return nSyms; }
        public void setNSyms(long _v) { _dirty = true; nSyms = _v; }
        public long strOff() { return strOff; }
        public void setStrOff(long _v) { _dirty = true; strOff = _v; }
        public long strSize() { return strSize; }
        public void setStrSize(long _v) { _dirty = true; strSize = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_strs() { return _raw_strs; }
        public void set_raw_Strs(byte[] _v) { _dirty = true; _raw_strs = _v; }
    }
    public static class TwolevelHintsCommand extends KaitaiStruct.ReadWrite {
        public static TwolevelHintsCommand fromFile(String fileName) throws IOException {
            return new TwolevelHintsCommand(new ByteBufferKaitaiStream(fileName));
        }
        public TwolevelHintsCommand() {
            this(null, null, null);
        }

        public TwolevelHintsCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TwolevelHintsCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public TwolevelHintsCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.offset = this._io.readU4le();
            this.numHints = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.offset);
            this._io.writeU4le(this.numHints);
        }

        public void _check() {
            _dirty = false;
        }
        private long offset;
        private long numHints;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public long numHints() { return numHints; }
        public void setNumHints(long _v) { _dirty = true; numHints = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class Uleb128 extends KaitaiStruct.ReadWrite {
        public static Uleb128 fromFile(String fileName) throws IOException {
            return new Uleb128(new ByteBufferKaitaiStream(fileName));
        }
        public Uleb128() {
            this(null, null, null);
        }

        public Uleb128(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Uleb128(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Uleb128(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.b1 = this._io.readU1();
            if ((b1() & 128) != 0) {
                this.b2 = this._io.readU1();
            }
            if ((b2() & 128) != 0) {
                this.b3 = this._io.readU1();
            }
            if ((b3() & 128) != 0) {
                this.b4 = this._io.readU1();
            }
            if ((b4() & 128) != 0) {
                this.b5 = this._io.readU1();
            }
            if ((b5() & 128) != 0) {
                this.b6 = this._io.readU1();
            }
            if ((b6() & 128) != 0) {
                this.b7 = this._io.readU1();
            }
            if ((b7() & 128) != 0) {
                this.b8 = this._io.readU1();
            }
            if ((b8() & 128) != 0) {
                this.b9 = this._io.readU1();
            }
            if ((b9() & 128) != 0) {
                this.b10 = this._io.readU1();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if ((b1() & 128) != 0) {
            }
            if ((b2() & 128) != 0) {
            }
            if ((b3() & 128) != 0) {
            }
            if ((b4() & 128) != 0) {
            }
            if ((b5() & 128) != 0) {
            }
            if ((b6() & 128) != 0) {
            }
            if ((b7() & 128) != 0) {
            }
            if ((b8() & 128) != 0) {
            }
            if ((b9() & 128) != 0) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.b1);
            if ((b1() & 128) != 0) {
                this._io.writeU1(this.b2);
            }
            if ((b2() & 128) != 0) {
                this._io.writeU1(this.b3);
            }
            if ((b3() & 128) != 0) {
                this._io.writeU1(this.b4);
            }
            if ((b4() & 128) != 0) {
                this._io.writeU1(this.b5);
            }
            if ((b5() & 128) != 0) {
                this._io.writeU1(this.b6);
            }
            if ((b6() & 128) != 0) {
                this._io.writeU1(this.b7);
            }
            if ((b7() & 128) != 0) {
                this._io.writeU1(this.b8);
            }
            if ((b8() & 128) != 0) {
                this._io.writeU1(this.b9);
            }
            if ((b9() & 128) != 0) {
                this._io.writeU1(this.b10);
            }
        }

        public void _check() {
            if ((b1() & 128) != 0) {
            }
            if ((b2() & 128) != 0) {
            }
            if ((b3() & 128) != 0) {
            }
            if ((b4() & 128) != 0) {
            }
            if ((b5() & 128) != 0) {
            }
            if ((b6() & 128) != 0) {
            }
            if ((b7() & 128) != 0) {
            }
            if ((b8() & 128) != 0) {
            }
            if ((b9() & 128) != 0) {
            }
            _dirty = false;
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) ((KaitaiStream.mod(b1(), 128) << 0) + ((b1() & 128) == 0 ? 0 : (KaitaiStream.mod(b2(), 128) << 7) + ((b2() & 128) == 0 ? 0 : (KaitaiStream.mod(b3(), 128) << 14) + ((b3() & 128) == 0 ? 0 : (KaitaiStream.mod(b4(), 128) << 21) + ((b4() & 128) == 0 ? 0 : (KaitaiStream.mod(b5(), 128) << 28) + ((b5() & 128) == 0 ? 0 : (KaitaiStream.mod(b6(), 128) << 35) + ((b6() & 128) == 0 ? 0 : (KaitaiStream.mod(b7(), 128) << 42) + ((b7() & 128) == 0 ? 0 : (KaitaiStream.mod(b8(), 128) << 49) + ((b8() & 128) == 0 ? 0 : (KaitaiStream.mod(b9(), 128) << 56) + ((b8() & 128) == 0 ? 0 : KaitaiStream.mod(b10(), 128) << 63))))))))))).intValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private int b1;
        private Integer b2;
        private Integer b3;
        private Integer b4;
        private Integer b5;
        private Integer b6;
        private Integer b7;
        private Integer b8;
        private Integer b9;
        private Integer b10;
        private MachO _root;
        private KaitaiStruct.ReadWrite _parent;
        public int b1() { return b1; }
        public void setB1(int _v) { _dirty = true; b1 = _v; }
        public Integer b2() { return b2; }
        public void setB2(Integer _v) { _dirty = true; b2 = _v; }
        public Integer b3() { return b3; }
        public void setB3(Integer _v) { _dirty = true; b3 = _v; }
        public Integer b4() { return b4; }
        public void setB4(Integer _v) { _dirty = true; b4 = _v; }
        public Integer b5() { return b5; }
        public void setB5(Integer _v) { _dirty = true; b5 = _v; }
        public Integer b6() { return b6; }
        public void setB6(Integer _v) { _dirty = true; b6 = _v; }
        public Integer b7() { return b7; }
        public void setB7(Integer _v) { _dirty = true; b7 = _v; }
        public Integer b8() { return b8; }
        public void setB8(Integer _v) { _dirty = true; b8 = _v; }
        public Integer b9() { return b9; }
        public void setB9(Integer _v) { _dirty = true; b9 = _v; }
        public Integer b10() { return b10; }
        public void setB10(Integer _v) { _dirty = true; b10 = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class UuidCommand extends KaitaiStruct.ReadWrite {
        public static UuidCommand fromFile(String fileName) throws IOException {
            return new UuidCommand(new ByteBufferKaitaiStream(fileName));
        }
        public UuidCommand() {
            this(null, null, null);
        }

        public UuidCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public UuidCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public UuidCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.uuid = this._io.readBytes(16);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.uuid);
        }

        public void _check() {
            if (this.uuid.length != 16)
                throw new ConsistencyError("uuid", 16, this.uuid.length);
            _dirty = false;
        }
        private byte[] uuid;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public byte[] uuid() { return uuid; }
        public void setUuid(byte[] _v) { _dirty = true; uuid = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class Version extends KaitaiStruct.ReadWrite {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }
        public Version() {
            this(null, null, null);
        }

        public Version(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Version(KaitaiStream _io, MachO.VersionMinCommand _parent) {
            this(_io, _parent, null);
        }

        public Version(KaitaiStream _io, MachO.VersionMinCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.p1 = this._io.readU1();
            this.minor = this._io.readU1();
            this.major = this._io.readU1();
            this.release = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.p1);
            this._io.writeU1(this.minor);
            this._io.writeU1(this.major);
            this._io.writeU1(this.release);
        }

        public void _check() {
            _dirty = false;
        }
        private int p1;
        private int minor;
        private int major;
        private int release;
        private MachO _root;
        private MachO.VersionMinCommand _parent;
        public int p1() { return p1; }
        public void setP1(int _v) { _dirty = true; p1 = _v; }
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public int release() { return release; }
        public void setRelease(int _v) { _dirty = true; release = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.VersionMinCommand _parent() { return _parent; }
        public void set_parent(MachO.VersionMinCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class VersionMinCommand extends KaitaiStruct.ReadWrite {
        public static VersionMinCommand fromFile(String fileName) throws IOException {
            return new VersionMinCommand(new ByteBufferKaitaiStream(fileName));
        }
        public VersionMinCommand() {
            this(null, null, null);
        }

        public VersionMinCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public VersionMinCommand(KaitaiStream _io, MachO.LoadCommand _parent) {
            this(_io, _parent, null);
        }

        public VersionMinCommand(KaitaiStream _io, MachO.LoadCommand _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = new Version(this._io, this, _root);
            this.version._read();
            this.sdk = new Version(this._io, this, _root);
            this.sdk._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
            this.sdk._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.version._write_Seq(this._io);
            this.sdk._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if (!Objects.equals(this.sdk._root(), _root()))
                throw new ConsistencyError("sdk", _root(), this.sdk._root());
            if (!Objects.equals(this.sdk._parent(), this))
                throw new ConsistencyError("sdk", this, this.sdk._parent());
            _dirty = false;
        }
        private Version version;
        private Version sdk;
        private MachO _root;
        private MachO.LoadCommand _parent;
        public Version version() { return version; }
        public void setVersion(Version _v) { _dirty = true; version = _v; }
        public Version sdk() { return sdk; }
        public void setSdk(Version _v) { _dirty = true; sdk = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public MachO.LoadCommand _parent() { return _parent; }
        public void set_parent(MachO.LoadCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class VmProt extends KaitaiStruct.ReadWrite {
        public static VmProt fromFile(String fileName) throws IOException {
            return new VmProt(new ByteBufferKaitaiStream(fileName));
        }
        public VmProt() {
            this(null, null, null);
        }

        public VmProt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public VmProt(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public VmProt(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachO _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.stripRead = this._io.readBitsIntBe(1) != 0;
            this.isMask = this._io.readBitsIntBe(1) != 0;
            this.reserved0 = this._io.readBitsIntBe(1) != 0;
            this.copy = this._io.readBitsIntBe(1) != 0;
            this.noChange = this._io.readBitsIntBe(1) != 0;
            this.execute = this._io.readBitsIntBe(1) != 0;
            this.write = this._io.readBitsIntBe(1) != 0;
            this.read = this._io.readBitsIntBe(1) != 0;
            this.reserved1 = this._io.readBitsIntBe(24);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.stripRead ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isMask ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.reserved0 ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.copy ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.noChange ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.execute ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.write ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.read ? 1 : 0));
            this._io.writeBitsIntBe(24, this.reserved1);
        }

        public void _check() {
            _dirty = false;
        }
        private boolean stripRead;
        private boolean isMask;
        private boolean reserved0;
        private boolean copy;
        private boolean noChange;
        private boolean execute;
        private boolean write;
        private boolean read;
        private long reserved1;
        private MachO _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * Special marker to support execute-only protection.
         */
        public boolean stripRead() { return stripRead; }
        public void setStripRead(boolean _v) { _dirty = true; stripRead = _v; }

        /**
         * Indicates to use value as a mask against the actual protection bits.
         */
        public boolean isMask() { return isMask; }
        public void setIsMask(boolean _v) { _dirty = true; isMask = _v; }

        /**
         * Reserved (unused) bit.
         */
        public boolean reserved0() { return reserved0; }
        public void setReserved0(boolean _v) { _dirty = true; reserved0 = _v; }

        /**
         * Used when write permission can not be obtained, to mark the entry as COW.
         */
        public boolean copy() { return copy; }
        public void setCopy(boolean _v) { _dirty = true; copy = _v; }

        /**
         * Used only by memory_object_lock_request to indicate no change to page locks.
         */
        public boolean noChange() { return noChange; }
        public void setNoChange(boolean _v) { _dirty = true; noChange = _v; }

        /**
         * Execute permission.
         */
        public boolean execute() { return execute; }
        public void setExecute(boolean _v) { _dirty = true; execute = _v; }

        /**
         * Write permission.
         */
        public boolean write() { return write; }
        public void setWrite(boolean _v) { _dirty = true; write = _v; }

        /**
         * Read permission.
         */
        public boolean read() { return read; }
        public void setRead(boolean _v) { _dirty = true; read = _v; }

        /**
         * Reserved (unused) bits.
         */
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
        public MachO _root() { return _root; }
        public void set_root(MachO _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private MagicType magic;
    private MachHeader header;
    private List<LoadCommand> loadCommands;
    private MachO _root;
    private KaitaiStruct.ReadWrite _parent;
    public MagicType magic() { return magic; }
    public void setMagic(MagicType _v) { _dirty = true; magic = _v; }
    public MachHeader header() { return header; }
    public void setHeader(MachHeader _v) { _dirty = true; header = _v; }
    public List<LoadCommand> loadCommands() { return loadCommands; }
    public void setLoadCommands(List<LoadCommand> _v) { _dirty = true; loadCommands = _v; }
    public MachO _root() { return _root; }
    public void set_root(MachO _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
