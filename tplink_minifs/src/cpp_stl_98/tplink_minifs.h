#ifndef TPLINK_MINIFS_H_
#define TPLINK_MINIFS_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class tplink_minifs_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * MiniFS is a file system found in certain firmware files from TP-Link
 * (including its Mercusys brand) and Mercury. Such firmware contains an RTOS
 * kernel, e.g. VxWorks in
 * [`RE450(V4)_210531.zip`](https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip)
 * ([archived](https://web.archive.org/web/20261105175157/https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip))
 * or TPOS, TP-Link's RTOS, in
 * [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
 * ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
 * 
 * According to a TP-Link manager quoted in a
 * [2021 article](https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)
 * ([archived](https://web.archive.org/web/20230513175833/https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)),
 * Mercusys has been sold in China as Mercury since 2001. All Mercury images
 * examined contain a certificate with `O=tplink` in its issuer and subject.
 * 
 * All versions share the same header, and its `version` field determines the
 * layout of the rest of the image.
 * 
 * In version 3, the header is followed by a table of directory paths and file
 * names, followed by meta information for each file, meta information about
 * the LZMA compressed blobs including length, offset and uncompressed length,
 * and then a number of LZMA compressed blobs.
 * 
 * The LZMA blobs can contain the concatenated contents of multiple files.
 * The meta information of a file contains the offsets of its directory path
 * and file name, the LZMA blob (numbering starts at 0), the offset of the file
 * in the uncompressed data and the size of the uncompressed file.
 * 
 * Some version 3 images have no uncompressed length in the meta information
 * about the blobs (see `has_8_byte_lzma_metas` in `body_v3`).
 * 
 * In version 2, the header is followed by the length of the files area and a
 * meta information record for each file, each followed directly by the file's
 * data. Unlike versions 1 and 3, version 2 stores no paths or file names at
 * all, only the MD5 hash of each file's path.
 * 
 * In version 1, the header is followed by a record with the path, the compressed
 * length and the offset of each file, and then one LZMA blob per file.
 * 
 * This Kaitai Struct implementation was written independently of the paper
 * [Reverse Engineered MiniFS File System](https://arxiv.org/abs/2407.05064v1).
 * It was started in the firmware analysis project
 * [BANG](https://github.com/armijnhemel/binaryanalysis-ng) (Binary Analysis
 * Next Generation) in
 * [2021](https://github.com/armijnhemel/binaryanalysis-ng/commit/531203a076e3761116320b77b2b9c64a9dca6186)
 * and submitted to the Kaitai Struct format gallery in
 * [September 2023](https://github.com/kaitai-io/kaitai_struct_formats/pull/682),
 * whereas the paper was published in July 2024.
 * \sa https://arxiv.org/html/2407.05064v1#S4 The paper, section 4 (version 3)
 * \sa https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py tp_research's `Minifs.py` (version 2)
 * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py unblob's MiniFS handler (version 3)
 */

class tplink_minifs_t : public kaitai::kstruct {

public:
    class body_v1_t;
    class body_v2_t;
    class body_v3_t;
    class dummy_t;
    class file_v2_t;
    class files_area_v2_t;
    class inode_t;
    class inode_v1_t;
    class lzma_meta_t;
    class minifs_header_t;
    class name_table_t;

    enum compression_type_t {
        COMPRESSION_TYPE_LZMA = 0,
        COMPRESSION_TYPE_RAW = 2,
        COMPRESSION_TYPE_LZMA_2014 = 4
    };
    static bool _is_defined_compression_type_t(compression_type_t v);

private:
    static const std::set<compression_type_t> _values_compression_type_t;
    static std::set<compression_type_t> _build_values_compression_type_t();

public:

    tplink_minifs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tplink_minifs_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~tplink_minifs_t();

    /**
     * \sa https://arxiv.org/html/2407.05064v1#S2.SS2 Source
     */

    class body_v1_t : public kaitai::kstruct {

    public:

        body_v1_t(kaitai::kstream* p__io, tplink_minifs_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~body_v1_t();

    private:
        std::vector<inode_v1_t*>* m_inodes;
        dummy_t* m_blobs_area;
        tplink_minifs_t* m__root;
        tplink_minifs_t* m__parent;
        std::string m__raw_blobs_area;
        kaitai::kstream* m__io__raw_blobs_area;

    public:
        std::vector<inode_v1_t*>* inodes() const { return m_inodes; }
        dummy_t* blobs_area() const { return m_blobs_area; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t* _parent() const { return m__parent; }
        std::string _raw_blobs_area() const { return m__raw_blobs_area; }
        kaitai::kstream* _io__raw_blobs_area() const { return m__io__raw_blobs_area; }
    };

    class body_v2_t : public kaitai::kstruct {

    public:

        body_v2_t(kaitai::kstream* p__io, tplink_minifs_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~body_v2_t();

    private:
        uint32_t m_len_files_area;
        files_area_v2_t* m_files_area;
        tplink_minifs_t* m__root;
        tplink_minifs_t* m__parent;
        std::string m__raw_files_area;
        kaitai::kstream* m__io__raw_files_area;

    public:
        uint32_t len_files_area() const { return m_len_files_area; }
        files_area_v2_t* files_area() const { return m_files_area; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t* _parent() const { return m__parent; }
        std::string _raw_files_area() const { return m__raw_files_area; }
        kaitai::kstream* _io__raw_files_area() const { return m__io__raw_files_area; }
    };

    class body_v3_t : public kaitai::kstruct {

    public:

        body_v3_t(kaitai::kstream* p__io, tplink_minifs_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~body_v3_t();

    private:
        bool f_has_8_byte_lzma_metas;
        bool m_has_8_byte_lzma_metas;

    public:

        /**
         * Whether each record in `lzma_metas` lacks `len_blob_uncompressed` and
         * is therefore 8 bytes in size instead of 12.
         * 
         * The MiniFS header doesn't say which size is used (both use version 3),
         * so this Kaitai Struct implementation infers it using a heuristic based
         * on the `.lzma` header of the first blob. Bytes 5 to 12 of that header
         * are the uncompressed size, which was unknown (all bits set) for all
         * blobs in all version 3 images examined. So with 8-byte records,
         * `len_first_blob_uncompressed_if_8_byte_metas` has all bits set. With
         * 12-byte records, the same 8 bytes aren't the uncompressed size. With 3
         * or more blobs, they include a whole offset or length in `lzma_metas`,
         * which would have to be 4 GiB. With 1 or 2 blobs, they include the
         * first blob's dictionary size, which is 8 MiB in all images examined.
         * 
         * An image with 8-byte records and a known uncompressed size would be
         * rejected, or misparsed if it has a single blob and other data follows it.
         * 
         * In the images examined, 8-byte records occur in firmware files with
         * modification times from 2018 to 2022 (as stored in their ZIPs), e.g. in
         * [`MW301R(EU)_V2_180821.zip`](https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)
         * ([archived](https://web.archive.org/web/20261105093950/https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)),
         * listed on <https://www.mercusys.com/en/download/mw301r/v2/>
         * ([archived](https://web.archive.org/web/20261105142659/https://www.mercusys.com/en/download/mw301r/v2/)).
         * 
         * As far as we know, this implementation is the first description of
         * 8-byte records. The other descriptions and tools found either assume
         * 12 bytes or don't read `lzma_metas` at all. So there is no reference
         * to compare it with, and the evidence comes from the images. In all 49
         * distinct images examined with 8-byte records, the bytes at each
         * record's offset and length are exactly one complete LZMA stream. Each
         * such stream decompresses to exactly the length that the files packed
         * into it need. The file that ends last in it ends exactly where the
         * decompressed data ends. In addition:
         * 
         * * 2614 of the 7230 files in these 49 images have the same path and
         *   contents as a file in an image with 12-byte records. For example,
         *   49 files are the same in the image with 8-byte records in
         *   [`TL-WA850RE(EU)_V7_201029.zip`](https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip)
         *   ([archived](https://web.archive.org/web/20220326032207/https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip))
         *   and the image with 12-byte records in
         *   [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
         *   ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
         * * The repository
         *   [NurMohammadDuari/mw325r-hack-lab](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45)
         *   has the [files](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45/extracted-minifs)
         *   of the image with 8-byte records in
         *   [`MW325R(EU)_V2_20111620201211065426.zip`](https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)
         *   ([archived](https://web.archive.org/web/20261105093427/https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)).
         *   They match the files parsed by this implementation in all 92 files
         *   that can be compared. Its
         *   [extractor](https://github.com/NurMohammadDuari/mw325r-hack-lab/blob/024da680dbf4f9ca287d562622f02d7d8875bd45/analysis/minifs_extract.py)
         *   finds the blobs by searching for LZMA headers instead of reading
         *   `lzma_metas`.
         */
        bool has_8_byte_lzma_metas();

    private:
        bool f_len_first_blob_uncompressed_if_8_byte_metas;
        uint64_t m_len_first_blob_uncompressed_if_8_byte_metas;

    public:

        /**
         * The uncompressed size in the `.lzma` header of the first blob, if
         * `lzma_metas` have 8-byte records. It follows the properties byte and the
         * 4-byte dictionary size.
         */
        uint64_t len_first_blob_uncompressed_if_8_byte_metas();

    private:
        bool f_len_lzma_meta;
        int8_t m_len_lzma_meta;

    public:

        /**
         * The size of each record in `lzma_metas` (8 or 12 bytes).
         */
        int8_t len_lzma_meta();

    private:
        bool f_num_lzma_blobs;
        int32_t m_num_lzma_blobs;

    public:

        /**
         * Count starts at 0, so there is one more blob than the highest blob number
         * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L129-L130 Source
         */
        int32_t num_lzma_blobs();

    private:
        bool f_ofs_lzma_metas;
        int32_t m_ofs_lzma_metas;

    public:
        int32_t ofs_lzma_metas();

    private:
        uint32_t m_len_name_table;
        name_table_t* m_name_table;
        std::vector<inode_t*>* m_inodes;
        std::string m__unnamed3;
        bool n__unnamed3;

    public:
        bool _is_null__unnamed3() { _unnamed3(); return n__unnamed3; };

    private:
        std::vector<lzma_meta_t*>* m_lzma_metas;
        dummy_t* m_lzma_blobs_area;
        tplink_minifs_t* m__root;
        tplink_minifs_t* m__parent;
        std::string m__raw_name_table;
        kaitai::kstream* m__io__raw_name_table;
        std::string m__raw_lzma_blobs_area;
        kaitai::kstream* m__io__raw_lzma_blobs_area;

    public:
        uint32_t len_name_table() const { return m_len_name_table; }
        name_table_t* name_table() const { return m_name_table; }
        std::vector<inode_t*>* inodes() const { return m_inodes; }
        std::string _unnamed3() const { return m__unnamed3; }
        std::vector<lzma_meta_t*>* lzma_metas() const { return m_lzma_metas; }
        dummy_t* lzma_blobs_area() const { return m_lzma_blobs_area; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t* _parent() const { return m__parent; }
        std::string _raw_name_table() const { return m__raw_name_table; }
        kaitai::kstream* _io__raw_name_table() const { return m__io__raw_name_table; }
        std::string _raw_lzma_blobs_area() const { return m__raw_lzma_blobs_area; }
        kaitai::kstream* _io__raw_lzma_blobs_area() const { return m__io__raw_lzma_blobs_area; }
    };

    class dummy_t : public kaitai::kstruct {

    public:

        dummy_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~dummy_t();

    private:
        tplink_minifs_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        tplink_minifs_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52 Source
     */

    class file_v2_t : public kaitai::kstruct {

    public:

        file_v2_t(kaitai::kstream* p__io, tplink_minifs_t::files_area_v2_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~file_v2_t();

    private:
        std::string m_path_md5;
        uint32_t m_len_data;
        uint32_t m_ofs_data;
        uint32_t m_len_data_uncompressed;
        compression_type_t m_compression;
        std::string m_data;
        tplink_minifs_t* m__root;
        tplink_minifs_t::files_area_v2_t* m__parent;

    public:

        /**
         * The MD5 hash of the absolute path of the file, e.g. of
         * `/conf/priv-key.pem`.
         * 
         * Version 2 images store only these hashes, not the paths, so a path can
         * only be found by hashing candidate paths and comparing.
         * [`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
         * takes the candidates from path-like strings in the files' contents.
         */
        std::string path_md5() const { return m_path_md5; }
        uint32_t len_data() const { return m_len_data; }

        /**
         * Offset of `data` relative to the start of `<body_v2>.files_area`.
         */
        uint32_t ofs_data() const { return m_ofs_data; }
        uint32_t len_data_uncompressed() const { return m_len_data_uncompressed; }
        compression_type_t compression() const { return m_compression; }

        /**
         * With `compression_type::lzma`, an LZMA stream in the `.lzma` format
         * (also known as LZMA_Alone). Decompress it in the same way as
         * `<lzma_meta>.blob`.
         * 
         * In all images examined, the `.lzma` header specifies the properties
         * lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
         * bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
         * stream, and there is no end-of-payload marker.
         */
        std::string data() const { return m_data; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t::files_area_v2_t* _parent() const { return m__parent; }
    };

    class files_area_v2_t : public kaitai::kstruct {

    public:

        files_area_v2_t(kaitai::kstream* p__io, tplink_minifs_t::body_v2_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~files_area_v2_t();

    private:
        std::vector<file_v2_t*>* m_files;
        tplink_minifs_t* m__root;
        tplink_minifs_t::body_v2_t* m__parent;

    public:
        std::vector<file_v2_t*>* files() const { return m_files; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t::body_v2_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://arxiv.org/html/2407.05064v1#S4.SS3 Source
     * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42 Source
     */

    class inode_t : public kaitai::kstruct {

    public:

        inode_t(uint32_t p_prev_max_lzma_blob, kaitai::kstream* p__io, tplink_minifs_t::body_v3_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~inode_t();

    private:
        bool f_cur_max_lzma_blob;
        int32_t m_cur_max_lzma_blob;

    public:
        int32_t cur_max_lzma_blob();

    private:
        bool f_directory_path;
        std::string m_directory_path;

    public:
        std::string directory_path();

    private:
        bool f_file_name;
        std::string m_file_name;

    public:
        std::string file_name();

    private:
        uint32_t m_ofs_directory_path;
        uint32_t m_ofs_file_name;
        uint32_t m_lzma_blob;
        uint32_t m_ofs_file;
        uint32_t m_len_file;
        uint32_t m_prev_max_lzma_blob;
        tplink_minifs_t* m__root;
        tplink_minifs_t::body_v3_t* m__parent;

    public:
        uint32_t ofs_directory_path() const { return m_ofs_directory_path; }
        uint32_t ofs_file_name() const { return m_ofs_file_name; }
        uint32_t lzma_blob() const { return m_lzma_blob; }
        uint32_t ofs_file() const { return m_ofs_file; }
        uint32_t len_file() const { return m_len_file; }
        uint32_t prev_max_lzma_blob() const { return m_prev_max_lzma_blob; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t::body_v3_t* _parent() const { return m__parent; }
    };

    class inode_v1_t : public kaitai::kstruct {

    public:

        inode_v1_t(uint32_t p_prev_ofs_end, kaitai::kstream* p__io, tplink_minifs_t::body_v1_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~inode_v1_t();

    private:
        bool f_blob;
        std::string m_blob;

    public:

        /**
         * An LZMA stream in the `.lzma` format (also known as LZMA_Alone) with
         * the contents of the file. Decompress it in the same way as
         * `<lzma_meta>.blob`.
         * 
         * In all images examined, the `.lzma` header specifies the properties
         * lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
         * bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
         * stream, and there is no end-of-payload marker.
         */
        std::string blob();

    private:
        bool f_ofs_end;
        int32_t m_ofs_end;

    public:
        int32_t ofs_end();

    private:
        std::string m_path;
        uint32_t m_len_blob;
        uint32_t m_ofs_blob;
        uint32_t m_prev_ofs_end;
        tplink_minifs_t* m__root;
        tplink_minifs_t::body_v1_t* m__parent;

    public:
        std::string path() const { return m_path; }
        uint32_t len_blob() const { return m_len_blob; }

        /**
         * Relative to the start of `<body_v1>.blobs_area`.
         */
        uint32_t ofs_blob() const { return m_ofs_blob; }
        uint32_t prev_ofs_end() const { return m_prev_ofs_end; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t::body_v1_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://arxiv.org/html/2407.05064v1#S4.SS4 Source
     * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48 Source
     */

    class lzma_meta_t : public kaitai::kstruct {

    public:

        lzma_meta_t(uint32_t p_prev_ofs_end, kaitai::kstream* p__io, tplink_minifs_t::body_v3_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~lzma_meta_t();

    private:
        bool f_blob;
        std::string m_blob;

    public:

        /**
         * An LZMA stream in the `.lzma` format (also known as LZMA_Alone):
         * a 13-byte header followed by the compressed data. Decompress it
         * with a ready-made LZMA decoder that reads this header, e.g. in
         * Python with `lzma.decompress(blob, format=lzma.FORMAT_ALONE)`. The
         * size of the decompressed data is `len_blob_uncompressed`, if present.
         * 
         * In all images examined with `header.version` = 3, the `.lzma` header
         * specifies the properties lc = 3, lp = 0, pb = 2 and an 8 MiB
         * dictionary, so it starts with the bytes `5D 00 00 80 00`. The
         * uncompressed size in the header is unknown (`0xFFFF_FFFF_FFFF_FFFF`),
         * so the stream ends with an end-of-payload marker.
         * \sa https://arxiv.org/html/2407.05064v1#S4.SS5 Source
         * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L175-L187 Source
         */
        std::string blob();

    private:
        bool f_ofs_end;
        int32_t m_ofs_end;

    public:
        int32_t ofs_end();

    private:
        uint32_t m_ofs_blob;
        uint32_t m_len_blob;
        uint32_t m_len_blob_uncompressed;
        bool n_len_blob_uncompressed;

    public:
        bool _is_null_len_blob_uncompressed() { len_blob_uncompressed(); return n_len_blob_uncompressed; };

    private:
        uint32_t m_prev_ofs_end;
        tplink_minifs_t* m__root;
        tplink_minifs_t::body_v3_t* m__parent;

    public:
        uint32_t ofs_blob() const { return m_ofs_blob; }
        uint32_t len_blob() const { return m_len_blob; }
        uint32_t len_blob_uncompressed() const { return m_len_blob_uncompressed; }
        uint32_t prev_ofs_end() const { return m_prev_ofs_end; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t::body_v3_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://arxiv.org/html/2407.05064v1#S4.SS1 Source
     * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34 Source
     */

    class minifs_header_t : public kaitai::kstruct {

    public:

        minifs_header_t(kaitai::kstream* p__io, tplink_minifs_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~minifs_header_t();

    private:
        std::string m_magic;
        uint32_t m_version;
        uint32_t m_num_files;
        uint32_t m_len_largest_file;
        tplink_minifs_t* m__root;
        tplink_minifs_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t version() const { return m_version; }
        uint32_t num_files() const { return m_num_files; }

        /**
         * The uncompressed size of the largest file. In all images examined with
         * version 3, the inodes are sorted by size in descending order, so it is
         * also the size of the first file. In all images examined with versions
         * 1 and 2, the value is rounded up to a multiple of 4.
         */
        uint32_t len_largest_file() const { return m_len_largest_file; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t* _parent() const { return m__parent; }
    };

    /**
     * Table of null-terminated directory paths and file names, referenced by
     * `<inode>.ofs_directory_path` and `<inode>.ofs_file_name`. In all images
     * examined, each non-empty string occurs only once, which saves space in
     * flash memory, as many files share a directory or a name.
     * 
     * In all images examined, the table is padded with null bytes to a multiple
     * of 4 bytes, so `names` can end with up to 3 empty strings (one for each
     * padding byte).
     * \sa https://arxiv.org/html/2407.05064v1#S4.SS2 Source
     */

    class name_table_t : public kaitai::kstruct {

    public:

        name_table_t(kaitai::kstream* p__io, tplink_minifs_t::body_v3_t* p__parent = 0, tplink_minifs_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~name_table_t();

    private:
        std::vector<std::string>* m_names;
        tplink_minifs_t* m__root;
        tplink_minifs_t::body_v3_t* m__parent;

    public:
        std::vector<std::string>* names() const { return m_names; }
        tplink_minifs_t* _root() const { return m__root; }
        tplink_minifs_t::body_v3_t* _parent() const { return m__parent; }
    };

private:
    minifs_header_t* m_header;
    kaitai::kstruct* m_body;
    bool n_body;

public:
    bool _is_null_body() { body(); return n_body; };

private:
    tplink_minifs_t* m__root;
    kaitai::kstruct* m__parent;

public:
    minifs_header_t* header() const { return m_header; }
    kaitai::kstruct* body() const { return m_body; }
    tplink_minifs_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TPLINK_MINIFS_H_
