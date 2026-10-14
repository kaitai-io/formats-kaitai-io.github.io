<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

namespace {
    class Ubifs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_index;

        /**
         * The LEB containing the root index node, as given by `leb_root` in
         * `master_1`.
         * 
         * This instance only provides the substream for `index_root`, which can then
         * use `ofs_root` (an offset within the LEB) as its `pos` directly.
         */
        public function index() {
            if ($this->_m_index !== null)
                return $this->_m_index;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->superblock()->nodeHeader()->lebSize() * $this->master1()->nodeHeader()->lebRoot());
            $this->_m__raw_index = $this->_io->readBytes($this->superblock()->nodeHeader()->lebSize());
            $_io__raw_index = new \Kaitai\Struct\Stream($this->_m__raw_index);
            $this->_m_index = new \Ubifs\Dummy($_io__raw_index, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_index;
        }
        protected $_m_indexRoot;

        /**
         * The root index node, in the `index` LEB at the offset given by
         * `ofs_root` in `master_1`. All other index nodes, and through them all
         * the files, are reached from it by recursively following the `target` of
         * each of the `branches`.
         */
        public function indexRoot() {
            if ($this->_m_indexRoot !== null)
                return $this->_m_indexRoot;
            $io = $this->index()->_io();
            $_pos = $io->pos();
            $io->seek($this->master1()->nodeHeader()->ofsRoot());
            $this->_m_indexRoot = new \Ubifs\IndexBlock($io, $this, $this->_root);
            $_ = $this->_m_indexRoot;
            if (!($_->header()->lenFullNode() == $this->master1()->nodeHeader()->lenRoot())) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_indexRoot, $this->_io, "/instances/index_root");
            }
            $io->seek($_pos);
            return $this->_m_indexRoot;
        }
        protected $_m_lebs;

        /**
         * All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
         * at offset `n * <superblock_header>.leb_size`.
         * 
         * Accessing this instance reads the whole image into memory. To get a
         * single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
         * at the offset of that LEB.
         */
        public function lebs() {
            if ($this->_m_lebs !== null)
                return $this->_m_lebs;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_lebs = [];
            $n = $this->superblock()->nodeHeader()->numLebs();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_lebs[] = $this->_io->readBytes($this->superblock()->nodeHeader()->lebSize());
            }
            $this->_io->seek($_pos);
            return $this->_m_lebs;
        }
        protected $_m_lenImage;

        /**
         * Length of the file system image in bytes:
         * `<superblock_header>.num_lebs` LEBs of `<superblock_header>.leb_size`
         * bytes each. Use it to find where the image ends and to detect a
         * truncated image (see the top-level `doc`).
         */
        public function lenImage() {
            if ($this->_m_lenImage !== null)
                return $this->_m_lenImage;
            $this->_m_lenImage = $this->superblock()->nodeHeader()->lebSize() * $this->superblock()->nodeHeader()->numLebs();
            return $this->_m_lenImage;
        }
        protected $_m_master1;

        /**
         * The first copy of the master node in LEB1. This Kaitai Struct
         * implementation uses it to locate `index_root`. In an image created by
         * `mkfs.ubifs`, it is the only copy in LEB1.
         */
        public function master1() {
            if ($this->_m_master1 !== null)
                return $this->_m_master1;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->superblock()->nodeHeader()->lebSize());
            $this->_m__raw_master1 = $this->_io->readBytes($this->superblock()->nodeHeader()->lebSize());
            $_io__raw_master1 = new \Kaitai\Struct\Stream($this->_m__raw_master1);
            $this->_m_master1 = new \Ubifs\MasterblockNode($_io__raw_master1, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_master1;
        }
        protected $_m_master2;

        /**
         * The first copy of the master node in LEB2. In an image created by
         * `mkfs.ubifs`, it is the same as `master_1` except for the sequence
         * number and CRC in the common header. Linux keeps the master node in both
         * LEB1 and LEB2 for redundancy, and when mounting, it checks that the
         * copies in both match.
         */
        public function master2() {
            if ($this->_m_master2 !== null)
                return $this->_m_master2;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->superblock()->nodeHeader()->lebSize() * 2);
            $this->_m__raw_master2 = $this->_io->readBytes($this->superblock()->nodeHeader()->lebSize());
            $_io__raw_master2 = new \Kaitai\Struct\Stream($this->_m__raw_master2);
            $this->_m_master2 = new \Ubifs\MasterblockNode($_io__raw_master2, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_master2;
        }
        protected $_m_superblock;

        /**
         * The superblock node will always be at the start of
         * the first LEB.
         */
        public function superblock() {
            if ($this->_m_superblock !== null)
                return $this->_m_superblock;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_superblock = new \Ubifs\SuperblockNode($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_superblock;
        }
        protected $_m__raw_index;
        protected $_m__raw_master1;
        protected $_m__raw_master2;
        public function _raw_index() { return $this->_m__raw_index; }
        public function _raw_master1() { return $this->_m__raw_master1; }
        public function _raw_master2() { return $this->_m__raw_master2; }
    }
}

namespace Ubifs {
    class AuthenticationHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_hmac = $this->_io->readBytes($this->_root()->superblock()->nodeHeader()->lenHash());
        }
        protected $_m_hmac;

        /**
         * HMAC authenticating the journal before this node, keyed with the
         * file system's authentication key (which is not stored on flash).
         * The kernel [uses](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L275-L276)
         * HMAC with the hash algorithm in `<superblock_header>.hash_algo`
         * ([checked when mounting](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L575-L580)),
         * so `hmac` is as long as its digest, e.g. 32 bytes for SHA-256.
         */
        public function hmac() { return $this->_m_hmac; }
    }
}

namespace Ubifs {
    class Block extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Branch $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Ubifs\CommonHeader($this->_io, $this, $this->_root);
            switch ($this->header()->nodeType()) {
                case \Ubifs\NodeTypes::AUTHENTICATION:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\AuthenticationHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::COMMIT_START:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\CommitStartHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::DATA:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\DataHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::DIRECTORY:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\DirectoryHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::EXTENDED_ATTRIBUTE:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\DirectoryHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::INDEX:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\IndexHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::INODE:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\InodeHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::MASTER:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\MasterHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::ORPHAN:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\OrphanHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::PADDING:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\PaddingHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::REFERENCE:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\ReferenceHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::SIGNATURE:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\SignatureHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::SUPERBLOCK:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\SuperblockHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                case \Ubifs\NodeTypes::TRUNCATION:
                    $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
                    $this->_m_nodeHeader = new \Ubifs\TruncationHeader($_io__raw_nodeHeader, $this, $this->_root);
                    break;
                default:
                    $this->_m_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
                    break;
            }
        }
        protected $_m_header;
        protected $_m_nodeHeader;
        protected $_m__raw_nodeHeader;
        public function header() { return $this->_m_header; }
        public function nodeHeader() { return $this->_m_nodeHeader; }
        public function _raw_nodeHeader() { return $this->_m__raw_nodeHeader; }
    }
}

