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


/**
 * UBIFS is a file system for raw flash memory devices. It works on top of
 * UBI (Unsorted Block Images), which works as an abstraction layer so UBIFS
 * does not need to care about low level details. This specification only covers
 * UBIFS, not UBI.
 * 
 * A UBIFS image is divided into several Logical Erase Blocks (LEB). The first
 * LEB (LEB0) contains the superblock node, which includes information about LEB
 * size, amongst others. The next two LEBs (LEB1 and LEB2) comprise the so called
 * "master area" and both contain a copy of the master node, which includes
 * information about where to find the root index node, which is then used to
 * access all the files on the file system.
 * 
 * **Limitations of this Kaitai Struct implementation:**
 * 
 * 1. It only supports UBIFS images created by `mkfs.ubifs` (such as those in
 *    firmware images built by OpenWrt), not file systems modified after
 *    creation, e.g. by writing files to them on a running Linux system. The
 *    Linux kernel appends a new copy of the master node to LEB1 and LEB2
 *    whenever it mounts the file system read-write, unmounts it, or commits
 *    changes (updates the index on flash to include them). When mounting, Linux
 *    uses the
 *    [last copy](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L84-L165),
 *    whereas this implementation reads the first one (`master_1`), which still
 *    describes the file system as it was created. Changes made since then are
 *    therefore not visible via `index_root`.
 * 2. Changes that have not been committed yet are not in the index at all, so
 *    they are not visible via `index_root` either. Until they are committed,
 *    UBIFS keeps them only in the journal. This only matters for file systems
 *    that were not unmounted cleanly, because unmounting
 *    [commits](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/super.c#L486-L493)
 *    all changes.
 * 3. Parsing doesn't advance the stream position. This implementation reads
 *    the image only through instances, so that parsing doesn't copy the
 *    whole image into memory. To find where the image ends, e.g. when
 *    carving it out of a larger file, use `len_image`. For the same reason,
 *    parsing doesn't fail if the image is truncated. To detect that, check
 *    that the stream is at least `len_image` bytes long
 *    (`_io.size >= len_image`).
 * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h">Git tag "v7.2"</a>
 * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h">Git tag "v7.2"</a>
 * @see <a href="http://www.linux-mtd.infradead.org/doc/ubifs.pdf">Source</a>
 */
public class Ubifs extends KaitaiStruct {
    public static Ubifs fromFile(String fileName) throws IOException {
        return new Ubifs(new ByteBufferKaitaiStream(fileName));
    }

    public enum Compression {
        NO_COMPRESSION(0),
        LZO(1),
        ZLIB(2),
        ZSTD(3);

        private final long id;
        Compression(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Compression> byId = new HashMap<Long, Compression>(4);
        static {
            for (Compression e : Compression.values())
                byId.put(e.id(), e);
        }
        public static Compression byId(long id) { return byId.get(id); }
    }

    public enum HashAlgos {
        MD4(0),
        MD5(1),
        SHA1(2),
        RIPE_MD_160(3),
        SHA256(4),
        SHA384(5),
        SHA512(6),
        SHA224(7),
        RIPE_MD_128(8),
        RIPE_MD_256(9),
        RIPE_MD_320(10),
        WP_256(11),
        WP_384(12),
        WP_512(13),
        TGR_128(14),
        TGR_160(15),
        TGR_192(16),
        SM3_256(17),
        STREEBOG_256(18),
        STREEBOG_512(19),
        SHA3_256(20),
        SHA3_384(21),
        SHA3_512(22);

        private final long id;
        HashAlgos(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, HashAlgos> byId = new HashMap<Long, HashAlgos>(23);
        static {
            for (HashAlgos e : HashAlgos.values())
                byId.put(e.id(), e);
        }
        public static HashAlgos byId(long id) { return byId.get(id); }
    }

    public enum Hashes {
        R5(0),
        TEST_HASH(1);

        private final long id;
        Hashes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Hashes> byId = new HashMap<Long, Hashes>(2);
        static {
            for (Hashes e : Hashes.values())
                byId.put(e.id(), e);
        }
        public static Hashes byId(long id) { return byId.get(id); }
    }

    public enum InodeTypes {
        REGULAR(0),
        DIRECTORY(1),
        LINK(2),
        BLOCK_DEVICE(3),
        CHARACTER_DEVICE(4),
        FIFO(5),
        SOCKET(6);

        private final long id;
        InodeTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, InodeTypes> byId = new HashMap<Long, InodeTypes>(7);
        static {
            for (InodeTypes e : InodeTypes.values())
                byId.put(e.id(), e);
        }
        public static InodeTypes byId(long id) { return byId.get(id); }
    }

    public enum KeyFormats {
        SIMPLE(0);

        private final long id;
        KeyFormats(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, KeyFormats> byId = new HashMap<Long, KeyFormats>(1);
        static {
            for (KeyFormats e : KeyFormats.values())
                byId.put(e.id(), e);
        }
        public static KeyFormats byId(long id) { return byId.get(id); }
    }

    public enum KeyTypes {
        INODE(0),
        DATA(1),
        DIRECTORY(2),
        EXTENDED_ATTRIBUTE(3);

        private final long id;
        KeyTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, KeyTypes> byId = new HashMap<Long, KeyTypes>(4);
        static {
            for (KeyTypes e : KeyTypes.values())
                byId.put(e.id(), e);
        }
        public static KeyTypes byId(long id) { return byId.get(id); }
    }

    public enum NodeGroupTypes {
        NO_NODE_GROUP(0),
        IN_NODE_GROUP(1),
        LAST_OF_NODE_GROUP(2);

        private final long id;
        NodeGroupTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, NodeGroupTypes> byId = new HashMap<Long, NodeGroupTypes>(3);
        static {
            for (NodeGroupTypes e : NodeGroupTypes.values())
                byId.put(e.id(), e);
        }
        public static NodeGroupTypes byId(long id) { return byId.get(id); }
    }

    public enum NodeTypes {
        INODE(0),
        DATA(1),
        DIRECTORY(2),
        EXTENDED_ATTRIBUTE(3),
        TRUNCATION(4),
        PADDING(5),
        SUPERBLOCK(6),
        MASTER(7),
        REFERENCE(8),
        INDEX(9),
        COMMIT_START(10),
        ORPHAN(11),
        AUTHENTICATION(12),
        SIGNATURE(13);

        private final long id;
        NodeTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, NodeTypes> byId = new HashMap<Long, NodeTypes>(14);
        static {
            for (NodeTypes e : NodeTypes.values())
                byId.put(e.id(), e);
        }
        public static NodeTypes byId(long id) { return byId.get(id); }
    }

