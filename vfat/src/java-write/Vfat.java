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
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">Source</a>
 */
public class Vfat extends KaitaiStruct.ReadWrite {
    public static Vfat fromFile(String fileName) throws IOException {
        return new Vfat(new ByteBufferKaitaiStream(fileName));
    }
    public Vfat() {
        this(null, null, null);
    }

    public Vfat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Vfat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Vfat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Vfat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.bootSector = new BootSector(this._io, this, _root);
        this.bootSector._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.bootSector._fetchInstances();
        fats();
        if (this.fats != null) {
            for (int i = 0; i < this.fats.size(); i++) {
            }
        }
        rootDir();
        if (this.rootDir != null) {
            this.rootDir._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteFats = _enabledFats;
        _shouldWriteRootDir = _enabledRootDir;
        this.bootSector._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.bootSector._root(), _root()))
            throw new ConsistencyError("boot_sector", _root(), this.bootSector._root());
        if (!Objects.equals(this.bootSector._parent(), this))
            throw new ConsistencyError("boot_sector", this, this.bootSector._parent());
        if (_enabledFats) {
            if (this.fats.size() != bootSector().bpb().numFats())
                throw new ConsistencyError("fats", bootSector().bpb().numFats(), this.fats.size());
            for (int i = 0; i < this.fats.size(); i++) {
                if (this.fats.get(((Number) (i)).intValue()).length != bootSector().sizeFat())
                    throw new ConsistencyError("fats", bootSector().sizeFat(), this.fats.get(((Number) (i)).intValue()).length);
            }
        }
        if (_enabledRootDir) {
            if (!Objects.equals(this.rootDir._root(), _root()))
                throw new ConsistencyError("root_dir", _root(), this.rootDir._root());
            if (!Objects.equals(this.rootDir._parent(), this))
                throw new ConsistencyError("root_dir", this, this.rootDir._parent());
        }
        _dirty = false;
    }
    public static class BiosParamBlock extends KaitaiStruct.ReadWrite {
        public static BiosParamBlock fromFile(String fileName) throws IOException {
            return new BiosParamBlock(new ByteBufferKaitaiStream(fileName));
        }
        public BiosParamBlock() {
            this(null, null, null);
        }

        public BiosParamBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BiosParamBlock(KaitaiStream _io, Vfat.BootSector _parent) {
            this(_io, _parent, null);
        }

        public BiosParamBlock(KaitaiStream _io, Vfat.BootSector _parent, Vfat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.bytesPerLs = this._io.readU2le();
            this.lsPerClus = this._io.readU1();
            this.numReservedLs = this._io.readU2le();
            this.numFats = this._io.readU1();
            this.maxRootDirRec = this._io.readU2le();
            this.totalLs2 = this._io.readU2le();
            this.mediaCode = this._io.readU1();
            this.lsPerFat = this._io.readU2le();
            this.psPerTrack = this._io.readU2le();
            this.numHeads = this._io.readU2le();
            this.numHiddenSectors = this._io.readU4le();
            this.totalLs4 = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.bytesPerLs);
            this._io.writeU1(this.lsPerClus);
            this._io.writeU2le(this.numReservedLs);
            this._io.writeU1(this.numFats);
            this._io.writeU2le(this.maxRootDirRec);
            this._io.writeU2le(this.totalLs2);
            this._io.writeU1(this.mediaCode);
            this._io.writeU2le(this.lsPerFat);
            this._io.writeU2le(this.psPerTrack);
            this._io.writeU2le(this.numHeads);
            this._io.writeU4le(this.numHiddenSectors);
            this._io.writeU4le(this.totalLs4);
        }

        public void _check() {
            _dirty = false;
        }
        private int bytesPerLs;
        private int lsPerClus;
        private int numReservedLs;
        private int numFats;
        private int maxRootDirRec;
        private int totalLs2;
        private int mediaCode;
        private int lsPerFat;
        private int psPerTrack;
        private int numHeads;
        private long numHiddenSectors;
        private long totalLs4;
        private Vfat _root;
        private Vfat.BootSector _parent;

        /**
         * Bytes per logical sector
         */
        public int bytesPerLs() { return bytesPerLs; }
        public void setBytesPerLs(int _v) { _dirty = true; bytesPerLs = _v; }

        /**
         * Logical sectors per cluster
         */
        public int lsPerClus() { return lsPerClus; }
        public void setLsPerClus(int _v) { _dirty = true; lsPerClus = _v; }

        /**
         * Count of reserved logical sectors. The number of logical
         * sectors before the first FAT in the file system image.
         */
        public int numReservedLs() { return numReservedLs; }
        public void setNumReservedLs(int _v) { _dirty = true; numReservedLs = _v; }

        /**
         * Number of File Allocation Tables
         */
        public int numFats() { return numFats; }
        public void setNumFats(int _v) { _dirty = true; numFats = _v; }

        /**
         * Maximum number of FAT12 or FAT16 root directory entries. 0
         * for FAT32, where the root directory is stored in ordinary
         * data clusters.
         */
        public int maxRootDirRec() { return maxRootDirRec; }
        public void setMaxRootDirRec(int _v) { _dirty = true; maxRootDirRec = _v; }

        /**
         * Total logical sectors (if zero, use total_ls_4)
         */
        public int totalLs2() { return totalLs2; }
        public void setTotalLs2(int _v) { _dirty = true; totalLs2 = _v; }

        /**
         * Media descriptor
         */
        public int mediaCode() { return mediaCode; }
        public void setMediaCode(int _v) { _dirty = true; mediaCode = _v; }

        /**
         * Logical sectors per File Allocation Table for
         * FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
         * at offset 0x024 instead.
         */
        public int lsPerFat() { return lsPerFat; }
        public void setLsPerFat(int _v) { _dirty = true; lsPerFat = _v; }

        /**
         * Physical sectors per track for disks with INT 13h CHS
         * geometry, e.g., 15 for a "1.20 MB" (1200 KB) floppy. A zero
         * entry indicates that this entry is reserved, but not used.
         */
        public int psPerTrack() { return psPerTrack; }
        public void setPsPerTrack(int _v) { _dirty = true; psPerTrack = _v; }

        /**
         * Number of heads for disks with INT 13h CHS geometry,[9]
         * e.g., 2 for a double sided floppy.
         */
        public int numHeads() { return numHeads; }
        public void setNumHeads(int _v) { _dirty = true; numHeads = _v; }

        /**
         * Number of hidden sectors preceding the partition that
         * contains this FAT volume. This field should always be zero
         * on media that are not partitioned. This DOS 3.0 entry is
         * incompatible with a similar entry at offset 0x01C in BPBs
         * since DOS 3.31.  It must not be used if the logical sectors
         * entry at offset 0x013 is zero.
         */
        public long numHiddenSectors() { return numHiddenSectors; }
        public void setNumHiddenSectors(long _v) { _dirty = true; numHiddenSectors = _v; }

        /**
         * Total logical sectors including hidden sectors. This DOS 3.2
         * entry is incompatible with a similar entry at offset 0x020
         * in BPBs since DOS 3.31. It must not be used if the logical
         * sectors entry at offset 0x013 is zero.
         */
        public long totalLs4() { return totalLs4; }
        public void setTotalLs4(long _v) { _dirty = true; totalLs4 = _v; }
        public Vfat _root() { return _root; }
        public void set_root(Vfat _v) { _dirty = true; _root = _v; }
        public Vfat.BootSector _parent() { return _parent; }
        public void set_parent(Vfat.BootSector _v) { _dirty = true; _parent = _v; }
    }
    public static class BootSector extends KaitaiStruct.ReadWrite {
        public static BootSector fromFile(String fileName) throws IOException {
            return new BootSector(new ByteBufferKaitaiStream(fileName));
        }
        public BootSector() {
            this(null, null, null);
        }

        public BootSector(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BootSector(KaitaiStream _io, Vfat _parent) {
            this(_io, _parent, null);
        }

        public BootSector(KaitaiStream _io, Vfat _parent, Vfat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.jmpInstruction = this._io.readBytes(3);
            this.oemName = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 32), StandardCharsets.US_ASCII);
            this.bpb = new BiosParamBlock(this._io, this, _root);
            this.bpb._read();
            if (!(isFat32())) {
                this.ebpbFat16 = new ExtBiosParamBlockFat16(this._io, this, _root);
                this.ebpbFat16._read();
            }
            if (isFat32()) {
                this.ebpbFat32 = new ExtBiosParamBlockFat32(this._io, this, _root);
                this.ebpbFat32._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.bpb._fetchInstances();
            if (!(isFat32())) {
                this.ebpbFat16._fetchInstances();
            }
            if (isFat32()) {
                this.ebpbFat32._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.jmpInstruction);
            this._io.writeBytesLimit((this.oemName).getBytes(Charset.forName("ASCII")), 8, (byte) 32, (byte) 32);
            this.bpb._write_Seq(this._io);
            if (!(isFat32())) {
                this.ebpbFat16._write_Seq(this._io);
            }
            if (isFat32()) {
                this.ebpbFat32._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.jmpInstruction.length != 3)
                throw new ConsistencyError("jmp_instruction", 3, this.jmpInstruction.length);
            if ((this.oemName).getBytes(Charset.forName("ASCII")).length > 8)
                throw new ConsistencyError("oem_name", 8, (this.oemName).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.oemName).getBytes(Charset.forName("ASCII")).length != 0) && (((this.oemName).getBytes(Charset.forName("ASCII"))[((Number) ((this.oemName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 32)) )
                throw new ConsistencyError("oem_name", 32, ((this.oemName).getBytes(Charset.forName("ASCII"))[((Number) ((this.oemName).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            if (!Objects.equals(this.bpb._root(), _root()))
                throw new ConsistencyError("bpb", _root(), this.bpb._root());
            if (!Objects.equals(this.bpb._parent(), this))
                throw new ConsistencyError("bpb", this, this.bpb._parent());
            if (!(isFat32())) {
                if (!Objects.equals(this.ebpbFat16._root(), _root()))
                    throw new ConsistencyError("ebpb_fat16", _root(), this.ebpbFat16._root());
                if (!Objects.equals(this.ebpbFat16._parent(), this))
                    throw new ConsistencyError("ebpb_fat16", this, this.ebpbFat16._parent());
            }
            if (isFat32()) {
                if (!Objects.equals(this.ebpbFat32._root(), _root()))
                    throw new ConsistencyError("ebpb_fat32", _root(), this.ebpbFat32._root());
                if (!Objects.equals(this.ebpbFat32._parent(), this))
                    throw new ConsistencyError("ebpb_fat32", this, this.ebpbFat32._parent());
            }
            _dirty = false;
        }
        private Boolean isFat32;

        /**
         * Determines if filesystem is FAT32 (true) or FAT12/16 (false)
         * by analyzing some preliminary conditions in BPB. Used to
         * determine whether we should parse post-BPB data as
         * `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
         */
        public Boolean isFat32() {
            if (this.isFat32 != null)
                return this.isFat32;
            this.isFat32 = bpb().maxRootDirRec() == 0;
            return this.isFat32;
        }
        public void _invalidateIsFat32() { this.isFat32 = null; }
        private Long lsPerFat;
        public Long lsPerFat() {
            if (this.lsPerFat != null)
                return this.lsPerFat;
            this.lsPerFat = ((Number) ((isFat32() ? ebpbFat32().lsPerFat() : bpb().lsPerFat()))).longValue();
            return this.lsPerFat;
        }
        public void _invalidateLsPerFat() { this.lsPerFat = null; }
        private Integer lsPerRootDir;

        /**
         * Size of root directory in logical sectors
         * @see "FAT: General Overview of On-Disk Format, section "FAT Data Structure""
         */
        public Integer lsPerRootDir() {
            if (this.lsPerRootDir != null)
                return this.lsPerRootDir;
            this.lsPerRootDir = ((Number) (((bpb().maxRootDirRec() * 32 + bpb().bytesPerLs()) - 1) / bpb().bytesPerLs())).intValue();
            return this.lsPerRootDir;
        }
        public void _invalidateLsPerRootDir() { this.lsPerRootDir = null; }
        private Integer posFats;

        /**
         * Offset of FATs in bytes from start of filesystem
         */
        public Integer posFats() {
            if (this.posFats != null)
                return this.posFats;
            this.posFats = ((Number) (bpb().bytesPerLs() * bpb().numReservedLs())).intValue();
            return this.posFats;
        }
        public void _invalidatePosFats() { this.posFats = null; }
        private Integer posRootDir;

        /**
         * Offset of root directory in bytes from start of filesystem
         */
        public Integer posRootDir() {
            if (this.posRootDir != null)
                return this.posRootDir;
            this.posRootDir = ((Number) (bpb().bytesPerLs() * (bpb().numReservedLs() + lsPerFat() * bpb().numFats()))).intValue();
            return this.posRootDir;
        }
        public void _invalidatePosRootDir() { this.posRootDir = null; }
        private Integer sizeFat;

        /**
         * Size of one FAT in bytes
         */
        public Integer sizeFat() {
            if (this.sizeFat != null)
                return this.sizeFat;
            this.sizeFat = ((Number) (bpb().bytesPerLs() * lsPerFat())).intValue();
            return this.sizeFat;
        }
        public void _invalidateSizeFat() { this.sizeFat = null; }
        private Integer sizeRootDir;

        /**
         * Size of root directory in bytes
         */
        public Integer sizeRootDir() {
            if (this.sizeRootDir != null)
                return this.sizeRootDir;
            this.sizeRootDir = ((Number) (lsPerRootDir() * bpb().bytesPerLs())).intValue();
            return this.sizeRootDir;
        }
        public void _invalidateSizeRootDir() { this.sizeRootDir = null; }
        private byte[] jmpInstruction;
        private String oemName;
        private BiosParamBlock bpb;
        private ExtBiosParamBlockFat16 ebpbFat16;
        private ExtBiosParamBlockFat32 ebpbFat32;
        private Vfat _root;
        private Vfat _parent;
        public byte[] jmpInstruction() { return jmpInstruction; }
        public void setJmpInstruction(byte[] _v) { _dirty = true; jmpInstruction = _v; }
        public String oemName() { return oemName; }
        public void setOemName(String _v) { _dirty = true; oemName = _v; }

        /**
         * Basic BIOS parameter block, present in all versions of FAT
         */
        public BiosParamBlock bpb() { return bpb; }
        public void setBpb(BiosParamBlock _v) { _dirty = true; bpb = _v; }

        /**
         * FAT12/16-specific extended BIOS parameter block
         */
        public ExtBiosParamBlockFat16 ebpbFat16() { return ebpbFat16; }
        public void setEbpbFat16(ExtBiosParamBlockFat16 _v) { _dirty = true; ebpbFat16 = _v; }

        /**
         * FAT32-specific extended BIOS parameter block
         */
        public ExtBiosParamBlockFat32 ebpbFat32() { return ebpbFat32; }
        public void setEbpbFat32(ExtBiosParamBlockFat32 _v) { _dirty = true; ebpbFat32 = _v; }
        public Vfat _root() { return _root; }
        public void set_root(Vfat _v) { _dirty = true; _root = _v; }
        public Vfat _parent() { return _parent; }
        public void set_parent(Vfat _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
     * for FAT12 and FAT16.
     */
    public static class ExtBiosParamBlockFat16 extends KaitaiStruct.ReadWrite {
        public static ExtBiosParamBlockFat16 fromFile(String fileName) throws IOException {
            return new ExtBiosParamBlockFat16(new ByteBufferKaitaiStream(fileName));
        }
        public ExtBiosParamBlockFat16() {
            this(null, null, null);
        }

        public ExtBiosParamBlockFat16(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExtBiosParamBlockFat16(KaitaiStream _io, Vfat.BootSector _parent) {
            this(_io, _parent, null);
        }

        public ExtBiosParamBlockFat16(KaitaiStream _io, Vfat.BootSector _parent, Vfat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.physDriveNum = this._io.readU1();
            this.reserved1 = this._io.readU1();
            this.extBootSign = this._io.readU1();
            this.volumeId = this._io.readBytes(4);
            this.partitionVolumeLabel = new String(KaitaiStream.bytesStripRight(this._io.readBytes(11), (byte) 32), StandardCharsets.US_ASCII);
            this.fsTypeStr = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 32), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.physDriveNum);
            this._io.writeU1(this.reserved1);
            this._io.writeU1(this.extBootSign);
            this._io.writeBytes(this.volumeId);
            this._io.writeBytesLimit((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")), 11, (byte) 32, (byte) 32);
            this._io.writeBytesLimit((this.fsTypeStr).getBytes(Charset.forName("ASCII")), 8, (byte) 32, (byte) 32);
        }

        public void _check() {
            if (this.volumeId.length != 4)
                throw new ConsistencyError("volume_id", 4, this.volumeId.length);
            if ((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length > 11)
                throw new ConsistencyError("partition_volume_label", 11, (this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length != 0) && (((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII"))[((Number) ((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 32)) )
                throw new ConsistencyError("partition_volume_label", 32, ((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII"))[((Number) ((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            if ((this.fsTypeStr).getBytes(Charset.forName("ASCII")).length > 8)
                throw new ConsistencyError("fs_type_str", 8, (this.fsTypeStr).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.fsTypeStr).getBytes(Charset.forName("ASCII")).length != 0) && (((this.fsTypeStr).getBytes(Charset.forName("ASCII"))[((Number) ((this.fsTypeStr).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 32)) )
                throw new ConsistencyError("fs_type_str", 32, ((this.fsTypeStr).getBytes(Charset.forName("ASCII"))[((Number) ((this.fsTypeStr).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            _dirty = false;
        }
        private int physDriveNum;
        private int reserved1;
        private int extBootSign;
        private byte[] volumeId;
        private String partitionVolumeLabel;
        private String fsTypeStr;
        private Vfat _root;
        private Vfat.BootSector _parent;

        /**
         * Physical drive number (0x00 for (first) removable media,
         * 0x80 for (first) fixed disk as per INT 13h).
         */
        public int physDriveNum() { return physDriveNum; }
        public void setPhysDriveNum(int _v) { _dirty = true; physDriveNum = _v; }
        public int reserved1() { return reserved1; }
        public void setReserved1(int _v) { _dirty = true; reserved1 = _v; }

        /**
         * Should be 0x29 to indicate that an EBPB with the following 3
         * entries exists.
         */
        public int extBootSign() { return extBootSign; }
        public void setExtBootSign(int _v) { _dirty = true; extBootSign = _v; }

        /**
         * Volume ID (serial number).
         * 
         * Typically the serial number "xxxx-xxxx" is created by a
         * 16-bit addition of both DX values returned by INT 21h/AH=2Ah
         * (get system date) and INT 21h/AH=2Ch (get system time) for
         * the high word and another 16-bit addition of both CX values
         * for the low word of the serial number. Alternatively, some
         * DR-DOS disk utilities provide a /# option to generate a
         * human-readable time stamp "mmdd-hhmm" build from BCD-encoded
         * 8-bit values for the month, day, hour and minute instead of
         * a serial number.
         */
        public byte[] volumeId() { return volumeId; }
        public void setVolumeId(byte[] _v) { _dirty = true; volumeId = _v; }
        public String partitionVolumeLabel() { return partitionVolumeLabel; }
        public void setPartitionVolumeLabel(String _v) { _dirty = true; partitionVolumeLabel = _v; }
        public String fsTypeStr() { return fsTypeStr; }
        public void setFsTypeStr(String _v) { _dirty = true; fsTypeStr = _v; }
        public Vfat _root() { return _root; }
        public void set_root(Vfat _v) { _dirty = true; _root = _v; }
        public Vfat.BootSector _parent() { return _parent; }
        public void set_parent(Vfat.BootSector _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Extended BIOS Parameter Block for FAT32
     */
    public static class ExtBiosParamBlockFat32 extends KaitaiStruct.ReadWrite {
        public static ExtBiosParamBlockFat32 fromFile(String fileName) throws IOException {
            return new ExtBiosParamBlockFat32(new ByteBufferKaitaiStream(fileName));
        }
        public ExtBiosParamBlockFat32() {
            this(null, null, null);
        }

        public ExtBiosParamBlockFat32(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExtBiosParamBlockFat32(KaitaiStream _io, Vfat.BootSector _parent) {
            this(_io, _parent, null);
        }

        public ExtBiosParamBlockFat32(KaitaiStream _io, Vfat.BootSector _parent, Vfat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lsPerFat = this._io.readU4le();
            this.hasActiveFat = this._io.readBitsIntLe(1) != 0;
            this.reserved1 = this._io.readBitsIntLe(3);
            this.activeFatId = this._io.readBitsIntLe(4);
            this.reserved2 = this._io.readBytes(1);
            if (!(Arrays.equals(this.reserved2, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.reserved2, this._io, "/types/ext_bios_param_block_fat32/seq/4");
            }
            this.fatVersion = this._io.readU2le();
            this.rootDirStartClus = this._io.readU4le();
            this.lsFsInfo = this._io.readU2le();
            this.bootSectorsCopyStartLs = this._io.readU2le();
            this.reserved3 = this._io.readBytes(12);
            this.physDriveNum = this._io.readU1();
            this.reserved4 = this._io.readU1();
            this.extBootSign = this._io.readU1();
            this.volumeId = this._io.readBytes(4);
            this.partitionVolumeLabel = new String(KaitaiStream.bytesStripRight(this._io.readBytes(11), (byte) 32), StandardCharsets.US_ASCII);
            this.fsTypeStr = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 32), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lsPerFat);
            this._io.writeBitsIntLe(1, (this.hasActiveFat ? 1 : 0));
            this._io.writeBitsIntLe(3, this.reserved1);
            this._io.writeBitsIntLe(4, this.activeFatId);
            this._io.writeBytes(this.reserved2);
            this._io.writeU2le(this.fatVersion);
            this._io.writeU4le(this.rootDirStartClus);
            this._io.writeU2le(this.lsFsInfo);
            this._io.writeU2le(this.bootSectorsCopyStartLs);
            this._io.writeBytes(this.reserved3);
            this._io.writeU1(this.physDriveNum);
            this._io.writeU1(this.reserved4);
            this._io.writeU1(this.extBootSign);
            this._io.writeBytes(this.volumeId);
            this._io.writeBytesLimit((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")), 11, (byte) 32, (byte) 32);
            this._io.writeBytesLimit((this.fsTypeStr).getBytes(Charset.forName("ASCII")), 8, (byte) 32, (byte) 32);
        }

        public void _check() {
            if (this.reserved2.length != 1)
                throw new ConsistencyError("reserved2", 1, this.reserved2.length);
            if (!(Arrays.equals(this.reserved2, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.reserved2, null, "/types/ext_bios_param_block_fat32/seq/4");
            }
            if (this.reserved3.length != 12)
                throw new ConsistencyError("reserved3", 12, this.reserved3.length);
            if (this.volumeId.length != 4)
                throw new ConsistencyError("volume_id", 4, this.volumeId.length);
            if ((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length > 11)
                throw new ConsistencyError("partition_volume_label", 11, (this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length != 0) && (((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII"))[((Number) ((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 32)) )
                throw new ConsistencyError("partition_volume_label", 32, ((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII"))[((Number) ((this.partitionVolumeLabel).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            if ((this.fsTypeStr).getBytes(Charset.forName("ASCII")).length > 8)
                throw new ConsistencyError("fs_type_str", 8, (this.fsTypeStr).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.fsTypeStr).getBytes(Charset.forName("ASCII")).length != 0) && (((this.fsTypeStr).getBytes(Charset.forName("ASCII"))[((Number) ((this.fsTypeStr).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 32)) )
                throw new ConsistencyError("fs_type_str", 32, ((this.fsTypeStr).getBytes(Charset.forName("ASCII"))[((Number) ((this.fsTypeStr).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            _dirty = false;
        }
        private long lsPerFat;
        private boolean hasActiveFat;
        private long reserved1;
        private long activeFatId;
        private byte[] reserved2;
        private int fatVersion;
        private long rootDirStartClus;
        private int lsFsInfo;
        private int bootSectorsCopyStartLs;
        private byte[] reserved3;
        private int physDriveNum;
        private int reserved4;
        private int extBootSign;
        private byte[] volumeId;
        private String partitionVolumeLabel;
        private String fsTypeStr;
        private Vfat _root;
        private Vfat.BootSector _parent;

        /**
         * Logical sectors per file allocation table (corresponds with
         * the old entry `ls_per_fat` in the DOS 2.0 BPB).
         */
        public long lsPerFat() { return lsPerFat; }
        public void setLsPerFat(long _v) { _dirty = true; lsPerFat = _v; }

        /**
         * If true, then there is "active" FAT, which is designated in
         * `active_fat` attribute. If false, all FATs are mirrored as
         * usual.
         */
        public boolean hasActiveFat() { return hasActiveFat; }
        public void setHasActiveFat(boolean _v) { _dirty = true; hasActiveFat = _v; }
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }

        /**
         * Zero-based number of active FAT, if `has_active_fat`
         * attribute is true.
         */
        public long activeFatId() { return activeFatId; }
        public void setActiveFatId(long _v) { _dirty = true; activeFatId = _v; }
        public byte[] reserved2() { return reserved2; }
        public void setReserved2(byte[] _v) { _dirty = true; reserved2 = _v; }
        public int fatVersion() { return fatVersion; }
        public void setFatVersion(int _v) { _dirty = true; fatVersion = _v; }

        /**
         * Cluster number of root directory start, typically 2 if it
         * contains no bad sector. (Microsoft's FAT32 implementation
         * imposes an artificial limit of 65,535 entries per directory,
         * whilst many third-party implementations do not.)
         */
        public long rootDirStartClus() { return rootDirStartClus; }
        public void setRootDirStartClus(long _v) { _dirty = true; rootDirStartClus = _v; }

        /**
         * Logical sector number of FS Information Sector, typically 1,
         * i.e., the second of the three FAT32 boot sectors. Values
         * like 0 and 0xFFFF are used by some FAT32 implementations to
         * designate abscence of FS Information Sector.
         */
        public int lsFsInfo() { return lsFsInfo; }
        public void setLsFsInfo(int _v) { _dirty = true; lsFsInfo = _v; }

        /**
         * First logical sector number of a copy of the three FAT32
         * boot sectors, typically 6.
         */
        public int bootSectorsCopyStartLs() { return bootSectorsCopyStartLs; }
        public void setBootSectorsCopyStartLs(int _v) { _dirty = true; bootSectorsCopyStartLs = _v; }
        public byte[] reserved3() { return reserved3; }
        public void setReserved3(byte[] _v) { _dirty = true; reserved3 = _v; }

        /**
         * Physical drive number (0x00 for (first) removable media,
         * 0x80 for (first) fixed disk as per INT 13h).
         */
        public int physDriveNum() { return physDriveNum; }
        public void setPhysDriveNum(int _v) { _dirty = true; physDriveNum = _v; }
        public int reserved4() { return reserved4; }
        public void setReserved4(int _v) { _dirty = true; reserved4 = _v; }

        /**
         * Should be 0x29 to indicate that an EBPB with the following 3
         * entries exists.
         */
        public int extBootSign() { return extBootSign; }
        public void setExtBootSign(int _v) { _dirty = true; extBootSign = _v; }

        /**
         * Volume ID (serial number).
         * 
         * Typically the serial number "xxxx-xxxx" is created by a
         * 16-bit addition of both DX values returned by INT 21h/AH=2Ah
         * (get system date) and INT 21h/AH=2Ch (get system time) for
         * the high word and another 16-bit addition of both CX values
         * for the low word of the serial number. Alternatively, some
         * DR-DOS disk utilities provide a /# option to generate a
         * human-readable time stamp "mmdd-hhmm" build from BCD-encoded
         * 8-bit values for the month, day, hour and minute instead of
         * a serial number.
         */
        public byte[] volumeId() { return volumeId; }
        public void setVolumeId(byte[] _v) { _dirty = true; volumeId = _v; }
        public String partitionVolumeLabel() { return partitionVolumeLabel; }
        public void setPartitionVolumeLabel(String _v) { _dirty = true; partitionVolumeLabel = _v; }
        public String fsTypeStr() { return fsTypeStr; }
        public void setFsTypeStr(String _v) { _dirty = true; fsTypeStr = _v; }
        public Vfat _root() { return _root; }
        public void set_root(Vfat _v) { _dirty = true; _root = _v; }
        public Vfat.BootSector _parent() { return _parent; }
        public void set_parent(Vfat.BootSector _v) { _dirty = true; _parent = _v; }
    }
    public static class RootDirectory extends KaitaiStruct.ReadWrite {
        public static RootDirectory fromFile(String fileName) throws IOException {
            return new RootDirectory(new ByteBufferKaitaiStream(fileName));
        }
        public RootDirectory() {
            this(null, null, null);
        }

        public RootDirectory(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RootDirectory(KaitaiStream _io, Vfat _parent) {
            this(_io, _parent, null);
        }

        public RootDirectory(KaitaiStream _io, Vfat _parent, Vfat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.records = new ArrayList<RootDirectoryRec>();
            for (int i = 0; i < _root().bootSector().bpb().maxRootDirRec(); i++) {
                RootDirectoryRec _t_records = new RootDirectoryRec(this._io, this, _root);
                try {
                    _t_records._read();
                } finally {
                    this.records.add(_t_records);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.records.size(); i++) {
                this.records.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.records.size(); i++) {
                this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.records.size() != _root().bootSector().bpb().maxRootDirRec())
                throw new ConsistencyError("records", _root().bootSector().bpb().maxRootDirRec(), this.records.size());
            for (int i = 0; i < this.records.size(); i++) {
                if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<RootDirectoryRec> records;
        private Vfat _root;
        private Vfat _parent;
        public List<RootDirectoryRec> records() { return records; }
        public void setRecords(List<RootDirectoryRec> _v) { _dirty = true; records = _v; }
        public Vfat _root() { return _root; }
        public void set_root(Vfat _v) { _dirty = true; _root = _v; }
        public Vfat _parent() { return _parent; }
        public void set_parent(Vfat _v) { _dirty = true; _parent = _v; }
    }
    public static class RootDirectoryRec extends KaitaiStruct.ReadWrite {
        public static RootDirectoryRec fromFile(String fileName) throws IOException {
            return new RootDirectoryRec(new ByteBufferKaitaiStream(fileName));
        }
        public RootDirectoryRec() {
            this(null, null, null);
        }

        public RootDirectoryRec(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RootDirectoryRec(KaitaiStream _io, Vfat.RootDirectory _parent) {
            this(_io, _parent, null);
        }

        public RootDirectoryRec(KaitaiStream _io, Vfat.RootDirectory _parent, Vfat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.fileName = this._io.readBytes(11);
            this._raw_attrs = this._io.readBytes(1);
            KaitaiStream _io__raw_attrs = new ByteBufferKaitaiStream(this._raw_attrs);
            this.attrs = new AttrFlags(_io__raw_attrs, this, _root);
            this.attrs._read();
            this.reserved = this._io.readBytes(10);
            this._raw_lastWriteTime = this._io.readBytes(4);
            KaitaiStream _io__raw_lastWriteTime = new ByteBufferKaitaiStream(this._raw_lastWriteTime);
            this.lastWriteTime = new DosDatetime(_io__raw_lastWriteTime);
            this.lastWriteTime._read();
            this.startClus = this._io.readU2le();
            this.fileSize = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.attrs._fetchInstances();
            this.lastWriteTime._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.fileName);
            final KaitaiStream _io__raw_attrs = new ByteBufferKaitaiStream(1);
            this._io.addChildStream(_io__raw_attrs);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (1));
                final RootDirectoryRec _this = this;
                _io__raw_attrs.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_attrs = _io__raw_attrs.toByteArray();
                        if (_this._raw_attrs.length != 1)
                            throw new ConsistencyError("raw(attrs)", 1, _this._raw_attrs.length);
                        parent.writeBytes(_this._raw_attrs);
                    }
                });
            }
            this.attrs._write_Seq(_io__raw_attrs);
            this._io.writeBytes(this.reserved);
            final KaitaiStream _io__raw_lastWriteTime = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_lastWriteTime);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final RootDirectoryRec _this = this;
                _io__raw_lastWriteTime.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_lastWriteTime = _io__raw_lastWriteTime.toByteArray();
                        if (_this._raw_lastWriteTime.length != 4)
                            throw new ConsistencyError("raw(last_write_time)", 4, _this._raw_lastWriteTime.length);
                        parent.writeBytes(_this._raw_lastWriteTime);
                    }
                });
            }
            this.lastWriteTime._write_Seq(_io__raw_lastWriteTime);
            this._io.writeU2le(this.startClus);
            this._io.writeU4le(this.fileSize);
        }

        public void _check() {
            if (this.fileName.length != 11)
                throw new ConsistencyError("file_name", 11, this.fileName.length);
            if (!Objects.equals(this.attrs._root(), _root()))
                throw new ConsistencyError("attrs", _root(), this.attrs._root());
            if (!Objects.equals(this.attrs._parent(), this))
                throw new ConsistencyError("attrs", this, this.attrs._parent());
            if (this.reserved.length != 10)
                throw new ConsistencyError("reserved", 10, this.reserved.length);
            _dirty = false;
        }
        public static class AttrFlags extends KaitaiStruct.ReadWrite {
            public static AttrFlags fromFile(String fileName) throws IOException {
                return new AttrFlags(new ByteBufferKaitaiStream(fileName));
            }
            public AttrFlags() {
                this(null, null, null);
            }

            public AttrFlags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public AttrFlags(KaitaiStream _io, Vfat.RootDirectoryRec _parent) {
                this(_io, _parent, null);
            }

            public AttrFlags(KaitaiStream _io, Vfat.RootDirectoryRec _parent, Vfat _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.readOnly = this._io.readBitsIntLe(1) != 0;
                this.hidden = this._io.readBitsIntLe(1) != 0;
                this.system = this._io.readBitsIntLe(1) != 0;
                this.volumeId = this._io.readBitsIntLe(1) != 0;
                this.isDirectory = this._io.readBitsIntLe(1) != 0;
                this.archive = this._io.readBitsIntLe(1) != 0;
                this.reserved = this._io.readBitsIntLe(2);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntLe(1, (this.readOnly ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.hidden ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.system ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.volumeId ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.isDirectory ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.archive ? 1 : 0));
                this._io.writeBitsIntLe(2, this.reserved);
            }

            public void _check() {
                _dirty = false;
            }
            private Boolean longName;
            public Boolean longName() {
                if (this.longName != null)
                    return this.longName;
                this.longName =  ((readOnly()) && (hidden()) && (system()) && (volumeId())) ;
                return this.longName;
            }
            public void _invalidateLongName() { this.longName = null; }
            private boolean readOnly;
            private boolean hidden;
            private boolean system;
            private boolean volumeId;
            private boolean isDirectory;
            private boolean archive;
            private long reserved;
            private Vfat _root;
            private Vfat.RootDirectoryRec _parent;
            public boolean readOnly() { return readOnly; }
            public void setReadOnly(boolean _v) { _dirty = true; readOnly = _v; }
            public boolean hidden() { return hidden; }
            public void setHidden(boolean _v) { _dirty = true; hidden = _v; }
            public boolean system() { return system; }
            public void setSystem(boolean _v) { _dirty = true; system = _v; }
            public boolean volumeId() { return volumeId; }
            public void setVolumeId(boolean _v) { _dirty = true; volumeId = _v; }
            public boolean isDirectory() { return isDirectory; }
            public void setIsDirectory(boolean _v) { _dirty = true; isDirectory = _v; }
            public boolean archive() { return archive; }
            public void setArchive(boolean _v) { _dirty = true; archive = _v; }
            public long reserved() { return reserved; }
            public void setReserved(long _v) { _dirty = true; reserved = _v; }
            public Vfat _root() { return _root; }
            public void set_root(Vfat _v) { _dirty = true; _root = _v; }
            public Vfat.RootDirectoryRec _parent() { return _parent; }
            public void set_parent(Vfat.RootDirectoryRec _v) { _dirty = true; _parent = _v; }
        }
        private byte[] fileName;
        private AttrFlags attrs;
        private byte[] reserved;
        private DosDatetime lastWriteTime;
        private int startClus;
        private long fileSize;
        private Vfat _root;
        private Vfat.RootDirectory _parent;
        private byte[] _raw_attrs;
        private byte[] _raw_lastWriteTime;
        public byte[] fileName() { return fileName; }
        public void setFileName(byte[] _v) { _dirty = true; fileName = _v; }
        public AttrFlags attrs() { return attrs; }
        public void setAttrs(AttrFlags _v) { _dirty = true; attrs = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public DosDatetime lastWriteTime() { return lastWriteTime; }
        public void setLastWriteTime(DosDatetime _v) { _dirty = true; lastWriteTime = _v; }
        public int startClus() { return startClus; }
        public void setStartClus(int _v) { _dirty = true; startClus = _v; }
        public long fileSize() { return fileSize; }
        public void setFileSize(long _v) { _dirty = true; fileSize = _v; }
        public Vfat _root() { return _root; }
        public void set_root(Vfat _v) { _dirty = true; _root = _v; }
        public Vfat.RootDirectory _parent() { return _parent; }
        public void set_parent(Vfat.RootDirectory _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_attrs() { return _raw_attrs; }
        public void set_raw_Attrs(byte[] _v) { _dirty = true; _raw_attrs = _v; }
        public byte[] _raw_lastWriteTime() { return _raw_lastWriteTime; }
        public void set_raw_LastWriteTime(byte[] _v) { _dirty = true; _raw_lastWriteTime = _v; }
    }
    private List<byte[]> fats;
    private boolean _shouldWriteFats = false;
    private boolean _enabledFats = true;
    public List<byte[]> fats() {
        if (_shouldWriteFats)
            _writeFats();
        if (this.fats != null)
            return this.fats;
        if (!_enabledFats)
            return null;
        long _pos = this._io.pos();
        this._io.seek(bootSector().posFats());
        this.fats = new ArrayList<byte[]>();
        for (int i = 0; i < bootSector().bpb().numFats(); i++) {
            this.fats.add(this._io.readBytes(bootSector().sizeFat()));
        }
        this._io.seek(_pos);
        return this.fats;
    }
    public void setFats(List<byte[]> _v) { _dirty = true; fats = _v; }
    public void setFats_Enabled(boolean _v) { _dirty = true; _enabledFats = _v; }

    private void _writeFats() {
        _shouldWriteFats = false;
        long _pos = this._io.pos();
        this._io.seek(bootSector().posFats());
        for (int i = 0; i < this.fats.size(); i++) {
            this._io.writeBytes(this.fats.get(((Number) (i)).intValue()));
        }
        this._io.seek(_pos);
    }
    private RootDirectory rootDir;
    private boolean _shouldWriteRootDir = false;
    private boolean _enabledRootDir = true;
    public RootDirectory rootDir() {
        if (_shouldWriteRootDir)
            _writeRootDir();
        if (this.rootDir != null)
            return this.rootDir;
        if (!_enabledRootDir)
            return null;
        long _pos = this._io.pos();
        this._io.seek(bootSector().posRootDir());
        this._raw_rootDir = this._io.readBytes(bootSector().sizeRootDir());
        KaitaiStream _io__raw_rootDir = new ByteBufferKaitaiStream(this._raw_rootDir);
        this.rootDir = new RootDirectory(_io__raw_rootDir, this, _root);
        this.rootDir._read();
        this._io.seek(_pos);
        return this.rootDir;
    }
    public void setRootDir(RootDirectory _v) { _dirty = true; rootDir = _v; }
    public void setRootDir_Enabled(boolean _v) { _dirty = true; _enabledRootDir = _v; }

    private void _writeRootDir() {
        _shouldWriteRootDir = false;
        long _pos = this._io.pos();
        this._io.seek(bootSector().posRootDir());
        final KaitaiStream _io__raw_rootDir = new ByteBufferKaitaiStream(bootSector().sizeRootDir());
        this._io.addChildStream(_io__raw_rootDir);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (bootSector().sizeRootDir()));
            final Vfat _this = this;
            _io__raw_rootDir.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_rootDir = _io__raw_rootDir.toByteArray();
                    if (_this._raw_rootDir.length != bootSector().sizeRootDir())
                        throw new ConsistencyError("raw(root_dir)", bootSector().sizeRootDir(), _this._raw_rootDir.length);
                    parent.writeBytes(_this._raw_rootDir);
                }
            });
        }
        this.rootDir._write_Seq(_io__raw_rootDir);
        this._io.seek(_pos);
    }
    private BootSector bootSector;
    private Vfat _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_rootDir;
    public BootSector bootSector() { return bootSector; }
    public void setBootSector(BootSector _v) { _dirty = true; bootSector = _v; }
    public Vfat _root() { return _root; }
    public void set_root(Vfat _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_rootDir() { return _raw_rootDir; }
    public void set_raw_RootDir(byte[] _v) { _dirty = true; _raw_rootDir = _v; }
}
