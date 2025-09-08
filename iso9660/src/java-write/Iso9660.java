// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;


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
public class Iso9660 extends KaitaiStruct.ReadWrite {
    public static Iso9660 fromFile(String fileName) throws IOException {
        return new Iso9660(new ByteBufferKaitaiStream(fileName));
    }
    public Iso9660() {
        this(null, null, null);
    }

    public Iso9660(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Iso9660(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Iso9660(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Iso9660 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        _dirty = false;
    }

    public void _fetchInstances() {
        primaryVolDesc();
        if (this.primaryVolDesc != null) {
            this.primaryVolDesc._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWritePrimaryVolDesc = _enabledPrimaryVolDesc;
    }

    public void _check() {
        if (_enabledPrimaryVolDesc) {
            if (!Objects.equals(this.primaryVolDesc._root(), _root()))
                throw new ConsistencyError("primary_vol_desc", _root(), this.primaryVolDesc._root());
            if (!Objects.equals(this.primaryVolDesc._parent(), this))
                throw new ConsistencyError("primary_vol_desc", this, this.primaryVolDesc._parent());
        }
        _dirty = false;
    }
    public static class Datetime extends KaitaiStruct.ReadWrite {
        public static Datetime fromFile(String fileName) throws IOException {
            return new Datetime(new ByteBufferKaitaiStream(fileName));
        }
        public Datetime() {
            this(null, null, null);
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
        }
        public void _read() {
            this.year = this._io.readU1();
            this.month = this._io.readU1();
            this.day = this._io.readU1();
            this.hour = this._io.readU1();
            this.minute = this._io.readU1();
            this.sec = this._io.readU1();
            this.timezone = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.year);
            this._io.writeU1(this.month);
            this._io.writeU1(this.day);
            this._io.writeU1(this.hour);
            this._io.writeU1(this.minute);
            this._io.writeU1(this.sec);
            this._io.writeU1(this.timezone);
        }

        public void _check() {
            _dirty = false;
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
        public void setYear(int _v) { _dirty = true; year = _v; }
        public int month() { return month; }
        public void setMonth(int _v) { _dirty = true; month = _v; }
        public int day() { return day; }
        public void setDay(int _v) { _dirty = true; day = _v; }
        public int hour() { return hour; }
        public void setHour(int _v) { _dirty = true; hour = _v; }
        public int minute() { return minute; }
        public void setMinute(int _v) { _dirty = true; minute = _v; }
        public int sec() { return sec; }
        public void setSec(int _v) { _dirty = true; sec = _v; }
        public int timezone() { return timezone; }
        public void setTimezone(int _v) { _dirty = true; timezone = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660.DirEntryBody _parent() { return _parent; }
        public void set_parent(Iso9660.DirEntryBody _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.osdev.org/ISO_9660#Date.2Ftime_format">Source</a>
     */
    public static class DecDatetime extends KaitaiStruct.ReadWrite {
        public static DecDatetime fromFile(String fileName) throws IOException {
            return new DecDatetime(new ByteBufferKaitaiStream(fileName));
        }
        public DecDatetime() {
            this(null, null, null);
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
        }
        public void _read() {
            this.year = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.month = new String(this._io.readBytes(2), StandardCharsets.US_ASCII);
            this.day = new String(this._io.readBytes(2), StandardCharsets.US_ASCII);
            this.hour = new String(this._io.readBytes(2), StandardCharsets.US_ASCII);
            this.minute = new String(this._io.readBytes(2), StandardCharsets.US_ASCII);
            this.sec = new String(this._io.readBytes(2), StandardCharsets.US_ASCII);
            this.secHundreds = new String(this._io.readBytes(2), StandardCharsets.US_ASCII);
            this.timezone = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.year).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.month).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.day).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.hour).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.minute).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.sec).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.secHundreds).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(this.timezone);
        }