    public Ubifs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ubifs(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ubifs(KaitaiStream _io, KaitaiStruct _parent, Ubifs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
    }

    public void _fetchInstances() {
        index();
        if (this.index != null) {
            this.index._fetchInstances();
        }
        indexRoot();
        if (this.indexRoot != null) {
            this.indexRoot._fetchInstances();
        }
        lebs();
        if (this.lebs != null) {
            for (int i = 0; i < this.lebs.size(); i++) {
            }
        }
        master1();
        if (this.master1 != null) {
            this.master1._fetchInstances();
        }
        master2();
        if (this.master2 != null) {
            this.master2._fetchInstances();
        }
        superblock();
        if (this.superblock != null) {
            this.superblock._fetchInstances();
        }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782">Git tag "v7.2"</a>
     */
    public static class AuthenticationHeader extends KaitaiStruct {
        public static AuthenticationHeader fromFile(String fileName) throws IOException {
            return new AuthenticationHeader(new ByteBufferKaitaiStream(fileName));
        }

        public AuthenticationHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AuthenticationHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public AuthenticationHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.hmac = this._io.readBytes(_root().superblock().nodeHeader().lenHash());
        }

        public void _fetchInstances() {
        }
        private byte[] hmac;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * HMAC authenticating the journal before this node, keyed with the
         * file system's authentication key (which is not stored on flash).
         * The kernel [uses](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L275-L276)
         * HMAC with the hash algorithm in `<superblock_header>.hash_algo`
         * ([checked when mounting](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L575-L580)),
         * so `hmac` is as long as its digest, e.g. 32 bytes for SHA-256.
         */
        public byte[] hmac() { return hmac; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }
    public static class Block extends KaitaiStruct {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, Ubifs.Branch _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, Ubifs.Branch _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new CommonHeader(this._io, this, _root);
            {
                NodeTypes on = header().nodeType();
                if (on != null) {
                    switch (header().nodeType()) {
                    case AUTHENTICATION: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new AuthenticationHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case COMMIT_START: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new CommitStartHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case DATA: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new DataHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case DIRECTORY: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new DirectoryHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case EXTENDED_ATTRIBUTE: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new DirectoryHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case INDEX: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new IndexHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case INODE: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new InodeHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case MASTER: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new MasterHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case ORPHAN: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new OrphanHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case PADDING: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new PaddingHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case REFERENCE: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new ReferenceHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case SIGNATURE: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new SignatureHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case SUPERBLOCK: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new SuperblockHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    case TRUNCATION: {
                        KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
                        this.nodeHeader = new TruncationHeader(_io_nodeHeader, this, _root);
                        break;
                    }
                    default: {
                        this.nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        break;
                    }
                    }
                } else {
                    this.nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                }
            }
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            {
                NodeTypes on = header().nodeType();
                if (on != null) {
                    switch (header().nodeType()) {
                    case AUTHENTICATION: {
                        ((AuthenticationHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case COMMIT_START: {
                        ((CommitStartHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case DATA: {
                        ((DataHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case DIRECTORY: {
                        ((DirectoryHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case EXTENDED_ATTRIBUTE: {
                        ((DirectoryHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case INDEX: {
                        ((IndexHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case INODE: {
                        ((InodeHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case MASTER: {
                        ((MasterHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case ORPHAN: {
                        ((OrphanHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case PADDING: {
                        ((PaddingHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case REFERENCE: {
                        ((ReferenceHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case SIGNATURE: {
                        ((SignatureHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case SUPERBLOCK: {
                        ((SuperblockHeader) (this.nodeHeader))._fetchInstances();
                        break;
                    }
                    case TRUNCATION: {
                        ((TruncationHeader) (this.nodeHeader))._fetchInstances();
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
        private CommonHeader header;
        private Object nodeHeader;
        private Ubifs _root;
        private Ubifs.Branch _parent;
        public CommonHeader header() { return header; }
        public Object nodeHeader() { return nodeHeader; }
        public Ubifs _root() { return _root; }
        public Ubifs.Branch _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817">Git tag "v7.2"</a>
     */
    public static class Branch extends KaitaiStruct {
        public static Branch fromFile(String fileName) throws IOException {
            return new Branch(new ByteBufferKaitaiStream(fileName));
        }

        public Branch(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Branch(KaitaiStream _io, Ubifs.IndexHeader _parent) {
            this(_io, _parent, null);
        }

        public Branch(KaitaiStream _io, Ubifs.IndexHeader _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.targetLeb = this._io.readU4le();
            this.ofsTarget = this._io.readU4le();
            this.lenTarget = this._io.readU4le();
            KaitaiStream _io_key = this._io.substream(8);
            this.key = new Key(_io_key, this, _root);
            this.hash = this._io.readBytes(_root().superblock().nodeHeader().lenHash());
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
            target();
            if (this.target != null) {
                this.target._fetchInstances();
            }
        }
        private Block target;
        public Block target() {
            if (this.target != null)
                return this.target;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(_root().superblock().nodeHeader().lebSize() * targetLeb() + ofsTarget());
            KaitaiStream _io_target = io.substream(lenTarget());
            this.target = new Block(_io_target, this, _root);
            {
                Block _it = this.target;
                if (!( ((_it.header().lenFullNode() == lenTarget()) && ((_parent().level() != 0 ? _it.header().nodeType() == Ubifs.NodeTypes.INDEX : _it.header().nodeType().id() == key().type().id()))) )) {
                    throw new KaitaiStream.ValidationExprError(this.target, this._io, "/types/branch/instances/target");
                }
            }
            io.seek(_pos);
            return this.target;
        }
        private long targetLeb;
        private long ofsTarget;
        private long lenTarget;
        private Key key;
        private byte[] hash;
        private Ubifs _root;
        private Ubifs.IndexHeader _parent;

        /**
         * LEB number of the target node
         */
        public long targetLeb() { return targetLeb; }

        /**
         * offset within the LEB `target_leb`
         */
        public long ofsTarget() { return ofsTarget; }

        /**
         * target node length
         */
        public long lenTarget() { return lenTarget; }
        public Key key() { return key; }

        /**
         * Hash of the target node. It is empty in a file system without
         * authentication (see `<superblock_header>.len_hash`).
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1642-L1654">Git tag "v7.2"</a>
         */
        public byte[] hash() { return hash; }
        public Ubifs _root() { return _root; }
        public Ubifs.IndexHeader _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841">Git tag "v7.2"</a>
     */
    public static class CommitStartHeader extends KaitaiStruct {
        public static CommitStartHeader fromFile(String fileName) throws IOException {
            return new CommitStartHeader(new ByteBufferKaitaiStream(fileName));
        }

        public CommitStartHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CommitStartHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public CommitStartHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.commitNumber = this._io.readU8le();
        }

        public void _fetchInstances() {
        }
        private long commitNumber;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * commit number
         */
        public long commitNumber() { return commitNumber; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464">Git tag "v7.2"</a>
     */
    public static class CommonHeader extends KaitaiStruct {
        public static CommonHeader fromFile(String fileName) throws IOException {
            return new CommonHeader(new ByteBufferKaitaiStream(fileName));
        }

        public CommonHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CommonHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public CommonHeader(KaitaiStream _io, KaitaiStruct _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readU4le();
            if (!(this.magic == 101718065)) {
                throw new KaitaiStream.ValidationNotEqualError(101718065, this.magic, this._io, "/types/common_header/seq/0");
            }
            this.crc = this._io.readU4le();
            this.sequenceNumber = this._io.readU8le();
            this.lenFullNode = this._io.readU4le();
            this.nodeType = Ubifs.NodeTypes.byId(this._io.readU1());
            this.groupType = Ubifs.NodeGroupTypes.byId(this._io.readU1());
            this.padding = this._io.readBytes(2);
            if (!(Arrays.equals(this.padding, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding, this._io, "/types/common_header/seq/6");
            }
        }

        public void _fetchInstances() {
        }
        private long magic;
        private long crc;
        private long sequenceNumber;
        private long lenFullNode;
        private NodeTypes nodeType;
        private NodeGroupTypes groupType;
        private byte[] padding;
        private Ubifs _root;
        private KaitaiStruct _parent;

        /**
         * UBIFS node magic number (`UBIFS_NODE_MAGIC`)
         */
        public long magic() { return magic; }

        /**
         * CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
         * starting at offset 8). It is computed with an initial register value
         * of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
         * CRC-32 (e.g.
         * [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
         * in Python).
         */
        public long crc() { return crc; }

        /**
         * sequence number
         */
        public long sequenceNumber() { return sequenceNumber; }

        /**
         * full node length
         */
        public long lenFullNode() { return lenFullNode; }

        /**
         * node type
         */
        public NodeTypes nodeType() { return nodeType; }

        /**
         * node group type
         */
        public NodeGroupTypes groupType() { return groupType; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }
        public Ubifs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584">Git tag "v7.2"</a>
     */
    public static class DataHeader extends KaitaiStruct {
        public static DataHeader fromFile(String fileName) throws IOException {
            return new DataHeader(new ByteBufferKaitaiStream(fileName));
        }

        public DataHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public DataHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            KaitaiStream _io_key = this._io.substream(16);
            this.key = new Key(_io_key, this, _root);
            this.lenUncompressed = this._io.readU4le();
            if (!(this.lenUncompressed >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.lenUncompressed, this._io, "/types/data_header/seq/1");
            }
            if (!(this.lenUncompressed <= 4096)) {
                throw new KaitaiStream.ValidationGreaterThanError(4096, this.lenUncompressed, this._io, "/types/data_header/seq/1");
            }
            this.compression = Ubifs.Compression.byId(this._io.readU2le());
            if (this.compression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.compression, this._io, "/types/data_header/seq/2");
            }
            this.lenCompressedData = this._io.readU2le();
            this.data = this._io.readBytesFull();
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
        }
        private Key key;
        private long lenUncompressed;
        private Compression compression;
        private int lenCompressedData;
        private byte[] data;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * node key
         */
        public Key key() { return key; }

        /**
         * uncompressed data size in bytes
         */
        public long lenUncompressed() { return lenUncompressed; }

        /**
         * compression type (`compression::no_compression`, `compression::lzo`,
         * etc.)
         */
        public Compression compression() { return compression; }

        /**
         * compressed data size in bytes, only valid when data is encrypted
         */
        public int lenCompressedData() { return lenCompressedData; }

        /**
         * One block (up to 4096 bytes) of the file, block number `key.value`,
         * compressed as given by `compression`. Blocks missing from the index
         * are holes (zeros). In an encrypted inode, the compressed data is
         * padded
         * and [encrypted](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/crypto.c#L38-L59),
         * and `len_compressed_data` is the length of the compressed data
         * before padding.
         */
        public byte[] data() { return data; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565">Git tag "v7.2"</a>
     */
    public static class DirectoryHeader extends KaitaiStruct {
        public static DirectoryHeader fromFile(String fileName) throws IOException {
            return new DirectoryHeader(new ByteBufferKaitaiStream(fileName));
        }

        public DirectoryHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirectoryHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public DirectoryHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            KaitaiStream _io_key = this._io.substream(16);
            this.key = new Key(_io_key, this, _root);
            {
                Key _it = this.key;
                if (!( ((_it.type() == Ubifs.KeyTypes.DIRECTORY) || (_it.type() == Ubifs.KeyTypes.EXTENDED_ATTRIBUTE)) )) {
                    throw new KaitaiStream.ValidationExprError(this.key, this._io, "/types/directory_header/seq/0");
                }
            }
            this.inodeNumber = this._io.readU8le();
            if (!(this.inodeNumber <= 4294967295L)) {
                throw new KaitaiStream.ValidationGreaterThanError(4294967295L, this.inodeNumber, this._io, "/types/directory_header/seq/1");
            }
            this.padding1 = this._io.readBytes(1);
            if (!(Arrays.equals(this.padding1, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding1, this._io, "/types/directory_header/seq/2");
            }
            this.inodeType = Ubifs.InodeTypes.byId(this._io.readU1());
            if (this.inodeType == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.inodeType, this._io, "/types/directory_header/seq/3");
            }
            this.lenName = this._io.readU2le();
            this.cookie = this._io.readU4le();
            this.name = this._io.readBytes(lenName());
            this.nameTerminator = this._io.readBytes(1);
            if (!(Arrays.equals(this.nameTerminator, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.nameTerminator, this._io, "/types/directory_header/seq/7");
            }
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
        }
        private Key key;
        private long inodeNumber;
        private byte[] padding1;
        private InodeTypes inodeType;
        private int lenName;
        private long cookie;
        private byte[] name;
        private byte[] nameTerminator;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * node key
         */
        public Key key() { return key; }

        /**
         * target inode number
         */
        public long inodeNumber() { return inodeNumber; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding1() { return padding1; }

        /**
         * type of the target inode (`inode_types::regular`,
         * `inode_types::directory`, etc.)
         */
        public InodeTypes inodeType() { return inodeType; }

        /**
         * name length
         */
        public int lenName() { return lenName; }

        /**
         * A 32bits random number, used to construct a 64bits identifier.
         */
        public long cookie() { return cookie; }

        /**
         * Name of the entry.
         * 
         * It is kept as bytes rather than decoded as a string: names in a
         * directory whose inode has `<inode_header>.encrypted` set are
         * ciphertext, which may contain any bytes, including zeros.
         * 
         * Unencrypted names, including all names of extended attributes, contain
         * no zero bytes, because Linux can't create such names. They aren't
         * necessarily valid UTF-8, though, as UBIFS doesn't enforce any encoding
         * of file names. A zero byte in such a name means that the image was
         * crafted, since an accidental corruption would most likely fail the
         * node's
         * [CRC check](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/io.c#L287-L293).
         */
        public byte[] name() { return name; }

        /**
         * Zero byte after `name`, [not counted in
         * `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).
         */
        public byte[] nameTerminator() { return nameTerminator; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }
    public static class Dummy extends KaitaiStruct {
        public static Dummy fromFile(String fileName) throws IOException {
            return new Dummy(new ByteBufferKaitaiStream(fileName));
        }

        public Dummy(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Dummy(KaitaiStream _io, Ubifs _parent) {
            this(_io, _parent, null);
        }

        public Dummy(KaitaiStream _io, Ubifs _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
        }

        public void _fetchInstances() {
        }
        private Ubifs _root;
        private Ubifs _parent;
        public Ubifs _root() { return _root; }
        public Ubifs _parent() { return _parent; }
    }
    public static class IndexBlock extends KaitaiStruct {
        public static IndexBlock fromFile(String fileName) throws IOException {
            return new IndexBlock(new ByteBufferKaitaiStream(fileName));
        }

        public IndexBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexBlock(KaitaiStream _io, Ubifs _parent) {
            this(_io, _parent, null);
        }

        public IndexBlock(KaitaiStream _io, Ubifs _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new CommonHeader(this._io, this, _root);
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.INDEX)) {
                    throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/index_block/seq/0");
                }
            }
            KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
            this.nodeHeader = new IndexHeader(_io_nodeHeader, this, _root);
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            this.nodeHeader._fetchInstances();
        }
        private CommonHeader header;
        private IndexHeader nodeHeader;
        private Ubifs _root;
        private Ubifs _parent;
        public CommonHeader header() { return header; }
        public IndexHeader nodeHeader() { return nodeHeader; }
        public Ubifs _root() { return _root; }
        public Ubifs _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831">Git tag "v7.2"</a>
     */
    public static class IndexHeader extends KaitaiStruct {
        public static IndexHeader fromFile(String fileName) throws IOException {
            return new IndexHeader(new ByteBufferKaitaiStream(fileName));
        }

        public IndexHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public IndexHeader(KaitaiStream _io, KaitaiStruct _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numBranches = this._io.readU2le();
            this.level = this._io.readU2le();
            this.branches = new ArrayList<Branch>();
            for (int i = 0; i < numBranches(); i++) {
                this.branches.add(new Branch(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.branches.size(); i++) {
                this.branches.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private int numBranches;
        private int level;
        private List<Branch> branches;
        private Ubifs _root;
        private KaitaiStruct _parent;

        /**
         * number of child index nodes
         */
        public int numBranches() { return numBranches; }

        /**
         * tree level
         */
        public int level() { return level; }

        /**
         * LEB number / offset / length / key branches
         * 
         * All branches have the same size, which is 20 bytes (with the simple
         * key format) plus the hash length in an authenticated file system.
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/misc.h#L186-L205">Git tag "v7.2"</a>
         */
        public List<Branch> branches() { return branches; }
        public Ubifs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539">Git tag "v7.2"</a>
     */
    public static class InodeHeader extends KaitaiStruct {
        public static InodeHeader fromFile(String fileName) throws IOException {
            return new InodeHeader(new ByteBufferKaitaiStream(fileName));
        }

        public InodeHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InodeHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public InodeHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            KaitaiStream _io_key = this._io.substream(16);
            this.key = new Key(_io_key, this, _root);
            this.creationSequenceNumber = this._io.readU8le();
            this.lenUncompressed = this._io.readU8le();
            this.atimeSec = this._io.readU8le();
            this.ctimeSec = this._io.readU8le();
            this.mtimeSec = this._io.readU8le();
            this.atimeNsec = this._io.readU4le();
            this.ctimeNsec = this._io.readU4le();
            this.mtimeNsec = this._io.readU4le();
            this.numLinks = this._io.readU4le();
            this.uid = this._io.readU4le();
            this.gid = this._io.readU4le();
            this.mode = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.lenData = this._io.readU4le();
            this.numXattrs = this._io.readU4le();
            this.xattrSize = this._io.readU4le();
            this.padding1 = this._io.readBytes(4);
            if (!(Arrays.equals(this.padding1, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.padding1, this._io, "/types/inode_header/seq/17");
            }
            this.xattrNames = this._io.readU4le();
            this.compression = Ubifs.Compression.byId(this._io.readU2le());
            if (this.compression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.compression, this._io, "/types/inode_header/seq/19");
            }
            this.padding2 = this._io.readBytes(26);
            this.data = this._io.readBytes(lenData());
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
        }
        private Boolean append;

        /**
         * writes to the inode may only append data
         */
        public Boolean append() {
            if (this.append != null)
                return this.append;
            this.append = (flags() & 8) != 0;
            return this.append;
        }
        private Boolean compressed;

        /**
         * use compression for this inode
         */
        public Boolean compressed() {
            if (this.compressed != null)
                return this.compressed;
            this.compressed = (flags() & 1) != 0;
            return this.compressed;
        }
        private Boolean dirsync;

        /**
         * I/O on this directory inode has to be synchronous
         */
        public Boolean dirsync() {
            if (this.dirsync != null)
                return this.dirsync;
            this.dirsync = (flags() & 16) != 0;
            return this.dirsync;
        }
        private Boolean encrypted;

        /**
         * use encryption for this inode
         */
        public Boolean encrypted() {
            if (this.encrypted != null)
                return this.encrypted;
            this.encrypted = (flags() & 64) != 0;
            return this.encrypted;
        }
        private Boolean immutable;

        /**
         * inode is immutable
         */
        public Boolean immutable() {
            if (this.immutable != null)
                return this.immutable;
            this.immutable = (flags() & 4) != 0;
            return this.immutable;
        }
        private Boolean isBlockDevice;
        public Boolean isBlockDevice() {
            if (this.isBlockDevice != null)
                return this.isBlockDevice;
            this.isBlockDevice = (mode() & 61440) == 24576;
            return this.isBlockDevice;
        }
        private Boolean isCharacterDevice;
        public Boolean isCharacterDevice() {
            if (this.isCharacterDevice != null)
                return this.isCharacterDevice;
            this.isCharacterDevice = (mode() & 61440) == 8192;
            return this.isCharacterDevice;
        }
        private Boolean isDir;
        public Boolean isDir() {
            if (this.isDir != null)
                return this.isDir;
            this.isDir = (mode() & 61440) == 16384;
            return this.isDir;
        }
        private Boolean isFifo;
        public Boolean isFifo() {
            if (this.isFifo != null)
                return this.isFifo;
            this.isFifo = (mode() & 61440) == 4096;
            return this.isFifo;
        }
        private Boolean isLink;
        public Boolean isLink() {
            if (this.isLink != null)
                return this.isLink;
            this.isLink = (mode() & 61440) == 40960;
            return this.isLink;
        }
        private Boolean isRegular;
        public Boolean isRegular() {
            if (this.isRegular != null)
                return this.isRegular;
            this.isRegular = (mode() & 61440) == 32768;
            return this.isRegular;
        }
        private Boolean isSocket;
        public Boolean isSocket() {
            if (this.isSocket != null)
                return this.isSocket;
            this.isSocket = (mode() & 61440) == 49152;
            return this.isSocket;
        }
        private Boolean synchronous;

        /**
         * I/O on this inode has to be synchronous
         */
        public Boolean synchronous() {
            if (this.synchronous != null)
                return this.synchronous;
            this.synchronous = (flags() & 2) != 0;
            return this.synchronous;
        }
        private Boolean xattr;

        /**
         * this inode is the inode for an extended attribute value
         */
        public Boolean xattr() {
            if (this.xattr != null)
                return this.xattr;
            this.xattr = (flags() & 32) != 0;
            return this.xattr;
        }
        private Key key;
        private long creationSequenceNumber;
        private long lenUncompressed;
        private long atimeSec;
        private long ctimeSec;
        private long mtimeSec;
        private long atimeNsec;
        private long ctimeNsec;
        private long mtimeNsec;
        private long numLinks;
        private long uid;
        private long gid;
        private long mode;
        private long flags;
        private long lenData;
        private long numXattrs;
        private long xattrSize;
        private byte[] padding1;
        private long xattrNames;
        private Compression compression;
        private byte[] padding2;
        private byte[] data;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * node key
         */
        public Key key() { return key; }

        /**
         * sequence number at time of creation
         */
        public long creationSequenceNumber() { return creationSequenceNumber; }

        /**
         * inode size in bytes (amount of uncompressed data)
         */
        public long lenUncompressed() { return lenUncompressed; }

        /**
         * access time seconds
         */
        public long atimeSec() { return atimeSec; }

        /**
         * status change time seconds
         */
        public long ctimeSec() { return ctimeSec; }

        /**
         * modification time seconds
         */
        public long mtimeSec() { return mtimeSec; }

        /**
         * access time nanoseconds
         */
        public long atimeNsec() { return atimeNsec; }

        /**
         * status change time nanoseconds
         */
        public long ctimeNsec() { return ctimeNsec; }

        /**
         * modification time nanoseconds
         */
        public long mtimeNsec() { return mtimeNsec; }

        /**
         * number of hard links
         */
        public long numLinks() { return numLinks; }

        /**
         * owner ID
         */
        public long uid() { return uid; }

        /**
         * group ID
         */
        public long gid() { return gid; }

        /**
         * file type and permissions, as in `st_mode` (see the `is_*`
         * instances for the file type)
         */
        public long mode() { return mode; }

        /**
         * per-inode flags (see the instances `compressed`, `synchronous`,
         * etc.)
         */
        public long flags() { return flags; }

        /**
         * inode data length
         */
        public long lenData() { return lenData; }

        /**
         * count of extended attributes this inode has
         */
        public long numXattrs() { return numXattrs; }

        /**
         * summarized size of all extended attributes in bytes
         */
        public long xattrSize() { return xattrSize; }
        public byte[] padding1() { return padding1; }

        /**
         * sum of lengths of all extended attribute names belonging
         * to this inode
         */
        public long xattrNames() { return xattrNames; }

        /**
         * compression type used for this inode
         */
        public Compression compression() { return compression; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding2() { return padding2; }

        /**
         * Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
         * (encrypted if the inode is encrypted), device number of a device node
         * ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
         * 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
         * [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
         * (in its own inode, see `xattr`). Empty otherwise.
         */
        public byte[] data() { return data; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }

    /**
     * Inode nodes (`inode_header`), directory and extended attribute entry
     * nodes (`directory_header`) and data nodes (`data_header`) store keys in a
     * 16-byte field (`UBIFS_MAX_KEY_LEN`). The simple key format, the only one
     * there is (see `<superblock_header>.key_fmt`), uses only the first 8
     * bytes, and Linux (v7.2)
     * [zeroes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L432-L440)
     * the rest. Branches of index nodes (`branch`)
     * [store only these 8 bytes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L448-L455).
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L16-L22">Git tag "v7.2"</a>
     */
    public static class Key extends KaitaiStruct {
        public static Key fromFile(String fileName) throws IOException {
            return new Key(new ByteBufferKaitaiStream(fileName));
        }

        public Key(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Key(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Key(KaitaiStream _io, KaitaiStruct _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.inodeNumber = this._io.readU4le();
            this.value = this._io.readBitsIntLe(29);
            this.type = Ubifs.KeyTypes.byId(this._io.readBitsIntLe(3));
            if (this.type == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/key/seq/2");
            }
            this.unused = this._io.readBytesFull();
        }

        public void _fetchInstances() {
        }
        private long inodeNumber;
        private long value;
        private KeyTypes type;
        private byte[] unused;
        private Ubifs _root;
        private KaitaiStruct _parent;

        /**
         * Number of the inode that the node belongs to: the parent directory
         * for a directory entry, the inode that the attribute belongs to for an
         * extended attribute entry.
         */
        public long inodeNumber() { return inodeNumber; }

        /**
         * Block number for a data node, hash of the name (see
         * `<superblock_header>.key_hash`) for a directory or extended
         * attribute entry, 0 for an inode node.
         */
        public long value() { return value; }

        /**
         * Type of the key, which matches the type of the node.
         */
        public KeyTypes type() { return type; }

        /**
         * Rest of the field holding the key: 8 zero bytes in `inode_header`,
         * `directory_header` and `data_header`, empty in `branch`.
         */
        public byte[] unused() { return unused; }
        public Ubifs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756">Git tag "v7.2"</a>
     */
    public static class MasterHeader extends KaitaiStruct {
        public static MasterHeader fromFile(String fileName) throws IOException {
            return new MasterHeader(new ByteBufferKaitaiStream(fileName));
        }

        public MasterHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MasterHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public MasterHeader(KaitaiStream _io, KaitaiStruct _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.highestInum = this._io.readU8le();
            this.commitNumber = this._io.readU8le();
            this.flags = this._io.readU4le();
            this.lebLog = this._io.readU4le();
            this.lebRoot = this._io.readU4le();
            this.ofsRoot = this._io.readU4le();
            this.lenRoot = this._io.readU4le();
            this.lebGarbageCollect = this._io.readU4le();
            this.lebIndexHead = this._io.readU4le();
            this.ofsIndexHead = this._io.readU4le();
            this.lenIndex = this._io.readU8le();
            this.totalFree = this._io.readU8le();
            this.totalDirty = this._io.readU8le();
            this.totalUsed = this._io.readU8le();
            this.totalDead = this._io.readU8le();
            this.totalDark = this._io.readU8le();
            this.lebLpt = this._io.readU4le();
            this.ofsLpt = this._io.readU4le();
            this.lebNhead = this._io.readU4le();
            this.ofsNhead = this._io.readU4le();
            this.lebLpropsTable = this._io.readU4le();
            this.ofsLpropsTable = this._io.readU4le();
            this.lebSaveTable = this._io.readU4le();
            this.ofsSaveTable = this._io.readU4le();
            this.lebLastLptScan = this._io.readU4le();
            this.numEmptyLebs = this._io.readU4le();
            this.numIndexLebs = this._io.readU4le();
            this.numLebs = this._io.readU4le();
            this.hashRootIndex = this._io.readBytes(64);
            this.hashLpt = this._io.readBytes(64);
            this.hmac = this._io.readBytes(64);
            this.padding = this._io.readBytes(152);
        }

        public void _fetchInstances() {
        }
        private Boolean dirty;

        /**
         * master node is dirty
         */
        public Boolean dirty() {
            if (this.dirty != null)
                return this.dirty;
            this.dirty = (flags() & 1) != 0;
            return this.dirty;
        }
        private Boolean noOrphans;

        /**
         * no orphan inodes present
         */
        public Boolean noOrphans() {
            if (this.noOrphans != null)
                return this.noOrphans;
            this.noOrphans = (flags() & 2) != 0;
            return this.noOrphans;
        }
        private Boolean recovery;

        /**
         * written by recovery
         */
        public Boolean recovery() {
            if (this.recovery != null)
                return this.recovery;
            this.recovery = (flags() & 4) != 0;
            return this.recovery;
        }
        private long highestInum;
        private long commitNumber;
        private long flags;
        private long lebLog;
        private long lebRoot;
        private long ofsRoot;
        private long lenRoot;
        private long lebGarbageCollect;
        private long lebIndexHead;
        private long ofsIndexHead;
        private long lenIndex;
        private long totalFree;
        private long totalDirty;
        private long totalUsed;
        private long totalDead;
        private long totalDark;
        private long lebLpt;
        private long ofsLpt;
        private long lebNhead;
        private long ofsNhead;
        private long lebLpropsTable;
        private long ofsLpropsTable;
        private long lebSaveTable;
        private long ofsSaveTable;
        private long lebLastLptScan;
        private long numEmptyLebs;
        private long numIndexLebs;
        private long numLebs;
        private byte[] hashRootIndex;
        private byte[] hashLpt;
        private byte[] hmac;
        private byte[] padding;
        private Ubifs _root;
        private KaitaiStruct _parent;

        /**
         * highest inode number in the committed index
         */
        public long highestInum() { return highestInum; }

        /**
         * commit number
         */
        public long commitNumber() { return commitNumber; }

        /**
         * various flags (see the instances `dirty`, `no_orphans` and
         * `recovery`)
         */
        public long flags() { return flags; }

        /**
         * start of the log
         */
        public long lebLog() { return lebLog; }

        /**
         * LEB number of the root indexing node
         */
        public long lebRoot() { return lebRoot; }

        /**
         * offset within the LEB `leb_root`
         */
        public long ofsRoot() { return ofsRoot; }

        /**
         * root indexing node length
         */
        public long lenRoot() { return lenRoot; }

        /**
         * LEB reserved for garbage collection, which must be in the main area.
         * 
         * The [comment above `struct ubifs_mst_node`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L695-L696)
         * says that -1 (`0xffff_ffff`) means the LEB was not reserved and should
         * be reserved on mount. However, Linux refuses to mount a file system
         * with -1. Linux
         * [stores](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L362)
         * the field in an
         * [`int`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1424),
         * so `0xffff_ffff` becomes -1. Then -1 is rejected by the condition
         * `c->gc_lnum < c->main_first`, because the main area
         * [starts](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L775-L777)
         * after the superblock, master, log, LPT and orphan areas.
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L214-L217">Git tag "v7.2"</a>
         */
        public long lebGarbageCollect() { return lebGarbageCollect; }

        /**
         * LEB number of index head
         */
        public long lebIndexHead() { return lebIndexHead; }

        /**
         * offset of index head
         */
        public long ofsIndexHead() { return ofsIndexHead; }

        /**
         * size of index on flash
         */
        public long lenIndex() { return lenIndex; }

        /**
         * total free space in bytes
         */
        public long totalFree() { return totalFree; }

        /**
         * total dirty space in bytes
         */
        public long totalDirty() { return totalDirty; }

        /**
         * total used space in bytes (includes only data LEBs)
         */
        public long totalUsed() { return totalUsed; }

        /**
         * total dead space in bytes (includes only data LEBs)
         */
        public long totalDead() { return totalDead; }

        /**
         * total dark space in bytes (includes only data LEBs)
         */
        public long totalDark() { return totalDark; }

        /**
         * LEB number of LPT root nnode
         */
        public long lebLpt() { return lebLpt; }

        /**
         * offset of LPT root nnode
         */
        public long ofsLpt() { return ofsLpt; }

        /**
         * LEB number of LPT head
         */
        public long lebNhead() { return lebNhead; }

        /**
         * offset of LPT head
         */
        public long ofsNhead() { return ofsNhead; }

        /**
         * LEB number of LPT's own lprops table
         */
        public long lebLpropsTable() { return lebLpropsTable; }

        /**
         * offset of LPT's own lprops table
         */
        public long ofsLpropsTable() { return ofsLpropsTable; }

        /**
         * LEB number of LPT's save table. Present in every master node, but
         * only meaningful if `<superblock_header>.biglpt` is set: only then
         * does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
         */
        public long lebSaveTable() { return lebSaveTable; }

        /**
         * offset of LPT's save table (only meaningful if
         * `<superblock_header>.biglpt` is set, see `leb_save_table`)
         */
        public long ofsSaveTable() { return ofsSaveTable; }

        /**
         * LEB number of last LPT scan
         */
        public long lebLastLptScan() { return lebLastLptScan; }

        /**
         * number of empty logical eraseblocks
         */
        public long numEmptyLebs() { return numEmptyLebs; }

        /**
         * number of indexing logical eraseblocks
         */
        public long numIndexLebs() { return numIndexLebs; }

        /**
         * count of LEBs used by file-system
         */
        public long numLebs() { return numLebs; }

        /**
         * the hash of the root index node
         */
        public byte[] hashRootIndex() { return hashRootIndex; }

        /**
         * the hash of the LPT
         */
        public byte[] hashLpt() { return hashLpt; }

        /**
         * HMAC to authenticate the master node
         */
        public byte[] hmac() { return hmac; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }
        public Ubifs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class MasterblockNode extends KaitaiStruct {
        public static MasterblockNode fromFile(String fileName) throws IOException {
            return new MasterblockNode(new ByteBufferKaitaiStream(fileName));
        }

        public MasterblockNode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MasterblockNode(KaitaiStream _io, Ubifs _parent) {
            this(_io, _parent, null);
        }

        public MasterblockNode(KaitaiStream _io, Ubifs _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new CommonHeader(this._io, this, _root);
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.MASTER)) {
                    throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/masterblock_node/seq/0");
                }
            }
            KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
            this.nodeHeader = new MasterHeader(_io_nodeHeader, this, _root);
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            this.nodeHeader._fetchInstances();
        }
        private CommonHeader header;
        private MasterHeader nodeHeader;
        private Ubifs _root;
        private Ubifs _parent;
        public CommonHeader header() { return header; }
        public MasterHeader nodeHeader() { return nodeHeader; }
        public Ubifs _root() { return _root; }
        public Ubifs _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853">Git tag "v7.2"</a>
     */
    public static class OrphanHeader extends KaitaiStruct {
        public static OrphanHeader fromFile(String fileName) throws IOException {
            return new OrphanHeader(new ByteBufferKaitaiStream(fileName));
        }

        public OrphanHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OrphanHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public OrphanHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.commitNumber = this._io.readU8le();
            this.inodeNumbers = new ArrayList<Long>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.inodeNumbers.add(this._io.readU8le());
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.inodeNumbers.size(); i++) {
            }
        }
        private long commitNumber;
        private List<Long> inodeNumbers;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * commit number (also top bit is set on the last node of the commit)
         */
        public long commitNumber() { return commitNumber; }

        /**
         * inode numbers of orphans
         */
        public List<Long> inodeNumbers() { return inodeNumbers; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615">Git tag "v7.2"</a>
     */
    public static class PaddingHeader extends KaitaiStruct {
        public static PaddingHeader fromFile(String fileName) throws IOException {
            return new PaddingHeader(new ByteBufferKaitaiStream(fileName));
        }

        public PaddingHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PaddingHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public PaddingHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenPadding = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private long lenPadding;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * how many bytes after this node are unused (because padded)
         */
        public long lenPadding() { return lenPadding; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }

    /**
     * logical eraseblock reference node.
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772">Git tag "v7.2"</a>
     */
    public static class ReferenceHeader extends KaitaiStruct {
        public static ReferenceHeader fromFile(String fileName) throws IOException {
            return new ReferenceHeader(new ByteBufferKaitaiStream(fileName));
        }

        public ReferenceHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ReferenceHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public ReferenceHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lebNumber = this._io.readU4le();
            this.ofsLeb = this._io.readU4le();
            this.journalHeadNumber = this._io.readU4le();
            this.padding = this._io.readBytes(28);
        }

        public void _fetchInstances() {
        }
        private long lebNumber;
        private long ofsLeb;
        private long journalHeadNumber;
        private byte[] padding;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * the referred logical eraseblock number
         */
        public long lebNumber() { return lebNumber; }

        /**
         * start offset in the referred LEB
         */
        public long ofsLeb() { return ofsLeb; }

        /**
         * journal head number
         */
        public long journalHeadNumber() { return journalHeadNumber; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }

    /**
     * Signature of the superblock node of a file system signed when it was
     * created (`mkfs.ubifs` with a key). Linux
     * [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
     * as the first node after the superblock node in LEB0.
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799">Git tag "v7.2"</a>
     */
    public static class SignatureHeader extends KaitaiStruct {
        public static SignatureHeader fromFile(String fileName) throws IOException {
            return new SignatureHeader(new ByteBufferKaitaiStream(fileName));
        }

        public SignatureHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SignatureHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public SignatureHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = this._io.readU4le();
            if (!(this.type == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, this.type, this._io, "/types/signature_header/seq/0");
            }
            this.lenSignature = this._io.readU4le();
            this.padding = this._io.readBytes(32);
            this.signature = this._io.readBytes(lenSignature());
        }

        public void _fetchInstances() {
        }
        private long type;
        private long lenSignature;
        private byte[] padding;
        private byte[] signature;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * type of the signature
         */
        public long type() { return type; }

        /**
         * length of `signature` in bytes
         */
        public long lenSignature() { return lenSignature; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }

        /**
         * [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
         * of the whole superblock node (4096 bytes, including the common
         * header)
         */
        public byte[] signature() { return signature; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683">Git tag "v7.2"</a>
     */
    public static class SuperblockHeader extends KaitaiStruct {
        public static SuperblockHeader fromFile(String fileName) throws IOException {
            return new SuperblockHeader(new ByteBufferKaitaiStream(fileName));
        }

        public SuperblockHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SuperblockHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public SuperblockHeader(KaitaiStream _io, KaitaiStruct _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.padding0 = this._io.readBytes(2);
            if (!(Arrays.equals(this.padding0, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding0, this._io, "/types/superblock_header/seq/0");
            }
            this.keyHash = Ubifs.Hashes.byId(this._io.readU1());
            if (this.keyHash == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.keyHash, this._io, "/types/superblock_header/seq/1");
            }
            this.keyFmt = Ubifs.KeyFormats.byId(this._io.readU1());
            if (!(this.keyFmt == Ubifs.KeyFormats.SIMPLE)) {
                throw new KaitaiStream.ValidationNotEqualError(Ubifs.KeyFormats.SIMPLE, this.keyFmt, this._io, "/types/superblock_header/seq/2");
            }
            this.flags = this._io.readU4le();
            this.minIoSize = this._io.readU4le();
            this.lebSize = this._io.readU4le();
            this.numLebs = this._io.readU4le();
            this.maxNumLebs = this._io.readU4le();
            if (!(this.maxNumLebs >= numLebs())) {
                throw new KaitaiStream.ValidationLessThanError(numLebs(), this.maxNumLebs, this._io, "/types/superblock_header/seq/7");
            }
            this.maxBudBytes = this._io.readU8le();
            this.numLogLebs = this._io.readU4le();
            if (!(this.numLogLebs >= 2)) {
                throw new KaitaiStream.ValidationLessThanError(2, this.numLogLebs, this._io, "/types/superblock_header/seq/9");
            }
            this.numLptLebs = this._io.readU4le();
            if (!(this.numLptLebs >= 2)) {
                throw new KaitaiStream.ValidationLessThanError(2, this.numLptLebs, this._io, "/types/superblock_header/seq/10");
            }
            this.numOrphanLebs = this._io.readU4le();
            if (!(this.numOrphanLebs >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.numOrphanLebs, this._io, "/types/superblock_header/seq/11");
            }
            this.numJournalHeads = this._io.readU4le();
            this.fanout = this._io.readU4le();
            this.numSaveTableEntries = this._io.readU4le();
            this.fmtVersion = this._io.readU4le();
            if (!(this.fmtVersion >= 4)) {
                throw new KaitaiStream.ValidationLessThanError(4, this.fmtVersion, this._io, "/types/superblock_header/seq/15");
            }
            this.defaultCompression = Ubifs.Compression.byId(this._io.readU2le());
            if (this.defaultCompression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.defaultCompression, this._io, "/types/superblock_header/seq/16");
            }
            this.padding1 = this._io.readBytes(2);
            if (!(Arrays.equals(this.padding1, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding1, this._io, "/types/superblock_header/seq/17");
            }
            this.reservePoolUid = this._io.readU4le();
            this.reservePoolGid = this._io.readU4le();
            this.reservePoolSize = this._io.readU8le();
            this.timeGranularity = this._io.readU4le();
            if (!(this.timeGranularity >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.timeGranularity, this._io, "/types/superblock_header/seq/21");
            }
            if (!(this.timeGranularity <= 1000000000)) {
                throw new KaitaiStream.ValidationGreaterThanError(1000000000, this.timeGranularity, this._io, "/types/superblock_header/seq/21");
            }
            this.uuid = this._io.readBytes(16);
            this.roCompatVersion = this._io.readU4le();
            this.hmac = this._io.readBytes(64);
            this.hmacWkm = this._io.readBytes(64);
            if (authenticated()) {
                this.hashAlgo = Ubifs.HashAlgos.byId(this._io.readU2le());
                if (this.hashAlgo == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.hashAlgo, this._io, "/types/superblock_header/seq/26");
                }
            }
            if (!(authenticated())) {
                this.hashAlgoUnused = this._io.readU2le();
            }
            this.hashMst = this._io.readBytes(64);
            this.padding2 = this._io.readBytes(3774);
        }

        public void _fetchInstances() {
            if (authenticated()) {
            }
            if (!(authenticated())) {
            }
        }
        private Boolean authenticated;

        /**
         * this filesystem contains hashes for authentication
         */
        public Boolean authenticated() {
            if (this.authenticated != null)
                return this.authenticated;
            this.authenticated = (flags() & 32) != 0;
            return this.authenticated;
        }
        private Boolean biglpt;

        /**
         * if "big" LPT model is used if set
         */
        public Boolean biglpt() {
            if (this.biglpt != null)
                return this.biglpt;
            this.biglpt = (flags() & 2) != 0;
            return this.biglpt;
        }
        private Boolean doubleHash;

        /**
         * store a 32bit cookie in directory entry nodes to
         * support 64bit cookies for lookups by hash
         */
        public Boolean doubleHash() {
            if (this.doubleHash != null)
                return this.doubleHash;
            this.doubleHash = (flags() & 8) != 0;
            return this.doubleHash;
        }
        private Boolean encrypted;

        /**
         * filesystem contains encrypted files
         */
        public Boolean encrypted() {
            if (this.encrypted != null)
                return this.encrypted;
            this.encrypted = (flags() & 16) != 0;
            return this.encrypted;
        }
        private Integer lenHash;

        /**
         * Length in bytes of the hash of a node (`c->hash_len` in Linux), e.g.
         * in each branch of an index node. In an authenticated file system, it
         * is determined by `hash_algo`. Otherwise, it is 0.
         */
        public Integer lenHash() {
            if (this.lenHash != null)
                return this.lenHash;
            this.lenHash = ((Number) ((!(authenticated()) ? 0 : ( ((hashAlgo() == Ubifs.HashAlgos.MD4) || (hashAlgo() == Ubifs.HashAlgos.MD5) || (hashAlgo() == Ubifs.HashAlgos.RIPE_MD_128) || (hashAlgo() == Ubifs.HashAlgos.TGR_128))  ? 16 : ( ((hashAlgo() == Ubifs.HashAlgos.SHA1) || (hashAlgo() == Ubifs.HashAlgos.RIPE_MD_160) || (hashAlgo() == Ubifs.HashAlgos.TGR_160))  ? 20 : (hashAlgo() == Ubifs.HashAlgos.TGR_192 ? 24 : (hashAlgo() == Ubifs.HashAlgos.SHA224 ? 28 : ( ((hashAlgo() == Ubifs.HashAlgos.SHA256) || (hashAlgo() == Ubifs.HashAlgos.RIPE_MD_256) || (hashAlgo() == Ubifs.HashAlgos.WP_256) || (hashAlgo() == Ubifs.HashAlgos.SM3_256) || (hashAlgo() == Ubifs.HashAlgos.STREEBOG_256) || (hashAlgo() == Ubifs.HashAlgos.SHA3_256))  ? 32 : (hashAlgo() == Ubifs.HashAlgos.RIPE_MD_320 ? 40 : ( ((hashAlgo() == Ubifs.HashAlgos.SHA384) || (hashAlgo() == Ubifs.HashAlgos.WP_384) || (hashAlgo() == Ubifs.HashAlgos.SHA3_384))  ? 48 : ( ((hashAlgo() == Ubifs.HashAlgos.SHA512) || (hashAlgo() == Ubifs.HashAlgos.WP_512) || (hashAlgo() == Ubifs.HashAlgos.STREEBOG_512) || (hashAlgo() == Ubifs.HashAlgos.SHA3_512))  ? 64 : -1))))))))))).intValue();
            return this.lenHash;
        }
        private Boolean spaceFixup;

        /**
         * first-mount "fixup" of free space within LEBs needed
         */
        public Boolean spaceFixup() {
            if (this.spaceFixup != null)
                return this.spaceFixup;
            this.spaceFixup = (flags() & 4) != 0;
            return this.spaceFixup;
        }
        private byte[] padding0;
        private Hashes keyHash;
        private KeyFormats keyFmt;
        private long flags;
        private long minIoSize;
        private long lebSize;
        private long numLebs;
        private long maxNumLebs;
        private long maxBudBytes;
        private long numLogLebs;
        private long numLptLebs;
        private long numOrphanLebs;
        private long numJournalHeads;
        private long fanout;
        private long numSaveTableEntries;
        private long fmtVersion;
        private Compression defaultCompression;
        private byte[] padding1;
        private long reservePoolUid;
        private long reservePoolGid;
        private long reservePoolSize;
        private long timeGranularity;
        private byte[] uuid;
        private long roCompatVersion;
        private byte[] hmac;
        private byte[] hmacWkm;
        private HashAlgos hashAlgo;
        private Integer hashAlgoUnused;
        private byte[] hashMst;
        private byte[] padding2;
        private Ubifs _root;
        private KaitaiStruct _parent;

        /**
         * reserved for future, zeroes
         */
        public byte[] padding0() { return padding0; }

        /**
         * type of hash function used in keys
         */
        public Hashes keyHash() { return keyHash; }

        /**
         * format of the key
         */
        public KeyFormats keyFmt() { return keyFmt; }

        /**
         * file-system flags (see the instances `biglpt`, `space_fixup`, etc.)
         */
        public long flags() { return flags; }

        /**
         * minimal input/output unit size
         */
        public long minIoSize() { return minIoSize; }

        /**
         * logical eraseblock size in bytes
         */
        public long lebSize() { return lebSize; }

        /**
         * count of LEBs used by file-system
         */
        public long numLebs() { return numLebs; }

        /**
         * maximum count of LEBs used by file-system
         */
        public long maxNumLebs() { return maxNumLebs; }

        /**
         * maximum amount of data stored in buds
         */
        public long maxBudBytes() { return maxBudBytes; }

        /**
         * log size in logical eraseblocks
         */
        public long numLogLebs() { return numLogLebs; }

        /**
         * number of LEBs used for lprops table
         */
        public long numLptLebs() { return numLptLebs; }

        /**
         * number of LEBs used for recording orphans
         */
        public long numOrphanLebs() { return numOrphanLebs; }

        /**
         * count of journal heads
         */
        public long numJournalHeads() { return numJournalHeads; }

        /**
         * tree fanout (max. number of links per indexing node)
         */
        public long fanout() { return fanout; }

        /**
         * number of LEB numbers in LPT's save table
         */
        public long numSaveTableEntries() { return numSaveTableEntries; }

        /**
         * UBIFS on-flash format version
         */
        public long fmtVersion() { return fmtVersion; }

        /**
         * default compression algorithm (`compression::lzo`, etc.)
         */
        public Compression defaultCompression() { return defaultCompression; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding1() { return padding1; }

        /**
         * reserve pool UID
         */
        public long reservePoolUid() { return reservePoolUid; }

        /**
         * reserve pool GID
         */
        public long reservePoolGid() { return reservePoolGid; }

        /**
         * size of the reserved pool in bytes
         */
        public long reservePoolSize() { return reservePoolSize; }

        /**
         * time granularity in nanoseconds
         */
        public long timeGranularity() { return timeGranularity; }

        /**
         * UUID generated when the file system image was created
         */
        public byte[] uuid() { return uuid; }

        /**
         * UBIFS R/O compatibility version
         */
        public long roCompatVersion() { return roCompatVersion; }

        /**
         * HMAC to authenticate the superblock node
         */
        public byte[] hmac() { return hmac; }

        /**
         * HMAC of a well known message (the string "UBIFS") as a convenience
         * to the user to check if the correct key is passed
         */
        public byte[] hmacWkm() { return hmacWkm; }

        /**
         * The hash algo used for this filesystem
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L549-L573">Git tag "v7.2"</a>
         */
        public HashAlgos hashAlgo() { return hashAlgo; }

        /**
         * Unused field (would only be meaningful in an authenticated file
         * system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
         * writes it as 0.
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L183-L191">Git tag "v7.2"</a>
         */
        public Integer hashAlgoUnused() { return hashAlgoUnused; }

        /**
         * hash of the master node, only valid for signed images in which the
         * master node does not contain a hmac
         */
        public byte[] hashMst() { return hashMst; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding2() { return padding2; }
        public Ubifs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class SuperblockNode extends KaitaiStruct {
        public static SuperblockNode fromFile(String fileName) throws IOException {
            return new SuperblockNode(new ByteBufferKaitaiStream(fileName));
        }

        public SuperblockNode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SuperblockNode(KaitaiStream _io, Ubifs _parent) {
            this(_io, _parent, null);
        }

        public SuperblockNode(KaitaiStream _io, Ubifs _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new CommonHeader(this._io, this, _root);
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.SUPERBLOCK)) {
                    throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/superblock_node/seq/0");
                }
            }
            KaitaiStream _io_nodeHeader = this._io.substream(header().lenFullNode() - 24);
            this.nodeHeader = new SuperblockHeader(_io_nodeHeader, this, _root);
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            this.nodeHeader._fetchInstances();
        }
        private CommonHeader header;
        private SuperblockHeader nodeHeader;
        private Ubifs _root;
        private Ubifs _parent;
        public CommonHeader header() { return header; }
        public SuperblockHeader nodeHeader() { return nodeHeader; }
        public Ubifs _root() { return _root; }
        public Ubifs _parent() { return _parent; }
    }

    /**
     * This node exists only in the journal and never goes to the main area.
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604">Git tag "v7.2"</a>
     */
    public static class TruncationHeader extends KaitaiStruct {
        public static TruncationHeader fromFile(String fileName) throws IOException {
            return new TruncationHeader(new ByteBufferKaitaiStream(fileName));
        }

        public TruncationHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TruncationHeader(KaitaiStream _io, Ubifs.Block _parent) {
            this(_io, _parent, null);
        }

        public TruncationHeader(KaitaiStream _io, Ubifs.Block _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.inodeNumber = this._io.readU4le();
            this.padding = this._io.readBytes(12);
            this.oldSize = this._io.readU8le();
            if (!(this.oldSize >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.oldSize, this._io, "/types/truncation_header/seq/2");
            }
            this.newSize = this._io.readU8le();
            if (!(this.newSize <= oldSize() - 1)) {
                throw new KaitaiStream.ValidationGreaterThanError(oldSize() - 1, this.newSize, this._io, "/types/truncation_header/seq/3");
            }
        }

        public void _fetchInstances() {
        }
        private long inodeNumber;
        private byte[] padding;
        private long oldSize;
        private long newSize;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * truncated inode number
         */
        public long inodeNumber() { return inodeNumber; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }

        /**
         * size before truncation
         */
        public long oldSize() { return oldSize; }

        /**
         * size after truncation
         */
        public long newSize() { return newSize; }
        public Ubifs _root() { return _root; }
        public Ubifs.Block _parent() { return _parent; }
    }
    private Dummy index;

    /**
     * The LEB containing the root index node, as given by `leb_root` in
     * `master_1`.
     * 
     * This instance only provides the substream for `index_root`, which can then
     * use `ofs_root` (an offset within the LEB) as its `pos` directly.
     */
    public Dummy index() {
        if (this.index != null)
            return this.index;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize() * master1().nodeHeader().lebRoot());
        KaitaiStream _io_index = this._io.substream(superblock().nodeHeader().lebSize());
        this.index = new Dummy(_io_index, this, _root);
        this._io.seek(_pos);
        return this.index;
    }
    private IndexBlock indexRoot;

    /**
     * The root index node, in the `index` LEB at the offset given by
     * `ofs_root` in `master_1`. All other index nodes, and through them all
     * the files, are reached from it by recursively following the `target` of
     * each of the `branches`.
     */
    public IndexBlock indexRoot() {
        if (this.indexRoot != null)
            return this.indexRoot;
        KaitaiStream io = index()._io();
        long _pos = io.pos();
        io.seek(master1().nodeHeader().ofsRoot());
        this.indexRoot = new IndexBlock(io, this, _root);
        {
            IndexBlock _it = this.indexRoot;
            if (!(_it.header().lenFullNode() == master1().nodeHeader().lenRoot())) {
                throw new KaitaiStream.ValidationExprError(this.indexRoot, this._io, "/instances/index_root");
            }
        }
        io.seek(_pos);
        return this.indexRoot;
    }
    private List<byte[]> lebs;

    /**
     * All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
     * at offset `n * <superblock_header>.leb_size`.
     * 
     * Accessing this instance reads the whole image into memory. To get a
     * single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
     * at the offset of that LEB.
     */
    public List<byte[]> lebs() {
        if (this.lebs != null)
            return this.lebs;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.lebs = new ArrayList<byte[]>();
        for (int i = 0; i < superblock().nodeHeader().numLebs(); i++) {
            this.lebs.add(this._io.readBytes(superblock().nodeHeader().lebSize()));
        }
        this._io.seek(_pos);
        return this.lebs;
    }
    private Integer lenImage;

    /**
     * Length of the file system image in bytes:
     * `<superblock_header>.num_lebs` LEBs of `<superblock_header>.leb_size`
     * bytes each. Use it to find where the image ends and to detect a
     * truncated image (see the top-level `doc`).
     */
    public Integer lenImage() {
        if (this.lenImage != null)
            return this.lenImage;
        this.lenImage = ((Number) (superblock().nodeHeader().lebSize() * superblock().nodeHeader().numLebs())).intValue();
        return this.lenImage;
    }
    private MasterblockNode master1;

    /**
     * The first copy of the master node in LEB1. This Kaitai Struct
     * implementation uses it to locate `index_root`. In an image created by
     * `mkfs.ubifs`, it is the only copy in LEB1.
     * @see <a href="https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633">Git tag "v2.3.1"</a>
     */
    public MasterblockNode master1() {
        if (this.master1 != null)
            return this.master1;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize());
        KaitaiStream _io_master1 = this._io.substream(superblock().nodeHeader().lebSize());
        this.master1 = new MasterblockNode(_io_master1, this, _root);
        this._io.seek(_pos);
        return this.master1;
    }
    private MasterblockNode master2;

    /**
     * The first copy of the master node in LEB2. In an image created by
     * `mkfs.ubifs`, it is the same as `master_1` except for the sequence
     * number and CRC in the common header. Linux keeps the master node in both
     * LEB1 and LEB2 for redundancy, and when mounting, it checks that the
     * copies in both match.
     * @see <a href="https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633">Git tag "v2.3.1"</a>
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L115-L130">Git tag "v7.2"</a>
     */
    public MasterblockNode master2() {
        if (this.master2 != null)
            return this.master2;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize() * 2);
        KaitaiStream _io_master2 = this._io.substream(superblock().nodeHeader().lebSize());
        this.master2 = new MasterblockNode(_io_master2, this, _root);
        this._io.seek(_pos);
        return this.master2;
    }
    private SuperblockNode superblock;

    /**
     * The superblock node will always be at the start of
     * the first LEB.
     */
    public SuperblockNode superblock() {
        if (this.superblock != null)
            return this.superblock;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.superblock = new SuperblockNode(this._io, this, _root);
        this._io.seek(_pos);
        return this.superblock;
    }
    private Ubifs _root;
    private KaitaiStruct _parent;
    public Ubifs _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
