// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * This spec can be used to parse sudo time stamp files located in directories
 * such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
 * @see <a href="https://www.sudo.ws/docs/man/1.8.27/sudoers_timestamp.man/">Source</a>
 */
public class SudoersTs extends KaitaiStruct {
    public static SudoersTs fromFile(String fileName) throws IOException {
        return new SudoersTs(new ByteBufferKaitaiStream(fileName));
    }

    public enum TsType {
        GLOBAL(1),
        TTY(2),
        PPID(3),
        LOCKEXCL(4);

        private final long id;
        TsType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, TsType> byId = new HashMap<Long, TsType>(4);
        static {
            for (TsType e : TsType.values())
                byId.put(e.id(), e);
        }
        public static TsType byId(long id) { return byId.get(id); }
    }

    public SudoersTs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SudoersTs(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SudoersTs(KaitaiStream _io, KaitaiStruct _parent, SudoersTs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.records.add(new Record(this._io, this, _root));
                i++;
            }
        }
    }
    public static class RecordV2 extends KaitaiStruct {
        public static RecordV2 fromFile(String fileName) throws IOException {
            return new RecordV2(new ByteBufferKaitaiStream(fileName));
        }

        public RecordV2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RecordV2(KaitaiStream _io, SudoersTs.Record _parent) {
            this(_io, _parent, null);
        }

        public RecordV2(KaitaiStream _io, SudoersTs.Record _parent, SudoersTs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = SudoersTs.TsType.byId(this._io.readU2le());
            this.flags = new TsFlag(this._io, this, _root);
            this.authUid = this._io.readU4le();
            this.sid = this._io.readU4le();
            this.startTime = new Timespec(this._io, this, _root);
            this.ts = new Timespec(this._io, this, _root);
            if (type() == SudoersTs.TsType.TTY) {
                this.ttydev = this._io.readU4le();
            }
            if (type() == SudoersTs.TsType.PPID) {
                this.ppid = this._io.readU4le();
            }
        }
        private TsType type;
        private TsFlag flags;
        private long authUid;
        private long sid;
        private Timespec startTime;
        private Timespec ts;
        private Long ttydev;
        private Long ppid;
        private SudoersTs _root;
        private SudoersTs.Record _parent;

        /**
         * record type
         */
        public TsType type() { return type; }

        /**
         * record flags
         */
        public TsFlag flags() { return flags; }

        /**
         * user ID that was used for authentication
         */
        public long authUid() { return authUid; }

        /**
         * ID of the user's terminal session, if present (when type is TS_TTY)
         */
        public long sid() { return sid; }

        /**
         * start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
         */
        public Timespec startTime() { return startTime; }

        /**
         * actual time stamp, from a monotonic time source
         */
        public Timespec ts() { return ts; }

        /**
         * device number of the terminal associated with the session
         */
        public Long ttydev() { return ttydev; }

        /**
         * ID of the parent process
         */
        public Long ppid() { return ppid; }
        public SudoersTs _root() { return _root; }
        public SudoersTs.Record _parent() { return _parent; }
    }
    public static class TsFlag extends KaitaiStruct {
        public static TsFlag fromFile(String fileName) throws IOException {
            return new TsFlag(new ByteBufferKaitaiStream(fileName));
        }

        public TsFlag(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TsFlag(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public TsFlag(KaitaiStream _io, KaitaiStruct _parent, SudoersTs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.reserved0 = this._io.readBitsIntBe(6);
            this.anyuid = this._io.readBitsIntBe(1) != 0;
            this.disabled = this._io.readBitsIntBe(1) != 0;
            this.reserved1 = this._io.readBitsIntBe(8);
        }
        private long reserved0;
        private boolean anyuid;
        private boolean disabled;
        private long reserved1;
        private SudoersTs _root;
        private KaitaiStruct _parent;

        /**
         * Reserved (unused) bits
         */
        public long reserved0() { return reserved0; }

        /**
         * ignore uid
         */
        public boolean anyuid() { return anyuid; }

        /**
         * entry disabled
         */
        public boolean disabled() { return disabled; }

        /**
         * Reserved (unused) bits
         */
        public long reserved1() { return reserved1; }
        public SudoersTs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class RecordV1 extends KaitaiStruct {
        public static RecordV1 fromFile(String fileName) throws IOException {
            return new RecordV1(new ByteBufferKaitaiStream(fileName));
        }

        public RecordV1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RecordV1(KaitaiStream _io, SudoersTs.Record _parent) {
            this(_io, _parent, null);
        }

        public RecordV1(KaitaiStream _io, SudoersTs.Record _parent, SudoersTs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = SudoersTs.TsType.byId(this._io.readU2le());
            this.flags = new TsFlag(this._io, this, _root);
            this.authUid = this._io.readU4le();
            this.sid = this._io.readU4le();
            this.ts = new Timespec(this._io, this, _root);
            if (type() == SudoersTs.TsType.TTY) {
                this.ttydev = this._io.readU4le();
            }
            if (type() == SudoersTs.TsType.PPID) {
                this.ppid = this._io.readU4le();
            }
        }
        private TsType type;
        private TsFlag flags;
        private long authUid;
        private long sid;
        private Timespec ts;
        private Long ttydev;
        private Long ppid;
        private SudoersTs _root;
        private SudoersTs.Record _parent;

        /**
         * record type
         */
        public TsType type() { return type; }

        /**
         * record flags
         */
        public TsFlag flags() { return flags; }

        /**
         * user ID that was used for authentication
         */
        public long authUid() { return authUid; }

        /**
         * session ID associated with tty/ppid
         */
        public long sid() { return sid; }

        /**
         * time stamp, from a monotonic time source
         */
        public Timespec ts() { return ts; }

        /**
         * device number of the terminal associated with the session
         */
        public Long ttydev() { return ttydev; }

        /**
         * ID of the parent process
         */
        public Long ppid() { return ppid; }
        public SudoersTs _root() { return _root; }
        public SudoersTs.Record _parent() { return _parent; }
    }
    public static class Timespec extends KaitaiStruct {
        public static Timespec fromFile(String fileName) throws IOException {
            return new Timespec(new ByteBufferKaitaiStream(fileName));
        }

        public Timespec(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Timespec(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Timespec(KaitaiStream _io, KaitaiStruct _parent, SudoersTs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sec = this._io.readS8le();
            this.nsec = this._io.readS8le();
        }
        private long sec;
        private long nsec;
        private SudoersTs _root;
        private KaitaiStruct _parent;

        /**
         * seconds
         */
        public long sec() { return sec; }

        /**
         * nanoseconds
         */
        public long nsec() { return nsec; }
        public SudoersTs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, SudoersTs _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, SudoersTs _parent, SudoersTs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU2le();
            this.lenRecord = this._io.readU2le();
            switch (version()) {
            case 1: {
                this._raw_payload = this._io.readBytes((lenRecord() - 4));
                KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(_raw_payload);
                this.payload = new RecordV1(_io__raw_payload, this, _root);
                break;
            }
            case 2: {
                this._raw_payload = this._io.readBytes((lenRecord() - 4));
                KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(_raw_payload);
                this.payload = new RecordV2(_io__raw_payload, this, _root);
                break;
            }
            default: {
                this.payload = this._io.readBytes((lenRecord() - 4));
                break;
            }
            }
        }
        private int version;
        private int lenRecord;
        private Object payload;
        private SudoersTs _root;
        private SudoersTs _parent;
        private byte[] _raw_payload;

        /**
         * version number of the timestamp_entry struct
         */
        public int version() { return version; }

        /**
         * size of the record in bytes
         */
        public int lenRecord() { return lenRecord; }
        public Object payload() { return payload; }
        public SudoersTs _root() { return _root; }
        public SudoersTs _parent() { return _parent; }
        public byte[] _raw_payload() { return _raw_payload; }
    }
    private ArrayList<Record> records;
    private SudoersTs _root;
    private KaitaiStruct _parent;
    public ArrayList<Record> records() { return records; }
    public SudoersTs _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