namespace Ubifs {
    class Branch extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\IndexHeader $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_targetLeb = $this->_io->readU4le();
            $this->_m_ofsTarget = $this->_io->readU4le();
            $this->_m_lenTarget = $this->_io->readU4le();
            $this->_m__raw_key = $this->_io->readBytes(8);
            $_io__raw_key = new \Kaitai\Struct\Stream($this->_m__raw_key);
            $this->_m_key = new \Ubifs\Key($_io__raw_key, $this, $this->_root);
            $this->_m_hash = $this->_io->readBytes($this->_root()->superblock()->nodeHeader()->lenHash());
        }
        protected $_m_target;
        public function target() {
            if ($this->_m_target !== null)
                return $this->_m_target;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->_root()->superblock()->nodeHeader()->lebSize() * $this->targetLeb() + $this->ofsTarget());
            $this->_m__raw_target = $io->readBytes($this->lenTarget());
            $_io__raw_target = new \Kaitai\Struct\Stream($this->_m__raw_target);
            $this->_m_target = new \Ubifs\Block($_io__raw_target, $this, $this->_root);
            $_ = $this->_m_target;
            if (!( (($_->header()->lenFullNode() == $this->lenTarget()) && (($this->_parent()->level() != 0 ? $_->header()->nodeType() == \Ubifs\NodeTypes::INDEX : $_->header()->nodeType() == $this->key()->type()))) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_target, $this->_io, "/types/branch/instances/target");
            }
            $io->seek($_pos);
            return $this->_m_target;
        }
        protected $_m_targetLeb;
        protected $_m_ofsTarget;
        protected $_m_lenTarget;
        protected $_m_key;
        protected $_m_hash;
        protected $_m__raw_key;
        protected $_m__raw_target;

        /**
         * LEB number of the target node
         */
        public function targetLeb() { return $this->_m_targetLeb; }

        /**
         * offset within the LEB `target_leb`
         */
        public function ofsTarget() { return $this->_m_ofsTarget; }

        /**
         * target node length
         */
        public function lenTarget() { return $this->_m_lenTarget; }
        public function key() { return $this->_m_key; }

        /**
         * Hash of the target node. It is empty in a file system without
         * authentication (see `<superblock_header>.len_hash`).
         */
        public function hash() { return $this->_m_hash; }
        public function _raw_key() { return $this->_m__raw_key; }
        public function _raw_target() { return $this->_m__raw_target; }
    }
}

namespace Ubifs {
    class CommitStartHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_commitNumber = $this->_io->readU8le();
        }
        protected $_m_commitNumber;

        /**
         * commit number
         */
        public function commitNumber() { return $this->_m_commitNumber; }
    }
}

namespace Ubifs {
    class CommonHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readU4le();
            if (!($this->_m_magic == 101718065)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(101718065, $this->_m_magic, $this->_io, "/types/common_header/seq/0");
            }
            $this->_m_crc = $this->_io->readU4le();
            $this->_m_sequenceNumber = $this->_io->readU8le();
            $this->_m_lenFullNode = $this->_io->readU4le();
            $this->_m_nodeType = $this->_io->readU1();
            $this->_m_groupType = $this->_io->readU1();
            $this->_m_padding = $this->_io->readBytes(2);
            if (!($this->_m_padding == "\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00", $this->_m_padding, $this->_io, "/types/common_header/seq/6");
            }
        }
        protected $_m_magic;
        protected $_m_crc;
        protected $_m_sequenceNumber;
        protected $_m_lenFullNode;
        protected $_m_nodeType;
        protected $_m_groupType;
        protected $_m_padding;

        /**
         * UBIFS node magic number (`UBIFS_NODE_MAGIC`)
         */
        public function magic() { return $this->_m_magic; }

        /**
         * CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
         * starting at offset 8). It is computed with an initial register value
         * of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
         * CRC-32 (e.g.
         * [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
         * in Python).
         */
        public function crc() { return $this->_m_crc; }

        /**
         * sequence number
         */
        public function sequenceNumber() { return $this->_m_sequenceNumber; }

        /**
         * full node length
         */
        public function lenFullNode() { return $this->_m_lenFullNode; }

        /**
         * node type
         */
        public function nodeType() { return $this->_m_nodeType; }

        /**
         * node group type
         */
        public function groupType() { return $this->_m_groupType; }

        /**
         * reserved for future, zeroes
         */
        public function padding() { return $this->_m_padding; }
    }
}

namespace Ubifs {
    class DataHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_key = $this->_io->readBytes(16);
            $_io__raw_key = new \Kaitai\Struct\Stream($this->_m__raw_key);
            $this->_m_key = new \Ubifs\Key($_io__raw_key, $this, $this->_root);
            $this->_m_lenUncompressed = $this->_io->readU4le();
            if (!($this->_m_lenUncompressed >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_lenUncompressed, $this->_io, "/types/data_header/seq/1");
            }
            if (!($this->_m_lenUncompressed <= 4096)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(4096, $this->_m_lenUncompressed, $this->_io, "/types/data_header/seq/1");
            }
            $this->_m_compression = $this->_io->readU2le();
            if (!\Ubifs\Compression::isDefined($this->_m_compression)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_compression, $this->_io, "/types/data_header/seq/2");
            }
            $this->_m_lenCompressedData = $this->_io->readU2le();
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_key;
        protected $_m_lenUncompressed;
        protected $_m_compression;
        protected $_m_lenCompressedData;
        protected $_m_data;
        protected $_m__raw_key;

        /**
         * node key
         */
        public function key() { return $this->_m_key; }

        /**
         * uncompressed data size in bytes
         */
        public function lenUncompressed() { return $this->_m_lenUncompressed; }

        /**
         * compression type (`compression::no_compression`, `compression::lzo`,
         * etc.)
         */
        public function compression() { return $this->_m_compression; }

        /**
         * compressed data size in bytes, only valid when data is encrypted
         */
        public function lenCompressedData() { return $this->_m_lenCompressedData; }

        /**
         * One block (up to 4096 bytes) of the file, block number `key.value`,
         * compressed as given by `compression`. Blocks missing from the index
         * are holes (zeros). In an encrypted inode, the compressed data is
         * padded
         * and [encrypted](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/crypto.c#L38-L59),
         * and `len_compressed_data` is the length of the compressed data
         * before padding.
         */
        public function data() { return $this->_m_data; }
        public function _raw_key() { return $this->_m__raw_key; }
    }
}

