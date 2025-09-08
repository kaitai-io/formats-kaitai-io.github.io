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
import java.util.List;


/**
 * This spec can be used to parse sudo time stamp files located in directories
 * such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
 * @see <a href="https://www.sudo.ws/docs/man/1.8.27/sudoers_timestamp.man/">Source</a>
 */
public class SudoersTs extends KaitaiStruct.ReadWrite {
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
    public SudoersTs() {
        this(null, null, null);
    }

    public SudoersTs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SudoersTs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SudoersTs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SudoersTs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
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
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.records.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
            this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
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

        public Record(KaitaiStream _io, SudoersTs _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, SudoersTs _parent, SudoersTs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU2le();
            this.lenRecord = this._io.readU2le();
            switch (version()) {
            case 1: {
                this._raw_payload = this._io.readBytes(lenRecord() - 4);
                KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                this.payload = new RecordV1(_io__raw_payload, this, _root);
                ((RecordV1) (this.payload))._read();
                break;
            }
            case 2: {
                this._raw_payload = this._io.readBytes(lenRecord() - 4);
                KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                this.payload = new RecordV2(_io__raw_payload, this, _root);
                ((RecordV2) (this.payload))._read();
                break;
            }
            default: {
                this.payload = this._io.readBytes(lenRecord() - 4);
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (version()) {
            case 1: {
                ((RecordV1) (this.payload))._fetchInstances();
                break;
            }
            case 2: {
                ((RecordV2) (this.payload))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.version);
            this._io.writeU2le(this.lenRecord);
            switch (version()) {
            case 1: {
                final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(lenRecord() - 4);
                this._io.addChildStream(_io__raw_payload);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenRecord() - 4));
                    final Record _this = this;
                    _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_payload = _io__raw_payload.toByteArray();
                            if (((byte[]) (_this._raw_payload)).length != lenRecord() - 4)
                                throw new ConsistencyError("raw(payload)", lenRecord() - 4, ((byte[]) (_this._raw_payload)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                        }
                    });
                }
                ((RecordV1) (this.payload))._write_Seq(_io__raw_payload);
                break;
            }
            case 2: {
                final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(lenRecord() - 4);
                this._io.addChildStream(_io__raw_payload);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenRecord() - 4));
                    final Record _this = this;
                    _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_payload = _io__raw_payload.toByteArray();
                            if (((byte[]) (_this._raw_payload)).length != lenRecord() - 4)
                                throw new ConsistencyError("raw(payload)", lenRecord() - 4, ((byte[]) (_this._raw_payload)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                        }
                    });
                }
                ((RecordV2) (this.payload))._write_Seq(_io__raw_payload);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.payload)))));
                break;
            }
            }
        }

        public void _check() {
            switch (version()) {
            case 1: {
                if (!Objects.equals(((SudoersTs.RecordV1) (this.payload))._root(), _root()))
                    throw new ConsistencyError("payload", _root(), ((SudoersTs.RecordV1) (this.payload))._root());
                if (!Objects.equals(((SudoersTs.RecordV1) (this.payload))._parent(), this))
                    throw new ConsistencyError("payload", this, ((SudoersTs.RecordV1) (this.payload))._parent());
                break;
            }
            case 2: {
                if (!Objects.equals(((SudoersTs.RecordV2) (this.payload))._root(), _root()))
                    throw new ConsistencyError("payload", _root(), ((SudoersTs.RecordV2) (this.payload))._root());
                if (!Objects.equals(((SudoersTs.RecordV2) (this.payload))._parent(), this))
                    throw new ConsistencyError("payload", this, ((SudoersTs.RecordV2) (this.payload))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.payload)).length != lenRecord() - 4)
                    throw new ConsistencyError("payload", lenRecord() - 4, ((byte[]) (this.payload)).length);
                break;
            }
            }
            _dirty = false;
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
        public void setVersion(int _v) { _dirty = true; version = _v; }

        /**
         * size of the record in bytes
         */
        public int lenRecord() { return lenRecord; }
        public void setLenRecord(int _v) { _dirty = true; lenRecord = _v; }
        public Object payload() { return payload; }
        public void setPayload(Object _v) { _dirty = true; payload = _v; }
        public SudoersTs _root() { return _root; }
        public void set_root(SudoersTs _v) { _dirty = true; _root = _v; }
        public SudoersTs _parent() { return _parent; }
        public void set_parent(SudoersTs _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_payload() { return _raw_payload; }
        public void set_raw_Payload(byte[] _v) { _dirty = true; _raw_payload = _v; }
    }
    public static class RecordV1 extends KaitaiStruct.ReadWrite {
        public static RecordV1 fromFile(String fileName) throws IOException {
            return new RecordV1(new ByteBufferKaitaiStream(fileName));
        }
        public RecordV1() {
            this(null, null, null);
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
        }
        public void _read() {
            this.type = SudoersTs.TsType.byId(this._io.readU2le());
            this.flags = new TsFlag(this._io, this, _root);
            this.flags._read();
            this.authUid = this._io.readU4le();
            this.sid = this._io.readU4le();
            this.ts = new Timespec(this._io, this, _root);
            this.ts._read();
            if (type() == SudoersTs.TsType.TTY) {
                this.ttydev = this._io.readU4le();
            }
            if (type() == SudoersTs.TsType.PPID) {
                this.ppid = this._io.readU4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            this.ts._fetchInstances();
            if (type() == SudoersTs.TsType.TTY) {
            }
            if (type() == SudoersTs.TsType.PPID) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.type.id())).intValue());
            this.flags._write_Seq(this._io);
            this._io.writeU4le(this.authUid);
            this._io.writeU4le(this.sid);
            this.ts._write_Seq(this._io);
            if (type() == SudoersTs.TsType.TTY) {
                this._io.writeU4le(this.ttydev);
            }
            if (type() == SudoersTs.TsType.PPID) {
                this._io.writeU4le(this.ppid);
            }
        }

        public void _check() {
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (!Objects.equals(this.ts._root(), _root()))
                throw new ConsistencyError("ts", _root(), this.ts._root());
            if (!Objects.equals(this.ts._parent(), this))
                throw new ConsistencyError("ts", this, this.ts._parent());
            if (type() == SudoersTs.TsType.TTY) {
            }
            if (type() == SudoersTs.TsType.PPID) {
            }
            _dirty = false;
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
        public void setType(TsType _v) { _dirty = true; type = _v; }

        /**
         * record flags
         */
        public TsFlag flags() { return flags; }
        public void setFlags(TsFlag _v) { _dirty = true; flags = _v; }

        /**
         * user ID that was used for authentication
         */
        public long authUid() { return authUid; }
        public void setAuthUid(long _v) { _dirty = true; authUid = _v; }

        /**
         * session ID associated with tty/ppid
         */
        public long sid() { return sid; }
        public void setSid(long _v) { _dirty = true; sid = _v; }

        /**
         * time stamp, from a monotonic time source
         */
        public Timespec ts() { return ts; }
        public void setTs(Timespec _v) { _dirty = true; ts = _v; }

        /**
         * device number of the terminal associated with the session
         */
        public Long ttydev() { return ttydev; }
        public void setTtydev(Long _v) { _dirty = true; ttydev = _v; }

        /**
         * ID of the parent process
         */
        public Long ppid() { return ppid; }
        public void setPpid(Long _v) { _dirty = true; ppid = _v; }
        public SudoersTs _root() { return _root; }
        public void set_root(SudoersTs _v) { _dirty = true; _root = _v; }
        public SudoersTs.Record _parent() { return _parent; }
        public void set_parent(SudoersTs.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordV2 extends KaitaiStruct.ReadWrite {
        public static RecordV2 fromFile(String fileName) throws IOException {
            return new RecordV2(new ByteBufferKaitaiStream(fileName));
        }
        public RecordV2() {
            this(null, null, null);
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
        }
        public void _read() {
            this.type = SudoersTs.TsType.byId(this._io.readU2le());
            this.flags = new TsFlag(this._io, this, _root);
            this.flags._read();
            this.authUid = this._io.readU4le();
            this.sid = this._io.readU4le();
            this.startTime = new Timespec(this._io, this, _root);
            this.startTime._read();
            this.ts = new Timespec(this._io, this, _root);
            this.ts._read();
            if (type() == SudoersTs.TsType.TTY) {
                this.ttydev = this._io.readU4le();
            }
            if (type() == SudoersTs.TsType.PPID) {
                this.ppid = this._io.readU4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            this.startTime._fetchInstances();
            this.ts._fetchInstances();
            if (type() == SudoersTs.TsType.TTY) {
            }
            if (type() == SudoersTs.TsType.PPID) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.type.id())).intValue());
            this.flags._write_Seq(this._io);
            this._io.writeU4le(this.authUid);
            this._io.writeU4le(this.sid);
            this.startTime._write_Seq(this._io);
            this.ts._write_Seq(this._io);
            if (type() == SudoersTs.TsType.TTY) {
                this._io.writeU4le(this.ttydev);
            }
            if (type() == SudoersTs.TsType.PPID) {
                this._io.writeU4le(this.ppid);
            }
        }

        public void _check() {
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (!Objects.equals(this.startTime._root(), _root()))
                throw new ConsistencyError("start_time", _root(), this.startTime._root());
            if (!Objects.equals(this.startTime._parent(), this))
                throw new ConsistencyError("start_time", this, this.startTime._parent());
            if (!Objects.equals(this.ts._root(), _root()))
                throw new ConsistencyError("ts", _root(), this.ts._root());
            if (!Objects.equals(this.ts._parent(), this))
                throw new ConsistencyError("ts", this, this.ts._parent());
            if (type() == SudoersTs.TsType.TTY) {
            }
            if (type() == SudoersTs.TsType.PPID) {
            }
            _dirty = false;
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
        public void setType(TsType _v) { _dirty = true; type = _v; }

        /**
         * record flags
         */
        public TsFlag flags() { return flags; }
        public void setFlags(TsFlag _v) { _dirty = true; flags = _v; }

        /**
         * user ID that was used for authentication
         */
        public long authUid() { return authUid; }
        public void setAuthUid(long _v) { _dirty = true; authUid = _v; }

        /**
         * ID of the user's terminal session, if present (when type is TS_TTY)
         */
        public long sid() { return sid; }
        public void setSid(long _v) { _dirty = true; sid = _v; }

        /**
         * start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
         */
        public Timespec startTime() { return startTime; }
        public void setStartTime(Timespec _v) { _dirty = true; startTime = _v; }

        /**
         * actual time stamp, from a monotonic time source
         */
        public Timespec ts() { return ts; }
        public void setTs(Timespec _v) { _dirty = true; ts = _v; }

        /**
         * device number of the terminal associated with the session
         */
        public Long ttydev() { return ttydev; }
        public void setTtydev(Long _v) { _dirty = true; ttydev = _v; }

        /**
         * ID of the parent process
         */
        public Long ppid() { return ppid; }
        public void setPpid(Long _v) { _dirty = true; ppid = _v; }
        public SudoersTs _root() { return _root; }
        public void set_root(SudoersTs _v) { _dirty = true; _root = _v; }
        public SudoersTs.Record _parent() { return _parent; }
        public void set_parent(SudoersTs.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class Timespec extends KaitaiStruct.ReadWrite {
        public static Timespec fromFile(String fileName) throws IOException {
            return new Timespec(new ByteBufferKaitaiStream(fileName));
        }
        public Timespec() {
            this(null, null, null);
        }

        public Timespec(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Timespec(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Timespec(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SudoersTs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sec = this._io.readS8le();
            this.nsec = this._io.readS8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS8le(this.sec);
            this._io.writeS8le(this.nsec);
        }

        public void _check() {
            _dirty = false;
        }
        private long sec;
        private long nsec;
        private SudoersTs _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * seconds
         */
        public long sec() { return sec; }
        public void setSec(long _v) { _dirty = true; sec = _v; }

        /**
         * nanoseconds
         */
        public long nsec() { return nsec; }
        public void setNsec(long _v) { _dirty = true; nsec = _v; }
        public SudoersTs _root() { return _root; }
        public void set_root(SudoersTs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class TsFlag extends KaitaiStruct.ReadWrite {
        public static TsFlag fromFile(String fileName) throws IOException {
            return new TsFlag(new ByteBufferKaitaiStream(fileName));
        }
        public TsFlag() {
            this(null, null, null);
        }

        public TsFlag(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TsFlag(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public TsFlag(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SudoersTs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved0 = this._io.readBitsIntBe(6);
            this.anyuid = this._io.readBitsIntBe(1) != 0;
            this.disabled = this._io.readBitsIntBe(1) != 0;
            this.reserved1 = this._io.readBitsIntBe(8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(6, this.reserved0);
            this._io.writeBitsIntBe(1, (this.anyuid ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.disabled ? 1 : 0));
            this._io.writeBitsIntBe(8, this.reserved1);
        }

        public void _check() {
            _dirty = false;
        }
        private long reserved0;
        private boolean anyuid;
        private boolean disabled;
        private long reserved1;
        private SudoersTs _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * Reserved (unused) bits
         */
        public long reserved0() { return reserved0; }
        public void setReserved0(long _v) { _dirty = true; reserved0 = _v; }

        /**
         * ignore uid
         */
        public boolean anyuid() { return anyuid; }
        public void setAnyuid(boolean _v) { _dirty = true; anyuid = _v; }

        /**
         * entry disabled
         */
        public boolean disabled() { return disabled; }
        public void setDisabled(boolean _v) { _dirty = true; disabled = _v; }

        /**
         * Reserved (unused) bits
         */
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
        public SudoersTs _root() { return _root; }
        public void set_root(SudoersTs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private List<Record> records;
    private SudoersTs _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public SudoersTs _root() { return _root; }
    public void set_root(SudoersTs _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
