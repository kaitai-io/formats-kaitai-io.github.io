// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;


/**
 * @see <a href="https://en.wikipedia.org/wiki/GUID_Partition_Table">Source</a>
 */
public class GptPartitionTable extends KaitaiStruct.ReadWrite {
    public static GptPartitionTable fromFile(String fileName) throws IOException {
        return new GptPartitionTable(new ByteBufferKaitaiStream(fileName));
    }
    public GptPartitionTable() {
        this(null, null, null);
    }

    public GptPartitionTable(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GptPartitionTable(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public GptPartitionTable(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GptPartitionTable _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        _dirty = false;
    }

    public void _fetchInstances() {
        backup();
        if (this.backup != null) {
            this.backup._fetchInstances();
        }
        primary();
        if (this.primary != null) {
            this.primary._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteBackup = _enabledBackup;
        _shouldWritePrimary = _enabledPrimary;
    }

    public void _check() {
        if (_enabledBackup) {
            if (!Objects.equals(this.backup._root(), _root()))
                throw new ConsistencyError("backup", _root(), this.backup._root());
            if (!Objects.equals(this.backup._parent(), this))
                throw new ConsistencyError("backup", this, this.backup._parent());
        }
        if (_enabledPrimary) {
            if (!Objects.equals(this.primary._root(), _root()))
                throw new ConsistencyError("primary", _root(), this.primary._root());
            if (!Objects.equals(this.primary._parent(), this))
                throw new ConsistencyError("primary", this, this.primary._parent());
        }
        _dirty = false;
    }
    public static class PartitionEntry extends KaitaiStruct.ReadWrite {
        public static PartitionEntry fromFile(String fileName) throws IOException {
            return new PartitionEntry(new ByteBufferKaitaiStream(fileName));
        }
        public PartitionEntry() {
            this(null, null, null);
        }

        public PartitionEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PartitionEntry(KaitaiStream _io, GptPartitionTable.PartitionHeader _parent) {
            this(_io, _parent, null);
        }

        public PartitionEntry(KaitaiStream _io, GptPartitionTable.PartitionHeader _parent, GptPartitionTable _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.typeGuid = this._io.readBytes(16);
            this.guid = this._io.readBytes(16);
            this.firstLba = this._io.readU8le();
            this.lastLba = this._io.readU8le();
            this.attributes = this._io.readU8le();
            this.name = new String(this._io.readBytes(72), StandardCharsets.UTF_16LE);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.typeGuid);
            this._io.writeBytes(this.guid);
            this._io.writeU8le(this.firstLba);
            this._io.writeU8le(this.lastLba);
            this._io.writeU8le(this.attributes);
            this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-16LE")));
        }

        public void _check() {
            if (this.typeGuid.length != 16)
                throw new ConsistencyError("type_guid", 16, this.typeGuid.length);
            if (this.guid.length != 16)
                throw new ConsistencyError("guid", 16, this.guid.length);
            if ((this.name).getBytes(Charset.forName("UTF-16LE")).length != 72)
                throw new ConsistencyError("name", 72, (this.name).getBytes(Charset.forName("UTF-16LE")).length);
            _dirty = false;
        }
        private byte[] typeGuid;
        private byte[] guid;
        private long firstLba;
        private long lastLba;
        private long attributes;
        private String name;
        private GptPartitionTable _root;
        private GptPartitionTable.PartitionHeader _parent;
        public byte[] typeGuid() { return typeGuid; }
        public void setTypeGuid(byte[] _v) { _dirty = true; typeGuid = _v; }
        public byte[] guid() { return guid; }
        public void setGuid(byte[] _v) { _dirty = true; guid = _v; }
        public long firstLba() { return firstLba; }
        public void setFirstLba(long _v) { _dirty = true; firstLba = _v; }
        public long lastLba() { return lastLba; }
        public void setLastLba(long _v) { _dirty = true; lastLba = _v; }
        public long attributes() { return attributes; }
        public void setAttributes(long _v) { _dirty = true; attributes = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public GptPartitionTable _root() { return _root; }
        public void set_root(GptPartitionTable _v) { _dirty = true; _root = _v; }
        public GptPartitionTable.PartitionHeader _parent() { return _parent; }
        public void set_parent(GptPartitionTable.PartitionHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class PartitionHeader extends KaitaiStruct.ReadWrite {
        public static PartitionHeader fromFile(String fileName) throws IOException {
            return new PartitionHeader(new ByteBufferKaitaiStream(fileName));
        }
        public PartitionHeader() {
            this(null, null, null);
        }

        public PartitionHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PartitionHeader(KaitaiStream _io, GptPartitionTable _parent) {
            this(_io, _parent, null);
        }

        public PartitionHeader(KaitaiStream _io, GptPartitionTable _parent, GptPartitionTable _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.signature = this._io.readBytes(8);
            if (!(Arrays.equals(this.signature, new byte[] { 69, 70, 73, 32, 80, 65, 82, 84 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 70, 73, 32, 80, 65, 82, 84 }, this.signature, this._io, "/types/partition_header/seq/0");
            }
            this.revision = this._io.readU4le();
            this.headerSize = this._io.readU4le();
            this.crc32Header = this._io.readU4le();
            this.reserved = this._io.readU4le();
            this.currentLba = this._io.readU8le();
            this.backupLba = this._io.readU8le();
            this.firstUsableLba = this._io.readU8le();
            this.lastUsableLba = this._io.readU8le();
            this.diskGuid = this._io.readBytes(16);
            this.entriesStart = this._io.readU8le();
            this.entriesCount = this._io.readU4le();
            this.entriesSize = this._io.readU4le();
            this.crc32Array = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            entries();
            if (this.entries != null) {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteEntries = _enabledEntries;
            this._io.writeBytes(this.signature);
            this._io.writeU4le(this.revision);
            this._io.writeU4le(this.headerSize);
            this._io.writeU4le(this.crc32Header);
            this._io.writeU4le(this.reserved);
            this._io.writeU8le(this.currentLba);
            this._io.writeU8le(this.backupLba);
            this._io.writeU8le(this.firstUsableLba);
            this._io.writeU8le(this.lastUsableLba);
            this._io.writeBytes(this.diskGuid);
            this._io.writeU8le(this.entriesStart);
            this._io.writeU4le(this.entriesCount);
            this._io.writeU4le(this.entriesSize);
            this._io.writeU4le(this.crc32Array);
        }

        public void _check() {
            if (this.signature.length != 8)
                throw new ConsistencyError("signature", 8, this.signature.length);
            if (!(Arrays.equals(this.signature, new byte[] { 69, 70, 73, 32, 80, 65, 82, 84 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 70, 73, 32, 80, 65, 82, 84 }, this.signature, null, "/types/partition_header/seq/0");
            }
            if (this.diskGuid.length != 16)
                throw new ConsistencyError("disk_guid", 16, this.diskGuid.length);
            if (_enabledEntries) {
                if (this.entries.size() != entriesCount())
                    throw new ConsistencyError("entries", entriesCount(), this.entries.size());
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
        }
        private List<PartitionEntry> entries;
        private boolean _shouldWriteEntries = false;
        private boolean _enabledEntries = true;
        public List<PartitionEntry> entries() {
            if (_shouldWriteEntries)
                _writeEntries();
            if (this.entries != null)
                return this.entries;
            if (!_enabledEntries)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(entriesStart() * _root().sectorSize());
            this._raw_entries = new ArrayList<byte[]>();
            this.entries = new ArrayList<PartitionEntry>();
            for (int i = 0; i < entriesCount(); i++) {
                this._raw_entries.add(io.readBytes(entriesSize()));
                KaitaiStream _io__raw_entries = new ByteBufferKaitaiStream(this._raw_entries.get(i));
                PartitionEntry _t_entries = new PartitionEntry(_io__raw_entries, this, _root);
                try {
                    _t_entries._read();
                } finally {
                    this.entries.add(_t_entries);
                }
            }
            io.seek(_pos);
            return this.entries;
        }
        public void setEntries(List<PartitionEntry> _v) { _dirty = true; entries = _v; }
        public void setEntries_Enabled(boolean _v) { _dirty = true; _enabledEntries = _v; }

        private void _writeEntries() {
            _shouldWriteEntries = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(entriesStart() * _root().sectorSize());
            this._raw_entries = new ArrayList<byte[]>();
            for (int i = 0; i < this.entries.size(); i++) {
                final KaitaiStream _io__raw_entries = new ByteBufferKaitaiStream(entriesSize());
                io.addChildStream(_io__raw_entries);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (entriesSize()));
                    final PartitionHeader _this = this;
                    final int _i = i;
                    _io__raw_entries.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_entries.add(_io__raw_entries.toByteArray());
                            if (_this._raw_entries.get(((Number) (_i)).intValue()).length != entriesSize())
                                throw new ConsistencyError("raw(entries)", entriesSize(), _this._raw_entries.get(((Number) (_i)).intValue()).length);
                            parent.writeBytes(_this._raw_entries.get(((Number) (_i)).intValue()));
                        }
                    });
                }
                this.entries.get(((Number) (i)).intValue())._write_Seq(_io__raw_entries);
            }
            io.seek(_pos);
        }
        private byte[] signature;
        private long revision;
        private long headerSize;
        private long crc32Header;
        private long reserved;
        private long currentLba;
        private long backupLba;
        private long firstUsableLba;
        private long lastUsableLba;
        private byte[] diskGuid;
        private long entriesStart;
        private long entriesCount;
        private long entriesSize;
        private long crc32Array;
        private GptPartitionTable _root;
        private GptPartitionTable _parent;
        private List<byte[]> _raw_entries;
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
        public long revision() { return revision; }
        public void setRevision(long _v) { _dirty = true; revision = _v; }
        public long headerSize() { return headerSize; }
        public void setHeaderSize(long _v) { _dirty = true; headerSize = _v; }
        public long crc32Header() { return crc32Header; }
        public void setCrc32Header(long _v) { _dirty = true; crc32Header = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public long currentLba() { return currentLba; }
        public void setCurrentLba(long _v) { _dirty = true; currentLba = _v; }
        public long backupLba() { return backupLba; }
        public void setBackupLba(long _v) { _dirty = true; backupLba = _v; }
        public long firstUsableLba() { return firstUsableLba; }
        public void setFirstUsableLba(long _v) { _dirty = true; firstUsableLba = _v; }
        public long lastUsableLba() { return lastUsableLba; }
        public void setLastUsableLba(long _v) { _dirty = true; lastUsableLba = _v; }
        public byte[] diskGuid() { return diskGuid; }
        public void setDiskGuid(byte[] _v) { _dirty = true; diskGuid = _v; }
        public long entriesStart() { return entriesStart; }
        public void setEntriesStart(long _v) { _dirty = true; entriesStart = _v; }
        public long entriesCount() { return entriesCount; }
        public void setEntriesCount(long _v) { _dirty = true; entriesCount = _v; }
        public long entriesSize() { return entriesSize; }
        public void setEntriesSize(long _v) { _dirty = true; entriesSize = _v; }
        public long crc32Array() { return crc32Array; }
        public void setCrc32Array(long _v) { _dirty = true; crc32Array = _v; }
        public GptPartitionTable _root() { return _root; }
        public void set_root(GptPartitionTable _v) { _dirty = true; _root = _v; }
        public GptPartitionTable _parent() { return _parent; }
        public void set_parent(GptPartitionTable _v) { _dirty = true; _parent = _v; }
        public List<byte[]> _raw_entries() { return _raw_entries; }
        public void set_raw_Entries(List<byte[]> _v) { _dirty = true; _raw_entries = _v; }
    }
    private PartitionHeader backup;
    private boolean _shouldWriteBackup = false;
    private boolean _enabledBackup = true;
    public PartitionHeader backup() {
        if (_shouldWriteBackup)
            _writeBackup();
        if (this.backup != null)
            return this.backup;
        if (!_enabledBackup)
            return null;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_io().size() - _root().sectorSize());
        this.backup = new PartitionHeader(io, this, _root);
        this.backup._read();
        io.seek(_pos);
        return this.backup;
    }
    public void setBackup(PartitionHeader _v) { _dirty = true; backup = _v; }
    public void setBackup_Enabled(boolean _v) { _dirty = true; _enabledBackup = _v; }

    private void _writeBackup() {
        _shouldWriteBackup = false;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_io().size() - _root().sectorSize());
        this.backup._write_Seq(io);
        io.seek(_pos);
    }
    private PartitionHeader primary;
    private boolean _shouldWritePrimary = false;
    private boolean _enabledPrimary = true;
    public PartitionHeader primary() {
        if (_shouldWritePrimary)
            _writePrimary();
        if (this.primary != null)
            return this.primary;
        if (!_enabledPrimary)
            return null;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        this.primary = new PartitionHeader(io, this, _root);
        this.primary._read();
        io.seek(_pos);
        return this.primary;
    }
    public void setPrimary(PartitionHeader _v) { _dirty = true; primary = _v; }
    public void setPrimary_Enabled(boolean _v) { _dirty = true; _enabledPrimary = _v; }

    private void _writePrimary() {
        _shouldWritePrimary = false;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        this.primary._write_Seq(io);
        io.seek(_pos);
    }
    private Integer sectorSize;
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        this.sectorSize = ((int) 512);
        return this.sectorSize;
    }
    public void _invalidateSectorSize() { this.sectorSize = null; }
    private GptPartitionTable _root;
    private KaitaiStruct.ReadWrite _parent;
    public GptPartitionTable _root() { return _root; }
    public void set_root(GptPartitionTable _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
