<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

namespace {
    class TplinkMinifs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \TplinkMinifs\MinifsHeader($this->_io, $this, $this->_root);
            switch ($this->header()->version()) {
                case 1:
                    $this->_m_body = new \TplinkMinifs\BodyV1($this->_io, $this, $this->_root);
                    break;
                case 2:
                    $this->_m_body = new \TplinkMinifs\BodyV2($this->_io, $this, $this->_root);
                    break;
                case 3:
                    $this->_m_body = new \TplinkMinifs\BodyV3($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_header;
        protected $_m_body;
        public function header() { return $this->_m_header; }
        public function body() { return $this->_m_body; }
    }
}

namespace TplinkMinifs {
    class BodyV1 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\TplinkMinifs $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_inodes = [];
            $n = $this->_root()->header()->numFiles();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_inodes[] = new \TplinkMinifs\InodeV1(($i != 0 ? $this->inodes()[$i - 1]->ofsEnd() : 0), $this->_io, $this, $this->_root);
            }
            $this->_m__raw_blobsArea = $this->_io->readBytes($this->inodes()[count($this->inodes()) - 1]->ofsEnd());
            $_io__raw_blobsArea = new \Kaitai\Struct\Stream($this->_m__raw_blobsArea);
            $this->_m_blobsArea = new \TplinkMinifs\Dummy($_io__raw_blobsArea, $this, $this->_root);
        }
        protected $_m_inodes;
        protected $_m_blobsArea;
        protected $_m__raw_blobsArea;
        public function inodes() { return $this->_m_inodes; }
        public function blobsArea() { return $this->_m_blobsArea; }
        public function _raw_blobsArea() { return $this->_m__raw_blobsArea; }
    }
}

namespace TplinkMinifs {
    class BodyV2 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\TplinkMinifs $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenFilesArea = $this->_io->readU4be();
            $this->_m__raw_filesArea = $this->_io->readBytes($this->lenFilesArea());
            $_io__raw_filesArea = new \Kaitai\Struct\Stream($this->_m__raw_filesArea);
            $this->_m_filesArea = new \TplinkMinifs\FilesAreaV2($_io__raw_filesArea, $this, $this->_root);
        }
        protected $_m_lenFilesArea;
        protected $_m_filesArea;
        protected $_m__raw_filesArea;
        public function lenFilesArea() { return $this->_m_lenFilesArea; }
        public function filesArea() { return $this->_m_filesArea; }
        public function _raw_filesArea() { return $this->_m__raw_filesArea; }
    }
}

