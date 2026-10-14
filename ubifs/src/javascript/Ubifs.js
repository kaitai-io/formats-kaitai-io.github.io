// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Ubifs || (root.Ubifs = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Ubifs_, KaitaiStream) {
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
 * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h|Git tag "v7.2"}
 * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h|Git tag "v7.2"}
 * @see {@link http://www.linux-mtd.infradead.org/doc/ubifs.pdf|Source}
 */

var Ubifs = (function() {
  Ubifs.Compression = Object.freeze({
    NO_COMPRESSION: 0,
    LZO: 1,
    ZLIB: 2,
    ZSTD: 3,

    0: "NO_COMPRESSION",
    1: "LZO",
    2: "ZLIB",
    3: "ZSTD",
  });

  Ubifs.HashAlgos = Object.freeze({
    MD4: 0,
    MD5: 1,
    SHA1: 2,
    RIPE_MD_160: 3,
    SHA256: 4,
    SHA384: 5,
    SHA512: 6,
    SHA224: 7,
    RIPE_MD_128: 8,
    RIPE_MD_256: 9,
    RIPE_MD_320: 10,
    WP_256: 11,
    WP_384: 12,
    WP_512: 13,
    TGR_128: 14,
    TGR_160: 15,
    TGR_192: 16,
    SM3_256: 17,
    STREEBOG_256: 18,
    STREEBOG_512: 19,
    SHA3_256: 20,
    SHA3_384: 21,
    SHA3_512: 22,

    0: "MD4",
    1: "MD5",
    2: "SHA1",
    3: "RIPE_MD_160",
    4: "SHA256",
    5: "SHA384",
    6: "SHA512",
    7: "SHA224",
    8: "RIPE_MD_128",
    9: "RIPE_MD_256",
    10: "RIPE_MD_320",
    11: "WP_256",
    12: "WP_384",
    13: "WP_512",
    14: "TGR_128",
    15: "TGR_160",
    16: "TGR_192",
    17: "SM3_256",
    18: "STREEBOG_256",
    19: "STREEBOG_512",
    20: "SHA3_256",
    21: "SHA3_384",
    22: "SHA3_512",
  });

  Ubifs.Hashes = Object.freeze({
    R5: 0,
    TEST_HASH: 1,

    0: "R5",
    1: "TEST_HASH",
  });

  Ubifs.InodeTypes = Object.freeze({
    REGULAR: 0,
    DIRECTORY: 1,
    LINK: 2,
    BLOCK_DEVICE: 3,
    CHARACTER_DEVICE: 4,
    FIFO: 5,
    SOCKET: 6,

    0: "REGULAR",
    1: "DIRECTORY",
    2: "LINK",
    3: "BLOCK_DEVICE",
    4: "CHARACTER_DEVICE",
    5: "FIFO",
    6: "SOCKET",
  });

  Ubifs.KeyFormats = Object.freeze({
    SIMPLE: 0,

    0: "SIMPLE",
  });

  Ubifs.KeyTypes = Object.freeze({
    INODE: 0,
    DATA: 1,
    DIRECTORY: 2,
    EXTENDED_ATTRIBUTE: 3,

    0: "INODE",
    1: "DATA",
    2: "DIRECTORY",
    3: "EXTENDED_ATTRIBUTE",
  });

  Ubifs.NodeGroupTypes = Object.freeze({
    NO_NODE_GROUP: 0,
    IN_NODE_GROUP: 1,
    LAST_OF_NODE_GROUP: 2,

    0: "NO_NODE_GROUP",
    1: "IN_NODE_GROUP",
    2: "LAST_OF_NODE_GROUP",
  });

  Ubifs.NodeTypes = Object.freeze({
    INODE: 0,
    DATA: 1,
    DIRECTORY: 2,
    EXTENDED_ATTRIBUTE: 3,
    TRUNCATION: 4,
    PADDING: 5,
    SUPERBLOCK: 6,
    MASTER: 7,
    REFERENCE: 8,
    INDEX: 9,
    COMMIT_START: 10,
    ORPHAN: 11,
    AUTHENTICATION: 12,
    SIGNATURE: 13,

    0: "INODE",
    1: "DATA",
    2: "DIRECTORY",
    3: "EXTENDED_ATTRIBUTE",
    4: "TRUNCATION",
    5: "PADDING",
    6: "SUPERBLOCK",
    7: "MASTER",
    8: "REFERENCE",
    9: "INDEX",
    10: "COMMIT_START",
    11: "ORPHAN",
    12: "AUTHENTICATION",
    13: "SIGNATURE",
  });

  function Ubifs(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ubifs.prototype._read = function() {
  }

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782|Git tag "v7.2"}
   */

  var AuthenticationHeader = Ubifs.AuthenticationHeader = (function() {
    function AuthenticationHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    AuthenticationHeader.prototype._read = function() {
      this.hmac = this._io.readBytes(this._root.superblock.nodeHeader.lenHash);
    }

    /**
     * HMAC authenticating the journal before this node, keyed with the
     * file system's authentication key (which is not stored on flash).
     * The kernel [uses](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L275-L276)
     * HMAC with the hash algorithm in `<superblock_header>.hash_algo`
     * ([checked when mounting](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L575-L580)),
     * so `hmac` is as long as its digest, e.g. 32 bytes for SHA-256.
     */

    return AuthenticationHeader;
  })();

  var Block = Ubifs.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Block.prototype._read = function() {
      this.header = new CommonHeader(this._io, this, this._root);
      switch (this.header.nodeType) {
      case Ubifs.NodeTypes.AUTHENTICATION:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new AuthenticationHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.COMMIT_START:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new CommitStartHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.DATA:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new DataHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.DIRECTORY:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new DirectoryHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.EXTENDED_ATTRIBUTE:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new DirectoryHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.INDEX:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new IndexHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.INODE:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new InodeHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.MASTER:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new MasterHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.ORPHAN:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new OrphanHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.PADDING:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new PaddingHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.REFERENCE:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new ReferenceHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.SIGNATURE:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new SignatureHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.SUPERBLOCK:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new SuperblockHeader(_io__raw_nodeHeader, this, this._root);
        break;
      case Ubifs.NodeTypes.TRUNCATION:
        this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
        this.nodeHeader = new TruncationHeader(_io__raw_nodeHeader, this, this._root);
        break;
      default:
        this.nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
        break;
      }
    }

    return Block;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817|Git tag "v7.2"}
   */

  var Branch = Ubifs.Branch = (function() {
    function Branch(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Branch.prototype._read = function() {
      this.targetLeb = this._io.readU4le();
      this.ofsTarget = this._io.readU4le();
      this.lenTarget = this._io.readU4le();
      this._raw_key = this._io.readBytes(8);
      var _io__raw_key = new KaitaiStream(this._raw_key);
      this.key = new Key(_io__raw_key, this, this._root);
      this.hash = this._io.readBytes(this._root.superblock.nodeHeader.lenHash);
    }
    Object.defineProperty(Branch.prototype, 'target', {
      get: function() {
        if (this._m_target !== undefined)
          return this._m_target;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this._root.superblock.nodeHeader.lebSize * this.targetLeb + this.ofsTarget);
        this._raw__m_target = io.readBytes(this.lenTarget);
        var _io__raw__m_target = new KaitaiStream(this._raw__m_target);
        this._m_target = new Block(_io__raw__m_target, this, this._root);
        var _ = this._m_target;
        if (!( ((_.header.lenFullNode == this.lenTarget) && ((this._parent.level != 0 ? _.header.nodeType == Ubifs.NodeTypes.INDEX : _.header.nodeType == this.key.type))) )) {
          throw new KaitaiStream.ValidationExprError(this._m_target, this._io, "/types/branch/instances/target");
        }
        io.seek(_pos);
        return this._m_target;
      }
    });

    /**
     * LEB number of the target node
     */

    /**
     * offset within the LEB `target_leb`
     */

    /**
     * target node length
     */

    /**
     * Hash of the target node. It is empty in a file system without
     * authentication (see `<superblock_header>.len_hash`).
     * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1642-L1654|Git tag "v7.2"}
     */

    return Branch;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841|Git tag "v7.2"}
   */

  var CommitStartHeader = Ubifs.CommitStartHeader = (function() {
    function CommitStartHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    CommitStartHeader.prototype._read = function() {
      this.commitNumber = this._io.readU8le();
    }

    /**
     * commit number
     */

    return CommitStartHeader;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464|Git tag "v7.2"}
   */

  var CommonHeader = Ubifs.CommonHeader = (function() {
    function CommonHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    CommonHeader.prototype._read = function() {
      this.magic = this._io.readU4le();
      if (!(this.magic == 101718065)) {
        throw new KaitaiStream.ValidationNotEqualError(101718065, this.magic, this._io, "/types/common_header/seq/0");
      }
      this.crc = this._io.readU4le();
      this.sequenceNumber = this._io.readU8le();
      this.lenFullNode = this._io.readU4le();
      this.nodeType = this._io.readU1();
      this.groupType = this._io.readU1();
      this.padding = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.padding, new Uint8Array([0, 0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0, 0]), this.padding, this._io, "/types/common_header/seq/6");
      }
    }

    /**
     * UBIFS node magic number (`UBIFS_NODE_MAGIC`)
     */

    /**
     * CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
     * starting at offset 8). It is computed with an initial register value
     * of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
     * CRC-32 (e.g.
     * [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
     * in Python).
     */

    /**
     * sequence number
     */

    /**
     * full node length
     */

    /**
     * node type
     */

    /**
     * node group type
     */

    /**
     * reserved for future, zeroes
     */

    return CommonHeader;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584|Git tag "v7.2"}
   */

  var DataHeader = Ubifs.DataHeader = (function() {
    function DataHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DataHeader.prototype._read = function() {
      this._raw_key = this._io.readBytes(16);
      var _io__raw_key = new KaitaiStream(this._raw_key);
      this.key = new Key(_io__raw_key, this, this._root);
      this.lenUncompressed = this._io.readU4le();
      if (!(this.lenUncompressed >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.lenUncompressed, this._io, "/types/data_header/seq/1");
      }
      if (!(this.lenUncompressed <= 4096)) {
        throw new KaitaiStream.ValidationGreaterThanError(4096, this.lenUncompressed, this._io, "/types/data_header/seq/1");
      }
      this.compression = this._io.readU2le();
      if (!Object.prototype.hasOwnProperty.call(Ubifs.Compression, this.compression)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.compression, this._io, "/types/data_header/seq/2");
      }
      this.lenCompressedData = this._io.readU2le();
      this.data = this._io.readBytesFull();
    }

    /**
     * node key
     */

    /**
     * uncompressed data size in bytes
     */

    /**
     * compression type (`compression::no_compression`, `compression::lzo`,
     * etc.)
     */

    /**
     * compressed data size in bytes, only valid when data is encrypted
     */

    /**
     * One block (up to 4096 bytes) of the file, block number `key.value`,
     * compressed as given by `compression`. Blocks missing from the index
     * are holes (zeros). In an encrypted inode, the compressed data is
     * padded
     * and [encrypted](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/crypto.c#L38-L59),
     * and `len_compressed_data` is the length of the compressed data
     * before padding.
     */

    return DataHeader;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565|Git tag "v7.2"}
   */

  var DirectoryHeader = Ubifs.DirectoryHeader = (function() {
    function DirectoryHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DirectoryHeader.prototype._read = function() {
      this._raw_key = this._io.readBytes(16);
      var _io__raw_key = new KaitaiStream(this._raw_key);
      this.key = new Key(_io__raw_key, this, this._root);
      var _ = this.key;
      if (!( ((_.type == Ubifs.KeyTypes.DIRECTORY) || (_.type == Ubifs.KeyTypes.EXTENDED_ATTRIBUTE)) )) {
        throw new KaitaiStream.ValidationExprError(this.key, this._io, "/types/directory_header/seq/0");
      }
      this.inodeNumber = this._io.readU8le();
      if (!(this.inodeNumber <= 4294967295)) {
        throw new KaitaiStream.ValidationGreaterThanError(4294967295, this.inodeNumber, this._io, "/types/directory_header/seq/1");
      }
      this.padding1 = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.padding1, new Uint8Array([0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0]), this.padding1, this._io, "/types/directory_header/seq/2");
      }
      this.inodeType = this._io.readU1();
      if (!Object.prototype.hasOwnProperty.call(Ubifs.InodeTypes, this.inodeType)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.inodeType, this._io, "/types/directory_header/seq/3");
      }
      this.lenName = this._io.readU2le();
      this.cookie = this._io.readU4le();
      this.name = this._io.readBytes(this.lenName);
      this.nameTerminator = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.nameTerminator, new Uint8Array([0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0]), this.nameTerminator, this._io, "/types/directory_header/seq/7");
      }
    }

    /**
     * node key
     */

    /**
     * target inode number
     */

    /**
     * reserved for future, zeroes
     */

    /**
     * type of the target inode (`inode_types::regular`,
     * `inode_types::directory`, etc.)
     */

    /**
     * name length
     */

    /**
     * A 32bits random number, used to construct a 64bits identifier.
     */

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

    /**
     * Zero byte after `name`, [not counted in
     * `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).
     */

    return DirectoryHeader;
  })();

  var Dummy = Ubifs.Dummy = (function() {
    function Dummy(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Dummy.prototype._read = function() {
    }

    return Dummy;
  })();

  var IndexBlock = Ubifs.IndexBlock = (function() {
    function IndexBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    IndexBlock.prototype._read = function() {
      this.header = new CommonHeader(this._io, this, this._root);
      var _ = this.header;
      if (!(_.nodeType == Ubifs.NodeTypes.INDEX)) {
        throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/index_block/seq/0");
      }
      this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
      var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
      this.nodeHeader = new IndexHeader(_io__raw_nodeHeader, this, this._root);
    }

    return IndexBlock;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831|Git tag "v7.2"}
   */

  var IndexHeader = Ubifs.IndexHeader = (function() {
    function IndexHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    IndexHeader.prototype._read = function() {
      this.numBranches = this._io.readU2le();
      this.level = this._io.readU2le();
      this.branches = [];
      for (var i = 0; i < this.numBranches; i++) {
        this.branches.push(new Branch(this._io, this, this._root));
      }
    }

    /**
     * number of child index nodes
     */

    /**
     * tree level
     */

    /**
     * LEB number / offset / length / key branches
     * 
     * All branches have the same size, which is 20 bytes (with the simple
     * key format) plus the hash length in an authenticated file system.
     * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/misc.h#L186-L205|Git tag "v7.2"}
     */

    return IndexHeader;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539|Git tag "v7.2"}
   */

  var InodeHeader = Ubifs.InodeHeader = (function() {
    function InodeHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    InodeHeader.prototype._read = function() {
      this._raw_key = this._io.readBytes(16);
      var _io__raw_key = new KaitaiStream(this._raw_key);
      this.key = new Key(_io__raw_key, this, this._root);
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
      if (!((KaitaiStream.byteArrayCompare(this.padding1, new Uint8Array([0, 0, 0, 0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0, 0, 0, 0]), this.padding1, this._io, "/types/inode_header/seq/17");
      }
      this.xattrNames = this._io.readU4le();
      this.compression = this._io.readU2le();
      if (!Object.prototype.hasOwnProperty.call(Ubifs.Compression, this.compression)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.compression, this._io, "/types/inode_header/seq/19");
      }
      this.padding2 = this._io.readBytes(26);
      this.data = this._io.readBytes(this.lenData);
    }

    /**
     * writes to the inode may only append data
     */
    Object.defineProperty(InodeHeader.prototype, 'append', {
      get: function() {
        if (this._m_append !== undefined)
          return this._m_append;
        this._m_append = (this.flags & 8) != 0;
        return this._m_append;
      }
    });

    /**
     * use compression for this inode
     */
    Object.defineProperty(InodeHeader.prototype, 'compressed', {
      get: function() {
        if (this._m_compressed !== undefined)
          return this._m_compressed;
        this._m_compressed = (this.flags & 1) != 0;
        return this._m_compressed;
      }
    });

    /**
     * I/O on this directory inode has to be synchronous
     */
    Object.defineProperty(InodeHeader.prototype, 'dirsync', {
      get: function() {
        if (this._m_dirsync !== undefined)
          return this._m_dirsync;
        this._m_dirsync = (this.flags & 16) != 0;
        return this._m_dirsync;
      }
    });

    /**
     * use encryption for this inode
     */
    Object.defineProperty(InodeHeader.prototype, 'encrypted', {
      get: function() {
        if (this._m_encrypted !== undefined)
          return this._m_encrypted;
        this._m_encrypted = (this.flags & 64) != 0;
        return this._m_encrypted;
      }
    });

    /**
     * inode is immutable
     */
    Object.defineProperty(InodeHeader.prototype, 'immutable', {
      get: function() {
        if (this._m_immutable !== undefined)
          return this._m_immutable;
        this._m_immutable = (this.flags & 4) != 0;
        return this._m_immutable;
      }
    });
    Object.defineProperty(InodeHeader.prototype, 'isBlockDevice', {
      get: function() {
        if (this._m_isBlockDevice !== undefined)
          return this._m_isBlockDevice;
        this._m_isBlockDevice = (this.mode & 61440) == 24576;
        return this._m_isBlockDevice;
      }
    });
    Object.defineProperty(InodeHeader.prototype, 'isCharacterDevice', {
      get: function() {
        if (this._m_isCharacterDevice !== undefined)
          return this._m_isCharacterDevice;
        this._m_isCharacterDevice = (this.mode & 61440) == 8192;
        return this._m_isCharacterDevice;
      }
    });
    Object.defineProperty(InodeHeader.prototype, 'isDir', {
      get: function() {
        if (this._m_isDir !== undefined)
          return this._m_isDir;
        this._m_isDir = (this.mode & 61440) == 16384;
        return this._m_isDir;
      }
    });
    Object.defineProperty(InodeHeader.prototype, 'isFifo', {
      get: function() {
        if (this._m_isFifo !== undefined)
          return this._m_isFifo;
        this._m_isFifo = (this.mode & 61440) == 4096;
        return this._m_isFifo;
      }
    });
    Object.defineProperty(InodeHeader.prototype, 'isLink', {
      get: function() {
        if (this._m_isLink !== undefined)
          return this._m_isLink;
        this._m_isLink = (this.mode & 61440) == 40960;
        return this._m_isLink;
      }
    });
    Object.defineProperty(InodeHeader.prototype, 'isRegular', {
      get: function() {
        if (this._m_isRegular !== undefined)
          return this._m_isRegular;
        this._m_isRegular = (this.mode & 61440) == 32768;
        return this._m_isRegular;
      }
    });
    Object.defineProperty(InodeHeader.prototype, 'isSocket', {
      get: function() {
        if (this._m_isSocket !== undefined)
          return this._m_isSocket;
        this._m_isSocket = (this.mode & 61440) == 49152;
        return this._m_isSocket;
      }
    });

    /**
     * I/O on this inode has to be synchronous
     */
    Object.defineProperty(InodeHeader.prototype, 'synchronous', {
      get: function() {
        if (this._m_synchronous !== undefined)
          return this._m_synchronous;
        this._m_synchronous = (this.flags & 2) != 0;
        return this._m_synchronous;
      }
    });

    /**
     * this inode is the inode for an extended attribute value
     */
    Object.defineProperty(InodeHeader.prototype, 'xattr', {
      get: function() {
        if (this._m_xattr !== undefined)
          return this._m_xattr;
        this._m_xattr = (this.flags & 32) != 0;
        return this._m_xattr;
      }
    });

    /**
     * node key
     */

    /**
     * sequence number at time of creation
     */

    /**
     * inode size in bytes (amount of uncompressed data)
     */

    /**
     * access time seconds
     */

    /**
     * status change time seconds
     */

    /**
     * modification time seconds
     */

    /**
     * access time nanoseconds
     */

    /**
     * status change time nanoseconds
     */

    /**
     * modification time nanoseconds
     */

    /**
     * number of hard links
     */

    /**
     * owner ID
     */

    /**
     * group ID
     */

    /**
     * file type and permissions, as in `st_mode` (see the `is_*`
     * instances for the file type)
     */

    /**
     * per-inode flags (see the instances `compressed`, `synchronous`,
     * etc.)
     */

    /**
     * inode data length
     */

    /**
     * count of extended attributes this inode has
     */

    /**
     * summarized size of all extended attributes in bytes
     */

    /**
     * sum of lengths of all extended attribute names belonging
     * to this inode
     */

    /**
     * compression type used for this inode
     */

    /**
     * reserved for future, zeroes
     */

    /**
     * Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
     * (encrypted if the inode is encrypted), device number of a device node
     * ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
     * 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
     * [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
     * (in its own inode, see `xattr`). Empty otherwise.
     */

    return InodeHeader;
  })();

  /**
   * Inode nodes (`inode_header`), directory and extended attribute entry
   * nodes (`directory_header`) and data nodes (`data_header`) store keys in a
   * 16-byte field (`UBIFS_MAX_KEY_LEN`). The simple key format, the only one
   * there is (see `<superblock_header>.key_fmt`), uses only the first 8
   * bytes, and Linux (v7.2)
   * [zeroes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L432-L440)
   * the rest. Branches of index nodes (`branch`)
   * [store only these 8 bytes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L448-L455).
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L16-L22|Git tag "v7.2"}
   */

  var Key = Ubifs.Key = (function() {
    function Key(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Key.prototype._read = function() {
      this.inodeNumber = this._io.readU4le();
      this.value = this._io.readBitsIntLe(29);
      this.type = this._io.readBitsIntLe(3);
      if (!Object.prototype.hasOwnProperty.call(Ubifs.KeyTypes, this.type)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/key/seq/2");
      }
      this._io.alignToByte();
      this.unused = this._io.readBytesFull();
    }

    /**
     * Number of the inode that the node belongs to: the parent directory
     * for a directory entry, the inode that the attribute belongs to for an
     * extended attribute entry.
     */

    /**
     * Block number for a data node, hash of the name (see
     * `<superblock_header>.key_hash`) for a directory or extended
     * attribute entry, 0 for an inode node.
     */

    /**
     * Type of the key, which matches the type of the node.
     */

    /**
     * Rest of the field holding the key: 8 zero bytes in `inode_header`,
     * `directory_header` and `data_header`, empty in `branch`.
     */

    return Key;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756|Git tag "v7.2"}
   */

  var MasterHeader = Ubifs.MasterHeader = (function() {
    function MasterHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MasterHeader.prototype._read = function() {
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

    /**
     * master node is dirty
     */
    Object.defineProperty(MasterHeader.prototype, 'dirty', {
      get: function() {
        if (this._m_dirty !== undefined)
          return this._m_dirty;
        this._m_dirty = (this.flags & 1) != 0;
        return this._m_dirty;
      }
    });

    /**
     * no orphan inodes present
     */
    Object.defineProperty(MasterHeader.prototype, 'noOrphans', {
      get: function() {
        if (this._m_noOrphans !== undefined)
          return this._m_noOrphans;
        this._m_noOrphans = (this.flags & 2) != 0;
        return this._m_noOrphans;
      }
    });

    /**
     * written by recovery
     */
    Object.defineProperty(MasterHeader.prototype, 'recovery', {
      get: function() {
        if (this._m_recovery !== undefined)
          return this._m_recovery;
        this._m_recovery = (this.flags & 4) != 0;
        return this._m_recovery;
      }
    });

    /**
     * highest inode number in the committed index
     */

    /**
     * commit number
     */

    /**
     * various flags (see the instances `dirty`, `no_orphans` and
     * `recovery`)
     */

    /**
     * start of the log
     */

    /**
     * LEB number of the root indexing node
     */

    /**
     * offset within the LEB `leb_root`
     */

    /**
     * root indexing node length
     */

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
     * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L214-L217|Git tag "v7.2"}
     */

    /**
     * LEB number of index head
     */

    /**
     * offset of index head
     */

    /**
     * size of index on flash
     */

    /**
     * total free space in bytes
     */

    /**
     * total dirty space in bytes
     */

    /**
     * total used space in bytes (includes only data LEBs)
     */

    /**
     * total dead space in bytes (includes only data LEBs)
     */

    /**
     * total dark space in bytes (includes only data LEBs)
     */

    /**
     * LEB number of LPT root nnode
     */

    /**
     * offset of LPT root nnode
     */

    /**
     * LEB number of LPT head
     */

    /**
     * offset of LPT head
     */

    /**
     * LEB number of LPT's own lprops table
     */

    /**
     * offset of LPT's own lprops table
     */

    /**
     * LEB number of LPT's save table. Present in every master node, but
     * only meaningful if `<superblock_header>.biglpt` is set: only then
     * does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
     */

    /**
     * offset of LPT's save table (only meaningful if
     * `<superblock_header>.biglpt` is set, see `leb_save_table`)
     */

    /**
     * LEB number of last LPT scan
     */

    /**
     * number of empty logical eraseblocks
     */

    /**
     * number of indexing logical eraseblocks
     */

    /**
     * count of LEBs used by file-system
     */

    /**
     * the hash of the root index node
     */

    /**
     * the hash of the LPT
     */

    /**
     * HMAC to authenticate the master node
     */

    /**
     * reserved for future, zeroes
     */

    return MasterHeader;
  })();

  var MasterblockNode = Ubifs.MasterblockNode = (function() {
    function MasterblockNode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MasterblockNode.prototype._read = function() {
      this.header = new CommonHeader(this._io, this, this._root);
      var _ = this.header;
      if (!(_.nodeType == Ubifs.NodeTypes.MASTER)) {
        throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/masterblock_node/seq/0");
      }
      this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
      var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
      this.nodeHeader = new MasterHeader(_io__raw_nodeHeader, this, this._root);
    }

    return MasterblockNode;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853|Git tag "v7.2"}
   */

  var OrphanHeader = Ubifs.OrphanHeader = (function() {
    function OrphanHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    OrphanHeader.prototype._read = function() {
      this.commitNumber = this._io.readU8le();
      this.inodeNumbers = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.inodeNumbers.push(this._io.readU8le());
        i++;
      }
    }

    /**
     * commit number (also top bit is set on the last node of the commit)
     */

    /**
     * inode numbers of orphans
     */

    return OrphanHeader;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615|Git tag "v7.2"}
   */

  var PaddingHeader = Ubifs.PaddingHeader = (function() {
    function PaddingHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PaddingHeader.prototype._read = function() {
      this.lenPadding = this._io.readU4le();
    }

    /**
     * how many bytes after this node are unused (because padded)
     */

    return PaddingHeader;
  })();

  /**
   * logical eraseblock reference node.
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772|Git tag "v7.2"}
   */

  var ReferenceHeader = Ubifs.ReferenceHeader = (function() {
    function ReferenceHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ReferenceHeader.prototype._read = function() {
      this.lebNumber = this._io.readU4le();
      this.ofsLeb = this._io.readU4le();
      this.journalHeadNumber = this._io.readU4le();
      this.padding = this._io.readBytes(28);
    }

    /**
     * the referred logical eraseblock number
     */

    /**
     * start offset in the referred LEB
     */

    /**
     * journal head number
     */

    /**
     * reserved for future, zeroes
     */

    return ReferenceHeader;
  })();

  /**
   * Signature of the superblock node of a file system signed when it was
   * created (`mkfs.ubifs` with a key). Linux
   * [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
   * as the first node after the superblock node in LEB0.
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799|Git tag "v7.2"}
   */

  var SignatureHeader = Ubifs.SignatureHeader = (function() {
    function SignatureHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SignatureHeader.prototype._read = function() {
      this.type = this._io.readU4le();
      if (!(this.type == 1)) {
        throw new KaitaiStream.ValidationNotEqualError(1, this.type, this._io, "/types/signature_header/seq/0");
      }
      this.lenSignature = this._io.readU4le();
      this.padding = this._io.readBytes(32);
      this.signature = this._io.readBytes(this.lenSignature);
    }

    /**
     * type of the signature
     */

    /**
     * length of `signature` in bytes
     */

    /**
     * reserved for future, zeroes
     */

    /**
     * [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
     * of the whole superblock node (4096 bytes, including the common
     * header)
     */

    return SignatureHeader;
  })();

  /**
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683|Git tag "v7.2"}
   */

  var SuperblockHeader = Ubifs.SuperblockHeader = (function() {
    function SuperblockHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SuperblockHeader.prototype._read = function() {
      this.padding0 = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.padding0, new Uint8Array([0, 0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0, 0]), this.padding0, this._io, "/types/superblock_header/seq/0");
      }
      this.keyHash = this._io.readU1();
      if (!Object.prototype.hasOwnProperty.call(Ubifs.Hashes, this.keyHash)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.keyHash, this._io, "/types/superblock_header/seq/1");
      }
      this.keyFmt = this._io.readU1();
      if (!(this.keyFmt == Ubifs.KeyFormats.SIMPLE)) {
        throw new KaitaiStream.ValidationNotEqualError(Ubifs.KeyFormats.SIMPLE, this.keyFmt, this._io, "/types/superblock_header/seq/2");
      }
      this.flags = this._io.readU4le();
      this.minIoSize = this._io.readU4le();
      this.lebSize = this._io.readU4le();
      this.numLebs = this._io.readU4le();
      this.maxNumLebs = this._io.readU4le();
      if (!(this.maxNumLebs >= this.numLebs)) {
        throw new KaitaiStream.ValidationLessThanError(this.numLebs, this.maxNumLebs, this._io, "/types/superblock_header/seq/7");
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
      this.defaultCompression = this._io.readU2le();
      if (!Object.prototype.hasOwnProperty.call(Ubifs.Compression, this.defaultCompression)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.defaultCompression, this._io, "/types/superblock_header/seq/16");
      }
      this.padding1 = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.padding1, new Uint8Array([0, 0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0, 0]), this.padding1, this._io, "/types/superblock_header/seq/17");
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
      if (this.authenticated) {
        this.hashAlgo = this._io.readU2le();
        if (!Object.prototype.hasOwnProperty.call(Ubifs.HashAlgos, this.hashAlgo)) {
          throw new KaitaiStream.ValidationNotInEnumError(this.hashAlgo, this._io, "/types/superblock_header/seq/26");
        }
      }
      if (!(this.authenticated)) {
        this.hashAlgoUnused = this._io.readU2le();
      }
      this.hashMst = this._io.readBytes(64);
      this.padding2 = this._io.readBytes(3774);
    }

    /**
     * this filesystem contains hashes for authentication
     */
    Object.defineProperty(SuperblockHeader.prototype, 'authenticated', {
      get: function() {
        if (this._m_authenticated !== undefined)
          return this._m_authenticated;
        this._m_authenticated = (this.flags & 32) != 0;
        return this._m_authenticated;
      }
    });

    /**
     * if "big" LPT model is used if set
     */
    Object.defineProperty(SuperblockHeader.prototype, 'biglpt', {
      get: function() {
        if (this._m_biglpt !== undefined)
          return this._m_biglpt;
        this._m_biglpt = (this.flags & 2) != 0;
        return this._m_biglpt;
      }
    });

    /**
     * store a 32bit cookie in directory entry nodes to
     * support 64bit cookies for lookups by hash
     */
    Object.defineProperty(SuperblockHeader.prototype, 'doubleHash', {
      get: function() {
        if (this._m_doubleHash !== undefined)
          return this._m_doubleHash;
        this._m_doubleHash = (this.flags & 8) != 0;
        return this._m_doubleHash;
      }
    });

    /**
     * filesystem contains encrypted files
     */
    Object.defineProperty(SuperblockHeader.prototype, 'encrypted', {
      get: function() {
        if (this._m_encrypted !== undefined)
          return this._m_encrypted;
        this._m_encrypted = (this.flags & 16) != 0;
        return this._m_encrypted;
      }
    });

    /**
     * Length in bytes of the hash of a node (`c->hash_len` in Linux), e.g.
     * in each branch of an index node. In an authenticated file system, it
     * is determined by `hash_algo`. Otherwise, it is 0.
     */
    Object.defineProperty(SuperblockHeader.prototype, 'lenHash', {
      get: function() {
        if (this._m_lenHash !== undefined)
          return this._m_lenHash;
        this._m_lenHash = (!(this.authenticated) ? 0 : ( ((this.hashAlgo == Ubifs.HashAlgos.MD4) || (this.hashAlgo == Ubifs.HashAlgos.MD5) || (this.hashAlgo == Ubifs.HashAlgos.RIPE_MD_128) || (this.hashAlgo == Ubifs.HashAlgos.TGR_128))  ? 16 : ( ((this.hashAlgo == Ubifs.HashAlgos.SHA1) || (this.hashAlgo == Ubifs.HashAlgos.RIPE_MD_160) || (this.hashAlgo == Ubifs.HashAlgos.TGR_160))  ? 20 : (this.hashAlgo == Ubifs.HashAlgos.TGR_192 ? 24 : (this.hashAlgo == Ubifs.HashAlgos.SHA224 ? 28 : ( ((this.hashAlgo == Ubifs.HashAlgos.SHA256) || (this.hashAlgo == Ubifs.HashAlgos.RIPE_MD_256) || (this.hashAlgo == Ubifs.HashAlgos.WP_256) || (this.hashAlgo == Ubifs.HashAlgos.SM3_256) || (this.hashAlgo == Ubifs.HashAlgos.STREEBOG_256) || (this.hashAlgo == Ubifs.HashAlgos.SHA3_256))  ? 32 : (this.hashAlgo == Ubifs.HashAlgos.RIPE_MD_320 ? 40 : ( ((this.hashAlgo == Ubifs.HashAlgos.SHA384) || (this.hashAlgo == Ubifs.HashAlgos.WP_384) || (this.hashAlgo == Ubifs.HashAlgos.SHA3_384))  ? 48 : ( ((this.hashAlgo == Ubifs.HashAlgos.SHA512) || (this.hashAlgo == Ubifs.HashAlgos.WP_512) || (this.hashAlgo == Ubifs.HashAlgos.STREEBOG_512) || (this.hashAlgo == Ubifs.HashAlgos.SHA3_512))  ? 64 : -1)))))))));
        return this._m_lenHash;
      }
    });

    /**
     * first-mount "fixup" of free space within LEBs needed
     */
    Object.defineProperty(SuperblockHeader.prototype, 'spaceFixup', {
      get: function() {
        if (this._m_spaceFixup !== undefined)
          return this._m_spaceFixup;
        this._m_spaceFixup = (this.flags & 4) != 0;
        return this._m_spaceFixup;
      }
    });

    /**
     * reserved for future, zeroes
     */

    /**
     * type of hash function used in keys
     */

    /**
     * format of the key
     */

    /**
     * file-system flags (see the instances `biglpt`, `space_fixup`, etc.)
     */

    /**
     * minimal input/output unit size
     */

    /**
     * logical eraseblock size in bytes
     */

    /**
     * count of LEBs used by file-system
     */

    /**
     * maximum count of LEBs used by file-system
     */

    /**
     * maximum amount of data stored in buds
     */

    /**
     * log size in logical eraseblocks
     */

    /**
     * number of LEBs used for lprops table
     */

    /**
     * number of LEBs used for recording orphans
     */

    /**
     * count of journal heads
     */

    /**
     * tree fanout (max. number of links per indexing node)
     */

    /**
     * number of LEB numbers in LPT's save table
     */

    /**
     * UBIFS on-flash format version
     */

    /**
     * default compression algorithm (`compression::lzo`, etc.)
     */

    /**
     * reserved for future, zeroes
     */

    /**
     * reserve pool UID
     */

    /**
     * reserve pool GID
     */

    /**
     * size of the reserved pool in bytes
     */

    /**
     * time granularity in nanoseconds
     */

    /**
     * UUID generated when the file system image was created
     */

    /**
     * UBIFS R/O compatibility version
     */

    /**
     * HMAC to authenticate the superblock node
     */

    /**
     * HMAC of a well known message (the string "UBIFS") as a convenience
     * to the user to check if the correct key is passed
     */

    /**
     * The hash algo used for this filesystem
     * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L549-L573|Git tag "v7.2"}
     */

    /**
     * Unused field (would only be meaningful in an authenticated file
     * system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
     * writes it as 0.
     * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L183-L191|Git tag "v7.2"}
     */

    /**
     * hash of the master node, only valid for signed images in which the
     * master node does not contain a hmac
     */

    /**
     * reserved for future, zeroes
     */

    return SuperblockHeader;
  })();

  var SuperblockNode = Ubifs.SuperblockNode = (function() {
    function SuperblockNode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SuperblockNode.prototype._read = function() {
      this.header = new CommonHeader(this._io, this, this._root);
      var _ = this.header;
      if (!(_.nodeType == Ubifs.NodeTypes.SUPERBLOCK)) {
        throw new KaitaiStream.ValidationExprError(this.header, this._io, "/types/superblock_node/seq/0");
      }
      this._raw_nodeHeader = this._io.readBytes(this.header.lenFullNode - 24);
      var _io__raw_nodeHeader = new KaitaiStream(this._raw_nodeHeader);
      this.nodeHeader = new SuperblockHeader(_io__raw_nodeHeader, this, this._root);
    }

    return SuperblockNode;
  })();

  /**
   * This node exists only in the journal and never goes to the main area.
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604|Git tag "v7.2"}
   */

  var TruncationHeader = Ubifs.TruncationHeader = (function() {
    function TruncationHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TruncationHeader.prototype._read = function() {
      this.inodeNumber = this._io.readU4le();
      this.padding = this._io.readBytes(12);
      this.oldSize = this._io.readU8le();
      if (!(this.oldSize >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.oldSize, this._io, "/types/truncation_header/seq/2");
      }
      this.newSize = this._io.readU8le();
      if (!(this.newSize <= this.oldSize - 1)) {
        throw new KaitaiStream.ValidationGreaterThanError(this.oldSize - 1, this.newSize, this._io, "/types/truncation_header/seq/3");
      }
    }

    /**
     * truncated inode number
     */

    /**
     * reserved for future, zeroes
     */

    /**
     * size before truncation
     */

    /**
     * size after truncation
     */

    return TruncationHeader;
  })();

  /**
   * The LEB containing the root index node, as given by `leb_root` in
   * `master_1`.
   * 
   * This instance only provides the substream for `index_root`, which can then
   * use `ofs_root` (an offset within the LEB) as its `pos` directly.
   */
  Object.defineProperty(Ubifs.prototype, 'index', {
    get: function() {
      if (this._m_index !== undefined)
        return this._m_index;
      var _pos = this._io.pos;
      this._io.seek(this.superblock.nodeHeader.lebSize * this.master1.nodeHeader.lebRoot);
      this._raw__m_index = this._io.readBytes(this.superblock.nodeHeader.lebSize);
      var _io__raw__m_index = new KaitaiStream(this._raw__m_index);
      this._m_index = new Dummy(_io__raw__m_index, this, this._root);
      this._io.seek(_pos);
      return this._m_index;
    }
  });

  /**
   * The root index node, in the `index` LEB at the offset given by
   * `ofs_root` in `master_1`. All other index nodes, and through them all
   * the files, are reached from it by recursively following the `target` of
   * each of the `branches`.
   */
  Object.defineProperty(Ubifs.prototype, 'indexRoot', {
    get: function() {
      if (this._m_indexRoot !== undefined)
        return this._m_indexRoot;
      var io = this.index._io;
      var _pos = io.pos;
      io.seek(this.master1.nodeHeader.ofsRoot);
      this._m_indexRoot = new IndexBlock(io, this, this._root);
      var _ = this._m_indexRoot;
      if (!(_.header.lenFullNode == this.master1.nodeHeader.lenRoot)) {
        throw new KaitaiStream.ValidationExprError(this._m_indexRoot, this._io, "/instances/index_root");
      }
      io.seek(_pos);
      return this._m_indexRoot;
    }
  });

  /**
   * All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
   * at offset `n * <superblock_header>.leb_size`.
   * 
   * Accessing this instance reads the whole image into memory. To get a
   * single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
   * at the offset of that LEB.
   */
  Object.defineProperty(Ubifs.prototype, 'lebs', {
    get: function() {
      if (this._m_lebs !== undefined)
        return this._m_lebs;
      var _pos = this._io.pos;
      this._io.seek(0);
      this._m_lebs = [];
      for (var i = 0; i < this.superblock.nodeHeader.numLebs; i++) {
        this._m_lebs.push(this._io.readBytes(this.superblock.nodeHeader.lebSize));
      }
      this._io.seek(_pos);
      return this._m_lebs;
    }
  });

  /**
   * Length of the file system image in bytes:
   * `<superblock_header>.num_lebs` LEBs of `<superblock_header>.leb_size`
   * bytes each. Use it to find where the image ends and to detect a
   * truncated image (see the top-level `doc`).
   */
  Object.defineProperty(Ubifs.prototype, 'lenImage', {
    get: function() {
      if (this._m_lenImage !== undefined)
        return this._m_lenImage;
      this._m_lenImage = this.superblock.nodeHeader.lebSize * this.superblock.nodeHeader.numLebs;
      return this._m_lenImage;
    }
  });

  /**
   * The first copy of the master node in LEB1. This Kaitai Struct
   * implementation uses it to locate `index_root`. In an image created by
   * `mkfs.ubifs`, it is the only copy in LEB1.
   * @see {@link https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633|Git tag "v2.3.1"}
   */
  Object.defineProperty(Ubifs.prototype, 'master1', {
    get: function() {
      if (this._m_master1 !== undefined)
        return this._m_master1;
      var _pos = this._io.pos;
      this._io.seek(this.superblock.nodeHeader.lebSize);
      this._raw__m_master1 = this._io.readBytes(this.superblock.nodeHeader.lebSize);
      var _io__raw__m_master1 = new KaitaiStream(this._raw__m_master1);
      this._m_master1 = new MasterblockNode(_io__raw__m_master1, this, this._root);
      this._io.seek(_pos);
      return this._m_master1;
    }
  });

  /**
   * The first copy of the master node in LEB2. In an image created by
   * `mkfs.ubifs`, it is the same as `master_1` except for the sequence
   * number and CRC in the common header. Linux keeps the master node in both
   * LEB1 and LEB2 for redundancy, and when mounting, it checks that the
   * copies in both match.
   * @see {@link https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633|Git tag "v2.3.1"}
   * @see {@link https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L115-L130|Git tag "v7.2"}
   */
  Object.defineProperty(Ubifs.prototype, 'master2', {
    get: function() {
      if (this._m_master2 !== undefined)
        return this._m_master2;
      var _pos = this._io.pos;
      this._io.seek(this.superblock.nodeHeader.lebSize * 2);
      this._raw__m_master2 = this._io.readBytes(this.superblock.nodeHeader.lebSize);
      var _io__raw__m_master2 = new KaitaiStream(this._raw__m_master2);
      this._m_master2 = new MasterblockNode(_io__raw__m_master2, this, this._root);
      this._io.seek(_pos);
      return this._m_master2;
    }
  });

  /**
   * The superblock node will always be at the start of
   * the first LEB.
   */
  Object.defineProperty(Ubifs.prototype, 'superblock', {
    get: function() {
      if (this._m_superblock !== undefined)
        return this._m_superblock;
      var _pos = this._io.pos;
      this._io.seek(0);
      this._m_superblock = new SuperblockNode(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_superblock;
    }
  });

  return Ubifs;
})();
Ubifs_.Ubifs = Ubifs;
});