namespace Ubifs {
    class DirectoryHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_key = $this->_io->readBytes(16);
            $_io__raw_key = new \Kaitai\Struct\Stream($this->_m__raw_key);
            $this->_m_key = new \Ubifs\Key($_io__raw_key, $this, $this->_root);
            $_ = $this->_m_key;
            if (!( (($_->type() == \Ubifs\KeyTypes::DIRECTORY) || ($_->type() == \Ubifs\KeyTypes::EXTENDED_ATTRIBUTE)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_key, $this->_io, "/types/directory_header/seq/0");
            }
            $this->_m_inodeNumber = $this->_io->readU8le();
            if (!($this->_m_inodeNumber <= 4294967295)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(4294967295, $this->_m_inodeNumber, $this->_io, "/types/directory_header/seq/1");
            }
            $this->_m_padding1 = $this->_io->readBytes(1);
            if (!($this->_m_padding1 == "\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->_m_padding1, $this->_io, "/types/directory_header/seq/2");
            }
            $this->_m_inodeType = $this->_io->readU1();
            if (!\Ubifs\InodeTypes::isDefined($this->_m_inodeType)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_inodeType, $this->_io, "/types/directory_header/seq/3");
            }
            $this->_m_lenName = $this->_io->readU2le();
            $this->_m_cookie = $this->_io->readU4le();
            $this->_m_name = $this->_io->readBytes($this->lenName());
            $this->_m_nameTerminator = $this->_io->readBytes(1);
            if (!($this->_m_nameTerminator == "\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->_m_nameTerminator, $this->_io, "/types/directory_header/seq/7");
            }
        }
        protected $_m_key;
        protected $_m_inodeNumber;
        protected $_m_padding1;
        protected $_m_inodeType;
        protected $_m_lenName;
        protected $_m_cookie;
        protected $_m_name;
        protected $_m_nameTerminator;
        protected $_m__raw_key;

        /**
         * node key
         */
        public function key() { return $this->_m_key; }

        /**
         * target inode number
         */
        public function inodeNumber() { return $this->_m_inodeNumber; }

        /**
         * reserved for future, zeroes
         */
        public function padding1() { return $this->_m_padding1; }

        /**
         * type of the target inode (`inode_types::regular`,
         * `inode_types::directory`, etc.)
         */
        public function inodeType() { return $this->_m_inodeType; }

        /**
         * name length
         */
        public function lenName() { return $this->_m_lenName; }

        /**
         * A 32bits random number, used to construct a 64bits identifier.
         */
        public function cookie() { return $this->_m_cookie; }

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
        public function name() { return $this->_m_name; }

        /**
         * Zero byte after `name`, [not counted in
         * `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).
         */
        public function nameTerminator() { return $this->_m_nameTerminator; }
        public function _raw_key() { return $this->_m__raw_key; }
    }
}

namespace Ubifs {
    class Dummy extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

namespace Ubifs {
    class IndexBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Ubifs\CommonHeader($this->_io, $this, $this->_root);
            $_ = $this->_m_header;
            if (!($_->nodeType() == \Ubifs\NodeTypes::INDEX)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_header, $this->_io, "/types/index_block/seq/0");
            }
            $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
            $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
            $this->_m_nodeHeader = new \Ubifs\IndexHeader($_io__raw_nodeHeader, $this, $this->_root);
        }
        protected $_m_header;
        protected $_m_nodeHeader;
        protected $_m__raw_nodeHeader;
        public function header() { return $this->_m_header; }
        public function nodeHeader() { return $this->_m_nodeHeader; }
        public function _raw_nodeHeader() { return $this->_m__raw_nodeHeader; }
    }
}

namespace Ubifs {
    class IndexHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numBranches = $this->_io->readU2le();
            $this->_m_level = $this->_io->readU2le();
            $this->_m_branches = [];
            $n = $this->numBranches();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_branches[] = new \Ubifs\Branch($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numBranches;
        protected $_m_level;
        protected $_m_branches;

        /**
         * number of child index nodes
         */
        public function numBranches() { return $this->_m_numBranches; }

        /**
         * tree level
         */
        public function level() { return $this->_m_level; }

        /**
         * LEB number / offset / length / key branches
         * 
         * All branches have the same size, which is 20 bytes (with the simple
         * key format) plus the hash length in an authenticated file system.
         */
        public function branches() { return $this->_m_branches; }
    }
}

