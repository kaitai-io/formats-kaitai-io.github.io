// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;


/**
 * @see <a href="https://en.wikipedia.org/wiki/GUID_Partition_Table">Source</a>
 */
public class GptPartitionTable extends KaitaiStruct {
    public static GptPartitionTable fromFile(String fileName) throws IOException {
        return new GptPartitionTable(new ByteBufferKaitaiStream(fileName));
    }

    public GptPartitionTable(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GptPartitionTable(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GptPartitionTable(KaitaiStream _io, KaitaiStruct _parent, GptPartitionTable _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
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
    public static class PartitionEntry extends KaitaiStruct {
        public static PartitionEntry fromFile(String fileName) throws IOException {
            return new PartitionEntry(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.typeGuid = this._io.readBytes(16);
            this.guid = this._io.readBytes(16);
            this.firstLba = this._io.readU8le();
            this.lastLba = this._io.readU8le();
            this.attributes = this._io.readU8le();
            this.name = new String(this._io.readBytes(72), StandardCharsets.UTF_16LE);
        }

        public void _fetchInstances() {
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
        public byte[] guid() { return guid; }
        public long firstLba() { return firstLba; }
        public long lastLba() { return lastLba; }
        public long attributes() { return attributes; }
        public String name() { return name; }
        public GptPartitionTable _root() { return _root; }
        public GptPartitionTable.PartitionHeader _parent() { return _parent; }
    }
    public static class PartitionHeader extends KaitaiStruct {
        public static PartitionHeader fromFile(String fileName) throws IOException {
            return new PartitionHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
            entries();
            if (this.entries != null) {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }
        private List<PartitionEntry> entries;
        public List<PartitionEntry> entries() {
            if (this.entries != null)
                return this.entries;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(entriesStart() * _root().sectorSize());
            this.entries = new ArrayList<PartitionEntry>();
            for (int i = 0; i < entriesCount(); i++) {
                KaitaiStream _io_entries = io.substream(entriesSize());
                this.entries.add(new PartitionEntry(_io_entries, this, _root));
            }
            io.seek(_pos);
            return this.entries;
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
        public byte[] signature() { return signature; }
        public long revision() { return revision; }
        public long headerSize() { return headerSize; }
        public long crc32Header() { return crc32Header; }
        public long reserved() { return reserved; }
        public long currentLba() { return currentLba; }
        public long backupLba() { return backupLba; }
        public long firstUsableLba() { return firstUsableLba; }
        public long lastUsableLba() { return lastUsableLba; }
        public byte[] diskGuid() { return diskGuid; }
        public long entriesStart() { return entriesStart; }
        public long entriesCount() { return entriesCount; }
        public long entriesSize() { return entriesSize; }
        public long crc32Array() { return crc32Array; }
        public GptPartitionTable _root() { return _root; }
        public GptPartitionTable _parent() { return _parent; }
    }
    private PartitionHeader backup;
    public PartitionHeader backup() {
        if (this.backup != null)
            return this.backup;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_io().size() - _root().sectorSize());
        this.backup = new PartitionHeader(io, this, _root);
        io.seek(_pos);
        return this.backup;
    }
    private PartitionHeader primary;
    public PartitionHeader primary() {
        if (this.primary != null)
            return this.primary;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        this.primary = new PartitionHeader(io, this, _root);
        io.seek(_pos);
        return this.primary;
    }
    private Integer sectorSize;
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        this.sectorSize = ((int) 512);
        return this.sectorSize;
    }
    private GptPartitionTable _root;
    private KaitaiStruct _parent;
    public GptPartitionTable _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
