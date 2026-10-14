// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
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
public class Ubifs extends KaitaiStruct.ReadWrite {
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
    public Ubifs() {
        this(null, null, null);
    }

    public Ubifs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ubifs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Ubifs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ubifs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteIndex = _enabledIndex;
        _shouldWriteIndexRoot = _enabledIndexRoot;
        _shouldWriteLebs = _enabledLebs;
        _shouldWriteMaster1 = _enabledMaster1;
        _shouldWriteMaster2 = _enabledMaster2;
        _shouldWriteSuperblock = _enabledSuperblock;
    }

    public void _check() {
        if (_enabledIndex) {
            if (!Objects.equals(this.index._root(), _root()))
                throw new ConsistencyError("index", _root(), this.index._root());
            if (!Objects.equals(this.index._parent(), this))
                throw new ConsistencyError("index", this, this.index._parent());
        }
        if (_enabledIndexRoot) {
            if (!Objects.equals(this.indexRoot._root(), _root()))
                throw new ConsistencyError("index_root", _root(), this.indexRoot._root());
            if (!Objects.equals(this.indexRoot._parent(), this))
                throw new ConsistencyError("index_root", this, this.indexRoot._parent());
        }
        if (_enabledLebs) {
            for (int i = 0; i < this.lebs.size(); i++) {
            }
        }
        if (_enabledMaster1) {
            if (!Objects.equals(this.master1._root(), _root()))
                throw new ConsistencyError("master_1", _root(), this.master1._root());
            if (!Objects.equals(this.master1._parent(), this))
                throw new ConsistencyError("master_1", this, this.master1._parent());
        }
        if (_enabledMaster2) {
            if (!Objects.equals(this.master2._root(), _root()))
                throw new ConsistencyError("master_2", _root(), this.master2._root());
            if (!Objects.equals(this.master2._parent(), this))
                throw new ConsistencyError("master_2", this, this.master2._parent());
        }
        if (_enabledSuperblock) {
            if (!Objects.equals(this.superblock._root(), _root()))
                throw new ConsistencyError("superblock", _root(), this.superblock._root());
            if (!Objects.equals(this.superblock._parent(), this))
                throw new ConsistencyError("superblock", this, this.superblock._parent());
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782">Git tag "v7.2"</a>
     */
    public static class AuthenticationHeader extends KaitaiStruct.ReadWrite {
        public static AuthenticationHeader fromFile(String fileName) throws IOException {
            return new AuthenticationHeader(new ByteBufferKaitaiStream(fileName));
        }
        public AuthenticationHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.hmac = this._io.readBytes(_root().superblock().nodeHeader().lenHash());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.hmac);
        }

        public void _check() {
            if (this.hmac.length != _root().superblock().nodeHeader().lenHash())
                throw new ConsistencyError("hmac", _root().superblock().nodeHeader().lenHash(), this.hmac.length);
            _dirty = false;
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
        public void setHmac(byte[] _v) { _dirty = true; hmac = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
    }
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

        public Block(KaitaiStream _io, Ubifs.Branch _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, Ubifs.Branch _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new CommonHeader(this._io, this, _root);
            this.header._read();
            {
                NodeTypes on = header().nodeType();
                if (on != null) {
                    switch (header().nodeType()) {
                    case AUTHENTICATION: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new AuthenticationHeader(_io__raw_nodeHeader, this, _root);
                        ((AuthenticationHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case COMMIT_START: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new CommitStartHeader(_io__raw_nodeHeader, this, _root);
                        ((CommitStartHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case DATA: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new DataHeader(_io__raw_nodeHeader, this, _root);
                        ((DataHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case DIRECTORY: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new DirectoryHeader(_io__raw_nodeHeader, this, _root);
                        ((DirectoryHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case EXTENDED_ATTRIBUTE: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new DirectoryHeader(_io__raw_nodeHeader, this, _root);
                        ((DirectoryHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case INDEX: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new IndexHeader(_io__raw_nodeHeader, this, _root);
                        ((IndexHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case INODE: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new InodeHeader(_io__raw_nodeHeader, this, _root);
                        ((InodeHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case MASTER: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new MasterHeader(_io__raw_nodeHeader, this, _root);
                        ((MasterHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case ORPHAN: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new OrphanHeader(_io__raw_nodeHeader, this, _root);
                        ((OrphanHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case PADDING: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new PaddingHeader(_io__raw_nodeHeader, this, _root);
                        ((PaddingHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case REFERENCE: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new ReferenceHeader(_io__raw_nodeHeader, this, _root);
                        ((ReferenceHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case SIGNATURE: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new SignatureHeader(_io__raw_nodeHeader, this, _root);
                        ((SignatureHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case SUPERBLOCK: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new SuperblockHeader(_io__raw_nodeHeader, this, _root);
                        ((SuperblockHeader) (this.nodeHeader))._read();
                        break;
                    }
                    case TRUNCATION: {
                        this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
                        KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
                        this.nodeHeader = new TruncationHeader(_io__raw_nodeHeader, this, _root);
                        ((TruncationHeader) (this.nodeHeader))._read();
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
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            {
                NodeTypes on = header().nodeType();
                if (on != null) {
                    switch (header().nodeType()) {
                    case AUTHENTICATION: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((AuthenticationHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case COMMIT_START: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((CommitStartHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case DATA: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((DataHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case DIRECTORY: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((DirectoryHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case EXTENDED_ATTRIBUTE: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((DirectoryHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case INDEX: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((IndexHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case INODE: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((InodeHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case MASTER: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((MasterHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case ORPHAN: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((OrphanHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case PADDING: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((PaddingHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case REFERENCE: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((ReferenceHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case SIGNATURE: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((SignatureHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case SUPERBLOCK: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((SuperblockHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    case TRUNCATION: {
                        final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
                        this._io.addChildStream(_io__raw_nodeHeader);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                            final Block _this = this;
                            _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                                    if (((byte[]) (_this._raw_nodeHeader)).length != header().lenFullNode() - 24)
                                        throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, ((byte[]) (_this._raw_nodeHeader)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_nodeHeader)))));
                                }
                            });
                        }
                        ((TruncationHeader) (this.nodeHeader))._write_Seq(_io__raw_nodeHeader);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.nodeHeader)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.nodeHeader)))));
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            {
                NodeTypes on = header().nodeType();
                if (on != null) {
                    switch (header().nodeType()) {
                    case AUTHENTICATION: {
                        if (!Objects.equals(((Ubifs.AuthenticationHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.AuthenticationHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.AuthenticationHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.AuthenticationHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case COMMIT_START: {
                        if (!Objects.equals(((Ubifs.CommitStartHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.CommitStartHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.CommitStartHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.CommitStartHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case DATA: {
                        if (!Objects.equals(((Ubifs.DataHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.DataHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.DataHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.DataHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case DIRECTORY: {
                        if (!Objects.equals(((Ubifs.DirectoryHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.DirectoryHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.DirectoryHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.DirectoryHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case EXTENDED_ATTRIBUTE: {
                        if (!Objects.equals(((Ubifs.DirectoryHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.DirectoryHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.DirectoryHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.DirectoryHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case INDEX: {
                        if (!Objects.equals(((Ubifs.IndexHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.IndexHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.IndexHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.IndexHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case INODE: {
                        if (!Objects.equals(((Ubifs.InodeHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.InodeHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.InodeHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.InodeHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case MASTER: {
                        if (!Objects.equals(((Ubifs.MasterHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.MasterHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.MasterHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.MasterHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case ORPHAN: {
                        if (!Objects.equals(((Ubifs.OrphanHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.OrphanHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.OrphanHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.OrphanHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case PADDING: {
                        if (!Objects.equals(((Ubifs.PaddingHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.PaddingHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.PaddingHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.PaddingHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case REFERENCE: {
                        if (!Objects.equals(((Ubifs.ReferenceHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.ReferenceHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.ReferenceHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.ReferenceHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case SIGNATURE: {
                        if (!Objects.equals(((Ubifs.SignatureHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.SignatureHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.SignatureHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.SignatureHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case SUPERBLOCK: {
                        if (!Objects.equals(((Ubifs.SuperblockHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.SuperblockHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.SuperblockHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.SuperblockHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    case TRUNCATION: {
                        if (!Objects.equals(((Ubifs.TruncationHeader) (this.nodeHeader))._root(), _root()))
                            throw new ConsistencyError("node_header", _root(), ((Ubifs.TruncationHeader) (this.nodeHeader))._root());
                        if (!Objects.equals(((Ubifs.TruncationHeader) (this.nodeHeader))._parent(), this))
                            throw new ConsistencyError("node_header", this, ((Ubifs.TruncationHeader) (this.nodeHeader))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.nodeHeader)).length != header().lenFullNode() - 24)
                            throw new ConsistencyError("node_header", header().lenFullNode() - 24, ((byte[]) (this.nodeHeader)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.nodeHeader)).length != header().lenFullNode() - 24)
                        throw new ConsistencyError("node_header", header().lenFullNode() - 24, ((byte[]) (this.nodeHeader)).length);
                }
            }
            _dirty = false;
        }
        private CommonHeader header;
        private Object nodeHeader;
        private Ubifs _root;
        private Ubifs.Branch _parent;
        private byte[] _raw_nodeHeader;
        public CommonHeader header() { return header; }
        public void setHeader(CommonHeader _v) { _dirty = true; header = _v; }
        public Object nodeHeader() { return nodeHeader; }
        public void setNodeHeader(Object _v) { _dirty = true; nodeHeader = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Branch _parent() { return _parent; }
        public void set_parent(Ubifs.Branch _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_nodeHeader() { return _raw_nodeHeader; }
        public void set_raw_NodeHeader(byte[] _v) { _dirty = true; _raw_nodeHeader = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817">Git tag "v7.2"</a>
     */
    public static class Branch extends KaitaiStruct.ReadWrite {
        public static Branch fromFile(String fileName) throws IOException {
            return new Branch(new ByteBufferKaitaiStream(fileName));
        }
        public Branch() {
            this(null, null, null);
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
        }
        public void _read() {
            this.targetLeb = this._io.readU4le();
            this.ofsTarget = this._io.readU4le();
            this.lenTarget = this._io.readU4le();
            this._raw_key = this._io.readBytes(8);
            KaitaiStream _io__raw_key = new ByteBufferKaitaiStream(this._raw_key);
            this.key = new Key(_io__raw_key, this, _root);
            this.key._read();
            this.hash = this._io.readBytes(_root().superblock().nodeHeader().lenHash());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
            target();
            if (this.target != null) {
                this.target._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteTarget = _enabledTarget;
            this._io.writeU4le(this.targetLeb);
            this._io.writeU4le(this.ofsTarget);
            this._io.writeU4le(this.lenTarget);
            final KaitaiStream _io__raw_key = new ByteBufferKaitaiStream(8);
            this._io.addChildStream(_io__raw_key);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (8));
                final Branch _this = this;
                _io__raw_key.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_key = _io__raw_key.toByteArray();
                        if (_this._raw_key.length != 8)
                            throw new ConsistencyError("raw(key)", 8, _this._raw_key.length);
                        parent.writeBytes(_this._raw_key);
                    }
                });
            }
            this.key._write_Seq(_io__raw_key);
            this._io.writeBytes(this.hash);
        }

        public void _check() {
            if (!Objects.equals(this.key._root(), _root()))
                throw new ConsistencyError("key", _root(), this.key._root());
            if (!Objects.equals(this.key._parent(), this))
                throw new ConsistencyError("key", this, this.key._parent());
            if (this.hash.length != _root().superblock().nodeHeader().lenHash())
                throw new ConsistencyError("hash", _root().superblock().nodeHeader().lenHash(), this.hash.length);
            if (_enabledTarget) {
                if (!Objects.equals(this.target._root(), _root()))
                    throw new ConsistencyError("target", _root(), this.target._root());
                if (!Objects.equals(this.target._parent(), this))
                    throw new ConsistencyError("target", this, this.target._parent());
                {
                    Block _it = this.target;
                    if (!( ((_it.header().lenFullNode() == lenTarget()) && ((_parent().level() != 0 ? _it.header().nodeType() == Ubifs.NodeTypes.INDEX : _it.header().nodeType().id() == key().type().id()))) )) {
                        throw new KaitaiStream.ValidationExprError(this.target, null, "/types/branch/instances/target");
                    }
                }
            }
            _dirty = false;
        }
        private Block target;
        private boolean _shouldWriteTarget = false;
        private boolean _enabledTarget = true;
        public Block target() {
            if (_shouldWriteTarget)
                _writeTarget();
            if (this.target != null)
                return this.target;
            if (!_enabledTarget)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(_root().superblock().nodeHeader().lebSize() * targetLeb() + ofsTarget());
            this._raw_target = io.readBytes(lenTarget());
            KaitaiStream _io__raw_target = new ByteBufferKaitaiStream(this._raw_target);
            this.target = new Block(_io__raw_target, this, _root);
            this.target._read();
            {
                Block _it = this.target;
                if (!( ((_it.header().lenFullNode() == lenTarget()) && ((_parent().level() != 0 ? _it.header().nodeType() == Ubifs.NodeTypes.INDEX : _it.header().nodeType().id() == key().type().id()))) )) {
                    throw new KaitaiStream.ValidationExprError(this.target, this._io, "/types/branch/instances/target");
                }
            }
            io.seek(_pos);
            return this.target;
        }
        public void setTarget(Block _v) { _dirty = true; target = _v; }
        public void setTarget_Enabled(boolean _v) { _dirty = true; _enabledTarget = _v; }

        private void _writeTarget() {
            _shouldWriteTarget = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(_root().superblock().nodeHeader().lebSize() * targetLeb() + ofsTarget());
            final KaitaiStream _io__raw_target = new ByteBufferKaitaiStream(lenTarget());
            io.addChildStream(_io__raw_target);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (lenTarget()));
                final Branch _this = this;
                _io__raw_target.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_target = _io__raw_target.toByteArray();
                        if (_this._raw_target.length != lenTarget())
                            throw new ConsistencyError("raw(target)", lenTarget(), _this._raw_target.length);
                        parent.writeBytes(_this._raw_target);
                    }
                });
            }
            this.target._write_Seq(_io__raw_target);
            io.seek(_pos);
        }
        private long targetLeb;
        private long ofsTarget;
        private long lenTarget;
        private Key key;
        private byte[] hash;
        private Ubifs _root;
        private Ubifs.IndexHeader _parent;
        private byte[] _raw_key;
        private byte[] _raw_target;

        /**
         * LEB number of the target node
         */
        public long targetLeb() { return targetLeb; }
        public void setTargetLeb(long _v) { _dirty = true; targetLeb = _v; }

        /**
         * offset within the LEB `target_leb`
         */
        public long ofsTarget() { return ofsTarget; }
        public void setOfsTarget(long _v) { _dirty = true; ofsTarget = _v; }

        /**
         * target node length
         */
        public long lenTarget() { return lenTarget; }
        public void setLenTarget(long _v) { _dirty = true; lenTarget = _v; }
        public Key key() { return key; }
        public void setKey(Key _v) { _dirty = true; key = _v; }

        /**
         * Hash of the target node. It is empty in a file system without
         * authentication (see `<superblock_header>.len_hash`).
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1642-L1654">Git tag "v7.2"</a>
         */
        public byte[] hash() { return hash; }
        public void setHash(byte[] _v) { _dirty = true; hash = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.IndexHeader _parent() { return _parent; }
        public void set_parent(Ubifs.IndexHeader _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_key() { return _raw_key; }
        public void set_raw_Key(byte[] _v) { _dirty = true; _raw_key = _v; }
        public byte[] _raw_target() { return _raw_target; }
        public void set_raw_Target(byte[] _v) { _dirty = true; _raw_target = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841">Git tag "v7.2"</a>
     */
    public static class CommitStartHeader extends KaitaiStruct.ReadWrite {
        public static CommitStartHeader fromFile(String fileName) throws IOException {
            return new CommitStartHeader(new ByteBufferKaitaiStream(fileName));
        }
        public CommitStartHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.commitNumber = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.commitNumber);
        }

        public void _check() {
            _dirty = false;
        }
        private long commitNumber;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * commit number
         */
        public long commitNumber() { return commitNumber; }
        public void setCommitNumber(long _v) { _dirty = true; commitNumber = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464">Git tag "v7.2"</a>
     */
    public static class CommonHeader extends KaitaiStruct.ReadWrite {
        public static CommonHeader fromFile(String fileName) throws IOException {
            return new CommonHeader(new ByteBufferKaitaiStream(fileName));
        }
        public CommonHeader() {
            this(null, null, null);
        }

        public CommonHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CommonHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public CommonHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.magic);
            this._io.writeU4le(this.crc);
            this._io.writeU8le(this.sequenceNumber);
            this._io.writeU4le(this.lenFullNode);
            this._io.writeU1(((Number) (this.nodeType.id())).intValue());
            this._io.writeU1(((Number) (this.groupType.id())).intValue());
            this._io.writeBytes(this.padding);
        }

        public void _check() {
            if (!(this.magic == 101718065)) {
                throw new KaitaiStream.ValidationNotEqualError(101718065, this.magic, null, "/types/common_header/seq/0");
            }
            if (this.padding.length != 2)
                throw new ConsistencyError("padding", 2, this.padding.length);
            if (!(Arrays.equals(this.padding, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding, null, "/types/common_header/seq/6");
            }
            _dirty = false;
        }
        private long magic;
        private long crc;
        private long sequenceNumber;
        private long lenFullNode;
        private NodeTypes nodeType;
        private NodeGroupTypes groupType;
        private byte[] padding;
        private Ubifs _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * UBIFS node magic number (`UBIFS_NODE_MAGIC`)
         */
        public long magic() { return magic; }
        public void setMagic(long _v) { _dirty = true; magic = _v; }

        /**
         * CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
         * starting at offset 8). It is computed with an initial register value
         * of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
         * CRC-32 (e.g.
         * [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
         * in Python).
         */
        public long crc() { return crc; }
        public void setCrc(long _v) { _dirty = true; crc = _v; }

        /**
         * sequence number
         */
        public long sequenceNumber() { return sequenceNumber; }
        public void setSequenceNumber(long _v) { _dirty = true; sequenceNumber = _v; }

        /**
         * full node length
         */
        public long lenFullNode() { return lenFullNode; }
        public void setLenFullNode(long _v) { _dirty = true; lenFullNode = _v; }

        /**
         * node type
         */
        public NodeTypes nodeType() { return nodeType; }
        public void setNodeType(NodeTypes _v) { _dirty = true; nodeType = _v; }

        /**
         * node group type
         */
        public NodeGroupTypes groupType() { return groupType; }
        public void setGroupType(NodeGroupTypes _v) { _dirty = true; groupType = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584">Git tag "v7.2"</a>
     */
    public static class DataHeader extends KaitaiStruct.ReadWrite {
        public static DataHeader fromFile(String fileName) throws IOException {
            return new DataHeader(new ByteBufferKaitaiStream(fileName));
        }
        public DataHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this._raw_key = this._io.readBytes(16);
            KaitaiStream _io__raw_key = new ByteBufferKaitaiStream(this._raw_key);
            this.key = new Key(_io__raw_key, this, _root);
            this.key._read();
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
            _dirty = false;
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_key = new ByteBufferKaitaiStream(16);
            this._io.addChildStream(_io__raw_key);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (16));
                final DataHeader _this = this;
                _io__raw_key.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_key = _io__raw_key.toByteArray();
                        if (_this._raw_key.length != 16)
                            throw new ConsistencyError("raw(key)", 16, _this._raw_key.length);
                        parent.writeBytes(_this._raw_key);
                    }
                });
            }
            this.key._write_Seq(_io__raw_key);
            this._io.writeU4le(this.lenUncompressed);
            this._io.writeU2le(((Number) (this.compression.id())).intValue());
            this._io.writeU2le(this.lenCompressedData);
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!Objects.equals(this.key._root(), _root()))
                throw new ConsistencyError("key", _root(), this.key._root());
            if (!Objects.equals(this.key._parent(), this))
                throw new ConsistencyError("key", this, this.key._parent());
            if (!(this.lenUncompressed >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.lenUncompressed, null, "/types/data_header/seq/1");
            }
            if (!(this.lenUncompressed <= 4096)) {
                throw new KaitaiStream.ValidationGreaterThanError(4096, this.lenUncompressed, null, "/types/data_header/seq/1");
            }
            if (this.compression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.compression, null, "/types/data_header/seq/2");
            }
            _dirty = false;
        }
        private Key key;
        private long lenUncompressed;
        private Compression compression;
        private int lenCompressedData;
        private byte[] data;
        private Ubifs _root;
        private Ubifs.Block _parent;
        private byte[] _raw_key;

        /**
         * node key
         */
        public Key key() { return key; }
        public void setKey(Key _v) { _dirty = true; key = _v; }

        /**
         * uncompressed data size in bytes
         */
        public long lenUncompressed() { return lenUncompressed; }
        public void setLenUncompressed(long _v) { _dirty = true; lenUncompressed = _v; }

        /**
         * compression type (`compression::no_compression`, `compression::lzo`,
         * etc.)
         */
        public Compression compression() { return compression; }
        public void setCompression(Compression _v) { _dirty = true; compression = _v; }

        /**
         * compressed data size in bytes, only valid when data is encrypted
         */
        public int lenCompressedData() { return lenCompressedData; }
        public void setLenCompressedData(int _v) { _dirty = true; lenCompressedData = _v; }

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
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_key() { return _raw_key; }
        public void set_raw_Key(byte[] _v) { _dirty = true; _raw_key = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565">Git tag "v7.2"</a>
     */
    public static class DirectoryHeader extends KaitaiStruct.ReadWrite {
        public static DirectoryHeader fromFile(String fileName) throws IOException {
            return new DirectoryHeader(new ByteBufferKaitaiStream(fileName));
        }
        public DirectoryHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this._raw_key = this._io.readBytes(16);
            KaitaiStream _io__raw_key = new ByteBufferKaitaiStream(this._raw_key);
            this.key = new Key(_io__raw_key, this, _root);
            this.key._read();
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
            _dirty = false;
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_key = new ByteBufferKaitaiStream(16);
            this._io.addChildStream(_io__raw_key);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (16));
                final DirectoryHeader _this = this;
                _io__raw_key.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_key = _io__raw_key.toByteArray();
                        if (_this._raw_key.length != 16)
                            throw new ConsistencyError("raw(key)", 16, _this._raw_key.length);
                        parent.writeBytes(_this._raw_key);
                    }
                });
            }
            this.key._write_Seq(_io__raw_key);
            this._io.writeU8le(this.inodeNumber);
            this._io.writeBytes(this.padding1);
            this._io.writeU1(((Number) (this.inodeType.id())).intValue());
            this._io.writeU2le(this.lenName);
            this._io.writeU4le(this.cookie);
            this._io.writeBytes(this.name);
            this._io.writeBytes(this.nameTerminator);
        }

        public void _check() {
            if (!Objects.equals(this.key._root(), _root()))
                throw new ConsistencyError("key", _root(), this.key._root());
            if (!Objects.equals(this.key._parent(), this))
                throw new ConsistencyError("key", this, this.key._parent());
            {
                Key _it = this.key;
                if (!( ((_it.type() == Ubifs.KeyTypes.DIRECTORY) || (_it.type() == Ubifs.KeyTypes.EXTENDED_ATTRIBUTE)) )) {
                    throw new KaitaiStream.ValidationExprError(this.key, null, "/types/directory_header/seq/0");
                }
            }
            if (!(this.inodeNumber <= 4294967295L)) {
                throw new KaitaiStream.ValidationGreaterThanError(4294967295L, this.inodeNumber, null, "/types/directory_header/seq/1");
            }
            if (this.padding1.length != 1)
                throw new ConsistencyError("padding1", 1, this.padding1.length);
            if (!(Arrays.equals(this.padding1, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding1, null, "/types/directory_header/seq/2");
            }
            if (this.inodeType == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.inodeType, null, "/types/directory_header/seq/3");
            }
            if (this.name.length != lenName())
                throw new ConsistencyError("name", lenName(), this.name.length);
            if (this.nameTerminator.length != 1)
                throw new ConsistencyError("name_terminator", 1, this.nameTerminator.length);
            if (!(Arrays.equals(this.nameTerminator, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.nameTerminator, null, "/types/directory_header/seq/7");
            }
            _dirty = false;
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
        private byte[] _raw_key;

        /**
         * node key
         */
        public Key key() { return key; }
        public void setKey(Key _v) { _dirty = true; key = _v; }

        /**
         * target inode number
         */
        public long inodeNumber() { return inodeNumber; }
        public void setInodeNumber(long _v) { _dirty = true; inodeNumber = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding1() { return padding1; }
        public void setPadding1(byte[] _v) { _dirty = true; padding1 = _v; }

        /**
         * type of the target inode (`inode_types::regular`,
         * `inode_types::directory`, etc.)
         */
        public InodeTypes inodeType() { return inodeType; }
        public void setInodeType(InodeTypes _v) { _dirty = true; inodeType = _v; }

        /**
         * name length
         */
        public int lenName() { return lenName; }
        public void setLenName(int _v) { _dirty = true; lenName = _v; }

        /**
         * A 32bits random number, used to construct a 64bits identifier.
         */
        public long cookie() { return cookie; }
        public void setCookie(long _v) { _dirty = true; cookie = _v; }

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
        public void setName(byte[] _v) { _dirty = true; name = _v; }

        /**
         * Zero byte after `name`, [not counted in
         * `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).
         */
        public byte[] nameTerminator() { return nameTerminator; }
        public void setNameTerminator(byte[] _v) { _dirty = true; nameTerminator = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_key() { return _raw_key; }
        public void set_raw_Key(byte[] _v) { _dirty = true; _raw_key = _v; }
    }
    public static class Dummy extends KaitaiStruct.ReadWrite {
        public static Dummy fromFile(String fileName) throws IOException {
            return new Dummy(new ByteBufferKaitaiStream(fileName));
        }
        public Dummy() {
            this(null, null, null);
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
        private Ubifs _root;
        private Ubifs _parent;
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs _parent() { return _parent; }
        public void set_parent(Ubifs _v) { _dirty = true; _parent = _v; }
    }
    public static class IndexBlock extends KaitaiStruct.ReadWrite {
        public static IndexBlock fromFile(String fileName) throws IOException {
            return new IndexBlock(new ByteBufferKaitaiStream(fileName));
        }
        public IndexBlock() {
            this(null, null, null);
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
        }
        public void _read() {
            this.header = new CommonHeader(this._io, this, _root);
            this.header._read();
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.INDEX)) {
                    throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/index_block/seq/0");
                }
            }
            this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
            KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
            this.nodeHeader = new IndexHeader(_io__raw_nodeHeader, this, _root);
            this.nodeHeader._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            this.nodeHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
            this._io.addChildStream(_io__raw_nodeHeader);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                final IndexBlock _this = this;
                _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                        if (_this._raw_nodeHeader.length != header().lenFullNode() - 24)
                            throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, _this._raw_nodeHeader.length);
                        parent.writeBytes(_this._raw_nodeHeader);
                    }
                });
            }
            this.nodeHeader._write_Seq(_io__raw_nodeHeader);
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.INDEX)) {
                    throw new KaitaiStream.ValidationExprError(this.header, null, "/types/index_block/seq/0");
                }
            }
            if (!Objects.equals(this.nodeHeader._root(), _root()))
                throw new ConsistencyError("node_header", _root(), this.nodeHeader._root());
            if (!Objects.equals(this.nodeHeader._parent(), this))
                throw new ConsistencyError("node_header", this, this.nodeHeader._parent());
            _dirty = false;
        }
        private CommonHeader header;
        private IndexHeader nodeHeader;
        private Ubifs _root;
        private Ubifs _parent;
        private byte[] _raw_nodeHeader;
        public CommonHeader header() { return header; }
        public void setHeader(CommonHeader _v) { _dirty = true; header = _v; }
        public IndexHeader nodeHeader() { return nodeHeader; }
        public void setNodeHeader(IndexHeader _v) { _dirty = true; nodeHeader = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs _parent() { return _parent; }
        public void set_parent(Ubifs _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_nodeHeader() { return _raw_nodeHeader; }
        public void set_raw_NodeHeader(byte[] _v) { _dirty = true; _raw_nodeHeader = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831">Git tag "v7.2"</a>
     */
    public static class IndexHeader extends KaitaiStruct.ReadWrite {
        public static IndexHeader fromFile(String fileName) throws IOException {
            return new IndexHeader(new ByteBufferKaitaiStream(fileName));
        }
        public IndexHeader() {
            this(null, null, null);
        }

        public IndexHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public IndexHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numBranches = this._io.readU2le();
            this.level = this._io.readU2le();
            this.branches = new ArrayList<Branch>();
            for (int i = 0; i < numBranches(); i++) {
                Branch _t_branches = new Branch(this._io, this, _root);
                try {
                    _t_branches._read();
                } finally {
                    this.branches.add(_t_branches);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.branches.size(); i++) {
                this.branches.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.numBranches);
            this._io.writeU2le(this.level);
            for (int i = 0; i < this.branches.size(); i++) {
                this.branches.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.branches.size() != numBranches())
                throw new ConsistencyError("branches", numBranches(), this.branches.size());
            for (int i = 0; i < this.branches.size(); i++) {
                if (!Objects.equals(this.branches.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("branches", _root(), this.branches.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.branches.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("branches", this, this.branches.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private int numBranches;
        private int level;
        private List<Branch> branches;
        private Ubifs _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * number of child index nodes
         */
        public int numBranches() { return numBranches; }
        public void setNumBranches(int _v) { _dirty = true; numBranches = _v; }

        /**
         * tree level
         */
        public int level() { return level; }
        public void setLevel(int _v) { _dirty = true; level = _v; }

        /**
         * LEB number / offset / length / key branches
         * 
         * All branches have the same size, which is 20 bytes (with the simple
         * key format) plus the hash length in an authenticated file system.
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/misc.h#L186-L205">Git tag "v7.2"</a>
         */
        public List<Branch> branches() { return branches; }
        public void setBranches(List<Branch> _v) { _dirty = true; branches = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539">Git tag "v7.2"</a>
     */
    public static class InodeHeader extends KaitaiStruct.ReadWrite {
        public static InodeHeader fromFile(String fileName) throws IOException {
            return new InodeHeader(new ByteBufferKaitaiStream(fileName));
        }
        public InodeHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this._raw_key = this._io.readBytes(16);
            KaitaiStream _io__raw_key = new ByteBufferKaitaiStream(this._raw_key);
            this.key = new Key(_io__raw_key, this, _root);
            this.key._read();
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
            _dirty = false;
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_key = new ByteBufferKaitaiStream(16);
            this._io.addChildStream(_io__raw_key);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (16));
                final InodeHeader _this = this;
                _io__raw_key.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_key = _io__raw_key.toByteArray();
                        if (_this._raw_key.length != 16)
                            throw new ConsistencyError("raw(key)", 16, _this._raw_key.length);
                        parent.writeBytes(_this._raw_key);
                    }
                });
            }
            this.key._write_Seq(_io__raw_key);
            this._io.writeU8le(this.creationSequenceNumber);
            this._io.writeU8le(this.lenUncompressed);
            this._io.writeU8le(this.atimeSec);
            this._io.writeU8le(this.ctimeSec);
            this._io.writeU8le(this.mtimeSec);
            this._io.writeU4le(this.atimeNsec);
            this._io.writeU4le(this.ctimeNsec);
            this._io.writeU4le(this.mtimeNsec);
            this._io.writeU4le(this.numLinks);
            this._io.writeU4le(this.uid);
            this._io.writeU4le(this.gid);
            this._io.writeU4le(this.mode);
            this._io.writeU4le(this.flags);
            this._io.writeU4le(this.lenData);
            this._io.writeU4le(this.numXattrs);
            this._io.writeU4le(this.xattrSize);
            this._io.writeBytes(this.padding1);
            this._io.writeU4le(this.xattrNames);
            this._io.writeU2le(((Number) (this.compression.id())).intValue());
            this._io.writeBytes(this.padding2);
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if (!Objects.equals(this.key._root(), _root()))
                throw new ConsistencyError("key", _root(), this.key._root());
            if (!Objects.equals(this.key._parent(), this))
                throw new ConsistencyError("key", this, this.key._parent());
            if (this.padding1.length != 4)
                throw new ConsistencyError("padding1", 4, this.padding1.length);
            if (!(Arrays.equals(this.padding1, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.padding1, null, "/types/inode_header/seq/17");
            }
            if (this.compression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.compression, null, "/types/inode_header/seq/19");
            }
            if (this.padding2.length != 26)
                throw new ConsistencyError("padding2", 26, this.padding2.length);
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            _dirty = false;
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
        public void _invalidateAppend() { this.append = null; }
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
        public void _invalidateCompressed() { this.compressed = null; }
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
        public void _invalidateDirsync() { this.dirsync = null; }
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
        public void _invalidateEncrypted() { this.encrypted = null; }
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
        public void _invalidateImmutable() { this.immutable = null; }
        private Boolean isBlockDevice;
        public Boolean isBlockDevice() {
            if (this.isBlockDevice != null)
                return this.isBlockDevice;
            this.isBlockDevice = (mode() & 61440) == 24576;
            return this.isBlockDevice;
        }
        public void _invalidateIsBlockDevice() { this.isBlockDevice = null; }
        private Boolean isCharacterDevice;
        public Boolean isCharacterDevice() {
            if (this.isCharacterDevice != null)
                return this.isCharacterDevice;
            this.isCharacterDevice = (mode() & 61440) == 8192;
            return this.isCharacterDevice;
        }
        public void _invalidateIsCharacterDevice() { this.isCharacterDevice = null; }
        private Boolean isDir;
        public Boolean isDir() {
            if (this.isDir != null)
                return this.isDir;
            this.isDir = (mode() & 61440) == 16384;
            return this.isDir;
        }
        public void _invalidateIsDir() { this.isDir = null; }
        private Boolean isFifo;
        public Boolean isFifo() {
            if (this.isFifo != null)
                return this.isFifo;
            this.isFifo = (mode() & 61440) == 4096;
            return this.isFifo;
        }
        public void _invalidateIsFifo() { this.isFifo = null; }
        private Boolean isLink;
        public Boolean isLink() {
            if (this.isLink != null)
                return this.isLink;
            this.isLink = (mode() & 61440) == 40960;
            return this.isLink;
        }
        public void _invalidateIsLink() { this.isLink = null; }
        private Boolean isRegular;
        public Boolean isRegular() {
            if (this.isRegular != null)
                return this.isRegular;
            this.isRegular = (mode() & 61440) == 32768;
            return this.isRegular;
        }
        public void _invalidateIsRegular() { this.isRegular = null; }
        private Boolean isSocket;
        public Boolean isSocket() {
            if (this.isSocket != null)
                return this.isSocket;
            this.isSocket = (mode() & 61440) == 49152;
            return this.isSocket;
        }
        public void _invalidateIsSocket() { this.isSocket = null; }
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
        public void _invalidateSynchronous() { this.synchronous = null; }
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
        public void _invalidateXattr() { this.xattr = null; }
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
        private byte[] _raw_key;

        /**
         * node key
         */
        public Key key() { return key; }
        public void setKey(Key _v) { _dirty = true; key = _v; }

        /**
         * sequence number at time of creation
         */
        public long creationSequenceNumber() { return creationSequenceNumber; }
        public void setCreationSequenceNumber(long _v) { _dirty = true; creationSequenceNumber = _v; }

        /**
         * inode size in bytes (amount of uncompressed data)
         */
        public long lenUncompressed() { return lenUncompressed; }
        public void setLenUncompressed(long _v) { _dirty = true; lenUncompressed = _v; }

        /**
         * access time seconds
         */
        public long atimeSec() { return atimeSec; }
        public void setAtimeSec(long _v) { _dirty = true; atimeSec = _v; }

        /**
         * status change time seconds
         */
        public long ctimeSec() { return ctimeSec; }
        public void setCtimeSec(long _v) { _dirty = true; ctimeSec = _v; }

        /**
         * modification time seconds
         */
        public long mtimeSec() { return mtimeSec; }
        public void setMtimeSec(long _v) { _dirty = true; mtimeSec = _v; }

        /**
         * access time nanoseconds
         */
        public long atimeNsec() { return atimeNsec; }
        public void setAtimeNsec(long _v) { _dirty = true; atimeNsec = _v; }

        /**
         * status change time nanoseconds
         */
        public long ctimeNsec() { return ctimeNsec; }
        public void setCtimeNsec(long _v) { _dirty = true; ctimeNsec = _v; }

        /**
         * modification time nanoseconds
         */
        public long mtimeNsec() { return mtimeNsec; }
        public void setMtimeNsec(long _v) { _dirty = true; mtimeNsec = _v; }

        /**
         * number of hard links
         */
        public long numLinks() { return numLinks; }
        public void setNumLinks(long _v) { _dirty = true; numLinks = _v; }

        /**
         * owner ID
         */
        public long uid() { return uid; }
        public void setUid(long _v) { _dirty = true; uid = _v; }

        /**
         * group ID
         */
        public long gid() { return gid; }
        public void setGid(long _v) { _dirty = true; gid = _v; }

        /**
         * file type and permissions, as in `st_mode` (see the `is_*`
         * instances for the file type)
         */
        public long mode() { return mode; }
        public void setMode(long _v) { _dirty = true; mode = _v; }

        /**
         * per-inode flags (see the instances `compressed`, `synchronous`,
         * etc.)
         */
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }

        /**
         * inode data length
         */
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }

        /**
         * count of extended attributes this inode has
         */
        public long numXattrs() { return numXattrs; }
        public void setNumXattrs(long _v) { _dirty = true; numXattrs = _v; }

        /**
         * summarized size of all extended attributes in bytes
         */
        public long xattrSize() { return xattrSize; }
        public void setXattrSize(long _v) { _dirty = true; xattrSize = _v; }
        public byte[] padding1() { return padding1; }
        public void setPadding1(byte[] _v) { _dirty = true; padding1 = _v; }

        /**
         * sum of lengths of all extended attribute names belonging
         * to this inode
         */
        public long xattrNames() { return xattrNames; }
        public void setXattrNames(long _v) { _dirty = true; xattrNames = _v; }

        /**
         * compression type used for this inode
         */
        public Compression compression() { return compression; }
        public void setCompression(Compression _v) { _dirty = true; compression = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding2() { return padding2; }
        public void setPadding2(byte[] _v) { _dirty = true; padding2 = _v; }

        /**
         * Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
         * (encrypted if the inode is encrypted), device number of a device node
         * ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
         * 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
         * [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
         * (in its own inode, see `xattr`). Empty otherwise.
         */
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_key() { return _raw_key; }
        public void set_raw_Key(byte[] _v) { _dirty = true; _raw_key = _v; }
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
    public static class Key extends KaitaiStruct.ReadWrite {
        public static Key fromFile(String fileName) throws IOException {
            return new Key(new ByteBufferKaitaiStream(fileName));
        }
        public Key() {
            this(null, null, null);
        }

        public Key(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Key(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Key(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.inodeNumber = this._io.readU4le();
            this.value = this._io.readBitsIntLe(29);
            this.type = Ubifs.KeyTypes.byId(this._io.readBitsIntLe(3));
            if (this.type == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/key/seq/2");
            }
            this.unused = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.inodeNumber);
            this._io.writeBitsIntLe(29, this.value);
            this._io.writeBitsIntLe(3, ((Number) (this.type.id())).longValue());
            this._io.writeBytes(this.unused);
            if (!(this._io.isEof()))
                throw new ConsistencyError("unused", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (this.type == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.type, null, "/types/key/seq/2");
            }
            _dirty = false;
        }
        private long inodeNumber;
        private long value;
        private KeyTypes type;
        private byte[] unused;
        private Ubifs _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * Number of the inode that the node belongs to: the parent directory
         * for a directory entry, the inode that the attribute belongs to for an
         * extended attribute entry.
         */
        public long inodeNumber() { return inodeNumber; }
        public void setInodeNumber(long _v) { _dirty = true; inodeNumber = _v; }

        /**
         * Block number for a data node, hash of the name (see
         * `<superblock_header>.key_hash`) for a directory or extended
         * attribute entry, 0 for an inode node.
         */
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }

        /**
         * Type of the key, which matches the type of the node.
         */
        public KeyTypes type() { return type; }
        public void setType(KeyTypes _v) { _dirty = true; type = _v; }

        /**
         * Rest of the field holding the key: 8 zero bytes in `inode_header`,
         * `directory_header` and `data_header`, empty in `branch`.
         */
        public byte[] unused() { return unused; }
        public void setUnused(byte[] _v) { _dirty = true; unused = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756">Git tag "v7.2"</a>
     */
    public static class MasterHeader extends KaitaiStruct.ReadWrite {
        public static MasterHeader fromFile(String fileName) throws IOException {
            return new MasterHeader(new ByteBufferKaitaiStream(fileName));
        }
        public MasterHeader() {
            this(null, null, null);
        }

        public MasterHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MasterHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public MasterHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.highestInum);
            this._io.writeU8le(this.commitNumber);
            this._io.writeU4le(this.flags);
            this._io.writeU4le(this.lebLog);
            this._io.writeU4le(this.lebRoot);
            this._io.writeU4le(this.ofsRoot);
            this._io.writeU4le(this.lenRoot);
            this._io.writeU4le(this.lebGarbageCollect);
            this._io.writeU4le(this.lebIndexHead);
            this._io.writeU4le(this.ofsIndexHead);
            this._io.writeU8le(this.lenIndex);
            this._io.writeU8le(this.totalFree);
            this._io.writeU8le(this.totalDirty);
            this._io.writeU8le(this.totalUsed);
            this._io.writeU8le(this.totalDead);
            this._io.writeU8le(this.totalDark);
            this._io.writeU4le(this.lebLpt);
            this._io.writeU4le(this.ofsLpt);
            this._io.writeU4le(this.lebNhead);
            this._io.writeU4le(this.ofsNhead);
            this._io.writeU4le(this.lebLpropsTable);
            this._io.writeU4le(this.ofsLpropsTable);
            this._io.writeU4le(this.lebSaveTable);
            this._io.writeU4le(this.ofsSaveTable);
            this._io.writeU4le(this.lebLastLptScan);
            this._io.writeU4le(this.numEmptyLebs);
            this._io.writeU4le(this.numIndexLebs);
            this._io.writeU4le(this.numLebs);
            this._io.writeBytes(this.hashRootIndex);
            this._io.writeBytes(this.hashLpt);
            this._io.writeBytes(this.hmac);
            this._io.writeBytes(this.padding);
        }

        public void _check() {
            if (this.hashRootIndex.length != 64)
                throw new ConsistencyError("hash_root_index", 64, this.hashRootIndex.length);
            if (this.hashLpt.length != 64)
                throw new ConsistencyError("hash_lpt", 64, this.hashLpt.length);
            if (this.hmac.length != 64)
                throw new ConsistencyError("hmac", 64, this.hmac.length);
            if (this.padding.length != 152)
                throw new ConsistencyError("padding", 152, this.padding.length);
            _dirty = false;
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
        public void _invalidateDirty() { this.dirty = null; }
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
        public void _invalidateNoOrphans() { this.noOrphans = null; }
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
        public void _invalidateRecovery() { this.recovery = null; }
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
        private KaitaiStruct.ReadWrite _parent;

        /**
         * highest inode number in the committed index
         */
        public long highestInum() { return highestInum; }
        public void setHighestInum(long _v) { _dirty = true; highestInum = _v; }

        /**
         * commit number
         */
        public long commitNumber() { return commitNumber; }
        public void setCommitNumber(long _v) { _dirty = true; commitNumber = _v; }

        /**
         * various flags (see the instances `dirty`, `no_orphans` and
         * `recovery`)
         */
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }

        /**
         * start of the log
         */
        public long lebLog() { return lebLog; }
        public void setLebLog(long _v) { _dirty = true; lebLog = _v; }

        /**
         * LEB number of the root indexing node
         */
        public long lebRoot() { return lebRoot; }
        public void setLebRoot(long _v) { _dirty = true; lebRoot = _v; }

        /**
         * offset within the LEB `leb_root`
         */
        public long ofsRoot() { return ofsRoot; }
        public void setOfsRoot(long _v) { _dirty = true; ofsRoot = _v; }

        /**
         * root indexing node length
         */
        public long lenRoot() { return lenRoot; }
        public void setLenRoot(long _v) { _dirty = true; lenRoot = _v; }

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
        public void setLebGarbageCollect(long _v) { _dirty = true; lebGarbageCollect = _v; }

        /**
         * LEB number of index head
         */
        public long lebIndexHead() { return lebIndexHead; }
        public void setLebIndexHead(long _v) { _dirty = true; lebIndexHead = _v; }

        /**
         * offset of index head
         */
        public long ofsIndexHead() { return ofsIndexHead; }
        public void setOfsIndexHead(long _v) { _dirty = true; ofsIndexHead = _v; }

        /**
         * size of index on flash
         */
        public long lenIndex() { return lenIndex; }
        public void setLenIndex(long _v) { _dirty = true; lenIndex = _v; }

        /**
         * total free space in bytes
         */
        public long totalFree() { return totalFree; }
        public void setTotalFree(long _v) { _dirty = true; totalFree = _v; }

        /**
         * total dirty space in bytes
         */
        public long totalDirty() { return totalDirty; }
        public void setTotalDirty(long _v) { _dirty = true; totalDirty = _v; }

        /**
         * total used space in bytes (includes only data LEBs)
         */
        public long totalUsed() { return totalUsed; }
        public void setTotalUsed(long _v) { _dirty = true; totalUsed = _v; }

        /**
         * total dead space in bytes (includes only data LEBs)
         */
        public long totalDead() { return totalDead; }
        public void setTotalDead(long _v) { _dirty = true; totalDead = _v; }

        /**
         * total dark space in bytes (includes only data LEBs)
         */
        public long totalDark() { return totalDark; }
        public void setTotalDark(long _v) { _dirty = true; totalDark = _v; }

        /**
         * LEB number of LPT root nnode
         */
        public long lebLpt() { return lebLpt; }
        public void setLebLpt(long _v) { _dirty = true; lebLpt = _v; }

        /**
         * offset of LPT root nnode
         */
        public long ofsLpt() { return ofsLpt; }
        public void setOfsLpt(long _v) { _dirty = true; ofsLpt = _v; }

        /**
         * LEB number of LPT head
         */
        public long lebNhead() { return lebNhead; }
        public void setLebNhead(long _v) { _dirty = true; lebNhead = _v; }

        /**
         * offset of LPT head
         */
        public long ofsNhead() { return ofsNhead; }
        public void setOfsNhead(long _v) { _dirty = true; ofsNhead = _v; }

        /**
         * LEB number of LPT's own lprops table
         */
        public long lebLpropsTable() { return lebLpropsTable; }
        public void setLebLpropsTable(long _v) { _dirty = true; lebLpropsTable = _v; }

        /**
         * offset of LPT's own lprops table
         */
        public long ofsLpropsTable() { return ofsLpropsTable; }
        public void setOfsLpropsTable(long _v) { _dirty = true; ofsLpropsTable = _v; }

        /**
         * LEB number of LPT's save table. Present in every master node, but
         * only meaningful if `<superblock_header>.biglpt` is set: only then
         * does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
         */
        public long lebSaveTable() { return lebSaveTable; }
        public void setLebSaveTable(long _v) { _dirty = true; lebSaveTable = _v; }

        /**
         * offset of LPT's save table (only meaningful if
         * `<superblock_header>.biglpt` is set, see `leb_save_table`)
         */
        public long ofsSaveTable() { return ofsSaveTable; }
        public void setOfsSaveTable(long _v) { _dirty = true; ofsSaveTable = _v; }

        /**
         * LEB number of last LPT scan
         */
        public long lebLastLptScan() { return lebLastLptScan; }
        public void setLebLastLptScan(long _v) { _dirty = true; lebLastLptScan = _v; }

        /**
         * number of empty logical eraseblocks
         */
        public long numEmptyLebs() { return numEmptyLebs; }
        public void setNumEmptyLebs(long _v) { _dirty = true; numEmptyLebs = _v; }

        /**
         * number of indexing logical eraseblocks
         */
        public long numIndexLebs() { return numIndexLebs; }
        public void setNumIndexLebs(long _v) { _dirty = true; numIndexLebs = _v; }

        /**
         * count of LEBs used by file-system
         */
        public long numLebs() { return numLebs; }
        public void setNumLebs(long _v) { _dirty = true; numLebs = _v; }

        /**
         * the hash of the root index node
         */
        public byte[] hashRootIndex() { return hashRootIndex; }
        public void setHashRootIndex(byte[] _v) { _dirty = true; hashRootIndex = _v; }

        /**
         * the hash of the LPT
         */
        public byte[] hashLpt() { return hashLpt; }
        public void setHashLpt(byte[] _v) { _dirty = true; hashLpt = _v; }

        /**
         * HMAC to authenticate the master node
         */
        public byte[] hmac() { return hmac; }
        public void setHmac(byte[] _v) { _dirty = true; hmac = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class MasterblockNode extends KaitaiStruct.ReadWrite {
        public static MasterblockNode fromFile(String fileName) throws IOException {
            return new MasterblockNode(new ByteBufferKaitaiStream(fileName));
        }
        public MasterblockNode() {
            this(null, null, null);
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
        }
        public void _read() {
            this.header = new CommonHeader(this._io, this, _root);
            this.header._read();
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.MASTER)) {
                    throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/masterblock_node/seq/0");
                }
            }
            this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
            KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
            this.nodeHeader = new MasterHeader(_io__raw_nodeHeader, this, _root);
            this.nodeHeader._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            this.nodeHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
            this._io.addChildStream(_io__raw_nodeHeader);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                final MasterblockNode _this = this;
                _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                        if (_this._raw_nodeHeader.length != header().lenFullNode() - 24)
                            throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, _this._raw_nodeHeader.length);
                        parent.writeBytes(_this._raw_nodeHeader);
                    }
                });
            }
            this.nodeHeader._write_Seq(_io__raw_nodeHeader);
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.MASTER)) {
                    throw new KaitaiStream.ValidationExprError(this.header, null, "/types/masterblock_node/seq/0");
                }
            }
            if (!Objects.equals(this.nodeHeader._root(), _root()))
                throw new ConsistencyError("node_header", _root(), this.nodeHeader._root());
            if (!Objects.equals(this.nodeHeader._parent(), this))
                throw new ConsistencyError("node_header", this, this.nodeHeader._parent());
            _dirty = false;
        }
        private CommonHeader header;
        private MasterHeader nodeHeader;
        private Ubifs _root;
        private Ubifs _parent;
        private byte[] _raw_nodeHeader;
        public CommonHeader header() { return header; }
        public void setHeader(CommonHeader _v) { _dirty = true; header = _v; }
        public MasterHeader nodeHeader() { return nodeHeader; }
        public void setNodeHeader(MasterHeader _v) { _dirty = true; nodeHeader = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs _parent() { return _parent; }
        public void set_parent(Ubifs _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_nodeHeader() { return _raw_nodeHeader; }
        public void set_raw_NodeHeader(byte[] _v) { _dirty = true; _raw_nodeHeader = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853">Git tag "v7.2"</a>
     */
    public static class OrphanHeader extends KaitaiStruct.ReadWrite {
        public static OrphanHeader fromFile(String fileName) throws IOException {
            return new OrphanHeader(new ByteBufferKaitaiStream(fileName));
        }
        public OrphanHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.commitNumber = this._io.readU8le();
            this.inodeNumbers = new ArrayList<Long>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.inodeNumbers.add(this._io.readU8le());
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.inodeNumbers.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.commitNumber);
            for (int i = 0; i < this.inodeNumbers.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("inode_numbers", 0, this._io.size() - this._io.pos());
                this._io.writeU8le(this.inodeNumbers.get(((Number) (i)).intValue()));
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("inode_numbers", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.inodeNumbers.size(); i++) {
            }
            _dirty = false;
        }
        private long commitNumber;
        private List<Long> inodeNumbers;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * commit number (also top bit is set on the last node of the commit)
         */
        public long commitNumber() { return commitNumber; }
        public void setCommitNumber(long _v) { _dirty = true; commitNumber = _v; }

        /**
         * inode numbers of orphans
         */
        public List<Long> inodeNumbers() { return inodeNumbers; }
        public void setInodeNumbers(List<Long> _v) { _dirty = true; inodeNumbers = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615">Git tag "v7.2"</a>
     */
    public static class PaddingHeader extends KaitaiStruct.ReadWrite {
        public static PaddingHeader fromFile(String fileName) throws IOException {
            return new PaddingHeader(new ByteBufferKaitaiStream(fileName));
        }
        public PaddingHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenPadding = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenPadding);
        }

        public void _check() {
            _dirty = false;
        }
        private long lenPadding;
        private Ubifs _root;
        private Ubifs.Block _parent;

        /**
         * how many bytes after this node are unused (because padded)
         */
        public long lenPadding() { return lenPadding; }
        public void setLenPadding(long _v) { _dirty = true; lenPadding = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * logical eraseblock reference node.
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772">Git tag "v7.2"</a>
     */
    public static class ReferenceHeader extends KaitaiStruct.ReadWrite {
        public static ReferenceHeader fromFile(String fileName) throws IOException {
            return new ReferenceHeader(new ByteBufferKaitaiStream(fileName));
        }
        public ReferenceHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lebNumber = this._io.readU4le();
            this.ofsLeb = this._io.readU4le();
            this.journalHeadNumber = this._io.readU4le();
            this.padding = this._io.readBytes(28);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lebNumber);
            this._io.writeU4le(this.ofsLeb);
            this._io.writeU4le(this.journalHeadNumber);
            this._io.writeBytes(this.padding);
        }

        public void _check() {
            if (this.padding.length != 28)
                throw new ConsistencyError("padding", 28, this.padding.length);
            _dirty = false;
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
        public void setLebNumber(long _v) { _dirty = true; lebNumber = _v; }

        /**
         * start offset in the referred LEB
         */
        public long ofsLeb() { return ofsLeb; }
        public void setOfsLeb(long _v) { _dirty = true; ofsLeb = _v; }

        /**
         * journal head number
         */
        public long journalHeadNumber() { return journalHeadNumber; }
        public void setJournalHeadNumber(long _v) { _dirty = true; journalHeadNumber = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Signature of the superblock node of a file system signed when it was
     * created (`mkfs.ubifs` with a key). Linux
     * [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
     * as the first node after the superblock node in LEB0.
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799">Git tag "v7.2"</a>
     */
    public static class SignatureHeader extends KaitaiStruct.ReadWrite {
        public static SignatureHeader fromFile(String fileName) throws IOException {
            return new SignatureHeader(new ByteBufferKaitaiStream(fileName));
        }
        public SignatureHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.type = this._io.readU4le();
            if (!(this.type == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, this.type, this._io, "/types/signature_header/seq/0");
            }
            this.lenSignature = this._io.readU4le();
            this.padding = this._io.readBytes(32);
            this.signature = this._io.readBytes(lenSignature());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.type);
            this._io.writeU4le(this.lenSignature);
            this._io.writeBytes(this.padding);
            this._io.writeBytes(this.signature);
        }

        public void _check() {
            if (!(this.type == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, this.type, null, "/types/signature_header/seq/0");
            }
            if (this.padding.length != 32)
                throw new ConsistencyError("padding", 32, this.padding.length);
            if (this.signature.length != lenSignature())
                throw new ConsistencyError("signature", lenSignature(), this.signature.length);
            _dirty = false;
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
        public void setType(long _v) { _dirty = true; type = _v; }

        /**
         * length of `signature` in bytes
         */
        public long lenSignature() { return lenSignature; }
        public void setLenSignature(long _v) { _dirty = true; lenSignature = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }

        /**
         * [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
         * of the whole superblock node (4096 bytes, including the common
         * header)
         */
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683">Git tag "v7.2"</a>
     */
    public static class SuperblockHeader extends KaitaiStruct.ReadWrite {
        public static SuperblockHeader fromFile(String fileName) throws IOException {
            return new SuperblockHeader(new ByteBufferKaitaiStream(fileName));
        }
        public SuperblockHeader() {
            this(null, null, null);
        }

        public SuperblockHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SuperblockHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public SuperblockHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ubifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
            if (authenticated()) {
            }
            if (!(authenticated())) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.padding0);
            this._io.writeU1(((Number) (this.keyHash.id())).intValue());
            this._io.writeU1(((Number) (this.keyFmt.id())).intValue());
            this._io.writeU4le(this.flags);
            this._io.writeU4le(this.minIoSize);
            this._io.writeU4le(this.lebSize);
            this._io.writeU4le(this.numLebs);
            this._io.writeU4le(this.maxNumLebs);
            this._io.writeU8le(this.maxBudBytes);
            this._io.writeU4le(this.numLogLebs);
            this._io.writeU4le(this.numLptLebs);
            this._io.writeU4le(this.numOrphanLebs);
            this._io.writeU4le(this.numJournalHeads);
            this._io.writeU4le(this.fanout);
            this._io.writeU4le(this.numSaveTableEntries);
            this._io.writeU4le(this.fmtVersion);
            this._io.writeU2le(((Number) (this.defaultCompression.id())).intValue());
            this._io.writeBytes(this.padding1);
            this._io.writeU4le(this.reservePoolUid);
            this._io.writeU4le(this.reservePoolGid);
            this._io.writeU8le(this.reservePoolSize);
            this._io.writeU4le(this.timeGranularity);
            this._io.writeBytes(this.uuid);
            this._io.writeU4le(this.roCompatVersion);
            this._io.writeBytes(this.hmac);
            this._io.writeBytes(this.hmacWkm);
            if (authenticated()) {
                this._io.writeU2le(((Number) (this.hashAlgo.id())).intValue());
            }
            if (!(authenticated())) {
                this._io.writeU2le(this.hashAlgoUnused);
            }
            this._io.writeBytes(this.hashMst);
            this._io.writeBytes(this.padding2);
        }

        public void _check() {
            if (this.padding0.length != 2)
                throw new ConsistencyError("padding0", 2, this.padding0.length);
            if (!(Arrays.equals(this.padding0, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding0, null, "/types/superblock_header/seq/0");
            }
            if (this.keyHash == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.keyHash, null, "/types/superblock_header/seq/1");
            }
            if (!(this.keyFmt == Ubifs.KeyFormats.SIMPLE)) {
                throw new KaitaiStream.ValidationNotEqualError(Ubifs.KeyFormats.SIMPLE, this.keyFmt, null, "/types/superblock_header/seq/2");
            }
            if (!(this.maxNumLebs >= numLebs())) {
                throw new KaitaiStream.ValidationLessThanError(numLebs(), this.maxNumLebs, null, "/types/superblock_header/seq/7");
            }
            if (!(this.numLogLebs >= 2)) {
                throw new KaitaiStream.ValidationLessThanError(2, this.numLogLebs, null, "/types/superblock_header/seq/9");
            }
            if (!(this.numLptLebs >= 2)) {
                throw new KaitaiStream.ValidationLessThanError(2, this.numLptLebs, null, "/types/superblock_header/seq/10");
            }
            if (!(this.numOrphanLebs >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.numOrphanLebs, null, "/types/superblock_header/seq/11");
            }
            if (!(this.fmtVersion >= 4)) {
                throw new KaitaiStream.ValidationLessThanError(4, this.fmtVersion, null, "/types/superblock_header/seq/15");
            }
            if (this.defaultCompression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.defaultCompression, null, "/types/superblock_header/seq/16");
            }
            if (this.padding1.length != 2)
                throw new ConsistencyError("padding1", 2, this.padding1.length);
            if (!(Arrays.equals(this.padding1, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding1, null, "/types/superblock_header/seq/17");
            }
            if (!(this.timeGranularity >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.timeGranularity, null, "/types/superblock_header/seq/21");
            }
            if (!(this.timeGranularity <= 1000000000)) {
                throw new KaitaiStream.ValidationGreaterThanError(1000000000, this.timeGranularity, null, "/types/superblock_header/seq/21");
            }
            if (this.uuid.length != 16)
                throw new ConsistencyError("uuid", 16, this.uuid.length);
            if (this.hmac.length != 64)
                throw new ConsistencyError("hmac", 64, this.hmac.length);
            if (this.hmacWkm.length != 64)
                throw new ConsistencyError("hmac_wkm", 64, this.hmacWkm.length);
            if (authenticated()) {
                if (this.hashAlgo == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.hashAlgo, null, "/types/superblock_header/seq/26");
                }
            }
            if (!(authenticated())) {
            }
            if (this.hashMst.length != 64)
                throw new ConsistencyError("hash_mst", 64, this.hashMst.length);
            if (this.padding2.length != 3774)
                throw new ConsistencyError("padding2", 3774, this.padding2.length);
            _dirty = false;
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
        public void _invalidateAuthenticated() { this.authenticated = null; }
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
        public void _invalidateBiglpt() { this.biglpt = null; }
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
        public void _invalidateDoubleHash() { this.doubleHash = null; }
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
        public void _invalidateEncrypted() { this.encrypted = null; }
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
        public void _invalidateLenHash() { this.lenHash = null; }
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
        public void _invalidateSpaceFixup() { this.spaceFixup = null; }
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
        private KaitaiStruct.ReadWrite _parent;

        /**
         * reserved for future, zeroes
         */
        public byte[] padding0() { return padding0; }
        public void setPadding0(byte[] _v) { _dirty = true; padding0 = _v; }

        /**
         * type of hash function used in keys
         */
        public Hashes keyHash() { return keyHash; }
        public void setKeyHash(Hashes _v) { _dirty = true; keyHash = _v; }

        /**
         * format of the key
         */
        public KeyFormats keyFmt() { return keyFmt; }
        public void setKeyFmt(KeyFormats _v) { _dirty = true; keyFmt = _v; }

        /**
         * file-system flags (see the instances `biglpt`, `space_fixup`, etc.)
         */
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }

        /**
         * minimal input/output unit size
         */
        public long minIoSize() { return minIoSize; }
        public void setMinIoSize(long _v) { _dirty = true; minIoSize = _v; }

        /**
         * logical eraseblock size in bytes
         */
        public long lebSize() { return lebSize; }
        public void setLebSize(long _v) { _dirty = true; lebSize = _v; }

        /**
         * count of LEBs used by file-system
         */
        public long numLebs() { return numLebs; }
        public void setNumLebs(long _v) { _dirty = true; numLebs = _v; }

        /**
         * maximum count of LEBs used by file-system
         */
        public long maxNumLebs() { return maxNumLebs; }
        public void setMaxNumLebs(long _v) { _dirty = true; maxNumLebs = _v; }

        /**
         * maximum amount of data stored in buds
         */
        public long maxBudBytes() { return maxBudBytes; }
        public void setMaxBudBytes(long _v) { _dirty = true; maxBudBytes = _v; }

        /**
         * log size in logical eraseblocks
         */
        public long numLogLebs() { return numLogLebs; }
        public void setNumLogLebs(long _v) { _dirty = true; numLogLebs = _v; }

        /**
         * number of LEBs used for lprops table
         */
        public long numLptLebs() { return numLptLebs; }
        public void setNumLptLebs(long _v) { _dirty = true; numLptLebs = _v; }

        /**
         * number of LEBs used for recording orphans
         */
        public long numOrphanLebs() { return numOrphanLebs; }
        public void setNumOrphanLebs(long _v) { _dirty = true; numOrphanLebs = _v; }

        /**
         * count of journal heads
         */
        public long numJournalHeads() { return numJournalHeads; }
        public void setNumJournalHeads(long _v) { _dirty = true; numJournalHeads = _v; }

        /**
         * tree fanout (max. number of links per indexing node)
         */
        public long fanout() { return fanout; }
        public void setFanout(long _v) { _dirty = true; fanout = _v; }

        /**
         * number of LEB numbers in LPT's save table
         */
        public long numSaveTableEntries() { return numSaveTableEntries; }
        public void setNumSaveTableEntries(long _v) { _dirty = true; numSaveTableEntries = _v; }

        /**
         * UBIFS on-flash format version
         */
        public long fmtVersion() { return fmtVersion; }
        public void setFmtVersion(long _v) { _dirty = true; fmtVersion = _v; }

        /**
         * default compression algorithm (`compression::lzo`, etc.)
         */
        public Compression defaultCompression() { return defaultCompression; }
        public void setDefaultCompression(Compression _v) { _dirty = true; defaultCompression = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding1() { return padding1; }
        public void setPadding1(byte[] _v) { _dirty = true; padding1 = _v; }

        /**
         * reserve pool UID
         */
        public long reservePoolUid() { return reservePoolUid; }
        public void setReservePoolUid(long _v) { _dirty = true; reservePoolUid = _v; }

        /**
         * reserve pool GID
         */
        public long reservePoolGid() { return reservePoolGid; }
        public void setReservePoolGid(long _v) { _dirty = true; reservePoolGid = _v; }

        /**
         * size of the reserved pool in bytes
         */
        public long reservePoolSize() { return reservePoolSize; }
        public void setReservePoolSize(long _v) { _dirty = true; reservePoolSize = _v; }

        /**
         * time granularity in nanoseconds
         */
        public long timeGranularity() { return timeGranularity; }
        public void setTimeGranularity(long _v) { _dirty = true; timeGranularity = _v; }

        /**
         * UUID generated when the file system image was created
         */
        public byte[] uuid() { return uuid; }
        public void setUuid(byte[] _v) { _dirty = true; uuid = _v; }

        /**
         * UBIFS R/O compatibility version
         */
        public long roCompatVersion() { return roCompatVersion; }
        public void setRoCompatVersion(long _v) { _dirty = true; roCompatVersion = _v; }

        /**
         * HMAC to authenticate the superblock node
         */
        public byte[] hmac() { return hmac; }
        public void setHmac(byte[] _v) { _dirty = true; hmac = _v; }

        /**
         * HMAC of a well known message (the string "UBIFS") as a convenience
         * to the user to check if the correct key is passed
         */
        public byte[] hmacWkm() { return hmacWkm; }
        public void setHmacWkm(byte[] _v) { _dirty = true; hmacWkm = _v; }

        /**
         * The hash algo used for this filesystem
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L549-L573">Git tag "v7.2"</a>
         */
        public HashAlgos hashAlgo() { return hashAlgo; }
        public void setHashAlgo(HashAlgos _v) { _dirty = true; hashAlgo = _v; }

        /**
         * Unused field (would only be meaningful in an authenticated file
         * system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
         * writes it as 0.
         * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L183-L191">Git tag "v7.2"</a>
         */
        public Integer hashAlgoUnused() { return hashAlgoUnused; }
        public void setHashAlgoUnused(Integer _v) { _dirty = true; hashAlgoUnused = _v; }

        /**
         * hash of the master node, only valid for signed images in which the
         * master node does not contain a hmac
         */
        public byte[] hashMst() { return hashMst; }
        public void setHashMst(byte[] _v) { _dirty = true; hashMst = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding2() { return padding2; }
        public void setPadding2(byte[] _v) { _dirty = true; padding2 = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class SuperblockNode extends KaitaiStruct.ReadWrite {
        public static SuperblockNode fromFile(String fileName) throws IOException {
            return new SuperblockNode(new ByteBufferKaitaiStream(fileName));
        }
        public SuperblockNode() {
            this(null, null, null);
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
        }
        public void _read() {
            this.header = new CommonHeader(this._io, this, _root);
            this.header._read();
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.SUPERBLOCK)) {
                    throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/superblock_node/seq/0");
                }
            }
            this._raw_nodeHeader = this._io.readBytes(header().lenFullNode() - 24);
            KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(this._raw_nodeHeader);
            this.nodeHeader = new SuperblockHeader(_io__raw_nodeHeader, this, _root);
            this.nodeHeader._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            this.nodeHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            final KaitaiStream _io__raw_nodeHeader = new ByteBufferKaitaiStream(header().lenFullNode() - 24);
            this._io.addChildStream(_io__raw_nodeHeader);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (header().lenFullNode() - 24));
                final SuperblockNode _this = this;
                _io__raw_nodeHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_nodeHeader = _io__raw_nodeHeader.toByteArray();
                        if (_this._raw_nodeHeader.length != header().lenFullNode() - 24)
                            throw new ConsistencyError("raw(node_header)", header().lenFullNode() - 24, _this._raw_nodeHeader.length);
                        parent.writeBytes(_this._raw_nodeHeader);
                    }
                });
            }
            this.nodeHeader._write_Seq(_io__raw_nodeHeader);
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            {
                CommonHeader _it = this.header;
                if (!(_it.nodeType() == Ubifs.NodeTypes.SUPERBLOCK)) {
                    throw new KaitaiStream.ValidationExprError(this.header, null, "/types/superblock_node/seq/0");
                }
            }
            if (!Objects.equals(this.nodeHeader._root(), _root()))
                throw new ConsistencyError("node_header", _root(), this.nodeHeader._root());
            if (!Objects.equals(this.nodeHeader._parent(), this))
                throw new ConsistencyError("node_header", this, this.nodeHeader._parent());
            _dirty = false;
        }
        private CommonHeader header;
        private SuperblockHeader nodeHeader;
        private Ubifs _root;
        private Ubifs _parent;
        private byte[] _raw_nodeHeader;
        public CommonHeader header() { return header; }
        public void setHeader(CommonHeader _v) { _dirty = true; header = _v; }
        public SuperblockHeader nodeHeader() { return nodeHeader; }
        public void setNodeHeader(SuperblockHeader _v) { _dirty = true; nodeHeader = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs _parent() { return _parent; }
        public void set_parent(Ubifs _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_nodeHeader() { return _raw_nodeHeader; }
        public void set_raw_NodeHeader(byte[] _v) { _dirty = true; _raw_nodeHeader = _v; }
    }

    /**
     * This node exists only in the journal and never goes to the main area.
     * @see <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604">Git tag "v7.2"</a>
     */
    public static class TruncationHeader extends KaitaiStruct.ReadWrite {
        public static TruncationHeader fromFile(String fileName) throws IOException {
            return new TruncationHeader(new ByteBufferKaitaiStream(fileName));
        }
        public TruncationHeader() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.inodeNumber);
            this._io.writeBytes(this.padding);
            this._io.writeU8le(this.oldSize);
            this._io.writeU8le(this.newSize);
        }

        public void _check() {
            if (this.padding.length != 12)
                throw new ConsistencyError("padding", 12, this.padding.length);
            if (!(this.oldSize >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.oldSize, null, "/types/truncation_header/seq/2");
            }
            if (!(this.newSize <= oldSize() - 1)) {
                throw new KaitaiStream.ValidationGreaterThanError(oldSize() - 1, this.newSize, null, "/types/truncation_header/seq/3");
            }
            _dirty = false;
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
        public void setInodeNumber(long _v) { _dirty = true; inodeNumber = _v; }

        /**
         * reserved for future, zeroes
         */
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }

        /**
         * size before truncation
         */
        public long oldSize() { return oldSize; }
        public void setOldSize(long _v) { _dirty = true; oldSize = _v; }

        /**
         * size after truncation
         */
        public long newSize() { return newSize; }
        public void setNewSize(long _v) { _dirty = true; newSize = _v; }
        public Ubifs _root() { return _root; }
        public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
        public Ubifs.Block _parent() { return _parent; }
        public void set_parent(Ubifs.Block _v) { _dirty = true; _parent = _v; }
    }
    private Dummy index;
    private boolean _shouldWriteIndex = false;
    private boolean _enabledIndex = true;

    /**
     * The LEB containing the root index node, as given by `leb_root` in
     * `master_1`.
     * 
     * This instance only provides the substream for `index_root`, which can then
     * use `ofs_root` (an offset within the LEB) as its `pos` directly.
     */
    public Dummy index() {
        if (_shouldWriteIndex)
            _writeIndex();
        if (this.index != null)
            return this.index;
        if (!_enabledIndex)
            return null;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize() * master1().nodeHeader().lebRoot());
        this._raw_index = this._io.readBytes(superblock().nodeHeader().lebSize());
        KaitaiStream _io__raw_index = new ByteBufferKaitaiStream(this._raw_index);
        this.index = new Dummy(_io__raw_index, this, _root);
        this.index._read();
        this._io.seek(_pos);
        return this.index;
    }
    public void setIndex(Dummy _v) { _dirty = true; index = _v; }
    public void setIndex_Enabled(boolean _v) { _dirty = true; _enabledIndex = _v; }

    private void _writeIndex() {
        _shouldWriteIndex = false;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize() * master1().nodeHeader().lebRoot());
        final KaitaiStream _io__raw_index = new ByteBufferKaitaiStream(superblock().nodeHeader().lebSize());
        this._io.addChildStream(_io__raw_index);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (superblock().nodeHeader().lebSize()));
            final Ubifs _this = this;
            _io__raw_index.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_index = _io__raw_index.toByteArray();
                    if (_this._raw_index.length != superblock().nodeHeader().lebSize())
                        throw new ConsistencyError("raw(index)", superblock().nodeHeader().lebSize(), _this._raw_index.length);
                    parent.writeBytes(_this._raw_index);
                }
            });
        }
        this.index._write_Seq(_io__raw_index);
        this._io.seek(_pos);
    }
    private IndexBlock indexRoot;
    private boolean _shouldWriteIndexRoot = false;
    private boolean _enabledIndexRoot = true;

    /**
     * The root index node, in the `index` LEB at the offset given by
     * `ofs_root` in `master_1`. All other index nodes, and through them all
     * the files, are reached from it by recursively following the `target` of
     * each of the `branches`.
     */
    public IndexBlock indexRoot() {
        if (_shouldWriteIndexRoot)
            _writeIndexRoot();
        if (this.indexRoot != null)
            return this.indexRoot;
        if (!_enabledIndexRoot)
            return null;
        KaitaiStream io = index()._io();
        long _pos = io.pos();
        io.seek(master1().nodeHeader().ofsRoot());
        this.indexRoot = new IndexBlock(io, this, _root);
        this.indexRoot._read();
        {
            IndexBlock _it = this.indexRoot;
            if (!(_it.header().lenFullNode() == master1().nodeHeader().lenRoot())) {
                throw new KaitaiStream.ValidationExprError(this.indexRoot, this._io, "/instances/index_root");
            }
        }
        io.seek(_pos);
        return this.indexRoot;
    }
    public void setIndexRoot(IndexBlock _v) { _dirty = true; indexRoot = _v; }
    public void setIndexRoot_Enabled(boolean _v) { _dirty = true; _enabledIndexRoot = _v; }

    private void _writeIndexRoot() {
        _shouldWriteIndexRoot = false;
        KaitaiStream io = index()._io();
        long _pos = io.pos();
        io.seek(master1().nodeHeader().ofsRoot());
        this.indexRoot._write_Seq(io);
        io.seek(_pos);
    }
    private List<byte[]> lebs;
    private boolean _shouldWriteLebs = false;
    private boolean _enabledLebs = true;

    /**
     * All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
     * at offset `n * <superblock_header>.leb_size`.
     * 
     * Accessing this instance reads the whole image into memory. To get a
     * single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
     * at the offset of that LEB.
     */
    public List<byte[]> lebs() {
        if (_shouldWriteLebs)
            _writeLebs();
        if (this.lebs != null)
            return this.lebs;
        if (!_enabledLebs)
            return null;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.lebs = new ArrayList<byte[]>();
        for (int i = 0; i < superblock().nodeHeader().numLebs(); i++) {
            this.lebs.add(this._io.readBytes(superblock().nodeHeader().lebSize()));
        }
        this._io.seek(_pos);
        return this.lebs;
    }
    public void setLebs(List<byte[]> _v) { _dirty = true; lebs = _v; }
    public void setLebs_Enabled(boolean _v) { _dirty = true; _enabledLebs = _v; }

    private void _writeLebs() {
        _shouldWriteLebs = false;
        long _pos = this._io.pos();
        this._io.seek(0);
        if (this.lebs.size() != superblock().nodeHeader().numLebs())
            throw new ConsistencyError("lebs", superblock().nodeHeader().numLebs(), this.lebs.size());
        for (int i = 0; i < this.lebs.size(); i++) {
            if (this.lebs.get(((Number) (i)).intValue()).length != superblock().nodeHeader().lebSize())
                throw new ConsistencyError("lebs", superblock().nodeHeader().lebSize(), this.lebs.get(((Number) (i)).intValue()).length);
            this._io.writeBytes(this.lebs.get(((Number) (i)).intValue()));
        }
        this._io.seek(_pos);
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
    public void _invalidateLenImage() { this.lenImage = null; }
    private MasterblockNode master1;
    private boolean _shouldWriteMaster1 = false;
    private boolean _enabledMaster1 = true;

    /**
     * The first copy of the master node in LEB1. This Kaitai Struct
     * implementation uses it to locate `index_root`. In an image created by
     * `mkfs.ubifs`, it is the only copy in LEB1.
     * @see <a href="https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633">Git tag "v2.3.1"</a>
     */
    public MasterblockNode master1() {
        if (_shouldWriteMaster1)
            _writeMaster1();
        if (this.master1 != null)
            return this.master1;
        if (!_enabledMaster1)
            return null;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize());
        this._raw_master1 = this._io.readBytes(superblock().nodeHeader().lebSize());
        KaitaiStream _io__raw_master1 = new ByteBufferKaitaiStream(this._raw_master1);
        this.master1 = new MasterblockNode(_io__raw_master1, this, _root);
        this.master1._read();
        this._io.seek(_pos);
        return this.master1;
    }
    public void setMaster1(MasterblockNode _v) { _dirty = true; master1 = _v; }
    public void setMaster1_Enabled(boolean _v) { _dirty = true; _enabledMaster1 = _v; }

    private void _writeMaster1() {
        _shouldWriteMaster1 = false;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize());
        final KaitaiStream _io__raw_master1 = new ByteBufferKaitaiStream(superblock().nodeHeader().lebSize());
        this._io.addChildStream(_io__raw_master1);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (superblock().nodeHeader().lebSize()));
            final Ubifs _this = this;
            _io__raw_master1.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_master1 = _io__raw_master1.toByteArray();
                    if (_this._raw_master1.length != superblock().nodeHeader().lebSize())
                        throw new ConsistencyError("raw(master_1)", superblock().nodeHeader().lebSize(), _this._raw_master1.length);
                    parent.writeBytes(_this._raw_master1);
                }
            });
        }
        this.master1._write_Seq(_io__raw_master1);
        this._io.seek(_pos);
    }
    private MasterblockNode master2;
    private boolean _shouldWriteMaster2 = false;
    private boolean _enabledMaster2 = true;

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
        if (_shouldWriteMaster2)
            _writeMaster2();
        if (this.master2 != null)
            return this.master2;
        if (!_enabledMaster2)
            return null;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize() * 2);
        this._raw_master2 = this._io.readBytes(superblock().nodeHeader().lebSize());
        KaitaiStream _io__raw_master2 = new ByteBufferKaitaiStream(this._raw_master2);
        this.master2 = new MasterblockNode(_io__raw_master2, this, _root);
        this.master2._read();
        this._io.seek(_pos);
        return this.master2;
    }
    public void setMaster2(MasterblockNode _v) { _dirty = true; master2 = _v; }
    public void setMaster2_Enabled(boolean _v) { _dirty = true; _enabledMaster2 = _v; }

    private void _writeMaster2() {
        _shouldWriteMaster2 = false;
        long _pos = this._io.pos();
        this._io.seek(superblock().nodeHeader().lebSize() * 2);
        final KaitaiStream _io__raw_master2 = new ByteBufferKaitaiStream(superblock().nodeHeader().lebSize());
        this._io.addChildStream(_io__raw_master2);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (superblock().nodeHeader().lebSize()));
            final Ubifs _this = this;
            _io__raw_master2.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_master2 = _io__raw_master2.toByteArray();
                    if (_this._raw_master2.length != superblock().nodeHeader().lebSize())
                        throw new ConsistencyError("raw(master_2)", superblock().nodeHeader().lebSize(), _this._raw_master2.length);
                    parent.writeBytes(_this._raw_master2);
                }
            });
        }
        this.master2._write_Seq(_io__raw_master2);
        this._io.seek(_pos);
    }
    private SuperblockNode superblock;
    private boolean _shouldWriteSuperblock = false;
    private boolean _enabledSuperblock = true;

    /**
     * The superblock node will always be at the start of
     * the first LEB.
     */
    public SuperblockNode superblock() {
        if (_shouldWriteSuperblock)
            _writeSuperblock();
        if (this.superblock != null)
            return this.superblock;
        if (!_enabledSuperblock)
            return null;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.superblock = new SuperblockNode(this._io, this, _root);
        this.superblock._read();
        this._io.seek(_pos);
        return this.superblock;
    }
    public void setSuperblock(SuperblockNode _v) { _dirty = true; superblock = _v; }
    public void setSuperblock_Enabled(boolean _v) { _dirty = true; _enabledSuperblock = _v; }

    private void _writeSuperblock() {
        _shouldWriteSuperblock = false;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.superblock._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private Ubifs _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_index;
    private byte[] _raw_master1;
    private byte[] _raw_master2;
    public Ubifs _root() { return _root; }
    public void set_root(Ubifs _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_index() { return _raw_index; }
    public void set_raw_Index(byte[] _v) { _dirty = true; _raw_index = _v; }
    public byte[] _raw_master1() { return _raw_master1; }
    public void set_raw_Master1(byte[] _v) { _dirty = true; _raw_master1 = _v; }
    public byte[] _raw_master2() { return _raw_master2; }
    public void set_raw_Master2(byte[] _v) { _dirty = true; _raw_master2 = _v; }
}
