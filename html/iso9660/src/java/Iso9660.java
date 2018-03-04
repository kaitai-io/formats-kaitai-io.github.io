// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * ISO9660 is standard filesystem used on read-only optical discs
 * (mostly CD-ROM). The standard was based on earlier High Sierra
 * Format (HSF), proposed for CD-ROMs in 1985, and, after several
 * revisions, it was accepted as ISO9960:1998.
 * 
 * The format emphasizes portability (thus having pretty minimal
 * features and very conservative file names standards) and sequential
 * access (which favors disc devices with relatively slow rotation
 * speed).
 */
public class Iso9660 extends KaitaiStruct {
    public static Iso9660 fromFile(String fileName) throws IOException {
        return new Iso9660(new ByteBufferKaitaiStream(fileName));
    }

    public Iso9660(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Iso9660(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Iso9660(KaitaiStream _io, KaitaiStruct _parent, Iso9660 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
    }

    /**
     * @see <a href="http://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor">Source</a>
     */
    public static class VolDescPrimary extends KaitaiStruct {
        public static VolDescPrimary fromFile(String fileName) throws IOException {
            return new VolDescPrimary(new ByteBufferKaitaiStream(fileName));
        }

        public VolDescPrimary(KaitaiStream _io) {
            this(_io, null, null);
        }

        public VolDescPrimary(KaitaiStream _io, Iso9660.VolDesc _parent) {
            this(_io, _parent, null);
        }

        public VolDescPrimary(KaitaiStream _io, Iso9660.VolDesc _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.unused1 = this._io.ensureFixedContents(new byte[] { 0 });
            this.systemId = new String(this._io.readBytes(32), Charset.forName("UTF-8"));
            this.volumeId = new String(this._io.readBytes(32), Charset.forName("UTF-8"));
            this.unused2 = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 });
            this.volSpaceSize = new U4bi(this._io, this, _root);
            this.unused3 = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 });
            this.volSetSize = new U2bi(this._io, this, _root);
            this.volSeqNum = new U2bi(this._io, this, _root);
            this.logicalBlockSize = new U2bi(this._io, this, _root);
            this.pathTableSize = new U4bi(this._io, this, _root);
            this.lbaPathTableLe = this._io.readU4le();
            this.lbaOptPathTableLe = this._io.readU4le();
            this.lbaPathTableBe = this._io.readU4be();
            this.lbaOptPathTableBe = this._io.readU4be();
            this._raw_rootDir = this._io.readBytes(34);
            KaitaiStream _io__raw_rootDir = new ByteBufferKaitaiStream(_raw_rootDir);
            this.rootDir = new DirEntry(_io__raw_rootDir, this, _root);
            this.volSetId = new String(this._io.readBytes(128), Charset.forName("UTF-8"));
            this.publisherId = new String(this._io.readBytes(128), Charset.forName("UTF-8"));
            this.dataPreparerId = new String(this._io.readBytes(128), Charset.forName("UTF-8"));
            this.applicationId = new String(this._io.readBytes(128), Charset.forName("UTF-8"));
            this.copyrightFileId = new String(this._io.readBytes(38), Charset.forName("UTF-8"));
            this.abstractFileId = new String(this._io.readBytes(36), Charset.forName("UTF-8"));
            this.bibliographicFileId = new String(this._io.readBytes(37), Charset.forName("UTF-8"));
            this.volCreateDatetime = new DecDatetime(this._io, this, _root);
            this.volModDatetime = new DecDatetime(this._io, this, _root);
            this.volExpireDatetime = new DecDatetime(this._io, this, _root);
            this.volEffectiveDatetime = new DecDatetime(this._io, this, _root);
            this.fileStructureVersion = this._io.readU1();
            this.unused4 = this._io.readU1();
            this.applicationArea = this._io.readBytes(512);
        }
        private PathTableLe pathTable;
        public PathTableLe pathTable() {
            if (this.pathTable != null)
                return this.pathTable;
            long _pos = this._io.pos();
            this._io.seek((lbaPathTableLe() * _root.sectorSize()));
            this._raw_pathTable = this._io.readBytes(pathTableSize().le());
            KaitaiStream _io__raw_pathTable = new ByteBufferKaitaiStream(_raw_pathTable);
            this.pathTable = new PathTableLe(_io__raw_pathTable, this, _root);
            this._io.seek(_pos);
            return this.pathTable;
        }
        private byte[] unused1;
        private String systemId;
        private String volumeId;
        private byte[] unused2;
        private U4bi volSpaceSize;
        private byte[] unused3;
        private U2bi volSetSize;
        private U2bi volSeqNum;
        private U2bi logicalBlockSize;
        private U4bi pathTableSize;
        private long lbaPathTableLe;
        private long lbaOptPathTableLe;
        private long lbaPathTableBe;
        private long lbaOptPathTableBe;
        private DirEntry rootDir;
        private String volSetId;
        private String publisherId;
        private String dataPreparerId;
        private String applicationId;
        private String copyrightFileId;
        private String abstractFileId;
        private String bibliographicFileId;
        private DecDatetime volCreateDatetime;
        private DecDatetime volModDatetime;
        private DecDatetime volExpireDatetime;
        private DecDatetime volEffectiveDatetime;
        private int fileStructureVersion;
        private int unused4;
        private byte[] applicationArea;
        private Iso9660 _root;
        private Iso9660.VolDesc _parent;
        private byte[] _raw_rootDir;
        private byte[] _raw_pathTable;
        public byte[] unused1() { return unused1; }
        public String systemId() { return systemId; }
        public String volumeId() { return volumeId; }
        public byte[] unused2() { return unused2; }
        public U4bi volSpaceSize() { return volSpaceSize; }
        public byte[] unused3() { return unused3; }
        public U2bi volSetSize() { return volSetSize; }
        public U2bi volSeqNum() { return volSeqNum; }
        public U2bi logicalBlockSize() { return logicalBlockSize; }
        public U4bi pathTableSize() { return pathTableSize; }
        public long lbaPathTableLe() { return lbaPathTableLe; }
        public long lbaOptPathTableLe() { return lbaOptPathTableLe; }
        public long lbaPathTableBe() { return lbaPathTableBe; }
        public long lbaOptPathTableBe() { return lbaOptPathTableBe; }
        public DirEntry rootDir() { return rootDir; }
        public String volSetId() { return volSetId; }
        public String publisherId() { return publisherId; }
        public String dataPreparerId() { return dataPreparerId; }
        public String applicationId() { return applicationId; }
        public String copyrightFileId() { return copyrightFileId; }
        public String abstractFileId() { return abstractFileId; }
        public String bibliographicFileId() { return bibliographicFileId; }
        public DecDatetime volCreateDatetime() { return volCreateDatetime; }
        public DecDatetime volModDatetime() { return volModDatetime; }
        public DecDatetime volExpireDatetime() { return volExpireDatetime; }
        public DecDatetime volEffectiveDatetime() { return volEffectiveDatetime; }
        public int fileStructureVersion() { return fileStructureVersion; }
        public int unused4() { return unused4; }
        public byte[] applicationArea() { return applicationArea; }
        public Iso9660 _root() { return _root; }
        public Iso9660.VolDesc _parent() { return _parent; }
        public byte[] _raw_rootDir() { return _raw_rootDir; }
        public byte[] _raw_pathTable() { return _raw_pathTable; }
    }
    public static class VolDescBootRecord extends KaitaiStruct {
        public static VolDescBootRecord fromFile(String fileName) throws IOException {
            return new VolDescBootRecord(new ByteBufferKaitaiStream(fileName));
        }

        public VolDescBootRecord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public VolDescBootRecord(KaitaiStream _io, Iso9660.VolDesc _parent) {
            this(_io, _parent, null);
        }

        public VolDescBootRecord(KaitaiStream _io, Iso9660.VolDesc _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.bootSystemId = new String(this._io.readBytes(32), Charset.forName("UTF-8"));
            this.bootId = new String(this._io.readBytes(32), Charset.forName("UTF-8"));
        }
        private String bootSystemId;
        private String bootId;
        private Iso9660 _root;
        private Iso9660.VolDesc _parent;
        public String bootSystemId() { return bootSystemId; }
        public String bootId() { return bootId; }
        public Iso9660 _root() { return _root; }
        public Iso9660.VolDesc _parent() { return _parent; }
    }
    public static class Datetime extends KaitaiStruct {
        public static Datetime fromFile(String fileName) throws IOException {
            return new Datetime(new ByteBufferKaitaiStream(fileName));
        }

        public Datetime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Datetime(KaitaiStream _io, Iso9660.DirEntryBody _parent) {
            this(_io, _parent, null);
        }

        public Datetime(KaitaiStream _io, Iso9660.DirEntryBody _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.year = this._io.readU1();
            this.month = this._io.readU1();
            this.day = this._io.readU1();
            this.hour = this._io.readU1();
            this.minute = this._io.readU1();
            this.sec = this._io.readU1();
            this.timezone = this._io.readU1();
        }
        private int year;
        private int month;
        private int day;
        private int hour;
        private int minute;
        private int sec;
        private int timezone;
        private Iso9660 _root;
        private Iso9660.DirEntryBody _parent;
        public int year() { return year; }
        public int month() { return month; }
        public int day() { return day; }
        public int hour() { return hour; }
        public int minute() { return minute; }
        public int sec() { return sec; }
        public int timezone() { return timezone; }
        public Iso9660 _root() { return _root; }
        public Iso9660.DirEntryBody _parent() { return _parent; }
    }
    public static class DirEntry extends KaitaiStruct {
        public static DirEntry fromFile(String fileName) throws IOException {
            return new DirEntry(new ByteBufferKaitaiStream(fileName));
        }

        public DirEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirEntry(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public DirEntry(KaitaiStream _io, KaitaiStruct _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readU1();
            if (len() > 0) {
                this._raw_body = this._io.readBytes((len() - 1));
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new DirEntryBody(_io__raw_body, this, _root);
            }
        }
        private int len;
        private DirEntryBody body;
        private Iso9660 _root;
        private KaitaiStruct _parent;
        private byte[] _raw_body;
        public int len() { return len; }
        public DirEntryBody body() { return body; }
        public Iso9660 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    public static class VolDesc extends KaitaiStruct {
        public static VolDesc fromFile(String fileName) throws IOException {
            return new VolDesc(new ByteBufferKaitaiStream(fileName));
        }

        public VolDesc(KaitaiStream _io) {
            this(_io, null, null);
        }

        public VolDesc(KaitaiStream _io, Iso9660 _parent) {
            this(_io, _parent, null);
        }

        public VolDesc(KaitaiStream _io, Iso9660 _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = this._io.readU1();
            this.magic = this._io.ensureFixedContents(new byte[] { 67, 68, 48, 48, 49 });
            this.version = this._io.readU1();
            if (type() == 0) {
                this.volDescBootRecord = new VolDescBootRecord(this._io, this, _root);
            }
            if (type() == 1) {
                this.volDescPrimary = new VolDescPrimary(this._io, this, _root);
            }
        }
        private int type;
        private byte[] magic;
        private int version;
        private VolDescBootRecord volDescBootRecord;
        private VolDescPrimary volDescPrimary;
        private Iso9660 _root;
        private Iso9660 _parent;
        public int type() { return type; }
        public byte[] magic() { return magic; }
        public int version() { return version; }
        public VolDescBootRecord volDescBootRecord() { return volDescBootRecord; }
        public VolDescPrimary volDescPrimary() { return volDescPrimary; }
        public Iso9660 _root() { return _root; }
        public Iso9660 _parent() { return _parent; }
    }
    public static class PathTableEntryLe extends KaitaiStruct {
        public static PathTableEntryLe fromFile(String fileName) throws IOException {
            return new PathTableEntryLe(new ByteBufferKaitaiStream(fileName));
        }

        public PathTableEntryLe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PathTableEntryLe(KaitaiStream _io, Iso9660.PathTableLe _parent) {
            this(_io, _parent, null);
        }

        public PathTableEntryLe(KaitaiStream _io, Iso9660.PathTableLe _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenDirName = this._io.readU1();
            this.lenExtAttrRec = this._io.readU1();
            this.lbaExtent = this._io.readU4le();
            this.parentDirIdx = this._io.readU2le();
            this.dirName = new String(this._io.readBytes(lenDirName()), Charset.forName("UTF-8"));
            if (KaitaiStream.mod(lenDirName(), 2) == 1) {
                this.padding = this._io.readU1();
            }
        }
        private int lenDirName;
        private int lenExtAttrRec;
        private long lbaExtent;
        private int parentDirIdx;
        private String dirName;
        private Integer padding;
        private Iso9660 _root;
        private Iso9660.PathTableLe _parent;
        public int lenDirName() { return lenDirName; }
        public int lenExtAttrRec() { return lenExtAttrRec; }
        public long lbaExtent() { return lbaExtent; }
        public int parentDirIdx() { return parentDirIdx; }
        public String dirName() { return dirName; }
        public Integer padding() { return padding; }
        public Iso9660 _root() { return _root; }
        public Iso9660.PathTableLe _parent() { return _parent; }
    }
    public static class DirEntries extends KaitaiStruct {
        public static DirEntries fromFile(String fileName) throws IOException {
            return new DirEntries(new ByteBufferKaitaiStream(fileName));
        }

        public DirEntries(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirEntries(KaitaiStream _io, Iso9660.DirEntryBody _parent) {
            this(_io, _parent, null);
        }

        public DirEntries(KaitaiStream _io, Iso9660.DirEntryBody _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<DirEntry>();
            {
                DirEntry _it;
                int i = 0;
                do {
                    _it = new DirEntry(this._io, this, _root);
                    this.entries.add(_it);
                    i++;
                } while (!(_it.len() == 0));
            }
        }
        private ArrayList<DirEntry> entries;
        private Iso9660 _root;
        private Iso9660.DirEntryBody _parent;
        public ArrayList<DirEntry> entries() { return entries; }
        public Iso9660 _root() { return _root; }
        public Iso9660.DirEntryBody _parent() { return _parent; }
    }
    public static class U4bi extends KaitaiStruct {
        public static U4bi fromFile(String fileName) throws IOException {
            return new U4bi(new ByteBufferKaitaiStream(fileName));
        }

        public U4bi(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U4bi(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public U4bi(KaitaiStream _io, KaitaiStruct _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.le = this._io.readU4le();
            this.be = this._io.readU4be();
        }
        private long le;
        private long be;
        private Iso9660 _root;
        private KaitaiStruct _parent;
        public long le() { return le; }
        public long be() { return be; }
        public Iso9660 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class U2bi extends KaitaiStruct {
        public static U2bi fromFile(String fileName) throws IOException {
            return new U2bi(new ByteBufferKaitaiStream(fileName));
        }

        public U2bi(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U2bi(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public U2bi(KaitaiStream _io, KaitaiStruct _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.le = this._io.readU2le();
            this.be = this._io.readU2be();
        }
        private int le;
        private int be;
        private Iso9660 _root;
        private KaitaiStruct _parent;
        public int le() { return le; }
        public int be() { return be; }
        public Iso9660 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="http://wiki.osdev.org/ISO_9660#The_Path_Table">Source</a>
     */
    public static class PathTableLe extends KaitaiStruct {
        public static PathTableLe fromFile(String fileName) throws IOException {
            return new PathTableLe(new ByteBufferKaitaiStream(fileName));
        }

        public PathTableLe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PathTableLe(KaitaiStream _io, Iso9660.VolDescPrimary _parent) {
            this(_io, _parent, null);
        }

        public PathTableLe(KaitaiStream _io, Iso9660.VolDescPrimary _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<PathTableEntryLe>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new PathTableEntryLe(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<PathTableEntryLe> entries;
        private Iso9660 _root;
        private Iso9660.VolDescPrimary _parent;
        public ArrayList<PathTableEntryLe> entries() { return entries; }
        public Iso9660 _root() { return _root; }
        public Iso9660.VolDescPrimary _parent() { return _parent; }
    }

    /**
     * @see <a href="http://wiki.osdev.org/ISO_9660#Date.2Ftime_format">Source</a>
     */
    public static class DecDatetime extends KaitaiStruct {
        public static DecDatetime fromFile(String fileName) throws IOException {
            return new DecDatetime(new ByteBufferKaitaiStream(fileName));
        }

        public DecDatetime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DecDatetime(KaitaiStream _io, Iso9660.VolDescPrimary _parent) {
            this(_io, _parent, null);
        }

        public DecDatetime(KaitaiStream _io, Iso9660.VolDescPrimary _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.year = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.month = new String(this._io.readBytes(2), Charset.forName("ASCII"));
            this.day = new String(this._io.readBytes(2), Charset.forName("ASCII"));
            this.hour = new String(this._io.readBytes(2), Charset.forName("ASCII"));
            this.minute = new String(this._io.readBytes(2), Charset.forName("ASCII"));
            this.sec = new String(this._io.readBytes(2), Charset.forName("ASCII"));
            this.secHundreds = new String(this._io.readBytes(2), Charset.forName("ASCII"));
            this.timezone = this._io.readU1();
        }
        private String year;
        private String month;
        private String day;
        private String hour;
        private String minute;
        private String sec;
        private String secHundreds;
        private int timezone;
        private Iso9660 _root;
        private Iso9660.VolDescPrimary _parent;
        public String year() { return year; }
        public String month() { return month; }
        public String day() { return day; }
        public String hour() { return hour; }
        public String minute() { return minute; }
        public String sec() { return sec; }
        public String secHundreds() { return secHundreds; }
        public int timezone() { return timezone; }
        public Iso9660 _root() { return _root; }
        public Iso9660.VolDescPrimary _parent() { return _parent; }
    }
    public static class DirEntryBody extends KaitaiStruct {
        public static DirEntryBody fromFile(String fileName) throws IOException {
            return new DirEntryBody(new ByteBufferKaitaiStream(fileName));
        }

        public DirEntryBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirEntryBody(KaitaiStream _io, Iso9660.DirEntry _parent) {
            this(_io, _parent, null);
        }

        public DirEntryBody(KaitaiStream _io, Iso9660.DirEntry _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenExtAttrRec = this._io.readU1();
            this.lbaExtent = new U4bi(this._io, this, _root);
            this.sizeExtent = new U4bi(this._io, this, _root);
            this.datetime = new Datetime(this._io, this, _root);
            this.fileFlags = this._io.readU1();
            this.fileUnitSize = this._io.readU1();
            this.interleaveGapSize = this._io.readU1();
            this.volSeqNum = new U2bi(this._io, this, _root);
            this.lenFileName = this._io.readU1();
            this.fileName = new String(this._io.readBytes(lenFileName()), Charset.forName("UTF-8"));
            if (KaitaiStream.mod(lenFileName(), 2) == 0) {
                this.padding = this._io.readU1();
            }
            this.rest = this._io.readBytesFull();
        }
        private DirEntries extentAsDir;
        public DirEntries extentAsDir() {
            if (this.extentAsDir != null)
                return this.extentAsDir;
            if ((fileFlags() & 2) != 0) {
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek((lbaExtent().le() * _root.sectorSize()));
                this._raw_extentAsDir = io.readBytes(sizeExtent().le());
                KaitaiStream _io__raw_extentAsDir = new ByteBufferKaitaiStream(_raw_extentAsDir);
                this.extentAsDir = new DirEntries(_io__raw_extentAsDir, this, _root);
                io.seek(_pos);
            }
            return this.extentAsDir;
        }
        private byte[] extentAsFile;
        public byte[] extentAsFile() {
            if (this.extentAsFile != null)
                return this.extentAsFile;
            if ((fileFlags() & 2) == 0) {
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek((lbaExtent().le() * _root.sectorSize()));
                this.extentAsFile = io.readBytes(sizeExtent().le());
                io.seek(_pos);
            }
            return this.extentAsFile;
        }
        private int lenExtAttrRec;
        private U4bi lbaExtent;
        private U4bi sizeExtent;
        private Datetime datetime;
        private int fileFlags;
        private int fileUnitSize;
        private int interleaveGapSize;
        private U2bi volSeqNum;
        private int lenFileName;
        private String fileName;
        private Integer padding;
        private byte[] rest;
        private Iso9660 _root;
        private Iso9660.DirEntry _parent;
        private byte[] _raw_extentAsDir;
        public int lenExtAttrRec() { return lenExtAttrRec; }
        public U4bi lbaExtent() { return lbaExtent; }
        public U4bi sizeExtent() { return sizeExtent; }
        public Datetime datetime() { return datetime; }
        public int fileFlags() { return fileFlags; }
        public int fileUnitSize() { return fileUnitSize; }
        public int interleaveGapSize() { return interleaveGapSize; }
        public U2bi volSeqNum() { return volSeqNum; }
        public int lenFileName() { return lenFileName; }
        public String fileName() { return fileName; }
        public Integer padding() { return padding; }
        public byte[] rest() { return rest; }
        public Iso9660 _root() { return _root; }
        public Iso9660.DirEntry _parent() { return _parent; }
        public byte[] _raw_extentAsDir() { return _raw_extentAsDir; }
    }
    private Integer sectorSize;
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        int _tmp = (int) (2048);
        this.sectorSize = _tmp;
        return this.sectorSize;
    }
    private VolDesc primaryVolDesc;
    public VolDesc primaryVolDesc() {
        if (this.primaryVolDesc != null)
            return this.primaryVolDesc;
        long _pos = this._io.pos();
        this._io.seek((16 * sectorSize()));
        this.primaryVolDesc = new VolDesc(this._io, this, _root);
        this._io.seek(_pos);
        return this.primaryVolDesc;
    }
    private Iso9660 _root;
    private KaitaiStruct _parent;
    public Iso9660 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
