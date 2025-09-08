// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.List;


/**
 * Linux Unified Key Setup (LUKS) is a format specification for storing disk
 * encryption parameters and up to 8 user keys (which can unlock the master key).
 * @see <a href="https://gitlab.com/cryptsetup/cryptsetup/-/wikis/LUKS-standard/on-disk-format.pdf">Source</a>
 */
public class Luks extends KaitaiStruct {
    public static Luks fromFile(String fileName) throws IOException {
        return new Luks(new ByteBufferKaitaiStream(fileName));
    }

    public Luks(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Luks(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Luks(KaitaiStream _io, KaitaiStruct _parent, Luks _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.partitionHeader = new PartitionHeader(this._io, this, _root);
    }

    public void _fetchInstances() {
        this.partitionHeader._fetchInstances();
        payload();
        if (this.payload != null) {
        }
    }
    public static class PartitionHeader extends KaitaiStruct {
        public static PartitionHeader fromFile(String fileName) throws IOException {
            return new PartitionHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
                this.keySlots.add(new KeySlot(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.keySlots.size(); i++) {
                this.keySlots.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        public static class KeySlot extends KaitaiStruct {
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
                _read();
            }
            private void _read() {
                this.stateOfKeySlot = KeySlotStates.byId(this._io.readU4be());
                this.iterationParameter = this._io.readU4be();
                this.saltParameter = this._io.readBytes(32);
                this.startSectorOfKeyMaterial = this._io.readU4be();
                this.numberOfAntiForensicStripes = this._io.readU4be();
            }

            public void _fetchInstances() {
                keyMaterial();
                if (this.keyMaterial != null) {
                }
            }
            private byte[] keyMaterial;
            public byte[] keyMaterial() {
                if (this.keyMaterial != null)
                    return this.keyMaterial;
                long _pos = this._io.pos();
                this._io.seek(startSectorOfKeyMaterial() * 512);
                this.keyMaterial = this._io.readBytes(_parent().numberOfKeyBytes() * numberOfAntiForensicStripes());
                this._io.seek(_pos);
                return this.keyMaterial;
            }
            private KeySlotStates stateOfKeySlot;
            private long iterationParameter;
            private byte[] saltParameter;
            private long startSectorOfKeyMaterial;
            private long numberOfAntiForensicStripes;
            private Luks _root;
            private Luks.PartitionHeader _parent;
            public KeySlotStates stateOfKeySlot() { return stateOfKeySlot; }
            public long iterationParameter() { return iterationParameter; }
            public byte[] saltParameter() { return saltParameter; }
            public long startSectorOfKeyMaterial() { return startSectorOfKeyMaterial; }
            public long numberOfAntiForensicStripes() { return numberOfAntiForensicStripes; }
            public Luks _root() { return _root; }
            public Luks.PartitionHeader _parent() { return _parent; }
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
        public byte[] version() { return version; }
        public String cipherNameSpecification() { return cipherNameSpecification; }
        public String cipherModeSpecification() { return cipherModeSpecification; }
        public String hashSpecification() { return hashSpecification; }
        public long payloadOffset() { return payloadOffset; }
        public long numberOfKeyBytes() { return numberOfKeyBytes; }
        public byte[] masterKeyChecksum() { return masterKeyChecksum; }
        public byte[] masterKeySaltParameter() { return masterKeySaltParameter; }
        public long masterKeyIterationsParameter() { return masterKeyIterationsParameter; }
        public String uuid() { return uuid; }
        public List<KeySlot> keySlots() { return keySlots; }
        public Luks _root() { return _root; }
        public Luks _parent() { return _parent; }
    }
    private byte[] payload;
    public byte[] payload() {
        if (this.payload != null)
            return this.payload;
        long _pos = this._io.pos();
        this._io.seek(partitionHeader().payloadOffset() * 512);
        this.payload = this._io.readBytesFull();
        this._io.seek(_pos);
        return this.payload;
    }
    private PartitionHeader partitionHeader;
    private Luks _root;
    private KaitaiStruct _parent;
    public PartitionHeader partitionHeader() { return partitionHeader; }
    public Luks _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
