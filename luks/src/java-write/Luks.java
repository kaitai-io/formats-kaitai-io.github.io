// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.HashMap;
import java.util.List;


/**
 * Linux Unified Key Setup (LUKS) is a format specification for storing disk
 * encryption parameters and up to 8 user keys (which can unlock the master key).
 * @see <a href="https://gitlab.com/cryptsetup/cryptsetup/-/wikis/LUKS-standard/on-disk-format.pdf">Source</a>
 */
public class Luks extends KaitaiStruct.ReadWrite {
    public static Luks fromFile(String fileName) throws IOException {
        return new Luks(new ByteBufferKaitaiStream(fileName));
    }
    public Luks() {
        this(null, null, null);
    }

    public Luks(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Luks(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Luks(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Luks _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.partitionHeader = new PartitionHeader(this._io, this, _root);
        this.partitionHeader._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.partitionHeader._fetchInstances();
        payload();
        if (this.payload != null) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWritePayload = _enabledPayload;
        this.partitionHeader._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.partitionHeader._root(), _root()))
            throw new ConsistencyError("partition_header", _root(), this.partitionHeader._root());
        if (!Objects.equals(this.partitionHeader._parent(), this))
            throw new ConsistencyError("partition_header", this, this.partitionHeader._parent());
        if (_enabledPayload) {
        }
        _dirty = false;
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

        public PartitionHeader(KaitaiStream _io, Luks _parent) {
            this(_io, _parent, null);
        }

        public PartitionHeader(KaitaiStream _io, Luks _parent, Luks _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(6);
            if (!(Arrays.equals(this.magic, new byte[] { 76, 85, 75, 83, -70, -66 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 85, 75, 83, -70, -66 }, this.magic, this._io, "/types/partition_header/seq/0");
            }
            this.version = this._io.readBytes(2);
            if (!(Arrays.equals(this.version, new byte[] { 0, 1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 1 }, this.version, this._io, "/types/partition_header/seq/1");
            }
            this.cipherNameSpecification = new String(this._io.readBytes(32), StandardCharsets.US_ASCII);
            this.cipherModeSpecification = new String(this._io.readBytes(32), StandardCharsets.US_ASCII);
            this.hashSpecification = new String(this._io.readBytes(32), StandardCharsets.US_ASCII);
            this.payloadOffset = this._io.readU4be();
            this.numberOfKeyBytes = this._io.readU4be();
            this.masterKeyChecksum = this._io.readBytes(20);
            this.masterKeySaltParameter = this._io.readBytes(32);
            this.masterKeyIterationsParameter = this._io.readU4be();
            this.uuid = new String(this._io.readBytes(40), StandardCharsets.US_ASCII);
            this.keySlots = new ArrayList<KeySlot>();
            for (int i = 0; i < 8; i++) {
                KeySlot _t_keySlots = new KeySlot(this._io, this, _root);
                try {
                    _t_keySlots._read();
                } finally {
                    this.keySlots.add(_t_keySlots);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.keySlots.size(); i++) {
                this.keySlots.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeBytes(this.version);
            this._io.writeBytes((this.cipherNameSpecification).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.cipherModeSpecification).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.hashSpecification).getBytes(Charset.forName("ASCII")));
            this._io.writeU4be(this.payloadOffset);
            this._io.writeU4be(this.numberOfKeyBytes);
            this._io.writeBytes(this.masterKeyChecksum);
            this._io.writeBytes(this.masterKeySaltParameter);
            this._io.writeU4be(this.masterKeyIterationsParameter);
            this._io.writeBytes((this.uuid).getBytes(Charset.forName("ASCII")));
            for (int i = 0; i < this.keySlots.size(); i++) {
                this.keySlots.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.magic.length != 6)
                throw new ConsistencyError("magic", 6, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 76, 85, 75, 83, -70, -66 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 85, 75, 83, -70, -66 }, this.magic, null, "/types/partition_header/seq/0");
            }
            if (this.version.length != 2)
                throw new ConsistencyError("version", 2, this.version.length);
            if (!(Arrays.equals(this.version, new byte[] { 0, 1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 1 }, this.version, null, "/types/partition_header/seq/1");
            }
            if ((this.cipherNameSpecification).getBytes(Charset.forName("ASCII")).length != 32)
                throw new ConsistencyError("cipher_name_specification", 32, (this.cipherNameSpecification).getBytes(Charset.forName("ASCII")).length);
            if ((this.cipherModeSpecification).getBytes(Charset.forName("ASCII")).length != 32)
                throw new ConsistencyError("cipher_mode_specification", 32, (this.cipherModeSpecification).getBytes(Charset.forName("ASCII")).length);
            if ((this.hashSpecification).getBytes(Charset.forName("ASCII")).length != 32)
                throw new ConsistencyError("hash_specification", 32, (this.hashSpecification).getBytes(Charset.forName("ASCII")).length);
            if (this.masterKeyChecksum.length != 20)
                throw new ConsistencyError("master_key_checksum", 20, this.masterKeyChecksum.length);
            if (this.masterKeySaltParameter.length != 32)
                throw new ConsistencyError("master_key_salt_parameter", 32, this.masterKeySaltParameter.length);
            if ((this.uuid).getBytes(Charset.forName("ASCII")).length != 40)
                throw new ConsistencyError("uuid", 40, (this.uuid).getBytes(Charset.forName("ASCII")).length);
            if (this.keySlots.size() != 8)
                throw new ConsistencyError("key_slots", 8, this.keySlots.size());
            for (int i = 0; i < this.keySlots.size(); i++) {
                if (!Objects.equals(this.keySlots.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("key_slots", _root(), this.keySlots.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.keySlots.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("key_slots", this, this.keySlots.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class KeySlot extends KaitaiStruct.ReadWrite {
            public static KeySlot fromFile(String fileName) throws IOException {
                return new KeySlot(new ByteBufferKaitaiStream(fileName));
            }

            public enum KeySlotStates {
                DISABLED_KEY_SLOT(57005),
                ENABLED_KEY_SLOT(11301363);

                private final long id;
                KeySlotStates(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, KeySlotStates> byId = new HashMap<Long, KeySlotStates>(2);
                static {
                    for (KeySlotStates e : KeySlotStates.values())
                        byId.put(e.id(), e);
                }
                public static KeySlotStates byId(long id) { return byId.get(id); }
            }
            public KeySlot() {
                this(null, null, null);
            }

            public KeySlot(KaitaiStream _io) {
                this(_io, null, null);
            }

            public KeySlot(KaitaiStream _io, Luks.PartitionHeader _parent) {
                this(_io, _parent, null);
            }

            public KeySlot(KaitaiStream _io, Luks.PartitionHeader _parent, Luks _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.stateOfKeySlot = KeySlotStates.byId(this._io.readU4be());
                this.iterationParameter = this._io.readU4be();
                this.saltParameter = this._io.readBytes(32);
                this.startSectorOfKeyMaterial = this._io.readU4be();
                this.numberOfAntiForensicStripes = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
                keyMaterial();
                if (this.keyMaterial != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteKeyMaterial = _enabledKeyMaterial;
                this._io.writeU4be(((Number) (this.stateOfKeySlot.id())).longValue());
                this._io.writeU4be(this.iterationParameter);
                this._io.writeBytes(this.saltParameter);
                this._io.writeU4be(this.startSectorOfKeyMaterial);
                this._io.writeU4be(this.numberOfAntiForensicStripes);
            }

            public void _check() {
                if (this.saltParameter.length != 32)
                    throw new ConsistencyError("salt_parameter", 32, this.saltParameter.length);
                if (_enabledKeyMaterial) {
                    if (this.keyMaterial.length != _parent().numberOfKeyBytes() * numberOfAntiForensicStripes())
                        throw new ConsistencyError("key_material", _parent().numberOfKeyBytes() * numberOfAntiForensicStripes(), this.keyMaterial.length);
                }
                _dirty = false;
            }
            private byte[] keyMaterial;
            private boolean _shouldWriteKeyMaterial = false;
            private boolean _enabledKeyMaterial = true;
            public byte[] keyMaterial() {
                if (_shouldWriteKeyMaterial)
                    _writeKeyMaterial();
                if (this.keyMaterial != null)
                    return this.keyMaterial;
                if (!_enabledKeyMaterial)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(startSectorOfKeyMaterial() * 512);
                this.keyMaterial = this._io.readBytes(_parent().numberOfKeyBytes() * numberOfAntiForensicStripes());
                this._io.seek(_pos);
                return this.keyMaterial;
            }
            public void setKeyMaterial(byte[] _v) { _dirty = true; keyMaterial = _v; }
            public void setKeyMaterial_Enabled(boolean _v) { _dirty = true; _enabledKeyMaterial = _v; }

            private void _writeKeyMaterial() {
                _shouldWriteKeyMaterial = false;
                long _pos = this._io.pos();
                this._io.seek(startSectorOfKeyMaterial() * 512);
                this._io.writeBytes(this.keyMaterial);
                this._io.seek(_pos);
            }
            private KeySlotStates stateOfKeySlot;
            private long iterationParameter;
            private byte[] saltParameter;
            private long startSectorOfKeyMaterial;
            private long numberOfAntiForensicStripes;
            private Luks _root;
            private Luks.PartitionHeader _parent;
            public KeySlotStates stateOfKeySlot() { return stateOfKeySlot; }
            public void setStateOfKeySlot(KeySlotStates _v) { _dirty = true; stateOfKeySlot = _v; }
            public long iterationParameter() { return iterationParameter; }
            public void setIterationParameter(long _v) { _dirty = true; iterationParameter = _v; }
            public byte[] saltParameter() { return saltParameter; }
            public void setSaltParameter(byte[] _v) { _dirty = true; saltParameter = _v; }
            public long startSectorOfKeyMaterial() { return startSectorOfKeyMaterial; }
            public void setStartSectorOfKeyMaterial(long _v) { _dirty = true; startSectorOfKeyMaterial = _v; }
            public long numberOfAntiForensicStripes() { return numberOfAntiForensicStripes; }
            public void setNumberOfAntiForensicStripes(long _v) { _dirty = true; numberOfAntiForensicStripes = _v; }
            public Luks _root() { return _root; }
            public void set_root(Luks _v) { _dirty = true; _root = _v; }
            public Luks.PartitionHeader _parent() { return _parent; }
            public void set_parent(Luks.PartitionHeader _v) { _dirty = true; _parent = _v; }
        }
        private byte[] magic;
        private byte[] version;
        private String cipherNameSpecification;
        private String cipherModeSpecification;
        private String hashSpecification;
        private long payloadOffset;
        private long numberOfKeyBytes;
        private byte[] masterKeyChecksum;
        private byte[] masterKeySaltParameter;
        private long masterKeyIterationsParameter;
        private String uuid;
        private List<KeySlot> keySlots;
        private Luks _root;
        private Luks _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public byte[] version() { return version; }
        public void setVersion(byte[] _v) { _dirty = true; version = _v; }
        public String cipherNameSpecification() { return cipherNameSpecification; }
        public void setCipherNameSpecification(String _v) { _dirty = true; cipherNameSpecification = _v; }
        public String cipherModeSpecification() { return cipherModeSpecification; }
        public void setCipherModeSpecification(String _v) { _dirty = true; cipherModeSpecification = _v; }
        public String hashSpecification() { return hashSpecification; }
        public void setHashSpecification(String _v) { _dirty = true; hashSpecification = _v; }
        public long payloadOffset() { return payloadOffset; }
        public void setPayloadOffset(long _v) { _dirty = true; payloadOffset = _v; }
        public long numberOfKeyBytes() { return numberOfKeyBytes; }
        public void setNumberOfKeyBytes(long _v) { _dirty = true; numberOfKeyBytes = _v; }
        public byte[] masterKeyChecksum() { return masterKeyChecksum; }
        public void setMasterKeyChecksum(byte[] _v) { _dirty = true; masterKeyChecksum = _v; }
        public byte[] masterKeySaltParameter() { return masterKeySaltParameter; }
        public void setMasterKeySaltParameter(byte[] _v) { _dirty = true; masterKeySaltParameter = _v; }
        public long masterKeyIterationsParameter() { return masterKeyIterationsParameter; }
        public void setMasterKeyIterationsParameter(long _v) { _dirty = true; masterKeyIterationsParameter = _v; }
        public String uuid() { return uuid; }
        public void setUuid(String _v) { _dirty = true; uuid = _v; }
        public List<KeySlot> keySlots() { return keySlots; }
        public void setKeySlots(List<KeySlot> _v) { _dirty = true; keySlots = _v; }
        public Luks _root() { return _root; }
        public void set_root(Luks _v) { _dirty = true; _root = _v; }
        public Luks _parent() { return _parent; }
        public void set_parent(Luks _v) { _dirty = true; _parent = _v; }
    }
    private byte[] payload;
    private boolean _shouldWritePayload = false;
    private boolean _enabledPayload = true;
    public byte[] payload() {
        if (_shouldWritePayload)
            _writePayload();
        if (this.payload != null)
            return this.payload;
        if (!_enabledPayload)
            return null;
        long _pos = this._io.pos();
        this._io.seek(partitionHeader().payloadOffset() * 512);
        this.payload = this._io.readBytesFull();
        this._io.seek(_pos);
        return this.payload;
    }
    public void setPayload(byte[] _v) { _dirty = true; payload = _v; }
    public void setPayload_Enabled(boolean _v) { _dirty = true; _enabledPayload = _v; }

    private void _writePayload() {
        _shouldWritePayload = false;
        long _pos = this._io.pos();
        this._io.seek(partitionHeader().payloadOffset() * 512);
        this._io.writeBytes(this.payload);
        if (!(this._io.isEof()))
            throw new ConsistencyError("payload", 0, this._io.size() - this._io.pos());
        this._io.seek(_pos);
    }
    private PartitionHeader partitionHeader;
    private Luks _root;
    private KaitaiStruct.ReadWrite _parent;
    public PartitionHeader partitionHeader() { return partitionHeader; }
    public void setPartitionHeader(PartitionHeader _v) { _dirty = true; partitionHeader = _v; }
    public Luks _root() { return _root; }
    public void set_root(Luks _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