namespace Ubifs {
    class InodeHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_key = $this->_io->readBytes(16);
            $_io__raw_key = new \Kaitai\Struct\Stream($this->_m__raw_key);
            $this->_m_key = new \Ubifs\Key($_io__raw_key, $this, $this->_root);
            $this->_m_creationSequenceNumber = $this->_io->readU8le();
            $this->_m_lenUncompressed = $this->_io->readU8le();
            $this->_m_atimeSec = $this->_io->readU8le();
            $this->_m_ctimeSec = $this->_io->readU8le();
            $this->_m_mtimeSec = $this->_io->readU8le();
            $this->_m_atimeNsec = $this->_io->readU4le();
            $this->_m_ctimeNsec = $this->_io->readU4le();
            $this->_m_mtimeNsec = $this->_io->readU4le();
            $this->_m_numLinks = $this->_io->readU4le();
            $this->_m_uid = $this->_io->readU4le();
            $this->_m_gid = $this->_io->readU4le();
            $this->_m_mode = $this->_io->readU4le();
            $this->_m_flags = $this->_io->readU4le();
            $this->_m_lenData = $this->_io->readU4le();
            $this->_m_numXattrs = $this->_io->readU4le();
            $this->_m_xattrSize = $this->_io->readU4le();
            $this->_m_padding1 = $this->_io->readBytes(4);
            if (!($this->_m_padding1 == "\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00", $this->_m_padding1, $this->_io, "/types/inode_header/seq/17");
            }
            $this->_m_xattrNames = $this->_io->readU4le();
            $this->_m_compression = $this->_io->readU2le();
            if (!\Ubifs\Compression::isDefined($this->_m_compression)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_compression, $this->_io, "/types/inode_header/seq/19");
            }
            $this->_m_padding2 = $this->_io->readBytes(26);
            $this->_m_data = $this->_io->readBytes($this->lenData());
        }
        protected $_m_append;

        /**
         * writes to the inode may only append data
         */
        public function append() {
            if ($this->_m_append !== null)
                return $this->_m_append;
            $this->_m_append = ($this->flags() & 8) != 0;
            return $this->_m_append;
        }
        protected $_m_compressed;

        /**
         * use compression for this inode
         */
        public function compressed() {
            if ($this->_m_compressed !== null)
                return $this->_m_compressed;
            $this->_m_compressed = ($this->flags() & 1) != 0;
            return $this->_m_compressed;
        }
        protected $_m_dirsync;

        /**
         * I/O on this directory inode has to be synchronous
         */
        public function dirsync() {
            if ($this->_m_dirsync !== null)
                return $this->_m_dirsync;
            $this->_m_dirsync = ($this->flags() & 16) != 0;
            return $this->_m_dirsync;
        }
        protected $_m_encrypted;

        /**
         * use encryption for this inode
         */
        public function encrypted() {
            if ($this->_m_encrypted !== null)
                return $this->_m_encrypted;
            $this->_m_encrypted = ($this->flags() & 64) != 0;
            return $this->_m_encrypted;
        }
        protected $_m_immutable;

        /**
         * inode is immutable
         */
        public function immutable() {
            if ($this->_m_immutable !== null)
                return $this->_m_immutable;
            $this->_m_immutable = ($this->flags() & 4) != 0;
            return $this->_m_immutable;
        }
        protected $_m_isBlockDevice;
        public function isBlockDevice() {
            if ($this->_m_isBlockDevice !== null)
                return $this->_m_isBlockDevice;
            $this->_m_isBlockDevice = ($this->mode() & 61440) == 24576;
            return $this->_m_isBlockDevice;
        }
        protected $_m_isCharacterDevice;
        public function isCharacterDevice() {
            if ($this->_m_isCharacterDevice !== null)
                return $this->_m_isCharacterDevice;
            $this->_m_isCharacterDevice = ($this->mode() & 61440) == 8192;
            return $this->_m_isCharacterDevice;
        }
        protected $_m_isDir;
        public function isDir() {
            if ($this->_m_isDir !== null)
                return $this->_m_isDir;
            $this->_m_isDir = ($this->mode() & 61440) == 16384;
            return $this->_m_isDir;
        }
        protected $_m_isFifo;
        public function isFifo() {
            if ($this->_m_isFifo !== null)
                return $this->_m_isFifo;
            $this->_m_isFifo = ($this->mode() & 61440) == 4096;
            return $this->_m_isFifo;
        }
        protected $_m_isLink;
        public function isLink() {
            if ($this->_m_isLink !== null)
                return $this->_m_isLink;
            $this->_m_isLink = ($this->mode() & 61440) == 40960;
            return $this->_m_isLink;
        }
        protected $_m_isRegular;
        public function isRegular() {
            if ($this->_m_isRegular !== null)
                return $this->_m_isRegular;
            $this->_m_isRegular = ($this->mode() & 61440) == 32768;
            return $this->_m_isRegular;
        }
        protected $_m_isSocket;
        public function isSocket() {
            if ($this->_m_isSocket !== null)
                return $this->_m_isSocket;
            $this->_m_isSocket = ($this->mode() & 61440) == 49152;
            return $this->_m_isSocket;
        }
        protected $_m_synchronous;

        /**
         * I/O on this inode has to be synchronous
         */
        public function synchronous() {
            if ($this->_m_synchronous !== null)
                return $this->_m_synchronous;
            $this->_m_synchronous = ($this->flags() & 2) != 0;
            return $this->_m_synchronous;
        }
        protected $_m_xattr;

        /**
         * this inode is the inode for an extended attribute value
         */
        public function xattr() {
            if ($this->_m_xattr !== null)
                return $this->_m_xattr;
            $this->_m_xattr = ($this->flags() & 32) != 0;
            return $this->_m_xattr;
        }
        protected $_m_key;
        protected $_m_creationSequenceNumber;
        protected $_m_lenUncompressed;
        protected $_m_atimeSec;
        protected $_m_ctimeSec;
        protected $_m_mtimeSec;
        protected $_m_atimeNsec;
        protected $_m_ctimeNsec;
        protected $_m_mtimeNsec;
        protected $_m_numLinks;
        protected $_m_uid;
        protected $_m_gid;
        protected $_m_mode;
        protected $_m_flags;
        protected $_m_lenData;
        protected $_m_numXattrs;
        protected $_m_xattrSize;
        protected $_m_padding1;
        protected $_m_xattrNames;
        protected $_m_compression;
        protected $_m_padding2;
        protected $_m_data;
        protected $_m__raw_key;

        /**
         * node key
         */
        public function key() { return $this->_m_key; }

        /**
         * sequence number at time of creation
         */
        public function creationSequenceNumber() { return $this->_m_creationSequenceNumber; }

        /**
         * inode size in bytes (amount of uncompressed data)
         */
        public function lenUncompressed() { return $this->_m_lenUncompressed; }

        /**
         * access time seconds
         */
        public function atimeSec() { return $this->_m_atimeSec; }

        /**
         * status change time seconds
         */
        public function ctimeSec() { return $this->_m_ctimeSec; }

        /**
         * modification time seconds
         */
        public function mtimeSec() { return $this->_m_mtimeSec; }

        /**
         * access time nanoseconds
         */
        public function atimeNsec() { return $this->_m_atimeNsec; }

        /**
         * status change time nanoseconds
         */
        public function ctimeNsec() { return $this->_m_ctimeNsec; }

        /**
         * modification time nanoseconds
         */
        public function mtimeNsec() { return $this->_m_mtimeNsec; }

        /**
         * number of hard links
         */
        public function numLinks() { return $this->_m_numLinks; }

        /**
         * owner ID
         */
        public function uid() { return $this->_m_uid; }

        /**
         * group ID
         */
        public function gid() { return $this->_m_gid; }

        /**
         * file type and permissions, as in `st_mode` (see the `is_*`
         * instances for the file type)
         */
        public function mode() { return $this->_m_mode; }

        /**
         * per-inode flags (see the instances `compressed`, `synchronous`,
         * etc.)
         */
        public function flags() { return $this->_m_flags; }

        /**
         * inode data length
         */
        public function lenData() { return $this->_m_lenData; }

        /**
         * count of extended attributes this inode has
         */
        public function numXattrs() { return $this->_m_numXattrs; }

        /**
         * summarized size of all extended attributes in bytes
         */
        public function xattrSize() { return $this->_m_xattrSize; }
        public function padding1() { return $this->_m_padding1; }

        /**
         * sum of lengths of all extended attribute names belonging
         * to this inode
         */
        public function xattrNames() { return $this->_m_xattrNames; }

        /**
         * compression type used for this inode
         */
        public function compression() { return $this->_m_compression; }

        /**
         * reserved for future, zeroes
         */
        public function padding2() { return $this->_m_padding2; }

        /**
         * Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
         * (encrypted if the inode is encrypted), device number of a device node
         * ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
         * 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
         * [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
         * (in its own inode, see `xattr`). Empty otherwise.
         */
        public function data() { return $this->_m_data; }
        public function _raw_key() { return $this->_m__raw_key; }
    }
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
 */

namespace Ubifs {
    class Key extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_inodeNumber = $this->_io->readU4le();
            $this->_m_value = $this->_io->readBitsIntLe(29);
            $this->_m_type = $this->_io->readBitsIntLe(3);
            if (!\Ubifs\KeyTypes::isDefined($this->_m_type)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_type, $this->_io, "/types/key/seq/2");
            }
            $this->_io->alignToByte();
            $this->_m_unused = $this->_io->readBytesFull();
        }
        protected $_m_inodeNumber;
        protected $_m_value;
        protected $_m_type;
        protected $_m_unused;

        /**
         * Number of the inode that the node belongs to: the parent directory
         * for a directory entry, the inode that the attribute belongs to for an
         * extended attribute entry.
         */
        public function inodeNumber() { return $this->_m_inodeNumber; }

        /**
         * Block number for a data node, hash of the name (see
         * `<superblock_header>.key_hash`) for a directory or extended
         * attribute entry, 0 for an inode node.
         */
        public function value() { return $this->_m_value; }

        /**
         * Type of the key, which matches the type of the node.
         */
        public function type() { return $this->_m_type; }

        /**
         * Rest of the field holding the key: 8 zero bytes in `inode_header`,
         * `directory_header` and `data_header`, empty in `branch`.
         */
        public function unused() { return $this->_m_unused; }
    }
}

