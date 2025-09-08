// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.List;


/**
 * EVT files are Windows Event Log files written by older Windows
 * operating systems (2000, XP, 2003). They are used as binary log
 * files by several major Windows subsystems and
 * applications. Typically, several of them can be found in
 * `%WINDIR%\system32\config` directory:
 * 
 * * Application = `AppEvent.evt`
 * * System = `SysEvent.evt`
 * * Security = `SecEvent.evt`
 * 
 * Alternatively, one can export any system event log as distinct .evt
 * file using relevant option in Event Viewer application.
 * 
 * A Windows application can submit an entry into these logs using
 * [ReportEventA](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa)
 * function of Windows API.
 * 
 * Internally, EVT files consist of a fixed-size header and event
 * records. There are several usage scenarios (non-wrapping vs wrapping
 * log files) which result in slightly different organization of
 * records.
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/eventlog/event-log-file-format">Source</a>
 */
public class WindowsEvtLog extends KaitaiStruct.ReadWrite {
    public static WindowsEvtLog fromFile(String fileName) throws IOException {
        return new WindowsEvtLog(new ByteBufferKaitaiStream(fileName));
    }
    public WindowsEvtLog() {
        this(null, null, null);
    }

    public WindowsEvtLog(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsEvtLog(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public WindowsEvtLog(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, WindowsEvtLog _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new Header(this._io, this, _root);
        this.header._read();
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Record _t_records = new Record(this._io, this, _root);
                try {
                    _t_records._read();
                } finally {
                    this.records.add(_t_records);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.records.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
            this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://forensics.wiki/windows_event_log_(evt)/#cursor-record">Source</a>
     */
    public static class CursorRecordBody extends KaitaiStruct.ReadWrite {
        public static CursorRecordBody fromFile(String fileName) throws IOException {
            return new CursorRecordBody(new ByteBufferKaitaiStream(fileName));
        }
        public CursorRecordBody() {
            this(null, null, null);
        }

        public CursorRecordBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CursorRecordBody(KaitaiStream _io, WindowsEvtLog.Record _parent) {
            this(_io, _parent, null);
        }

        public CursorRecordBody(KaitaiStream _io, WindowsEvtLog.Record _parent, WindowsEvtLog _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(12);
            if (!(Arrays.equals(this.magic, new byte[] { 34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68 }, this.magic, this._io, "/types/cursor_record_body/seq/0");
            }
            this.ofsFirstRecord = this._io.readU4le();
            this.ofsNextRecord = this._io.readU4le();
            this.idxNextRecord = this._io.readU4le();
            this.idxFirstRecord = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.ofsFirstRecord);
            this._io.writeU4le(this.ofsNextRecord);
            this._io.writeU4le(this.idxNextRecord);
            this._io.writeU4le(this.idxFirstRecord);
        }

        public void _check() {
            if (this.magic.length != 12)
                throw new ConsistencyError("magic", 12, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68 }, this.magic, null, "/types/cursor_record_body/seq/0");
            }
            _dirty = false;
        }
        private byte[] magic;
        private long ofsFirstRecord;
        private long ofsNextRecord;
        private long idxNextRecord;
        private long idxFirstRecord;
        private WindowsEvtLog _root;
        private WindowsEvtLog.Record _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long ofsFirstRecord() { return ofsFirstRecord; }
        public void setOfsFirstRecord(long _v) { _dirty = true; ofsFirstRecord = _v; }
        public long ofsNextRecord() { return ofsNextRecord; }
        public void setOfsNextRecord(long _v) { _dirty = true; ofsNextRecord = _v; }
        public long idxNextRecord() { return idxNextRecord; }
        public void setIdxNextRecord(long _v) { _dirty = true; idxNextRecord = _v; }
        public long idxFirstRecord() { return idxFirstRecord; }
        public void setIdxFirstRecord(long _v) { _dirty = true; idxFirstRecord = _v; }
        public WindowsEvtLog _root() { return _root; }
        public void set_root(WindowsEvtLog _v) { _dirty = true; _root = _v; }
        public WindowsEvtLog.Record _parent() { return _parent; }
        public void set_parent(WindowsEvtLog.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb309024(v=vs.85)">Source</a>
     */
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

        public Header(KaitaiStream _io, WindowsEvtLog _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, WindowsEvtLog _parent, WindowsEvtLog _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenHeader = this._io.readU4le();
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 76, 102, 76, 101 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 102, 76, 101 }, this.magic, this._io, "/types/header/seq/1");
            }
            this.versionMajor = this._io.readU4le();
            this.versionMinor = this._io.readU4le();
            this.ofsStart = this._io.readU4le();
            this.ofsEnd = this._io.readU4le();
            this.curRecIdx = this._io.readU4le();
            this.oldestRecIdx = this._io.readU4le();
            this.lenFileMax = this._io.readU4le();
            this.flags = new Flags(this._io, this, _root);
            this.flags._read();
            this.retention = this._io.readU4le();
            this.lenHeader2 = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenHeader);
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.versionMajor);
            this._io.writeU4le(this.versionMinor);
            this._io.writeU4le(this.ofsStart);
            this._io.writeU4le(this.ofsEnd);
            this._io.writeU4le(this.curRecIdx);
            this._io.writeU4le(this.oldestRecIdx);
            this._io.writeU4le(this.lenFileMax);
            this.flags._write_Seq(this._io);
            this._io.writeU4le(this.retention);
            this._io.writeU4le(this.lenHeader2);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 76, 102, 76, 101 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 102, 76, 101 }, this.magic, null, "/types/header/seq/1");
            }
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            _dirty = false;
        }
        public static class Flags extends KaitaiStruct.ReadWrite {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
            }
            public Flags() {
                this(null, null, null);
            }

            public Flags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Flags(KaitaiStream _io, WindowsEvtLog.Header _parent) {
                this(_io, _parent, null);
            }

            public Flags(KaitaiStream _io, WindowsEvtLog.Header _parent, WindowsEvtLog _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readBitsIntBe(28);
                this.archive = this._io.readBitsIntBe(1) != 0;
                this.logFull = this._io.readBitsIntBe(1) != 0;
                this.wrap = this._io.readBitsIntBe(1) != 0;
                this.dirty = this._io.readBitsIntBe(1) != 0;
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(28, this.reserved);
                this._io.writeBitsIntBe(1, (this.archive ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.logFull ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.wrap ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.dirty ? 1 : 0));
            }

            public void _check() {
                _dirty = false;
            }
            private long reserved;
            private boolean archive;
            private boolean logFull;
            private boolean wrap;
            private boolean dirty;
            private WindowsEvtLog _root;
            private WindowsEvtLog.Header _parent;
            public long reserved() { return reserved; }
            public void setReserved(long _v) { _dirty = true; reserved = _v; }

            /**
             * True if archive attribute has been set for this log file.
             */
            public boolean archive() { return archive; }
            public void setArchive(boolean _v) { _dirty = true; archive = _v; }

            /**
             * True if last write operation failed due to log being full.
             */
            public boolean logFull() { return logFull; }
            public void setLogFull(boolean _v) { _dirty = true; logFull = _v; }

            /**
             * True if wrapping of record has occured.
             */
            public boolean wrap() { return wrap; }
            public void setWrap(boolean _v) { _dirty = true; wrap = _v; }

            /**
             * True if write operation was in progress, but log file
             * wasn't properly closed.
             */
            public boolean dirty() { return dirty; }
            public void setDirty(boolean _v) { _dirty = true; dirty = _v; }
            public WindowsEvtLog _root() { return _root; }
            public void set_root(WindowsEvtLog _v) { _dirty = true; _root = _v; }
            public WindowsEvtLog.Header _parent() { return _parent; }
            public void set_parent(WindowsEvtLog.Header _v) { _dirty = true; _parent = _v; }
        }
        private long lenHeader;
        private byte[] magic;
        private long versionMajor;
        private long versionMinor;
        private long ofsStart;
        private long ofsEnd;
        private long curRecIdx;
        private long oldestRecIdx;
        private long lenFileMax;
        private Flags flags;
        private long retention;
        private long lenHeader2;
        private WindowsEvtLog _root;
        private WindowsEvtLog _parent;

        /**
         * Size of the header structure, must be 0x30.
         */
        public long lenHeader() { return lenHeader; }
        public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long versionMajor() { return versionMajor; }
        public void setVersionMajor(long _v) { _dirty = true; versionMajor = _v; }
        public long versionMinor() { return versionMinor; }
        public void setVersionMinor(long _v) { _dirty = true; versionMinor = _v; }

        /**
         * Offset of oldest record kept in this log file.
         */
        public long ofsStart() { return ofsStart; }
        public void setOfsStart(long _v) { _dirty = true; ofsStart = _v; }

        /**
         * Offset of EOF log record, which is a placeholder for new record.
         */
        public long ofsEnd() { return ofsEnd; }
        public void setOfsEnd(long _v) { _dirty = true; ofsEnd = _v; }

        /**
         * Index of current record, where a new submission would be
         * written to (normally there should to EOF log record there).
         */
        public long curRecIdx() { return curRecIdx; }
        public void setCurRecIdx(long _v) { _dirty = true; curRecIdx = _v; }

        /**
         * Index of oldest record in the log file
         */
        public long oldestRecIdx() { return oldestRecIdx; }
        public void setOldestRecIdx(long _v) { _dirty = true; oldestRecIdx = _v; }

        /**
         * Total maximum size of the log file
         */
        public long lenFileMax() { return lenFileMax; }
        public void setLenFileMax(long _v) { _dirty = true; lenFileMax = _v; }
        public Flags flags() { return flags; }
        public void setFlags(Flags _v) { _dirty = true; flags = _v; }
        public long retention() { return retention; }
        public void setRetention(long _v) { _dirty = true; retention = _v; }

        /**
         * Size of the header structure repeated again, and again it must be 0x30.
         */
        public long lenHeader2() { return lenHeader2; }
        public void setLenHeader2(long _v) { _dirty = true; lenHeader2 = _v; }
        public WindowsEvtLog _root() { return _root; }
        public void set_root(WindowsEvtLog _v) { _dirty = true; _root = _v; }
        public WindowsEvtLog _parent() { return _parent; }
        public void set_parent(WindowsEvtLog _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord">Source</a>
     */
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

        public Record(KaitaiStream _io, WindowsEvtLog _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, WindowsEvtLog _parent, WindowsEvtLog _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenRecord = this._io.readU4le();
            this.type = this._io.readU4le();
            switch (type()) {
            case 1699505740: {
                this._raw_body = this._io.readBytes(lenRecord() - 12);
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new RecordBody(_io__raw_body, this, _root);
                ((RecordBody) (this.body))._read();
                break;
            }
            case 286331153: {
                this._raw_body = this._io.readBytes(lenRecord() - 12);
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new CursorRecordBody(_io__raw_body, this, _root);
                ((CursorRecordBody) (this.body))._read();
                break;
            }
            default: {
                this.body = this._io.readBytes(lenRecord() - 12);
                break;
            }
            }
            this.lenRecord2 = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (type()) {
            case 1699505740: {
                ((RecordBody) (this.body))._fetchInstances();
                break;
            }
            case 286331153: {
                ((CursorRecordBody) (this.body))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenRecord);
            this._io.writeU4le(this.type);
            switch (type()) {
            case 1699505740: {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenRecord() - 12);
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenRecord() - 12));
                    final Record _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != lenRecord() - 12)
                                throw new ConsistencyError("raw(body)", lenRecord() - 12, ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((RecordBody) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case 286331153: {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenRecord() - 12);
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenRecord() - 12));
                    final Record _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != lenRecord() - 12)
                                throw new ConsistencyError("raw(body)", lenRecord() - 12, ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((CursorRecordBody) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                break;
            }
            }
            this._io.writeU4le(this.lenRecord2);
        }

        public void _check() {
            switch (type()) {
            case 1699505740: {
                if (!Objects.equals(((WindowsEvtLog.RecordBody) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((WindowsEvtLog.RecordBody) (this.body))._root());
                if (!Objects.equals(((WindowsEvtLog.RecordBody) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((WindowsEvtLog.RecordBody) (this.body))._parent());
                break;
            }
            case 286331153: {
                if (!Objects.equals(((WindowsEvtLog.CursorRecordBody) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((WindowsEvtLog.CursorRecordBody) (this.body))._root());
                if (!Objects.equals(((WindowsEvtLog.CursorRecordBody) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((WindowsEvtLog.CursorRecordBody) (this.body))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.body)).length != lenRecord() - 12)
                    throw new ConsistencyError("body", lenRecord() - 12, ((byte[]) (this.body)).length);
                break;
            }
            }
            _dirty = false;
        }
        private long lenRecord;
        private long type;
        private Object body;
        private long lenRecord2;
        private WindowsEvtLog _root;
        private WindowsEvtLog _parent;
        private byte[] _raw_body;

        /**
         * Size of whole record, including all headers, footers and data
         */
        public long lenRecord() { return lenRecord; }
        public void setLenRecord(long _v) { _dirty = true; lenRecord = _v; }

        /**
         * Type of record. Normal log records specify "LfLe"
         * (0x654c664c) in this field, cursor records use 0x11111111.
         */
        public long type() { return type; }
        public void setType(long _v) { _dirty = true; type = _v; }

        /**
         * Record body interpretation depends on type of record. Body
         * size is specified in a way that it won't include a 8-byte
         * "header" (`len_record` + `type`) and a "footer"
         * (`len_record2`).
         */
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }

        /**
         * Size of whole record again.
         */
        public long lenRecord2() { return lenRecord2; }
        public void setLenRecord2(long _v) { _dirty = true; lenRecord2 = _v; }
        public WindowsEvtLog _root() { return _root; }
        public void set_root(WindowsEvtLog _v) { _dirty = true; _root = _v; }
        public WindowsEvtLog _parent() { return _parent; }
        public void set_parent(WindowsEvtLog _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord">Source</a>
     */
    public static class RecordBody extends KaitaiStruct.ReadWrite {
        public static RecordBody fromFile(String fileName) throws IOException {
            return new RecordBody(new ByteBufferKaitaiStream(fileName));
        }

        public enum EventTypes {
            ERROR(1),
            AUDIT_FAILURE(2),
            AUDIT_SUCCESS(3),
            INFO(4),
            WARNING(5);

            private final long id;
            EventTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, EventTypes> byId = new HashMap<Long, EventTypes>(5);
            static {
                for (EventTypes e : EventTypes.values())
                    byId.put(e.id(), e);
            }
            public static EventTypes byId(long id) { return byId.get(id); }
        }
        public RecordBody() {
            this(null, null, null);
        }

        public RecordBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RecordBody(KaitaiStream _io, WindowsEvtLog.Record _parent) {
            this(_io, _parent, null);
        }

        public RecordBody(KaitaiStream _io, WindowsEvtLog.Record _parent, WindowsEvtLog _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.idx = this._io.readU4le();
            this.timeGenerated = this._io.readU4le();
            this.timeWritten = this._io.readU4le();
            this.eventId = this._io.readU4le();
            this.eventType = EventTypes.byId(this._io.readU2le());
            this.numStrings = this._io.readU2le();
            this.eventCategory = this._io.readU2le();
            this.reserved = this._io.readBytes(6);
            this.ofsStrings = this._io.readU4le();
            this.lenUserSid = this._io.readU4le();
            this.ofsUserSid = this._io.readU4le();
            this.lenData = this._io.readU4le();
            this.ofsData = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            data();
            if (this.data != null) {
            }
            userSid();
            if (this.userSid != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteData = _enabledData;
            _shouldWriteUserSid = _enabledUserSid;
            this._io.writeU4le(this.idx);
            this._io.writeU4le(this.timeGenerated);
            this._io.writeU4le(this.timeWritten);
            this._io.writeU4le(this.eventId);
            this._io.writeU2le(((Number) (this.eventType.id())).intValue());
            this._io.writeU2le(this.numStrings);
            this._io.writeU2le(this.eventCategory);
            this._io.writeBytes(this.reserved);
            this._io.writeU4le(this.ofsStrings);
            this._io.writeU4le(this.lenUserSid);
            this._io.writeU4le(this.ofsUserSid);
            this._io.writeU4le(this.lenData);
            this._io.writeU4le(this.ofsData);
        }

        public void _check() {
            if (this.reserved.length != 6)
                throw new ConsistencyError("reserved", 6, this.reserved.length);
            if (_enabledData) {
                if (this.data.length != lenData())
                    throw new ConsistencyError("data", lenData(), this.data.length);
            }
            if (_enabledUserSid) {
                if (this.userSid.length != lenUserSid())
                    throw new ConsistencyError("user_sid", lenUserSid(), this.userSid.length);
            }
            _dirty = false;
        }
        private byte[] data;
        private boolean _shouldWriteData = false;
        private boolean _enabledData = true;
        public byte[] data() {
            if (_shouldWriteData)
                _writeData();
            if (this.data != null)
                return this.data;
            if (!_enabledData)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsData() - 8);
            this.data = this._io.readBytes(lenData());
            this._io.seek(_pos);
            return this.data;
        }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

        private void _writeData() {
            _shouldWriteData = false;
            long _pos = this._io.pos();
            this._io.seek(ofsData() - 8);
            this._io.writeBytes(this.data);
            this._io.seek(_pos);
        }
        private byte[] userSid;
        private boolean _shouldWriteUserSid = false;
        private boolean _enabledUserSid = true;
        public byte[] userSid() {
            if (_shouldWriteUserSid)
                _writeUserSid();
            if (this.userSid != null)
                return this.userSid;
            if (!_enabledUserSid)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsUserSid() - 8);
            this.userSid = this._io.readBytes(lenUserSid());
            this._io.seek(_pos);
            return this.userSid;
        }
        public void setUserSid(byte[] _v) { _dirty = true; userSid = _v; }
        public void setUserSid_Enabled(boolean _v) { _dirty = true; _enabledUserSid = _v; }

        private void _writeUserSid() {
            _shouldWriteUserSid = false;
            long _pos = this._io.pos();
            this._io.seek(ofsUserSid() - 8);
            this._io.writeBytes(this.userSid);
            this._io.seek(_pos);
        }
        private long idx;
        private long timeGenerated;
        private long timeWritten;
        private long eventId;
        private EventTypes eventType;
        private int numStrings;
        private int eventCategory;
        private byte[] reserved;
        private long ofsStrings;
        private long lenUserSid;
        private long ofsUserSid;
        private long lenData;
        private long ofsData;
        private WindowsEvtLog _root;
        private WindowsEvtLog.Record _parent;

        /**
         * Index of record in the file.
         */
        public long idx() { return idx; }
        public void setIdx(long _v) { _dirty = true; idx = _v; }

        /**
         * Time when this record was generated, POSIX timestamp format.
         */
        public long timeGenerated() { return timeGenerated; }
        public void setTimeGenerated(long _v) { _dirty = true; timeGenerated = _v; }

        /**
         * Time when thsi record was written into the log file, POSIX timestamp format.
         */
        public long timeWritten() { return timeWritten; }
        public void setTimeWritten(long _v) { _dirty = true; timeWritten = _v; }

        /**
         * Identifier of an event, meaning is specific to particular
         * source of events / event type.
         */
        public long eventId() { return eventId; }
        public void setEventId(long _v) { _dirty = true; eventId = _v; }

        /**
         * Type of event.
         * @see <a href="https://learn.microsoft.com/en-us/windows/win32/eventlog/event-types">Source</a>
         */
        public EventTypes eventType() { return eventType; }
        public void setEventType(EventTypes _v) { _dirty = true; eventType = _v; }

        /**
         * Number of strings present in the log.
         */
        public int numStrings() { return numStrings; }
        public void setNumStrings(int _v) { _dirty = true; numStrings = _v; }

        /**
         * @see <a href="https://learn.microsoft.com/en-us/windows/win32/eventlog/event-categories">Source</a>
         */
        public int eventCategory() { return eventCategory; }
        public void setEventCategory(int _v) { _dirty = true; eventCategory = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }

        /**
         * Offset of strings present in the log
         */
        public long ofsStrings() { return ofsStrings; }
        public void setOfsStrings(long _v) { _dirty = true; ofsStrings = _v; }
        public long lenUserSid() { return lenUserSid; }
        public void setLenUserSid(long _v) { _dirty = true; lenUserSid = _v; }
        public long ofsUserSid() { return ofsUserSid; }
        public void setOfsUserSid(long _v) { _dirty = true; ofsUserSid = _v; }
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public long ofsData() { return ofsData; }
        public void setOfsData(long _v) { _dirty = true; ofsData = _v; }
        public WindowsEvtLog _root() { return _root; }
        public void set_root(WindowsEvtLog _v) { _dirty = true; _root = _v; }
        public WindowsEvtLog.Record _parent() { return _parent; }
        public void set_parent(WindowsEvtLog.Record _v) { _dirty = true; _parent = _v; }
    }
    private Header header;
    private List<Record> records;
    private WindowsEvtLog _root;
    private KaitaiStruct.ReadWrite _parent;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public WindowsEvtLog _root() { return _root; }
    public void set_root(WindowsEvtLog _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
