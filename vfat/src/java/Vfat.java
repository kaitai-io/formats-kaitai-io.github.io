// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * @see <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">Source</a>
 */
public class Vfat extends KaitaiStruct {
    public static Vfat fromFile(String fileName) throws IOException {
        return new Vfat(new ByteBufferKaitaiStream(fileName));
    }

    public Vfat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Vfat(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Vfat(KaitaiStream _io, KaitaiStruct _parent, Vfat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.bootSector = new BootSector(this._io, this, _root);
    }

    /**
     * Extended BIOS Parameter Block for FAT32
     */
    public static class ExtBiosParamBlockFat32 extends KaitaiStruct {
        public static ExtBiosParamBlockFat32 fromFile(String fileName) throws IOException {
            return new ExtBiosParamBlockFat32(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lsPerFat = this._io.readU4le();
            this.hasActiveFat = this._io.readBitsIntLe(1) != 0;
            this.reserved1 = this._io.readBitsIntLe(3);
            this.activeFatId = this._io.readBitsIntLe(4);
            this._io.alignToByte();
            this.reserved2 = this._io.readBytes(1);
            if (!(Arrays.equals(reserved2(), new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, reserved2(), _io(), "/types/ext_bios_param_block_fat32/seq/4");
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
            this.partitionVolumeLabel = new String(KaitaiStream.bytesStripRight(this._io.readBytes(11), (byte) 32), Charset.forName("ASCII"));
            this.fsTypeStr = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 32), Charset.forName("ASCII"));
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

        /**
         * If true, then there is "active" FAT, which is designated in
         * `active_fat` attribute. If false, all FATs are mirrored as
         * usual.
         */
        public boolean hasActiveFat() { return hasActiveFat; }
        public long reserved1() { return reserved1; }

        /**
         * Zero-based number of active FAT, if `has_active_fat`
         * attribute is true.
         */
        public long activeFatId() { return activeFatId; }
        public byte[] reserved2() { return reserved2; }
        public int fatVersion() { return fatVersion; }

        /**
         * Cluster number of root directory start, typically 2 if it
         * contains no bad sector. (Microsoft's FAT32 implementation
         * imposes an artificial limit of 65,535 entries per directory,
         * whilst many third-party implementations do not.)
         */
        public long rootDirStartClus() { return rootDirStartClus; }

        /**
         * Logical sector number of FS Information Sector, typically 1,
         * i.e., the second of the three FAT32 boot sectors. Values
         * like 0 and 0xFFFF are used by some FAT32 implementations to
         * designate abscence of FS Information Sector.
         */
        public int lsFsInfo() { return lsFsInfo; }

        /**
         * First logical sector number of a copy of the three FAT32
         * boot sectors, typically 6.
         */
        public int bootSectorsCopyStartLs() { return bootSectorsCopyStartLs; }
        public byte[] reserved3() { return reserved3; }

        /**
         * Physical drive number (0x00 for (first) removable media,
         * 0x80 for (first) fixed disk as per INT 13h).
         */
        public int physDriveNum() { return physDriveNum; }
        public int reserved4() { return reserved4; }

        /**
         * Should be 0x29 to indicate that an EBPB with the following 3
         * entries exists.
         */
        public int extBootSign() { return extBootSign; }

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
        public String partitionVolumeLabel() { return partitionVolumeLabel; }
        public String fsTypeStr() { return fsTypeStr; }
        public Vfat _root() { return _root; }
        public Vfat.BootSector _parent() { return _parent; }
    }
    public static class BootSector extends KaitaiStruct {
        public static BootSector fromFile(String fileName) throws IOException {
            return new BootSector(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.jmpInstruction = this._io.readBytes(3);
            this.oemName = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 32), Charset.forName("ASCII"));
            this.bpb = new BiosParamBlock(this._io, this, _root);
            if (!(isFat32())) {
                this.ebpbFat16 = new ExtBiosParamBlockFat16(this._io, this, _root);
            }
            if (isFat32()) {
                this.ebpbFat32 = new ExtBiosParamBlockFat32(this._io, this, _root);
            }
        }
        private Integer posFats;

        /**
         * Offset of FATs in bytes from start of filesystem
         */
        public Integer posFats() {
            if (this.posFats != null)
                return this.posFats;
            int _tmp = (int) ((bpb().bytesPerLs() * bpb().numReservedLs()));
            this.posFats = _tmp;
            return this.posFats;
        }
        private Long lsPerFat;
        public Long lsPerFat() {
            if (this.lsPerFat != null)
                return this.lsPerFat;
            long _tmp = (long) ((isFat32() ? ebpbFat32().lsPerFat() : bpb().lsPerFat()));
            this.lsPerFat = _tmp;
            return this.lsPerFat;
        }
        private Integer lsPerRootDir;

        /**
         * Size of root directory in logical sectors
         * @see "FAT: General Overview of On-Disk Format, section "FAT Data Structure""
         */
        public Integer lsPerRootDir() {
            if (this.lsPerRootDir != null)
                return this.lsPerRootDir;
            int _tmp = (int) (((((bpb().maxRootDirRec() * 32) + bpb().bytesPerLs()) - 1) / bpb().bytesPerLs()));
            this.lsPerRootDir = _tmp;
            return this.lsPerRootDir;
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
            boolean _tmp = (boolean) (bpb().maxRootDirRec() == 0);
            this.isFat32 = _tmp;
            return this.isFat32;
        }
        private Integer sizeFat;

        /**
         * Size of one FAT in bytes
         */
        public Integer sizeFat() {
            if (this.sizeFat != null)
                return this.sizeFat;
            int _tmp = (int) ((bpb().bytesPerLs() * lsPerFat()));
            this.sizeFat = _tmp;
            return this.sizeFat;
        }
        private Integer posRootDir;

        /**
         * Offset of root directory in bytes from start of filesystem
         */
        public Integer posRootDir() {
            if (this.posRootDir != null)
                return this.posRootDir;
            int _tmp = (int) ((bpb().bytesPerLs() * (bpb().numReservedLs() + (lsPerFat() * bpb().numFats()))));
            this.posRootDir = _tmp;
            return this.posRootDir;
        }
        private Integer sizeRootDir;

        /**
         * Size of root directory in bytes
         */
        public Integer sizeRootDir() {
            if (this.sizeRootDir != null)
                return this.sizeRootDir;
            int _tmp = (int) ((lsPerRootDir() * bpb().bytesPerLs()));
            this.sizeRootDir = _tmp;
            return this.sizeRootDir;
        }
        private byte[] jmpInstruction;
        private String oemName;
        private BiosParamBlock bpb;
        private ExtBiosParamBlockFat16 ebpbFat16;
        private ExtBiosParamBlockFat32 ebpbFat32;
        private Vfat _root;
        private Vfat _parent;
        public byte[] jmpInstruction() { return jmpInstruction; }
        public String oemName() { return oemName; }

        /**
         * Basic BIOS parameter block, present in all versions of FAT
         */
        public BiosParamBlock bpb() { return bpb; }

        /**
         * FAT12/16-specific extended BIOS parameter block
         */
        public ExtBiosParamBlockFat16 ebpbFat16() { return ebpbFat16; }

        /**
         * FAT32-specific extended BIOS parameter block
         */
        public ExtBiosParamBlockFat32 ebpbFat32() { return ebpbFat32; }
        public Vfat _root() { return _root; }
        public Vfat _parent() { return _parent; }
    }
    public static class BiosParamBlock extends KaitaiStruct {
        public static BiosParamBlock fromFile(String fileName) throws IOException {
            return new BiosParamBlock(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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

        /**
         * Logical sectors per cluster
         */
        public int lsPerClus() { return lsPerClus; }

        /**
         * Count of reserved logical sectors. The number of logical
         * sectors before the first FAT in the file system image.
         */
        public int numReservedLs() { return numReservedLs; }

        /**
         * Number of File Allocation Tables
         */
        public int numFats() { return numFats; }

        /**
         * Maximum number of FAT12 or FAT16 root directory entries. 0
         * for FAT32, where the root directory is stored in ordinary
         * data clusters.
         */
        public int maxRootDirRec() { return maxRootDirRec; }

        /**
         * Total logical sectors (if zero, use total_ls_4)
         */
        public int totalLs2() { return totalLs2; }

        /**
         * Media descriptor
         */
        public int mediaCode() { return mediaCode; }

        /**
         * Logical sectors per File Allocation Table for
         * FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
         * at offset 0x024 instead.
         */
        public int lsPerFat() { return lsPerFat; }

        /**
         * Physical sectors per track for disks with INT 13h CHS
         * geometry, e.g., 15 for a "1.20 MB" (1200 KB) floppy. A zero
         * entry indicates that this entry is reserved, but not used.
         */
        public int psPerTrack() { return psPerTrack; }

        /**
         * Number of heads for disks with INT 13h CHS geometry,[9]
         * e.g., 2 for a double sided floppy.
         */
        public int numHeads() { return numHeads; }

        /**
         * Number of hidden sectors preceding the partition that
         * contains this FAT volume. This field should always be zero
         * on media that are not partitioned. This DOS 3.0 entry is
         * incompatible with a similar entry at offset 0x01C in BPBs
         * since DOS 3.31.  It must not be used if the logical sectors
         * entry at offset 0x013 is zero.
         */
        public long numHiddenSectors() { return numHiddenSectors; }

        /**
         * Total logical sectors including hidden sectors. This DOS 3.2
         * entry is incompatible with a similar entry at offset 0x020
         * in BPBs since DOS 3.31. It must not be used if the logical
         * sectors entry at offset 0x013 is zero.
         */
        public long totalLs4() { return totalLs4; }
        public Vfat _root() { return _root; }
        public Vfat.BootSector _parent() { return _parent; }
    }
    public static class RootDirectoryRec extends KaitaiStruct {
        public static RootDirectoryRec fromFile(String fileName) throws IOException {
            return new RootDirectoryRec(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.fileName = this._io.readBytes(11);
            this._raw_attrs = this._io.readBytes(1);
            KaitaiStream _io__raw_attrs = new ByteBufferKaitaiStream(_raw_attrs);
            this.attrs = new AttrFlags(_io__raw_attrs, this, _root);
            this.reserved = this._io.readBytes(10);
            this._raw_lastWriteTime = this._io.readBytes(4);
            KaitaiStream _io__raw_lastWriteTime = new ByteBufferKaitaiStream(_raw_lastWriteTime);
            this.lastWriteTime = new DosDatetime(_io__raw_lastWriteTime);
            this.startClus = this._io.readU2le();
            this.fileSize = this._io.readU4le();
        }
        public static class AttrFlags extends KaitaiStruct {
            public static AttrFlags fromFile(String fileName) throws IOException {
                return new AttrFlags(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.readOnly = this._io.readBitsIntLe(1) != 0;
                this.hidden = this._io.readBitsIntLe(1) != 0;
                this.system = this._io.readBitsIntLe(1) != 0;
                this.volumeId = this._io.readBitsIntLe(1) != 0;
                this.isDirectory = this._io.readBitsIntLe(1) != 0;
                this.archive = this._io.readBitsIntLe(1) != 0;
                this.reserved = this._io.readBitsIntLe(2);
            }
            private Boolean longName;
            public Boolean longName() {
                if (this.longName != null)
                    return this.longName;
                boolean _tmp = (boolean) ( ((readOnly()) && (hidden()) && (system()) && (volumeId())) );
                this.longName = _tmp;
                return this.longName;
            }
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
            public boolean hidden() { return hidden; }
            public boolean system() { return system; }
            public boolean volumeId() { return volumeId; }
            public boolean isDirectory() { return isDirectory; }
            public boolean archive() { return archive; }
            public long reserved() { return reserved; }
            public Vfat _root() { return _root; }
            public Vfat.RootDirectoryRec _parent() { return _parent; }
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
        public AttrFlags attrs() { return attrs; }
        public byte[] reserved() { return reserved; }
        public DosDatetime lastWriteTime() { return lastWriteTime; }
        public int startClus() { return startClus; }
        public long fileSize() { return fileSize; }
        public Vfat _root() { return _root; }
        public Vfat.RootDirectory _parent() { return _parent; }
        public byte[] _raw_attrs() { return _raw_attrs; }
        public byte[] _raw_lastWriteTime() { return _raw_lastWriteTime; }
    }
    public static class RootDirectory extends KaitaiStruct {
        public static RootDirectory fromFile(String fileName) throws IOException {
            return new RootDirectory(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            records = new ArrayList<RootDirectoryRec>(((Number) (_root.bootSector().bpb().maxRootDirRec())).intValue());
            for (int i = 0; i < _root.bootSector().bpb().maxRootDirRec(); i++) {
                this.records.add(new RootDirectoryRec(this._io, this, _root));
            }
        }
        private ArrayList<RootDirectoryRec> records;
        private Vfat _root;
        private Vfat _parent;
        public ArrayList<RootDirectoryRec> records() { return records; }
        public Vfat _root() { return _root; }
        public Vfat _parent() { return _parent; }
    }

    /**
     * Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
     * for FAT12 and FAT16.
     */
    public static class ExtBiosParamBlockFat16 extends KaitaiStruct {
        public static ExtBiosParamBlockFat16 fromFile(String fileName) throws IOException {
            return new ExtBiosParamBlockFat16(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.physDriveNum = this._io.readU1();
            this.reserved1 = this._io.readU1();
            this.extBootSign = this._io.readU1();
            this.volumeId = this._io.readBytes(4);
            this.partitionVolumeLabel = new String(KaitaiStream.bytesStripRight(this._io.readBytes(11), (byte) 32), Charset.forName("ASCII"));
            this.fsTypeStr = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 32), Charset.forName("ASCII"));
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
        public int reserved1() { return reserved1; }

        /**
         * Should be 0x29 to indicate that an EBPB with the following 3
         * entries exists.
         */
        public int extBootSign() { return extBootSign; }

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
        public String partitionVolumeLabel() { return partitionVolumeLabel; }
        public String fsTypeStr() { return fsTypeStr; }
        public Vfat _root() { return _root; }
        public Vfat.BootSector _parent() { return _parent; }
    }
    private ArrayList<byte[]> fats;
    public ArrayList<byte[]> fats() {
        if (this.fats != null)
            return this.fats;
        long _pos = this._io.pos();
        this._io.seek(bootSector().posFats());
        fats = new ArrayList<byte[]>(((Number) (bootSector().bpb().numFats())).intValue());
        for (int i = 0; i < bootSector().bpb().numFats(); i++) {
            this.fats.add(this._io.readBytes(bootSector().sizeFat()));
        }
        this._io.seek(_pos);
        return this.fats;
    }
    private RootDirectory rootDir;
    public RootDirectory rootDir() {
        if (this.rootDir != null)
            return this.rootDir;
        long _pos = this._io.pos();
        this._io.seek(bootSector().posRootDir());
        this._raw_rootDir = this._io.readBytes(bootSector().sizeRootDir());
        KaitaiStream _io__raw_rootDir = new ByteBufferKaitaiStream(_raw_rootDir);
        this.rootDir = new RootDirectory(_io__raw_rootDir, this, _root);
        this._io.seek(_pos);
        return this.rootDir;
    }
    private BootSector bootSector;
    private Vfat _root;
    private KaitaiStruct _parent;
    private byte[] _raw_rootDir;
    public BootSector bootSector() { return bootSector; }
    public Vfat _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_rootDir() { return _raw_rootDir; }
}
