// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;


/**
 * @see <a href="https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header">Source</a>
 */
public class VmwareVmdk extends KaitaiStruct.ReadWrite {
    public static VmwareVmdk fromFile(String fileName) throws IOException {
        return new VmwareVmdk(new ByteBufferKaitaiStream(fileName));
    }

    public enum CompressionMethods {
        NONE(0),
        DEFLATE(1);

        private final long id;
        CompressionMethods(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionMethods> byId = new HashMap<Long, CompressionMethods>(2);
        static {
            for (CompressionMethods e : CompressionMethods.values())
                byId.put(e.id(), e);
        }
        public static CompressionMethods byId(long id) { return byId.get(id); }
    }
    public VmwareVmdk() {
        this(null, null, null);
    }

    public VmwareVmdk(KaitaiStream _io) {
        this(_io, null, null);
    }

    public VmwareVmdk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public VmwareVmdk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, VmwareVmdk _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 75, 68, 77, 86 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 75, 68, 77, 86 }, this.magic, this._io, "/seq/0");
        }
        this.version = this._io.readS4le();
        this.flags = new HeaderFlags(this._io, this, _root);
        this.flags._read();
        this.sizeMax = this._io.readS8le();
        this.sizeGrain = this._io.readS8le();
        this.startDescriptor = this._io.readS8le();
        this.sizeDescriptor = this._io.readS8le();
        this.numGrainTableEntries = this._io.readS4le();
        this.startSecondaryGrain = this._io.readS8le();
        this.startPrimaryGrain = this._io.readS8le();
        this.sizeMetadata = this._io.readS8le();
        this.isDirty = this._io.readU1();
        this.stuff = this._io.readBytes(4);
        this.compressionMethod = CompressionMethods.byId(this._io.readU2le());
        _dirty = false;
    }

    public void _fetchInstances() {
        this.flags._fetchInstances();
        descriptor();
        if (this.descriptor != null) {
        }
        grainPrimary();
        if (this.grainPrimary != null) {
        }
        grainSecondary();
        if (this.grainSecondary != null) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteDescriptor = _enabledDescriptor;
        _shouldWriteGrainPrimary = _enabledGrainPrimary;
        _shouldWriteGrainSecondary = _enabledGrainSecondary;
        this._io.writeBytes(this.magic);
        this._io.writeS4le(this.version);
        this.flags._write_Seq(this._io);
        this._io.writeS8le(this.sizeMax);
        this._io.writeS8le(this.sizeGrain);
        this._io.writeS8le(this.startDescriptor);
        this._io.writeS8le(this.sizeDescriptor);
        this._io.writeS4le(this.numGrainTableEntries);
        this._io.writeS8le(this.startSecondaryGrain);
        this._io.writeS8le(this.startPrimaryGrain);
        this._io.writeS8le(this.sizeMetadata);
        this._io.writeU1(this.isDirty);
        this._io.writeBytes(this.stuff);
        this._io.writeU2le(((Number) (this.compressionMethod.id())).intValue());
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 75, 68, 77, 86 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 75, 68, 77, 86 }, this.magic, null, "/seq/0");
        }
        if (!Objects.equals(this.flags._root(), _root()))
            throw new ConsistencyError("flags", _root(), this.flags._root());
        if (!Objects.equals(this.flags._parent(), this))
            throw new ConsistencyError("flags", this, this.flags._parent());
        if (this.stuff.length != 4)
            throw new ConsistencyError("stuff", 4, this.stuff.length);
        if (_enabledDescriptor) {
            if (this.descriptor.length != sizeDescriptor() * _root().lenSector())
                throw new ConsistencyError("descriptor", sizeDescriptor() * _root().lenSector(), this.descriptor.length);
        }
        if (_enabledGrainPrimary) {
            if (this.grainPrimary.length != sizeGrain() * _root().lenSector())
                throw new ConsistencyError("grain_primary", sizeGrain() * _root().lenSector(), this.grainPrimary.length);
        }
        if (_enabledGrainSecondary) {
            if (this.grainSecondary.length != sizeGrain() * _root().lenSector())
                throw new ConsistencyError("grain_secondary", sizeGrain() * _root().lenSector(), this.grainSecondary.length);
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags">Source</a>
     */
    public static class HeaderFlags extends KaitaiStruct.ReadWrite {
        public static HeaderFlags fromFile(String fileName) throws IOException {
            return new HeaderFlags(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderFlags() {
            this(null, null, null);
        }

        public HeaderFlags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderFlags(KaitaiStream _io, VmwareVmdk _parent) {
            this(_io, _parent, null);
        }

        public HeaderFlags(KaitaiStream _io, VmwareVmdk _parent, VmwareVmdk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved1 = this._io.readBitsIntBe(5);
            this.zeroedGrainTableEntry = this._io.readBitsIntBe(1) != 0;
            this.useSecondaryGrainDir = this._io.readBitsIntBe(1) != 0;
            this.validNewLineDetectionTest = this._io.readBitsIntBe(1) != 0;
            this.reserved2 = this._io.readU1();
            this.reserved3 = this._io.readBitsIntBe(6);
            this.hasMetadata = this._io.readBitsIntBe(1) != 0;
            this.hasCompressedGrain = this._io.readBitsIntBe(1) != 0;
            this.reserved4 = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(5, this.reserved1);
            this._io.writeBitsIntBe(1, (this.zeroedGrainTableEntry ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.useSecondaryGrainDir ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.validNewLineDetectionTest ? 1 : 0));
            this._io.writeU1(this.reserved2);
            this._io.writeBitsIntBe(6, this.reserved3);
            this._io.writeBitsIntBe(1, (this.hasMetadata ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasCompressedGrain ? 1 : 0));
            this._io.writeU1(this.reserved4);
        }

        public void _check() {
            _dirty = false;
        }
        private long reserved1;
        private boolean zeroedGrainTableEntry;
        private boolean useSecondaryGrainDir;
        private boolean validNewLineDetectionTest;
        private int reserved2;
        private long reserved3;
        private boolean hasMetadata;
        private boolean hasCompressedGrain;
        private int reserved4;
        private VmwareVmdk _root;
        private VmwareVmdk _parent;
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
        public boolean zeroedGrainTableEntry() { return zeroedGrainTableEntry; }
        public void setZeroedGrainTableEntry(boolean _v) { _dirty = true; zeroedGrainTableEntry = _v; }
        public boolean useSecondaryGrainDir() { return useSecondaryGrainDir; }
        public void setUseSecondaryGrainDir(boolean _v) { _dirty = true; useSecondaryGrainDir = _v; }
        public boolean validNewLineDetectionTest() { return validNewLineDetectionTest; }
        public void setValidNewLineDetectionTest(boolean _v) { _dirty = true; validNewLineDetectionTest = _v; }
        public int reserved2() { return reserved2; }
        public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
        public long reserved3() { return reserved3; }
        public void setReserved3(long _v) { _dirty = true; reserved3 = _v; }
        public boolean hasMetadata() { return hasMetadata; }
        public void setHasMetadata(boolean _v) { _dirty = true; hasMetadata = _v; }
        public boolean hasCompressedGrain() { return hasCompressedGrain; }
        public void setHasCompressedGrain(boolean _v) { _dirty = true; hasCompressedGrain = _v; }
        public int reserved4() { return reserved4; }
        public void setReserved4(int _v) { _dirty = true; reserved4 = _v; }
        public VmwareVmdk _root() { return _root; }
        public void set_root(VmwareVmdk _v) { _dirty = true; _root = _v; }
        public VmwareVmdk _parent() { return _parent; }
        public void set_parent(VmwareVmdk _v) { _dirty = true; _parent = _v; }
    }
    private byte[] descriptor;
    private boolean _shouldWriteDescriptor = false;
    private boolean _enabledDescriptor = true;
    public byte[] descriptor() {
        if (_shouldWriteDescriptor)
            _writeDescriptor();
        if (this.descriptor != null)
            return this.descriptor;
        if (!_enabledDescriptor)
            return null;
        long _pos = this._io.pos();
        this._io.seek(startDescriptor() * _root().lenSector());
        this.descriptor = this._io.readBytes(sizeDescriptor() * _root().lenSector());
        this._io.seek(_pos);
        return this.descriptor;
    }
    public void setDescriptor(byte[] _v) { _dirty = true; descriptor = _v; }
    public void setDescriptor_Enabled(boolean _v) { _dirty = true; _enabledDescriptor = _v; }

    private void _writeDescriptor() {
        _shouldWriteDescriptor = false;
        long _pos = this._io.pos();
        this._io.seek(startDescriptor() * _root().lenSector());
        this._io.writeBytes(this.descriptor);
        this._io.seek(_pos);
    }
    private byte[] grainPrimary;
    private boolean _shouldWriteGrainPrimary = false;
    private boolean _enabledGrainPrimary = true;
    public byte[] grainPrimary() {
        if (_shouldWriteGrainPrimary)
            _writeGrainPrimary();
        if (this.grainPrimary != null)
            return this.grainPrimary;
        if (!_enabledGrainPrimary)
            return null;
        long _pos = this._io.pos();
        this._io.seek(startPrimaryGrain() * _root().lenSector());
        this.grainPrimary = this._io.readBytes(sizeGrain() * _root().lenSector());
        this._io.seek(_pos);
        return this.grainPrimary;
    }
    public void setGrainPrimary(byte[] _v) { _dirty = true; grainPrimary = _v; }
    public void setGrainPrimary_Enabled(boolean _v) { _dirty = true; _enabledGrainPrimary = _v; }

    private void _writeGrainPrimary() {
        _shouldWriteGrainPrimary = false;
        long _pos = this._io.pos();
        this._io.seek(startPrimaryGrain() * _root().lenSector());
        this._io.writeBytes(this.grainPrimary);
        this._io.seek(_pos);
    }
    private byte[] grainSecondary;
    private boolean _shouldWriteGrainSecondary = false;
    private boolean _enabledGrainSecondary = true;
    public byte[] grainSecondary() {
        if (_shouldWriteGrainSecondary)
            _writeGrainSecondary();
        if (this.grainSecondary != null)
            return this.grainSecondary;
        if (!_enabledGrainSecondary)
            return null;
        long _pos = this._io.pos();
        this._io.seek(startSecondaryGrain() * _root().lenSector());
        this.grainSecondary = this._io.readBytes(sizeGrain() * _root().lenSector());
        this._io.seek(_pos);
        return this.grainSecondary;
    }
    public void setGrainSecondary(byte[] _v) { _dirty = true; grainSecondary = _v; }
    public void setGrainSecondary_Enabled(boolean _v) { _dirty = true; _enabledGrainSecondary = _v; }

    private void _writeGrainSecondary() {
        _shouldWriteGrainSecondary = false;
        long _pos = this._io.pos();
        this._io.seek(startSecondaryGrain() * _root().lenSector());
        this._io.writeBytes(this.grainSecondary);
        this._io.seek(_pos);
    }
    private Integer lenSector;
    public Integer lenSector() {
        if (this.lenSector != null)
            return this.lenSector;
        this.lenSector = ((int) 512);
        return this.lenSector;
    }
    public void _invalidateLenSector() { this.lenSector = null; }
    private byte[] magic;
    private int version;
    private HeaderFlags flags;
    private long sizeMax;
    private long sizeGrain;
    private long startDescriptor;
    private long sizeDescriptor;
    private int numGrainTableEntries;
    private long startSecondaryGrain;
    private long startPrimaryGrain;
    private long sizeMetadata;
    private int isDirty;
    private byte[] stuff;
    private CompressionMethods compressionMethod;
    private VmwareVmdk _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public int version() { return version; }
    public void setVersion(int _v) { _dirty = true; version = _v; }
    public HeaderFlags flags() { return flags; }
    public void setFlags(HeaderFlags _v) { _dirty = true; flags = _v; }

    /**
     * Maximum number of sectors in a given image file (capacity)
     */
    public long sizeMax() { return sizeMax; }
    public void setSizeMax(long _v) { _dirty = true; sizeMax = _v; }
    public long sizeGrain() { return sizeGrain; }
    public void setSizeGrain(long _v) { _dirty = true; sizeGrain = _v; }

    /**
     * Embedded descriptor file start sector number (0 if not available)
     */
    public long startDescriptor() { return startDescriptor; }
    public void setStartDescriptor(long _v) { _dirty = true; startDescriptor = _v; }

    /**
     * Number of sectors that embedded descriptor file occupies
     */
    public long sizeDescriptor() { return sizeDescriptor; }
    public void setSizeDescriptor(long _v) { _dirty = true; sizeDescriptor = _v; }

    /**
     * Number of grains table entries
     */
    public int numGrainTableEntries() { return numGrainTableEntries; }
    public void setNumGrainTableEntries(int _v) { _dirty = true; numGrainTableEntries = _v; }

    /**
     * Secondary (backup) grain directory start sector number
     */
    public long startSecondaryGrain() { return startSecondaryGrain; }
    public void setStartSecondaryGrain(long _v) { _dirty = true; startSecondaryGrain = _v; }

    /**
     * Primary grain directory start sector number
     */
    public long startPrimaryGrain() { return startPrimaryGrain; }
    public void setStartPrimaryGrain(long _v) { _dirty = true; startPrimaryGrain = _v; }
    public long sizeMetadata() { return sizeMetadata; }
    public void setSizeMetadata(long _v) { _dirty = true; sizeMetadata = _v; }
    public int isDirty() { return isDirty; }
    public void setIsDirty(int _v) { _dirty = true; isDirty = _v; }
    public byte[] stuff() { return stuff; }
    public void setStuff(byte[] _v) { _dirty = true; stuff = _v; }
    public CompressionMethods compressionMethod() { return compressionMethod; }
    public void setCompressionMethod(CompressionMethods _v) { _dirty = true; compressionMethod = _v; }
    public VmwareVmdk _root() { return _root; }
    public void set_root(VmwareVmdk _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
