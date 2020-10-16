// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;


/**
 * The entries are used to synchronize the state of services instances and the 
 * Publish/-Subscribe handling.
 * @see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf">- section 4.1.2.3  Entry Format</a>
 */
public class SomeIpSdEntries extends KaitaiStruct {
    public static SomeIpSdEntries fromFile(String fileName) throws IOException {
        return new SomeIpSdEntries(new ByteBufferKaitaiStream(fileName));
    }

    public SomeIpSdEntries(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIpSdEntries(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SomeIpSdEntries(KaitaiStream _io, KaitaiStruct _parent, SomeIpSdEntries _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.entries = new ArrayList<SdEntry>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.entries.add(new SdEntry(this._io, this, _root));
                i++;
            }
        }
    }
    public static class SdEntry extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.header = new SdEntryHeader(this._io, this, _root);
            {
                EntryTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case FIND: {
                        this.content = new SdServiceEntry(this._io, this, _root);
                        break;
                    }
                    case OFFER: {
                        this.content = new SdServiceEntry(this._io, this, _root);
                        break;
                    }
                    case SUBSCRIBE: {
                        this.content = new SdEventgroupEntry(this._io, this, _root);
                        break;
                    }
                    case SUBSCRIBE_ACK: {
                        this.content = new SdEventgroupEntry(this._io, this, _root);
                        break;
                    }
                    }
                }
            }
        }
        public static class SdEntryHeader extends KaitaiStruct {
            public static SdEntryHeader fromFile(String fileName) throws IOException {
                return new SdEntryHeader(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.type = SomeIpSdEntries.SdEntry.EntryTypes.byId(this._io.readU1());
                this.indexFirstOptions = this._io.readU1();
                this.indexSecondOptions = this._io.readU1();
                this.numberFirstOptions = this._io.readBitsIntBe(4);
                this.numberSecondOptions = this._io.readBitsIntBe(4);
                this._io.alignToByte();
                this.serviceId = this._io.readU2be();
                this.instanceId = this._io.readU2be();
                this.majorVersion = this._io.readU1();
                this.ttl = this._io.readBitsIntBe(24);
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
            public int indexFirstOptions() { return indexFirstOptions; }
            public int indexSecondOptions() { return indexSecondOptions; }
            public long numberFirstOptions() { return numberFirstOptions; }
            public long numberSecondOptions() { return numberSecondOptions; }
            public int serviceId() { return serviceId; }
            public int instanceId() { return instanceId; }
            public int majorVersion() { return majorVersion; }
            public long ttl() { return ttl; }
            public SomeIpSdEntries _root() { return _root; }
            public SomeIpSdEntries.SdEntry _parent() { return _parent; }
        }
        public static class SdServiceEntry extends KaitaiStruct {
            public static SdServiceEntry fromFile(String fileName) throws IOException {
                return new SdServiceEntry(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.minorVersion = this._io.readU4be();
            }
            private long minorVersion;
            private SomeIpSdEntries _root;
            private SomeIpSdEntries.SdEntry _parent;
            public long minorVersion() { return minorVersion; }
            public SomeIpSdEntries _root() { return _root; }
            public SomeIpSdEntries.SdEntry _parent() { return _parent; }
        }
        public static class SdEventgroupEntry extends KaitaiStruct {
            public static SdEventgroupEntry fromFile(String fileName) throws IOException {
                return new SdEventgroupEntry(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this.initialDataRequested = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(3);
                this.counter = this._io.readBitsIntBe(4);
                this._io.alignToByte();
                this.eventGroupId = this._io.readU2be();
            }
            private int reserved;
            private boolean initialDataRequested;
            private long reserved2;
            private long counter;
            private int eventGroupId;
            private SomeIpSdEntries _root;
            private SomeIpSdEntries.SdEntry _parent;
            public int reserved() { return reserved; }
            public boolean initialDataRequested() { return initialDataRequested; }
            public long reserved2() { return reserved2; }
            public long counter() { return counter; }
            public int eventGroupId() { return eventGroupId; }
            public SomeIpSdEntries _root() { return _root; }
            public SomeIpSdEntries.SdEntry _parent() { return _parent; }
        }
        private SdEntryHeader header;
        private KaitaiStruct content;
        private SomeIpSdEntries _root;
        private SomeIpSdEntries _parent;
        public SdEntryHeader header() { return header; }
        public KaitaiStruct content() { return content; }
        public SomeIpSdEntries _root() { return _root; }
        public SomeIpSdEntries _parent() { return _parent; }
    }
    private ArrayList<SdEntry> entries;
    private SomeIpSdEntries _root;
    private KaitaiStruct _parent;
    public ArrayList<SdEntry> entries() { return entries; }
    public SomeIpSdEntries _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
