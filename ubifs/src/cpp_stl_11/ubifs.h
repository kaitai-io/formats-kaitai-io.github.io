#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ubifs_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

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
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h Git tag "v7.2"
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h Git tag "v7.2"
 * \sa http://www.linux-mtd.infradead.org/doc/ubifs.pdf Source
 */

class ubifs_t : public kaitai::kstruct {

public:
    class authentication_header_t;
    class block_t;
    class branch_t;
    class commit_start_header_t;
    class common_header_t;
    class data_header_t;
    class directory_header_t;
    class dummy_t;
    class index_block_t;
    class index_header_t;
    class inode_header_t;
    class key_t;
    class master_header_t;
    class masterblock_node_t;
    class orphan_header_t;
    class padding_header_t;
    class reference_header_t;
    class signature_header_t;
    class superblock_header_t;
    class superblock_node_t;
    class truncation_header_t;

    enum compression_t {
        COMPRESSION_NO_COMPRESSION = 0,
        COMPRESSION_LZO = 1,
        COMPRESSION_ZLIB = 2,
        COMPRESSION_ZSTD = 3
    };
    static bool _is_defined_compression_t(compression_t v);

private:
    static const std::set<compression_t> _values_compression_t;

public:

    enum hash_algos_t {
        HASH_ALGOS_MD4 = 0,
        HASH_ALGOS_MD5 = 1,
        HASH_ALGOS_SHA1 = 2,
        HASH_ALGOS_RIPE_MD_160 = 3,
        HASH_ALGOS_SHA256 = 4,
        HASH_ALGOS_SHA384 = 5,
        HASH_ALGOS_SHA512 = 6,
        HASH_ALGOS_SHA224 = 7,
        HASH_ALGOS_RIPE_MD_128 = 8,
        HASH_ALGOS_RIPE_MD_256 = 9,
        HASH_ALGOS_RIPE_MD_320 = 10,
        HASH_ALGOS_WP_256 = 11,
        HASH_ALGOS_WP_384 = 12,
        HASH_ALGOS_WP_512 = 13,
        HASH_ALGOS_TGR_128 = 14,
        HASH_ALGOS_TGR_160 = 15,
        HASH_ALGOS_TGR_192 = 16,
        HASH_ALGOS_SM3_256 = 17,
        HASH_ALGOS_STREEBOG_256 = 18,
        HASH_ALGOS_STREEBOG_512 = 19,
        HASH_ALGOS_SHA3_256 = 20,
        HASH_ALGOS_SHA3_384 = 21,
        HASH_ALGOS_SHA3_512 = 22
    };
    static bool _is_defined_hash_algos_t(hash_algos_t v);

private:
    static const std::set<hash_algos_t> _values_hash_algos_t;

public:

    enum hashes_t {
        HASHES_R5 = 0,
        HASHES_TEST_HASH = 1
    };
    static bool _is_defined_hashes_t(hashes_t v);

private:
    static const std::set<hashes_t> _values_hashes_t;

public:

    enum inode_types_t {
        INODE_TYPES_REGULAR = 0,
        INODE_TYPES_DIRECTORY = 1,
        INODE_TYPES_LINK = 2,
        INODE_TYPES_BLOCK_DEVICE = 3,
        INODE_TYPES_CHARACTER_DEVICE = 4,
        INODE_TYPES_FIFO = 5,
        INODE_TYPES_SOCKET = 6
    };
    static bool _is_defined_inode_types_t(inode_types_t v);

private:
    static const std::set<inode_types_t> _values_inode_types_t;

public:

    enum key_formats_t {
        KEY_FORMATS_SIMPLE = 0
    };
    static bool _is_defined_key_formats_t(key_formats_t v);

private:
    static const std::set<key_formats_t> _values_key_formats_t;

public:

    enum key_types_t {
        KEY_TYPES_INODE = 0,
        KEY_TYPES_DATA = 1,
        KEY_TYPES_DIRECTORY = 2,
        KEY_TYPES_EXTENDED_ATTRIBUTE = 3
    };
    static bool _is_defined_key_types_t(key_types_t v);

private:
    static const std::set<key_types_t> _values_key_types_t;

public:

    enum node_group_types_t {
        NODE_GROUP_TYPES_NO_NODE_GROUP = 0,
        NODE_GROUP_TYPES_IN_NODE_GROUP = 1,
        NODE_GROUP_TYPES_LAST_OF_NODE_GROUP = 2
    };
    static bool _is_defined_node_group_types_t(node_group_types_t v);

private:
    static const std::set<node_group_types_t> _values_node_group_types_t;

public:

    enum node_types_t {
        NODE_TYPES_INODE = 0,
        NODE_TYPES_DATA = 1,
        NODE_TYPES_DIRECTORY = 2,
        NODE_TYPES_EXTENDED_ATTRIBUTE = 3,
        NODE_TYPES_TRUNCATION = 4,
        NODE_TYPES_PADDING = 5,
        NODE_TYPES_SUPERBLOCK = 6,
        NODE_TYPES_MASTER = 7,
        NODE_TYPES_REFERENCE = 8,
        NODE_TYPES_INDEX = 9,
        NODE_TYPES_COMMIT_START = 10,
        NODE_TYPES_ORPHAN = 11,
        NODE_TYPES_AUTHENTICATION = 12,
        NODE_TYPES_SIGNATURE = 13
    };
    static bool _is_defined_node_types_t(node_types_t v);

private:
    static const std::set<node_types_t> _values_node_types_t;

public:

    ubifs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ubifs_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~ubifs_t();

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782 Git tag "v7.2"
     */

    class authentication_header_t : public kaitai::kstruct {

    public:

        authentication_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~authentication_header_t();

    private:
        std::string m_hmac;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;

    public:

        /**
         * HMAC authenticating the journal before this node, keyed with the
         * file system's authentication key (which is not stored on flash).
         * The kernel [uses](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L275-L276)
         * HMAC with the hash algorithm in `<superblock_header>.hash_algo`
         * ([checked when mounting](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L575-L580)),
         * so `hmac` is as long as its digest, e.g. 32 bytes for SHA-256.
         */
        std::string hmac() const { return m_hmac; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
    };

    class block_t : public kaitai::kstruct {

    public:

        block_t(kaitai::kstream* p__io, ubifs_t::branch_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_t();

    private:
        std::unique_ptr<common_header_t> m_header;
        std::unique_ptr<kaitai::kstruct> m_node_header;
        bool n_node_header;

    public:
        bool _is_null_node_header() { node_header(); return n_node_header; };

    private:
        ubifs_t* m__root;
        ubifs_t::branch_t* m__parent;
        std::string m__raw_node_header;
        std::unique_ptr<kaitai::kstream> m__io__raw_node_header;

    public:
        common_header_t* header() const { return m_header.get(); }
        kaitai::kstruct* node_header() const { return m_node_header.get(); }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::branch_t* _parent() const { return m__parent; }
        std::string _raw_node_header() const { return m__raw_node_header; }
        kaitai::kstream* _io__raw_node_header() const { return m__io__raw_node_header.get(); }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817 Git tag "v7.2"
     */

    class branch_t : public kaitai::kstruct {

    public:

        branch_t(kaitai::kstream* p__io, ubifs_t::index_header_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~branch_t();

    private:
        bool f_target;
        std::unique_ptr<block_t> m_target;

    public:
        block_t* target();

    private:
        uint32_t m_target_leb;
        uint32_t m_ofs_target;
        uint32_t m_len_target;
        std::unique_ptr<key_t> m_key;
        std::string m_hash;
        ubifs_t* m__root;
        ubifs_t::index_header_t* m__parent;
        std::string m__raw_key;
        std::unique_ptr<kaitai::kstream> m__io__raw_key;
        std::string m__raw_target;
        std::unique_ptr<kaitai::kstream> m__io__raw_target;

    public:

        /**
         * LEB number of the target node
         */
        uint32_t target_leb() const { return m_target_leb; }

        /**
         * offset within the LEB `target_leb`
         */
        uint32_t ofs_target() const { return m_ofs_target; }

        /**
         * target node length
         */
        uint32_t len_target() const { return m_len_target; }
        key_t* key() const { return m_key.get(); }

        /**
         * Hash of the target node. It is empty in a file system without
         * authentication (see `<superblock_header>.len_hash`).
         * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1642-L1654 Git tag "v7.2"
         */
        std::string hash() const { return m_hash; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::index_header_t* _parent() const { return m__parent; }
        std::string _raw_key() const { return m__raw_key; }
        kaitai::kstream* _io__raw_key() const { return m__io__raw_key.get(); }
        std::string _raw_target() const { return m__raw_target; }
        kaitai::kstream* _io__raw_target() const { return m__io__raw_target.get(); }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841 Git tag "v7.2"
     */

    class commit_start_header_t : public kaitai::kstruct {

    public:

        commit_start_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~commit_start_header_t();

    private:
        uint64_t m_commit_number;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;

    public:

        /**
         * commit number
         */
        uint64_t commit_number() const { return m_commit_number; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464 Git tag "v7.2"
     */

    class common_header_t : public kaitai::kstruct {

    public:

        common_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~common_header_t();

    private:
        uint32_t m_magic;
        uint32_t m_crc;
        uint64_t m_sequence_number;
        uint32_t m_len_full_node;
        node_types_t m_node_type;
        node_group_types_t m_group_type;
        std::string m_padding;
        ubifs_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * UBIFS node magic number (`UBIFS_NODE_MAGIC`)
         */
        uint32_t magic() const { return m_magic; }

        /**
         * CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
         * starting at offset 8). It is computed with an initial register value
         * of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
         * CRC-32 (e.g.
         * [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
         * in Python).
         */
        uint32_t crc() const { return m_crc; }

        /**
         * sequence number
         */
        uint64_t sequence_number() const { return m_sequence_number; }

        /**
         * full node length
         */
        uint32_t len_full_node() const { return m_len_full_node; }

        /**
         * node type
         */
        node_types_t node_type() const { return m_node_type; }

        /**
         * node group type
         */
        node_group_types_t group_type() const { return m_group_type; }

        /**
         * reserved for future, zeroes
         */
        std::string padding() const { return m_padding; }
        ubifs_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584 Git tag "v7.2"
     */

    class data_header_t : public kaitai::kstruct {

    public:

        data_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_header_t();

    private:
        std::unique_ptr<key_t> m_key;
        uint32_t m_len_uncompressed;
        compression_t m_compression;
        uint16_t m_len_compressed_data;
        std::string m_data;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;
        std::string m__raw_key;
        std::unique_ptr<kaitai::kstream> m__io__raw_key;

    public:

        /**
         * node key
         */
        key_t* key() const { return m_key.get(); }

        /**
         * uncompressed data size in bytes
         */
        uint32_t len_uncompressed() const { return m_len_uncompressed; }

        /**
         * compression type (`compression::no_compression`, `compression::lzo`,
         * etc.)
         */
        compression_t compression() const { return m_compression; }

        /**
         * compressed data size in bytes, only valid when data is encrypted
         */
        uint16_t len_compressed_data() const { return m_len_compressed_data; }

        /**
         * One block (up to 4096 bytes) of the file, block number `key.value`,
         * compressed as given by `compression`. Blocks missing from the index
         * are holes (zeros). In an encrypted inode, the compressed data is
         * padded
         * and [encrypted](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/crypto.c#L38-L59),
         * and `len_compressed_data` is the length of the compressed data
         * before padding.
         */
        std::string data() const { return m_data; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
        std::string _raw_key() const { return m__raw_key; }
        kaitai::kstream* _io__raw_key() const { return m__io__raw_key.get(); }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565 Git tag "v7.2"
     */

    class directory_header_t : public kaitai::kstruct {

    public:

        directory_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~directory_header_t();

    private:
        std::unique_ptr<key_t> m_key;
        uint64_t m_inode_number;
        std::string m_padding1;
        inode_types_t m_inode_type;
        uint16_t m_len_name;
        uint32_t m_cookie;
        std::string m_name;
        std::string m_name_terminator;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;
        std::string m__raw_key;
        std::unique_ptr<kaitai::kstream> m__io__raw_key;

    public:

        /**
         * node key
         */
        key_t* key() const { return m_key.get(); }

        /**
         * target inode number
         */
        uint64_t inode_number() const { return m_inode_number; }

        /**
         * reserved for future, zeroes
         */
        std::string padding1() const { return m_padding1; }

        /**
         * type of the target inode (`inode_types::regular`,
         * `inode_types::directory`, etc.)
         */
        inode_types_t inode_type() const { return m_inode_type; }

        /**
         * name length
         */
        uint16_t len_name() const { return m_len_name; }

        /**
         * A 32bits random number, used to construct a 64bits identifier.
         */
        uint32_t cookie() const { return m_cookie; }

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
        std::string name() const { return m_name; }

        /**
         * Zero byte after `name`, [not counted in
         * `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).
         */
        std::string name_terminator() const { return m_name_terminator; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
        std::string _raw_key() const { return m__raw_key; }
        kaitai::kstream* _io__raw_key() const { return m__io__raw_key.get(); }
    };

    class dummy_t : public kaitai::kstruct {

    public:

        dummy_t(kaitai::kstream* p__io, ubifs_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dummy_t();

    private:
        ubifs_t* m__root;
        ubifs_t* m__parent;

    public:
        ubifs_t* _root() const { return m__root; }
        ubifs_t* _parent() const { return m__parent; }
    };

    class index_block_t : public kaitai::kstruct {

    public:

        index_block_t(kaitai::kstream* p__io, ubifs_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_block_t();

    private:
        std::unique_ptr<common_header_t> m_header;
        std::unique_ptr<index_header_t> m_node_header;
        ubifs_t* m__root;
        ubifs_t* m__parent;
        std::string m__raw_node_header;
        std::unique_ptr<kaitai::kstream> m__io__raw_node_header;

    public:
        common_header_t* header() const { return m_header.get(); }
        index_header_t* node_header() const { return m_node_header.get(); }
        ubifs_t* _root() const { return m__root; }
        ubifs_t* _parent() const { return m__parent; }
        std::string _raw_node_header() const { return m__raw_node_header; }
        kaitai::kstream* _io__raw_node_header() const { return m__io__raw_node_header.get(); }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831 Git tag "v7.2"
     */

    class index_header_t : public kaitai::kstruct {

    public:

        index_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~index_header_t();

    private:
        uint16_t m_num_branches;
        uint16_t m_level;
        std::unique_ptr<std::vector<std::unique_ptr<branch_t>>> m_branches;
        ubifs_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * number of child index nodes
         */
        uint16_t num_branches() const { return m_num_branches; }

        /**
         * tree level
         */
        uint16_t level() const { return m_level; }

        /**
         * LEB number / offset / length / key branches
         * 
         * All branches have the same size, which is 20 bytes (with the simple
         * key format) plus the hash length in an authenticated file system.
         * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/misc.h#L186-L205 Git tag "v7.2"
         */
        std::vector<std::unique_ptr<branch_t>>* branches() const { return m_branches.get(); }
        ubifs_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539 Git tag "v7.2"
     */

    class inode_header_t : public kaitai::kstruct {

    public:

        inode_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~inode_header_t();

    private:
        bool f_append;
        bool m_append;

    public:

        /**
         * writes to the inode may only append data
         */
        bool append();

    private:
        bool f_compressed;
        bool m_compressed;

    public:

        /**
         * use compression for this inode
         */
        bool compressed();

    private:
        bool f_dirsync;
        bool m_dirsync;

    public:

        /**
         * I/O on this directory inode has to be synchronous
         */
        bool dirsync();

    private:
        bool f_encrypted;
        bool m_encrypted;

    public:

        /**
         * use encryption for this inode
         */
        bool encrypted();

    private:
        bool f_immutable;
        bool m_immutable;

    public:

        /**
         * inode is immutable
         */
        bool immutable();

    private:
        bool f_is_block_device;
        bool m_is_block_device;

    public:
        bool is_block_device();

    private:
        bool f_is_character_device;
        bool m_is_character_device;

    public:
        bool is_character_device();

    private:
        bool f_is_dir;
        bool m_is_dir;

    public:
        bool is_dir();

    private:
        bool f_is_fifo;
        bool m_is_fifo;

    public:
        bool is_fifo();

    private:
        bool f_is_link;
        bool m_is_link;

    public:
        bool is_link();

    private:
        bool f_is_regular;
        bool m_is_regular;

    public:
        bool is_regular();

    private:
        bool f_is_socket;
        bool m_is_socket;

    public:
        bool is_socket();

    private:
        bool f_synchronous;
        bool m_synchronous;

    public:

        /**
         * I/O on this inode has to be synchronous
         */
        bool synchronous();

    private:
        bool f_xattr;
        bool m_xattr;

    public:

        /**
         * this inode is the inode for an extended attribute value
         */
        bool xattr();

    private:
        std::unique_ptr<key_t> m_key;
        uint64_t m_creation_sequence_number;
        uint64_t m_len_uncompressed;
        uint64_t m_atime_sec;
        uint64_t m_ctime_sec;
        uint64_t m_mtime_sec;
        uint32_t m_atime_nsec;
        uint32_t m_ctime_nsec;
        uint32_t m_mtime_nsec;
        uint32_t m_num_links;
        uint32_t m_uid;
        uint32_t m_gid;
        uint32_t m_mode;
        uint32_t m_flags;
        uint32_t m_len_data;
        uint32_t m_num_xattrs;
        uint32_t m_xattr_size;
        std::string m_padding1;
        uint32_t m_xattr_names;
        compression_t m_compression;
        std::string m_padding2;
        std::string m_data;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;
        std::string m__raw_key;
        std::unique_ptr<kaitai::kstream> m__io__raw_key;

    public:

        /**
         * node key
         */
        key_t* key() const { return m_key.get(); }

        /**
         * sequence number at time of creation
         */
        uint64_t creation_sequence_number() const { return m_creation_sequence_number; }

        /**
         * inode size in bytes (amount of uncompressed data)
         */
        uint64_t len_uncompressed() const { return m_len_uncompressed; }

        /**
         * access time seconds
         */
        uint64_t atime_sec() const { return m_atime_sec; }

        /**
         * status change time seconds
         */
        uint64_t ctime_sec() const { return m_ctime_sec; }

        /**
         * modification time seconds
         */
        uint64_t mtime_sec() const { return m_mtime_sec; }

        /**
         * access time nanoseconds
         */
        uint32_t atime_nsec() const { return m_atime_nsec; }

        /**
         * status change time nanoseconds
         */
        uint32_t ctime_nsec() const { return m_ctime_nsec; }

        /**
         * modification time nanoseconds
         */
        uint32_t mtime_nsec() const { return m_mtime_nsec; }

        /**
         * number of hard links
         */
        uint32_t num_links() const { return m_num_links; }

        /**
         * owner ID
         */
        uint32_t uid() const { return m_uid; }

        /**
         * group ID
         */
        uint32_t gid() const { return m_gid; }

        /**
         * file type and permissions, as in `st_mode` (see the `is_*`
         * instances for the file type)
         */
        uint32_t mode() const { return m_mode; }

        /**
         * per-inode flags (see the instances `compressed`, `synchronous`,
         * etc.)
         */
        uint32_t flags() const { return m_flags; }

        /**
         * inode data length
         */
        uint32_t len_data() const { return m_len_data; }

        /**
         * count of extended attributes this inode has
         */
        uint32_t num_xattrs() const { return m_num_xattrs; }

        /**
         * summarized size of all extended attributes in bytes
         */
        uint32_t xattr_size() const { return m_xattr_size; }
        std::string padding1() const { return m_padding1; }

        /**
         * sum of lengths of all extended attribute names belonging
         * to this inode
         */
        uint32_t xattr_names() const { return m_xattr_names; }

        /**
         * compression type used for this inode
         */
        compression_t compression() const { return m_compression; }

        /**
         * reserved for future, zeroes
         */
        std::string padding2() const { return m_padding2; }

        /**
         * Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
         * (encrypted if the inode is encrypted), device number of a device node
         * ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
         * 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
         * [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
         * (in its own inode, see `xattr`). Empty otherwise.
         */
        std::string data() const { return m_data; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
        std::string _raw_key() const { return m__raw_key; }
        kaitai::kstream* _io__raw_key() const { return m__io__raw_key.get(); }
    };

    /**
     * Inode nodes (`inode_header`), directory and extended attribute entry
     * nodes (`directory_header`) and data nodes (`data_header`) store keys in a
     * 16-byte field (`UBIFS_MAX_KEY_LEN`). The simple key format, the only one
     * there is (see `<superblock_header>.key_fmt`), uses only the first 8
     * bytes, and Linux (v7.2)
     * [zeroes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L432-L440)
     * the rest. Branches of index nodes (`branch`)
     * [store only these 8 bytes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L448-L455).
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L16-L22 Git tag "v7.2"
     */

    class key_t : public kaitai::kstruct {

    public:

        key_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~key_t();

    private:
        uint32_t m_inode_number;
        uint64_t m_value;
        key_types_t m_type;
        std::string m_unused;
        ubifs_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * Number of the inode that the node belongs to: the parent directory
         * for a directory entry, the inode that the attribute belongs to for an
         * extended attribute entry.
         */
        uint32_t inode_number() const { return m_inode_number; }

        /**
         * Block number for a data node, hash of the name (see
         * `<superblock_header>.key_hash`) for a directory or extended
         * attribute entry, 0 for an inode node.
         */
        uint64_t value() const { return m_value; }

        /**
         * Type of the key, which matches the type of the node.
         */
        key_types_t type() const { return m_type; }

        /**
         * Rest of the field holding the key: 8 zero bytes in `inode_header`,
         * `directory_header` and `data_header`, empty in `branch`.
         */
        std::string unused() const { return m_unused; }
        ubifs_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756 Git tag "v7.2"
     */

    class master_header_t : public kaitai::kstruct {

    public:

        master_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~master_header_t();

    private:
        bool f_dirty;
        bool m_dirty;

    public:

        /**
         * master node is dirty
         */
        bool dirty();

    private:
        bool f_no_orphans;
        bool m_no_orphans;

    public:

        /**
         * no orphan inodes present
         */
        bool no_orphans();

    private:
        bool f_recovery;
        bool m_recovery;

    public:

        /**
         * written by recovery
         */
        bool recovery();

    private:
        uint64_t m_highest_inum;
        uint64_t m_commit_number;
        uint32_t m_flags;
        uint32_t m_leb_log;
        uint32_t m_leb_root;
        uint32_t m_ofs_root;
        uint32_t m_len_root;
        uint32_t m_leb_garbage_collect;
        uint32_t m_leb_index_head;
        uint32_t m_ofs_index_head;
        uint64_t m_len_index;
        uint64_t m_total_free;
        uint64_t m_total_dirty;
        uint64_t m_total_used;
        uint64_t m_total_dead;
        uint64_t m_total_dark;
        uint32_t m_leb_lpt;
        uint32_t m_ofs_lpt;
        uint32_t m_leb_nhead;
        uint32_t m_ofs_nhead;
        uint32_t m_leb_lprops_table;
        uint32_t m_ofs_lprops_table;
        uint32_t m_leb_save_table;
        uint32_t m_ofs_save_table;
        uint32_t m_leb_last_lpt_scan;
        uint32_t m_num_empty_lebs;
        uint32_t m_num_index_lebs;
        uint32_t m_num_lebs;
        std::string m_hash_root_index;
        std::string m_hash_lpt;
        std::string m_hmac;
        std::string m_padding;
        ubifs_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * highest inode number in the committed index
         */
        uint64_t highest_inum() const { return m_highest_inum; }

        /**
         * commit number
         */
        uint64_t commit_number() const { return m_commit_number; }

        /**
         * various flags (see the instances `dirty`, `no_orphans` and
         * `recovery`)
         */
        uint32_t flags() const { return m_flags; }

        /**
         * start of the log
         */
        uint32_t leb_log() const { return m_leb_log; }

        /**
         * LEB number of the root indexing node
         */
        uint32_t leb_root() const { return m_leb_root; }

        /**
         * offset within the LEB `leb_root`
         */
        uint32_t ofs_root() const { return m_ofs_root; }

        /**
         * root indexing node length
         */
        uint32_t len_root() const { return m_len_root; }

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
         * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L214-L217 Git tag "v7.2"
         */
        uint32_t leb_garbage_collect() const { return m_leb_garbage_collect; }

        /**
         * LEB number of index head
         */
        uint32_t leb_index_head() const { return m_leb_index_head; }

        /**
         * offset of index head
         */
        uint32_t ofs_index_head() const { return m_ofs_index_head; }

        /**
         * size of index on flash
         */
        uint64_t len_index() const { return m_len_index; }

        /**
         * total free space in bytes
         */
        uint64_t total_free() const { return m_total_free; }

        /**
         * total dirty space in bytes
         */
        uint64_t total_dirty() const { return m_total_dirty; }

        /**
         * total used space in bytes (includes only data LEBs)
         */
        uint64_t total_used() const { return m_total_used; }

        /**
         * total dead space in bytes (includes only data LEBs)
         */
        uint64_t total_dead() const { return m_total_dead; }

        /**
         * total dark space in bytes (includes only data LEBs)
         */
        uint64_t total_dark() const { return m_total_dark; }

        /**
         * LEB number of LPT root nnode
         */
        uint32_t leb_lpt() const { return m_leb_lpt; }

        /**
         * offset of LPT root nnode
         */
        uint32_t ofs_lpt() const { return m_ofs_lpt; }

        /**
         * LEB number of LPT head
         */
        uint32_t leb_nhead() const { return m_leb_nhead; }

        /**
         * offset of LPT head
         */
        uint32_t ofs_nhead() const { return m_ofs_nhead; }

        /**
         * LEB number of LPT's own lprops table
         */
        uint32_t leb_lprops_table() const { return m_leb_lprops_table; }

        /**
         * offset of LPT's own lprops table
         */
        uint32_t ofs_lprops_table() const { return m_ofs_lprops_table; }

        /**
         * LEB number of LPT's save table. Present in every master node, but
         * only meaningful if `<superblock_header>.biglpt` is set: only then
         * does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
         */
        uint32_t leb_save_table() const { return m_leb_save_table; }

        /**
         * offset of LPT's save table (only meaningful if
         * `<superblock_header>.biglpt` is set, see `leb_save_table`)
         */
        uint32_t ofs_save_table() const { return m_ofs_save_table; }

        /**
         * LEB number of last LPT scan
         */
        uint32_t leb_last_lpt_scan() const { return m_leb_last_lpt_scan; }

        /**
         * number of empty logical eraseblocks
         */
        uint32_t num_empty_lebs() const { return m_num_empty_lebs; }

        /**
         * number of indexing logical eraseblocks
         */
        uint32_t num_index_lebs() const { return m_num_index_lebs; }

        /**
         * count of LEBs used by file-system
         */
        uint32_t num_lebs() const { return m_num_lebs; }

        /**
         * the hash of the root index node
         */
        std::string hash_root_index() const { return m_hash_root_index; }

        /**
         * the hash of the LPT
         */
        std::string hash_lpt() const { return m_hash_lpt; }

        /**
         * HMAC to authenticate the master node
         */
        std::string hmac() const { return m_hmac; }

        /**
         * reserved for future, zeroes
         */
        std::string padding() const { return m_padding; }
        ubifs_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class masterblock_node_t : public kaitai::kstruct {

    public:

        masterblock_node_t(kaitai::kstream* p__io, ubifs_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~masterblock_node_t();

    private:
        std::unique_ptr<common_header_t> m_header;
        std::unique_ptr<master_header_t> m_node_header;
        ubifs_t* m__root;
        ubifs_t* m__parent;
        std::string m__raw_node_header;
        std::unique_ptr<kaitai::kstream> m__io__raw_node_header;

    public:
        common_header_t* header() const { return m_header.get(); }
        master_header_t* node_header() const { return m_node_header.get(); }
        ubifs_t* _root() const { return m__root; }
        ubifs_t* _parent() const { return m__parent; }
        std::string _raw_node_header() const { return m__raw_node_header; }
        kaitai::kstream* _io__raw_node_header() const { return m__io__raw_node_header.get(); }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853 Git tag "v7.2"
     */

    class orphan_header_t : public kaitai::kstruct {

    public:

        orphan_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~orphan_header_t();

    private:
        uint64_t m_commit_number;
        std::unique_ptr<std::vector<uint64_t>> m_inode_numbers;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;

    public:

        /**
         * commit number (also top bit is set on the last node of the commit)
         */
        uint64_t commit_number() const { return m_commit_number; }

        /**
         * inode numbers of orphans
         */
        std::vector<uint64_t>* inode_numbers() const { return m_inode_numbers.get(); }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615 Git tag "v7.2"
     */

    class padding_header_t : public kaitai::kstruct {

    public:

        padding_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~padding_header_t();

    private:
        uint32_t m_len_padding;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;

    public:

        /**
         * how many bytes after this node are unused (because padded)
         */
        uint32_t len_padding() const { return m_len_padding; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * logical eraseblock reference node.
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772 Git tag "v7.2"
     */

    class reference_header_t : public kaitai::kstruct {

    public:

        reference_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~reference_header_t();

    private:
        uint32_t m_leb_number;
        uint32_t m_ofs_leb;
        uint32_t m_journal_head_number;
        std::string m_padding;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;

    public:

        /**
         * the referred logical eraseblock number
         */
        uint32_t leb_number() const { return m_leb_number; }

        /**
         * start offset in the referred LEB
         */
        uint32_t ofs_leb() const { return m_ofs_leb; }

        /**
         * journal head number
         */
        uint32_t journal_head_number() const { return m_journal_head_number; }

        /**
         * reserved for future, zeroes
         */
        std::string padding() const { return m_padding; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * Signature of the superblock node of a file system signed when it was
     * created (`mkfs.ubifs` with a key). Linux
     * [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
     * as the first node after the superblock node in LEB0.
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799 Git tag "v7.2"
     */

    class signature_header_t : public kaitai::kstruct {

    public:

        signature_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~signature_header_t();

    private:
        uint32_t m_type;
        uint32_t m_len_signature;
        std::string m_padding;
        std::string m_signature;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;

    public:

        /**
         * type of the signature
         */
        uint32_t type() const { return m_type; }

        /**
         * length of `signature` in bytes
         */
        uint32_t len_signature() const { return m_len_signature; }

        /**
         * reserved for future, zeroes
         */
        std::string padding() const { return m_padding; }

        /**
         * [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
         * of the whole superblock node (4096 bytes, including the common
         * header)
         */
        std::string signature() const { return m_signature; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683 Git tag "v7.2"
     */

    class superblock_header_t : public kaitai::kstruct {

    public:

        superblock_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~superblock_header_t();

    private:
        bool f_authenticated;
        bool m_authenticated;

    public:

        /**
         * this filesystem contains hashes for authentication
         */
        bool authenticated();

    private:
        bool f_biglpt;
        bool m_biglpt;

    public:

        /**
         * if "big" LPT model is used if set
         */
        bool biglpt();

    private:
        bool f_double_hash;
        bool m_double_hash;

    public:

        /**
         * store a 32bit cookie in directory entry nodes to
         * support 64bit cookies for lookups by hash
         */
        bool double_hash();

    private:
        bool f_encrypted;
        bool m_encrypted;

    public:

        /**
         * filesystem contains encrypted files
         */
        bool encrypted();

    private:
        bool f_len_hash;
        int32_t m_len_hash;

    public:

        /**
         * Length in bytes of the hash of a node (`c->hash_len` in Linux), e.g.
         * in each branch of an index node. In an authenticated file system, it
         * is determined by `hash_algo`. Otherwise, it is 0.
         */
        int32_t len_hash();

    private:
        bool f_space_fixup;
        bool m_space_fixup;

    public:

        /**
         * first-mount "fixup" of free space within LEBs needed
         */
        bool space_fixup();

    private:
        std::string m_padding0;
        hashes_t m_key_hash;
        key_formats_t m_key_fmt;
        uint32_t m_flags;
        uint32_t m_min_io_size;
        uint32_t m_leb_size;
        uint32_t m_num_lebs;
        uint32_t m_max_num_lebs;
        uint64_t m_max_bud_bytes;
        uint32_t m_num_log_lebs;
        uint32_t m_num_lpt_lebs;
        uint32_t m_num_orphan_lebs;
        uint32_t m_num_journal_heads;
        uint32_t m_fanout;
        uint32_t m_num_save_table_entries;
        uint32_t m_fmt_version;
        compression_t m_default_compression;
        std::string m_padding1;
        uint32_t m_reserve_pool_uid;
        uint32_t m_reserve_pool_gid;
        uint64_t m_reserve_pool_size;
        uint32_t m_time_granularity;
        std::string m_uuid;
        uint32_t m_ro_compat_version;
        std::string m_hmac;
        std::string m_hmac_wkm;
        hash_algos_t m_hash_algo;
        bool n_hash_algo;

    public:
        bool _is_null_hash_algo() { hash_algo(); return n_hash_algo; };

    private:
        uint16_t m_hash_algo_unused;
        bool n_hash_algo_unused;

    public:
        bool _is_null_hash_algo_unused() { hash_algo_unused(); return n_hash_algo_unused; };

    private:
        std::string m_hash_mst;
        std::string m_padding2;
        ubifs_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * reserved for future, zeroes
         */
        std::string padding0() const { return m_padding0; }

        /**
         * type of hash function used in keys
         */
        hashes_t key_hash() const { return m_key_hash; }

        /**
         * format of the key
         */
        key_formats_t key_fmt() const { return m_key_fmt; }

        /**
         * file-system flags (see the instances `biglpt`, `space_fixup`, etc.)
         */
        uint32_t flags() const { return m_flags; }

        /**
         * minimal input/output unit size
         */
        uint32_t min_io_size() const { return m_min_io_size; }

        /**
         * logical eraseblock size in bytes
         */
        uint32_t leb_size() const { return m_leb_size; }

        /**
         * count of LEBs used by file-system
         */
        uint32_t num_lebs() const { return m_num_lebs; }

        /**
         * maximum count of LEBs used by file-system
         */
        uint32_t max_num_lebs() const { return m_max_num_lebs; }

        /**
         * maximum amount of data stored in buds
         */
        uint64_t max_bud_bytes() const { return m_max_bud_bytes; }

        /**
         * log size in logical eraseblocks
         */
        uint32_t num_log_lebs() const { return m_num_log_lebs; }

        /**
         * number of LEBs used for lprops table
         */
        uint32_t num_lpt_lebs() const { return m_num_lpt_lebs; }

        /**
         * number of LEBs used for recording orphans
         */
        uint32_t num_orphan_lebs() const { return m_num_orphan_lebs; }

        /**
         * count of journal heads
         */
        uint32_t num_journal_heads() const { return m_num_journal_heads; }

        /**
         * tree fanout (max. number of links per indexing node)
         */
        uint32_t fanout() const { return m_fanout; }

        /**
         * number of LEB numbers in LPT's save table
         */
        uint32_t num_save_table_entries() const { return m_num_save_table_entries; }

        /**
         * UBIFS on-flash format version
         */
        uint32_t fmt_version() const { return m_fmt_version; }

        /**
         * default compression algorithm (`compression::lzo`, etc.)
         */
        compression_t default_compression() const { return m_default_compression; }

        /**
         * reserved for future, zeroes
         */
        std::string padding1() const { return m_padding1; }

        /**
         * reserve pool UID
         */
        uint32_t reserve_pool_uid() const { return m_reserve_pool_uid; }

        /**
         * reserve pool GID
         */
        uint32_t reserve_pool_gid() const { return m_reserve_pool_gid; }

        /**
         * size of the reserved pool in bytes
         */
        uint64_t reserve_pool_size() const { return m_reserve_pool_size; }

        /**
         * time granularity in nanoseconds
         */
        uint32_t time_granularity() const { return m_time_granularity; }

        /**
         * UUID generated when the file system image was created
         */
        std::string uuid() const { return m_uuid; }

        /**
         * UBIFS R/O compatibility version
         */
        uint32_t ro_compat_version() const { return m_ro_compat_version; }

        /**
         * HMAC to authenticate the superblock node
         */
        std::string hmac() const { return m_hmac; }

        /**
         * HMAC of a well known message (the string "UBIFS") as a convenience
         * to the user to check if the correct key is passed
         */
        std::string hmac_wkm() const { return m_hmac_wkm; }

        /**
         * The hash algo used for this filesystem
         * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L549-L573 Git tag "v7.2"
         */
        hash_algos_t hash_algo() const { return m_hash_algo; }

        /**
         * Unused field (would only be meaningful in an authenticated file
         * system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
         * writes it as 0.
         * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L183-L191 Git tag "v7.2"
         */
        uint16_t hash_algo_unused() const { return m_hash_algo_unused; }

        /**
         * hash of the master node, only valid for signed images in which the
         * master node does not contain a hmac
         */
        std::string hash_mst() const { return m_hash_mst; }

        /**
         * reserved for future, zeroes
         */
        std::string padding2() const { return m_padding2; }
        ubifs_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class superblock_node_t : public kaitai::kstruct {

    public:

        superblock_node_t(kaitai::kstream* p__io, ubifs_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~superblock_node_t();

    private:
        std::unique_ptr<common_header_t> m_header;
        std::unique_ptr<superblock_header_t> m_node_header;
        ubifs_t* m__root;
        ubifs_t* m__parent;
        std::string m__raw_node_header;
        std::unique_ptr<kaitai::kstream> m__io__raw_node_header;

    public:
        common_header_t* header() const { return m_header.get(); }
        superblock_header_t* node_header() const { return m_node_header.get(); }
        ubifs_t* _root() const { return m__root; }
        ubifs_t* _parent() const { return m__parent; }
        std::string _raw_node_header() const { return m__raw_node_header; }
        kaitai::kstream* _io__raw_node_header() const { return m__io__raw_node_header.get(); }
    };

    /**
     * This node exists only in the journal and never goes to the main area.
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604 Git tag "v7.2"
     */

    class truncation_header_t : public kaitai::kstruct {

    public:

        truncation_header_t(kaitai::kstream* p__io, ubifs_t::block_t* p__parent = nullptr, ubifs_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~truncation_header_t();

    private:
        uint32_t m_inode_number;
        std::string m_padding;
        uint64_t m_old_size;
        uint64_t m_new_size;
        ubifs_t* m__root;
        ubifs_t::block_t* m__parent;

    public:

        /**
         * truncated inode number
         */
        uint32_t inode_number() const { return m_inode_number; }

        /**
         * reserved for future, zeroes
         */
        std::string padding() const { return m_padding; }

        /**
         * size before truncation
         */
        uint64_t old_size() const { return m_old_size; }

        /**
         * size after truncation
         */
        uint64_t new_size() const { return m_new_size; }
        ubifs_t* _root() const { return m__root; }
        ubifs_t::block_t* _parent() const { return m__parent; }
    };

private:
    bool f_index;
    std::unique_ptr<dummy_t> m_index;

public:

    /**
     * The LEB containing the root index node, as given by `leb_root` in
     * `master_1`.
     * 
     * This instance only provides the substream for `index_root`, which can then
     * use `ofs_root` (an offset within the LEB) as its `pos` directly.
     */
    dummy_t* index();

private:
    bool f_index_root;
    std::unique_ptr<index_block_t> m_index_root;

public:

    /**
     * The root index node, in the `index` LEB at the offset given by
     * `ofs_root` in `master_1`. All other index nodes, and through them all
     * the files, are reached from it by recursively following the `target` of
     * each of the `branches`.
     */
    index_block_t* index_root();

private:
    bool f_lebs;
    std::unique_ptr<std::vector<std::string>> m_lebs;

public:

    /**
     * All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
     * at offset `n * <superblock_header>.leb_size`.
     * 
     * Accessing this instance reads the whole image into memory. To get a
     * single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
     * at the offset of that LEB.
     */
    std::vector<std::string>* lebs();

private:
    bool f_len_image;
    int32_t m_len_image;

public:

    /**
     * Length of the file system image in bytes:
     * `<superblock_header>.num_lebs` LEBs of `<superblock_header>.leb_size`
     * bytes each. Use it to find where the image ends and to detect a
     * truncated image (see the top-level `doc`).
     */
    int32_t len_image();

private:
    bool f_master_1;
    std::unique_ptr<masterblock_node_t> m_master_1;

public:

    /**
     * The first copy of the master node in LEB1. This Kaitai Struct
     * implementation uses it to locate `index_root`. In an image created by
     * `mkfs.ubifs`, it is the only copy in LEB1.
     * \sa https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633 Git tag "v2.3.1"
     */
    masterblock_node_t* master_1();

private:
    bool f_master_2;
    std::unique_ptr<masterblock_node_t> m_master_2;

public:

    /**
     * The first copy of the master node in LEB2. In an image created by
     * `mkfs.ubifs`, it is the same as `master_1` except for the sequence
     * number and CRC in the common header. Linux keeps the master node in both
     * LEB1 and LEB2 for redundancy, and when mounting, it checks that the
     * copies in both match.
     * \sa https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633 Git tag "v2.3.1"
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L115-L130 Git tag "v7.2"
     */
    masterblock_node_t* master_2();

private:
    bool f_superblock;
    std::unique_ptr<superblock_node_t> m_superblock;

public:

    /**
     * The superblock node will always be at the start of
     * the first LEB.
     */
    superblock_node_t* superblock();

private:
    ubifs_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_index;
    std::unique_ptr<kaitai::kstream> m__io__raw_index;
    std::string m__raw_master_1;
    std::unique_ptr<kaitai::kstream> m__io__raw_master_1;
    std::string m__raw_master_2;
    std::unique_ptr<kaitai::kstream> m__io__raw_master_2;

public:
    ubifs_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_index() const { return m__raw_index; }
    kaitai::kstream* _io__raw_index() const { return m__io__raw_index.get(); }
    std::string _raw_master_1() const { return m__raw_master_1; }
    kaitai::kstream* _io__raw_master_1() const { return m__io__raw_master_1.get(); }
    std::string _raw_master_2() const { return m__raw_master_2; }
    kaitai::kstream* _io__raw_master_2() const { return m__io__raw_master_2.get(); }
};
