// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class GlibcUtmp extends KaitaiStruct {
    public static GlibcUtmp fromFile(String fileName) throws IOException {
        return new GlibcUtmp(new KaitaiStream(fileName));
    }

    public enum EntryType {
        EMPTY(0),
        RUN_LVL(1),
        BOOT_TIME(2),
        NEW_TIME(3),
        OLD_TIME(4),
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

    public GlibcUtmp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GlibcUtmp(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GlibcUtmp(KaitaiStream _io, KaitaiStruct _parent, GlibcUtmp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this._raw_records = new ArrayList<byte[]>();
        this.records = new ArrayList<Record>();
        while (!this._io.isEof()) {
            this._raw_records.add(this._io.readBytes(384));
            KaitaiStream _io__raw_records = new KaitaiStream(_raw_records.get(_raw_records.size() - 1));
            this.records.add(new Record(_io__raw_records, this, _root));
        }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new KaitaiStream(fileName));
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, GlibcUtmp _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, GlibcUtmp _parent, GlibcUtmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.utType = GlibcUtmp.EntryType.byId(this._io.readS4le());
            this.pid = this._io.readU4le();
            this.line = new String(this._io.readBytes(32), Charset.forName("UTF-8"));
            this.id = new String(this._io.readBytes(4), Charset.forName("UTF-8"));
            this.user = new String(this._io.readBytes(32), Charset.forName("UTF-8"));
            this.host = new String(this._io.readBytes(256), Charset.forName("UTF-8"));
            this.exit = this._io.readU4le();
            this.session = this._io.readS4le();
            this.tv = new Timeval(this._io, this, _root);
            this.addrV6 = this._io.readBytes(16);
            this.reserved = this._io.readBytes(20);
        }
        private EntryType utType;
        private long pid;
        private String line;
        private String id;
        private String user;
        private String host;
        private long exit;
        private int session;
        private Timeval tv;
        private byte[] addrV6;
        private byte[] reserved;
        private GlibcUtmp _root;
        private GlibcUtmp _parent;

        /**
         * Type of login
         */
        public EntryType utType() { return utType; }

        /**
         * Process ID of login process
         */
        public long pid() { return pid; }

        /**
         * Devicename
         */
        public String line() { return line; }

        /**
         * Inittab ID
         */
        public String id() { return id; }

        /**
         * Username
         */
        public String user() { return user; }

        /**
         * Hostname for remote login
         */
        public String host() { return host; }

        /**
         * Exit status of a process marked as DEAD_PROCESS
         */
        public long exit() { return exit; }

        /**
         * Session ID, used for windowing
         */
        public int session() { return session; }

        /**
         * Time entry was made
         */
        public Timeval tv() { return tv; }

        /**
         * Internet address of remote host
         */
        public byte[] addrV6() { return addrV6; }
        public byte[] reserved() { return reserved; }
        public GlibcUtmp _root() { return _root; }
        public GlibcUtmp _parent() { return _parent; }
    }
    public static class Timeval extends KaitaiStruct {
        public static Timeval fromFile(String fileName) throws IOException {
            return new Timeval(new KaitaiStream(fileName));
        }

        public Timeval(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Timeval(KaitaiStream _io, GlibcUtmp.Record _parent) {
            this(_io, _parent, null);
        }

        public Timeval(KaitaiStream _io, GlibcUtmp.Record _parent, GlibcUtmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sec = this._io.readS4le();
            this.usec = this._io.readS4le();
        }
        private int sec;
        private int usec;
        private GlibcUtmp _root;
        private GlibcUtmp.Record _parent;

        /**
         * Seconds
         */
        public int sec() { return sec; }

        /**
         * Microseconds
         */
        public int usec() { return usec; }
        public GlibcUtmp _root() { return _root; }
        public GlibcUtmp.Record _parent() { return _parent; }
    }
    private ArrayList<Record> records;
    private GlibcUtmp _root;
    private KaitaiStruct _parent;
    private ArrayList<byte[]> _raw_records;
    public ArrayList<Record> records() { return records; }
    public GlibcUtmp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public ArrayList<byte[]> _raw_records() { return _raw_records; }
}
