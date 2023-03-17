// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
 * @see <a href="https://www.ibm.com/docs/en/aix/7.1?topic=files-utmph-file">Source</a>
 */
public class AixUtmp extends KaitaiStruct {
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

    public AixUtmp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AixUtmp(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AixUtmp(KaitaiStream _io, KaitaiStruct _parent, AixUtmp _root) {
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
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.user = new String(this._io.readBytes(256), Charset.forName("ascii"));
            this.inittabId = new String(this._io.readBytes(14), Charset.forName("ascii"));
            this.device = new String(this._io.readBytes(64), Charset.forName("ascii"));
            this.pid = this._io.readU8be();
            this.type = AixUtmp.EntryType.byId(this._io.readS2be());
            this.timestamp = this._io.readS8be();
            this.exitStatus = new ExitStatus(this._io, this, _root);
            this.hostname = new String(this._io.readBytes(256), Charset.forName("ascii"));
            this.dblWordPad = this._io.readS4be();
            this.reservedA = this._io.readBytes(8);
            this.reservedV = this._io.readBytes(24);
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

        /**
         * /etc/inittab id
         */
        public String inittabId() { return inittabId; }

        /**
         * device name (console, lnxx)
         */
        public String device() { return device; }

        /**
         * process id
         */
        public long pid() { return pid; }

        /**
         * Type of login
         */
        public EntryType type() { return type; }

        /**
         * time entry was made
         */
        public long timestamp() { return timestamp; }

        /**
         * the exit status of a process marked as DEAD PROCESS
         */
        public ExitStatus exitStatus() { return exitStatus; }

        /**
         * host name
         */
        public String hostname() { return hostname; }
        public int dblWordPad() { return dblWordPad; }
        public byte[] reservedA() { return reservedA; }
        public byte[] reservedV() { return reservedV; }
        public AixUtmp _root() { return _root; }
        public AixUtmp _parent() { return _parent; }
    }
    public static class ExitStatus extends KaitaiStruct {
        public static ExitStatus fromFile(String fileName) throws IOException {
            return new ExitStatus(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.terminationCode = this._io.readS2be();
            this.exitCode = this._io.readS2be();
        }
        private short terminationCode;
        private short exitCode;
        private AixUtmp _root;
        private AixUtmp.Record _parent;

        /**
         * process termination status
         */
        public short terminationCode() { return terminationCode; }

        /**
         * process exit status
         */
        public short exitCode() { return exitCode; }
        public AixUtmp _root() { return _root; }
        public AixUtmp.Record _parent() { return _parent; }
    }
    private ArrayList<Record> records;
    private AixUtmp _root;
    private KaitaiStruct _parent;
    public ArrayList<Record> records() { return records; }
    public AixUtmp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
