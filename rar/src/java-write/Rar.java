// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.util.List;


/**
 * RAR is a archive format used by popular proprietary RAR archiver,
 * created by Eugene Roshal. There are two major versions of format
 * (v1.5-4.0 and RAR v5+).
 * 
 * File format essentially consists of a linear sequence of
 * blocks. Each block has fixed header and custom body (that depends on
 * block type), so it's possible to skip block even if one doesn't know
 * how to process a certain block type.
 * @see <a href="http://acritum.com/winrar/rar-format">Source</a>
 */
public class Rar extends KaitaiStruct.ReadWrite {
    public static Rar fromFile(String fileName) throws IOException {
        return new Rar(new ByteBufferKaitaiStream(fileName));
    }

    public enum BlockTypes {
        MARKER(114),
        ARCHIVE_HEADER(115),
        FILE_HEADER(116),
        OLD_STYLE_COMMENT_HEADER(117),
        OLD_STYLE_AUTHENTICITY_INFO_76(118),
        OLD_STYLE_SUBBLOCK(119),
        OLD_STYLE_RECOVERY_RECORD(120),
        OLD_STYLE_AUTHENTICITY_INFO_79(121),
        SUBBLOCK(122),
        TERMINATOR(123);

        private final long id;
        BlockTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BlockTypes> byId = new HashMap<Long, BlockTypes>(10);
        static {
            for (BlockTypes e : BlockTypes.values())
                byId.put(e.id(), e);
        }
        public static BlockTypes byId(long id) { return byId.get(id); }
    }

    public enum Methods {
        STORE(48),
        FASTEST(49),
        FAST(50),
        NORMAL(51),
        GOOD(52),
        BEST(53);

        private final long id;
        Methods(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Methods> byId = new HashMap<Long, Methods>(6);
        static {
            for (Methods e : Methods.values())
                byId.put(e.id(), e);
        }
        public static Methods byId(long id) { return byId.get(id); }
    }

    public enum Oses {
        MS_DOS(0),
        OS_2(1),
        WINDOWS(2),
        UNIX(3),
        MAC_OS(4),
        BEOS(5);

        private final long id;
        Oses(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Oses> byId = new HashMap<Long, Oses>(6);
        static {
            for (Oses e : Oses.values())
                byId.put(e.id(), e);
        }
        public static Oses byId(long id) { return byId.get(id); }
    }
    public Rar() {
        this(null, null, null);
    }

