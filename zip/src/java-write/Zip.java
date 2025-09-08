// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Arrays;


/**
 * ZIP is a popular archive file format, introduced in 1989 by Phil Katz
 * and originally implemented in PKZIP utility by PKWARE.
 * 
 * Thanks to solid support of it in most desktop environments and
 * operating systems, and algorithms / specs availability in public
 * domain, it quickly became tool of choice for implementing file
 * containers.
 * 
 * For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
 * are actually ZIP archives.
 * @see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">Source</a>
 * @see <a href="https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html">Source</a>
 */
public class Zip extends KaitaiStruct.ReadWrite {
    public static Zip fromFile(String fileName) throws IOException {
        return new Zip(new ByteBufferKaitaiStream(fileName));
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
        ZSTANDARD(93),
        MP3(94),
        XZ(95),
        JPEG(96),
        WAVPACK(97),
        PPMD(98),
        AEX_ENCRYPTION_MARKER(99);

        private final long id;
        Compression(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Compression> byId = new HashMap<Long, Compression>(21);
        static {
            for (Compression e : Compression.values())
                byId.put(e.id(), e);
        }
        public static Compression byId(long id) { return byId.get(id); }
    }

    public enum ExtraCodes {
        ZIP64(1),
        AV_INFO(7),
        OS2(9),
        NTFS(10),
        OPENVMS(12),
        PKWARE_UNIX(13),
        FILE_STREAM_AND_FORK_DESCRIPTORS(14),
        PATCH_DESCRIPTOR(15),
        PKCS7(20),
        X509_CERT_ID_AND_SIGNATURE_FOR_FILE(21),
        X509_CERT_ID_FOR_CENTRAL_DIR(22),
        STRONG_ENCRYPTION_HEADER(23),
        RECORD_MANAGEMENT_CONTROLS(24),
        PKCS7_ENC_RECIP_CERT_LIST(25),
        IBM_S390_UNCOMP(101),
        IBM_S390_COMP(102),
        POSZIP_4690(18064),
        EXTENDED_TIMESTAMP(21589),
        BEOS(25922),
        ASI_UNIX(30062),
        INFOZIP_UNIX(30805),
        INFOZIP_UNIX_VAR_SIZE(30837),
        AEX_ENCRYPTION(39169),
        APACHE_COMMONS_COMPRESS(41246),
        MICROSOFT_OPEN_PACKAGING_GROWTH_HINT(41504),
        SMS_QDOS(64842);

        private final long id;
        ExtraCodes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ExtraCodes> byId = new HashMap<Long, ExtraCodes>(26);
        static {
            for (ExtraCodes e : ExtraCodes.values())
                byId.put(e.id(), e);
        }
        public static ExtraCodes byId(long id) { return byId.get(id); }
    }
    public Zip() {
        this(null, null, null);
    }

    public Zip(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Zip(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Zip(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Zip _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.sections = new ArrayList<PkSection>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                PkSection _t_sections = new PkSection(this._io, this, _root);
                try {
                    _t_sections._read();
                } finally {
                    this.sections.add(_t_sections);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.sections.size(); i++) {
            this.sections.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.sections.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("sections", 0, this._io.size() - this._io.pos());
            this.sections.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("sections", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.sections.size(); i++) {
            if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("sections", _root(), this.sections.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("sections", this, this.sections.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">- 4.3.12</a>
     */
    public static class CentralDirEntry extends KaitaiStruct.ReadWrite {
        public static CentralDirEntry fromFile(String fileName) throws IOException {
            return new CentralDirEntry(new ByteBufferKaitaiStream(fileName));
        }
        public CentralDirEntry() {
            this(null, null, null);
        }

        public CentralDirEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CentralDirEntry(KaitaiStream _io, Zip.PkSection _parent) {
            this(_io, _parent, null);
        }

        public CentralDirEntry(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.versionMadeBy = this._io.readU2le();
            this.versionNeededToExtract = this._io.readU2le();
            this.flags = this._io.readU2le();
            this.compressionMethod = Zip.Compression.byId(this._io.readU2le());
            this._raw_fileModTime = this._io.readBytes(4);
            KaitaiStream _io__raw_fileModTime = new ByteBufferKaitaiStream(this._raw_fileModTime);
            this.fileModTime = new DosDatetime(_io__raw_fileModTime);
            this.fileModTime._read();
            this.crc32 = this._io.readU4le();
            this.lenBodyCompressed = this._io.readU4le();
            this.lenBodyUncompressed = this._io.readU4le();
            this.lenFileName = this._io.readU2le();
            this.lenExtra = this._io.readU2le();
            this.lenComment = this._io.readU2le();
            this.diskNumberStart = this._io.readU2le();
            this.intFileAttr = this._io.readU2le();
            this.extFileAttr = this._io.readU4le();
            this.ofsLocalHeader = this._io.readS4le();
            this.fileName = new String(this._io.readBytes(lenFileName()), StandardCharsets.UTF_8);
            this._raw_extra = this._io.readBytes(lenExtra());
            KaitaiStream _io__raw_extra = new ByteBufferKaitaiStream(this._raw_extra);
            this.extra = new Extras(_io__raw_extra, this, _root);
            this.extra._read();
            this.comment = new String(this._io.readBytes(lenComment()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.fileModTime._fetchInstances();
            this.extra._fetchInstances();
            localHeader();
            if (this.localHeader != null) {
                this.localHeader._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteLocalHeader = _enabledLocalHeader;
            this._io.writeU2le(this.versionMadeBy);
            this._io.writeU2le(this.versionNeededToExtract);
            this._io.writeU2le(this.flags);
            this._io.writeU2le(((Number) (this.compressionMethod.id())).intValue());
            final KaitaiStream _io__raw_fileModTime = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_fileModTime);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final CentralDirEntry _this = this;
                _io__raw_fileModTime.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_fileModTime = _io__raw_fileModTime.toByteArray();
                        if (_this._raw_fileModTime.length != 4)
                            throw new ConsistencyError("raw(file_mod_time)", 4, _this._raw_fileModTime.length);
                        parent.writeBytes(_this._raw_fileModTime);
                    }
                });
            }
            this.fileModTime._write_Seq(_io__raw_fileModTime);
            this._io.writeU4le(this.crc32);
            this._io.writeU4le(this.lenBodyCompressed);
            this._io.writeU4le(this.lenBodyUncompressed);
            this._io.writeU2le(this.lenFileName);
            this._io.writeU2le(this.lenExtra);
            this._io.writeU2le(this.lenComment);
            this._io.writeU2le(this.diskNumberStart);
            this._io.writeU2le(this.intFileAttr);
            this._io.writeU4le(this.extFileAttr);
            this._io.writeS4le(this.ofsLocalHeader);
            this._io.writeBytes((this.fileName).getBytes(Charset.forName("UTF-8")));
            final KaitaiStream _io__raw_extra = new ByteBufferKaitaiStream(lenExtra());
            this._io.addChildStream(_io__raw_extra);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenExtra()));
                final CentralDirEntry _this = this;
                _io__raw_extra.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_extra = _io__raw_extra.toByteArray();
                        if (_this._raw_extra.length != lenExtra())
                            throw new ConsistencyError("raw(extra)", lenExtra(), _this._raw_extra.length);
                        parent.writeBytes(_this._raw_extra);
                    }
                });
            }
            this.extra._write_Seq(_io__raw_extra);
            this._io.writeBytes((this.comment).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.fileName).getBytes(Charset.forName("UTF-8")).length != lenFileName())
                throw new ConsistencyError("file_name", lenFileName(), (this.fileName).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.extra._root(), _root()))
                throw new ConsistencyError("extra", _root(), this.extra._root());
            if (!Objects.equals(this.extra._parent(), this))
                throw new ConsistencyError("extra", this, this.extra._parent());
            if ((this.comment).getBytes(Charset.forName("UTF-8")).length != lenComment())
                throw new ConsistencyError("comment", lenComment(), (this.comment).getBytes(Charset.forName("UTF-8")).length);
            if (_enabledLocalHeader) {
                if (!Objects.equals(this.localHeader._root(), _root()))
                    throw new ConsistencyError("local_header", _root(), this.localHeader._root());
                if (!Objects.equals(this.localHeader._parent(), this))
                    throw new ConsistencyError("local_header", this, this.localHeader._parent());
            }
            _dirty = false;
        }
        private PkSection localHeader;
        private boolean _shouldWriteLocalHeader = false;
        private boolean _enabledLocalHeader = true;
        public PkSection localHeader() {
            if (_shouldWriteLocalHeader)
                _writeLocalHeader();
            if (this.localHeader != null)
                return this.localHeader;
            if (!_enabledLocalHeader)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsLocalHeader());
            this.localHeader = new PkSection(this._io, this, _root);
            this.localHeader._read();
            this._io.seek(_pos);
            return this.localHeader;
        }
        public void setLocalHeader(PkSection _v) { _dirty = true; localHeader = _v; }
        public void setLocalHeader_Enabled(boolean _v) { _dirty = true; _enabledLocalHeader = _v; }

        private void _writeLocalHeader() {
            _shouldWriteLocalHeader = false;
            long _pos = this._io.pos();
            this._io.seek(ofsLocalHeader());
            this.localHeader._write_Seq(this._io);
            this._io.seek(_pos);
        }
        private int versionMadeBy;
        private int versionNeededToExtract;
        private int flags;
        private Compression compressionMethod;
        private DosDatetime fileModTime;
        private long crc32;
        private long lenBodyCompressed;
        private long lenBodyUncompressed;
        private int lenFileName;
        private int lenExtra;
        private int lenComment;
        private int diskNumberStart;
        private int intFileAttr;
        private long extFileAttr;
        private int ofsLocalHeader;
        private String fileName;
        private Extras extra;
        private String comment;
        private Zip _root;
        private Zip.PkSection _parent;
        private byte[] _raw_fileModTime;
        private byte[] _raw_extra;
        public int versionMadeBy() { return versionMadeBy; }
        public void setVersionMadeBy(int _v) { _dirty = true; versionMadeBy = _v; }
        public int versionNeededToExtract() { return versionNeededToExtract; }
        public void setVersionNeededToExtract(int _v) { _dirty = true; versionNeededToExtract = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public Compression compressionMethod() { return compressionMethod; }
        public void setCompressionMethod(Compression _v) { _dirty = true; compressionMethod = _v; }
        public DosDatetime fileModTime() { return fileModTime; }
        public void setFileModTime(DosDatetime _v) { _dirty = true; fileModTime = _v; }
        public long crc32() { return crc32; }
        public void setCrc32(long _v) { _dirty = true; crc32 = _v; }
        public long lenBodyCompressed() { return lenBodyCompressed; }
        public void setLenBodyCompressed(long _v) { _dirty = true; lenBodyCompressed = _v; }
        public long lenBodyUncompressed() { return lenBodyUncompressed; }
        public void setLenBodyUncompressed(long _v) { _dirty = true; lenBodyUncompressed = _v; }
        public int lenFileName() { return lenFileName; }
        public void setLenFileName(int _v) { _dirty = true; lenFileName = _v; }
        public int lenExtra() { return lenExtra; }
        public void setLenExtra(int _v) { _dirty = true; lenExtra = _v; }
        public int lenComment() { return lenComment; }
        public void setLenComment(int _v) { _dirty = true; lenComment = _v; }
        public int diskNumberStart() { return diskNumberStart; }
        public void setDiskNumberStart(int _v) { _dirty = true; diskNumberStart = _v; }
        public int intFileAttr() { return intFileAttr; }
        public void setIntFileAttr(int _v) { _dirty = true; intFileAttr = _v; }
        public long extFileAttr() { return extFileAttr; }
        public void setExtFileAttr(long _v) { _dirty = true; extFileAttr = _v; }
        public int ofsLocalHeader() { return ofsLocalHeader; }
        public void setOfsLocalHeader(int _v) { _dirty = true; ofsLocalHeader = _v; }
        public String fileName() { return fileName; }
        public void setFileName(String _v) { _dirty = true; fileName = _v; }
        public Extras extra() { return extra; }
        public void setExtra(Extras _v) { _dirty = true; extra = _v; }
        public String comment() { return comment; }
        public void setComment(String _v) { _dirty = true; comment = _v; }
        public Zip _root() { return _root; }
        public void set_root(Zip _v) { _dirty = true; _root = _v; }
        public Zip.PkSection _parent() { return _parent; }
        public void set_parent(Zip.PkSection _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_fileModTime() { return _raw_fileModTime; }
        public void set_raw_FileModTime(byte[] _v) { _dirty = true; _raw_fileModTime = _v; }
        public byte[] _raw_extra() { return _raw_extra; }
        public void set_raw_Extra(byte[] _v) { _dirty = true; _raw_extra = _v; }
    }
    public static class DataDescriptor extends KaitaiStruct.ReadWrite {
        public static DataDescriptor fromFile(String fileName) throws IOException {
            return new DataDescriptor(new ByteBufferKaitaiStream(fileName));
        }
        public DataDescriptor() {
            this(null, null, null);
        }

        public DataDescriptor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataDescriptor(KaitaiStream _io, Zip.PkSection _parent) {
            this(_io, _parent, null);
        }

        public DataDescriptor(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.crc32 = this._io.readU4le();
            this.lenBodyCompressed = this._io.readU4le();
            this.lenBodyUncompressed = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.crc32);
            this._io.writeU4le(this.lenBodyCompressed);
            this._io.writeU4le(this.lenBodyUncompressed);
        }

        public void _check() {
            _dirty = false;
        }
        private long crc32;
        private long lenBodyCompressed;
        private long lenBodyUncompressed;
        private Zip _root;
        private Zip.PkSection _parent;
        public long crc32() { return crc32; }
        public void setCrc32(long _v) { _dirty = true; crc32 = _v; }
        public long lenBodyCompressed() { return lenBodyCompressed; }
        public void setLenBodyCompressed(long _v) { _dirty = true; lenBodyCompressed = _v; }
        public long lenBodyUncompressed() { return lenBodyUncompressed; }
        public void setLenBodyUncompressed(long _v) { _dirty = true; lenBodyUncompressed = _v; }
        public Zip _root() { return _root; }
        public void set_root(Zip _v) { _dirty = true; _root = _v; }
        public Zip.PkSection _parent() { return _parent; }
        public void set_parent(Zip.PkSection _v) { _dirty = true; _parent = _v; }
    }
    public static class EndOfCentralDir extends KaitaiStruct.ReadWrite {
        public static EndOfCentralDir fromFile(String fileName) throws IOException {
            return new EndOfCentralDir(new ByteBufferKaitaiStream(fileName));
        }
        public EndOfCentralDir() {
            this(null, null, null);
        }

        public EndOfCentralDir(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EndOfCentralDir(KaitaiStream _io, Zip.PkSection _parent) {
            this(_io, _parent, null);
        }

        public EndOfCentralDir(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.diskOfEndOfCentralDir = this._io.readU2le();
            this.diskOfCentralDir = this._io.readU2le();
            this.numCentralDirEntriesOnDisk = this._io.readU2le();
            this.numCentralDirEntriesTotal = this._io.readU2le();
            this.lenCentralDir = this._io.readU4le();
            this.ofsCentralDir = this._io.readU4le();
            this.lenComment = this._io.readU2le();
            this.comment = new String(this._io.readBytes(lenComment()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.diskOfEndOfCentralDir);
            this._io.writeU2le(this.diskOfCentralDir);
            this._io.writeU2le(this.numCentralDirEntriesOnDisk);
            this._io.writeU2le(this.numCentralDirEntriesTotal);
            this._io.writeU4le(this.lenCentralDir);
            this._io.writeU4le(this.ofsCentralDir);
            this._io.writeU2le(this.lenComment);
            this._io.writeBytes((this.comment).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.comment).getBytes(Charset.forName("UTF-8")).length != lenComment())
                throw new ConsistencyError("comment", lenComment(), (this.comment).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private int diskOfEndOfCentralDir;
        private int diskOfCentralDir;
        private int numCentralDirEntriesOnDisk;
        private int numCentralDirEntriesTotal;
        private long lenCentralDir;
        private long ofsCentralDir;
        private int lenComment;
        private String comment;
        private Zip _root;
        private Zip.PkSection _parent;
        public int diskOfEndOfCentralDir() { return diskOfEndOfCentralDir; }
        public void setDiskOfEndOfCentralDir(int _v) { _dirty = true; diskOfEndOfCentralDir = _v; }
        public int diskOfCentralDir() { return diskOfCentralDir; }
        public void setDiskOfCentralDir(int _v) { _dirty = true; diskOfCentralDir = _v; }
        public int numCentralDirEntriesOnDisk() { return numCentralDirEntriesOnDisk; }
        public void setNumCentralDirEntriesOnDisk(int _v) { _dirty = true; numCentralDirEntriesOnDisk = _v; }
        public int numCentralDirEntriesTotal() { return numCentralDirEntriesTotal; }
        public void setNumCentralDirEntriesTotal(int _v) { _dirty = true; numCentralDirEntriesTotal = _v; }
        public long lenCentralDir() { return lenCentralDir; }
        public void setLenCentralDir(long _v) { _dirty = true; lenCentralDir = _v; }
        public long ofsCentralDir() { return ofsCentralDir; }
        public void setOfsCentralDir(long _v) { _dirty = true; ofsCentralDir = _v; }
        public int lenComment() { return lenComment; }
        public void setLenComment(int _v) { _dirty = true; lenComment = _v; }
        public String comment() { return comment; }
        public void setComment(String _v) { _dirty = true; comment = _v; }
        public Zip _root() { return _root; }
        public void set_root(Zip _v) { _dirty = true; _root = _v; }
        public Zip.PkSection _parent() { return _parent; }
        public void set_parent(Zip.PkSection _v) { _dirty = true; _parent = _v; }
    }
    public static class ExtraField extends KaitaiStruct.ReadWrite {
        public static ExtraField fromFile(String fileName) throws IOException {
            return new ExtraField(new ByteBufferKaitaiStream(fileName));
        }
        public ExtraField() {
            this(null, null, null);
        }

        public ExtraField(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExtraField(KaitaiStream _io, Zip.Extras _parent) {
            this(_io, _parent, null);
        }

        public ExtraField(KaitaiStream _io, Zip.Extras _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = Zip.ExtraCodes.byId(this._io.readU2le());
            this.lenBody = this._io.readU2le();
            {
                ExtraCodes on = code();
                if (on != null) {
                    switch (code()) {
                    case EXTENDED_TIMESTAMP: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new ExtendedTimestamp(_io__raw_body, this, _root);
                        ((ExtendedTimestamp) (this.body))._read();
                        break;
                    }
                    case INFOZIP_UNIX_VAR_SIZE: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new InfozipUnixVarSize(_io__raw_body, this, _root);
                        ((InfozipUnixVarSize) (this.body))._read();
                        break;
                    }
                    case NTFS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Ntfs(_io__raw_body, this, _root);
                        ((Ntfs) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(lenBody());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(lenBody());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                ExtraCodes on = code();
                if (on != null) {
                    switch (code()) {
                    case EXTENDED_TIMESTAMP: {
                        ((ExtendedTimestamp) (this.body))._fetchInstances();
                        break;
                    }
                    case INFOZIP_UNIX_VAR_SIZE: {
                        ((InfozipUnixVarSize) (this.body))._fetchInstances();
                        break;
                    }
                    case NTFS: {
                        ((Ntfs) (this.body))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.code.id())).intValue());
            this._io.writeU2le(this.lenBody);
            {
                ExtraCodes on = code();
                if (on != null) {
                    switch (code()) {
                    case EXTENDED_TIMESTAMP: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final ExtraField _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((ExtendedTimestamp) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case INFOZIP_UNIX_VAR_SIZE: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final ExtraField _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((InfozipUnixVarSize) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case NTFS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final ExtraField _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Ntfs) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                }
            }
        }

        public void _check() {
            {
                ExtraCodes on = code();
                if (on != null) {
                    switch (code()) {
                    case EXTENDED_TIMESTAMP: {
                        if (!Objects.equals(((Zip.ExtraField.ExtendedTimestamp) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Zip.ExtraField.ExtendedTimestamp) (this.body))._root());
                        if (!Objects.equals(((Zip.ExtraField.ExtendedTimestamp) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Zip.ExtraField.ExtendedTimestamp) (this.body))._parent());
                        break;
                    }
                    case INFOZIP_UNIX_VAR_SIZE: {
                        if (!Objects.equals(((Zip.ExtraField.InfozipUnixVarSize) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Zip.ExtraField.InfozipUnixVarSize) (this.body))._root());
                        if (!Objects.equals(((Zip.ExtraField.InfozipUnixVarSize) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Zip.ExtraField.InfozipUnixVarSize) (this.body))._parent());
                        break;
                    }
                    case NTFS: {
                        if (!Objects.equals(((Zip.ExtraField.Ntfs) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Zip.ExtraField.Ntfs) (this.body))._root());
                        if (!Objects.equals(((Zip.ExtraField.Ntfs) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Zip.ExtraField.Ntfs) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != lenBody())
                            throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != lenBody())
                        throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
        }

        /**
         * @see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L817">Source</a>
         */
        public static class ExtendedTimestamp extends KaitaiStruct.ReadWrite {
            public static ExtendedTimestamp fromFile(String fileName) throws IOException {
                return new ExtendedTimestamp(new ByteBufferKaitaiStream(fileName));
            }
            public ExtendedTimestamp() {
                this(null, null, null);
            }

            public ExtendedTimestamp(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ExtendedTimestamp(KaitaiStream _io, Zip.ExtraField _parent) {
                this(_io, _parent, null);
            }

            public ExtendedTimestamp(KaitaiStream _io, Zip.ExtraField _parent, Zip _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this._raw_flags = this._io.readBytes(1);
                KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(this._raw_flags);
                this.flags = new InfoFlags(_io__raw_flags, this, _root);
                this.flags._read();
                if (flags().hasModTime()) {
                    this.modTime = this._io.readU4le();
                }
                if (flags().hasAccessTime()) {
                    this.accessTime = this._io.readU4le();
                }
                if (flags().hasCreateTime()) {
                    this.createTime = this._io.readU4le();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                this.flags._fetchInstances();
                if (flags().hasModTime()) {
                }
                if (flags().hasAccessTime()) {
                }
                if (flags().hasCreateTime()) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                final KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(1);
                this._io.addChildStream(_io__raw_flags);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (1));
                    final ExtendedTimestamp _this = this;
                    _io__raw_flags.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_flags = _io__raw_flags.toByteArray();
                            if (_this._raw_flags.length != 1)
                                throw new ConsistencyError("raw(flags)", 1, _this._raw_flags.length);
                            parent.writeBytes(_this._raw_flags);
                        }
                    });
                }
                this.flags._write_Seq(_io__raw_flags);
                if (flags().hasModTime()) {
                    this._io.writeU4le(this.modTime);
                }
                if (flags().hasAccessTime()) {
                    this._io.writeU4le(this.accessTime);
                }
                if (flags().hasCreateTime()) {
                    this._io.writeU4le(this.createTime);
                }
            }

            public void _check() {
                if (!Objects.equals(this.flags._root(), _root()))
                    throw new ConsistencyError("flags", _root(), this.flags._root());
                if (!Objects.equals(this.flags._parent(), this))
                    throw new ConsistencyError("flags", this, this.flags._parent());
                if (flags().hasModTime()) {
                }
                if (flags().hasAccessTime()) {
                }
                if (flags().hasCreateTime()) {
                }
                _dirty = false;
            }
            public static class InfoFlags extends KaitaiStruct.ReadWrite {
                public static InfoFlags fromFile(String fileName) throws IOException {
                    return new InfoFlags(new ByteBufferKaitaiStream(fileName));
                }
                public InfoFlags() {
                    this(null, null, null);
                }

                public InfoFlags(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public InfoFlags(KaitaiStream _io, Zip.ExtraField.ExtendedTimestamp _parent) {
                    this(_io, _parent, null);
                }

                public InfoFlags(KaitaiStream _io, Zip.ExtraField.ExtendedTimestamp _parent, Zip _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.hasModTime = this._io.readBitsIntLe(1) != 0;
                    this.hasAccessTime = this._io.readBitsIntLe(1) != 0;
                    this.hasCreateTime = this._io.readBitsIntLe(1) != 0;
                    this.reserved = this._io.readBitsIntLe(5);
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBitsIntLe(1, (this.hasModTime ? 1 : 0));
                    this._io.writeBitsIntLe(1, (this.hasAccessTime ? 1 : 0));
                    this._io.writeBitsIntLe(1, (this.hasCreateTime ? 1 : 0));
                    this._io.writeBitsIntLe(5, this.reserved);
                }

                public void _check() {
                    _dirty = false;
                }
                private boolean hasModTime;
                private boolean hasAccessTime;
                private boolean hasCreateTime;
                private long reserved;
                private Zip _root;
                private Zip.ExtraField.ExtendedTimestamp _parent;
                public boolean hasModTime() { return hasModTime; }
                public void setHasModTime(boolean _v) { _dirty = true; hasModTime = _v; }
                public boolean hasAccessTime() { return hasAccessTime; }
                public void setHasAccessTime(boolean _v) { _dirty = true; hasAccessTime = _v; }
                public boolean hasCreateTime() { return hasCreateTime; }
                public void setHasCreateTime(boolean _v) { _dirty = true; hasCreateTime = _v; }
                public long reserved() { return reserved; }
                public void setReserved(long _v) { _dirty = true; reserved = _v; }
                public Zip _root() { return _root; }
                public void set_root(Zip _v) { _dirty = true; _root = _v; }
                public Zip.ExtraField.ExtendedTimestamp _parent() { return _parent; }
                public void set_parent(Zip.ExtraField.ExtendedTimestamp _v) { _dirty = true; _parent = _v; }
            }
            private InfoFlags flags;
            private Long modTime;
            private Long accessTime;
            private Long createTime;
            private Zip _root;
            private Zip.ExtraField _parent;
            private byte[] _raw_flags;
            public InfoFlags flags() { return flags; }
            public void setFlags(InfoFlags _v) { _dirty = true; flags = _v; }

            /**
             * Unix timestamp
             */
            public Long modTime() { return modTime; }
            public void setModTime(Long _v) { _dirty = true; modTime = _v; }

            /**
             * Unix timestamp
             */
            public Long accessTime() { return accessTime; }
            public void setAccessTime(Long _v) { _dirty = true; accessTime = _v; }

            /**
             * Unix timestamp
             */
            public Long createTime() { return createTime; }
            public void setCreateTime(Long _v) { _dirty = true; createTime = _v; }
            public Zip _root() { return _root; }
            public void set_root(Zip _v) { _dirty = true; _root = _v; }
            public Zip.ExtraField _parent() { return _parent; }
            public void set_parent(Zip.ExtraField _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_flags() { return _raw_flags; }
            public void set_raw_Flags(byte[] _v) { _dirty = true; _raw_flags = _v; }
        }

        /**
         * @see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L1339">Source</a>
         */
        public static class InfozipUnixVarSize extends KaitaiStruct.ReadWrite {
            public static InfozipUnixVarSize fromFile(String fileName) throws IOException {
                return new InfozipUnixVarSize(new ByteBufferKaitaiStream(fileName));
            }
            public InfozipUnixVarSize() {
                this(null, null, null);
            }

            public InfozipUnixVarSize(KaitaiStream _io) {
                this(_io, null, null);
            }

            public InfozipUnixVarSize(KaitaiStream _io, Zip.ExtraField _parent) {
                this(_io, _parent, null);
            }

            public InfozipUnixVarSize(KaitaiStream _io, Zip.ExtraField _parent, Zip _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.version = this._io.readU1();
                this.lenUid = this._io.readU1();
                this.uid = this._io.readBytes(lenUid());
                this.lenGid = this._io.readU1();
                this.gid = this._io.readBytes(lenGid());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.version);
                this._io.writeU1(this.lenUid);
                this._io.writeBytes(this.uid);
                this._io.writeU1(this.lenGid);
                this._io.writeBytes(this.gid);
            }

            public void _check() {
                if (this.uid.length != lenUid())
                    throw new ConsistencyError("uid", lenUid(), this.uid.length);
                if (this.gid.length != lenGid())
                    throw new ConsistencyError("gid", lenGid(), this.gid.length);
                _dirty = false;
            }
            private int version;
            private int lenUid;
            private byte[] uid;
            private int lenGid;
            private byte[] gid;
            private Zip _root;
            private Zip.ExtraField _parent;

            /**
             * Version of this extra field, currently 1
             */
            public int version() { return version; }
            public void setVersion(int _v) { _dirty = true; version = _v; }

            /**
             * Size of UID field
             */
            public int lenUid() { return lenUid; }
            public void setLenUid(int _v) { _dirty = true; lenUid = _v; }

            /**
             * UID (User ID) for a file
             */
            public byte[] uid() { return uid; }
            public void setUid(byte[] _v) { _dirty = true; uid = _v; }

            /**
             * Size of GID field
             */
            public int lenGid() { return lenGid; }
            public void setLenGid(int _v) { _dirty = true; lenGid = _v; }

            /**
             * GID (Group ID) for a file
             */
            public byte[] gid() { return gid; }
            public void setGid(byte[] _v) { _dirty = true; gid = _v; }
            public Zip _root() { return _root; }
            public void set_root(Zip _v) { _dirty = true; _root = _v; }
            public Zip.ExtraField _parent() { return _parent; }
            public void set_parent(Zip.ExtraField _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L191">Source</a>
         */
        public static class Ntfs extends KaitaiStruct.ReadWrite {
            public static Ntfs fromFile(String fileName) throws IOException {
                return new Ntfs(new ByteBufferKaitaiStream(fileName));
            }
            public Ntfs() {
                this(null, null, null);
            }

            public Ntfs(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Ntfs(KaitaiStream _io, Zip.ExtraField _parent) {
                this(_io, _parent, null);
            }

            public Ntfs(KaitaiStream _io, Zip.ExtraField _parent, Zip _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU4le();
                this.attributes = new ArrayList<Attribute>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        Attribute _t_attributes = new Attribute(this._io, this, _root);
                        try {
                            _t_attributes._read();
                        } finally {
                            this.attributes.add(_t_attributes);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.attributes.size(); i++) {
                    this.attributes.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.reserved);
                for (int i = 0; i < this.attributes.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("attributes", 0, this._io.size() - this._io.pos());
                    this.attributes.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("attributes", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.attributes.size(); i++) {
                    if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("attributes", _root(), this.attributes.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("attributes", this, this.attributes.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class Attribute extends KaitaiStruct.ReadWrite {
                public static Attribute fromFile(String fileName) throws IOException {
                    return new Attribute(new ByteBufferKaitaiStream(fileName));
                }
                public Attribute() {
                    this(null, null, null);
                }

                public Attribute(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Attribute(KaitaiStream _io, Zip.ExtraField.Ntfs _parent) {
                    this(_io, _parent, null);
                }

                public Attribute(KaitaiStream _io, Zip.ExtraField.Ntfs _parent, Zip _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tag = this._io.readU2le();
                    this.lenBody = this._io.readU2le();
                    switch (tag()) {
                    case 1: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Attribute1(_io__raw_body, this, _root);
                        ((Attribute1) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(lenBody());
                        break;
                    }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    switch (tag()) {
                    case 1: {
                        ((Attribute1) (this.body))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2le(this.tag);
                    this._io.writeU2le(this.lenBody);
                    switch (tag()) {
                    case 1: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Attribute _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Attribute1) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                }

                public void _check() {
                    switch (tag()) {
                    case 1: {
                        if (!Objects.equals(((Zip.ExtraField.Ntfs.Attribute1) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Zip.ExtraField.Ntfs.Attribute1) (this.body))._root());
                        if (!Objects.equals(((Zip.ExtraField.Ntfs.Attribute1) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Zip.ExtraField.Ntfs.Attribute1) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != lenBody())
                            throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                    _dirty = false;
                }
                private int tag;
                private int lenBody;
                private Object body;
                private Zip _root;
                private Zip.ExtraField.Ntfs _parent;
                private byte[] _raw_body;
                public int tag() { return tag; }
                public void setTag(int _v) { _dirty = true; tag = _v; }
                public int lenBody() { return lenBody; }
                public void setLenBody(int _v) { _dirty = true; lenBody = _v; }
                public Object body() { return body; }
                public void setBody(Object _v) { _dirty = true; body = _v; }
                public Zip _root() { return _root; }
                public void set_root(Zip _v) { _dirty = true; _root = _v; }
                public Zip.ExtraField.Ntfs _parent() { return _parent; }
                public void set_parent(Zip.ExtraField.Ntfs _v) { _dirty = true; _parent = _v; }
                public byte[] _raw_body() { return _raw_body; }
                public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
            }
            public static class Attribute1 extends KaitaiStruct.ReadWrite {
                public static Attribute1 fromFile(String fileName) throws IOException {
                    return new Attribute1(new ByteBufferKaitaiStream(fileName));
                }
                public Attribute1() {
                    this(null, null, null);
                }

                public Attribute1(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Attribute1(KaitaiStream _io, Zip.ExtraField.Ntfs.Attribute _parent) {
                    this(_io, _parent, null);
                }

                public Attribute1(KaitaiStream _io, Zip.ExtraField.Ntfs.Attribute _parent, Zip _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.lastModTime = this._io.readU8le();
                    this.lastAccessTime = this._io.readU8le();
                    this.creationTime = this._io.readU8le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU8le(this.lastModTime);
                    this._io.writeU8le(this.lastAccessTime);
                    this._io.writeU8le(this.creationTime);
                }

                public void _check() {
                    _dirty = false;
                }
                private long lastModTime;
                private long lastAccessTime;
                private long creationTime;
                private Zip _root;
                private Zip.ExtraField.Ntfs.Attribute _parent;
                public long lastModTime() { return lastModTime; }
                public void setLastModTime(long _v) { _dirty = true; lastModTime = _v; }
                public long lastAccessTime() { return lastAccessTime; }
                public void setLastAccessTime(long _v) { _dirty = true; lastAccessTime = _v; }
                public long creationTime() { return creationTime; }
                public void setCreationTime(long _v) { _dirty = true; creationTime = _v; }
                public Zip _root() { return _root; }
                public void set_root(Zip _v) { _dirty = true; _root = _v; }
                public Zip.ExtraField.Ntfs.Attribute _parent() { return _parent; }
                public void set_parent(Zip.ExtraField.Ntfs.Attribute _v) { _dirty = true; _parent = _v; }
            }
            private long reserved;
            private List<Attribute> attributes;
            private Zip _root;
            private Zip.ExtraField _parent;
            public long reserved() { return reserved; }
            public void setReserved(long _v) { _dirty = true; reserved = _v; }
            public List<Attribute> attributes() { return attributes; }
            public void setAttributes(List<Attribute> _v) { _dirty = true; attributes = _v; }
            public Zip _root() { return _root; }
            public void set_root(Zip _v) { _dirty = true; _root = _v; }
            public Zip.ExtraField _parent() { return _parent; }
            public void set_parent(Zip.ExtraField _v) { _dirty = true; _parent = _v; }
        }
        private ExtraCodes code;
        private int lenBody;
        private Object body;
        private Zip _root;
        private Zip.Extras _parent;
        private byte[] _raw_body;
        public ExtraCodes code() { return code; }
        public void setCode(ExtraCodes _v) { _dirty = true; code = _v; }
        public int lenBody() { return lenBody; }
        public void setLenBody(int _v) { _dirty = true; lenBody = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public Zip _root() { return _root; }
        public void set_root(Zip _v) { _dirty = true; _root = _v; }
        public Zip.Extras _parent() { return _parent; }
        public void set_parent(Zip.Extras _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class Extras extends KaitaiStruct.ReadWrite {
        public static Extras fromFile(String fileName) throws IOException {
            return new Extras(new ByteBufferKaitaiStream(fileName));
        }
        public Extras() {
            this(null, null, null);
        }

        public Extras(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Extras(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Extras(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<ExtraField>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    ExtraField _t_entries = new ExtraField(this._io, this, _root);
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
        private List<ExtraField> entries;
        private Zip _root;
        private KaitaiStruct.ReadWrite _parent;
        public List<ExtraField> entries() { return entries; }
        public void setEntries(List<ExtraField> _v) { _dirty = true; entries = _v; }
        public Zip _root() { return _root; }
        public void set_root(Zip _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class LocalFile extends KaitaiStruct.ReadWrite {
        public static LocalFile fromFile(String fileName) throws IOException {
            return new LocalFile(new ByteBufferKaitaiStream(fileName));
        }
        public LocalFile() {
            this(null, null, null);
        }

        public LocalFile(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LocalFile(KaitaiStream _io, Zip.PkSection _parent) {
            this(_io, _parent, null);
        }

        public LocalFile(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new LocalFileHeader(this._io, this, _root);
            this.header._read();
            this.body = this._io.readBytes(header().lenBodyCompressed());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (this.body.length != header().lenBodyCompressed())
                throw new ConsistencyError("body", header().lenBodyCompressed(), this.body.length);
            _dirty = false;
        }
        private LocalFileHeader header;
        private byte[] body;
        private Zip _root;
        private Zip.PkSection _parent;
        public LocalFileHeader header() { return header; }
        public void setHeader(LocalFileHeader _v) { _dirty = true; header = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public Zip _root() { return _root; }
        public void set_root(Zip _v) { _dirty = true; _root = _v; }
        public Zip.PkSection _parent() { return _parent; }
        public void set_parent(Zip.PkSection _v) { _dirty = true; _parent = _v; }
    }
    public static class LocalFileHeader extends KaitaiStruct.ReadWrite {
        public static LocalFileHeader fromFile(String fileName) throws IOException {
            return new LocalFileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public LocalFileHeader() {
            this(null, null, null);
        }

        public LocalFileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LocalFileHeader(KaitaiStream _io, Zip.LocalFile _parent) {
            this(_io, _parent, null);
        }

        public LocalFileHeader(KaitaiStream _io, Zip.LocalFile _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU2le();
            this._raw_flags = this._io.readBytes(2);
            KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(this._raw_flags);
            this.flags = new GpFlags(_io__raw_flags, this, _root);
            this.flags._read();
            this.compressionMethod = Zip.Compression.byId(this._io.readU2le());
            this._raw_fileModTime = this._io.readBytes(4);
            KaitaiStream _io__raw_fileModTime = new ByteBufferKaitaiStream(this._raw_fileModTime);
            this.fileModTime = new DosDatetime(_io__raw_fileModTime);
            this.fileModTime._read();
            this.crc32 = this._io.readU4le();
            this.lenBodyCompressed = this._io.readU4le();
            this.lenBodyUncompressed = this._io.readU4le();
            this.lenFileName = this._io.readU2le();
            this.lenExtra = this._io.readU2le();
            this.fileName = new String(this._io.readBytes(lenFileName()), StandardCharsets.UTF_8);
            this._raw_extra = this._io.readBytes(lenExtra());
            KaitaiStream _io__raw_extra = new ByteBufferKaitaiStream(this._raw_extra);
            this.extra = new Extras(_io__raw_extra, this, _root);
            this.extra._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            this.fileModTime._fetchInstances();
            this.extra._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.version);
            final KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(2);
            this._io.addChildStream(_io__raw_flags);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (2));
                final LocalFileHeader _this = this;
                _io__raw_flags.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_flags = _io__raw_flags.toByteArray();
                        if (_this._raw_flags.length != 2)
                            throw new ConsistencyError("raw(flags)", 2, _this._raw_flags.length);
                        parent.writeBytes(_this._raw_flags);
                    }
                });
            }
            this.flags._write_Seq(_io__raw_flags);
            this._io.writeU2le(((Number) (this.compressionMethod.id())).intValue());
            final KaitaiStream _io__raw_fileModTime = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_fileModTime);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final LocalFileHeader _this = this;
                _io__raw_fileModTime.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_fileModTime = _io__raw_fileModTime.toByteArray();
                        if (_this._raw_fileModTime.length != 4)
                            throw new ConsistencyError("raw(file_mod_time)", 4, _this._raw_fileModTime.length);
                        parent.writeBytes(_this._raw_fileModTime);
                    }
                });
            }
            this.fileModTime._write_Seq(_io__raw_fileModTime);
            this._io.writeU4le(this.crc32);
            this._io.writeU4le(this.lenBodyCompressed);
            this._io.writeU4le(this.lenBodyUncompressed);
            this._io.writeU2le(this.lenFileName);
            this._io.writeU2le(this.lenExtra);
            this._io.writeBytes((this.fileName).getBytes(Charset.forName("UTF-8")));
            final KaitaiStream _io__raw_extra = new ByteBufferKaitaiStream(lenExtra());
            this._io.addChildStream(_io__raw_extra);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenExtra()));
                final LocalFileHeader _this = this;
                _io__raw_extra.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_extra = _io__raw_extra.toByteArray();
                        if (_this._raw_extra.length != lenExtra())
                            throw new ConsistencyError("raw(extra)", lenExtra(), _this._raw_extra.length);
                        parent.writeBytes(_this._raw_extra);
                    }
                });
            }
            this.extra._write_Seq(_io__raw_extra);
        }

        public void _check() {
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if ((this.fileName).getBytes(Charset.forName("UTF-8")).length != lenFileName())
                throw new ConsistencyError("file_name", lenFileName(), (this.fileName).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.extra._root(), _root()))
                throw new ConsistencyError("extra", _root(), this.extra._root());
            if (!Objects.equals(this.extra._parent(), this))
                throw new ConsistencyError("extra", this, this.extra._parent());
            _dirty = false;
        }

        /**
         * @see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">- 4.4.4</a>
         * @see <a href="https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html">Local file headers</a>
         */
        public static class GpFlags extends KaitaiStruct.ReadWrite {
            public static GpFlags fromFile(String fileName) throws IOException {
                return new GpFlags(new ByteBufferKaitaiStream(fileName));
            }

            public enum DeflateMode {
                NORMAL(0),
                MAXIMUM(1),
                FAST(2),
                SUPER_FAST(3);

                private final long id;
                DeflateMode(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, DeflateMode> byId = new HashMap<Long, DeflateMode>(4);
                static {
                    for (DeflateMode e : DeflateMode.values())
                        byId.put(e.id(), e);
                }
                public static DeflateMode byId(long id) { return byId.get(id); }
            }
            public GpFlags() {
                this(null, null, null);
            }

            public GpFlags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public GpFlags(KaitaiStream _io, Zip.LocalFileHeader _parent) {
                this(_io, _parent, null);
            }

            public GpFlags(KaitaiStream _io, Zip.LocalFileHeader _parent, Zip _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.fileEncrypted = this._io.readBitsIntLe(1) != 0;
                this.compOptionsRaw = this._io.readBitsIntLe(2);
                this.hasDataDescriptor = this._io.readBitsIntLe(1) != 0;
                this.reserved1 = this._io.readBitsIntLe(1) != 0;
                this.compPatchedData = this._io.readBitsIntLe(1) != 0;
                this.strongEncrypt = this._io.readBitsIntLe(1) != 0;
                this.reserved2 = this._io.readBitsIntLe(4);
                this.langEncoding = this._io.readBitsIntLe(1) != 0;
                this.reserved3 = this._io.readBitsIntLe(1) != 0;
                this.maskHeaderValues = this._io.readBitsIntLe(1) != 0;
                this.reserved4 = this._io.readBitsIntLe(2);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntLe(1, (this.fileEncrypted ? 1 : 0));
                this._io.writeBitsIntLe(2, this.compOptionsRaw);
                this._io.writeBitsIntLe(1, (this.hasDataDescriptor ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.reserved1 ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.compPatchedData ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.strongEncrypt ? 1 : 0));
                this._io.writeBitsIntLe(4, this.reserved2);
                this._io.writeBitsIntLe(1, (this.langEncoding ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.reserved3 ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.maskHeaderValues ? 1 : 0));
                this._io.writeBitsIntLe(2, this.reserved4);
            }

            public void _check() {
                _dirty = false;
            }
            private DeflateMode deflatedMode;
            public DeflateMode deflatedMode() {
                if (this.deflatedMode != null)
                    return this.deflatedMode;
                if ( ((_parent().compressionMethod() == Zip.Compression.DEFLATED) || (_parent().compressionMethod() == Zip.Compression.ENHANCED_DEFLATED)) ) {
                    this.deflatedMode = DeflateMode.byId(compOptionsRaw());
                }
                return this.deflatedMode;
            }
            public void _invalidateDeflatedMode() { this.deflatedMode = null; }
            private Integer implodedDictByteSize;

            /**
             * 8KiB or 4KiB in bytes
             */
            public Integer implodedDictByteSize() {
                if (this.implodedDictByteSize != null)
                    return this.implodedDictByteSize;
                if (_parent().compressionMethod() == Zip.Compression.IMPLODED) {
                    this.implodedDictByteSize = ((Number) (((compOptionsRaw() & 1) != 0 ? 8 : 4) * 1024)).intValue();
                }
                return this.implodedDictByteSize;
            }
            public void _invalidateImplodedDictByteSize() { this.implodedDictByteSize = null; }
            private Byte implodedNumSfTrees;
            public Byte implodedNumSfTrees() {
                if (this.implodedNumSfTrees != null)
                    return this.implodedNumSfTrees;
                if (_parent().compressionMethod() == Zip.Compression.IMPLODED) {
                    this.implodedNumSfTrees = ((Number) (((compOptionsRaw() & 2) != 0 ? 3 : 2))).byteValue();
                }
                return this.implodedNumSfTrees;
            }
            public void _invalidateImplodedNumSfTrees() { this.implodedNumSfTrees = null; }
            private Boolean lzmaHasEosMarker;
            public Boolean lzmaHasEosMarker() {
                if (this.lzmaHasEosMarker != null)
                    return this.lzmaHasEosMarker;
                if (_parent().compressionMethod() == Zip.Compression.LZMA) {
                    this.lzmaHasEosMarker = (compOptionsRaw() & 1) != 0;
                }
                return this.lzmaHasEosMarker;
            }
            public void _invalidateLzmaHasEosMarker() { this.lzmaHasEosMarker = null; }
            private boolean fileEncrypted;
            private long compOptionsRaw;
            private boolean hasDataDescriptor;
            private boolean reserved1;
            private boolean compPatchedData;
            private boolean strongEncrypt;
            private long reserved2;
            private boolean langEncoding;
            private boolean reserved3;
            private boolean maskHeaderValues;
            private long reserved4;
            private Zip _root;
            private Zip.LocalFileHeader _parent;
            public boolean fileEncrypted() { return fileEncrypted; }
            public void setFileEncrypted(boolean _v) { _dirty = true; fileEncrypted = _v; }

            /**
             * internal; access derived value instances instead
             */
            public long compOptionsRaw() { return compOptionsRaw; }
            public void setCompOptionsRaw(long _v) { _dirty = true; compOptionsRaw = _v; }
            public boolean hasDataDescriptor() { return hasDataDescriptor; }
            public void setHasDataDescriptor(boolean _v) { _dirty = true; hasDataDescriptor = _v; }
            public boolean reserved1() { return reserved1; }
            public void setReserved1(boolean _v) { _dirty = true; reserved1 = _v; }
            public boolean compPatchedData() { return compPatchedData; }
            public void setCompPatchedData(boolean _v) { _dirty = true; compPatchedData = _v; }
            public boolean strongEncrypt() { return strongEncrypt; }
            public void setStrongEncrypt(boolean _v) { _dirty = true; strongEncrypt = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
            public boolean langEncoding() { return langEncoding; }
            public void setLangEncoding(boolean _v) { _dirty = true; langEncoding = _v; }
            public boolean reserved3() { return reserved3; }
            public void setReserved3(boolean _v) { _dirty = true; reserved3 = _v; }
            public boolean maskHeaderValues() { return maskHeaderValues; }
            public void setMaskHeaderValues(boolean _v) { _dirty = true; maskHeaderValues = _v; }
            public long reserved4() { return reserved4; }
            public void setReserved4(long _v) { _dirty = true; reserved4 = _v; }
            public Zip _root() { return _root; }
            public void set_root(Zip _v) { _dirty = true; _root = _v; }
            public Zip.LocalFileHeader _parent() { return _parent; }
            public void set_parent(Zip.LocalFileHeader _v) { _dirty = true; _parent = _v; }
        }
        private int version;
        private GpFlags flags;
        private Compression compressionMethod;
        private DosDatetime fileModTime;
        private long crc32;
        private long lenBodyCompressed;
        private long lenBodyUncompressed;
        private int lenFileName;
        private int lenExtra;
        private String fileName;
        private Extras extra;
        private Zip _root;
        private Zip.LocalFile _parent;
        private byte[] _raw_flags;
        private byte[] _raw_fileModTime;
        private byte[] _raw_extra;
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public GpFlags flags() { return flags; }
        public void setFlags(GpFlags _v) { _dirty = true; flags = _v; }
        public Compression compressionMethod() { return compressionMethod; }
        public void setCompressionMethod(Compression _v) { _dirty = true; compressionMethod = _v; }
        public DosDatetime fileModTime() { return fileModTime; }
        public void setFileModTime(DosDatetime _v) { _dirty = true; fileModTime = _v; }
        public long crc32() { return crc32; }
        public void setCrc32(long _v) { _dirty = true; crc32 = _v; }
        public long lenBodyCompressed() { return lenBodyCompressed; }
        public void setLenBodyCompressed(long _v) { _dirty = true; lenBodyCompressed = _v; }
        public long lenBodyUncompressed() { return lenBodyUncompressed; }
        public void setLenBodyUncompressed(long _v) { _dirty = true; lenBodyUncompressed = _v; }
        public int lenFileName() { return lenFileName; }
        public void setLenFileName(int _v) { _dirty = true; lenFileName = _v; }
        public int lenExtra() { return lenExtra; }
        public void setLenExtra(int _v) { _dirty = true; lenExtra = _v; }
        public String fileName() { return fileName; }
        public void setFileName(String _v) { _dirty = true; fileName = _v; }
        public Extras extra() { return extra; }
        public void setExtra(Extras _v) { _dirty = true; extra = _v; }
        public Zip _root() { return _root; }
        public void set_root(Zip _v) { _dirty = true; _root = _v; }
        public Zip.LocalFile _parent() { return _parent; }
        public void set_parent(Zip.LocalFile _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_flags() { return _raw_flags; }
        public void set_raw_Flags(byte[] _v) { _dirty = true; _raw_flags = _v; }
        public byte[] _raw_fileModTime() { return _raw_fileModTime; }
        public void set_raw_FileModTime(byte[] _v) { _dirty = true; _raw_fileModTime = _v; }
        public byte[] _raw_extra() { return _raw_extra; }
        public void set_raw_Extra(byte[] _v) { _dirty = true; _raw_extra = _v; }
    }
    public static class PkSection extends KaitaiStruct.ReadWrite {
        public static PkSection fromFile(String fileName) throws IOException {
            return new PkSection(new ByteBufferKaitaiStream(fileName));
        }
        public PkSection() {
            this(null, null, null);
        }

        public PkSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PkSection(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public PkSection(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(this.magic, new byte[] { 80, 75 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 75 }, this.magic, this._io, "/types/pk_section/seq/0");
            }
            this.sectionType = this._io.readU2le();
            switch (sectionType()) {
            case 1027: {
                this.body = new LocalFile(this._io, this, _root);
                ((LocalFile) (this.body))._read();
                break;
            }
            case 1541: {
                this.body = new EndOfCentralDir(this._io, this, _root);
                ((EndOfCentralDir) (this.body))._read();
                break;
            }
            case 2055: {
                this.body = new DataDescriptor(this._io, this, _root);
                ((DataDescriptor) (this.body))._read();
                break;
            }
            case 513: {
                this.body = new CentralDirEntry(this._io, this, _root);
                ((CentralDirEntry) (this.body))._read();
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (sectionType()) {
            case 1027: {
                ((LocalFile) (this.body))._fetchInstances();
                break;
            }
            case 1541: {
                ((EndOfCentralDir) (this.body))._fetchInstances();
                break;
            }
            case 2055: {
                ((DataDescriptor) (this.body))._fetchInstances();
                break;
            }
            case 513: {
                ((CentralDirEntry) (this.body))._fetchInstances();
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU2le(this.sectionType);
            switch (sectionType()) {
            case 1027: {
                ((LocalFile) (this.body))._write_Seq(this._io);
                break;
            }
            case 1541: {
                ((EndOfCentralDir) (this.body))._write_Seq(this._io);
                break;
            }
            case 2055: {
                ((DataDescriptor) (this.body))._write_Seq(this._io);
                break;
            }
            case 513: {
                ((CentralDirEntry) (this.body))._write_Seq(this._io);
                break;
            }
            }
        }

        public void _check() {
            if (this.magic.length != 2)
                throw new ConsistencyError("magic", 2, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 80, 75 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 75 }, this.magic, null, "/types/pk_section/seq/0");
            }
            switch (sectionType()) {
            case 1027: {
                if (!Objects.equals(((Zip.LocalFile) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Zip.LocalFile) (this.body))._root());
                if (!Objects.equals(((Zip.LocalFile) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Zip.LocalFile) (this.body))._parent());
                break;
            }
            case 1541: {
                if (!Objects.equals(((Zip.EndOfCentralDir) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Zip.EndOfCentralDir) (this.body))._root());
                if (!Objects.equals(((Zip.EndOfCentralDir) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Zip.EndOfCentralDir) (this.body))._parent());
                break;
            }
            case 2055: {
                if (!Objects.equals(((Zip.DataDescriptor) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Zip.DataDescriptor) (this.body))._root());
                if (!Objects.equals(((Zip.DataDescriptor) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Zip.DataDescriptor) (this.body))._parent());
                break;
            }
            case 513: {
                if (!Objects.equals(((Zip.CentralDirEntry) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Zip.CentralDirEntry) (this.body))._root());
                if (!Objects.equals(((Zip.CentralDirEntry) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Zip.CentralDirEntry) (this.body))._parent());
                break;
            }
            }
            _dirty = false;
        }
        private byte[] magic;
        private int sectionType;
        private KaitaiStruct.ReadWrite body;
        private Zip _root;
        private KaitaiStruct.ReadWrite _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public int sectionType() { return sectionType; }
        public void setSectionType(int _v) { _dirty = true; sectionType = _v; }
        public KaitaiStruct.ReadWrite body() { return body; }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public Zip _root() { return _root; }
        public void set_root(Zip _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private List<PkSection> sections;
    private Zip _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<PkSection> sections() { return sections; }
    public void setSections(List<PkSection> _v) { _dirty = true; sections = _v; }
    public Zip _root() { return _root; }
    public void set_root(Zip _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
