// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
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
public class WindowsEvtLog extends KaitaiStruct {
    public static WindowsEvtLog fromFile(String fileName) throws IOException {
        return new WindowsEvtLog(new ByteBufferKaitaiStream(fileName));
    }

    public WindowsEvtLog(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsEvtLog(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public WindowsEvtLog(KaitaiStream _io, KaitaiStruct _parent, WindowsEvtLog _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.records.add(new Record(this._io, this, _root));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    /**
     * @see <a href="https://forensics.wiki/windows_event_log_(evt)/#cursor-record">Source</a>
     */
    public static class CursorRecordBody extends KaitaiStruct {
        public static CursorRecordBody fromFile(String fileName) throws IOException {
            return new CursorRecordBody(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(12);
            if (!(Arrays.equals(this.magic, new byte[] { 34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68 }, this.magic, this._io, "/types/cursor_record_body/seq/0");
            }
            this.ofsFirstRecord = this._io.readU4le();
            this.ofsNextRecord = this._io.readU4le();
            this.idxNextRecord = this._io.readU4le();
            this.idxFirstRecord = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private byte[] magic;
        private long ofsFirstRecord;
        private long ofsNextRecord;
        private long idxNextRecord;
        private long idxFirstRecord;
        private WindowsEvtLog _root;
        private WindowsEvtLog.Record _parent;
        public byte[] magic() { return magic; }
        public long ofsFirstRecord() { return ofsFirstRecord; }
        public long ofsNextRecord() { return ofsNextRecord; }
        public long idxNextRecord() { return idxNextRecord; }
        public long idxFirstRecord() { return idxFirstRecord; }
        public WindowsEvtLog _root() { return _root; }
        public WindowsEvtLog.Record _parent() { return _parent; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb309024(v=vs.85)">Source</a>
     */
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
            this.retention = this._io.readU4le();
            this.lenHeader2 = this._io.readU4le();
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
        }
        public static class Flags extends KaitaiStruct {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readBitsIntBe(28);
                this.archive = this._io.readBitsIntBe(1) != 0;
                this.logFull = this._io.readBitsIntBe(1) != 0;
                this.wrap = this._io.readBitsIntBe(1) != 0;
                this.dirty = this._io.readBitsIntBe(1) != 0;
            }

            public void _fetchInstances() {
            }
            private long reserved;
            private boolean archive;
            private boolean logFull;
            private boolean wrap;
            private boolean dirty;
            private WindowsEvtLog _root;
            private WindowsEvtLog.Header _parent;
            public long reserved() { return reserved; }

            /**
             * True if archive attribute has been set for this log file.
             */
            public boolean archive() { return archive; }

            /**
             * True if last write operation failed due to log being full.
             */
            public boolean logFull() { return logFull; }

            /**
             * True if wrapping of record has occured.
             */
            public boolean wrap() { return wrap; }

            /**
             * True if write operation was in progress, but log file
             * wasn't properly closed.
             */
            public boolean dirty() { return dirty; }
            public WindowsEvtLog _root() { return _root; }
            public WindowsEvtLog.Header _parent() { return _parent; }
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
        public byte[] magic() { return magic; }
        public long versionMajor() { return versionMajor; }
        public long versionMinor() { return versionMinor; }

        /**
         * Offset of oldest record kept in this log file.
         */
        public long ofsStart() { return ofsStart; }

        /**
         * Offset of EOF log record, which is a placeholder for new record.
         */
        public long ofsEnd() { return ofsEnd; }

        /**
         * Index of current record, where a new submission would be
         * written to (normally there should to EOF log record there).
         */
        public long curRecIdx() { return curRecIdx; }

        /**
         * Index of oldest record in the log file
         */
        public long oldestRecIdx() { return oldestRecIdx; }

        /**
         * Total maximum size of the log file
         */
        public long lenFileMax() { return lenFileMax; }
        public Flags flags() { return flags; }
        public long retention() { return retention; }

        /**
         * Size of the header structure repeated again, and again it must be 0x30.
         */
        public long lenHeader2() { return lenHeader2; }
        public WindowsEvtLog _root() { return _root; }
        public WindowsEvtLog _parent() { return _parent; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord">Source</a>
     */
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenRecord = this._io.readU4le();
            this.type = this._io.readU4le();
            switch (type()) {
            case 1699505740: {
                KaitaiStream _io_body = this._io.substream(lenRecord() - 12);
                this.body = new RecordBody(_io_body, this, _root);
                break;
            }
            case 286331153: {
                KaitaiStream _io_body = this._io.substream(lenRecord() - 12);
                this.body = new CursorRecordBody(_io_body, this, _root);
                break;
            }
            default: {
                this.body = this._io.readBytes(lenRecord() - 12);
                break;
            }
            }
            this.lenRecord2 = this._io.readU4le();
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
        private long lenRecord;
        private long type;
        private Object body;
        private long lenRecord2;
        private WindowsEvtLog _root;
        private WindowsEvtLog _parent;

        /**
         * Size of whole record, including all headers, footers and data
         */
        public long lenRecord() { return lenRecord; }

        /**
         * Type of record. Normal log records specify "LfLe"
         * (0x654c664c) in this field, cursor records use 0x11111111.
         */
        public long type() { return type; }

        /**
         * Record body interpretation depends on type of record. Body
         * size is specified in a way that it won't include a 8-byte
         * "header" (`len_record` + `type`) and a "footer"
         * (`len_record2`).
         */
        public Object body() { return body; }

        /**
         * Size of whole record again.
         */
        public long lenRecord2() { return lenRecord2; }
        public WindowsEvtLog _root() { return _root; }
        public WindowsEvtLog _parent() { return _parent; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord">Source</a>
     */
    public static class RecordBody extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
            data();
            if (this.data != null) {
            }
            userSid();
            if (this.userSid != null) {
            }
        }
        private byte[] data;
        public byte[] data() {
            if (this.data != null)
                return this.data;
            long _pos = this._io.pos();
            this._io.seek(ofsData() - 8);
            this.data = this._io.readBytes(lenData());
            this._io.seek(_pos);
            return this.data;
        }
        private byte[] userSid;
        public byte[] userSid() {
            if (this.userSid != null)
                return this.userSid;
            long _pos = this._io.pos();
            this._io.seek(ofsUserSid() - 8);
            this.userSid = this._io.readBytes(lenUserSid());
            this._io.seek(_pos);
            return this.userSid;
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

        /**
         * Time when this record was generated, POSIX timestamp format.
         */
        public long timeGenerated() { return timeGenerated; }

        /**
         * Time when thsi record was written into the log file, POSIX timestamp format.
         */
        public long timeWritten() { return timeWritten; }

        /**
         * Identifier of an event, meaning is specific to particular
         * source of events / event type.
         */
        public long eventId() { return eventId; }

        /**
         * Type of event.
         * @see <a href="https://learn.microsoft.com/en-us/windows/win32/eventlog/event-types">Source</a>
         */
        public EventTypes eventType() { return eventType; }

        /**
         * Number of strings present in the log.
         */
        public int numStrings() { return numStrings; }

        /**
         * @see <a href="https://learn.microsoft.com/en-us/windows/win32/eventlog/event-categories">Source</a>
         */
        public int eventCategory() { return eventCategory; }
        public byte[] reserved() { return reserved; }

        /**
         * Offset of strings present in the log
         */
        public long ofsStrings() { return ofsStrings; }
        public long lenUserSid() { return lenUserSid; }
        public long ofsUserSid() { return ofsUserSid; }
        public long lenData() { return lenData; }
        public long ofsData() { return ofsData; }
        public WindowsEvtLog _root() { return _root; }
        public WindowsEvtLog.Record _parent() { return _parent; }
    }
    private Header header;
    private List<Record> records;
    private WindowsEvtLog _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public List<Record> records() { return records; }
    public WindowsEvtLog _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