namespace TplinkMinifs {
    class BodyV3 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\TplinkMinifs $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenNameTable = $this->_io->readU4be();
            $this->_m__raw_nameTable = $this->_io->readBytes($this->lenNameTable());
            $_io__raw_nameTable = new \Kaitai\Struct\Stream($this->_m__raw_nameTable);
            $this->_m_nameTable = new \TplinkMinifs\NameTable($_io__raw_nameTable, $this, $this->_root);
            $this->_m_inodes = [];
            $n = $this->_root()->header()->numFiles();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_inodes[] = new \TplinkMinifs\Inode(($i != 0 ? $this->inodes()[$i - 1]->curMaxLzmaBlob() : 0), $this->_io, $this, $this->_root);
            }
            if ($this->ofsLzmaMetas() < 0) {
                $this->_m__unnamed3 = $this->_io->readBytes(0);
            }
            $this->_m_lzmaMetas = [];
            $n = $this->numLzmaBlobs();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_lzmaMetas[] = new \TplinkMinifs\LzmaMeta(($i != 0 ? $this->lzmaMetas()[$i - 1]->ofsEnd() : 0), $this->_io, $this, $this->_root);
            }
            $this->_m__raw_lzmaBlobsArea = $this->_io->readBytes($this->lzmaMetas()[count($this->lzmaMetas()) - 1]->ofsEnd());
            $_io__raw_lzmaBlobsArea = new \Kaitai\Struct\Stream($this->_m__raw_lzmaBlobsArea);
            $this->_m_lzmaBlobsArea = new \TplinkMinifs\Dummy($_io__raw_lzmaBlobsArea, $this, $this->_root);
        }
        protected $_m_has8ByteLzmaMetas;

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
        public function has8ByteLzmaMetas() {
            if ($this->_m_has8ByteLzmaMetas !== null)
                return $this->_m_has8ByteLzmaMetas;
            $this->_m_has8ByteLzmaMetas = $this->lenFirstBlobUncompressedIf8ByteMetas() == -1;
            return $this->_m_has8ByteLzmaMetas;
        }
        protected $_m_lenFirstBlobUncompressedIf8ByteMetas;

        /**
         * The uncompressed size in the `.lzma` header of the first blob, if
         * `lzma_metas` have 8-byte records. It follows the properties byte and the
         * 4-byte dictionary size.
         */
        public function lenFirstBlobUncompressedIf8ByteMetas() {
            if ($this->_m_lenFirstBlobUncompressedIf8ByteMetas !== null)
                return $this->_m_lenFirstBlobUncompressedIf8ByteMetas;
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->ofsLzmaMetas() + 8 * $this->numLzmaBlobs()) + 5);
            $this->_m_lenFirstBlobUncompressedIf8ByteMetas = $this->_io->readU8le();
            $this->_io->seek($_pos);
            return $this->_m_lenFirstBlobUncompressedIf8ByteMetas;
        }
        protected $_m_lenLzmaMeta;

        /**
         * The size of each record in `lzma_metas` (8 or 12 bytes).
         */
        public function lenLzmaMeta() {
            if ($this->_m_lenLzmaMeta !== null)
                return $this->_m_lenLzmaMeta;
            $this->_m_lenLzmaMeta = ($this->has8ByteLzmaMetas() ? 8 : 12);
            return $this->_m_lenLzmaMeta;
        }
        protected $_m_numLzmaBlobs;

        /**
         * Count starts at 0, so there is one more blob than the highest blob number
         */
        public function numLzmaBlobs() {
            if ($this->_m_numLzmaBlobs !== null)
                return $this->_m_numLzmaBlobs;
            $this->_m_numLzmaBlobs = $this->inodes()[count($this->inodes()) - 1]->curMaxLzmaBlob() + 1;
            return $this->_m_numLzmaBlobs;
        }
        protected $_m_ofsLzmaMetas;
        public function ofsLzmaMetas() {
            if ($this->_m_ofsLzmaMetas !== null)
                return $this->_m_ofsLzmaMetas;
            $this->_m_ofsLzmaMetas = $this->_io()->pos();
            return $this->_m_ofsLzmaMetas;
        }
        protected $_m_lenNameTable;
        protected $_m_nameTable;
        protected $_m_inodes;
        protected $_m__unnamed3;
        protected $_m_lzmaMetas;
        protected $_m_lzmaBlobsArea;
        protected $_m__raw_nameTable;
        protected $_m__raw_lzmaBlobsArea;
        public function lenNameTable() { return $this->_m_lenNameTable; }
        public function nameTable() { return $this->_m_nameTable; }
        public function inodes() { return $this->_m_inodes; }
        public function _unnamed3() { return $this->_m__unnamed3; }
        public function lzmaMetas() { return $this->_m_lzmaMetas; }
        public function lzmaBlobsArea() { return $this->_m_lzmaBlobsArea; }
        public function _raw_nameTable() { return $this->_m__raw_nameTable; }
        public function _raw_lzmaBlobsArea() { return $this->_m__raw_lzmaBlobsArea; }
    }
}

namespace TplinkMinifs {
    class Dummy extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

namespace TplinkMinifs {
    class FileV2 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\TplinkMinifs\FilesAreaV2 $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_pathMd5 = $this->_io->readBytes(16);
            $this->_m_lenData = $this->_io->readU4be();
            $this->_m_ofsData = $this->_io->readU4be();
            if (!($this->_m_ofsData == $this->_io()->pos() + 8)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError($this->_io()->pos() + 8, $this->_m_ofsData, $this->_io, "/types/file_v2/seq/2");
            }
            $this->_m_lenDataUncompressed = $this->_io->readU4be();
            $this->_m_compression = $this->_io->readU4be();
            $this->_m_data = $this->_io->readBytes($this->lenData());
        }
        protected $_m_pathMd5;
        protected $_m_lenData;
        protected $_m_ofsData;
        protected $_m_lenDataUncompressed;
        protected $_m_compression;
        protected $_m_data;

        /**
         * The MD5 hash of the absolute path of the file, e.g. of
         * `/conf/priv-key.pem`.
         * 
         * Version 2 images store only these hashes, not the paths, so a path can
         * only be found by hashing candidate paths and comparing.
         * [`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
         * takes the candidates from path-like strings in the files' contents.
         */
        public function pathMd5() { return $this->_m_pathMd5; }
        public function lenData() { return $this->_m_lenData; }

