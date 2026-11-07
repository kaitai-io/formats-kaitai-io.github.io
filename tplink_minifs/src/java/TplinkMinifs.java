// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;


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
 * @see <a href="https://arxiv.org/html/2407.05064v1#S4">The paper, section 4 (version 3)</a>
 * @see <a href="https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py">tp_research's `Minifs.py` (version 2)</a>
 * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py">unblob's MiniFS handler (version 3)</a>
 */
public class TplinkMinifs extends KaitaiStruct {
    public static TplinkMinifs fromFile(String fileName) throws IOException {
        return new TplinkMinifs(new ByteBufferKaitaiStream(fileName));
    }

    public enum CompressionType {
        LZMA(0),
        RAW(2),
        LZMA_2014(4);

        private final long id;
        CompressionType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionType> byId = new HashMap<Long, CompressionType>(3);
        static {
            for (CompressionType e : CompressionType.values())
                byId.put(e.id(), e);
        }
        public static CompressionType byId(long id) { return byId.get(id); }
    }

    public TplinkMinifs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TplinkMinifs(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public TplinkMinifs(KaitaiStream _io, KaitaiStruct _parent, TplinkMinifs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new MinifsHeader(this._io, this, _root);
        switch (header().version()) {
        case 1: {
            this.body = new BodyV1(this._io, this, _root);
            break;
        }
        case 2: {
            this.body = new BodyV2(this._io, this, _root);
            break;
        }
        case 3: {
            this.body = new BodyV3(this._io, this, _root);
            break;
        }
        }
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        switch (header().version()) {
        case 1: {
            ((BodyV1) (this.body))._fetchInstances();
            break;
        }
        case 2: {
            ((BodyV2) (this.body))._fetchInstances();
            break;
        }
        case 3: {
            ((BodyV3) (this.body))._fetchInstances();
            break;
        }
        }
    }

    /**
     * @see <a href="https://arxiv.org/html/2407.05064v1#S2.SS2">Source</a>
     */
    public static class BodyV1 extends KaitaiStruct {
        public static BodyV1 fromFile(String fileName) throws IOException {
            return new BodyV1(new ByteBufferKaitaiStream(fileName));
        }

        public BodyV1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BodyV1(KaitaiStream _io, TplinkMinifs _parent) {
            this(_io, _parent, null);
        }

        public BodyV1(KaitaiStream _io, TplinkMinifs _parent, TplinkMinifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.inodes = new ArrayList<InodeV1>();
            for (int i = 0; i < _root().header().numFiles(); i++) {
                this.inodes.add(new InodeV1(this._io, this, _root, ((Number) ((i != 0 ? inodes().get(((Number) (i - 1)).intValue()).ofsEnd() : 0))).longValue()));
            }
            KaitaiStream _io_blobsArea = this._io.substream(inodes().get(inodes().size() - 1).ofsEnd());
            this.blobsArea = new Dummy(_io_blobsArea, this, _root);
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.inodes.size(); i++) {
                this.inodes.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.blobsArea._fetchInstances();
        }
        private List<InodeV1> inodes;
        private Dummy blobsArea;
        private TplinkMinifs _root;
        private TplinkMinifs _parent;
        public List<InodeV1> inodes() { return inodes; }
        public Dummy blobsArea() { return blobsArea; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs _parent() { return _parent; }
    }
    public static class BodyV2 extends KaitaiStruct {
        public static BodyV2 fromFile(String fileName) throws IOException {
            return new BodyV2(new ByteBufferKaitaiStream(fileName));
        }

        public BodyV2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BodyV2(KaitaiStream _io, TplinkMinifs _parent) {
            this(_io, _parent, null);
        }

        public BodyV2(KaitaiStream _io, TplinkMinifs _parent, TplinkMinifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenFilesArea = this._io.readU4be();
            KaitaiStream _io_filesArea = this._io.substream(lenFilesArea());
            this.filesArea = new FilesAreaV2(_io_filesArea, this, _root);
        }

        public void _fetchInstances() {
            this.filesArea._fetchInstances();
        }
        private long lenFilesArea;
        private FilesAreaV2 filesArea;
        private TplinkMinifs _root;
        private TplinkMinifs _parent;
        public long lenFilesArea() { return lenFilesArea; }
        public FilesAreaV2 filesArea() { return filesArea; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs _parent() { return _parent; }
    }
    public static class BodyV3 extends KaitaiStruct {
        public static BodyV3 fromFile(String fileName) throws IOException {
            return new BodyV3(new ByteBufferKaitaiStream(fileName));
        }

        public BodyV3(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BodyV3(KaitaiStream _io, TplinkMinifs _parent) {
            this(_io, _parent, null);
        }

        public BodyV3(KaitaiStream _io, TplinkMinifs _parent, TplinkMinifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenNameTable = this._io.readU4be();
            KaitaiStream _io_nameTable = this._io.substream(lenNameTable());
            this.nameTable = new NameTable(_io_nameTable, this, _root);
            this.inodes = new ArrayList<Inode>();
            for (int i = 0; i < _root().header().numFiles(); i++) {
                this.inodes.add(new Inode(this._io, this, _root, ((Number) ((i != 0 ? inodes().get(((Number) (i - 1)).intValue()).curMaxLzmaBlob() : 0))).longValue()));
            }
            if (ofsLzmaMetas() < 0) {
                this._unnamed3 = this._io.readBytes(0);
            }
            this.lzmaMetas = new ArrayList<LzmaMeta>();
            for (int i = 0; i < numLzmaBlobs(); i++) {
                this.lzmaMetas.add(new LzmaMeta(this._io, this, _root, ((Number) ((i != 0 ? lzmaMetas().get(((Number) (i - 1)).intValue()).ofsEnd() : 0))).longValue()));
            }
            KaitaiStream _io_lzmaBlobsArea = this._io.substream(lzmaMetas().get(lzmaMetas().size() - 1).ofsEnd());
            this.lzmaBlobsArea = new Dummy(_io_lzmaBlobsArea, this, _root);
        }

        public void _fetchInstances() {
            this.nameTable._fetchInstances();
            for (int i = 0; i < this.inodes.size(); i++) {
                this.inodes.get(((Number) (i)).intValue())._fetchInstances();
            }
            if (ofsLzmaMetas() < 0) {
            }
            for (int i = 0; i < this.lzmaMetas.size(); i++) {
                this.lzmaMetas.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.lzmaBlobsArea._fetchInstances();
            lenFirstBlobUncompressedIf8ByteMetas();
            if (this.lenFirstBlobUncompressedIf8ByteMetas != null) {
            }
        }
        private Boolean has8ByteLzmaMetas;

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
        public Boolean has8ByteLzmaMetas() {
            if (this.has8ByteLzmaMetas != null)
                return this.has8ByteLzmaMetas;
            this.has8ByteLzmaMetas = lenFirstBlobUncompressedIf8ByteMetas() == 0xffffffffffffffffL;
            return this.has8ByteLzmaMetas;
        }
        private Long lenFirstBlobUncompressedIf8ByteMetas;

        /**
         * The uncompressed size in the `.lzma` header of the first blob, if
         * `lzma_metas` have 8-byte records. It follows the properties byte and the
         * 4-byte dictionary size.
         */
        public Long lenFirstBlobUncompressedIf8ByteMetas() {
            if (this.lenFirstBlobUncompressedIf8ByteMetas != null)
                return this.lenFirstBlobUncompressedIf8ByteMetas;
            long _pos = this._io.pos();
            this._io.seek((ofsLzmaMetas() + 8 * numLzmaBlobs()) + 5);
            this.lenFirstBlobUncompressedIf8ByteMetas = this._io.readU8le();
            this._io.seek(_pos);
            return this.lenFirstBlobUncompressedIf8ByteMetas;
        }
        private Byte lenLzmaMeta;

        /**
         * The size of each record in `lzma_metas` (8 or 12 bytes).
         */
        public Byte lenLzmaMeta() {
            if (this.lenLzmaMeta != null)
                return this.lenLzmaMeta;
            this.lenLzmaMeta = ((Number) ((has8ByteLzmaMetas() ? 8 : 12))).byteValue();
            return this.lenLzmaMeta;
        }
        private Integer numLzmaBlobs;

        /**
         * Count starts at 0, so there is one more blob than the highest blob number
         * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L129-L130">Source</a>
         */
        public Integer numLzmaBlobs() {
            if (this.numLzmaBlobs != null)
                return this.numLzmaBlobs;
            this.numLzmaBlobs = ((Number) (inodes().get(inodes().size() - 1).curMaxLzmaBlob() + 1)).intValue();
            return this.numLzmaBlobs;
        }
        private Integer ofsLzmaMetas;
        public Integer ofsLzmaMetas() {
            if (this.ofsLzmaMetas != null)
                return this.ofsLzmaMetas;
            this.ofsLzmaMetas = ((Number) (_io().pos())).intValue();
            return this.ofsLzmaMetas;
        }
        private long lenNameTable;
        private NameTable nameTable;
        private List<Inode> inodes;
        private byte[] _unnamed3;
        private List<LzmaMeta> lzmaMetas;
        private Dummy lzmaBlobsArea;
        private TplinkMinifs _root;
        private TplinkMinifs _parent;
        public long lenNameTable() { return lenNameTable; }
        public NameTable nameTable() { return nameTable; }
        public List<Inode> inodes() { return inodes; }
        public byte[] _unnamed3() { return _unnamed3; }
        public List<LzmaMeta> lzmaMetas() { return lzmaMetas; }
        public Dummy lzmaBlobsArea() { return lzmaBlobsArea; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs _parent() { return _parent; }
    }
    public static class Dummy extends KaitaiStruct {
        public static Dummy fromFile(String fileName) throws IOException {
            return new Dummy(new ByteBufferKaitaiStream(fileName));
        }

        public Dummy(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Dummy(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Dummy(KaitaiStream _io, KaitaiStruct _parent, TplinkMinifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
        }

        public void _fetchInstances() {
        }
        private TplinkMinifs _root;
        private KaitaiStruct _parent;
        public TplinkMinifs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52">Source</a>
     */
    public static class FileV2 extends KaitaiStruct {
        public static FileV2 fromFile(String fileName) throws IOException {
            return new FileV2(new ByteBufferKaitaiStream(fileName));
        }

        public FileV2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileV2(KaitaiStream _io, TplinkMinifs.FilesAreaV2 _parent) {
            this(_io, _parent, null);
        }

        public FileV2(KaitaiStream _io, TplinkMinifs.FilesAreaV2 _parent, TplinkMinifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.pathMd5 = this._io.readBytes(16);
            this.lenData = this._io.readU4be();
            this.ofsData = this._io.readU4be();
            if (!(this.ofsData == _io().pos() + 8)) {
                throw new KaitaiStream.ValidationNotEqualError(_io().pos() + 8, this.ofsData, this._io, "/types/file_v2/seq/2");
            }
            this.lenDataUncompressed = this._io.readU4be();
            this.compression = TplinkMinifs.CompressionType.byId(this._io.readU4be());
            this.data = this._io.readBytes(lenData());
        }

        public void _fetchInstances() {
        }
        private byte[] pathMd5;
        private long lenData;
        private long ofsData;
        private long lenDataUncompressed;
        private CompressionType compression;
        private byte[] data;
        private TplinkMinifs _root;
        private TplinkMinifs.FilesAreaV2 _parent;

        /**
         * The MD5 hash of the absolute path of the file, e.g. of
         * `/conf/priv-key.pem`.
         * 
         * Version 2 images store only these hashes, not the paths, so a path can
         * only be found by hashing candidate paths and comparing.
         * [`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
         * takes the candidates from path-like strings in the files' contents.
         */
        public byte[] pathMd5() { return pathMd5; }
        public long lenData() { return lenData; }

        /**
         * Offset of `data` relative to the start of `<body_v2>.files_area`.
         */
        public long ofsData() { return ofsData; }
        public long lenDataUncompressed() { return lenDataUncompressed; }
        public CompressionType compression() { return compression; }

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
        public byte[] data() { return data; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs.FilesAreaV2 _parent() { return _parent; }
    }
    public static class FilesAreaV2 extends KaitaiStruct {
        public static FilesAreaV2 fromFile(String fileName) throws IOException {
            return new FilesAreaV2(new ByteBufferKaitaiStream(fileName));
        }

        public FilesAreaV2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FilesAreaV2(KaitaiStream _io, TplinkMinifs.BodyV2 _parent) {
            this(_io, _parent, null);
        }

        public FilesAreaV2(KaitaiStream _io, TplinkMinifs.BodyV2 _parent, TplinkMinifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.files = new ArrayList<FileV2>();
            for (int i = 0; i < _root().header().numFiles(); i++) {
                this.files.add(new FileV2(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.files.size(); i++) {
                this.files.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<FileV2> files;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV2 _parent;
        public List<FileV2> files() { return files; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs.BodyV2 _parent() { return _parent; }
    }

    /**
     * @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS3">Source</a>
     * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42">Source</a>
     */
    public static class Inode extends KaitaiStruct {

        public Inode(KaitaiStream _io, long prevMaxLzmaBlob) {
            this(_io, null, null, prevMaxLzmaBlob);
        }

        public Inode(KaitaiStream _io, TplinkMinifs.BodyV3 _parent, long prevMaxLzmaBlob) {
            this(_io, _parent, null, prevMaxLzmaBlob);
        }

        public Inode(KaitaiStream _io, TplinkMinifs.BodyV3 _parent, TplinkMinifs _root, long prevMaxLzmaBlob) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.prevMaxLzmaBlob = prevMaxLzmaBlob;
            _read();
        }
        private void _read() {
            this.ofsDirectoryPath = this._io.readU4be();
            this.ofsFileName = this._io.readU4be();
            this.lzmaBlob = this._io.readU4be();
            this.ofsFile = this._io.readU4be();
            this.lenFile = this._io.readU4be();
        }

        public void _fetchInstances() {
            directoryPath();
            if (this.directoryPath != null) {
            }
            fileName();
            if (this.fileName != null) {
            }
        }
        private Integer curMaxLzmaBlob;
        public Integer curMaxLzmaBlob() {
            if (this.curMaxLzmaBlob != null)
                return this.curMaxLzmaBlob;
            this.curMaxLzmaBlob = ((Number) ((lzmaBlob() > prevMaxLzmaBlob() ? lzmaBlob() : prevMaxLzmaBlob()))).intValue();
            return this.curMaxLzmaBlob;
        }
        private String directoryPath;
        public String directoryPath() {
            if (this.directoryPath != null)
                return this.directoryPath;
            KaitaiStream io = _parent().nameTable()._io();
            long _pos = io.pos();
            io.seek(ofsDirectoryPath());
            this.directoryPath = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            io.seek(_pos);
            return this.directoryPath;
        }
        private String fileName;
        public String fileName() {
            if (this.fileName != null)
                return this.fileName;
            KaitaiStream io = _parent().nameTable()._io();
            long _pos = io.pos();
            io.seek(ofsFileName());
            this.fileName = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            io.seek(_pos);
            return this.fileName;
        }
        private long ofsDirectoryPath;
        private long ofsFileName;
        private long lzmaBlob;
        private long ofsFile;
        private long lenFile;
        private long prevMaxLzmaBlob;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV3 _parent;
        public long ofsDirectoryPath() { return ofsDirectoryPath; }
        public long ofsFileName() { return ofsFileName; }
        public long lzmaBlob() { return lzmaBlob; }
        public long ofsFile() { return ofsFile; }
        public long lenFile() { return lenFile; }
        public long prevMaxLzmaBlob() { return prevMaxLzmaBlob; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs.BodyV3 _parent() { return _parent; }
    }
    public static class InodeV1 extends KaitaiStruct {

        public InodeV1(KaitaiStream _io, long prevOfsEnd) {
            this(_io, null, null, prevOfsEnd);
        }

        public InodeV1(KaitaiStream _io, TplinkMinifs.BodyV1 _parent, long prevOfsEnd) {
            this(_io, _parent, null, prevOfsEnd);
        }

        public InodeV1(KaitaiStream _io, TplinkMinifs.BodyV1 _parent, TplinkMinifs _root, long prevOfsEnd) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.prevOfsEnd = prevOfsEnd;
            _read();
        }
        private void _read() {
            this.path = new String(KaitaiStream.bytesTerminate(this._io.readBytes(80), (byte) 0, false), StandardCharsets.US_ASCII);
            this.lenBlob = this._io.readU4be();
            this.ofsBlob = this._io.readU4be();
            if (!(this.ofsBlob == prevOfsEnd())) {
                throw new KaitaiStream.ValidationNotEqualError(prevOfsEnd(), this.ofsBlob, this._io, "/types/inode_v1/seq/2");
            }
        }

        public void _fetchInstances() {
            blob();
            if (this.blob != null) {
            }
        }
        private byte[] blob;

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
        public byte[] blob() {
            if (this.blob != null)
                return this.blob;
            KaitaiStream io = _parent().blobsArea()._io();
            long _pos = io.pos();
            io.seek(ofsBlob());
            this.blob = io.readBytes(lenBlob());
            io.seek(_pos);
            return this.blob;
        }
        private Integer ofsEnd;
        public Integer ofsEnd() {
            if (this.ofsEnd != null)
                return this.ofsEnd;
            this.ofsEnd = ((Number) (ofsBlob() + lenBlob())).intValue();
            return this.ofsEnd;
        }
        private String path;
        private long lenBlob;
        private long ofsBlob;
        private long prevOfsEnd;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV1 _parent;
        public String path() { return path; }
        public long lenBlob() { return lenBlob; }

        /**
         * Relative to the start of `<body_v1>.blobs_area`.
         */
        public long ofsBlob() { return ofsBlob; }
        public long prevOfsEnd() { return prevOfsEnd; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs.BodyV1 _parent() { return _parent; }
    }

    /**
     * @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS4">Source</a>
     * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48">Source</a>
     */
    public static class LzmaMeta extends KaitaiStruct {

        public LzmaMeta(KaitaiStream _io, long prevOfsEnd) {
            this(_io, null, null, prevOfsEnd);
        }

        public LzmaMeta(KaitaiStream _io, TplinkMinifs.BodyV3 _parent, long prevOfsEnd) {
            this(_io, _parent, null, prevOfsEnd);
        }

        public LzmaMeta(KaitaiStream _io, TplinkMinifs.BodyV3 _parent, TplinkMinifs _root, long prevOfsEnd) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.prevOfsEnd = prevOfsEnd;
            _read();
        }
        private void _read() {
            this.ofsBlob = this._io.readU4be();
            if (!(this.ofsBlob == prevOfsEnd())) {
                throw new KaitaiStream.ValidationNotEqualError(prevOfsEnd(), this.ofsBlob, this._io, "/types/lzma_meta/seq/0");
            }
            this.lenBlob = this._io.readU4be();
            if (!(_parent().has8ByteLzmaMetas())) {
                this.lenBlobUncompressed = this._io.readU4be();
            }
        }

        public void _fetchInstances() {
            if (!(_parent().has8ByteLzmaMetas())) {
            }
            blob();
            if (this.blob != null) {
            }
        }
        private byte[] blob;

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
         * @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS5">Source</a>
         * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L175-L187">Source</a>
         */
        public byte[] blob() {
            if (this.blob != null)
                return this.blob;
            KaitaiStream io = _parent().lzmaBlobsArea()._io();
            long _pos = io.pos();
            io.seek(ofsBlob());
            this.blob = io.readBytes(lenBlob());
            io.seek(_pos);
            return this.blob;
        }
        private Integer ofsEnd;
        public Integer ofsEnd() {
            if (this.ofsEnd != null)
                return this.ofsEnd;
            this.ofsEnd = ((Number) (ofsBlob() + lenBlob())).intValue();
            return this.ofsEnd;
        }
        private long ofsBlob;
        private long lenBlob;
        private Long lenBlobUncompressed;
        private long prevOfsEnd;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV3 _parent;
        public long ofsBlob() { return ofsBlob; }
        public long lenBlob() { return lenBlob; }
        public Long lenBlobUncompressed() { return lenBlobUncompressed; }
        public long prevOfsEnd() { return prevOfsEnd; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs.BodyV3 _parent() { return _parent; }
    }

    /**
     * @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS1">Source</a>
     * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34">Source</a>
     */
    public static class MinifsHeader extends KaitaiStruct {
        public static MinifsHeader fromFile(String fileName) throws IOException {
            return new MinifsHeader(new ByteBufferKaitaiStream(fileName));
        }

        public MinifsHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MinifsHeader(KaitaiStream _io, TplinkMinifs _parent) {
            this(_io, _parent, null);
        }

        public MinifsHeader(KaitaiStream _io, TplinkMinifs _parent, TplinkMinifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(16);
            if (!(Arrays.equals(this.magic, new byte[] { 77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.magic, this._io, "/types/minifs_header/seq/0");
            }
            this.version = this._io.readU4be();
            if (!( ((this.version == 1) || (this.version == 2) || (this.version == 3)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.version, this._io, "/types/minifs_header/seq/1");
            }
            this.numFiles = this._io.readU4be();
            this.lenLargestFile = this._io.readU4be();
        }

        public void _fetchInstances() {
        }
        private byte[] magic;
        private long version;
        private long numFiles;
        private long lenLargestFile;
        private TplinkMinifs _root;
        private TplinkMinifs _parent;
        public byte[] magic() { return magic; }
        public long version() { return version; }
        public long numFiles() { return numFiles; }

        /**
         * The uncompressed size of the largest file. In all images examined with
         * version 3, the inodes are sorted by size in descending order, so it is
         * also the size of the first file. In all images examined with versions
         * 1 and 2, the value is rounded up to a multiple of 4.
         */
        public long lenLargestFile() { return lenLargestFile; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs _parent() { return _parent; }
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
     * @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS2">Source</a>
     */
    public static class NameTable extends KaitaiStruct {
        public static NameTable fromFile(String fileName) throws IOException {
            return new NameTable(new ByteBufferKaitaiStream(fileName));
        }

        public NameTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NameTable(KaitaiStream _io, TplinkMinifs.BodyV3 _parent) {
            this(_io, _parent, null);
        }

        public NameTable(KaitaiStream _io, TplinkMinifs.BodyV3 _parent, TplinkMinifs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.names = new ArrayList<String>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.names.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.names.size(); i++) {
            }
        }
        private List<String> names;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV3 _parent;
        public List<String> names() { return names; }
        public TplinkMinifs _root() { return _root; }
        public TplinkMinifs.BodyV3 _parent() { return _parent; }
    }
    private MinifsHeader header;
    private KaitaiStruct body;
    private TplinkMinifs _root;
    private KaitaiStruct _parent;
    public MinifsHeader header() { return header; }
    public KaitaiStruct body() { return body; }
    public TplinkMinifs _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
