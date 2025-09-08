// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * systemd, a popular user-space system/service management suite on Linux,
 * offers logging functionality, storing incoming logs in a binary journal
 * format.
 * 
 * On live Linux system running systemd, these journals are typically located at:
 * 
 * * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
 * * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
 * @see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/">Source</a>
 */
public class SystemdJournal extends KaitaiStruct {
    public static SystemdJournal fromFile(String fileName) throws IOException {
        return new SystemdJournal(new ByteBufferKaitaiStream(fileName));
    }

    public enum State {
        OFFLINE(0),
        ONLINE(1),
        ARCHIVED(2);

        private final long id;
        State(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, State> byId = new HashMap<Long, State>(3);
        static {
            for (State e : State.values())
                byId.put(e.id(), e);
        }
        public static State byId(long id) { return byId.get(id); }
    }

    public SystemdJournal(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SystemdJournal(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SystemdJournal(KaitaiStream _io, KaitaiStruct _parent, SystemdJournal _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        KaitaiStream _io_header = this._io.substream(lenHeader());
        this.header = new Header(_io_header, this, _root);
        this.objects = new ArrayList<JournalObject>();
        for (int i = 0; i < header().numObjects(); i++) {
            this.objects.add(new JournalObject(this._io, this, _root));
        }
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.objects.size(); i++) {
            this.objects.get(((Number) (i)).intValue())._fetchInstances();
        }
        dataHashTable();
        if (this.dataHashTable != null) {
        }
        fieldHashTable();
        if (this.fieldHashTable != null) {
        }
        lenHeader();
        if (this.lenHeader != null) {
        }
    }

    /**
     * Data objects are designed to carry log payload, typically in
     * form of a "key=value" string in `payload` attribute.
     * @see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects">Source</a>
     */
    public static class DataObject extends KaitaiStruct {
        public static DataObject fromFile(String fileName) throws IOException {
            return new DataObject(new ByteBufferKaitaiStream(fileName));
        }

        public DataObject(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataObject(KaitaiStream _io, SystemdJournal.JournalObject _parent) {
            this(_io, _parent, null);
        }

        public DataObject(KaitaiStream _io, SystemdJournal.JournalObject _parent, SystemdJournal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.hash = this._io.readU8le();
            this.ofsNextHash = this._io.readU8le();
            this.ofsHeadField = this._io.readU8le();
            this.ofsEntry = this._io.readU8le();
            this.ofsEntryArray = this._io.readU8le();
            this.numEntries = this._io.readU8le();
            this.payload = this._io.readBytesFull();
        }

        public void _fetchInstances() {
            entry();
            if (this.entry != null) {
                this.entry._fetchInstances();
            }
            entryArray();
            if (this.entryArray != null) {
                this.entryArray._fetchInstances();
            }
            headField();
            if (this.headField != null) {
                this.headField._fetchInstances();
            }
            nextHash();
            if (this.nextHash != null) {
                this.nextHash._fetchInstances();
            }
        }
        private JournalObject entry;
        public JournalObject entry() {
            if (this.entry != null)
                return this.entry;
            if (ofsEntry() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsEntry());
                this.entry = new JournalObject(io, this, _root);
                io.seek(_pos);
            }
            return this.entry;
        }
        private JournalObject entryArray;
        public JournalObject entryArray() {
            if (this.entryArray != null)
                return this.entryArray;
            if (ofsEntryArray() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsEntryArray());
                this.entryArray = new JournalObject(io, this, _root);
                io.seek(_pos);
            }
            return this.entryArray;
        }
        private JournalObject headField;
        public JournalObject headField() {
            if (this.headField != null)
                return this.headField;
            if (ofsHeadField() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsHeadField());
                this.headField = new JournalObject(io, this, _root);
                io.seek(_pos);
            }
            return this.headField;
        }
        private JournalObject nextHash;
        public JournalObject nextHash() {
            if (this.nextHash != null)
                return this.nextHash;
            if (ofsNextHash() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsNextHash());
                this.nextHash = new JournalObject(io, this, _root);
                io.seek(_pos);
            }
            return this.nextHash;
        }
        private long hash;
        private long ofsNextHash;
        private long ofsHeadField;
        private long ofsEntry;
        private long ofsEntryArray;
        private long numEntries;
        private byte[] payload;
        private SystemdJournal _root;
        private SystemdJournal.JournalObject _parent;
        public long hash() { return hash; }
        public long ofsNextHash() { return ofsNextHash; }
        public long ofsHeadField() { return ofsHeadField; }
        public long ofsEntry() { return ofsEntry; }
        public long ofsEntryArray() { return ofsEntryArray; }
        public long numEntries() { return numEntries; }
        public byte[] payload() { return payload; }
        public SystemdJournal _root() { return _root; }
        public SystemdJournal.JournalObject _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, SystemdJournal _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, SystemdJournal _parent, SystemdJournal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.signature = this._io.readBytes(8);
            if (!(Arrays.equals(this.signature, new byte[] { 76, 80, 75, 83, 72, 72, 82, 72 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 80, 75, 83, 72, 72, 82, 72 }, this.signature, this._io, "/types/header/seq/0");
            }
            this.compatibleFlags = this._io.readU4le();
            this.incompatibleFlags = this._io.readU4le();
            this.state = SystemdJournal.State.byId(this._io.readU1());
            this.reserved = this._io.readBytes(7);
            this.fileId = this._io.readBytes(16);
            this.machineId = this._io.readBytes(16);
            this.bootId = this._io.readBytes(16);
            this.seqnumId = this._io.readBytes(16);
            this.lenHeader = this._io.readU8le();
            this.lenArena = this._io.readU8le();
            this.ofsDataHashTable = this._io.readU8le();
            this.lenDataHashTable = this._io.readU8le();
            this.ofsFieldHashTable = this._io.readU8le();
            this.lenFieldHashTable = this._io.readU8le();
            this.ofsTailObject = this._io.readU8le();
            this.numObjects = this._io.readU8le();
            this.numEntries = this._io.readU8le();
            this.tailEntrySeqnum = this._io.readU8le();
            this.headEntrySeqnum = this._io.readU8le();
            this.ofsEntryArray = this._io.readU8le();
            this.headEntryRealtime = this._io.readU8le();
            this.tailEntryRealtime = this._io.readU8le();
            this.tailEntryMonotonic = this._io.readU8le();
            if (!(_io().isEof())) {
                this.numData = this._io.readU8le();
            }
            if (!(_io().isEof())) {
                this.numFields = this._io.readU8le();
            }
            if (!(_io().isEof())) {
                this.numTags = this._io.readU8le();
            }
            if (!(_io().isEof())) {
                this.numEntryArrays = this._io.readU8le();
            }
        }