        /**
         * Offset of `data` relative to the start of `<body_v2>.files_area`.
         */
        public function ofsData() { return $this->_m_ofsData; }
        public function lenDataUncompressed() { return $this->_m_lenDataUncompressed; }
        public function compression() { return $this->_m_compression; }

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
        public function data() { return $this->_m_data; }
    }
}

namespace TplinkMinifs {
    class FilesAreaV2 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\TplinkMinifs\BodyV2 $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_files = [];
            $n = $this->_root()->header()->numFiles();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_files[] = new \TplinkMinifs\FileV2($this->_io, $this, $this->_root);
            }
        }
        protected $_m_files;
        public function files() { return $this->_m_files; }
    }
}

namespace TplinkMinifs {
    class Inode extends \Kaitai\Struct\Struct {
        public function __construct(int $prevMaxLzmaBlob, \Kaitai\Struct\Stream $_io, ?\TplinkMinifs\BodyV3 $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_prevMaxLzmaBlob = $prevMaxLzmaBlob;
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsDirectoryPath = $this->_io->readU4be();
            $this->_m_ofsFileName = $this->_io->readU4be();
            $this->_m_lzmaBlob = $this->_io->readU4be();
            $this->_m_ofsFile = $this->_io->readU4be();
            $this->_m_lenFile = $this->_io->readU4be();
        }
        protected $_m_curMaxLzmaBlob;
        public function curMaxLzmaBlob() {
            if ($this->_m_curMaxLzmaBlob !== null)
                return $this->_m_curMaxLzmaBlob;
            $this->_m_curMaxLzmaBlob = ($this->lzmaBlob() > $this->prevMaxLzmaBlob() ? $this->lzmaBlob() : $this->prevMaxLzmaBlob());
            return $this->_m_curMaxLzmaBlob;
        }
        protected $_m_directoryPath;
        public function directoryPath() {
            if ($this->_m_directoryPath !== null)
                return $this->_m_directoryPath;
            $io = $this->_parent()->nameTable()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsDirectoryPath());
            $this->_m_directoryPath = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
            $io->seek($_pos);
            return $this->_m_directoryPath;
        }
        protected $_m_fileName;
        public function fileName() {
            if ($this->_m_fileName !== null)
                return $this->_m_fileName;
            $io = $this->_parent()->nameTable()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsFileName());
            $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
            $io->seek($_pos);
            return $this->_m_fileName;
        }
        protected $_m_ofsDirectoryPath;
        protected $_m_ofsFileName;
        protected $_m_lzmaBlob;
        protected $_m_ofsFile;
        protected $_m_lenFile;
        protected $_m_prevMaxLzmaBlob;
        public function ofsDirectoryPath() { return $this->_m_ofsDirectoryPath; }
        public function ofsFileName() { return $this->_m_ofsFileName; }
        public function lzmaBlob() { return $this->_m_lzmaBlob; }
        public function ofsFile() { return $this->_m_ofsFile; }
        public function lenFile() { return $this->_m_lenFile; }
        public function prevMaxLzmaBlob() { return $this->_m_prevMaxLzmaBlob; }
    }
}

namespace TplinkMinifs {
    class InodeV1 extends \Kaitai\Struct\Struct {
        public function __construct(int $prevOfsEnd, \Kaitai\Struct\Stream $_io, ?\TplinkMinifs\BodyV1 $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_prevOfsEnd = $prevOfsEnd;
            $this->_read();
        }

        private function _read() {
            $this->_m_path = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(80), 0, false), "ASCII");
            $this->_m_lenBlob = $this->_io->readU4be();
            $this->_m_ofsBlob = $this->_io->readU4be();
            if (!($this->_m_ofsBlob == $this->prevOfsEnd())) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError($this->prevOfsEnd(), $this->_m_ofsBlob, $this->_io, "/types/inode_v1/seq/2");
            }
        }
        protected $_m_blob;

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
        public function blob() {
            if ($this->_m_blob !== null)
                return $this->_m_blob;
            $io = $this->_parent()->blobsArea()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsBlob());
            $this->_m_blob = $io->readBytes($this->lenBlob());
            $io->seek($_pos);
            return $this->_m_blob;
        }
        protected $_m_ofsEnd;
        public function ofsEnd() {
            if ($this->_m_ofsEnd !== null)
                return $this->_m_ofsEnd;
            $this->_m_ofsEnd = $this->ofsBlob() + $this->lenBlob();
            return $this->_m_ofsEnd;
        }
        protected $_m_path;
        protected $_m_lenBlob;
        protected $_m_ofsBlob;
        protected $_m_prevOfsEnd;
        public function path() { return $this->_m_path; }
        public function lenBlob() { return $this->_m_lenBlob; }

        /**
         * Relative to the start of `<body_v1>.blobs_area`.
         */
        public function ofsBlob() { return $this->_m_ofsBlob; }
        public function prevOfsEnd() { return $this->_m_prevOfsEnd; }
    }
}

