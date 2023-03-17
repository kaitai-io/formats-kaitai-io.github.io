// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;


/**
 * @see <a href="https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header">Source</a>
 */
public class VmwareVmdk extends KaitaiStruct {
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

    public VmwareVmdk(KaitaiStream _io) {
        this(_io, null, null);
    }

    public VmwareVmdk(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public VmwareVmdk(KaitaiStream _io, KaitaiStruct _parent, VmwareVmdk _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(magic(), new byte[] { 75, 68, 77, 86 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 75, 68, 77, 86 }, magic(), _io(), "/seq/0");
        }
        this.version = this._io.readS4le();
        this.flags = new HeaderFlags(this._io, this, _root);
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
    }

    /**
     * @see <a href="https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags">Source</a>
     */
    public static class HeaderFlags extends KaitaiStruct {
        public static HeaderFlags fromFile(String fileName) throws IOException {
            return new HeaderFlags(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.reserved1 = this._io.readBitsIntBe(5);
            this.zeroedGrainTableEntry = this._io.readBitsIntBe(1) != 0;
            this.useSecondaryGrainDir = this._io.readBitsIntBe(1) != 0;
            this.validNewLineDetectionTest = this._io.readBitsIntBe(1) != 0;
            this._io.alignToByte();
            this.reserved2 = this._io.readU1();
            this.reserved3 = this._io.readBitsIntBe(6);
            this.hasMetadata = this._io.readBitsIntBe(1) != 0;
            this.hasCompressedGrain = this._io.readBitsIntBe(1) != 0;
            this._io.alignToByte();
            this.reserved4 = this._io.readU1();
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
        public boolean zeroedGrainTableEntry() { return zeroedGrainTableEntry; }
        public boolean useSecondaryGrainDir() { return useSecondaryGrainDir; }
        public boolean validNewLineDetectionTest() { return validNewLineDetectionTest; }
        public int reserved2() { return reserved2; }
        public long reserved3() { return reserved3; }
        public boolean hasMetadata() { return hasMetadata; }
        public boolean hasCompressedGrain() { return hasCompressedGrain; }
        public int reserved4() { return reserved4; }
        public VmwareVmdk _root() { return _root; }
        public VmwareVmdk _parent() { return _parent; }
    }
    private Integer lenSector;
    public Integer lenSector() {
        if (this.lenSector != null)
            return this.lenSector;
        int _tmp = (int) (512);
        this.lenSector = _tmp;
        return this.lenSector;
    }
    private byte[] descriptor;
    public byte[] descriptor() {
        if (this.descriptor != null)
            return this.descriptor;
        long _pos = this._io.pos();
        this._io.seek((startDescriptor() * _root().lenSector()));
        this.descriptor = this._io.readBytes((sizeDescriptor() * _root().lenSector()));
        this._io.seek(_pos);
        return this.descriptor;
    }
    private byte[] grainPrimary;
    public byte[] grainPrimary() {
        if (this.grainPrimary != null)
            return this.grainPrimary;
        long _pos = this._io.pos();
        this._io.seek((startPrimaryGrain() * _root().lenSector()));
        this.grainPrimary = this._io.readBytes((sizeGrain() * _root().lenSector()));
        this._io.seek(_pos);
        return this.grainPrimary;
    }
    private byte[] grainSecondary;
    public byte[] grainSecondary() {
        if (this.grainSecondary != null)
            return this.grainSecondary;
        long _pos = this._io.pos();
        this._io.seek((startSecondaryGrain() * _root().lenSector()));
        this.grainSecondary = this._io.readBytes((sizeGrain() * _root().lenSector()));
        this._io.seek(_pos);
        return this.grainSecondary;
    }
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
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public int version() { return version; }
    public HeaderFlags flags() { return flags; }

    /**
     * Maximum number of sectors in a given image file (capacity)
     */
    public long sizeMax() { return sizeMax; }
    public long sizeGrain() { return sizeGrain; }

    /**
     * Embedded descriptor file start sector number (0 if not available)
     */
    public long startDescriptor() { return startDescriptor; }

    /**
     * Number of sectors that embedded descriptor file occupies
     */
    public long sizeDescriptor() { return sizeDescriptor; }

    /**
     * Number of grains table entries
     */
    public int numGrainTableEntries() { return numGrainTableEntries; }

    /**
     * Secondary (backup) grain directory start sector number
     */
    public long startSecondaryGrain() { return startSecondaryGrain; }

    /**
     * Primary grain directory start sector number
     */
    public long startPrimaryGrain() { return startPrimaryGrain; }
    public long sizeMetadata() { return sizeMetadata; }
    public int isDirty() { return isDirty; }
    public byte[] stuff() { return stuff; }
    public CompressionMethods compressionMethod() { return compressionMethod; }
    public VmwareVmdk _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
