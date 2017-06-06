// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;


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
        return new Lzh(new KaitaiStream(fileName));
    }

    public Lzh(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Lzh(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Lzh(KaitaiStream _io, KaitaiStruct _parent, Lzh _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.entries = new ArrayList<Record>();
        while (!this._io.isEof()) {
            this.entries.add(new Record(this._io, this, _root));
        }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new KaitaiStream(fileName));
        }

        public Record(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Record(KaitaiStream _io, Lzh _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Record(KaitaiStream _io, Lzh _parent, Lzh _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.headerLen = this._io.readU1();
            if (headerLen() > 0) {
                this.fileRecord = new FileRecord(this._io, this, _root);
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
    public static class FileRecord extends KaitaiStruct {
        public static FileRecord fromFile(String fileName) throws IOException {
            return new FileRecord(new KaitaiStream(fileName));
        }

        public FileRecord(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public FileRecord(KaitaiStream _io, Lzh.Record _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public FileRecord(KaitaiStream _io, Lzh.Record _parent, Lzh _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this._raw_header = this._io.readBytes((_parent().headerLen() - 1));
            KaitaiStream _io__raw_header = new KaitaiStream(_raw_header);
            this.header = new Header(_io__raw_header, this, _root);
            if (header().header1().lhaLevel() == 0) {
                this.fileUncomprCrc16 = this._io.readU2le();
            }
            this.body = this._io.readBytes(header().header1().fileSizeCompr());
        }
        private Header header;
        private Integer fileUncomprCrc16;
        private byte[] body;
        private Lzh _root;
        private Lzh.Record _parent;
        private byte[] _raw_header;
        public Header header() { return header; }
        public Integer fileUncomprCrc16() { return fileUncomprCrc16; }
        public byte[] body() { return body; }
        public Lzh _root() { return _root; }
        public Lzh.Record _parent() { return _parent; }
        public byte[] _raw_header() { return _raw_header; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new KaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Header(KaitaiStream _io, Lzh.FileRecord _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Header(KaitaiStream _io, Lzh.FileRecord _parent, Lzh _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.header1 = new Header1(this._io, this, _root);
            if (header1().lhaLevel() == 0) {
                this.filenameLen = this._io.readU1();
            }
            if (header1().lhaLevel() == 0) {
                this.filename = new String(this._io.readBytes(filenameLen()), Charset.forName("ASCII"));
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
            return new Header1(new KaitaiStream(fileName));
        }

        public Header1(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Header1(KaitaiStream _io, Lzh.Header _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Header1(KaitaiStream _io, Lzh.Header _parent, Lzh _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.headerChecksum = this._io.readU1();
            this.methodId = new String(this._io.readBytes(5), Charset.forName("ASCII"));
            this.fileSizeCompr = this._io.readU4le();
            this.fileSizeUncompr = this._io.readU4le();
            this.fileTimestamp = this._io.readU4le();
            this.attr = this._io.readU1();
            this.lhaLevel = this._io.readU1();
        }
        private int headerChecksum;
        private String methodId;
        private long fileSizeCompr;
        private long fileSizeUncompr;
        private long fileTimestamp;
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
        public long fileTimestamp() { return fileTimestamp; }

        /**
         * File or directory attribute
         */
        public int attr() { return attr; }
        public int lhaLevel() { return lhaLevel; }
        public Lzh _root() { return _root; }
        public Lzh.Header _parent() { return _parent; }
    }
    private ArrayList<Record> entries;
    private Lzh _root;
    private KaitaiStruct _parent;
    public ArrayList<Record> entries() { return entries; }
    public Lzh _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