namespace Ubifs {
    class MasterHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_highestInum = $this->_io->readU8le();
            $this->_m_commitNumber = $this->_io->readU8le();
            $this->_m_flags = $this->_io->readU4le();
            $this->_m_lebLog = $this->_io->readU4le();
            $this->_m_lebRoot = $this->_io->readU4le();
            $this->_m_ofsRoot = $this->_io->readU4le();
            $this->_m_lenRoot = $this->_io->readU4le();
            $this->_m_lebGarbageCollect = $this->_io->readU4le();
            $this->_m_lebIndexHead = $this->_io->readU4le();
            $this->_m_ofsIndexHead = $this->_io->readU4le();
            $this->_m_lenIndex = $this->_io->readU8le();
            $this->_m_totalFree = $this->_io->readU8le();
            $this->_m_totalDirty = $this->_io->readU8le();
            $this->_m_totalUsed = $this->_io->readU8le();
            $this->_m_totalDead = $this->_io->readU8le();
            $this->_m_totalDark = $this->_io->readU8le();
            $this->_m_lebLpt = $this->_io->readU4le();
            $this->_m_ofsLpt = $this->_io->readU4le();
            $this->_m_lebNhead = $this->_io->readU4le();
            $this->_m_ofsNhead = $this->_io->readU4le();
            $this->_m_lebLpropsTable = $this->_io->readU4le();
            $this->_m_ofsLpropsTable = $this->_io->readU4le();
            $this->_m_lebSaveTable = $this->_io->readU4le();
            $this->_m_ofsSaveTable = $this->_io->readU4le();
            $this->_m_lebLastLptScan = $this->_io->readU4le();
            $this->_m_numEmptyLebs = $this->_io->readU4le();
            $this->_m_numIndexLebs = $this->_io->readU4le();
            $this->_m_numLebs = $this->_io->readU4le();
            $this->_m_hashRootIndex = $this->_io->readBytes(64);
            $this->_m_hashLpt = $this->_io->readBytes(64);
            $this->_m_hmac = $this->_io->readBytes(64);
            $this->_m_padding = $this->_io->readBytes(152);
        }
        protected $_m_dirty;

        /**
         * master node is dirty
         */
        public function dirty() {
            if ($this->_m_dirty !== null)
                return $this->_m_dirty;
            $this->_m_dirty = ($this->flags() & 1) != 0;
            return $this->_m_dirty;
        }
        protected $_m_noOrphans;

        /**
         * no orphan inodes present
         */
        public function noOrphans() {
            if ($this->_m_noOrphans !== null)
                return $this->_m_noOrphans;
            $this->_m_noOrphans = ($this->flags() & 2) != 0;
            return $this->_m_noOrphans;
        }
        protected $_m_recovery;

        /**
         * written by recovery
         */
        public function recovery() {
            if ($this->_m_recovery !== null)
                return $this->_m_recovery;
            $this->_m_recovery = ($this->flags() & 4) != 0;
            return $this->_m_recovery;
        }
        protected $_m_highestInum;
        protected $_m_commitNumber;
        protected $_m_flags;
        protected $_m_lebLog;
        protected $_m_lebRoot;
        protected $_m_ofsRoot;
        protected $_m_lenRoot;
        protected $_m_lebGarbageCollect;
        protected $_m_lebIndexHead;
        protected $_m_ofsIndexHead;
        protected $_m_lenIndex;
        protected $_m_totalFree;
        protected $_m_totalDirty;
        protected $_m_totalUsed;
        protected $_m_totalDead;
        protected $_m_totalDark;
        protected $_m_lebLpt;
        protected $_m_ofsLpt;
        protected $_m_lebNhead;
        protected $_m_ofsNhead;
        protected $_m_lebLpropsTable;
        protected $_m_ofsLpropsTable;
        protected $_m_lebSaveTable;
        protected $_m_ofsSaveTable;
        protected $_m_lebLastLptScan;
        protected $_m_numEmptyLebs;
        protected $_m_numIndexLebs;
        protected $_m_numLebs;
        protected $_m_hashRootIndex;
        protected $_m_hashLpt;
        protected $_m_hmac;
        protected $_m_padding;

        /**
         * highest inode number in the committed index
         */
        public function highestInum() { return $this->_m_highestInum; }

        /**
         * commit number
         */
        public function commitNumber() { return $this->_m_commitNumber; }

        /**
         * various flags (see the instances `dirty`, `no_orphans` and
         * `recovery`)
         */
        public function flags() { return $this->_m_flags; }

        /**
         * start of the log
         */
        public function lebLog() { return $this->_m_lebLog; }

        /**
         * LEB number of the root indexing node
         */
        public function lebRoot() { return $this->_m_lebRoot; }

        /**
         * offset within the LEB `leb_root`
         */
        public function ofsRoot() { return $this->_m_ofsRoot; }

        /**
         * root indexing node length
         */
        public function lenRoot() { return $this->_m_lenRoot; }

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
         */
        public function lebGarbageCollect() { return $this->_m_lebGarbageCollect; }

        /**
         * LEB number of index head
         */
        public function lebIndexHead() { return $this->_m_lebIndexHead; }

        /**
         * offset of index head
         */
        public function ofsIndexHead() { return $this->_m_ofsIndexHead; }

        /**
         * size of index on flash
         */
        public function lenIndex() { return $this->_m_lenIndex; }

        /**
         * total free space in bytes
         */
        public function totalFree() { return $this->_m_totalFree; }

        /**
         * total dirty space in bytes
         */
        public function totalDirty() { return $this->_m_totalDirty; }

        /**
         * total used space in bytes (includes only data LEBs)
         */
        public function totalUsed() { return $this->_m_totalUsed; }

        /**
         * total dead space in bytes (includes only data LEBs)
         */
        public function totalDead() { return $this->_m_totalDead; }

        /**
         * total dark space in bytes (includes only data LEBs)
         */
        public function totalDark() { return $this->_m_totalDark; }

        /**
         * LEB number of LPT root nnode
         */
        public function lebLpt() { return $this->_m_lebLpt; }

        /**
         * offset of LPT root nnode
         */
        public function ofsLpt() { return $this->_m_ofsLpt; }

        /**
         * LEB number of LPT head
         */
        public function lebNhead() { return $this->_m_lebNhead; }

        /**
         * offset of LPT head
         */
        public function ofsNhead() { return $this->_m_ofsNhead; }

        /**
         * LEB number of LPT's own lprops table
         */
        public function lebLpropsTable() { return $this->_m_lebLpropsTable; }

        /**
         * offset of LPT's own lprops table
         */
        public function ofsLpropsTable() { return $this->_m_ofsLpropsTable; }

        /**
         * LEB number of LPT's save table. Present in every master node, but
         * only meaningful if `<superblock_header>.biglpt` is set: only then
         * does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
         */
        public function lebSaveTable() { return $this->_m_lebSaveTable; }

        /**
         * offset of LPT's save table (only meaningful if
         * `<superblock_header>.biglpt` is set, see `leb_save_table`)
         */
        public function ofsSaveTable() { return $this->_m_ofsSaveTable; }

        /**
         * LEB number of last LPT scan
         */
        public function lebLastLptScan() { return $this->_m_lebLastLptScan; }

        /**
         * number of empty logical eraseblocks
         */
        public function numEmptyLebs() { return $this->_m_numEmptyLebs; }

        /**
         * number of indexing logical eraseblocks
         */
        public function numIndexLebs() { return $this->_m_numIndexLebs; }

        /**
         * count of LEBs used by file-system
         */
        public function numLebs() { return $this->_m_numLebs; }

        /**
         * the hash of the root index node
         */
        public function hashRootIndex() { return $this->_m_hashRootIndex; }

        /**
         * the hash of the LPT
         */
        public function hashLpt() { return $this->_m_hashLpt; }

        /**
         * HMAC to authenticate the master node
         */
        public function hmac() { return $this->_m_hmac; }

        /**
         * reserved for future, zeroes
         */
        public function padding() { return $this->_m_padding; }
    }
}

namespace Ubifs {
    class MasterblockNode extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Ubifs\CommonHeader($this->_io, $this, $this->_root);
            $_ = $this->_m_header;
            if (!($_->nodeType() == \Ubifs\NodeTypes::MASTER)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_header, $this->_io, "/types/masterblock_node/seq/0");
            }
            $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
            $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
            $this->_m_nodeHeader = new \Ubifs\MasterHeader($_io__raw_nodeHeader, $this, $this->_root);
        }
        protected $_m_header;
        protected $_m_nodeHeader;
        protected $_m__raw_nodeHeader;
        public function header() { return $this->_m_header; }
        public function nodeHeader() { return $this->_m_nodeHeader; }
        public function _raw_nodeHeader() { return $this->_m__raw_nodeHeader; }
    }
}