        public void _fetchInstances() {
            if (!(_io().isEof())) {
            }
            if (!(_io().isEof())) {
            }
            if (!(_io().isEof())) {
            }
            if (!(_io().isEof())) {
            }
        }
        private byte[] signature;
        private long compatibleFlags;
        private long incompatibleFlags;
        private State state;
        private byte[] reserved;
        private byte[] fileId;
        private byte[] machineId;
        private byte[] bootId;
        private byte[] seqnumId;
        private long lenHeader;
        private long lenArena;
        private long ofsDataHashTable;
        private long lenDataHashTable;
        private long ofsFieldHashTable;
        private long lenFieldHashTable;
        private long ofsTailObject;
        private long numObjects;
        private long numEntries;
        private long tailEntrySeqnum;
        private long headEntrySeqnum;
        private long ofsEntryArray;
        private long headEntryRealtime;
        private long tailEntryRealtime;
        private long tailEntryMonotonic;
        private Long numData;
        private Long numFields;
        private Long numTags;
        private Long numEntryArrays;
        private SystemdJournal _root;
        private SystemdJournal _parent;
        public byte[] signature() { return signature; }
        public long compatibleFlags() { return compatibleFlags; }
        public long incompatibleFlags() { return incompatibleFlags; }
        public State state() { return state; }
        public byte[] reserved() { return reserved; }
        public byte[] fileId() { return fileId; }
        public byte[] machineId() { return machineId; }
        public byte[] bootId() { return bootId; }
        public byte[] seqnumId() { return seqnumId; }
        public long lenHeader() { return lenHeader; }
        public long lenArena() { return lenArena; }
        public long ofsDataHashTable() { return ofsDataHashTable; }
        public long lenDataHashTable() { return lenDataHashTable; }
        public long ofsFieldHashTable() { return ofsFieldHashTable; }
        public long lenFieldHashTable() { return lenFieldHashTable; }
        public long ofsTailObject() { return ofsTailObject; }
        public long numObjects() { return numObjects; }
        public long numEntries() { return numEntries; }
        public long tailEntrySeqnum() { return tailEntrySeqnum; }
        public long headEntrySeqnum() { return headEntrySeqnum; }
        public long ofsEntryArray() { return ofsEntryArray; }
        public long headEntryRealtime() { return headEntryRealtime; }
        public long tailEntryRealtime() { return tailEntryRealtime; }
        public long tailEntryMonotonic() { return tailEntryMonotonic; }
        public Long numData() { return numData; }
        public Long numFields() { return numFields; }
        public Long numTags() { return numTags; }
        public Long numEntryArrays() { return numEntryArrays; }
        public SystemdJournal _root() { return _root; }
        public SystemdJournal _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects">Source</a>
     */
    public static class JournalObject extends KaitaiStruct {
        public static JournalObject fromFile(String fileName) throws IOException {
            return new JournalObject(new ByteBufferKaitaiStream(fileName));
        }