namespace TplinkMinifs {
    class LzmaMeta extends \Kaitai\Struct\Struct {
        public function __construct(int $prevOfsEnd, \Kaitai\Struct\Stream $_io, ?\TplinkMinifs\BodyV3 $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_prevOfsEnd = $prevOfsEnd;
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsBlob = $this->_io->readU4be();
            if (!($this->_m_ofsBlob == $this->prevOfsEnd())) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError($this->prevOfsEnd(), $this->_m_ofsBlob, $this->_io, "/types/lzma_meta/seq/0");
            }
            $this->_m_lenBlob = $this->_io->readU4be();
            if (!($this->_parent()->has8ByteLzmaMetas())) {
                $this->_m_lenBlobUncompressed = $this->_io->readU4be();
            }
        }
        protected $_m_blob;

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
         */
        public function blob() {
            if ($this->_m_blob !== null)
                return $this->_m_blob;
            $io = $this->_parent()->lzmaBlobsArea()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsBlob());
            $this->_m_blob = $io->readBytes($this->lenBlob());
            $io->seek($_pos);
            return $this->_m_blob;
        }
        protected $_m_ofsEnd;
        public function ofsEnd() {
            if ($this->_m_ofsEnd !== null)
                return $this->_m_ofsEnd;
            $this->_m_ofsEnd = $this->ofsBlob() + $this->lenBlob();
            return $this->_m_ofsEnd;
        }
        protected $_m_ofsBlob;
        protected $_m_lenBlob;
        protected $_m_lenBlobUncompressed;
        protected $_m_prevOfsEnd;
        public function ofsBlob() { return $this->_m_ofsBlob; }
        public function lenBlob() { return $this->_m_lenBlob; }
        public function lenBlobUncompressed() { return $this->_m_lenBlobUncompressed; }
        public function prevOfsEnd() { return $this->_m_prevOfsEnd; }
    }
}

namespace TplinkMinifs {
    class MinifsHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\TplinkMinifs $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(16);
            if (!($this->_m_magic == "\x4D\x49\x4E\x49\x46\x53\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4D\x49\x4E\x49\x46\x53\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", $this->_m_magic, $this->_io, "/types/minifs_header/seq/0");
            }
            $this->_m_version = $this->_io->readU4be();
            if (!( (($this->_m_version == 1) || ($this->_m_version == 2) || ($this->_m_version == 3)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_version, $this->_io, "/types/minifs_header/seq/1");
            }
            $this->_m_numFiles = $this->_io->readU4be();
            $this->_m_lenLargestFile = $this->_io->readU4be();
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_numFiles;
        protected $_m_lenLargestFile;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
        public function numFiles() { return $this->_m_numFiles; }

        /**
         * The uncompressed size of the largest file. In all images examined with
         * version 3, the inodes are sorted by size in descending order, so it is
         * also the size of the first file. In all images examined with versions
         * 1 and 2, the value is rounded up to a multiple of 4.
         */
        public function lenLargestFile() { return $this->_m_lenLargestFile; }
    }
}

/**
 * Table of null-terminated directory paths and file names, referenced by
 * `<inode>.ofs_directory_path` and `<inode>.ofs_file_name`. In all images
 * examined, each non-empty string occurs only once, which saves space in
 * flash memory, as many files share a directory or a name.
 * 
 * In all images examined, the table is padded with null bytes to a multiple
 * of 4 bytes, so `names` can end with up to 3 empty strings (one for each
 * padding byte).
 */

namespace TplinkMinifs {
    class NameTable extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\TplinkMinifs\BodyV3 $_parent = null, ?\TplinkMinifs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_names = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_names[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
                $i++;
            }
        }
        protected $_m_names;
        public function names() { return $this->_m_names; }
    }
}

namespace TplinkMinifs {
    class CompressionType {

        /**
         * The only value in all images examined.
         */
        const LZMA = 0;
        const RAW = 2;
        const LZMA_2014 = 4;

        private const _VALUES = [0 => true, 2 => true, 4 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