namespace Ubifs {
    class OrphanHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_commitNumber = $this->_io->readU8le();
            $this->_m_inodeNumbers = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_inodeNumbers[] = $this->_io->readU8le();
                $i++;
            }
        }
        protected $_m_commitNumber;
        protected $_m_inodeNumbers;

        /**
         * commit number (also top bit is set on the last node of the commit)
         */
        public function commitNumber() { return $this->_m_commitNumber; }

        /**
         * inode numbers of orphans
         */
        public function inodeNumbers() { return $this->_m_inodeNumbers; }
    }
}

namespace Ubifs {
    class PaddingHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenPadding = $this->_io->readU4le();
        }
        protected $_m_lenPadding;

        /**
         * how many bytes after this node are unused (because padded)
         */
        public function lenPadding() { return $this->_m_lenPadding; }
    }
}

/**
 * logical eraseblock reference node.
 */

namespace Ubifs {
    class ReferenceHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lebNumber = $this->_io->readU4le();
            $this->_m_ofsLeb = $this->_io->readU4le();
            $this->_m_journalHeadNumber = $this->_io->readU4le();
            $this->_m_padding = $this->_io->readBytes(28);
        }
        protected $_m_lebNumber;
        protected $_m_ofsLeb;
        protected $_m_journalHeadNumber;
        protected $_m_padding;

        /**
         * the referred logical eraseblock number
         */
        public function lebNumber() { return $this->_m_lebNumber; }

        /**
         * start offset in the referred LEB
         */
        public function ofsLeb() { return $this->_m_ofsLeb; }

        /**
         * journal head number
         */
        public function journalHeadNumber() { return $this->_m_journalHeadNumber; }

        /**
         * reserved for future, zeroes
         */
        public function padding() { return $this->_m_padding; }
    }
}

/**
 * Signature of the superblock node of a file system signed when it was
 * created (`mkfs.ubifs` with a key). Linux
 * [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
 * as the first node after the superblock node in LEB0.
 */

namespace Ubifs {
    class SignatureHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU4le();
            if (!($this->_m_type == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_type, $this->_io, "/types/signature_header/seq/0");
            }
            $this->_m_lenSignature = $this->_io->readU4le();
            $this->_m_padding = $this->_io->readBytes(32);
            $this->_m_signature = $this->_io->readBytes($this->lenSignature());
        }
        protected $_m_type;
        protected $_m_lenSignature;
        protected $_m_padding;
        protected $_m_signature;

        /**
         * type of the signature
         */
        public function type() { return $this->_m_type; }

        /**
         * length of `signature` in bytes
         */
        public function lenSignature() { return $this->_m_lenSignature; }

        /**
         * reserved for future, zeroes
         */
        public function padding() { return $this->_m_padding; }

        /**
         * [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
         * of the whole superblock node (4096 bytes, including the common
         * header)
         */
        public function signature() { return $this->_m_signature; }
    }
}

