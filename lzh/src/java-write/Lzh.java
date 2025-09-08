// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * LHA (LHarc, LZH) is a file format used by a popular freeware
 * eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
 * years, many ports and implementations were developed, sporting many
 * extensions to original 1988 LZH.
 * 
 * File format is pretty simple and essentially consists of a stream of
 * records.
 */
public class Lzh extends KaitaiStruct.ReadWrite {
    public static Lzh fromFile(String fileName) throws IOException {
        return new Lzh(new ByteBufferKaitaiStream(fileName));
    }
    public Lzh() {
        this(null, null, null);
    }

    public Lzh(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Lzh(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Lzh(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Lzh _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.entries = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Record _t_entries = new Record(this._io, this, _root);
                try {
                    _t_entries._read();
                } finally {
                    this.entries.add(_t_entries);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.entries.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.entries.size(); i++) {
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class FileRecord extends KaitaiStruct.ReadWrite {
        public static FileRecord fromFile(String fileName) throws IOException {
            return new FileRecord(new ByteBufferKaitaiStream(fileName));
        }
        public FileRecord() {
            this(null, null, null);
        }

        public FileRecord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileRecord(KaitaiStream _io, Lzh.Record _parent) {
            this(_io, _parent, null);
        }

        public FileRecord(KaitaiStream _io, Lzh.Record _parent, Lzh _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._raw_header = this._io.readBytes(_parent().headerLen() - 1);
            KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
            this.header = new Header(_io__raw_header, this, _root);
            this.header._read();
            if (header().header1().lhaLevel() == 0) {
                this.fileUncomprCrc16 = this._io.readU2le();
            }
            this.body = this._io.readBytes(header().header1().fileSizeCompr());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (header().header1().lhaLevel() == 0) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_parent().headerLen() - 1);
            this._io.addChildStream(_io__raw_header);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (_parent().headerLen() - 1));
                final FileRecord _this = this;
                _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_header = _io__raw_header.toByteArray();
                        if (_this._raw_header.length != _parent().headerLen() - 1)
                            throw new ConsistencyError("raw(header)", _parent().headerLen() - 1, _this._raw_header.length);
                        parent.writeBytes(_this._raw_header);
                    }
                });
            }
            this.header._write_Seq(_io__raw_header);
            if (header().header1().lhaLevel() == 0) {
                this._io.writeU2le(this.fileUncomprCrc16);
            }
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (header().header1().lhaLevel() == 0) {
            }
            if (this.body.length != header().header1().fileSizeCompr())
                throw new ConsistencyError("body", header().header1().fileSizeCompr(), this.body.length);
            _dirty = false;
        }
        private Header header;
        private Integer fileUncomprCrc16;
        private byte[] body;
        private Lzh _root;
        private Lzh.Record _parent;
        private byte[] _raw_header;
        public Header header() { return header; }
        public void setHeader(Header _v) { _dirty = true; header = _v; }
        public Integer fileUncomprCrc16() { return fileUncomprCrc16; }
        public void setFileUncomprCrc16(Integer _v) { _dirty = true; fileUncomprCrc16 = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public Lzh _root() { return _root; }
        public void set_root(Lzh _v) { _dirty = true; _root = _v; }
        public Lzh.Record _parent() { return _parent; }
        public void set_parent(Lzh.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_header() { return _raw_header; }
        public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Lzh.FileRecord _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Lzh.FileRecord _parent, Lzh _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header1 = new Header1(this._io, this, _root);
            this.header1._read();
            if (header1().lhaLevel() == 0) {
                this.filenameLen = this._io.readU1();
            }
            if (header1().lhaLevel() == 0) {
                this.filename = new String(this._io.readBytes(filenameLen()), StandardCharsets.US_ASCII);
            }
            if (header1().lhaLevel() == 2) {
                this.fileUncomprCrc16 = this._io.readU2le();
            }
            if (header1().lhaLevel() == 2) {
                this.os = this._io.readU1();
            }
            if (header1().lhaLevel() == 2) {
                this.extHeaderSize = this._io.readU2le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header1._fetchInstances();
            if (header1().lhaLevel() == 0) {
            }
            if (header1().lhaLevel() == 0) {
            }
            if (header1().lhaLevel() == 2) {
            }
            if (header1().lhaLevel() == 2) {
            }
            if (header1().lhaLevel() == 2) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header1._write_Seq(this._io);
            if (header1().lhaLevel() == 0) {
                this._io.writeU1(this.filenameLen);
            }
            if (header1().lhaLevel() == 0) {
                this._io.writeBytes((this.filename).getBytes(Charset.forName("ASCII")));
            }
            if (header1().lhaLevel() == 2) {
                this._io.writeU2le(this.fileUncomprCrc16);
            }
            if (header1().lhaLevel() == 2) {
                this._io.writeU1(this.os);
            }
            if (header1().lhaLevel() == 2) {
                this._io.writeU2le(this.extHeaderSize);
            }
        }

        public void _check() {
            if (!Objects.equals(this.header1._root(), _root()))
                throw new ConsistencyError("header1", _root(), this.header1._root());
            if (!Objects.equals(this.header1._parent(), this))
                throw new ConsistencyError("header1", this, this.header1._parent());
            if (header1().lhaLevel() == 0) {
            }
            if (header1().lhaLevel() == 0) {
                if ((this.filename).getBytes(Charset.forName("ASCII")).length != filenameLen())
                    throw new ConsistencyError("filename", filenameLen(), (this.filename).getBytes(Charset.forName("ASCII")).length);
            }
            if (header1().lhaLevel() == 2) {
            }
            if (header1().lhaLevel() == 2) {
            }
            if (header1().lhaLevel() == 2) {
            }
            _dirty = false;
        }
        private Header1 header1;
        private Integer filenameLen;
        private String filename;
        private Integer fileUncomprCrc16;
        private Integer os;
        private Integer extHeaderSize;
        private Lzh _root;
        private Lzh.FileRecord _parent;

        /**
         * Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.
         */
        public Header1 header1() { return header1; }
        public void setHeader1(Header1 _v) { _dirty = true; header1 = _v; }
        public Integer filenameLen() { return filenameLen; }
        public void setFilenameLen(Integer _v) { _dirty = true; filenameLen = _v; }
        public String filename() { return filename; }
        public void setFilename(String _v) { _dirty = true; filename = _v; }
        public Integer fileUncomprCrc16() { return fileUncomprCrc16; }
        public void setFileUncomprCrc16(Integer _v) { _dirty = true; fileUncomprCrc16 = _v; }
        public Integer os() { return os; }
        public void setOs(Integer _v) { _dirty = true; os = _v; }
        public Integer extHeaderSize() { return extHeaderSize; }
        public void setExtHeaderSize(Integer _v) { _dirty = true; extHeaderSize = _v; }
        public Lzh _root() { return _root; }
        public void set_root(Lzh _v) { _dirty = true; _root = _v; }
        public Lzh.FileRecord _parent() { return _parent; }
        public void set_parent(Lzh.FileRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class Header1 extends KaitaiStruct.ReadWrite {
        public static Header1 fromFile(String fileName) throws IOException {
            return new Header1(new ByteBufferKaitaiStream(fileName));
        }
        public Header1() {
            this(null, null, null);
        }

        public Header1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header1(KaitaiStream _io, Lzh.Header _parent) {
            this(_io, _parent, null);
        }

        public Header1(KaitaiStream _io, Lzh.Header _parent, Lzh _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.headerChecksum = this._io.readU1();
            this.methodId = new String(this._io.readBytes(5), StandardCharsets.US_ASCII);
            this.fileSizeCompr = this._io.readU4le();
            this.fileSizeUncompr = this._io.readU4le();
            this._raw_fileTimestamp = this._io.readBytes(4);
            KaitaiStream _io__raw_fileTimestamp = new ByteBufferKaitaiStream(this._raw_fileTimestamp);
            this.fileTimestamp = new DosDatetime(_io__raw_fileTimestamp);
            this.fileTimestamp._read();
            this.attr = this._io.readU1();
            this.lhaLevel = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.fileTimestamp._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.headerChecksum);
            this._io.writeBytes((this.methodId).getBytes(Charset.forName("ASCII")));
            this._io.writeU4le(this.fileSizeCompr);
            this._io.writeU4le(this.fileSizeUncompr);
            final KaitaiStream _io__raw_fileTimestamp = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_fileTimestamp);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final Header1 _this = this;
                _io__raw_fileTimestamp.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_fileTimestamp = _io__raw_fileTimestamp.toByteArray();
                        if (_this._raw_fileTimestamp.length != 4)
                            throw new ConsistencyError("raw(file_timestamp)", 4, _this._raw_fileTimestamp.length);
                        parent.writeBytes(_this._raw_fileTimestamp);
                    }
                });
            }
            this.fileTimestamp._write_Seq(_io__raw_fileTimestamp);
            this._io.writeU1(this.attr);
            this._io.writeU1(this.lhaLevel);
        }

        public void _check() {
            if ((this.methodId).getBytes(Charset.forName("ASCII")).length != 5)
                throw new ConsistencyError("method_id", 5, (this.methodId).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private int headerChecksum;
        private String methodId;
        private long fileSizeCompr;
        private long fileSizeUncompr;
        private DosDatetime fileTimestamp;
        private int attr;
        private int lhaLevel;
        private Lzh _root;
        private Lzh.Header _parent;
        private byte[] _raw_fileTimestamp;
        public int headerChecksum() { return headerChecksum; }
        public void setHeaderChecksum(int _v) { _dirty = true; headerChecksum = _v; }
        public String methodId() { return methodId; }
        public void setMethodId(String _v) { _dirty = true; methodId = _v; }

        /**
         * Compressed file size
         */
        public long fileSizeCompr() { return fileSizeCompr; }
        public void setFileSizeCompr(long _v) { _dirty = true; fileSizeCompr = _v; }

        /**
         * Uncompressed file size
         */
        public long fileSizeUncompr() { return fileSizeUncompr; }
        public void setFileSizeUncompr(long _v) { _dirty = true; fileSizeUncompr = _v; }

        /**
         * Original file date/time
         */
        public DosDatetime fileTimestamp() { return fileTimestamp; }
        public void setFileTimestamp(DosDatetime _v) { _dirty = true; fileTimestamp = _v; }

        /**
         * File or directory attribute
         */
        public int attr() { return attr; }
        public void setAttr(int _v) { _dirty = true; attr = _v; }
        public int lhaLevel() { return lhaLevel; }
        public void setLhaLevel(int _v) { _dirty = true; lhaLevel = _v; }
        public Lzh _root() { return _root; }
        public void set_root(Lzh _v) { _dirty = true; _root = _v; }
        public Lzh.Header _parent() { return _parent; }
        public void set_parent(Lzh.Header _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_fileTimestamp() { return _raw_fileTimestamp; }
        public void set_raw_FileTimestamp(byte[] _v) { _dirty = true; _raw_fileTimestamp = _v; }
    }
    public static class Record extends KaitaiStruct.ReadWrite {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }
        public Record() {
            this(null, null, null);
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, Lzh _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, Lzh _parent, Lzh _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.headerLen = this._io.readU1();
            if (headerLen() > 0) {
                this.fileRecord = new FileRecord(this._io, this, _root);
                this.fileRecord._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (headerLen() > 0) {
                this.fileRecord._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.headerLen);
            if (headerLen() > 0) {
                this.fileRecord._write_Seq(this._io);
            }
        }

        public void _check() {
            if (headerLen() > 0) {
                if (!Objects.equals(this.fileRecord._root(), _root()))
                    throw new ConsistencyError("file_record", _root(), this.fileRecord._root());
                if (!Objects.equals(this.fileRecord._parent(), this))
                    throw new ConsistencyError("file_record", this, this.fileRecord._parent());
            }
            _dirty = false;
        }
        private int headerLen;
        private FileRecord fileRecord;
        private Lzh _root;
        private Lzh _parent;
        public int headerLen() { return headerLen; }
        public void setHeaderLen(int _v) { _dirty = true; headerLen = _v; }
        public FileRecord fileRecord() { return fileRecord; }
        public void setFileRecord(FileRecord _v) { _dirty = true; fileRecord = _v; }
        public Lzh _root() { return _root; }
        public void set_root(Lzh _v) { _dirty = true; _root = _v; }
        public Lzh _parent() { return _parent; }
        public void set_parent(Lzh _v) { _dirty = true; _parent = _v; }
    }
    private List<Record> entries;
    private Lzh _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Record> entries() { return entries; }
    public void setEntries(List<Record> _v) { _dirty = true; entries = _v; }
    public Lzh _root() { return _root; }
    public void set_root(Lzh _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
