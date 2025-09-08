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


/**
 * This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
 * @see <a href="https://www.ibm.com/docs/en/aix/7.1?topic=files-utmph-file">Source</a>
 */
public class AixUtmp extends KaitaiStruct.ReadWrite {
    public static AixUtmp fromFile(String fileName) throws IOException {
        return new AixUtmp(new ByteBufferKaitaiStream(fileName));
    }

    public enum EntryType {
        EMPTY(0),
        RUN_LVL(1),
        BOOT_TIME(2),
        OLD_TIME(3),
        NEW_TIME(4),
        INIT_PROCESS(5),
        LOGIN_PROCESS(6),
        USER_PROCESS(7),
        DEAD_PROCESS(8),
        ACCOUNTING(9);

        private final long id;
        EntryType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, EntryType> byId = new HashMap<Long, EntryType>(10);
        static {
            for (EntryType e : EntryType.values())
                byId.put(e.id(), e);
        }
        public static EntryType byId(long id) { return byId.get(id); }
    }
    public AixUtmp() {
        this(null, null, null);
    }

    public AixUtmp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AixUtmp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AixUtmp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AixUtmp _root) {
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
    public static class ExitStatus extends KaitaiStruct.ReadWrite {
        public static ExitStatus fromFile(String fileName) throws IOException {
            return new ExitStatus(new ByteBufferKaitaiStream(fileName));
        }
        public ExitStatus() {
            this(null, null, null);
        }

        public ExitStatus(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExitStatus(KaitaiStream _io, AixUtmp.Record _parent) {
            this(_io, _parent, null);
        }

        public ExitStatus(KaitaiStream _io, AixUtmp.Record _parent, AixUtmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.terminationCode = this._io.readS2be();
            this.exitCode = this._io.readS2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2be(this.terminationCode);
            this._io.writeS2be(this.exitCode);
        }

        public void _check() {
            _dirty = false;
        }
        private short terminationCode;
        private short exitCode;
        private AixUtmp _root;
        private AixUtmp.Record _parent;

        /**
         * process termination status
         */
        public short terminationCode() { return terminationCode; }
        public void setTerminationCode(short _v) { _dirty = true; terminationCode = _v; }

        /**
         * process exit status
         */
        public short exitCode() { return exitCode; }
        public void setExitCode(short _v) { _dirty = true; exitCode = _v; }
        public AixUtmp _root() { return _root; }
        public void set_root(AixUtmp _v) { _dirty = true; _root = _v; }
        public AixUtmp.Record _parent() { return _parent; }
        public void set_parent(AixUtmp.Record _v) { _dirty = true; _parent = _v; }
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

        public Record(KaitaiStream _io, AixUtmp _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, AixUtmp _parent, AixUtmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.user = new String(this._io.readBytes(256), StandardCharsets.US_ASCII);
            this.inittabId = new String(this._io.readBytes(14), StandardCharsets.US_ASCII);
            this.device = new String(this._io.readBytes(64), StandardCharsets.US_ASCII);
            this.pid = this._io.readU8be();
            this.type = AixUtmp.EntryType.byId(this._io.readS2be());
            this.timestamp = this._io.readS8be();
            this.exitStatus = new ExitStatus(this._io, this, _root);
            this.exitStatus._read();
            this.hostname = new String(this._io.readBytes(256), StandardCharsets.US_ASCII);
            this.dblWordPad = this._io.readS4be();
            this.reservedA = this._io.readBytes(8);
            this.reservedV = this._io.readBytes(24);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.exitStatus._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.user).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.inittabId).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.device).getBytes(Charset.forName("ASCII")));
            this._io.writeU8be(this.pid);
            this._io.writeS2be(((Number) (this.type.id())).shortValue());
            this._io.writeS8be(this.timestamp);
            this.exitStatus._write_Seq(this._io);
            this._io.writeBytes((this.hostname).getBytes(Charset.forName("ASCII")));
            this._io.writeS4be(this.dblWordPad);
            this._io.writeBytes(this.reservedA);
            this._io.writeBytes(this.reservedV);
        }

        public void _check() {
            if ((this.user).getBytes(Charset.forName("ASCII")).length != 256)
                throw new ConsistencyError("user", 256, (this.user).getBytes(Charset.forName("ASCII")).length);
            if ((this.inittabId).getBytes(Charset.forName("ASCII")).length != 14)
                throw new ConsistencyError("inittab_id", 14, (this.inittabId).getBytes(Charset.forName("ASCII")).length);
            if ((this.device).getBytes(Charset.forName("ASCII")).length != 64)
                throw new ConsistencyError("device", 64, (this.device).getBytes(Charset.forName("ASCII")).length);
            if (!Objects.equals(this.exitStatus._root(), _root()))
                throw new ConsistencyError("exit_status", _root(), this.exitStatus._root());
            if (!Objects.equals(this.exitStatus._parent(), this))
                throw new ConsistencyError("exit_status", this, this.exitStatus._parent());
            if ((this.hostname).getBytes(Charset.forName("ASCII")).length != 256)
                throw new ConsistencyError("hostname", 256, (this.hostname).getBytes(Charset.forName("ASCII")).length);
            if (this.reservedA.length != 8)
                throw new ConsistencyError("reserved_a", 8, this.reservedA.length);
            if (this.reservedV.length != 24)
                throw new ConsistencyError("reserved_v", 24, this.reservedV.length);
            _dirty = false;
        }
        private String user;
        private String inittabId;
        private String device;
        private long pid;
        private EntryType type;
        private long timestamp;
        private ExitStatus exitStatus;
        private String hostname;
        private int dblWordPad;
        private byte[] reservedA;
        private byte[] reservedV;
        private AixUtmp _root;
        private AixUtmp _parent;

        /**
         * User login name
         */
        public String user() { return user; }
        public void setUser(String _v) { _dirty = true; user = _v; }

        /**
         * /etc/inittab id
         */
        public String inittabId() { return inittabId; }
        public void setInittabId(String _v) { _dirty = true; inittabId = _v; }

        /**
         * device name (console, lnxx)
         */
        public String device() { return device; }
        public void setDevice(String _v) { _dirty = true; device = _v; }

        /**
         * process id
         */
        public long pid() { return pid; }
        public void setPid(long _v) { _dirty = true; pid = _v; }

        /**
         * Type of login
         */
        public EntryType type() { return type; }
        public void setType(EntryType _v) { _dirty = true; type = _v; }

        /**
         * time entry was made
         */
        public long timestamp() { return timestamp; }
        public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }

        /**
         * the exit status of a process marked as DEAD PROCESS
         */
        public ExitStatus exitStatus() { return exitStatus; }
        public void setExitStatus(ExitStatus _v) { _dirty = true; exitStatus = _v; }

        /**
         * host name
         */
        public String hostname() { return hostname; }
        public void setHostname(String _v) { _dirty = true; hostname = _v; }
        public int dblWordPad() { return dblWordPad; }
        public void setDblWordPad(int _v) { _dirty = true; dblWordPad = _v; }
        public byte[] reservedA() { return reservedA; }
        public void setReservedA(byte[] _v) { _dirty = true; reservedA = _v; }
        public byte[] reservedV() { return reservedV; }
        public void setReservedV(byte[] _v) { _dirty = true; reservedV = _v; }
        public AixUtmp _root() { return _root; }
        public void set_root(AixUtmp _v) { _dirty = true; _root = _v; }
        public AixUtmp _parent() { return _parent; }
        public void set_parent(AixUtmp _v) { _dirty = true; _parent = _v; }
    }
    private List<Record> records;
    private AixUtmp _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public AixUtmp _root() { return _root; }
    public void set_root(AixUtmp _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