namespace Ubifs {
    class SuperblockHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_padding0 = $this->_io->readBytes(2);
            if (!($this->_m_padding0 == "\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00", $this->_m_padding0, $this->_io, "/types/superblock_header/seq/0");
            }
            $this->_m_keyHash = $this->_io->readU1();
            if (!\Ubifs\Hashes::isDefined($this->_m_keyHash)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_keyHash, $this->_io, "/types/superblock_header/seq/1");
            }
            $this->_m_keyFmt = $this->_io->readU1();
            if (!($this->_m_keyFmt == \Ubifs\KeyFormats::SIMPLE)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(\Ubifs\KeyFormats::SIMPLE, $this->_m_keyFmt, $this->_io, "/types/superblock_header/seq/2");
            }
            $this->_m_flags = $this->_io->readU4le();
            $this->_m_minIoSize = $this->_io->readU4le();
            $this->_m_lebSize = $this->_io->readU4le();
            $this->_m_numLebs = $this->_io->readU4le();
            $this->_m_maxNumLebs = $this->_io->readU4le();
            if (!($this->_m_maxNumLebs >= $this->numLebs())) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError($this->numLebs(), $this->_m_maxNumLebs, $this->_io, "/types/superblock_header/seq/7");
            }
            $this->_m_maxBudBytes = $this->_io->readU8le();
            $this->_m_numLogLebs = $this->_io->readU4le();
            if (!($this->_m_numLogLebs >= 2)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(2, $this->_m_numLogLebs, $this->_io, "/types/superblock_header/seq/9");
            }
            $this->_m_numLptLebs = $this->_io->readU4le();
            if (!($this->_m_numLptLebs >= 2)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(2, $this->_m_numLptLebs, $this->_io, "/types/superblock_header/seq/10");
            }
            $this->_m_numOrphanLebs = $this->_io->readU4le();
            if (!($this->_m_numOrphanLebs >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_numOrphanLebs, $this->_io, "/types/superblock_header/seq/11");
            }
            $this->_m_numJournalHeads = $this->_io->readU4le();
            $this->_m_fanout = $this->_io->readU4le();
            $this->_m_numSaveTableEntries = $this->_io->readU4le();
            $this->_m_fmtVersion = $this->_io->readU4le();
            if (!($this->_m_fmtVersion >= 4)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(4, $this->_m_fmtVersion, $this->_io, "/types/superblock_header/seq/15");
            }
            $this->_m_defaultCompression = $this->_io->readU2le();
            if (!\Ubifs\Compression::isDefined($this->_m_defaultCompression)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_defaultCompression, $this->_io, "/types/superblock_header/seq/16");
            }
            $this->_m_padding1 = $this->_io->readBytes(2);
            if (!($this->_m_padding1 == "\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00", $this->_m_padding1, $this->_io, "/types/superblock_header/seq/17");
            }
            $this->_m_reservePoolUid = $this->_io->readU4le();
            $this->_m_reservePoolGid = $this->_io->readU4le();
            $this->_m_reservePoolSize = $this->_io->readU8le();
            $this->_m_timeGranularity = $this->_io->readU4le();
            if (!($this->_m_timeGranularity >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_timeGranularity, $this->_io, "/types/superblock_header/seq/21");
            }
            if (!($this->_m_timeGranularity <= 1000000000)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(1000000000, $this->_m_timeGranularity, $this->_io, "/types/superblock_header/seq/21");
            }
            $this->_m_uuid = $this->_io->readBytes(16);
            $this->_m_roCompatVersion = $this->_io->readU4le();
            $this->_m_hmac = $this->_io->readBytes(64);
            $this->_m_hmacWkm = $this->_io->readBytes(64);
            if ($this->authenticated()) {
                $this->_m_hashAlgo = $this->_io->readU2le();
                if (!\Ubifs\HashAlgos::isDefined($this->_m_hashAlgo)) {
                    throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_hashAlgo, $this->_io, "/types/superblock_header/seq/26");
                }
            }
            if (!($this->authenticated())) {
                $this->_m_hashAlgoUnused = $this->_io->readU2le();
            }
            $this->_m_hashMst = $this->_io->readBytes(64);
            $this->_m_padding2 = $this->_io->readBytes(3774);
        }
        protected $_m_authenticated;

        /**
         * this filesystem contains hashes for authentication
         */
        public function authenticated() {
            if ($this->_m_authenticated !== null)
                return $this->_m_authenticated;
            $this->_m_authenticated = ($this->flags() & 32) != 0;
            return $this->_m_authenticated;
        }
        protected $_m_biglpt;

        /**
         * if "big" LPT model is used if set
         */
        public function biglpt() {
            if ($this->_m_biglpt !== null)
                return $this->_m_biglpt;
            $this->_m_biglpt = ($this->flags() & 2) != 0;
            return $this->_m_biglpt;
        }
        protected $_m_doubleHash;

        /**
         * store a 32bit cookie in directory entry nodes to
         * support 64bit cookies for lookups by hash
         */
        public function doubleHash() {
            if ($this->_m_doubleHash !== null)
                return $this->_m_doubleHash;
            $this->_m_doubleHash = ($this->flags() & 8) != 0;
            return $this->_m_doubleHash;
        }
        protected $_m_encrypted;

        /**
         * filesystem contains encrypted files
         */
        public function encrypted() {
            if ($this->_m_encrypted !== null)
                return $this->_m_encrypted;
            $this->_m_encrypted = ($this->flags() & 16) != 0;
            return $this->_m_encrypted;
        }
        protected $_m_lenHash;

        /**
         * Length in bytes of the hash of a node (`c->hash_len` in Linux), e.g.
         * in each branch of an index node. In an authenticated file system, it
         * is determined by `hash_algo`. Otherwise, it is 0.
         */
        public function lenHash() {
            if ($this->_m_lenHash !== null)
                return $this->_m_lenHash;
            $this->_m_lenHash = (!($this->authenticated()) ? 0 : ( (($this->hashAlgo() == \Ubifs\HashAlgos::MD4) || ($this->hashAlgo() == \Ubifs\HashAlgos::MD5) || ($this->hashAlgo() == \Ubifs\HashAlgos::RIPE_MD_128) || ($this->hashAlgo() == \Ubifs\HashAlgos::TGR_128))  ? 16 : ( (($this->hashAlgo() == \Ubifs\HashAlgos::SHA1) || ($this->hashAlgo() == \Ubifs\HashAlgos::RIPE_MD_160) || ($this->hashAlgo() == \Ubifs\HashAlgos::TGR_160))  ? 20 : ($this->hashAlgo() == \Ubifs\HashAlgos::TGR_192 ? 24 : ($this->hashAlgo() == \Ubifs\HashAlgos::SHA224 ? 28 : ( (($this->hashAlgo() == \Ubifs\HashAlgos::SHA256) || ($this->hashAlgo() == \Ubifs\HashAlgos::RIPE_MD_256) || ($this->hashAlgo() == \Ubifs\HashAlgos::WP_256) || ($this->hashAlgo() == \Ubifs\HashAlgos::SM3_256) || ($this->hashAlgo() == \Ubifs\HashAlgos::STREEBOG_256) || ($this->hashAlgo() == \Ubifs\HashAlgos::SHA3_256))  ? 32 : ($this->hashAlgo() == \Ubifs\HashAlgos::RIPE_MD_320 ? 40 : ( (($this->hashAlgo() == \Ubifs\HashAlgos::SHA384) || ($this->hashAlgo() == \Ubifs\HashAlgos::WP_384) || ($this->hashAlgo() == \Ubifs\HashAlgos::SHA3_384))  ? 48 : ( (($this->hashAlgo() == \Ubifs\HashAlgos::SHA512) || ($this->hashAlgo() == \Ubifs\HashAlgos::WP_512) || ($this->hashAlgo() == \Ubifs\HashAlgos::STREEBOG_512) || ($this->hashAlgo() == \Ubifs\HashAlgos::SHA3_512))  ? 64 : -1)))))))));
            return $this->_m_lenHash;
        }
        protected $_m_spaceFixup;

        /**
         * first-mount "fixup" of free space within LEBs needed
         */
        public function spaceFixup() {
            if ($this->_m_spaceFixup !== null)
                return $this->_m_spaceFixup;
            $this->_m_spaceFixup = ($this->flags() & 4) != 0;
            return $this->_m_spaceFixup;
        }
        protected $_m_padding0;
        protected $_m_keyHash;
        protected $_m_keyFmt;
        protected $_m_flags;
        protected $_m_minIoSize;
        protected $_m_lebSize;
        protected $_m_numLebs;
        protected $_m_maxNumLebs;
        protected $_m_maxBudBytes;
        protected $_m_numLogLebs;
        protected $_m_numLptLebs;
        protected $_m_numOrphanLebs;
        protected $_m_numJournalHeads;
        protected $_m_fanout;
        protected $_m_numSaveTableEntries;
        protected $_m_fmtVersion;
        protected $_m_defaultCompression;
        protected $_m_padding1;
        protected $_m_reservePoolUid;
        protected $_m_reservePoolGid;
        protected $_m_reservePoolSize;
        protected $_m_timeGranularity;
        protected $_m_uuid;
        protected $_m_roCompatVersion;
        protected $_m_hmac;
        protected $_m_hmacWkm;
        protected $_m_hashAlgo;
        protected $_m_hashAlgoUnused;
        protected $_m_hashMst;
        protected $_m_padding2;

        /**
         * reserved for future, zeroes
         */
        public function padding0() { return $this->_m_padding0; }

        /**
         * type of hash function used in keys
         */
        public function keyHash() { return $this->_m_keyHash; }

        /**
         * format of the key
         */
        public function keyFmt() { return $this->_m_keyFmt; }

        /**
         * file-system flags (see the instances `biglpt`, `space_fixup`, etc.)
         */
        public function flags() { return $this->_m_flags; }

        /**
         * minimal input/output unit size
         */
        public function minIoSize() { return $this->_m_minIoSize; }

        /**
         * logical eraseblock size in bytes
         */
        public function lebSize() { return $this->_m_lebSize; }

        /**
         * count of LEBs used by file-system
         */
        public function numLebs() { return $this->_m_numLebs; }

        /**
         * maximum count of LEBs used by file-system
         */
        public function maxNumLebs() { return $this->_m_maxNumLebs; }

        /**
         * maximum amount of data stored in buds
         */
        public function maxBudBytes() { return $this->_m_maxBudBytes; }

        /**
         * log size in logical eraseblocks
         */
        public function numLogLebs() { return $this->_m_numLogLebs; }

        /**
         * number of LEBs used for lprops table
         */
        public function numLptLebs() { return $this->_m_numLptLebs; }

        /**
         * number of LEBs used for recording orphans
         */
        public function numOrphanLebs() { return $this->_m_numOrphanLebs; }

        /**
         * count of journal heads
         */
        public function numJournalHeads() { return $this->_m_numJournalHeads; }

        /**
         * tree fanout (max. number of links per indexing node)
         */
        public function fanout() { return $this->_m_fanout; }

        /**
         * number of LEB numbers in LPT's save table
         */
        public function numSaveTableEntries() { return $this->_m_numSaveTableEntries; }

        /**
         * UBIFS on-flash format version
         */
        public function fmtVersion() { return $this->_m_fmtVersion; }

        /**
         * default compression algorithm (`compression::lzo`, etc.)
         */
        public function defaultCompression() { return $this->_m_defaultCompression; }

        /**
         * reserved for future, zeroes
         */
        public function padding1() { return $this->_m_padding1; }

        /**
         * reserve pool UID
         */
        public function reservePoolUid() { return $this->_m_reservePoolUid; }

        /**
         * reserve pool GID
         */
        public function reservePoolGid() { return $this->_m_reservePoolGid; }

        /**
         * size of the reserved pool in bytes
         */
        public function reservePoolSize() { return $this->_m_reservePoolSize; }

        /**
         * time granularity in nanoseconds
         */
        public function timeGranularity() { return $this->_m_timeGranularity; }

        /**
         * UUID generated when the file system image was created
         */
        public function uuid() { return $this->_m_uuid; }

        /**
         * UBIFS R/O compatibility version
         */
        public function roCompatVersion() { return $this->_m_roCompatVersion; }

        /**
         * HMAC to authenticate the superblock node
         */
        public function hmac() { return $this->_m_hmac; }

        /**
         * HMAC of a well known message (the string "UBIFS") as a convenience
         * to the user to check if the correct key is passed
         */
        public function hmacWkm() { return $this->_m_hmacWkm; }

        /**
         * The hash algo used for this filesystem
         */
        public function hashAlgo() { return $this->_m_hashAlgo; }

        /**
         * Unused field (would only be meaningful in an authenticated file
         * system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
         * writes it as 0.
         */
        public function hashAlgoUnused() { return $this->_m_hashAlgoUnused; }

        /**
         * hash of the master node, only valid for signed images in which the
         * master node does not contain a hmac
         */
        public function hashMst() { return $this->_m_hashMst; }

        /**
         * reserved for future, zeroes
         */
        public function padding2() { return $this->_m_padding2; }
    }
}

