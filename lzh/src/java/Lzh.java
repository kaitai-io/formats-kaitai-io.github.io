// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
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
public class Lzh extends KaitaiStruct {
    public static Lzh fromFile(String fileName) throws IOException {
        return new Lzh(new ByteBufferKaitaiStream(fileName));
    }

    public Lzh(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Lzh(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Lzh(KaitaiStream _io, KaitaiStruct _parent, Lzh _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.entries = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.entries.add(new Record(this._io, this, _root));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class FileRecord extends KaitaiStruct {
        public static FileRecord fromFile(String fileName) throws IOException {
            return new FileRecord(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            KaitaiStream _io_header = this._io.substream(_parent().headerLen() - 1);
            this.header = new Header(_io_header, this, _root);
            if (header().header1().lhaLevel() == 0) {
                this.fileUncomprCrc16 = this._io.readU2le();
            }
            this.body = this._io.readBytes(header().header1().fileSizeCompr());
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (header().header1().lhaLevel() == 0) {
            }
        }
        private Header header;
        private Integer fileUncomprCrc16;
        private byte[] body;
        private Lzh _root;
        private Lzh.Record _parent;
        public Header header() { return header; }
        public Integer fileUncomprCrc16() { return fileUncomprCrc16; }
        public byte[] body() { return body; }
        public Lzh _root() { return _root; }
        public Lzh.Record _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.header1 = new Header1(this._io, this, _root);
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
        public Integer filenameLen() { return filenameLen; }
        public String filename() { return filename; }
        public Integer fileUncomprCrc16() { return fileUncomprCrc16; }
        public Integer os() { return os; }
        public Integer extHeaderSize() { return extHeaderSize; }
        public Lzh _root() { return _root; }
        public Lzh.FileRecord _parent() { return _parent; }
    }
    public static class Header1 extends KaitaiStruct {
        public static Header1 fromFile(String fileName) throws IOException {
            return new Header1(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.headerChecksum = this._io.readU1();
            this.methodId = new String(this._io.readBytes(5), StandardCharsets.US_ASCII);
            this.fileSizeCompr = this._io.readU4le();
            this.fileSizeUncompr = this._io.readU4le();
            KaitaiStream _io_fileTimestamp = this._io.substream(4);
            this.fileTimestamp = new DosDatetime(_io_fileTimestamp);
            this.attr = this._io.readU1();
            this.lhaLevel = this._io.readU1();
        }

        public void _fetchInstances() {
            this.fileTimestamp._fetchInstances();
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
        public int headerChecksum() { return headerChecksum; }
        public String methodId() { return methodId; }

        /**
         * Compressed file size
         */
        public long fileSizeCompr() { return fileSizeCompr; }

        /**
         * Uncompressed file size
         */
        public long fileSizeUncompr() { return fileSizeUncompr; }

        /**
         * Original file date/time
         */
        public DosDatetime fileTimestamp() { return fileTimestamp; }

        /**
         * File or directory attribute
         */
        public int attr() { return attr; }
        public int lhaLevel() { return lhaLevel; }
        public Lzh _root() { return _root; }
        public Lzh.Header _parent() { return _parent; }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.headerLen = this._io.readU1();
            if (headerLen() > 0) {
                this.fileRecord = new FileRecord(this._io, this, _root);
            }
        }

        public void _fetchInstances() {
            if (headerLen() > 0) {
                this.fileRecord._fetchInstances();
            }
        }
        private int headerLen;
        private FileRecord fileRecord;
        private Lzh _root;
        private Lzh _parent;
        public int headerLen() { return headerLen; }
        public FileRecord fileRecord() { return fileRecord; }
        public Lzh _root() { return _root; }
        public Lzh _parent() { return _parent; }
    }
    private List<Record> entries;
    private Lzh _root;
    private KaitaiStruct _parent;
    public List<Record> entries() { return entries; }
    public Lzh _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
