// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;
import java.util.List;


/**
 * The entries are used to synchronize the state of services instances and the
 * Publish/-Subscribe handling.
 * @see <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * -">section 4.1.2.3  Entry Format</a>
 */
public class SomeIpSdEntries extends KaitaiStruct.ReadWrite {
    public static SomeIpSdEntries fromFile(String fileName) throws IOException {
        return new SomeIpSdEntries(new ByteBufferKaitaiStream(fileName));
    }
    public SomeIpSdEntries() {
        this(null, null, null);
    }

    public SomeIpSdEntries(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIpSdEntries(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SomeIpSdEntries(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SomeIpSdEntries _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.entries = new ArrayList<SdEntry>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                SdEntry _t_entries = new SdEntry(this._io, this, _root);
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
    public static class SdEntry extends KaitaiStruct.ReadWrite {
        public static SdEntry fromFile(String fileName) throws IOException {
            return new SdEntry(new ByteBufferKaitaiStream(fileName));
        }

        public enum EntryTypes {
            FIND(0),
            OFFER(1),
            SUBSCRIBE(6),
            SUBSCRIBE_ACK(7);

            private final long id;
            EntryTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, EntryTypes> byId = new HashMap<Long, EntryTypes>(4);
            static {
                for (EntryTypes e : EntryTypes.values())
                    byId.put(e.id(), e);
            }
            public static EntryTypes byId(long id) { return byId.get(id); }
        }
        public SdEntry() {
            this(null, null, null);
        }

        public SdEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SdEntry(KaitaiStream _io, SomeIpSdEntries _parent) {
            this(_io, _parent, null);
        }

        public SdEntry(KaitaiStream _io, SomeIpSdEntries _parent, SomeIpSdEntries _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new SdEntryHeader(this._io, this, _root);
            this.header._read();
            {
                EntryTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case FIND: {
                        this.content = new SdServiceEntry(this._io, this, _root);
                        ((SdServiceEntry) (this.content))._read();
                        break;
                    }
                    case OFFER: {
                        this.content = new SdServiceEntry(this._io, this, _root);
                        ((SdServiceEntry) (this.content))._read();
                        break;
                    }
                    case SUBSCRIBE: {
                        this.content = new SdEventgroupEntry(this._io, this, _root);
                        ((SdEventgroupEntry) (this.content))._read();
                        break;
                    }
                    case SUBSCRIBE_ACK: {
                        this.content = new SdEventgroupEntry(this._io, this, _root);
                        ((SdEventgroupEntry) (this.content))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            {
                EntryTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case FIND: {
                        ((SdServiceEntry) (this.content))._fetchInstances();
                        break;
                    }
                    case OFFER: {
                        ((SdServiceEntry) (this.content))._fetchInstances();
                        break;
                    }
                    case SUBSCRIBE: {
                        ((SdEventgroupEntry) (this.content))._fetchInstances();
                        break;
                    }
                    case SUBSCRIBE_ACK: {
                        ((SdEventgroupEntry) (this.content))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            {
                EntryTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case FIND: {
                        ((SdServiceEntry) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case OFFER: {
                        ((SdServiceEntry) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case SUBSCRIBE: {
                        ((SdEventgroupEntry) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case SUBSCRIBE_ACK: {
                        ((SdEventgroupEntry) (this.content))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            {
                EntryTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case FIND: {
                        if (!Objects.equals(((SomeIpSdEntries.SdEntry.SdServiceEntry) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdEntries.SdEntry.SdServiceEntry) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdEntries.SdEntry.SdServiceEntry) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdEntries.SdEntry.SdServiceEntry) (this.content))._parent());
                        break;
                    }
                    case OFFER: {
                        if (!Objects.equals(((SomeIpSdEntries.SdEntry.SdServiceEntry) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdEntries.SdEntry.SdServiceEntry) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdEntries.SdEntry.SdServiceEntry) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdEntries.SdEntry.SdServiceEntry) (this.content))._parent());
                        break;
                    }
                    case SUBSCRIBE: {
                        if (!Objects.equals(((SomeIpSdEntries.SdEntry.SdEventgroupEntry) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdEntries.SdEntry.SdEventgroupEntry) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdEntries.SdEntry.SdEventgroupEntry) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdEntries.SdEntry.SdEventgroupEntry) (this.content))._parent());
                        break;
                    }
                    case SUBSCRIBE_ACK: {
                        if (!Objects.equals(((SomeIpSdEntries.SdEntry.SdEventgroupEntry) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdEntries.SdEntry.SdEventgroupEntry) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdEntries.SdEntry.SdEventgroupEntry) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdEntries.SdEntry.SdEventgroupEntry) (this.content))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        public static class SdEntryHeader extends KaitaiStruct.ReadWrite {
            public static SdEntryHeader fromFile(String fileName) throws IOException {
                return new SdEntryHeader(new ByteBufferKaitaiStream(fileName));
            }
            public SdEntryHeader() {
                this(null, null, null);
            }

            public SdEntryHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdEntryHeader(KaitaiStream _io, SomeIpSdEntries.SdEntry _parent) {
                this(_io, _parent, null);
            }

            public SdEntryHeader(KaitaiStream _io, SomeIpSdEntries.SdEntry _parent, SomeIpSdEntries _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.type = SomeIpSdEntries.SdEntry.EntryTypes.byId(this._io.readU1());
                this.indexFirstOptions = this._io.readU1();
                this.indexSecondOptions = this._io.readU1();
                this.numberFirstOptions = this._io.readBitsIntBe(4);
                this.numberSecondOptions = this._io.readBitsIntBe(4);
                this.serviceId = this._io.readU2be();
                this.instanceId = this._io.readU2be();
                this.majorVersion = this._io.readU1();
                this.ttl = this._io.readBitsIntBe(24);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(((Number) (this.type.id())).intValue());
                this._io.writeU1(this.indexFirstOptions);
                this._io.writeU1(this.indexSecondOptions);
                this._io.writeBitsIntBe(4, this.numberFirstOptions);
                this._io.writeBitsIntBe(4, this.numberSecondOptions);
                this._io.writeU2be(this.serviceId);
                this._io.writeU2be(this.instanceId);
                this._io.writeU1(this.majorVersion);
                this._io.writeBitsIntBe(24, this.ttl);
            }

            public void _check() {
                _dirty = false;
            }
            private EntryTypes type;
            private int indexFirstOptions;
            private int indexSecondOptions;
            private long numberFirstOptions;
            private long numberSecondOptions;
            private int serviceId;
            private int instanceId;
            private int majorVersion;
            private long ttl;
            private SomeIpSdEntries _root;
            private SomeIpSdEntries.SdEntry _parent;
            public EntryTypes type() { return type; }
            public void setType(EntryTypes _v) { _dirty = true; type = _v; }
            public int indexFirstOptions() { return indexFirstOptions; }
            public void setIndexFirstOptions(int _v) { _dirty = true; indexFirstOptions = _v; }
            public int indexSecondOptions() { return indexSecondOptions; }
            public void setIndexSecondOptions(int _v) { _dirty = true; indexSecondOptions = _v; }
            public long numberFirstOptions() { return numberFirstOptions; }
            public void setNumberFirstOptions(long _v) { _dirty = true; numberFirstOptions = _v; }
            public long numberSecondOptions() { return numberSecondOptions; }
            public void setNumberSecondOptions(long _v) { _dirty = true; numberSecondOptions = _v; }
            public int serviceId() { return serviceId; }
            public void setServiceId(int _v) { _dirty = true; serviceId = _v; }
            public int instanceId() { return instanceId; }
            public void setInstanceId(int _v) { _dirty = true; instanceId = _v; }
            public int majorVersion() { return majorVersion; }
            public void setMajorVersion(int _v) { _dirty = true; majorVersion = _v; }
            public long ttl() { return ttl; }
            public void setTtl(long _v) { _dirty = true; ttl = _v; }
            public SomeIpSdEntries _root() { return _root; }
            public void set_root(SomeIpSdEntries _v) { _dirty = true; _root = _v; }
            public SomeIpSdEntries.SdEntry _parent() { return _parent; }
            public void set_parent(SomeIpSdEntries.SdEntry _v) { _dirty = true; _parent = _v; }
        }
        public static class SdEventgroupEntry extends KaitaiStruct.ReadWrite {
            public static SdEventgroupEntry fromFile(String fileName) throws IOException {
                return new SdEventgroupEntry(new ByteBufferKaitaiStream(fileName));
            }
            public SdEventgroupEntry() {
                this(null, null, null);
            }

            public SdEventgroupEntry(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdEventgroupEntry(KaitaiStream _io, SomeIpSdEntries.SdEntry _parent) {
                this(_io, _parent, null);
            }

            public SdEventgroupEntry(KaitaiStream _io, SomeIpSdEntries.SdEntry _parent, SomeIpSdEntries _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this.initialDataRequested = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(3);
                this.counter = this._io.readBitsIntBe(4);
                this.eventGroupId = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                this._io.writeBitsIntBe(1, (this.initialDataRequested ? 1 : 0));
                this._io.writeBitsIntBe(3, this.reserved2);
                this._io.writeBitsIntBe(4, this.counter);
                this._io.writeU2be(this.eventGroupId);
            }

            public void _check() {
                _dirty = false;
            }
            private int reserved;
            private boolean initialDataRequested;
            private long reserved2;
            private long counter;
            private int eventGroupId;
            private SomeIpSdEntries _root;
            private SomeIpSdEntries.SdEntry _parent;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public boolean initialDataRequested() { return initialDataRequested; }
            public void setInitialDataRequested(boolean _v) { _dirty = true; initialDataRequested = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
            public long counter() { return counter; }
            public void setCounter(long _v) { _dirty = true; counter = _v; }
            public int eventGroupId() { return eventGroupId; }
            public void setEventGroupId(int _v) { _dirty = true; eventGroupId = _v; }
            public SomeIpSdEntries _root() { return _root; }
            public void set_root(SomeIpSdEntries _v) { _dirty = true; _root = _v; }
            public SomeIpSdEntries.SdEntry _parent() { return _parent; }
            public void set_parent(SomeIpSdEntries.SdEntry _v) { _dirty = true; _parent = _v; }
        }
        public static class SdServiceEntry extends KaitaiStruct.ReadWrite {
            public static SdServiceEntry fromFile(String fileName) throws IOException {
                return new SdServiceEntry(new ByteBufferKaitaiStream(fileName));
            }
            public SdServiceEntry() {
                this(null, null, null);
            }

            public SdServiceEntry(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdServiceEntry(KaitaiStream _io, SomeIpSdEntries.SdEntry _parent) {
                this(_io, _parent, null);
            }

            public SdServiceEntry(KaitaiStream _io, SomeIpSdEntries.SdEntry _parent, SomeIpSdEntries _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.minorVersion = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(this.minorVersion);
            }

            public void _check() {
                _dirty = false;
            }
            private long minorVersion;
            private SomeIpSdEntries _root;
            private SomeIpSdEntries.SdEntry _parent;
            public long minorVersion() { return minorVersion; }
            public void setMinorVersion(long _v) { _dirty = true; minorVersion = _v; }
            public SomeIpSdEntries _root() { return _root; }
            public void set_root(SomeIpSdEntries _v) { _dirty = true; _root = _v; }
            public SomeIpSdEntries.SdEntry _parent() { return _parent; }
            public void set_parent(SomeIpSdEntries.SdEntry _v) { _dirty = true; _parent = _v; }
        }
        private SdEntryHeader header;
        private KaitaiStruct.ReadWrite content;
        private SomeIpSdEntries _root;
        private SomeIpSdEntries _parent;
        public SdEntryHeader header() { return header; }
        public void setHeader(SdEntryHeader _v) { _dirty = true; header = _v; }
        public KaitaiStruct.ReadWrite content() { return content; }
        public void setContent(KaitaiStruct.ReadWrite _v) { _dirty = true; content = _v; }
        public SomeIpSdEntries _root() { return _root; }
        public void set_root(SomeIpSdEntries _v) { _dirty = true; _root = _v; }
        public SomeIpSdEntries _parent() { return _parent; }
        public void set_parent(SomeIpSdEntries _v) { _dirty = true; _parent = _v; }
    }
    private List<SdEntry> entries;
    private SomeIpSdEntries _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<SdEntry> entries() { return entries; }
    public void setEntries(List<SdEntry> _v) { _dirty = true; entries = _v; }
    public SomeIpSdEntries _root() { return _root; }
    public void set_root(SomeIpSdEntries _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
