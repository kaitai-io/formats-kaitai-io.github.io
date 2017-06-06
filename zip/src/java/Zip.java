// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class Zip extends KaitaiStruct {
    public static Zip fromFile(String fileName) throws IOException {
        return new Zip(new KaitaiStream(fileName));
    }

    public enum Compression {
        NONE(0),
        SHRUNK(1),
        REDUCED_1(2),
        REDUCED_2(3),
        REDUCED_3(4),
        REDUCED_4(5),
        IMPLODED(6),
        DEFLATED(8),
        ENHANCED_DEFLATED(9),
        PKWARE_DCL_IMPLODED(10),
        BZIP2(12),
        LZMA(14),
        IBM_TERSE(18),
        IBM_LZ77_Z(19),
        PPMD(98);

        private final long id;
        Compression(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Compression> byId = new HashMap<Long, Compression>(15);
        static {
            for (Compression e : Compression.values())
                byId.put(e.id(), e);
        }
        public static Compression byId(long id) { return byId.get(id); }
    }

    public Zip(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Zip(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Zip(KaitaiStream _io, KaitaiStruct _parent, Zip _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.sections = new ArrayList<PkSection>();
        while (!this._io.isEof()) {
            this.sections.add(new PkSection(this._io, this, _root));
        }
    }
    public static class LocalFile extends KaitaiStruct {
        public static LocalFile fromFile(String fileName) throws IOException {
            return new LocalFile(new KaitaiStream(fileName));
        }

        public LocalFile(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public LocalFile(KaitaiStream _io, Zip.PkSection _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public LocalFile(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.header = new LocalFileHeader(this._io, this, _root);
            this.body = this._io.readBytes(header().compressedSize());
        }
        private LocalFileHeader header;
        private byte[] body;
        private Zip _root;
        private Zip.PkSection _parent;
        public LocalFileHeader header() { return header; }
        public byte[] body() { return body; }
        public Zip _root() { return _root; }
        public Zip.PkSection _parent() { return _parent; }
    }
    public static class CentralDirEntry extends KaitaiStruct {
        public static CentralDirEntry fromFile(String fileName) throws IOException {
            return new CentralDirEntry(new KaitaiStream(fileName));
        }

        public CentralDirEntry(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public CentralDirEntry(KaitaiStream _io, Zip.PkSection _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public CentralDirEntry(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.versionMadeBy = this._io.readU2le();
            this.versionNeededToExtract = this._io.readU2le();
            this.flags = this._io.readU2le();
            this.compressionMethod = this._io.readU2le();
            this.lastModFileTime = this._io.readU2le();
            this.lastModFileDate = this._io.readU2le();
            this.crc32 = this._io.readU4le();
            this.compressedSize = this._io.readU4le();
            this.uncompressedSize = this._io.readU4le();
            this.fileNameLen = this._io.readU2le();
            this.extraLen = this._io.readU2le();
            this.commentLen = this._io.readU2le();
            this.diskNumberStart = this._io.readU2le();
            this.intFileAttr = this._io.readU2le();
            this.extFileAttr = this._io.readU4le();
            this.localHeaderOffset = this._io.readS4le();
            this.fileName = new String(this._io.readBytes(fileNameLen()), Charset.forName("UTF-8"));
            this.extra = this._io.readBytes(extraLen());
            this.comment = new String(this._io.readBytes(commentLen()), Charset.forName("UTF-8"));
        }
        private int versionMadeBy;
        private int versionNeededToExtract;
        private int flags;
        private int compressionMethod;
        private int lastModFileTime;
        private int lastModFileDate;
        private long crc32;
        private long compressedSize;
        private long uncompressedSize;
        private int fileNameLen;
        private int extraLen;
        private int commentLen;
        private int diskNumberStart;
        private int intFileAttr;
        private long extFileAttr;
        private int localHeaderOffset;
        private String fileName;
        private byte[] extra;
        private String comment;
        private Zip _root;
        private Zip.PkSection _parent;
        public int versionMadeBy() { return versionMadeBy; }
        public int versionNeededToExtract() { return versionNeededToExtract; }
        public int flags() { return flags; }
        public int compressionMethod() { return compressionMethod; }
        public int lastModFileTime() { return lastModFileTime; }
        public int lastModFileDate() { return lastModFileDate; }
        public long crc32() { return crc32; }
        public long compressedSize() { return compressedSize; }
        public long uncompressedSize() { return uncompressedSize; }
        public int fileNameLen() { return fileNameLen; }
        public int extraLen() { return extraLen; }
        public int commentLen() { return commentLen; }
        public int diskNumberStart() { return diskNumberStart; }
        public int intFileAttr() { return intFileAttr; }
        public long extFileAttr() { return extFileAttr; }
        public int localHeaderOffset() { return localHeaderOffset; }
        public String fileName() { return fileName; }
        public byte[] extra() { return extra; }
        public String comment() { return comment; }
        public Zip _root() { return _root; }
        public Zip.PkSection _parent() { return _parent; }
    }
    public static class PkSection extends KaitaiStruct {
        public static PkSection fromFile(String fileName) throws IOException {
            return new PkSection(new KaitaiStream(fileName));
        }

        public PkSection(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public PkSection(KaitaiStream _io, Zip _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public PkSection(KaitaiStream _io, Zip _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 80, 75 });
            this.sectionType = this._io.readU2le();
            switch (sectionType()) {
            case 513: {
                this.body = new CentralDirEntry(this._io, this, _root);
                break;
            }
            case 1027: {
                this.body = new LocalFile(this._io, this, _root);
                break;
            }
            case 1541: {
                this.body = new EndOfCentralDir(this._io, this, _root);
                break;
            }
            }
        }
        private byte[] magic;
        private int sectionType;
        private KaitaiStruct body;
        private Zip _root;
        private Zip _parent;
        public byte[] magic() { return magic; }
        public int sectionType() { return sectionType; }
        public KaitaiStruct body() { return body; }
        public Zip _root() { return _root; }
        public Zip _parent() { return _parent; }
    }
    public static class LocalFileHeader extends KaitaiStruct {
        public static LocalFileHeader fromFile(String fileName) throws IOException {
            return new LocalFileHeader(new KaitaiStream(fileName));
        }

        public LocalFileHeader(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public LocalFileHeader(KaitaiStream _io, Zip.LocalFile _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public LocalFileHeader(KaitaiStream _io, Zip.LocalFile _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.version = this._io.readU2le();
            this.flags = this._io.readU2le();
            this.compression = Zip.Compression.byId(this._io.readU2le());
            this.fileModTime = this._io.readU2le();
            this.fileModDate = this._io.readU2le();
            this.crc32 = this._io.readU4le();
            this.compressedSize = this._io.readU4le();
            this.uncompressedSize = this._io.readU4le();
            this.fileNameLen = this._io.readU2le();
            this.extraLen = this._io.readU2le();
            this.fileName = new String(this._io.readBytes(fileNameLen()), Charset.forName("UTF-8"));
            this.extra = this._io.readBytes(extraLen());
        }
        private int version;
        private int flags;
        private Compression compression;
        private int fileModTime;
        private int fileModDate;
        private long crc32;
        private long compressedSize;
        private long uncompressedSize;
        private int fileNameLen;
        private int extraLen;
        private String fileName;
        private byte[] extra;
        private Zip _root;
        private Zip.LocalFile _parent;
        public int version() { return version; }
        public int flags() { return flags; }
        public Compression compression() { return compression; }
        public int fileModTime() { return fileModTime; }
        public int fileModDate() { return fileModDate; }
        public long crc32() { return crc32; }
        public long compressedSize() { return compressedSize; }
        public long uncompressedSize() { return uncompressedSize; }
        public int fileNameLen() { return fileNameLen; }
        public int extraLen() { return extraLen; }
        public String fileName() { return fileName; }
        public byte[] extra() { return extra; }
        public Zip _root() { return _root; }
        public Zip.LocalFile _parent() { return _parent; }
    }
    public static class EndOfCentralDir extends KaitaiStruct {
        public static EndOfCentralDir fromFile(String fileName) throws IOException {
            return new EndOfCentralDir(new KaitaiStream(fileName));
        }

        public EndOfCentralDir(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public EndOfCentralDir(KaitaiStream _io, Zip.PkSection _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public EndOfCentralDir(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.diskOfEndOfCentralDir = this._io.readU2le();
            this.diskOfCentralDir = this._io.readU2le();
            this.qtyCentralDirEntriesOnDisk = this._io.readU2le();
            this.qtyCentralDirEntriesTotal = this._io.readU2le();
            this.centralDirSize = this._io.readU4le();
            this.centralDirOffset = this._io.readU4le();
            this.commentLen = this._io.readU2le();
            this.comment = new String(this._io.readBytes(commentLen()), Charset.forName("UTF-8"));
        }
        private int diskOfEndOfCentralDir;
        private int diskOfCentralDir;
        private int qtyCentralDirEntriesOnDisk;
        private int qtyCentralDirEntriesTotal;
        private long centralDirSize;
        private long centralDirOffset;
        private int commentLen;
        private String comment;
        private Zip _root;
        private Zip.PkSection _parent;
        public int diskOfEndOfCentralDir() { return diskOfEndOfCentralDir; }
        public int diskOfCentralDir() { return diskOfCentralDir; }
        public int qtyCentralDirEntriesOnDisk() { return qtyCentralDirEntriesOnDisk; }
        public int qtyCentralDirEntriesTotal() { return qtyCentralDirEntriesTotal; }
        public long centralDirSize() { return centralDirSize; }
        public long centralDirOffset() { return centralDirOffset; }
        public int commentLen() { return commentLen; }
        public String comment() { return comment; }
        public Zip _root() { return _root; }
        public Zip.PkSection _parent() { return _parent; }
    }
    private ArrayList<PkSection> sections;
    private Zip _root;
    private KaitaiStruct _parent;
    public ArrayList<PkSection> sections() { return sections; }
    public Zip _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