        public enum ObjectTypes {
            UNUSED(0),
            DATA(1),
            FIELD(2),
            ENTRY(3),
            DATA_HASH_TABLE(4),
            FIELD_HASH_TABLE(5),
            ENTRY_ARRAY(6),
            TAG(7);

            private final long id;
            ObjectTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ObjectTypes> byId = new HashMap<Long, ObjectTypes>(8);
            static {
                for (ObjectTypes e : ObjectTypes.values())
                    byId.put(e.id(), e);
            }
            public static ObjectTypes byId(long id) { return byId.get(id); }
        }

        public JournalObject(KaitaiStream _io) {
            this(_io, null, null);
        }

        public JournalObject(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public JournalObject(KaitaiStream _io, KaitaiStruct _parent, SystemdJournal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.padding = this._io.readBytes(KaitaiStream.mod(8 - _io().pos(), 8));
            this.objectType = ObjectTypes.byId(this._io.readU1());
            this.flags = this._io.readU1();
            this.reserved = this._io.readBytes(6);
            this.lenObject = this._io.readU8le();
            {
                ObjectTypes on = objectType();
                if (on != null) {
                    switch (objectType()) {
                    case DATA: {
                        KaitaiStream _io_payload = this._io.substream(lenObject() - 16);
                        this.payload = new DataObject(_io_payload, this, _root);
                        break;
                    }
                    default: {
                        this.payload = this._io.readBytes(lenObject() - 16);
                        break;
                    }
                    }
                } else {
                    this.payload = this._io.readBytes(lenObject() - 16);
                }
            }
        }

        public void _fetchInstances() {
            {
                ObjectTypes on = objectType();
                if (on != null) {
                    switch (objectType()) {
                    case DATA: {
                        ((DataObject) (this.payload))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }
        private byte[] padding;
        private ObjectTypes objectType;
        private int flags;
        private byte[] reserved;
        private long lenObject;
        private Object payload;
        private SystemdJournal _root;
        private KaitaiStruct _parent;
        public byte[] padding() { return padding; }
        public ObjectTypes objectType() { return objectType; }
        public int flags() { return flags; }
        public byte[] reserved() { return reserved; }
        public long lenObject() { return lenObject; }
        public Object payload() { return payload; }
        public SystemdJournal _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private byte[] dataHashTable;
    public byte[] dataHashTable() {
        if (this.dataHashTable != null)
            return this.dataHashTable;
        long _pos = this._io.pos();
        this._io.seek(header().ofsDataHashTable());
        this.dataHashTable = this._io.readBytes(header().lenDataHashTable());
        this._io.seek(_pos);
        return this.dataHashTable;
    }
    private byte[] fieldHashTable;
    public byte[] fieldHashTable() {
        if (this.fieldHashTable != null)
            return this.fieldHashTable;
        long _pos = this._io.pos();
        this._io.seek(header().ofsFieldHashTable());
        this.fieldHashTable = this._io.readBytes(header().lenFieldHashTable());
        this._io.seek(_pos);
        return this.fieldHashTable;
    }
    private Long lenHeader;

    /**
     * Header length is used to set substream size, as it thus required
     * prior to declaration of header.
     */
    public Long lenHeader() {
        if (this.lenHeader != null)
            return this.lenHeader;
        long _pos = this._io.pos();
        this._io.seek(88);
        this.lenHeader = this._io.readU8le();
        this._io.seek(_pos);
        return this.lenHeader;
    }
    private Header header;
    private List<JournalObject> objects;
    private SystemdJournal _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public List<JournalObject> objects() { return objects; }
    public SystemdJournal _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
