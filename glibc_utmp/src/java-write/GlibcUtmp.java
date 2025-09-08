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

public class GlibcUtmp extends KaitaiStruct.ReadWrite {
    public static GlibcUtmp fromFile(String fileName) throws IOException {
        return new GlibcUtmp(new ByteBufferKaitaiStream(fileName));
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
    public GlibcUtmp() {
        this(null, null, null);
    }

    public GlibcUtmp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GlibcUtmp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public GlibcUtmp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GlibcUtmp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_records = new ArrayList<byte[]>();
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this._raw_records.add(this._io.readBytes(384));
                KaitaiStream _io__raw_records = new ByteBufferKaitaiStream(this._raw_records.get(this._raw_records.size() - 1));
                Record _t_records = new Record(_io__raw_records, this, _root);
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
        this._raw_records = new ArrayList<byte[]>();
        for (int i = 0; i < this.records.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
            final KaitaiStream _io__raw_records = new ByteBufferKaitaiStream(384);
            this._io.addChildStream(_io__raw_records);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (384));
                final GlibcUtmp _this = this;
                final int _i = i;
                _io__raw_records.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_records.add(_io__raw_records.toByteArray());
                        if (_this._raw_records.get(((Number) (_i)).intValue()).length != 384)
                            throw new ConsistencyError("raw(records)", 384, _this._raw_records.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_records.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.records.get(((Number) (i)).intValue())._write_Seq(_io__raw_records);
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

        public Record(KaitaiStream _io, GlibcUtmp _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, GlibcUtmp _parent, GlibcUtmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.utType = GlibcUtmp.EntryType.byId(this._io.readS4le());
            this.pid = this._io.readS4le();
            this.line = new String(this._io.readBytes(32), StandardCharsets.UTF_8);
            this.id = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.user = new String(this._io.readBytes(32), StandardCharsets.UTF_8);
            this.host = new String(this._io.readBytes(256), StandardCharsets.UTF_8);
            this.exit = this._io.readU4le();
            this.session = this._io.readS4le();
            this.tv = new Timeval(this._io, this, _root);
            this.tv._read();
            this.addrV6 = this._io.readBytes(16);
            this.reserved = this._io.readBytes(20);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.tv._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(((Number) (this.utType.id())).intValue());
            this._io.writeS4le(this.pid);
            this._io.writeBytes((this.line).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.id).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.user).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes((this.host).getBytes(Charset.forName("UTF-8")));
            this._io.writeU4le(this.exit);
            this._io.writeS4le(this.session);
            this.tv._write_Seq(this._io);
            this._io.writeBytes(this.addrV6);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if ((this.line).getBytes(Charset.forName("UTF-8")).length != 32)
                throw new ConsistencyError("line", 32, (this.line).getBytes(Charset.forName("UTF-8")).length);
            if ((this.id).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("id", 4, (this.id).getBytes(Charset.forName("UTF-8")).length);
            if ((this.user).getBytes(Charset.forName("UTF-8")).length != 32)
                throw new ConsistencyError("user", 32, (this.user).getBytes(Charset.forName("UTF-8")).length);
            if ((this.host).getBytes(Charset.forName("UTF-8")).length != 256)
                throw new ConsistencyError("host", 256, (this.host).getBytes(Charset.forName("UTF-8")).length);
            if (!Objects.equals(this.tv._root(), _root()))
                throw new ConsistencyError("tv", _root(), this.tv._root());
            if (!Objects.equals(this.tv._parent(), this))
                throw new ConsistencyError("tv", this, this.tv._parent());
            if (this.addrV6.length != 16)
                throw new ConsistencyError("addr_v6", 16, this.addrV6.length);
            if (this.reserved.length != 20)
                throw new ConsistencyError("reserved", 20, this.reserved.length);
            _dirty = false;
        }
        private EntryType utType;
        private int pid;
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
        public void setUtType(EntryType _v) { _dirty = true; utType = _v; }

        /**
         * Process ID of login process
         */
        public int pid() { return pid; }
        public void setPid(int _v) { _dirty = true; pid = _v; }

        /**
         * Devicename
         */
        public String line() { return line; }
        public void setLine(String _v) { _dirty = true; line = _v; }

        /**
         * Inittab ID
         */
        public String id() { return id; }
        public void setId(String _v) { _dirty = true; id = _v; }

        /**
         * Username
         */
        public String user() { return user; }
        public void setUser(String _v) { _dirty = true; user = _v; }

        /**
         * Hostname for remote login
         */
        public String host() { return host; }
        public void setHost(String _v) { _dirty = true; host = _v; }

        /**
         * Exit status of a process marked as DEAD_PROCESS
         */
        public long exit() { return exit; }
        public void setExit(long _v) { _dirty = true; exit = _v; }

        /**
         * Session ID, used for windowing
         */
        public int session() { return session; }
        public void setSession(int _v) { _dirty = true; session = _v; }

        /**
         * Time entry was made
         */
        public Timeval tv() { return tv; }
        public void setTv(Timeval _v) { _dirty = true; tv = _v; }

        /**
         * Internet address of remote host
         */
        public byte[] addrV6() { return addrV6; }
        public void setAddrV6(byte[] _v) { _dirty = true; addrV6 = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public GlibcUtmp _root() { return _root; }
        public void set_root(GlibcUtmp _v) { _dirty = true; _root = _v; }
        public GlibcUtmp _parent() { return _parent; }
        public void set_parent(GlibcUtmp _v) { _dirty = true; _parent = _v; }
    }
    public static class Timeval extends KaitaiStruct.ReadWrite {
        public static Timeval fromFile(String fileName) throws IOException {
            return new Timeval(new ByteBufferKaitaiStream(fileName));
        }
        public Timeval() {
            this(null, null, null);
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
        }
        public void _read() {
            this.sec = this._io.readU4le();
            this.usec = this._io.readS4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.sec);
            this._io.writeS4le(this.usec);
        }

        public void _check() {
            _dirty = false;
        }
        private long sec;
        private int usec;
        private GlibcUtmp _root;
        private GlibcUtmp.Record _parent;

        /**
         * Seconds
         */
        public long sec() { return sec; }
        public void setSec(long _v) { _dirty = true; sec = _v; }

        /**
         * Microseconds
         */
        public int usec() { return usec; }
        public void setUsec(int _v) { _dirty = true; usec = _v; }
        public GlibcUtmp _root() { return _root; }
        public void set_root(GlibcUtmp _v) { _dirty = true; _root = _v; }
        public GlibcUtmp.Record _parent() { return _parent; }
        public void set_parent(GlibcUtmp.Record _v) { _dirty = true; _parent = _v; }
    }
    private List<Record> records;
    private GlibcUtmp _root;
    private KaitaiStruct.ReadWrite _parent;
    private List<byte[]> _raw_records;
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public GlibcUtmp _root() { return _root; }
    public void set_root(GlibcUtmp _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public List<byte[]> _raw_records() { return _raw_records; }
    public void set_raw_Records(List<byte[]> _v) { _dirty = true; _raw_records = _v; }
}