    public Rar(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Rar(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Rar(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Rar _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = new MagicSignature(this._io, this, _root);
        this.magic._read();
        this.blocks = new ArrayList<KaitaiStruct.ReadWrite>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                switch (magic().version()) {
                case 0: {
                    Block _t_blocks = new Block(this._io, this, _root);
                    try {
                        ((Block) (_t_blocks))._read();
                    } finally {
                        this.blocks.add(_t_blocks);
                    }
                    break;
                }
                case 1: {
                    BlockV5 _t_blocks = new BlockV5(this._io, this, _root);
                    try {
                        ((BlockV5) (_t_blocks))._read();
                    } finally {
                        this.blocks.add(_t_blocks);
                    }
                    break;
                }
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.magic._fetchInstances();
        for (int i = 0; i < this.blocks.size(); i++) {
            switch (magic().version()) {
            case 0: {
                ((Block) (this.blocks.get(((Number) (i)).intValue())))._fetchInstances();
                break;
            }
            case 1: {
                ((BlockV5) (this.blocks.get(((Number) (i)).intValue())))._fetchInstances();
                break;
            }
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.magic._write_Seq(this._io);
        for (int i = 0; i < this.blocks.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("blocks", 0, this._io.size() - this._io.pos());
            switch (magic().version()) {
            case 0: {
                ((Block) (this.blocks.get(((Number) (i)).intValue())))._write_Seq(this._io);
                break;
            }
            case 1: {
                ((BlockV5) (this.blocks.get(((Number) (i)).intValue())))._write_Seq(this._io);
                break;
            }
            }
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("blocks", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.magic._root(), _root()))
            throw new ConsistencyError("magic", _root(), this.magic._root());
        if (!Objects.equals(this.magic._parent(), this))
            throw new ConsistencyError("magic", this, this.magic._parent());
        for (int i = 0; i < this.blocks.size(); i++) {
            switch (magic().version()) {
            case 0: {
                if (!Objects.equals(((Rar.Block) (this.blocks.get(((Number) (i)).intValue())))._root(), _root()))
                    throw new ConsistencyError("blocks", _root(), ((Rar.Block) (this.blocks.get(((Number) (i)).intValue())))._root());
                if (!Objects.equals(((Rar.Block) (this.blocks.get(((Number) (i)).intValue())))._parent(), this))
                    throw new ConsistencyError("blocks", this, ((Rar.Block) (this.blocks.get(((Number) (i)).intValue())))._parent());
                break;
            }
            case 1: {
                if (!Objects.equals(((Rar.BlockV5) (this.blocks.get(((Number) (i)).intValue())))._root(), _root()))
                    throw new ConsistencyError("blocks", _root(), ((Rar.BlockV5) (this.blocks.get(((Number) (i)).intValue())))._root());
                if (!Objects.equals(((Rar.BlockV5) (this.blocks.get(((Number) (i)).intValue())))._parent(), this))
                    throw new ConsistencyError("blocks", this, ((Rar.BlockV5) (this.blocks.get(((Number) (i)).intValue())))._parent());
                break;
            }
            }
        }
        _dirty = false;
    }

    /**
     * Basic block that RAR files consist of. There are several block
     * types (see `block_type`), which have different `body` and
     * `add_body`.
     */
    public static class Block extends KaitaiStruct.ReadWrite {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }
        public Block() {
            this(null, null, null);
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, Rar _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, Rar _parent, Rar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.crc16 = this._io.readU2le();
            this.blockType = Rar.BlockTypes.byId(this._io.readU1());
            this.flags = this._io.readU2le();
            this.blockSize = this._io.readU2le();
            if (hasAdd()) {
                this.addSize = this._io.readU4le();
            }
            {
                BlockTypes on = blockType();
                if (on != null) {
                    switch (blockType()) {
                    case FILE_HEADER: {
                        this._raw_body = this._io.readBytes(bodySize());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new BlockFileHeader(_io__raw_body, this, _root);
                        ((BlockFileHeader) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(bodySize());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(bodySize());
                }
            }
            if (hasAdd()) {
                this.addBody = this._io.readBytes(addSize());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasAdd()) {
            }
            {
                BlockTypes on = blockType();
                if (on != null) {
                    switch (blockType()) {
                    case FILE_HEADER: {
                        ((BlockFileHeader) (this.body))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
            if (hasAdd()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.crc16);
            this._io.writeU1(((Number) (this.blockType.id())).intValue());
            this._io.writeU2le(this.flags);
            this._io.writeU2le(this.blockSize);
            if (hasAdd()) {
                this._io.writeU4le(this.addSize);
            }
            {
                BlockTypes on = blockType();
                if (on != null) {
                    switch (blockType()) {
                    case FILE_HEADER: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(bodySize());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (bodySize()));
                            final Block _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != bodySize())
                                        throw new ConsistencyError("raw(body)", bodySize(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((BlockFileHeader) (this.body))._write_Seq(_io__raw_body);
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
            if (hasAdd()) {
                this._io.writeBytes(this.addBody);
            }
        }

        public void _check() {
            if (hasAdd()) {
            }
            {
                BlockTypes on = blockType();
                if (on != null) {
                    switch (blockType()) {
                    case FILE_HEADER: {
                        if (!Objects.equals(((Rar.BlockFileHeader) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Rar.BlockFileHeader) (this.body))._root());
                        if (!Objects.equals(((Rar.BlockFileHeader) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Rar.BlockFileHeader) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != bodySize())
                            throw new ConsistencyError("body", bodySize(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != bodySize())
                        throw new ConsistencyError("body", bodySize(), ((byte[]) (this.body)).length);
                }
            }
            if (hasAdd()) {
                if (this.addBody.length != addSize())
                    throw new ConsistencyError("add_body", addSize(), this.addBody.length);
            }
            _dirty = false;
        }
        private Integer bodySize;
        public Integer bodySize() {
            if (this.bodySize != null)
                return this.bodySize;
            this.bodySize = ((Number) (blockSize() - headerSize())).intValue();
            return this.bodySize;
        }
        public void _invalidateBodySize() { this.bodySize = null; }
        private Boolean hasAdd;

        /**
         * True if block has additional content attached to it
         */
        public Boolean hasAdd() {
            if (this.hasAdd != null)
                return this.hasAdd;
            this.hasAdd = (flags() & 32768) != 0;
            return this.hasAdd;
        }
        public void _invalidateHasAdd() { this.hasAdd = null; }
        private Byte headerSize;
        public Byte headerSize() {
            if (this.headerSize != null)
                return this.headerSize;
            this.headerSize = ((Number) ((hasAdd() ? 11 : 7))).byteValue();
            return this.headerSize;
        }
        public void _invalidateHeaderSize() { this.headerSize = null; }
        private int crc16;
        private BlockTypes blockType;
        private int flags;
        private int blockSize;
        private Long addSize;
        private Object body;
        private byte[] addBody;
        private Rar _root;
        private Rar _parent;
        private byte[] _raw_body;

        /**
         * CRC16 of whole block or some part of it (depends on block type)
         */
        public int crc16() { return crc16; }
        public void setCrc16(int _v) { _dirty = true; crc16 = _v; }
        public BlockTypes blockType() { return blockType; }
        public void setBlockType(BlockTypes _v) { _dirty = true; blockType = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }

        /**
         * Size of block (header + body, but without additional content)
         */
        public int blockSize() { return blockSize; }
        public void setBlockSize(int _v) { _dirty = true; blockSize = _v; }

        /**
         * Size of additional content in this block
         */
        public Long addSize() { return addSize; }
        public void setAddSize(Long _v) { _dirty = true; addSize = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }

        /**
         * Additional content in this block
         */
        public byte[] addBody() { return addBody; }
        public void setAddBody(byte[] _v) { _dirty = true; addBody = _v; }
        public Rar _root() { return _root; }
        public void set_root(Rar _v) { _dirty = true; _root = _v; }
        public Rar _parent() { return _parent; }
        public void set_parent(Rar _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class BlockFileHeader extends KaitaiStruct.ReadWrite {
        public static BlockFileHeader fromFile(String fileName) throws IOException {
            return new BlockFileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public BlockFileHeader() {
            this(null, null, null);
        }

        public BlockFileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockFileHeader(KaitaiStream _io, Rar.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockFileHeader(KaitaiStream _io, Rar.Block _parent, Rar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lowUnpSize = this._io.readU4le();
            this.hostOs = Rar.Oses.byId(this._io.readU1());
            this.fileCrc32 = this._io.readU4le();
            this._raw_fileTime = this._io.readBytes(4);
            KaitaiStream _io__raw_fileTime = new ByteBufferKaitaiStream(this._raw_fileTime);
            this.fileTime = new DosDatetime(_io__raw_fileTime);
            this.fileTime._read();
            this.rarVersion = this._io.readU1();
            this.method = Rar.Methods.byId(this._io.readU1());
            this.nameSize = this._io.readU2le();
            this.attr = this._io.readU4le();
            if ((_parent().flags() & 256) != 0) {
                this.highPackSize = this._io.readU4le();
            }
            this.fileName = this._io.readBytes(nameSize());
            if ((_parent().flags() & 1024) != 0) {
                this.salt = this._io.readU8le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.fileTime._fetchInstances();
            if ((_parent().flags() & 256) != 0) {
            }
            if ((_parent().flags() & 1024) != 0) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lowUnpSize);
            this._io.writeU1(((Number) (this.hostOs.id())).intValue());
            this._io.writeU4le(this.fileCrc32);
            final KaitaiStream _io__raw_fileTime = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_fileTime);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final BlockFileHeader _this = this;
                _io__raw_fileTime.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_fileTime = _io__raw_fileTime.toByteArray();
                        if (_this._raw_fileTime.length != 4)
                            throw new ConsistencyError("raw(file_time)", 4, _this._raw_fileTime.length);
                        parent.writeBytes(_this._raw_fileTime);
                    }
                });
            }
            this.fileTime._write_Seq(_io__raw_fileTime);
            this._io.writeU1(this.rarVersion);
            this._io.writeU1(((Number) (this.method.id())).intValue());
            this._io.writeU2le(this.nameSize);
            this._io.writeU4le(this.attr);
            if ((_parent().flags() & 256) != 0) {
                this._io.writeU4le(this.highPackSize);
            }
            this._io.writeBytes(this.fileName);
            if ((_parent().flags() & 1024) != 0) {
                this._io.writeU8le(this.salt);
            }
        }

        public void _check() {
            if ((_parent().flags() & 256) != 0) {
            }
            if (this.fileName.length != nameSize())
                throw new ConsistencyError("file_name", nameSize(), this.fileName.length);
            if ((_parent().flags() & 1024) != 0) {
            }
            _dirty = false;
        }
        private long lowUnpSize;
        private Oses hostOs;
        private long fileCrc32;
        private DosDatetime fileTime;
        private int rarVersion;
        private Methods method;
        private int nameSize;
        private long attr;
        private Long highPackSize;
        private byte[] fileName;
        private Long salt;
        private Rar _root;
        private Rar.Block _parent;
        private byte[] _raw_fileTime;

        /**
         * Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
         */
        public long lowUnpSize() { return lowUnpSize; }
        public void setLowUnpSize(long _v) { _dirty = true; lowUnpSize = _v; }

        /**
         * Operating system used for archiving
         */
        public Oses hostOs() { return hostOs; }
        public void setHostOs(Oses _v) { _dirty = true; hostOs = _v; }
        public long fileCrc32() { return fileCrc32; }
        public void setFileCrc32(long _v) { _dirty = true; fileCrc32 = _v; }

        /**
         * Date and time in standard MS DOS format
         */
        public DosDatetime fileTime() { return fileTime; }
        public void setFileTime(DosDatetime _v) { _dirty = true; fileTime = _v; }

        /**
         * RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
         */
        public int rarVersion() { return rarVersion; }
        public void setRarVersion(int _v) { _dirty = true; rarVersion = _v; }

        /**
         * Compression method
         */
        public Methods method() { return method; }
        public void setMethod(Methods _v) { _dirty = true; method = _v; }

        /**
         * File name size
         */
        public int nameSize() { return nameSize; }
        public void setNameSize(int _v) { _dirty = true; nameSize = _v; }

        /**
         * File attributes
         */
        public long attr() { return attr; }
        public void setAttr(long _v) { _dirty = true; attr = _v; }

        /**
         * Compressed file size, high 32 bits, only if 64-bit header flag is present
         */
        public Long highPackSize() { return highPackSize; }
        public void setHighPackSize(Long _v) { _dirty = true; highPackSize = _v; }
        public byte[] fileName() { return fileName; }
        public void setFileName(byte[] _v) { _dirty = true; fileName = _v; }
        public Long salt() { return salt; }
        public void setSalt(Long _v) { _dirty = true; salt = _v; }
        public Rar _root() { return _root; }
        public void set_root(Rar _v) { _dirty = true; _root = _v; }
        public Rar.Block _parent() { return _parent; }
        public void set_parent(Rar.Block _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_fileTime() { return _raw_fileTime; }
        public void set_raw_FileTime(byte[] _v) { _dirty = true; _raw_fileTime = _v; }
    }
    public static class BlockV5 extends KaitaiStruct.ReadWrite {
        public static BlockV5 fromFile(String fileName) throws IOException {
            return new BlockV5(new ByteBufferKaitaiStream(fileName));
        }
        public BlockV5() {
            this(null, null, null);
        }

        public BlockV5(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockV5(KaitaiStream _io, Rar _parent) {
            this(_io, _parent, null);
        }

        public BlockV5(KaitaiStream _io, Rar _parent, Rar _root) {
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
        private Rar _root;
        private Rar _parent;
        public Rar _root() { return _root; }
        public void set_root(Rar _v) { _dirty = true; _root = _v; }
        public Rar _parent() { return _parent; }
        public void set_parent(Rar _v) { _dirty = true; _parent = _v; }
    }

    /**
     * RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
     * 8-byte magic (and pretty different block format) for v5+. This
     * type would parse and validate both versions of signature. Note
     * that actually this signature is a valid RAR "block": in theory,
     * one can omit signature reading at all, and read this normally,
     * as a block, if exact RAR version is known (and thus it's
     * possible to choose correct block format).
     */
    public static class MagicSignature extends KaitaiStruct.ReadWrite {
        public static MagicSignature fromFile(String fileName) throws IOException {
            return new MagicSignature(new ByteBufferKaitaiStream(fileName));
        }
        public MagicSignature() {
            this(null, null, null);
        }

        public MagicSignature(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MagicSignature(KaitaiStream _io, Rar _parent) {
            this(_io, _parent, null);
        }

        public MagicSignature(KaitaiStream _io, Rar _parent, Rar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic1 = this._io.readBytes(6);
            if (!(Arrays.equals(this.magic1, new byte[] { 82, 97, 114, 33, 26, 7 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 97, 114, 33, 26, 7 }, this.magic1, this._io, "/types/magic_signature/seq/0");
            }
            this.version = this._io.readU1();
            if (version() == 1) {
                this.magic3 = this._io.readBytes(1);
                if (!(Arrays.equals(this.magic3, new byte[] { 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.magic3, this._io, "/types/magic_signature/seq/2");
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (version() == 1) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic1);
            this._io.writeU1(this.version);
            if (version() == 1) {
                this._io.writeBytes(this.magic3);
            }
        }

        public void _check() {
            if (this.magic1.length != 6)
                throw new ConsistencyError("magic1", 6, this.magic1.length);
            if (!(Arrays.equals(this.magic1, new byte[] { 82, 97, 114, 33, 26, 7 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 97, 114, 33, 26, 7 }, this.magic1, null, "/types/magic_signature/seq/0");
            }
            if (version() == 1) {
                if (this.magic3.length != 1)
                    throw new ConsistencyError("magic3", 1, this.magic3.length);
                if (!(Arrays.equals(this.magic3, new byte[] { 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.magic3, null, "/types/magic_signature/seq/2");
                }
            }
            _dirty = false;
        }
        private byte[] magic1;
        private int version;
        private byte[] magic3;
        private Rar _root;
        private Rar _parent;

        /**
         * Fixed part of file's magic signature that doesn't change with RAR version
         */
        public byte[] magic1() { return magic1; }
        public void setMagic1(byte[] _v) { _dirty = true; magic1 = _v; }

        /**
         * Variable part of magic signature: 0 means old (RAR 1.5-4.0)
         * format, 1 means new (RAR 5+) format
         */
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }

        /**
         * New format (RAR 5+) magic contains extra byte
         */
        public byte[] magic3() { return magic3; }
        public void setMagic3(byte[] _v) { _dirty = true; magic3 = _v; }
        public Rar _root() { return _root; }
        public void set_root(Rar _v) { _dirty = true; _root = _v; }
        public Rar _parent() { return _parent; }
        public void set_parent(Rar _v) { _dirty = true; _parent = _v; }
    }
    private MagicSignature magic;
    private List<KaitaiStruct.ReadWrite> blocks;
    private Rar _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * File format signature to validate that it is indeed a RAR archive
     */
    public MagicSignature magic() { return magic; }
    public void setMagic(MagicSignature _v) { _dirty = true; magic = _v; }

    /**
     * Sequence of blocks that constitute the RAR file
     */
    public List<KaitaiStruct.ReadWrite> blocks() { return blocks; }
    public void setBlocks(List<KaitaiStruct.ReadWrite> _v) { _dirty = true; blocks = _v; }
    public Rar _root() { return _root; }
    public void set_root(Rar _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