namespace Ubifs {
    class SuperblockNode extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Ubifs\CommonHeader($this->_io, $this, $this->_root);
            $_ = $this->_m_header;
            if (!($_->nodeType() == \Ubifs\NodeTypes::SUPERBLOCK)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_header, $this->_io, "/types/superblock_node/seq/0");
            }
            $this->_m__raw_nodeHeader = $this->_io->readBytes($this->header()->lenFullNode() - 24);
            $_io__raw_nodeHeader = new \Kaitai\Struct\Stream($this->_m__raw_nodeHeader);
            $this->_m_nodeHeader = new \Ubifs\SuperblockHeader($_io__raw_nodeHeader, $this, $this->_root);
        }
        protected $_m_header;
        protected $_m_nodeHeader;
        protected $_m__raw_nodeHeader;
        public function header() { return $this->_m_header; }
        public function nodeHeader() { return $this->_m_nodeHeader; }
        public function _raw_nodeHeader() { return $this->_m__raw_nodeHeader; }
    }
}

/**
 * This node exists only in the journal and never goes to the main area.
 */

namespace Ubifs {
    class TruncationHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ubifs\Block $_parent = null, ?\Ubifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_inodeNumber = $this->_io->readU4le();
            $this->_m_padding = $this->_io->readBytes(12);
            $this->_m_oldSize = $this->_io->readU8le();
            if (!($this->_m_oldSize >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_oldSize, $this->_io, "/types/truncation_header/seq/2");
            }
            $this->_m_newSize = $this->_io->readU8le();
            if (!($this->_m_newSize <= $this->oldSize() - 1)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->oldSize() - 1, $this->_m_newSize, $this->_io, "/types/truncation_header/seq/3");
            }
        }
        protected $_m_inodeNumber;
        protected $_m_padding;
        protected $_m_oldSize;
        protected $_m_newSize;

        /**
         * truncated inode number
         */
        public function inodeNumber() { return $this->_m_inodeNumber; }

        /**
         * reserved for future, zeroes
         */
        public function padding() { return $this->_m_padding; }

        /**
         * size before truncation
         */
        public function oldSize() { return $this->_m_oldSize; }

        /**
         * size after truncation
         */
        public function newSize() { return $this->_m_newSize; }
    }
}

namespace Ubifs {
    class Compression {

        /**
         * no compression
         */
        const NO_COMPRESSION = 0;

        /**
         * LZO compression
         */
        const LZO = 1;

        /**
         * zlib compression, stored as
         * [raw deflate](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/crypto/deflate.c#L125-L127)
         * data, i.e. without the zlib header and checksum
         */
        const ZLIB = 2;

        /**
         * zstd compression
         */
        const ZSTD = 3;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Ubifs {
    class HashAlgos {
        const MD4 = 0;
        const MD5 = 1;
        const SHA1 = 2;
        const RIPE_MD_160 = 3;
        const SHA256 = 4;
        const SHA384 = 5;
        const SHA512 = 6;
        const SHA224 = 7;
        const RIPE_MD_128 = 8;
        const RIPE_MD_256 = 9;
        const RIPE_MD_320 = 10;
        const WP_256 = 11;
        const WP_384 = 12;
        const WP_512 = 13;
        const TGR_128 = 14;
        const TGR_160 = 15;
        const TGR_192 = 16;
        const SM3_256 = 17;
        const STREEBOG_256 = 18;
        const STREEBOG_512 = 19;
        const SHA3_256 = 20;
        const SHA3_384 = 21;
        const SHA3_512 = 22;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Ubifs {
    class Hashes {

        /**
         * R5 hash
         */
        const R5 = 0;

        /**
         * test hash which just returns first 4 bytes of the name
         */
        const TEST_HASH = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Ubifs {
    class InodeTypes {

        /**
         * regular file
         */
        const REGULAR = 0;

        /**
         * directory
         */
        const DIRECTORY = 1;

        /**
         * soft link
         */
        const LINK = 2;

        /**
         * block device node
         */
        const BLOCK_DEVICE = 3;

        /**
         * character device node
         */
        const CHARACTER_DEVICE = 4;

        /**
         * fifo
         */
        const FIFO = 5;

        /**
         * socket
         */
        const SOCKET = 6;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Ubifs {
    class KeyFormats {

        /**
         * The simple key format uses 29 bits for storing UBIFS
         * block number and hash value.
         */
        const SIMPLE = 0;

        private const _VALUES = [0 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Ubifs {
    class KeyTypes {

        /**
         * inode node key
         */
        const INODE = 0;

        /**
         * data node key
         */
        const DATA = 1;

        /**
         * directory entry node key
         */
        const DIRECTORY = 2;

        /**
         * extended attribute node key
         */
        const EXTENDED_ATTRIBUTE = 3;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Ubifs {
    class NodeGroupTypes {

        /**
         * this node is not part of a group
         */
        const NO_NODE_GROUP = 0;

        /**
         * this node is a part of a group
         */
        const IN_NODE_GROUP = 1;

        /**
         * this node is the last in a group
         */
        const LAST_OF_NODE_GROUP = 2;

        private const _VALUES = [0 => true, 1 => true, 2 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Ubifs {
    class NodeTypes {

        /**
         * inode node
         */
        const INODE = 0;

        /**
         * data node
         */
        const DATA = 1;

        /**
         * directory entry node
         */
        const DIRECTORY = 2;

        /**
         * extended attribute node
         */
        const EXTENDED_ATTRIBUTE = 3;

        /**
         * truncation node
         */
        const TRUNCATION = 4;

        /**
         * padding node
         */
        const PADDING = 5;

        /**
         * superblock node
         */
        const SUPERBLOCK = 6;

        /**
         * master node
         */
        const MASTER = 7;

        /**
         * LEB reference node
         */
        const REFERENCE = 8;

        /**
         * index node
         */
        const INDEX = 9;

        /**
         * commit start node
         */
        const COMMIT_START = 10;

        /**
         * orphan node
         */
        const ORPHAN = 11;

        /**
         * authentication node
         */
        const AUTHENTICATION = 12;

        /**
         * signature node
         */
        const SIGNATURE = 13;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
