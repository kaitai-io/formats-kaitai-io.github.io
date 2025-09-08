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
public class SystemdJournal extends KaitaiStruct.ReadWrite {
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
    public SystemdJournal() {
        this(null, null, null);
    }

    public SystemdJournal(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SystemdJournal(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SystemdJournal(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SystemdJournal _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_header = this._io.readBytes(lenHeader());
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        this.header._read();
        this.objects = new ArrayList<JournalObject>();
        for (int i = 0; i < header().numObjects(); i++) {
            JournalObject _t_objects = new JournalObject(this._io, this, _root);
            try {
                _t_objects._read();
            } finally {
                this.objects.add(_t_objects);
            }
        }
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteDataHashTable = _enabledDataHashTable;
        _shouldWriteFieldHashTable = _enabledFieldHashTable;
        _shouldWriteLenHeader = _enabledLenHeader;
        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(lenHeader());
        this._io.addChildStream(_io__raw_header);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenHeader()));
            final SystemdJournal _this = this;
            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header = _io__raw_header.toByteArray();
                    if (_this._raw_header.length != lenHeader())
                        throw new ConsistencyError("raw(header)", lenHeader(), _this._raw_header.length);
                    parent.writeBytes(_this._raw_header);
                }
            });
        }
        this.header._write_Seq(_io__raw_header);
        for (int i = 0; i < this.objects.size(); i++) {
            this.objects.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.objects.size() != header().numObjects())
            throw new ConsistencyError("objects", header().numObjects(), this.objects.size());
        for (int i = 0; i < this.objects.size(); i++) {
            if (!Objects.equals(this.objects.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("objects", _root(), this.objects.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.objects.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("objects", this, this.objects.get(((Number) (i)).intValue())._parent());
        }
        if (_enabledDataHashTable) {
            if (this.dataHashTable.length != header().lenDataHashTable())
                throw new ConsistencyError("data_hash_table", header().lenDataHashTable(), this.dataHashTable.length);
        }
        if (_enabledFieldHashTable) {
            if (this.fieldHashTable.length != header().lenFieldHashTable())
                throw new ConsistencyError("field_hash_table", header().lenFieldHashTable(), this.fieldHashTable.length);
        }
        if (_enabledLenHeader) {
        }
        _dirty = false;
    }

    /**
     * Data objects are designed to carry log payload, typically in
     * form of a "key=value" string in `payload` attribute.
     * @see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects">Source</a>
     */
    public static class DataObject extends KaitaiStruct.ReadWrite {
        public static DataObject fromFile(String fileName) throws IOException {
            return new DataObject(new ByteBufferKaitaiStream(fileName));
        }
        public DataObject() {
            this(null, null, null);
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
        }
        public void _read() {
            this.hash = this._io.readU8le();
            this.ofsNextHash = this._io.readU8le();
            this.ofsHeadField = this._io.readU8le();
            this.ofsEntry = this._io.readU8le();
            this.ofsEntryArray = this._io.readU8le();
            this.numEntries = this._io.readU8le();
            this.payload = this._io.readBytesFull();
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteEntry = _enabledEntry;
            _shouldWriteEntryArray = _enabledEntryArray;
            _shouldWriteHeadField = _enabledHeadField;
            _shouldWriteNextHash = _enabledNextHash;
            this._io.writeU8le(this.hash);
            this._io.writeU8le(this.ofsNextHash);
            this._io.writeU8le(this.ofsHeadField);
            this._io.writeU8le(this.ofsEntry);
            this._io.writeU8le(this.ofsEntryArray);
            this._io.writeU8le(this.numEntries);
            this._io.writeBytes(this.payload);
            if (!(this._io.isEof()))
                throw new ConsistencyError("payload", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (_enabledEntry) {
                if (ofsEntry() != 0) {
                    if (!Objects.equals(this.entry._root(), _root()))
                        throw new ConsistencyError("entry", _root(), this.entry._root());
                    if (!Objects.equals(this.entry._parent(), this))
                        throw new ConsistencyError("entry", this, this.entry._parent());
                }
            }
            if (_enabledEntryArray) {
                if (ofsEntryArray() != 0) {
                    if (!Objects.equals(this.entryArray._root(), _root()))
                        throw new ConsistencyError("entry_array", _root(), this.entryArray._root());
                    if (!Objects.equals(this.entryArray._parent(), this))
                        throw new ConsistencyError("entry_array", this, this.entryArray._parent());
                }
            }
            if (_enabledHeadField) {
                if (ofsHeadField() != 0) {
                    if (!Objects.equals(this.headField._root(), _root()))
                        throw new ConsistencyError("head_field", _root(), this.headField._root());
                    if (!Objects.equals(this.headField._parent(), this))
                        throw new ConsistencyError("head_field", this, this.headField._parent());
                }
            }
            if (_enabledNextHash) {
                if (ofsNextHash() != 0) {
                    if (!Objects.equals(this.nextHash._root(), _root()))
                        throw new ConsistencyError("next_hash", _root(), this.nextHash._root());
                    if (!Objects.equals(this.nextHash._parent(), this))
                        throw new ConsistencyError("next_hash", this, this.nextHash._parent());
                }
            }
            _dirty = false;
        }
        private JournalObject entry;
        private boolean _shouldWriteEntry = false;
        private boolean _enabledEntry = true;
        public JournalObject entry() {
            if (_shouldWriteEntry)
                _writeEntry();
            if (this.entry != null)
                return this.entry;
            if (!_enabledEntry)
                return null;
            if (ofsEntry() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsEntry());
                this.entry = new JournalObject(io, this, _root);
                this.entry._read();
                io.seek(_pos);
            }
            return this.entry;
        }
        public void setEntry(JournalObject _v) { _dirty = true; entry = _v; }
        public void setEntry_Enabled(boolean _v) { _dirty = true; _enabledEntry = _v; }

        private void _writeEntry() {
            _shouldWriteEntry = false;
            if (ofsEntry() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsEntry());
                this.entry._write_Seq(io);
                io.seek(_pos);
            }
        }
        private JournalObject entryArray;
        private boolean _shouldWriteEntryArray = false;
        private boolean _enabledEntryArray = true;
        public JournalObject entryArray() {
            if (_shouldWriteEntryArray)
                _writeEntryArray();
            if (this.entryArray != null)
                return this.entryArray;
            if (!_enabledEntryArray)
                return null;
            if (ofsEntryArray() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsEntryArray());
                this.entryArray = new JournalObject(io, this, _root);
                this.entryArray._read();
                io.seek(_pos);
            }
            return this.entryArray;
        }
        public void setEntryArray(JournalObject _v) { _dirty = true; entryArray = _v; }
        public void setEntryArray_Enabled(boolean _v) { _dirty = true; _enabledEntryArray = _v; }

        private void _writeEntryArray() {
            _shouldWriteEntryArray = false;
            if (ofsEntryArray() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsEntryArray());
                this.entryArray._write_Seq(io);
                io.seek(_pos);
            }
        }
        private JournalObject headField;
        private boolean _shouldWriteHeadField = false;
        private boolean _enabledHeadField = true;
        public JournalObject headField() {
            if (_shouldWriteHeadField)
                _writeHeadField();
            if (this.headField != null)
                return this.headField;
            if (!_enabledHeadField)
                return null;
            if (ofsHeadField() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsHeadField());
                this.headField = new JournalObject(io, this, _root);
                this.headField._read();
                io.seek(_pos);
            }
            return this.headField;
        }
        public void setHeadField(JournalObject _v) { _dirty = true; headField = _v; }
        public void setHeadField_Enabled(boolean _v) { _dirty = true; _enabledHeadField = _v; }

        private void _writeHeadField() {
            _shouldWriteHeadField = false;
            if (ofsHeadField() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsHeadField());
                this.headField._write_Seq(io);
                io.seek(_pos);
            }
        }
        private JournalObject nextHash;
        private boolean _shouldWriteNextHash = false;
        private boolean _enabledNextHash = true;
        public JournalObject nextHash() {
            if (_shouldWriteNextHash)
                _writeNextHash();
            if (this.nextHash != null)
                return this.nextHash;
            if (!_enabledNextHash)
                return null;
            if (ofsNextHash() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsNextHash());
                this.nextHash = new JournalObject(io, this, _root);
                this.nextHash._read();
                io.seek(_pos);
            }
            return this.nextHash;
        }
        public void setNextHash(JournalObject _v) { _dirty = true; nextHash = _v; }
        public void setNextHash_Enabled(boolean _v) { _dirty = true; _enabledNextHash = _v; }

        private void _writeNextHash() {
            _shouldWriteNextHash = false;
            if (ofsNextHash() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsNextHash());
                this.nextHash._write_Seq(io);
                io.seek(_pos);
            }
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
        public void setHash(long _v) { _dirty = true; hash = _v; }
        public long ofsNextHash() { return ofsNextHash; }
        public void setOfsNextHash(long _v) { _dirty = true; ofsNextHash = _v; }
        public long ofsHeadField() { return ofsHeadField; }
        public void setOfsHeadField(long _v) { _dirty = true; ofsHeadField = _v; }
        public long ofsEntry() { return ofsEntry; }
        public void setOfsEntry(long _v) { _dirty = true; ofsEntry = _v; }
        public long ofsEntryArray() { return ofsEntryArray; }
        public void setOfsEntryArray(long _v) { _dirty = true; ofsEntryArray = _v; }
        public long numEntries() { return numEntries; }
        public void setNumEntries(long _v) { _dirty = true; numEntries = _v; }
        public byte[] payload() { return payload; }
        public void setPayload(byte[] _v) { _dirty = true; payload = _v; }
        public SystemdJournal _root() { return _root; }
        public void set_root(SystemdJournal _v) { _dirty = true; _root = _v; }
        public SystemdJournal.JournalObject _parent() { return _parent; }
        public void set_parent(SystemdJournal.JournalObject _v) { _dirty = true; _parent = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.signature);
            this._io.writeU4le(this.compatibleFlags);
            this._io.writeU4le(this.incompatibleFlags);
            this._io.writeU1(((Number) (this.state.id())).intValue());
            this._io.writeBytes(this.reserved);
            this._io.writeBytes(this.fileId);
            this._io.writeBytes(this.machineId);
            this._io.writeBytes(this.bootId);
            this._io.writeBytes(this.seqnumId);
            this._io.writeU8le(this.lenHeader);
            this._io.writeU8le(this.lenArena);
            this._io.writeU8le(this.ofsDataHashTable);
            this._io.writeU8le(this.lenDataHashTable);
            this._io.writeU8le(this.ofsFieldHashTable);
            this._io.writeU8le(this.lenFieldHashTable);
            this._io.writeU8le(this.ofsTailObject);
            this._io.writeU8le(this.numObjects);
            this._io.writeU8le(this.numEntries);
            this._io.writeU8le(this.tailEntrySeqnum);
            this._io.writeU8le(this.headEntrySeqnum);
            this._io.writeU8le(this.ofsEntryArray);
            this._io.writeU8le(this.headEntryRealtime);
            this._io.writeU8le(this.tailEntryRealtime);
            this._io.writeU8le(this.tailEntryMonotonic);
            if (!(_io().isEof())) {
                this._io.writeU8le(this.numData);
            }
            if (!(_io().isEof())) {
                this._io.writeU8le(this.numFields);
            }
            if (!(_io().isEof())) {
                this._io.writeU8le(this.numTags);
            }
            if (!(_io().isEof())) {
                this._io.writeU8le(this.numEntryArrays);
            }
        }

        public void _check() {
            if (this.signature.length != 8)
                throw new ConsistencyError("signature", 8, this.signature.length);
            if (!(Arrays.equals(this.signature, new byte[] { 76, 80, 75, 83, 72, 72, 82, 72 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 80, 75, 83, 72, 72, 82, 72 }, this.signature, null, "/types/header/seq/0");
            }
            if (this.reserved.length != 7)
                throw new ConsistencyError("reserved", 7, this.reserved.length);
            if (this.fileId.length != 16)
                throw new ConsistencyError("file_id", 16, this.fileId.length);
            if (this.machineId.length != 16)
                throw new ConsistencyError("machine_id", 16, this.machineId.length);
            if (this.bootId.length != 16)
                throw new ConsistencyError("boot_id", 16, this.bootId.length);
            if (this.seqnumId.length != 16)
                throw new ConsistencyError("seqnum_id", 16, this.seqnumId.length);
            _dirty = false;
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
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
        public long compatibleFlags() { return compatibleFlags; }
        public void setCompatibleFlags(long _v) { _dirty = true; compatibleFlags = _v; }
        public long incompatibleFlags() { return incompatibleFlags; }
        public void setIncompatibleFlags(long _v) { _dirty = true; incompatibleFlags = _v; }
        public State state() { return state; }
        public void setState(State _v) { _dirty = true; state = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public byte[] fileId() { return fileId; }
        public void setFileId(byte[] _v) { _dirty = true; fileId = _v; }
        public byte[] machineId() { return machineId; }
        public void setMachineId(byte[] _v) { _dirty = true; machineId = _v; }
        public byte[] bootId() { return bootId; }
        public void setBootId(byte[] _v) { _dirty = true; bootId = _v; }
        public byte[] seqnumId() { return seqnumId; }
        public void setSeqnumId(byte[] _v) { _dirty = true; seqnumId = _v; }
        public long lenHeader() { return lenHeader; }
        public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
        public long lenArena() { return lenArena; }
        public void setLenArena(long _v) { _dirty = true; lenArena = _v; }
        public long ofsDataHashTable() { return ofsDataHashTable; }
        public void setOfsDataHashTable(long _v) { _dirty = true; ofsDataHashTable = _v; }
        public long lenDataHashTable() { return lenDataHashTable; }
        public void setLenDataHashTable(long _v) { _dirty = true; lenDataHashTable = _v; }
        public long ofsFieldHashTable() { return ofsFieldHashTable; }
        public void setOfsFieldHashTable(long _v) { _dirty = true; ofsFieldHashTable = _v; }
        public long lenFieldHashTable() { return lenFieldHashTable; }
        public void setLenFieldHashTable(long _v) { _dirty = true; lenFieldHashTable = _v; }
        public long ofsTailObject() { return ofsTailObject; }
        public void setOfsTailObject(long _v) { _dirty = true; ofsTailObject = _v; }
        public long numObjects() { return numObjects; }
        public void setNumObjects(long _v) { _dirty = true; numObjects = _v; }
        public long numEntries() { return numEntries; }
        public void setNumEntries(long _v) { _dirty = true; numEntries = _v; }
        public long tailEntrySeqnum() { return tailEntrySeqnum; }
        public void setTailEntrySeqnum(long _v) { _dirty = true; tailEntrySeqnum = _v; }
        public long headEntrySeqnum() { return headEntrySeqnum; }
        public void setHeadEntrySeqnum(long _v) { _dirty = true; headEntrySeqnum = _v; }
        public long ofsEntryArray() { return ofsEntryArray; }
        public void setOfsEntryArray(long _v) { _dirty = true; ofsEntryArray = _v; }
        public long headEntryRealtime() { return headEntryRealtime; }
        public void setHeadEntryRealtime(long _v) { _dirty = true; headEntryRealtime = _v; }
        public long tailEntryRealtime() { return tailEntryRealtime; }
        public void setTailEntryRealtime(long _v) { _dirty = true; tailEntryRealtime = _v; }
        public long tailEntryMonotonic() { return tailEntryMonotonic; }
        public void setTailEntryMonotonic(long _v) { _dirty = true; tailEntryMonotonic = _v; }
        public Long numData() { return numData; }
        public void setNumData(Long _v) { _dirty = true; numData = _v; }
        public Long numFields() { return numFields; }
        public void setNumFields(Long _v) { _dirty = true; numFields = _v; }
        public Long numTags() { return numTags; }
        public void setNumTags(Long _v) { _dirty = true; numTags = _v; }
        public Long numEntryArrays() { return numEntryArrays; }
        public void setNumEntryArrays(Long _v) { _dirty = true; numEntryArrays = _v; }
        public SystemdJournal _root() { return _root; }
        public void set_root(SystemdJournal _v) { _dirty = true; _root = _v; }
        public SystemdJournal _parent() { return _parent; }
        public void set_parent(SystemdJournal _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects">Source</a>
     */
    public static class JournalObject extends KaitaiStruct.ReadWrite {
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
        public JournalObject() {
            this(null, null, null);
        }

        public JournalObject(KaitaiStream _io) {
            this(_io, null, null);
        }

        public JournalObject(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public JournalObject(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SystemdJournal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
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
                        this._raw_payload = this._io.readBytes(lenObject() - 16);
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new DataObject(_io__raw_payload, this, _root);
                        ((DataObject) (this.payload))._read();
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
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            if (this.padding.length != KaitaiStream.mod(8 - _io().pos(), 8))
                throw new ConsistencyError("padding", KaitaiStream.mod(8 - _io().pos(), 8), this.padding.length);
            this._io.writeBytes(this.padding);
            this._io.writeU1(((Number) (this.objectType.id())).intValue());
            this._io.writeU1(this.flags);
            this._io.writeBytes(this.reserved);
            this._io.writeU8le(this.lenObject);
            {
                ObjectTypes on = objectType();
                if (on != null) {
                    switch (objectType()) {
                    case DATA: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(lenObject() - 16);
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenObject() - 16));
                            final JournalObject _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != lenObject() - 16)
                                        throw new ConsistencyError("raw(payload)", lenObject() - 16, ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((DataObject) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.payload)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.payload)))));
                }
            }
        }

        public void _check() {
            if (this.reserved.length != 6)
                throw new ConsistencyError("reserved", 6, this.reserved.length);
            {
                ObjectTypes on = objectType();
                if (on != null) {
                    switch (objectType()) {
                    case DATA: {
                        if (!Objects.equals(((SystemdJournal.DataObject) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((SystemdJournal.DataObject) (this.payload))._root());
                        if (!Objects.equals(((SystemdJournal.DataObject) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((SystemdJournal.DataObject) (this.payload))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.payload)).length != lenObject() - 16)
                            throw new ConsistencyError("payload", lenObject() - 16, ((byte[]) (this.payload)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.payload)).length != lenObject() - 16)
                        throw new ConsistencyError("payload", lenObject() - 16, ((byte[]) (this.payload)).length);
                }
            }
            _dirty = false;
        }
        private byte[] padding;
        private ObjectTypes objectType;
        private int flags;
        private byte[] reserved;
        private long lenObject;
        private Object payload;
        private SystemdJournal _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_payload;
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public ObjectTypes objectType() { return objectType; }
        public void setObjectType(ObjectTypes _v) { _dirty = true; objectType = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public long lenObject() { return lenObject; }
        public void setLenObject(long _v) { _dirty = true; lenObject = _v; }
        public Object payload() { return payload; }
        public void setPayload(Object _v) { _dirty = true; payload = _v; }
        public SystemdJournal _root() { return _root; }
        public void set_root(SystemdJournal _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_payload() { return _raw_payload; }
        public void set_raw_Payload(byte[] _v) { _dirty = true; _raw_payload = _v; }
    }
    private byte[] dataHashTable;
    private boolean _shouldWriteDataHashTable = false;
    private boolean _enabledDataHashTable = true;
    public byte[] dataHashTable() {
        if (_shouldWriteDataHashTable)
            _writeDataHashTable();
        if (this.dataHashTable != null)
            return this.dataHashTable;
        if (!_enabledDataHashTable)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().ofsDataHashTable());
        this.dataHashTable = this._io.readBytes(header().lenDataHashTable());
        this._io.seek(_pos);
        return this.dataHashTable;
    }
    public void setDataHashTable(byte[] _v) { _dirty = true; dataHashTable = _v; }
    public void setDataHashTable_Enabled(boolean _v) { _dirty = true; _enabledDataHashTable = _v; }

    private void _writeDataHashTable() {
        _shouldWriteDataHashTable = false;
        long _pos = this._io.pos();
        this._io.seek(header().ofsDataHashTable());
        this._io.writeBytes(this.dataHashTable);
        this._io.seek(_pos);
    }
    private byte[] fieldHashTable;
    private boolean _shouldWriteFieldHashTable = false;
    private boolean _enabledFieldHashTable = true;
    public byte[] fieldHashTable() {
        if (_shouldWriteFieldHashTable)
            _writeFieldHashTable();
        if (this.fieldHashTable != null)
            return this.fieldHashTable;
        if (!_enabledFieldHashTable)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().ofsFieldHashTable());
        this.fieldHashTable = this._io.readBytes(header().lenFieldHashTable());
        this._io.seek(_pos);
        return this.fieldHashTable;
    }
    public void setFieldHashTable(byte[] _v) { _dirty = true; fieldHashTable = _v; }
    public void setFieldHashTable_Enabled(boolean _v) { _dirty = true; _enabledFieldHashTable = _v; }

    private void _writeFieldHashTable() {
        _shouldWriteFieldHashTable = false;
        long _pos = this._io.pos();
        this._io.seek(header().ofsFieldHashTable());
        this._io.writeBytes(this.fieldHashTable);
        this._io.seek(_pos);
    }
    private Long lenHeader;
    private boolean _shouldWriteLenHeader = false;
    private boolean _enabledLenHeader = true;

    /**
     * Header length is used to set substream size, as it thus required
     * prior to declaration of header.
     */
    public Long lenHeader() {
        if (_shouldWriteLenHeader)
            _writeLenHeader();
        if (this.lenHeader != null)
            return this.lenHeader;
        if (!_enabledLenHeader)
            return null;
        long _pos = this._io.pos();
        this._io.seek(88);
        this.lenHeader = this._io.readU8le();
        this._io.seek(_pos);
        return this.lenHeader;
    }
    public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
    public void setLenHeader_Enabled(boolean _v) { _dirty = true; _enabledLenHeader = _v; }

    private void _writeLenHeader() {
        _shouldWriteLenHeader = false;
        long _pos = this._io.pos();
        this._io.seek(88);
        this._io.writeU8le(this.lenHeader);
        this._io.seek(_pos);
    }
    private Header header;
    private List<JournalObject> objects;
    private SystemdJournal _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public List<JournalObject> objects() { return objects; }
    public void setObjects(List<JournalObject> _v) { _dirty = true; objects = _v; }
    public SystemdJournal _root() { return _root; }
    public void set_root(SystemdJournal _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header() { return _raw_header; }
    public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
}
