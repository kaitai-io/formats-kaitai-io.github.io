// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;


/**
 * MINIFS is a file system found in certain firmware files from TP-Link
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
public class TplinkMinifs extends KaitaiStruct.ReadWrite {
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
    public TplinkMinifs() {
        this(null, null, null);
    }

    public TplinkMinifs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TplinkMinifs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public TplinkMinifs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, TplinkMinifs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new MinifsHeader(this._io, this, _root);
        this.header._read();
        switch (header().version()) {
        case 1: {
            this.body = new BodyV1(this._io, this, _root);
            ((BodyV1) (this.body))._read();
            break;
        }
        case 2: {
            this.body = new BodyV2(this._io, this, _root);
            ((BodyV2) (this.body))._read();
            break;
        }
        case 3: {
            this.body = new BodyV3(this._io, this, _root);
            ((BodyV3) (this.body))._read();
            break;
        }
        }
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        switch (header().version()) {
        case 1: {
            ((BodyV1) (this.body))._write_Seq(this._io);
            break;
        }
        case 2: {
            ((BodyV2) (this.body))._write_Seq(this._io);
            break;
        }
        case 3: {
            ((BodyV3) (this.body))._write_Seq(this._io);
            break;
        }
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        switch (header().version()) {
        case 1: {
            if (!Objects.equals(((TplinkMinifs.BodyV1) (this.body))._root(), _root()))
                throw new ConsistencyError("body", _root(), ((TplinkMinifs.BodyV1) (this.body))._root());
            if (!Objects.equals(((TplinkMinifs.BodyV1) (this.body))._parent(), this))
                throw new ConsistencyError("body", this, ((TplinkMinifs.BodyV1) (this.body))._parent());
            break;
        }
        case 2: {
            if (!Objects.equals(((TplinkMinifs.BodyV2) (this.body))._root(), _root()))
                throw new ConsistencyError("body", _root(), ((TplinkMinifs.BodyV2) (this.body))._root());
            if (!Objects.equals(((TplinkMinifs.BodyV2) (this.body))._parent(), this))
                throw new ConsistencyError("body", this, ((TplinkMinifs.BodyV2) (this.body))._parent());
            break;
        }
        case 3: {
            if (!Objects.equals(((TplinkMinifs.BodyV3) (this.body))._root(), _root()))
                throw new ConsistencyError("body", _root(), ((TplinkMinifs.BodyV3) (this.body))._root());
            if (!Objects.equals(((TplinkMinifs.BodyV3) (this.body))._parent(), this))
                throw new ConsistencyError("body", this, ((TplinkMinifs.BodyV3) (this.body))._parent());
            break;
        }
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://arxiv.org/html/2407.05064v1#S2.SS2">Source</a>
     */
    public static class BodyV1 extends KaitaiStruct.ReadWrite {
        public static BodyV1 fromFile(String fileName) throws IOException {
            return new BodyV1(new ByteBufferKaitaiStream(fileName));
        }
        public BodyV1() {
            this(null, null, null);
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
        }
        public void _read() {
            this.inodes = new ArrayList<InodeV1>();
            for (int i = 0; i < _root().header().numFiles(); i++) {
                InodeV1 _t_inodes = new InodeV1(this._io, this, _root, ((Number) ((i != 0 ? inodes().get(((Number) (i - 1)).intValue()).ofsEnd() : 0))).longValue());
                try {
                    _t_inodes._read();
                } finally {
                    this.inodes.add(_t_inodes);
                }
            }
            this._raw_blobsArea = this._io.readBytes(inodes().get(inodes().size() - 1).ofsEnd());
            KaitaiStream _io__raw_blobsArea = new ByteBufferKaitaiStream(this._raw_blobsArea);
            this.blobsArea = new Dummy(_io__raw_blobsArea, this, _root);
            this.blobsArea._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.inodes.size(); i++) {
                this.inodes.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.blobsArea._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.inodes.size(); i++) {
                this.inodes.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            final KaitaiStream _io__raw_blobsArea = new ByteBufferKaitaiStream(inodes().get(inodes().size() - 1).ofsEnd());
            this._io.addChildStream(_io__raw_blobsArea);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (inodes().get(inodes().size() - 1).ofsEnd()));
                final BodyV1 _this = this;
                _io__raw_blobsArea.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_blobsArea = _io__raw_blobsArea.toByteArray();
                        if (_this._raw_blobsArea.length != inodes().get(inodes().size() - 1).ofsEnd())
                            throw new ConsistencyError("raw(blobs_area)", inodes().get(inodes().size() - 1).ofsEnd(), _this._raw_blobsArea.length);
                        parent.writeBytes(_this._raw_blobsArea);
                    }
                });
            }
            this.blobsArea._write_Seq(_io__raw_blobsArea);
        }

        public void _check() {
            if (this.inodes.size() != _root().header().numFiles())
                throw new ConsistencyError("inodes", _root().header().numFiles(), this.inodes.size());
            for (int i = 0; i < this.inodes.size(); i++) {
                if (!Objects.equals(this.inodes.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("inodes", _root(), this.inodes.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.inodes.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("inodes", this, this.inodes.get(((Number) (i)).intValue())._parent());
                if (this.inodes.get(((Number) (i)).intValue()).prevOfsEnd() != ((Number) ((i != 0 ? inodes().get(((Number) (i - 1)).intValue()).ofsEnd() : 0))).longValue())
                    throw new ConsistencyError("inodes", ((Number) ((i != 0 ? inodes().get(((Number) (i - 1)).intValue()).ofsEnd() : 0))).longValue(), this.inodes.get(((Number) (i)).intValue()).prevOfsEnd());
            }
            if (!Objects.equals(this.blobsArea._root(), _root()))
                throw new ConsistencyError("blobs_area", _root(), this.blobsArea._root());
            if (!Objects.equals(this.blobsArea._parent(), this))
                throw new ConsistencyError("blobs_area", this, this.blobsArea._parent());
            _dirty = false;
        }
        private List<InodeV1> inodes;
        private Dummy blobsArea;
        private TplinkMinifs _root;
        private TplinkMinifs _parent;
        private byte[] _raw_blobsArea;
        public List<InodeV1> inodes() { return inodes; }
        public void setInodes(List<InodeV1> _v) { _dirty = true; inodes = _v; }
        public Dummy blobsArea() { return blobsArea; }
        public void setBlobsArea(Dummy _v) { _dirty = true; blobsArea = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs _parent() { return _parent; }
        public void set_parent(TplinkMinifs _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_blobsArea() { return _raw_blobsArea; }
        public void set_raw_BlobsArea(byte[] _v) { _dirty = true; _raw_blobsArea = _v; }
    }
    public static class BodyV2 extends KaitaiStruct.ReadWrite {
        public static BodyV2 fromFile(String fileName) throws IOException {
            return new BodyV2(new ByteBufferKaitaiStream(fileName));
        }
        public BodyV2() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenFilesArea = this._io.readU4be();
            this._raw_filesArea = this._io.readBytes(lenFilesArea());
            KaitaiStream _io__raw_filesArea = new ByteBufferKaitaiStream(this._raw_filesArea);
            this.filesArea = new FilesAreaV2(_io__raw_filesArea, this, _root);
            this.filesArea._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.filesArea._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.lenFilesArea);
            final KaitaiStream _io__raw_filesArea = new ByteBufferKaitaiStream(lenFilesArea());
            this._io.addChildStream(_io__raw_filesArea);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenFilesArea()));
                final BodyV2 _this = this;
                _io__raw_filesArea.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_filesArea = _io__raw_filesArea.toByteArray();
                        if (_this._raw_filesArea.length != lenFilesArea())
                            throw new ConsistencyError("raw(files_area)", lenFilesArea(), _this._raw_filesArea.length);
                        parent.writeBytes(_this._raw_filesArea);
                    }
                });
            }
            this.filesArea._write_Seq(_io__raw_filesArea);
        }

        public void _check() {
            if (!Objects.equals(this.filesArea._root(), _root()))
                throw new ConsistencyError("files_area", _root(), this.filesArea._root());
            if (!Objects.equals(this.filesArea._parent(), this))
                throw new ConsistencyError("files_area", this, this.filesArea._parent());
            _dirty = false;
        }
        private long lenFilesArea;
        private FilesAreaV2 filesArea;
        private TplinkMinifs _root;
        private TplinkMinifs _parent;
        private byte[] _raw_filesArea;
        public long lenFilesArea() { return lenFilesArea; }
        public void setLenFilesArea(long _v) { _dirty = true; lenFilesArea = _v; }
        public FilesAreaV2 filesArea() { return filesArea; }
        public void setFilesArea(FilesAreaV2 _v) { _dirty = true; filesArea = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs _parent() { return _parent; }
        public void set_parent(TplinkMinifs _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_filesArea() { return _raw_filesArea; }
        public void set_raw_FilesArea(byte[] _v) { _dirty = true; _raw_filesArea = _v; }
    }
    public static class BodyV3 extends KaitaiStruct.ReadWrite {
        public static BodyV3 fromFile(String fileName) throws IOException {
            return new BodyV3(new ByteBufferKaitaiStream(fileName));
        }
        public BodyV3() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenNameTable = this._io.readU4be();
            this._raw_nameTable = this._io.readBytes(lenNameTable());
            KaitaiStream _io__raw_nameTable = new ByteBufferKaitaiStream(this._raw_nameTable);
            this.nameTable = new NameTable(_io__raw_nameTable, this, _root);
            this.nameTable._read();
            this.inodes = new ArrayList<Inode>();
            for (int i = 0; i < _root().header().numFiles(); i++) {
                Inode _t_inodes = new Inode(this._io, this, _root, ((Number) ((i != 0 ? inodes().get(((Number) (i - 1)).intValue()).curMaxLzmaBlob() : 0))).longValue());
                try {
                    _t_inodes._read();
                } finally {
                    this.inodes.add(_t_inodes);
                }
            }
            if (ofsLzmaMetas() < 0) {
                this._unnamed3 = this._io.readBytes(0);
            }
            this.lzmaMetas = new ArrayList<LzmaMeta>();
            for (int i = 0; i < numLzmaBlobs(); i++) {
                LzmaMeta _t_lzmaMetas = new LzmaMeta(this._io, this, _root, ((Number) ((i != 0 ? lzmaMetas().get(((Number) (i - 1)).intValue()).ofsEnd() : 0))).longValue());
                try {
                    _t_lzmaMetas._read();
                } finally {
                    this.lzmaMetas.add(_t_lzmaMetas);
                }
            }
            this._raw_lzmaBlobsArea = this._io.readBytes(lzmaMetas().get(lzmaMetas().size() - 1).ofsEnd());
            KaitaiStream _io__raw_lzmaBlobsArea = new ByteBufferKaitaiStream(this._raw_lzmaBlobsArea);
            this.lzmaBlobsArea = new Dummy(_io__raw_lzmaBlobsArea, this, _root);
            this.lzmaBlobsArea._read();
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteLenFirstBlobUncompressedIf8ByteMetas = _enabledLenFirstBlobUncompressedIf8ByteMetas;
            this._io.writeU4be(this.lenNameTable);
            final KaitaiStream _io__raw_nameTable = new ByteBufferKaitaiStream(lenNameTable());
            this._io.addChildStream(_io__raw_nameTable);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenNameTable()));
                final BodyV3 _this = this;
                _io__raw_nameTable.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_nameTable = _io__raw_nameTable.toByteArray();
                        if (_this._raw_nameTable.length != lenNameTable())
                            throw new ConsistencyError("raw(name_table)", lenNameTable(), _this._raw_nameTable.length);
                        parent.writeBytes(_this._raw_nameTable);
                    }
                });
            }
            this.nameTable._write_Seq(_io__raw_nameTable);
            for (int i = 0; i < this.inodes.size(); i++) {
                this.inodes.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (ofsLzmaMetas() < 0) {
                if (this._unnamed3.length != 0)
                    throw new ConsistencyError("_unnamed3", 0, this._unnamed3.length);
                this._io.writeBytes(this._unnamed3);
            }
            for (int i = 0; i < this.lzmaMetas.size(); i++) {
                this.lzmaMetas.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            final KaitaiStream _io__raw_lzmaBlobsArea = new ByteBufferKaitaiStream(lzmaMetas().get(lzmaMetas().size() - 1).ofsEnd());
            this._io.addChildStream(_io__raw_lzmaBlobsArea);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lzmaMetas().get(lzmaMetas().size() - 1).ofsEnd()));
                final BodyV3 _this = this;
                _io__raw_lzmaBlobsArea.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_lzmaBlobsArea = _io__raw_lzmaBlobsArea.toByteArray();
                        if (_this._raw_lzmaBlobsArea.length != lzmaMetas().get(lzmaMetas().size() - 1).ofsEnd())
                            throw new ConsistencyError("raw(lzma_blobs_area)", lzmaMetas().get(lzmaMetas().size() - 1).ofsEnd(), _this._raw_lzmaBlobsArea.length);
                        parent.writeBytes(_this._raw_lzmaBlobsArea);
                    }
                });
            }
            this.lzmaBlobsArea._write_Seq(_io__raw_lzmaBlobsArea);
        }

        public void _check() {
            if (!Objects.equals(this.nameTable._root(), _root()))
                throw new ConsistencyError("name_table", _root(), this.nameTable._root());
            if (!Objects.equals(this.nameTable._parent(), this))
                throw new ConsistencyError("name_table", this, this.nameTable._parent());
            if (this.inodes.size() != _root().header().numFiles())
                throw new ConsistencyError("inodes", _root().header().numFiles(), this.inodes.size());
            for (int i = 0; i < this.inodes.size(); i++) {
                if (!Objects.equals(this.inodes.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("inodes", _root(), this.inodes.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.inodes.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("inodes", this, this.inodes.get(((Number) (i)).intValue())._parent());
                if (this.inodes.get(((Number) (i)).intValue()).prevMaxLzmaBlob() != ((Number) ((i != 0 ? inodes().get(((Number) (i - 1)).intValue()).curMaxLzmaBlob() : 0))).longValue())
                    throw new ConsistencyError("inodes", ((Number) ((i != 0 ? inodes().get(((Number) (i - 1)).intValue()).curMaxLzmaBlob() : 0))).longValue(), this.inodes.get(((Number) (i)).intValue()).prevMaxLzmaBlob());
            }
            if (this.lzmaMetas.size() != numLzmaBlobs())
                throw new ConsistencyError("lzma_metas", numLzmaBlobs(), this.lzmaMetas.size());
            for (int i = 0; i < this.lzmaMetas.size(); i++) {
                if (!Objects.equals(this.lzmaMetas.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("lzma_metas", _root(), this.lzmaMetas.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.lzmaMetas.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("lzma_metas", this, this.lzmaMetas.get(((Number) (i)).intValue())._parent());
                if (this.lzmaMetas.get(((Number) (i)).intValue()).prevOfsEnd() != ((Number) ((i != 0 ? lzmaMetas().get(((Number) (i - 1)).intValue()).ofsEnd() : 0))).longValue())
                    throw new ConsistencyError("lzma_metas", ((Number) ((i != 0 ? lzmaMetas().get(((Number) (i - 1)).intValue()).ofsEnd() : 0))).longValue(), this.lzmaMetas.get(((Number) (i)).intValue()).prevOfsEnd());
            }
            if (!Objects.equals(this.lzmaBlobsArea._root(), _root()))
                throw new ConsistencyError("lzma_blobs_area", _root(), this.lzmaBlobsArea._root());
            if (!Objects.equals(this.lzmaBlobsArea._parent(), this))
                throw new ConsistencyError("lzma_blobs_area", this, this.lzmaBlobsArea._parent());
            if (_enabledLenFirstBlobUncompressedIf8ByteMetas) {
            }
            _dirty = false;
        }
        private Boolean has8ByteLzmaMetas;

        /**
         * Whether each record in `lzma_metas` lacks `len_blob_uncompressed` and
         * is therefore 8 bytes in size instead of 12.
         * 
         * The MINIFS header doesn't say which size is used (both use version 3),
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
        public void _invalidateHas8ByteLzmaMetas() { this.has8ByteLzmaMetas = null; }
        private Long lenFirstBlobUncompressedIf8ByteMetas;
        private boolean _shouldWriteLenFirstBlobUncompressedIf8ByteMetas = false;
        private boolean _enabledLenFirstBlobUncompressedIf8ByteMetas = true;

        /**
         * The uncompressed size in the `.lzma` header of the first blob, if
         * `lzma_metas` have 8-byte records. It follows the properties byte and the
         * 4-byte dictionary size.
         */
        public Long lenFirstBlobUncompressedIf8ByteMetas() {
            if (_shouldWriteLenFirstBlobUncompressedIf8ByteMetas)
                _writeLenFirstBlobUncompressedIf8ByteMetas();
            if (this.lenFirstBlobUncompressedIf8ByteMetas != null)
                return this.lenFirstBlobUncompressedIf8ByteMetas;
            if (!_enabledLenFirstBlobUncompressedIf8ByteMetas)
                return null;
            long _pos = this._io.pos();
            this._io.seek((ofsLzmaMetas() + 8 * numLzmaBlobs()) + 5);
            this.lenFirstBlobUncompressedIf8ByteMetas = this._io.readU8le();
            this._io.seek(_pos);
            return this.lenFirstBlobUncompressedIf8ByteMetas;
        }
        public void setLenFirstBlobUncompressedIf8ByteMetas(long _v) { _dirty = true; lenFirstBlobUncompressedIf8ByteMetas = _v; }
        public void setLenFirstBlobUncompressedIf8ByteMetas_Enabled(boolean _v) { _dirty = true; _enabledLenFirstBlobUncompressedIf8ByteMetas = _v; }

        private void _writeLenFirstBlobUncompressedIf8ByteMetas() {
            _shouldWriteLenFirstBlobUncompressedIf8ByteMetas = false;
            long _pos = this._io.pos();
            this._io.seek((ofsLzmaMetas() + 8 * numLzmaBlobs()) + 5);
            this._io.writeU8le(this.lenFirstBlobUncompressedIf8ByteMetas);
            this._io.seek(_pos);
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
        public void _invalidateLenLzmaMeta() { this.lenLzmaMeta = null; }
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
        public void _invalidateNumLzmaBlobs() { this.numLzmaBlobs = null; }
        private Integer ofsLzmaMetas;
        public Integer ofsLzmaMetas() {
            if (this.ofsLzmaMetas != null)
                return this.ofsLzmaMetas;
            this.ofsLzmaMetas = ((Number) (_io().pos())).intValue();
            return this.ofsLzmaMetas;
        }
        public void _invalidateOfsLzmaMetas() { this.ofsLzmaMetas = null; }
        private long lenNameTable;
        private NameTable nameTable;
        private List<Inode> inodes;
        private byte[] _unnamed3;
        private List<LzmaMeta> lzmaMetas;
        private Dummy lzmaBlobsArea;
        private TplinkMinifs _root;
        private TplinkMinifs _parent;
        private byte[] _raw_nameTable;
        private byte[] _raw_lzmaBlobsArea;
        public long lenNameTable() { return lenNameTable; }
        public void setLenNameTable(long _v) { _dirty = true; lenNameTable = _v; }
        public NameTable nameTable() { return nameTable; }
        public void setNameTable(NameTable _v) { _dirty = true; nameTable = _v; }
        public List<Inode> inodes() { return inodes; }
        public void setInodes(List<Inode> _v) { _dirty = true; inodes = _v; }
        public byte[] _unnamed3() { return _unnamed3; }
        public void set_unnamed3(byte[] _v) { _dirty = true; _unnamed3 = _v; }
        public List<LzmaMeta> lzmaMetas() { return lzmaMetas; }
        public void setLzmaMetas(List<LzmaMeta> _v) { _dirty = true; lzmaMetas = _v; }
        public Dummy lzmaBlobsArea() { return lzmaBlobsArea; }
        public void setLzmaBlobsArea(Dummy _v) { _dirty = true; lzmaBlobsArea = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs _parent() { return _parent; }
        public void set_parent(TplinkMinifs _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_nameTable() { return _raw_nameTable; }
        public void set_raw_NameTable(byte[] _v) { _dirty = true; _raw_nameTable = _v; }
        public byte[] _raw_lzmaBlobsArea() { return _raw_lzmaBlobsArea; }
        public void set_raw_LzmaBlobsArea(byte[] _v) { _dirty = true; _raw_lzmaBlobsArea = _v; }
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

        public Dummy(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Dummy(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, TplinkMinifs _root) {
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
        private TplinkMinifs _root;
        private KaitaiStruct.ReadWrite _parent;
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52">Source</a>
     */
    public static class FileV2 extends KaitaiStruct.ReadWrite {
        public static FileV2 fromFile(String fileName) throws IOException {
            return new FileV2(new ByteBufferKaitaiStream(fileName));
        }
        public FileV2() {
            this(null, null, null);
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
        }
        public void _read() {
            this.pathMd5 = this._io.readBytes(16);
            this.lenData = this._io.readU4be();
            this.ofsData = this._io.readU4be();
            if (!(this.ofsData == _io().pos() + 8)) {
                throw new KaitaiStream.ValidationNotEqualError(_io().pos() + 8, this.ofsData, this._io, "/types/file_v2/seq/2");
            }
            this.lenDataUncompressed = this._io.readU4be();
            this.compression = TplinkMinifs.CompressionType.byId(this._io.readU4be());
            this.data = this._io.readBytes(lenData());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.pathMd5);
            this._io.writeU4be(this.lenData);
            this._io.writeU4be(this.ofsData);
            this._io.writeU4be(this.lenDataUncompressed);
            this._io.writeU4be(((Number) (this.compression.id())).longValue());
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if (this.pathMd5.length != 16)
                throw new ConsistencyError("path_md5", 16, this.pathMd5.length);
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            _dirty = false;
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
        public void setPathMd5(byte[] _v) { _dirty = true; pathMd5 = _v; }
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }

        /**
         * Offset of `data` relative to the start of `<body_v2>.files_area`.
         */
        public long ofsData() { return ofsData; }
        public void setOfsData(long _v) { _dirty = true; ofsData = _v; }
        public long lenDataUncompressed() { return lenDataUncompressed; }
        public void setLenDataUncompressed(long _v) { _dirty = true; lenDataUncompressed = _v; }
        public CompressionType compression() { return compression; }
        public void setCompression(CompressionType _v) { _dirty = true; compression = _v; }

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
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs.FilesAreaV2 _parent() { return _parent; }
        public void set_parent(TplinkMinifs.FilesAreaV2 _v) { _dirty = true; _parent = _v; }
    }
    public static class FilesAreaV2 extends KaitaiStruct.ReadWrite {
        public static FilesAreaV2 fromFile(String fileName) throws IOException {
            return new FilesAreaV2(new ByteBufferKaitaiStream(fileName));
        }
        public FilesAreaV2() {
            this(null, null, null);
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
        }
        public void _read() {
            this.files = new ArrayList<FileV2>();
            for (int i = 0; i < _root().header().numFiles(); i++) {
                FileV2 _t_files = new FileV2(this._io, this, _root);
                try {
                    _t_files._read();
                } finally {
                    this.files.add(_t_files);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.files.size(); i++) {
                this.files.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.files.size(); i++) {
                this.files.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.files.size() != _root().header().numFiles())
                throw new ConsistencyError("files", _root().header().numFiles(), this.files.size());
            for (int i = 0; i < this.files.size(); i++) {
                if (!Objects.equals(this.files.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("files", _root(), this.files.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.files.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("files", this, this.files.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<FileV2> files;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV2 _parent;
        public List<FileV2> files() { return files; }
        public void setFiles(List<FileV2> _v) { _dirty = true; files = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs.BodyV2 _parent() { return _parent; }
        public void set_parent(TplinkMinifs.BodyV2 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS3">Source</a>
     * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42">Source</a>
     */
    public static class Inode extends KaitaiStruct.ReadWrite {
        public Inode(long prevMaxLzmaBlob) {
            this(null, null, null, prevMaxLzmaBlob);
        }

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
        }
        public void _read() {
            this.ofsDirectoryPath = this._io.readU4be();
            this.ofsFileName = this._io.readU4be();
            this.lzmaBlob = this._io.readU4be();
            this.ofsFile = this._io.readU4be();
            this.lenFile = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            directoryPath();
            if (this.directoryPath != null) {
            }
            fileName();
            if (this.fileName != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteDirectoryPath = _enabledDirectoryPath;
            _shouldWriteFileName = _enabledFileName;
            this._io.writeU4be(this.ofsDirectoryPath);
            this._io.writeU4be(this.ofsFileName);
            this._io.writeU4be(this.lzmaBlob);
            this._io.writeU4be(this.ofsFile);
            this._io.writeU4be(this.lenFile);
        }

        public void _check() {
            if (_enabledDirectoryPath) {
                if (KaitaiStream.byteArrayIndexOf((this.directoryPath).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("directory_path", -1, KaitaiStream.byteArrayIndexOf((this.directoryPath).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
            if (_enabledFileName) {
                if (KaitaiStream.byteArrayIndexOf((this.fileName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("file_name", -1, KaitaiStream.byteArrayIndexOf((this.fileName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
            _dirty = false;
        }
        private Integer curMaxLzmaBlob;
        public Integer curMaxLzmaBlob() {
            if (this.curMaxLzmaBlob != null)
                return this.curMaxLzmaBlob;
            this.curMaxLzmaBlob = ((Number) ((lzmaBlob() > prevMaxLzmaBlob() ? lzmaBlob() : prevMaxLzmaBlob()))).intValue();
            return this.curMaxLzmaBlob;
        }
        public void _invalidateCurMaxLzmaBlob() { this.curMaxLzmaBlob = null; }
        private String directoryPath;
        private boolean _shouldWriteDirectoryPath = false;
        private boolean _enabledDirectoryPath = true;
        public String directoryPath() {
            if (_shouldWriteDirectoryPath)
                _writeDirectoryPath();
            if (this.directoryPath != null)
                return this.directoryPath;
            if (!_enabledDirectoryPath)
                return null;
            KaitaiStream io = _parent().nameTable()._io();
            long _pos = io.pos();
            io.seek(ofsDirectoryPath());
            this.directoryPath = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            io.seek(_pos);
            return this.directoryPath;
        }
        public void setDirectoryPath(String _v) { _dirty = true; directoryPath = _v; }
        public void setDirectoryPath_Enabled(boolean _v) { _dirty = true; _enabledDirectoryPath = _v; }

        private void _writeDirectoryPath() {
            _shouldWriteDirectoryPath = false;
            KaitaiStream io = _parent().nameTable()._io();
            long _pos = io.pos();
            io.seek(ofsDirectoryPath());
            io.writeBytes((this.directoryPath).getBytes(Charset.forName("ASCII")));
            io.writeU1(0);
            io.seek(_pos);
        }
        private String fileName;
        private boolean _shouldWriteFileName = false;
        private boolean _enabledFileName = true;
        public String fileName() {
            if (_shouldWriteFileName)
                _writeFileName();
            if (this.fileName != null)
                return this.fileName;
            if (!_enabledFileName)
                return null;
            KaitaiStream io = _parent().nameTable()._io();
            long _pos = io.pos();
            io.seek(ofsFileName());
            this.fileName = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            io.seek(_pos);
            return this.fileName;
        }
        public void setFileName(String _v) { _dirty = true; fileName = _v; }
        public void setFileName_Enabled(boolean _v) { _dirty = true; _enabledFileName = _v; }

        private void _writeFileName() {
            _shouldWriteFileName = false;
            KaitaiStream io = _parent().nameTable()._io();
            long _pos = io.pos();
            io.seek(ofsFileName());
            io.writeBytes((this.fileName).getBytes(Charset.forName("ASCII")));
            io.writeU1(0);
            io.seek(_pos);
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
        public void setOfsDirectoryPath(long _v) { _dirty = true; ofsDirectoryPath = _v; }
        public long ofsFileName() { return ofsFileName; }
        public void setOfsFileName(long _v) { _dirty = true; ofsFileName = _v; }
        public long lzmaBlob() { return lzmaBlob; }
        public void setLzmaBlob(long _v) { _dirty = true; lzmaBlob = _v; }
        public long ofsFile() { return ofsFile; }
        public void setOfsFile(long _v) { _dirty = true; ofsFile = _v; }
        public long lenFile() { return lenFile; }
        public void setLenFile(long _v) { _dirty = true; lenFile = _v; }
        public long prevMaxLzmaBlob() { return prevMaxLzmaBlob; }
        public void setPrevMaxLzmaBlob(long _v) { _dirty = true; prevMaxLzmaBlob = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs.BodyV3 _parent() { return _parent; }
        public void set_parent(TplinkMinifs.BodyV3 _v) { _dirty = true; _parent = _v; }
    }
    public static class InodeV1 extends KaitaiStruct.ReadWrite {
        public InodeV1(long prevOfsEnd) {
            this(null, null, null, prevOfsEnd);
        }

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
        }
        public void _read() {
            this.path = new String(KaitaiStream.bytesTerminate(this._io.readBytes(80), (byte) 0, false), StandardCharsets.US_ASCII);
            this.lenBlob = this._io.readU4be();
            this.ofsBlob = this._io.readU4be();
            if (!(this.ofsBlob == prevOfsEnd())) {
                throw new KaitaiStream.ValidationNotEqualError(prevOfsEnd(), this.ofsBlob, this._io, "/types/inode_v1/seq/2");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            blob();
            if (this.blob != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBlob = _enabledBlob;
            this._io.writeBytesLimit((this.path).getBytes(Charset.forName("ASCII")), 80, (byte) 0, (byte) 0);
            this._io.writeU4be(this.lenBlob);
            this._io.writeU4be(this.ofsBlob);
        }

        public void _check() {
            if ((this.path).getBytes(Charset.forName("ASCII")).length > 80)
                throw new ConsistencyError("path", 80, (this.path).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.path).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("path", -1, KaitaiStream.byteArrayIndexOf((this.path).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (!(this.ofsBlob == prevOfsEnd())) {
                throw new KaitaiStream.ValidationNotEqualError(prevOfsEnd(), this.ofsBlob, null, "/types/inode_v1/seq/2");
            }
            if (_enabledBlob) {
                if (this.blob.length != lenBlob())
                    throw new ConsistencyError("blob", lenBlob(), this.blob.length);
            }
            _dirty = false;
        }
        private byte[] blob;
        private boolean _shouldWriteBlob = false;
        private boolean _enabledBlob = true;

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
            if (_shouldWriteBlob)
                _writeBlob();
            if (this.blob != null)
                return this.blob;
            if (!_enabledBlob)
                return null;
            KaitaiStream io = _parent().blobsArea()._io();
            long _pos = io.pos();
            io.seek(ofsBlob());
            this.blob = io.readBytes(lenBlob());
            io.seek(_pos);
            return this.blob;
        }
        public void setBlob(byte[] _v) { _dirty = true; blob = _v; }
        public void setBlob_Enabled(boolean _v) { _dirty = true; _enabledBlob = _v; }

        private void _writeBlob() {
            _shouldWriteBlob = false;
            KaitaiStream io = _parent().blobsArea()._io();
            long _pos = io.pos();
            io.seek(ofsBlob());
            io.writeBytes(this.blob);
            io.seek(_pos);
        }
        private Integer ofsEnd;
        public Integer ofsEnd() {
            if (this.ofsEnd != null)
                return this.ofsEnd;
            this.ofsEnd = ((Number) (ofsBlob() + lenBlob())).intValue();
            return this.ofsEnd;
        }
        public void _invalidateOfsEnd() { this.ofsEnd = null; }
        private String path;
        private long lenBlob;
        private long ofsBlob;
        private long prevOfsEnd;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV1 _parent;
        public String path() { return path; }
        public void setPath(String _v) { _dirty = true; path = _v; }
        public long lenBlob() { return lenBlob; }
        public void setLenBlob(long _v) { _dirty = true; lenBlob = _v; }

        /**
         * Relative to the start of `<body_v1>.blobs_area`.
         */
        public long ofsBlob() { return ofsBlob; }
        public void setOfsBlob(long _v) { _dirty = true; ofsBlob = _v; }
        public long prevOfsEnd() { return prevOfsEnd; }
        public void setPrevOfsEnd(long _v) { _dirty = true; prevOfsEnd = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs.BodyV1 _parent() { return _parent; }
        public void set_parent(TplinkMinifs.BodyV1 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS4">Source</a>
     * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48">Source</a>
     */
    public static class LzmaMeta extends KaitaiStruct.ReadWrite {
        public LzmaMeta(long prevOfsEnd) {
            this(null, null, null, prevOfsEnd);
        }

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
        }
        public void _read() {
            this.ofsBlob = this._io.readU4be();
            if (!(this.ofsBlob == prevOfsEnd())) {
                throw new KaitaiStream.ValidationNotEqualError(prevOfsEnd(), this.ofsBlob, this._io, "/types/lzma_meta/seq/0");
            }
            this.lenBlob = this._io.readU4be();
            if (!(_parent().has8ByteLzmaMetas())) {
                this.lenBlobUncompressed = this._io.readU4be();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (!(_parent().has8ByteLzmaMetas())) {
            }
            blob();
            if (this.blob != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBlob = _enabledBlob;
            this._io.writeU4be(this.ofsBlob);
            this._io.writeU4be(this.lenBlob);
            if (!(_parent().has8ByteLzmaMetas())) {
                this._io.writeU4be(this.lenBlobUncompressed);
            }
        }

        public void _check() {
            if (!(this.ofsBlob == prevOfsEnd())) {
                throw new KaitaiStream.ValidationNotEqualError(prevOfsEnd(), this.ofsBlob, null, "/types/lzma_meta/seq/0");
            }
            if (!(_parent().has8ByteLzmaMetas())) {
            }
            if (_enabledBlob) {
                if (this.blob.length != lenBlob())
                    throw new ConsistencyError("blob", lenBlob(), this.blob.length);
            }
            _dirty = false;
        }
        private byte[] blob;
        private boolean _shouldWriteBlob = false;
        private boolean _enabledBlob = true;

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
            if (_shouldWriteBlob)
                _writeBlob();
            if (this.blob != null)
                return this.blob;
            if (!_enabledBlob)
                return null;
            KaitaiStream io = _parent().lzmaBlobsArea()._io();
            long _pos = io.pos();
            io.seek(ofsBlob());
            this.blob = io.readBytes(lenBlob());
            io.seek(_pos);
            return this.blob;
        }
        public void setBlob(byte[] _v) { _dirty = true; blob = _v; }
        public void setBlob_Enabled(boolean _v) { _dirty = true; _enabledBlob = _v; }

        private void _writeBlob() {
            _shouldWriteBlob = false;
            KaitaiStream io = _parent().lzmaBlobsArea()._io();
            long _pos = io.pos();
            io.seek(ofsBlob());
            io.writeBytes(this.blob);
            io.seek(_pos);
        }
        private Integer ofsEnd;
        public Integer ofsEnd() {
            if (this.ofsEnd != null)
                return this.ofsEnd;
            this.ofsEnd = ((Number) (ofsBlob() + lenBlob())).intValue();
            return this.ofsEnd;
        }
        public void _invalidateOfsEnd() { this.ofsEnd = null; }
        private long ofsBlob;
        private long lenBlob;
        private Long lenBlobUncompressed;
        private long prevOfsEnd;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV3 _parent;
        public long ofsBlob() { return ofsBlob; }
        public void setOfsBlob(long _v) { _dirty = true; ofsBlob = _v; }
        public long lenBlob() { return lenBlob; }
        public void setLenBlob(long _v) { _dirty = true; lenBlob = _v; }
        public Long lenBlobUncompressed() { return lenBlobUncompressed; }
        public void setLenBlobUncompressed(Long _v) { _dirty = true; lenBlobUncompressed = _v; }
        public long prevOfsEnd() { return prevOfsEnd; }
        public void setPrevOfsEnd(long _v) { _dirty = true; prevOfsEnd = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs.BodyV3 _parent() { return _parent; }
        public void set_parent(TplinkMinifs.BodyV3 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://arxiv.org/html/2407.05064v1#S4.SS1">Source</a>
     * @see <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34">Source</a>
     */
    public static class MinifsHeader extends KaitaiStruct.ReadWrite {
        public static MinifsHeader fromFile(String fileName) throws IOException {
            return new MinifsHeader(new ByteBufferKaitaiStream(fileName));
        }
        public MinifsHeader() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4be(this.version);
            this._io.writeU4be(this.numFiles);
            this._io.writeU4be(this.lenLargestFile);
        }

        public void _check() {
            if (this.magic.length != 16)
                throw new ConsistencyError("magic", 16, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.magic, null, "/types/minifs_header/seq/0");
            }
            if (!( ((this.version == 1) || (this.version == 2) || (this.version == 3)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.version, null, "/types/minifs_header/seq/1");
            }
            _dirty = false;
        }
        private byte[] magic;
        private long version;
        private long numFiles;
        private long lenLargestFile;
        private TplinkMinifs _root;
        private TplinkMinifs _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }
        public long numFiles() { return numFiles; }
        public void setNumFiles(long _v) { _dirty = true; numFiles = _v; }

        /**
         * The uncompressed size of the largest file. In all images examined with
         * version 3, the inodes are sorted by size in descending order, so it is
         * also the size of the first file. In all images examined with versions
         * 1 and 2, the value is rounded up to a multiple of 4.
         */
        public long lenLargestFile() { return lenLargestFile; }
        public void setLenLargestFile(long _v) { _dirty = true; lenLargestFile = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs _parent() { return _parent; }
        public void set_parent(TplinkMinifs _v) { _dirty = true; _parent = _v; }
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
    public static class NameTable extends KaitaiStruct.ReadWrite {
        public static NameTable fromFile(String fileName) throws IOException {
            return new NameTable(new ByteBufferKaitaiStream(fileName));
        }
        public NameTable() {
            this(null, null, null);
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
        }
        public void _read() {
            this.names = new ArrayList<String>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.names.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.names.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.names.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("names", 0, this._io.size() - this._io.pos());
                this._io.writeBytes((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")));
                this._io.writeU1(0);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("names", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.names.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("names", -1, KaitaiStream.byteArrayIndexOf((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
            _dirty = false;
        }
        private List<String> names;
        private TplinkMinifs _root;
        private TplinkMinifs.BodyV3 _parent;
        public List<String> names() { return names; }
        public void setNames(List<String> _v) { _dirty = true; names = _v; }
        public TplinkMinifs _root() { return _root; }
        public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
        public TplinkMinifs.BodyV3 _parent() { return _parent; }
        public void set_parent(TplinkMinifs.BodyV3 _v) { _dirty = true; _parent = _v; }
    }
    private MinifsHeader header;
    private KaitaiStruct.ReadWrite body;
    private TplinkMinifs _root;
    private KaitaiStruct.ReadWrite _parent;
    public MinifsHeader header() { return header; }
    public void setHeader(MinifsHeader _v) { _dirty = true; header = _v; }
    public KaitaiStruct.ReadWrite body() { return body; }
    public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
    public TplinkMinifs _root() { return _root; }
    public void set_root(TplinkMinifs _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
