// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
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
public class Rar extends KaitaiStruct {
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

    public Rar(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Rar(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Rar(KaitaiStream _io, KaitaiStruct _parent, Rar _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = new MagicSignature(this._io, this, _root);
        this.blocks = new ArrayList<KaitaiStruct>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                switch (magic().version()) {
                case 0: {
                    this.blocks.add(new Block(this._io, this, _root));
                    break;
                }
                case 1: {
                    this.blocks.add(new BlockV5(this._io, this, _root));
                    break;
                }
                }
                i++;
            }
        }
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

    /**
     * Basic block that RAR files consist of. There are several block
     * types (see `block_type`), which have different `body` and
     * `add_body`.
     */
    public static class Block extends KaitaiStruct {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
                        KaitaiStream _io_body = this._io.substream(bodySize());
                        this.body = new BlockFileHeader(_io_body, this, _root);
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
        private Integer bodySize;
        public Integer bodySize() {
            if (this.bodySize != null)
                return this.bodySize;
            this.bodySize = ((Number) (blockSize() - headerSize())).intValue();
            return this.bodySize;
        }
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
        private Byte headerSize;
        public Byte headerSize() {
            if (this.headerSize != null)
                return this.headerSize;
            this.headerSize = ((Number) ((hasAdd() ? 11 : 7))).byteValue();
            return this.headerSize;
        }
        private int crc16;
        private BlockTypes blockType;
        private int flags;
        private int blockSize;
        private Long addSize;
        private Object body;
        private byte[] addBody;
        private Rar _root;
        private Rar _parent;

        /**
         * CRC16 of whole block or some part of it (depends on block type)
         */
        public int crc16() { return crc16; }
        public BlockTypes blockType() { return blockType; }
        public int flags() { return flags; }

        /**
         * Size of block (header + body, but without additional content)
         */
        public int blockSize() { return blockSize; }

        /**
         * Size of additional content in this block
         */
        public Long addSize() { return addSize; }
        public Object body() { return body; }

        /**
         * Additional content in this block
         */
        public byte[] addBody() { return addBody; }
        public Rar _root() { return _root; }
        public Rar _parent() { return _parent; }
    }
    public static class BlockFileHeader extends KaitaiStruct {
        public static BlockFileHeader fromFile(String fileName) throws IOException {
            return new BlockFileHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lowUnpSize = this._io.readU4le();
            this.hostOs = Rar.Oses.byId(this._io.readU1());
            this.fileCrc32 = this._io.readU4le();
            KaitaiStream _io_fileTime = this._io.substream(4);
            this.fileTime = new DosDatetime(_io_fileTime);
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
        }

        public void _fetchInstances() {
            this.fileTime._fetchInstances();
            if ((_parent().flags() & 256) != 0) {
            }
            if ((_parent().flags() & 1024) != 0) {
            }
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

        /**
         * Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
         */
        public long lowUnpSize() { return lowUnpSize; }

        /**
         * Operating system used for archiving
         */
        public Oses hostOs() { return hostOs; }
        public long fileCrc32() { return fileCrc32; }

        /**
         * Date and time in standard MS DOS format
         */
        public DosDatetime fileTime() { return fileTime; }

        /**
         * RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
         */
        public int rarVersion() { return rarVersion; }

        /**
         * Compression method
         */
        public Methods method() { return method; }

        /**
         * File name size
         */
        public int nameSize() { return nameSize; }

        /**
         * File attributes
         */
        public long attr() { return attr; }

        /**
         * Compressed file size, high 32 bits, only if 64-bit header flag is present
         */
        public Long highPackSize() { return highPackSize; }
        public byte[] fileName() { return fileName; }
        public Long salt() { return salt; }
        public Rar _root() { return _root; }
        public Rar.Block _parent() { return _parent; }
    }
    public static class BlockV5 extends KaitaiStruct {
        public static BlockV5 fromFile(String fileName) throws IOException {
            return new BlockV5(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
        }

        public void _fetchInstances() {
        }
        private Rar _root;
        private Rar _parent;
        public Rar _root() { return _root; }
        public Rar _parent() { return _parent; }
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
    public static class MagicSignature extends KaitaiStruct {
        public static MagicSignature fromFile(String fileName) throws IOException {
            return new MagicSignature(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
            if (version() == 1) {
            }
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

        /**
         * Variable part of magic signature: 0 means old (RAR 1.5-4.0)
         * format, 1 means new (RAR 5+) format
         */
        public int version() { return version; }

        /**
         * New format (RAR 5+) magic contains extra byte
         */
        public byte[] magic3() { return magic3; }
        public Rar _root() { return _root; }
        public Rar _parent() { return _parent; }
    }
    private MagicSignature magic;
    private List<KaitaiStruct> blocks;
    private Rar _root;
    private KaitaiStruct _parent;

    /**
     * File format signature to validate that it is indeed a RAR archive
     */
    public MagicSignature magic() { return magic; }

    /**
     * Sequence of blocks that constitute the RAR file
     */
    public List<KaitaiStruct> blocks() { return blocks; }
    public Rar _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