        public void _check() {
            if ((this.year).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("year", 4, (this.year).getBytes(Charset.forName("ASCII")).length);
            if ((this.month).getBytes(Charset.forName("ASCII")).length != 2)
                throw new ConsistencyError("month", 2, (this.month).getBytes(Charset.forName("ASCII")).length);
            if ((this.day).getBytes(Charset.forName("ASCII")).length != 2)
                throw new ConsistencyError("day", 2, (this.day).getBytes(Charset.forName("ASCII")).length);
            if ((this.hour).getBytes(Charset.forName("ASCII")).length != 2)
                throw new ConsistencyError("hour", 2, (this.hour).getBytes(Charset.forName("ASCII")).length);
            if ((this.minute).getBytes(Charset.forName("ASCII")).length != 2)
                throw new ConsistencyError("minute", 2, (this.minute).getBytes(Charset.forName("ASCII")).length);
            if ((this.sec).getBytes(Charset.forName("ASCII")).length != 2)
                throw new ConsistencyError("sec", 2, (this.sec).getBytes(Charset.forName("ASCII")).length);
            if ((this.secHundreds).getBytes(Charset.forName("ASCII")).length != 2)
                throw new ConsistencyError("sec_hundreds", 2, (this.secHundreds).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
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
        public void setYear(String _v) { _dirty = true; year = _v; }
        public String month() { return month; }
        public void setMonth(String _v) { _dirty = true; month = _v; }
        public String day() { return day; }
        public void setDay(String _v) { _dirty = true; day = _v; }
        public String hour() { return hour; }
        public void setHour(String _v) { _dirty = true; hour = _v; }
        public String minute() { return minute; }
        public void setMinute(String _v) { _dirty = true; minute = _v; }
        public String sec() { return sec; }
        public void setSec(String _v) { _dirty = true; sec = _v; }
        public String secHundreds() { return secHundreds; }
        public void setSecHundreds(String _v) { _dirty = true; secHundreds = _v; }
        public int timezone() { return timezone; }
        public void setTimezone(int _v) { _dirty = true; timezone = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660.VolDescPrimary _parent() { return _parent; }
        public void set_parent(Iso9660.VolDescPrimary _v) { _dirty = true; _parent = _v; }
    }
    public static class DirEntries extends KaitaiStruct.ReadWrite {
        public static DirEntries fromFile(String fileName) throws IOException {
            return new DirEntries(new ByteBufferKaitaiStream(fileName));
        }
        public DirEntries() {
            this(null, null, null);
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
        }
        public void _read() {
            this.entries = new ArrayList<DirEntry>();
            {
                DirEntry _it;
                int i = 0;
                do {
                    DirEntry _t_entries = new DirEntry(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        _it = _t_entries;
                        this.entries.add(_it);
                    }
                    i++;
                } while (!(_it.len() == 0));
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
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.entries.size() == 0)
                throw new ConsistencyError("entries", 0, this.entries.size());
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                {
                    DirEntry _it = this.entries.get(((Number) (i)).intValue());
                    if ((_it.len() == 0) != (i == this.entries.size() - 1))
                        throw new ConsistencyError("entries", i == this.entries.size() - 1, _it.len() == 0);
                }
            }
            _dirty = false;
        }
        private List<DirEntry> entries;
        private Iso9660 _root;
        private Iso9660.DirEntryBody _parent;
        public List<DirEntry> entries() { return entries; }
        public void setEntries(List<DirEntry> _v) { _dirty = true; entries = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660.DirEntryBody _parent() { return _parent; }
        public void set_parent(Iso9660.DirEntryBody _v) { _dirty = true; _parent = _v; }
    }
    public static class DirEntry extends KaitaiStruct.ReadWrite {
        public static DirEntry fromFile(String fileName) throws IOException {
            return new DirEntry(new ByteBufferKaitaiStream(fileName));
        }
        public DirEntry() {
            this(null, null, null);
        }

        public DirEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirEntry(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DirEntry(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU1();
            if (len() > 0) {
                this._raw_body = this._io.readBytes(len() - 1);
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new DirEntryBody(_io__raw_body, this, _root);
                this.body._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (len() > 0) {
                this.body._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.len);
            if (len() > 0) {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len() - 1);
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len() - 1));
                    final DirEntry _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (_this._raw_body.length != len() - 1)
                                throw new ConsistencyError("raw(body)", len() - 1, _this._raw_body.length);
                            parent.writeBytes(_this._raw_body);
                        }
                    });
                }
                this.body._write_Seq(_io__raw_body);
            }
        }

        public void _check() {
            if (len() > 0) {
                if (!Objects.equals(this.body._root(), _root()))
                    throw new ConsistencyError("body", _root(), this.body._root());
                if (!Objects.equals(this.body._parent(), this))
                    throw new ConsistencyError("body", this, this.body._parent());
            }
            _dirty = false;
        }
        private int len;
        private DirEntryBody body;
        private Iso9660 _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_body;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public DirEntryBody body() { return body; }
        public void setBody(DirEntryBody _v) { _dirty = true; body = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class DirEntryBody extends KaitaiStruct.ReadWrite {
        public static DirEntryBody fromFile(String fileName) throws IOException {
            return new DirEntryBody(new ByteBufferKaitaiStream(fileName));
        }
        public DirEntryBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenExtAttrRec = this._io.readU1();
            this.lbaExtent = new U4bi(this._io, this, _root);
            this.lbaExtent._read();
            this.sizeExtent = new U4bi(this._io, this, _root);
            this.sizeExtent._read();
            this.datetime = new Datetime(this._io, this, _root);
            this.datetime._read();
            this.fileFlags = this._io.readU1();
            this.fileUnitSize = this._io.readU1();
            this.interleaveGapSize = this._io.readU1();
            this.volSeqNum = new U2bi(this._io, this, _root);
            this.volSeqNum._read();
            this.lenFileName = this._io.readU1();
            this.fileName = new String(this._io.readBytes(lenFileName()), StandardCharsets.UTF_8);
            if (KaitaiStream.mod(lenFileName(), 2) == 0) {
                this.padding = this._io.readU1();
            }
            this.rest = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.lbaExtent._fetchInstances();
            this.sizeExtent._fetchInstances();
            this.datetime._fetchInstances();
            this.volSeqNum._fetchInstances();
            if (KaitaiStream.mod(lenFileName(), 2) == 0) {
            }
            extentAsDir();
            if (this.extentAsDir != null) {
                this.extentAsDir._fetchInstances();
            }
            extentAsFile();
            if (this.extentAsFile != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteExtentAsDir = _enabledExtentAsDir;
            _shouldWriteExtentAsFile = _enabledExtentAsFile;
            this._io.writeU1(this.lenExtAttrRec);
            this.lbaExtent._write_Seq(this._io);
            this.sizeExtent._write_Seq(this._io);
            this.datetime._write_Seq(this._io);
            this._io.writeU1(this.fileFlags);
            this._io.writeU1(this.fileUnitSize);
            this._io.writeU1(this.interleaveGapSize);
            this.volSeqNum._write_Seq(this._io);
            this._io.writeU1(this.lenFileName);
            this._io.writeBytes((this.fileName).getBytes(Charset.forName("UTF-8")));
            if (KaitaiStream.mod(lenFileName(), 2) == 0) {
                this._io.writeU1(this.padding);
            }
            this._io.writeBytes(this.rest);
            if (!(this._io.isEof()))
                throw new ConsistencyError("rest", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!Objects.equals(this.lbaExtent._root(), _root()))
                throw new ConsistencyError("lba_extent", _root(), this.lbaExtent._root());
            if (!Objects.equals(this.lbaExtent._parent(), this))
                throw new ConsistencyError("lba_extent", this, this.lbaExtent._parent());
            if (!Objects.equals(this.sizeExtent._root(), _root()))
                throw new ConsistencyError("size_extent", _root(), this.sizeExtent._root());
            if (!Objects.equals(this.sizeExtent._parent(), this))
                throw new ConsistencyError("size_extent", this, this.sizeExtent._parent());
            if (!Objects.equals(this.datetime._root(), _root()))
                throw new ConsistencyError("datetime", _root(), this.datetime._root());
            if (!Objects.equals(this.datetime._parent(), this))
                throw new ConsistencyError("datetime", this, this.datetime._parent());
            if (!Objects.equals(this.volSeqNum._root(), _root()))
                throw new ConsistencyError("vol_seq_num", _root(), this.volSeqNum._root());
            if (!Objects.equals(this.volSeqNum._parent(), this))
                throw new ConsistencyError("vol_seq_num", this, this.volSeqNum._parent());
            if ((this.fileName).getBytes(Charset.forName("UTF-8")).length != lenFileName())
                throw new ConsistencyError("file_name", lenFileName(), (this.fileName).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.mod(lenFileName(), 2) == 0) {
            }
            if (_enabledExtentAsDir) {
                if ((fileFlags() & 2) != 0) {
                    if (!Objects.equals(this.extentAsDir._root(), _root()))
                        throw new ConsistencyError("extent_as_dir", _root(), this.extentAsDir._root());
                    if (!Objects.equals(this.extentAsDir._parent(), this))
                        throw new ConsistencyError("extent_as_dir", this, this.extentAsDir._parent());
                }
            }
            if (_enabledExtentAsFile) {
                if ((fileFlags() & 2) == 0) {
                    if (this.extentAsFile.length != sizeExtent().le())
                        throw new ConsistencyError("extent_as_file", sizeExtent().le(), this.extentAsFile.length);
                }
            }
            _dirty = false;
        }
        private DirEntries extentAsDir;
        private boolean _shouldWriteExtentAsDir = false;
        private boolean _enabledExtentAsDir = true;
        public DirEntries extentAsDir() {
            if (_shouldWriteExtentAsDir)
                _writeExtentAsDir();
            if (this.extentAsDir != null)
                return this.extentAsDir;
            if (!_enabledExtentAsDir)
                return null;
            if ((fileFlags() & 2) != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(lbaExtent().le() * _root().sectorSize());
                this._raw_extentAsDir = io.readBytes(sizeExtent().le());
                KaitaiStream _io__raw_extentAsDir = new ByteBufferKaitaiStream(this._raw_extentAsDir);
                this.extentAsDir = new DirEntries(_io__raw_extentAsDir, this, _root);
                this.extentAsDir._read();
                io.seek(_pos);
            }
            return this.extentAsDir;
        }
        public void setExtentAsDir(DirEntries _v) { _dirty = true; extentAsDir = _v; }
        public void setExtentAsDir_Enabled(boolean _v) { _dirty = true; _enabledExtentAsDir = _v; }

        private void _writeExtentAsDir() {
            _shouldWriteExtentAsDir = false;
            if ((fileFlags() & 2) != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(lbaExtent().le() * _root().sectorSize());
                final KaitaiStream _io__raw_extentAsDir = new ByteBufferKaitaiStream(sizeExtent().le());
                io.addChildStream(_io__raw_extentAsDir);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (sizeExtent().le()));
                    final DirEntryBody _this = this;
                    _io__raw_extentAsDir.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_extentAsDir = _io__raw_extentAsDir.toByteArray();
                            if (_this._raw_extentAsDir.length != sizeExtent().le())
                                throw new ConsistencyError("raw(extent_as_dir)", sizeExtent().le(), _this._raw_extentAsDir.length);
                            parent.writeBytes(_this._raw_extentAsDir);
                        }
                    });
                }
                this.extentAsDir._write_Seq(_io__raw_extentAsDir);
                io.seek(_pos);
            }
        }
        private byte[] extentAsFile;
        private boolean _shouldWriteExtentAsFile = false;
        private boolean _enabledExtentAsFile = true;
        public byte[] extentAsFile() {
            if (_shouldWriteExtentAsFile)
                _writeExtentAsFile();
            if (this.extentAsFile != null)
                return this.extentAsFile;
            if (!_enabledExtentAsFile)
                return null;
            if ((fileFlags() & 2) == 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(lbaExtent().le() * _root().sectorSize());
                this.extentAsFile = io.readBytes(sizeExtent().le());
                io.seek(_pos);
            }
            return this.extentAsFile;
        }
        public void setExtentAsFile(byte[] _v) { _dirty = true; extentAsFile = _v; }
        public void setExtentAsFile_Enabled(boolean _v) { _dirty = true; _enabledExtentAsFile = _v; }

        private void _writeExtentAsFile() {
            _shouldWriteExtentAsFile = false;
            if ((fileFlags() & 2) == 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(lbaExtent().le() * _root().sectorSize());
                io.writeBytes(this.extentAsFile);
                io.seek(_pos);
            }
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
        public void setLenExtAttrRec(int _v) { _dirty = true; lenExtAttrRec = _v; }
        public U4bi lbaExtent() { return lbaExtent; }
        public void setLbaExtent(U4bi _v) { _dirty = true; lbaExtent = _v; }
        public U4bi sizeExtent() { return sizeExtent; }
        public void setSizeExtent(U4bi _v) { _dirty = true; sizeExtent = _v; }
        public Datetime datetime() { return datetime; }
        public void setDatetime(Datetime _v) { _dirty = true; datetime = _v; }
        public int fileFlags() { return fileFlags; }
        public void setFileFlags(int _v) { _dirty = true; fileFlags = _v; }
        public int fileUnitSize() { return fileUnitSize; }
        public void setFileUnitSize(int _v) { _dirty = true; fileUnitSize = _v; }
        public int interleaveGapSize() { return interleaveGapSize; }
        public void setInterleaveGapSize(int _v) { _dirty = true; interleaveGapSize = _v; }
        public U2bi volSeqNum() { return volSeqNum; }
        public void setVolSeqNum(U2bi _v) { _dirty = true; volSeqNum = _v; }
        public int lenFileName() { return lenFileName; }
        public void setLenFileName(int _v) { _dirty = true; lenFileName = _v; }
        public String fileName() { return fileName; }
        public void setFileName(String _v) { _dirty = true; fileName = _v; }
        public Integer padding() { return padding; }
        public void setPadding(Integer _v) { _dirty = true; padding = _v; }
        public byte[] rest() { return rest; }
        public void setRest(byte[] _v) { _dirty = true; rest = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660.DirEntry _parent() { return _parent; }
        public void set_parent(Iso9660.DirEntry _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_extentAsDir() { return _raw_extentAsDir; }
        public void set_raw_ExtentAsDir(byte[] _v) { _dirty = true; _raw_extentAsDir = _v; }
    }
    public static class PathTableEntryLe extends KaitaiStruct.ReadWrite {
        public static PathTableEntryLe fromFile(String fileName) throws IOException {
            return new PathTableEntryLe(new ByteBufferKaitaiStream(fileName));
        }
        public PathTableEntryLe() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenDirName = this._io.readU1();
            this.lenExtAttrRec = this._io.readU1();
            this.lbaExtent = this._io.readU4le();
            this.parentDirIdx = this._io.readU2le();
            this.dirName = new String(this._io.readBytes(lenDirName()), StandardCharsets.UTF_8);
            if (KaitaiStream.mod(lenDirName(), 2) == 1) {
                this.padding = this._io.readU1();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (KaitaiStream.mod(lenDirName(), 2) == 1) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.lenDirName);
            this._io.writeU1(this.lenExtAttrRec);
            this._io.writeU4le(this.lbaExtent);
            this._io.writeU2le(this.parentDirIdx);
            this._io.writeBytes((this.dirName).getBytes(Charset.forName("UTF-8")));
            if (KaitaiStream.mod(lenDirName(), 2) == 1) {
                this._io.writeU1(this.padding);
            }
        }

        public void _check() {
            if ((this.dirName).getBytes(Charset.forName("UTF-8")).length != lenDirName())
                throw new ConsistencyError("dir_name", lenDirName(), (this.dirName).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.mod(lenDirName(), 2) == 1) {
            }
            _dirty = false;
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
        public void setLenDirName(int _v) { _dirty = true; lenDirName = _v; }
        public int lenExtAttrRec() { return lenExtAttrRec; }
        public void setLenExtAttrRec(int _v) { _dirty = true; lenExtAttrRec = _v; }
        public long lbaExtent() { return lbaExtent; }
        public void setLbaExtent(long _v) { _dirty = true; lbaExtent = _v; }
        public int parentDirIdx() { return parentDirIdx; }
        public void setParentDirIdx(int _v) { _dirty = true; parentDirIdx = _v; }
        public String dirName() { return dirName; }
        public void setDirName(String _v) { _dirty = true; dirName = _v; }
        public Integer padding() { return padding; }
        public void setPadding(Integer _v) { _dirty = true; padding = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660.PathTableLe _parent() { return _parent; }
        public void set_parent(Iso9660.PathTableLe _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.osdev.org/ISO_9660#The_Path_Table">Source</a>
     */
    public static class PathTableLe extends KaitaiStruct.ReadWrite {
        public static PathTableLe fromFile(String fileName) throws IOException {
            return new PathTableLe(new ByteBufferKaitaiStream(fileName));
        }
        public PathTableLe() {
            this(null, null, null);
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
        }
        public void _read() {
            this.entries = new ArrayList<PathTableEntryLe>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    PathTableEntryLe _t_entries = new PathTableEntryLe(this._io, this, _root);
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
        private List<PathTableEntryLe> entries;
        private Iso9660 _root;
        private Iso9660.VolDescPrimary _parent;
        public List<PathTableEntryLe> entries() { return entries; }
        public void setEntries(List<PathTableEntryLe> _v) { _dirty = true; entries = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660.VolDescPrimary _parent() { return _parent; }
        public void set_parent(Iso9660.VolDescPrimary _v) { _dirty = true; _parent = _v; }
    }
    public static class U2bi extends KaitaiStruct.ReadWrite {
        public static U2bi fromFile(String fileName) throws IOException {
            return new U2bi(new ByteBufferKaitaiStream(fileName));
        }
        public U2bi() {
            this(null, null, null);
        }

        public U2bi(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U2bi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public U2bi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.le = this._io.readU2le();
            this.be = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.le);
            this._io.writeU2be(this.be);
        }

        public void _check() {
            _dirty = false;
        }
        private int le;
        private int be;
        private Iso9660 _root;
        private KaitaiStruct.ReadWrite _parent;
        public int le() { return le; }
        public void setLe(int _v) { _dirty = true; le = _v; }
        public int be() { return be; }
        public void setBe(int _v) { _dirty = true; be = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class U4bi extends KaitaiStruct.ReadWrite {
        public static U4bi fromFile(String fileName) throws IOException {
            return new U4bi(new ByteBufferKaitaiStream(fileName));
        }
        public U4bi() {
            this(null, null, null);
        }

        public U4bi(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U4bi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public U4bi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Iso9660 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.le = this._io.readU4le();
            this.be = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.le);
            this._io.writeU4be(this.be);
        }

        public void _check() {
            _dirty = false;
        }
        private long le;
        private long be;
        private Iso9660 _root;
        private KaitaiStruct.ReadWrite _parent;
        public long le() { return le; }
        public void setLe(long _v) { _dirty = true; le = _v; }
        public long be() { return be; }
        public void setBe(long _v) { _dirty = true; be = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class VolDesc extends KaitaiStruct.ReadWrite {
        public static VolDesc fromFile(String fileName) throws IOException {
            return new VolDesc(new ByteBufferKaitaiStream(fileName));
        }
        public VolDesc() {
            this(null, null, null);
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
        }
        public void _read() {
            this.type = this._io.readU1();
            this.magic = this._io.readBytes(5);
            if (!(Arrays.equals(this.magic, new byte[] { 67, 68, 48, 48, 49 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67, 68, 48, 48, 49 }, this.magic, this._io, "/types/vol_desc/seq/1");
            }
            this.version = this._io.readU1();
            if (type() == 0) {
                this.volDescBootRecord = new VolDescBootRecord(this._io, this, _root);
                this.volDescBootRecord._read();
            }
            if (type() == 1) {
                this.volDescPrimary = new VolDescPrimary(this._io, this, _root);
                this.volDescPrimary._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (type() == 0) {
                this.volDescBootRecord._fetchInstances();
            }
            if (type() == 1) {
                this.volDescPrimary._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.type);
            this._io.writeBytes(this.magic);
            this._io.writeU1(this.version);
            if (type() == 0) {
                this.volDescBootRecord._write_Seq(this._io);
            }
            if (type() == 1) {
                this.volDescPrimary._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.magic.length != 5)
                throw new ConsistencyError("magic", 5, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 67, 68, 48, 48, 49 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67, 68, 48, 48, 49 }, this.magic, null, "/types/vol_desc/seq/1");
            }
            if (type() == 0) {
                if (!Objects.equals(this.volDescBootRecord._root(), _root()))
                    throw new ConsistencyError("vol_desc_boot_record", _root(), this.volDescBootRecord._root());
                if (!Objects.equals(this.volDescBootRecord._parent(), this))
                    throw new ConsistencyError("vol_desc_boot_record", this, this.volDescBootRecord._parent());
            }
            if (type() == 1) {
                if (!Objects.equals(this.volDescPrimary._root(), _root()))
                    throw new ConsistencyError("vol_desc_primary", _root(), this.volDescPrimary._root());
                if (!Objects.equals(this.volDescPrimary._parent(), this))
                    throw new ConsistencyError("vol_desc_primary", this, this.volDescPrimary._parent());
            }
            _dirty = false;
        }
        private int type;
        private byte[] magic;
        private int version;
        private VolDescBootRecord volDescBootRecord;
        private VolDescPrimary volDescPrimary;
        private Iso9660 _root;
        private Iso9660 _parent;
        public int type() { return type; }
        public void setType(int _v) { _dirty = true; type = _v; }
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public VolDescBootRecord volDescBootRecord() { return volDescBootRecord; }
        public void setVolDescBootRecord(VolDescBootRecord _v) { _dirty = true; volDescBootRecord = _v; }
        public VolDescPrimary volDescPrimary() { return volDescPrimary; }
        public void setVolDescPrimary(VolDescPrimary _v) { _dirty = true; volDescPrimary = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660 _parent() { return _parent; }
        public void set_parent(Iso9660 _v) { _dirty = true; _parent = _v; }
    }
    public static class VolDescBootRecord extends KaitaiStruct.ReadWrite {
        public static VolDescBootRecord fromFile(String fileName) throws IOException {
            return new VolDescBootRecord(new ByteBufferKaitaiStream(fileName));
        }
        public VolDescBootRecord() {
            this(null, null, null);
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
        }
        public void _read() {
            this.bootSystemId = new String(this._io.readBytes(32), StandardCharsets.UTF_8);
            this.bootId = new String(this._io.readBytes(32), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.bootSystemId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.bootId).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.bootSystemId).getBytes(Charset.forName("UTF-8")).length != 32)
                throw new ConsistencyError("boot_system_id", 32, (this.bootSystemId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.bootId).getBytes(Charset.forName("UTF-8")).length != 32)
                throw new ConsistencyError("boot_id", 32, (this.bootId).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private String bootSystemId;
        private String bootId;
        private Iso9660 _root;
        private Iso9660.VolDesc _parent;
        public String bootSystemId() { return bootSystemId; }
        public void setBootSystemId(String _v) { _dirty = true; bootSystemId = _v; }
        public String bootId() { return bootId; }
        public void setBootId(String _v) { _dirty = true; bootId = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660.VolDesc _parent() { return _parent; }
        public void set_parent(Iso9660.VolDesc _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor">Source</a>
     */
    public static class VolDescPrimary extends KaitaiStruct.ReadWrite {
        public static VolDescPrimary fromFile(String fileName) throws IOException {
            return new VolDescPrimary(new ByteBufferKaitaiStream(fileName));
        }
        public VolDescPrimary() {
            this(null, null, null);
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
        }
        public void _read() {
            this.unused1 = this._io.readBytes(1);
            if (!(Arrays.equals(this.unused1, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.unused1, this._io, "/types/vol_desc_primary/seq/0");
            }
            this.systemId = new String(this._io.readBytes(32), StandardCharsets.UTF_8);
            this.volumeId = new String(this._io.readBytes(32), StandardCharsets.UTF_8);
            this.unused2 = this._io.readBytes(8);
            if (!(Arrays.equals(this.unused2, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 }, this.unused2, this._io, "/types/vol_desc_primary/seq/3");
            }
            this.volSpaceSize = new U4bi(this._io, this, _root);
            this.volSpaceSize._read();
            this.unused3 = this._io.readBytes(32);
            if (!(Arrays.equals(this.unused3, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.unused3, this._io, "/types/vol_desc_primary/seq/5");
            }
            this.volSetSize = new U2bi(this._io, this, _root);
            this.volSetSize._read();
            this.volSeqNum = new U2bi(this._io, this, _root);
            this.volSeqNum._read();
            this.logicalBlockSize = new U2bi(this._io, this, _root);
            this.logicalBlockSize._read();
            this.pathTableSize = new U4bi(this._io, this, _root);
            this.pathTableSize._read();
            this.lbaPathTableLe = this._io.readU4le();
            this.lbaOptPathTableLe = this._io.readU4le();
            this.lbaPathTableBe = this._io.readU4be();
            this.lbaOptPathTableBe = this._io.readU4be();
            this._raw_rootDir = this._io.readBytes(34);
            KaitaiStream _io__raw_rootDir = new ByteBufferKaitaiStream(this._raw_rootDir);
            this.rootDir = new DirEntry(_io__raw_rootDir, this, _root);
            this.rootDir._read();
            this.volSetId = new String(this._io.readBytes(128), StandardCharsets.UTF_8);
            this.publisherId = new String(this._io.readBytes(128), StandardCharsets.UTF_8);
            this.dataPreparerId = new String(this._io.readBytes(128), StandardCharsets.UTF_8);
            this.applicationId = new String(this._io.readBytes(128), StandardCharsets.UTF_8);
            this.copyrightFileId = new String(this._io.readBytes(38), StandardCharsets.UTF_8);
            this.abstractFileId = new String(this._io.readBytes(36), StandardCharsets.UTF_8);
            this.bibliographicFileId = new String(this._io.readBytes(37), StandardCharsets.UTF_8);
            this.volCreateDatetime = new DecDatetime(this._io, this, _root);
            this.volCreateDatetime._read();
            this.volModDatetime = new DecDatetime(this._io, this, _root);
            this.volModDatetime._read();
            this.volExpireDatetime = new DecDatetime(this._io, this, _root);
            this.volExpireDatetime._read();
            this.volEffectiveDatetime = new DecDatetime(this._io, this, _root);
            this.volEffectiveDatetime._read();
            this.fileStructureVersion = this._io.readU1();
            this.unused4 = this._io.readU1();
            this.applicationArea = this._io.readBytes(512);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.volSpaceSize._fetchInstances();
            this.volSetSize._fetchInstances();
            this.volSeqNum._fetchInstances();
            this.logicalBlockSize._fetchInstances();
            this.pathTableSize._fetchInstances();
            this.rootDir._fetchInstances();
            this.volCreateDatetime._fetchInstances();
            this.volModDatetime._fetchInstances();
            this.volExpireDatetime._fetchInstances();
            this.volEffectiveDatetime._fetchInstances();
            pathTable();
            if (this.pathTable != null) {
                this.pathTable._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWritePathTable = _enabledPathTable;
            this._io.writeBytes(this.unused1);
            this._io.writeBytes((this.systemId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.volumeId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes(this.unused2);
            this.volSpaceSize._write_Seq(this._io);
            this._io.writeBytes(this.unused3);
            this.volSetSize._write_Seq(this._io);
            this.volSeqNum._write_Seq(this._io);
            this.logicalBlockSize._write_Seq(this._io);
            this.pathTableSize._write_Seq(this._io);
            this._io.writeU4le(this.lbaPathTableLe);
            this._io.writeU4le(this.lbaOptPathTableLe);
            this._io.writeU4be(this.lbaPathTableBe);
            this._io.writeU4be(this.lbaOptPathTableBe);
            final KaitaiStream _io__raw_rootDir = new ByteBufferKaitaiStream(34);
            this._io.addChildStream(_io__raw_rootDir);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (34));
                final VolDescPrimary _this = this;
                _io__raw_rootDir.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_rootDir = _io__raw_rootDir.toByteArray();
                        if (_this._raw_rootDir.length != 34)
                            throw new ConsistencyError("raw(root_dir)", 34, _this._raw_rootDir.length);
                        parent.writeBytes(_this._raw_rootDir);
                    }
                });
            }
            this.rootDir._write_Seq(_io__raw_rootDir);
            this._io.writeBytes((this.volSetId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.publisherId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.dataPreparerId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.applicationId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.copyrightFileId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.abstractFileId).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.bibliographicFileId).getBytes(Charset.forName("UTF-8")));
            this.volCreateDatetime._write_Seq(this._io);
            this.volModDatetime._write_Seq(this._io);
            this.volExpireDatetime._write_Seq(this._io);
            this.volEffectiveDatetime._write_Seq(this._io);
            this._io.writeU1(this.fileStructureVersion);
            this._io.writeU1(this.unused4);
            this._io.writeBytes(this.applicationArea);
        }

        public void _check() {
            if (this.unused1.length != 1)
                throw new ConsistencyError("unused1", 1, this.unused1.length);
            if (!(Arrays.equals(this.unused1, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.unused1, null, "/types/vol_desc_primary/seq/0");
            }
            if ((this.systemId).getBytes(Charset.forName("UTF-8")).length != 32)
                throw new ConsistencyError("system_id", 32, (this.systemId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.volumeId).getBytes(Charset.forName("UTF-8")).length != 32)
                throw new ConsistencyError("volume_id", 32, (this.volumeId).getBytes(Charset.forName("UTF-8")).length);
            if (this.unused2.length != 8)
                throw new ConsistencyError("unused2", 8, this.unused2.length);
            if (!(Arrays.equals(this.unused2, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 }, this.unused2, null, "/types/vol_desc_primary/seq/3");
            }
            if (!Objects.equals(this.volSpaceSize._root(), _root()))
                throw new ConsistencyError("vol_space_size", _root(), this.volSpaceSize._root());
            if (!Objects.equals(this.volSpaceSize._parent(), this))
                throw new ConsistencyError("vol_space_size", this, this.volSpaceSize._parent());
            if (this.unused3.length != 32)
                throw new ConsistencyError("unused3", 32, this.unused3.length);
            if (!(Arrays.equals(this.unused3, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.unused3, null, "/types/vol_desc_primary/seq/5");
            }
            if (!Objects.equals(this.volSetSize._root(), _root()))
                throw new ConsistencyError("vol_set_size", _root(), this.volSetSize._root());
            if (!Objects.equals(this.volSetSize._parent(), this))
                throw new ConsistencyError("vol_set_size", this, this.volSetSize._parent());
            if (!Objects.equals(this.volSeqNum._root(), _root()))
                throw new ConsistencyError("vol_seq_num", _root(), this.volSeqNum._root());
            if (!Objects.equals(this.volSeqNum._parent(), this))
                throw new ConsistencyError("vol_seq_num", this, this.volSeqNum._parent());
            if (!Objects.equals(this.logicalBlockSize._root(), _root()))
                throw new ConsistencyError("logical_block_size", _root(), this.logicalBlockSize._root());
            if (!Objects.equals(this.logicalBlockSize._parent(), this))
                throw new ConsistencyError("logical_block_size", this, this.logicalBlockSize._parent());
            if (!Objects.equals(this.pathTableSize._root(), _root()))
                throw new ConsistencyError("path_table_size", _root(), this.pathTableSize._root());
            if (!Objects.equals(this.pathTableSize._parent(), this))
                throw new ConsistencyError("path_table_size", this, this.pathTableSize._parent());
            if (!Objects.equals(this.rootDir._root(), _root()))
                throw new ConsistencyError("root_dir", _root(), this.rootDir._root());
            if (!Objects.equals(this.rootDir._parent(), this))
                throw new ConsistencyError("root_dir", this, this.rootDir._parent());
            if ((this.volSetId).getBytes(Charset.forName("UTF-8")).length != 128)
                throw new ConsistencyError("vol_set_id", 128, (this.volSetId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.publisherId).getBytes(Charset.forName("UTF-8")).length != 128)
                throw new ConsistencyError("publisher_id", 128, (this.publisherId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.dataPreparerId).getBytes(Charset.forName("UTF-8")).length != 128)
                throw new ConsistencyError("data_preparer_id", 128, (this.dataPreparerId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.applicationId).getBytes(Charset.forName("UTF-8")).length != 128)
                throw new ConsistencyError("application_id", 128, (this.applicationId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.copyrightFileId).getBytes(Charset.forName("UTF-8")).length != 38)
                throw new ConsistencyError("copyright_file_id", 38, (this.copyrightFileId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.abstractFileId).getBytes(Charset.forName("UTF-8")).length != 36)
                throw new ConsistencyError("abstract_file_id", 36, (this.abstractFileId).getBytes(Charset.forName("UTF-8")).length);
            if ((this.bibliographicFileId).getBytes(Charset.forName("UTF-8")).length != 37)
                throw new ConsistencyError("bibliographic_file_id", 37, (this.bibliographicFileId).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.volCreateDatetime._root(), _root()))
                throw new ConsistencyError("vol_create_datetime", _root(), this.volCreateDatetime._root());
            if (!Objects.equals(this.volCreateDatetime._parent(), this))
                throw new ConsistencyError("vol_create_datetime", this, this.volCreateDatetime._parent());
            if (!Objects.equals(this.volModDatetime._root(), _root()))
                throw new ConsistencyError("vol_mod_datetime", _root(), this.volModDatetime._root());
            if (!Objects.equals(this.volModDatetime._parent(), this))
                throw new ConsistencyError("vol_mod_datetime", this, this.volModDatetime._parent());
            if (!Objects.equals(this.volExpireDatetime._root(), _root()))
                throw new ConsistencyError("vol_expire_datetime", _root(), this.volExpireDatetime._root());
            if (!Objects.equals(this.volExpireDatetime._parent(), this))
                throw new ConsistencyError("vol_expire_datetime", this, this.volExpireDatetime._parent());
            if (!Objects.equals(this.volEffectiveDatetime._root(), _root()))
                throw new ConsistencyError("vol_effective_datetime", _root(), this.volEffectiveDatetime._root());
            if (!Objects.equals(this.volEffectiveDatetime._parent(), this))
                throw new ConsistencyError("vol_effective_datetime", this, this.volEffectiveDatetime._parent());
            if (this.applicationArea.length != 512)
                throw new ConsistencyError("application_area", 512, this.applicationArea.length);
            if (_enabledPathTable) {
                if (!Objects.equals(this.pathTable._root(), _root()))
                    throw new ConsistencyError("path_table", _root(), this.pathTable._root());
                if (!Objects.equals(this.pathTable._parent(), this))
                    throw new ConsistencyError("path_table", this, this.pathTable._parent());
            }
            _dirty = false;
        }
        private PathTableLe pathTable;
        private boolean _shouldWritePathTable = false;
        private boolean _enabledPathTable = true;
        public PathTableLe pathTable() {
            if (_shouldWritePathTable)
                _writePathTable();
            if (this.pathTable != null)
                return this.pathTable;
            if (!_enabledPathTable)
                return null;
            long _pos = this._io.pos();
            this._io.seek(lbaPathTableLe() * _root().sectorSize());
            this._raw_pathTable = this._io.readBytes(pathTableSize().le());
            KaitaiStream _io__raw_pathTable = new ByteBufferKaitaiStream(this._raw_pathTable);
            this.pathTable = new PathTableLe(_io__raw_pathTable, this, _root);
            this.pathTable._read();
            this._io.seek(_pos);
            return this.pathTable;
        }
        public void setPathTable(PathTableLe _v) { _dirty = true; pathTable = _v; }
        public void setPathTable_Enabled(boolean _v) { _dirty = true; _enabledPathTable = _v; }

        private void _writePathTable() {
            _shouldWritePathTable = false;
            long _pos = this._io.pos();
            this._io.seek(lbaPathTableLe() * _root().sectorSize());
            final KaitaiStream _io__raw_pathTable = new ByteBufferKaitaiStream(pathTableSize().le());
            this._io.addChildStream(_io__raw_pathTable);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (pathTableSize().le()));
                final VolDescPrimary _this = this;
                _io__raw_pathTable.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_pathTable = _io__raw_pathTable.toByteArray();
                        if (_this._raw_pathTable.length != pathTableSize().le())
                            throw new ConsistencyError("raw(path_table)", pathTableSize().le(), _this._raw_pathTable.length);
                        parent.writeBytes(_this._raw_pathTable);
                    }
                });
            }
            this.pathTable._write_Seq(_io__raw_pathTable);
            this._io.seek(_pos);
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
        public void setUnused1(byte[] _v) { _dirty = true; unused1 = _v; }
        public String systemId() { return systemId; }
        public void setSystemId(String _v) { _dirty = true; systemId = _v; }
        public String volumeId() { return volumeId; }
        public void setVolumeId(String _v) { _dirty = true; volumeId = _v; }
        public byte[] unused2() { return unused2; }
        public void setUnused2(byte[] _v) { _dirty = true; unused2 = _v; }
        public U4bi volSpaceSize() { return volSpaceSize; }
        public void setVolSpaceSize(U4bi _v) { _dirty = true; volSpaceSize = _v; }
        public byte[] unused3() { return unused3; }
        public void setUnused3(byte[] _v) { _dirty = true; unused3 = _v; }
        public U2bi volSetSize() { return volSetSize; }
        public void setVolSetSize(U2bi _v) { _dirty = true; volSetSize = _v; }
        public U2bi volSeqNum() { return volSeqNum; }
        public void setVolSeqNum(U2bi _v) { _dirty = true; volSeqNum = _v; }
        public U2bi logicalBlockSize() { return logicalBlockSize; }
        public void setLogicalBlockSize(U2bi _v) { _dirty = true; logicalBlockSize = _v; }
        public U4bi pathTableSize() { return pathTableSize; }
        public void setPathTableSize(U4bi _v) { _dirty = true; pathTableSize = _v; }
        public long lbaPathTableLe() { return lbaPathTableLe; }
        public void setLbaPathTableLe(long _v) { _dirty = true; lbaPathTableLe = _v; }
        public long lbaOptPathTableLe() { return lbaOptPathTableLe; }
        public void setLbaOptPathTableLe(long _v) { _dirty = true; lbaOptPathTableLe = _v; }
        public long lbaPathTableBe() { return lbaPathTableBe; }
        public void setLbaPathTableBe(long _v) { _dirty = true; lbaPathTableBe = _v; }
        public long lbaOptPathTableBe() { return lbaOptPathTableBe; }
        public void setLbaOptPathTableBe(long _v) { _dirty = true; lbaOptPathTableBe = _v; }
        public DirEntry rootDir() { return rootDir; }
        public void setRootDir(DirEntry _v) { _dirty = true; rootDir = _v; }
        public String volSetId() { return volSetId; }
        public void setVolSetId(String _v) { _dirty = true; volSetId = _v; }
        public String publisherId() { return publisherId; }
        public void setPublisherId(String _v) { _dirty = true; publisherId = _v; }
        public String dataPreparerId() { return dataPreparerId; }
        public void setDataPreparerId(String _v) { _dirty = true; dataPreparerId = _v; }
        public String applicationId() { return applicationId; }
        public void setApplicationId(String _v) { _dirty = true; applicationId = _v; }
        public String copyrightFileId() { return copyrightFileId; }
        public void setCopyrightFileId(String _v) { _dirty = true; copyrightFileId = _v; }
        public String abstractFileId() { return abstractFileId; }
        public void setAbstractFileId(String _v) { _dirty = true; abstractFileId = _v; }
        public String bibliographicFileId() { return bibliographicFileId; }
        public void setBibliographicFileId(String _v) { _dirty = true; bibliographicFileId = _v; }
        public DecDatetime volCreateDatetime() { return volCreateDatetime; }
        public void setVolCreateDatetime(DecDatetime _v) { _dirty = true; volCreateDatetime = _v; }
        public DecDatetime volModDatetime() { return volModDatetime; }
        public void setVolModDatetime(DecDatetime _v) { _dirty = true; volModDatetime = _v; }
        public DecDatetime volExpireDatetime() { return volExpireDatetime; }
        public void setVolExpireDatetime(DecDatetime _v) { _dirty = true; volExpireDatetime = _v; }
        public DecDatetime volEffectiveDatetime() { return volEffectiveDatetime; }
        public void setVolEffectiveDatetime(DecDatetime _v) { _dirty = true; volEffectiveDatetime = _v; }
        public int fileStructureVersion() { return fileStructureVersion; }
        public void setFileStructureVersion(int _v) { _dirty = true; fileStructureVersion = _v; }
        public int unused4() { return unused4; }
        public void setUnused4(int _v) { _dirty = true; unused4 = _v; }
        public byte[] applicationArea() { return applicationArea; }
        public void setApplicationArea(byte[] _v) { _dirty = true; applicationArea = _v; }
        public Iso9660 _root() { return _root; }
        public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
        public Iso9660.VolDesc _parent() { return _parent; }
        public void set_parent(Iso9660.VolDesc _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_rootDir() { return _raw_rootDir; }
        public void set_raw_RootDir(byte[] _v) { _dirty = true; _raw_rootDir = _v; }
        public byte[] _raw_pathTable() { return _raw_pathTable; }
        public void set_raw_PathTable(byte[] _v) { _dirty = true; _raw_pathTable = _v; }
    }
    private VolDesc primaryVolDesc;
    private boolean _shouldWritePrimaryVolDesc = false;
    private boolean _enabledPrimaryVolDesc = true;
    public VolDesc primaryVolDesc() {
        if (_shouldWritePrimaryVolDesc)
            _writePrimaryVolDesc();
        if (this.primaryVolDesc != null)
            return this.primaryVolDesc;
        if (!_enabledPrimaryVolDesc)
            return null;
        long _pos = this._io.pos();
        this._io.seek(16 * sectorSize());
        this.primaryVolDesc = new VolDesc(this._io, this, _root);
        this.primaryVolDesc._read();
        this._io.seek(_pos);
        return this.primaryVolDesc;
    }
    public void setPrimaryVolDesc(VolDesc _v) { _dirty = true; primaryVolDesc = _v; }
    public void setPrimaryVolDesc_Enabled(boolean _v) { _dirty = true; _enabledPrimaryVolDesc = _v; }

    private void _writePrimaryVolDesc() {
        _shouldWritePrimaryVolDesc = false;
        long _pos = this._io.pos();
        this._io.seek(16 * sectorSize());
        this.primaryVolDesc._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private Integer sectorSize;
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        this.sectorSize = ((int) 2048);
        return this.sectorSize;
    }
    public void _invalidateSectorSize() { this.sectorSize = null; }
    private Iso9660 _root;
    private KaitaiStruct.ReadWrite _parent;
    public Iso9660 _root() { return _root; }
    public void set_root(Iso9660 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
