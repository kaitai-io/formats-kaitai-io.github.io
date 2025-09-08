// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.ArrayList;


/**
 * The metadata stored by Android at the beginning of a "super" partition, which
 * is what it calls a disk partition that holds one or more Dynamic Partitions.
 * Dynamic Partitions do more or less the same thing that LVM does on Linux,
 * allowing Android to map ranges of non-contiguous extents to a single logical
 * device. This metadata holds that mapping.
 * @see <a href="https://source.android.com/docs/core/ota/dynamic_partitions">Source</a>
 * @see <a href="https://android.googlesource.com/platform/system/core/+/refs/tags/android-11.0.0_r8/fs_mgr/liblp/include/liblp/metadata_format.h">Source</a>
 */
public class AndroidSuper extends KaitaiStruct {
    public static AndroidSuper fromFile(String fileName) throws IOException {
        return new AndroidSuper(new ByteBufferKaitaiStream(fileName));
    }

    public AndroidSuper(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidSuper(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndroidSuper(KaitaiStream _io, KaitaiStruct _parent, AndroidSuper _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
    }

    public void _fetchInstances() {
        root();
        if (this.root != null) {
            this.root._fetchInstances();
        }
    }
    public static class Geometry extends KaitaiStruct {
        public static Geometry fromFile(String fileName) throws IOException {
            return new Geometry(new ByteBufferKaitaiStream(fileName));
        }

        public Geometry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Geometry(KaitaiStream _io, AndroidSuper.Root _parent) {
            this(_io, _parent, null);
        }

        public Geometry(KaitaiStream _io, AndroidSuper.Root _parent, AndroidSuper _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 103, 68, 108, 97 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 103, 68, 108, 97 }, this.magic, this._io, "/types/geometry/seq/0");
            }
            this.structSize = this._io.readU4le();
            this.checksum = this._io.readBytes(32);
            this.metadataMaxSize = this._io.readU4le();
            this.metadataSlotCount = this._io.readU4le();
            this.logicalBlockSize = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private byte[] magic;
        private long structSize;
        private byte[] checksum;
        private long metadataMaxSize;
        private long metadataSlotCount;
        private long logicalBlockSize;
        private AndroidSuper _root;
        private AndroidSuper.Root _parent;
        public byte[] magic() { return magic; }
        public long structSize() { return structSize; }

        /**
         * SHA-256 hash of struct_size bytes from beginning of geometry,
         * calculated as if checksum were zeroed out
         */
        public byte[] checksum() { return checksum; }
        public long metadataMaxSize() { return metadataMaxSize; }
        public long metadataSlotCount() { return metadataSlotCount; }
        public long logicalBlockSize() { return logicalBlockSize; }
        public AndroidSuper _root() { return _root; }
        public AndroidSuper.Root _parent() { return _parent; }
    }
    public static class Metadata extends KaitaiStruct {
        public static Metadata fromFile(String fileName) throws IOException {
            return new Metadata(new ByteBufferKaitaiStream(fileName));
        }

        public enum TableKind {
            PARTITIONS(0),
            EXTENTS(1),
            GROUPS(2),
            BLOCK_DEVICES(3);

            private final long id;
            TableKind(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, TableKind> byId = new HashMap<Long, TableKind>(4);
            static {
                for (TableKind e : TableKind.values())
                    byId.put(e.id(), e);
            }
            public static TableKind byId(long id) { return byId.get(id); }
        }

        public Metadata(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Metadata(KaitaiStream _io, AndroidSuper.Root _parent) {
            this(_io, _parent, null);
        }

        public Metadata(KaitaiStream _io, AndroidSuper.Root _parent, AndroidSuper _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 48, 80, 76, 65 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 48, 80, 76, 65 }, this.magic, this._io, "/types/metadata/seq/0");
            }
            this.majorVersion = this._io.readU2le();
            this.minorVersion = this._io.readU2le();
            this.headerSize = this._io.readU4le();
            this.headerChecksum = this._io.readBytes(32);
            this.tablesSize = this._io.readU4le();
            this.tablesChecksum = this._io.readBytes(32);
            this.partitions = new TableDescriptor(this._io, this, _root, TableKind.PARTITIONS);
            this.extents = new TableDescriptor(this._io, this, _root, TableKind.EXTENTS);
            this.groups = new TableDescriptor(this._io, this, _root, TableKind.GROUPS);
            this.blockDevices = new TableDescriptor(this._io, this, _root, TableKind.BLOCK_DEVICES);
        }

        public void _fetchInstances() {
            this.partitions._fetchInstances();
            this.extents._fetchInstances();
            this.groups._fetchInstances();
            this.blockDevices._fetchInstances();
        }
        public static class BlockDevice extends KaitaiStruct {
            public static BlockDevice fromFile(String fileName) throws IOException {
                return new BlockDevice(new ByteBufferKaitaiStream(fileName));
            }

            public BlockDevice(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BlockDevice(KaitaiStream _io, AndroidSuper.Metadata.TableDescriptor _parent) {
                this(_io, _parent, null);
            }

            public BlockDevice(KaitaiStream _io, AndroidSuper.Metadata.TableDescriptor _parent, AndroidSuper _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.firstLogicalSector = this._io.readU8le();
                this.alignment = this._io.readU4le();
                this.alignmentOffset = this._io.readU4le();
                this.size = this._io.readU8le();
                this.partitionName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(36), (byte) 0, false), StandardCharsets.UTF_8);
                this.flagSlotSuffixed = this._io.readBitsIntLe(1) != 0;
                this.flagsReserved = this._io.readBitsIntLe(31);
            }

            public void _fetchInstances() {
            }
            private long firstLogicalSector;
            private long alignment;
            private long alignmentOffset;
            private long size;
            private String partitionName;
            private boolean flagSlotSuffixed;
            private long flagsReserved;
            private AndroidSuper _root;
            private AndroidSuper.Metadata.TableDescriptor _parent;
            public long firstLogicalSector() { return firstLogicalSector; }
            public long alignment() { return alignment; }
            public long alignmentOffset() { return alignmentOffset; }
            public long size() { return size; }
            public String partitionName() { return partitionName; }
            public boolean flagSlotSuffixed() { return flagSlotSuffixed; }
            public long flagsReserved() { return flagsReserved; }
            public AndroidSuper _root() { return _root; }
            public AndroidSuper.Metadata.TableDescriptor _parent() { return _parent; }
        }
        public static class Extent extends KaitaiStruct {
            public static Extent fromFile(String fileName) throws IOException {
                return new Extent(new ByteBufferKaitaiStream(fileName));
            }

            public enum TargetType {
                LINEAR(0),
                ZERO(1);

                private final long id;
                TargetType(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, TargetType> byId = new HashMap<Long, TargetType>(2);
                static {
                    for (TargetType e : TargetType.values())
                        byId.put(e.id(), e);
                }
                public static TargetType byId(long id) { return byId.get(id); }
            }

            public Extent(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Extent(KaitaiStream _io, AndroidSuper.Metadata.TableDescriptor _parent) {
                this(_io, _parent, null);
            }

            public Extent(KaitaiStream _io, AndroidSuper.Metadata.TableDescriptor _parent, AndroidSuper _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.numSectors = this._io.readU8le();
                this.targetType = TargetType.byId(this._io.readU4le());
                this.targetData = this._io.readU8le();
                this.targetSource = this._io.readU4le();
            }

            public void _fetchInstances() {
            }
            private long numSectors;
            private TargetType targetType;
            private long targetData;
            private long targetSource;
            private AndroidSuper _root;
            private AndroidSuper.Metadata.TableDescriptor _parent;
            public long numSectors() { return numSectors; }
            public TargetType targetType() { return targetType; }
            public long targetData() { return targetData; }
            public long targetSource() { return targetSource; }
            public AndroidSuper _root() { return _root; }
            public AndroidSuper.Metadata.TableDescriptor _parent() { return _parent; }
        }
        public static class Group extends KaitaiStruct {
            public static Group fromFile(String fileName) throws IOException {
                return new Group(new ByteBufferKaitaiStream(fileName));
            }

            public Group(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Group(KaitaiStream _io, AndroidSuper.Metadata.TableDescriptor _parent) {
                this(_io, _parent, null);
            }

            public Group(KaitaiStream _io, AndroidSuper.Metadata.TableDescriptor _parent, AndroidSuper _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(36), (byte) 0, false), StandardCharsets.UTF_8);
                this.flagSlotSuffixed = this._io.readBitsIntLe(1) != 0;
                this.flagsReserved = this._io.readBitsIntLe(31);
                this.maximumSize = this._io.readU8le();
            }

            public void _fetchInstances() {
            }
            private String name;
            private boolean flagSlotSuffixed;
            private long flagsReserved;
            private long maximumSize;
            private AndroidSuper _root;
            private AndroidSuper.Metadata.TableDescriptor _parent;
            public String name() { return name; }
            public boolean flagSlotSuffixed() { return flagSlotSuffixed; }
            public long flagsReserved() { return flagsReserved; }
            public long maximumSize() { return maximumSize; }
            public AndroidSuper _root() { return _root; }
            public AndroidSuper.Metadata.TableDescriptor _parent() { return _parent; }
        }
        public static class Partition extends KaitaiStruct {
            public static Partition fromFile(String fileName) throws IOException {
                return new Partition(new ByteBufferKaitaiStream(fileName));
            }

            public Partition(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Partition(KaitaiStream _io, AndroidSuper.Metadata.TableDescriptor _parent) {
                this(_io, _parent, null);
            }

            public Partition(KaitaiStream _io, AndroidSuper.Metadata.TableDescriptor _parent, AndroidSuper _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(36), (byte) 0, false), StandardCharsets.UTF_8);
                this.attrReadonly = this._io.readBitsIntLe(1) != 0;
                this.attrSlotSuffixed = this._io.readBitsIntLe(1) != 0;
                this.attrUpdated = this._io.readBitsIntLe(1) != 0;
                this.attrDisabled = this._io.readBitsIntLe(1) != 0;
                this.attrsReserved = this._io.readBitsIntLe(28);
                this.firstExtentIndex = this._io.readU4le();
                this.numExtents = this._io.readU4le();
                this.groupIndex = this._io.readU4le();
            }

            public void _fetchInstances() {
            }
            private String name;
            private boolean attrReadonly;
            private boolean attrSlotSuffixed;
            private boolean attrUpdated;
            private boolean attrDisabled;
            private long attrsReserved;
            private long firstExtentIndex;
            private long numExtents;
            private long groupIndex;
            private AndroidSuper _root;
            private AndroidSuper.Metadata.TableDescriptor _parent;
            public String name() { return name; }
            public boolean attrReadonly() { return attrReadonly; }
            public boolean attrSlotSuffixed() { return attrSlotSuffixed; }
            public boolean attrUpdated() { return attrUpdated; }
            public boolean attrDisabled() { return attrDisabled; }
            public long attrsReserved() { return attrsReserved; }
            public long firstExtentIndex() { return firstExtentIndex; }
            public long numExtents() { return numExtents; }
            public long groupIndex() { return groupIndex; }
            public AndroidSuper _root() { return _root; }
            public AndroidSuper.Metadata.TableDescriptor _parent() { return _parent; }
        }
        public static class TableDescriptor extends KaitaiStruct {

            public TableDescriptor(KaitaiStream _io, TableKind kind) {
                this(_io, null, null, kind);
            }

            public TableDescriptor(KaitaiStream _io, AndroidSuper.Metadata _parent, TableKind kind) {
                this(_io, _parent, null, kind);
            }

            public TableDescriptor(KaitaiStream _io, AndroidSuper.Metadata _parent, AndroidSuper _root, TableKind kind) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.kind = kind;
                _read();
            }
            private void _read() {
                this.offset = this._io.readU4le();
                this.numEntries = this._io.readU4le();
                this.entrySize = this._io.readU4le();
            }

            public void _fetchInstances() {
                table();
                if (this.table != null) {
                    for (int i = 0; i < this.table.size(); i++) {
                        {
                            TableKind on = kind();
                            if (on != null) {
                                switch (kind()) {
                                case BLOCK_DEVICES: {
                                    ((BlockDevice) (this.table.get(((Number) (i)).intValue())))._fetchInstances();
                                    break;
                                }
                                case EXTENTS: {
                                    ((Extent) (this.table.get(((Number) (i)).intValue())))._fetchInstances();
                                    break;
                                }
                                case GROUPS: {
                                    ((Group) (this.table.get(((Number) (i)).intValue())))._fetchInstances();
                                    break;
                                }
                                case PARTITIONS: {
                                    ((Partition) (this.table.get(((Number) (i)).intValue())))._fetchInstances();
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
                }
            }
            private List<Object> table;
            public List<Object> table() {
                if (this.table != null)
                    return this.table;
                long _pos = this._io.pos();
                this._io.seek(_parent().headerSize() + offset());
                this.table = new ArrayList<Object>();
                for (int i = 0; i < numEntries(); i++) {
                    {
                        TableKind on = kind();
                        if (on != null) {
                            switch (kind()) {
                            case BLOCK_DEVICES: {
                                KaitaiStream _io_table = this._io.substream(entrySize());
                                this.table.add(new BlockDevice(_io_table, this, _root));
                                break;
                            }
                            case EXTENTS: {
                                KaitaiStream _io_table = this._io.substream(entrySize());
                                this.table.add(new Extent(_io_table, this, _root));
                                break;
                            }
                            case GROUPS: {
                                KaitaiStream _io_table = this._io.substream(entrySize());
                                this.table.add(new Group(_io_table, this, _root));
                                break;
                            }
                            case PARTITIONS: {
                                KaitaiStream _io_table = this._io.substream(entrySize());
                                this.table.add(new Partition(_io_table, this, _root));
                                break;
                            }
                            default: {
                                this.table.add(this._io.readBytes(entrySize()));
                                break;
                            }
                            }
                        } else {
                            this.table.add(this._io.readBytes(entrySize()));
                        }
                    }
                }
                this._io.seek(_pos);
                return this.table;
            }
            private long offset;
            private long numEntries;
            private long entrySize;
            private TableKind kind;
            private AndroidSuper _root;
            private AndroidSuper.Metadata _parent;
            public long offset() { return offset; }
            public long numEntries() { return numEntries; }
            public long entrySize() { return entrySize; }
            public TableKind kind() { return kind; }
            public AndroidSuper _root() { return _root; }
            public AndroidSuper.Metadata _parent() { return _parent; }
        }
        private byte[] magic;
        private int majorVersion;
        private int minorVersion;
        private long headerSize;
        private byte[] headerChecksum;
        private long tablesSize;
        private byte[] tablesChecksum;
        private TableDescriptor partitions;
        private TableDescriptor extents;
        private TableDescriptor groups;
        private TableDescriptor blockDevices;
        private AndroidSuper _root;
        private AndroidSuper.Root _parent;
        public byte[] magic() { return magic; }
        public int majorVersion() { return majorVersion; }
        public int minorVersion() { return minorVersion; }
        public long headerSize() { return headerSize; }

        /**
         * SHA-256 hash of header_size bytes from beginning of metadata,
         * calculated as if header_checksum were zeroed out
         */
        public byte[] headerChecksum() { return headerChecksum; }
        public long tablesSize() { return tablesSize; }

        /**
         * SHA-256 hash of tables_size bytes from end of header
         */
        public byte[] tablesChecksum() { return tablesChecksum; }
        public TableDescriptor partitions() { return partitions; }
        public TableDescriptor extents() { return extents; }
        public TableDescriptor groups() { return groups; }
        public TableDescriptor blockDevices() { return blockDevices; }
        public AndroidSuper _root() { return _root; }
        public AndroidSuper.Root _parent() { return _parent; }
    }
    public static class Root extends KaitaiStruct {
        public static Root fromFile(String fileName) throws IOException {
            return new Root(new ByteBufferKaitaiStream(fileName));
        }

        public Root(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Root(KaitaiStream _io, AndroidSuper _parent) {
            this(_io, _parent, null);
        }

        public Root(KaitaiStream _io, AndroidSuper _parent, AndroidSuper _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            KaitaiStream _io_primaryGeometry = this._io.substream(4096);
            this.primaryGeometry = new Geometry(_io_primaryGeometry, this, _root);
            KaitaiStream _io_backupGeometry = this._io.substream(4096);
            this.backupGeometry = new Geometry(_io_backupGeometry, this, _root);
            this.primaryMetadata = new ArrayList<Metadata>();
            for (int i = 0; i < primaryGeometry().metadataSlotCount(); i++) {
                KaitaiStream _io_primaryMetadata = this._io.substream(primaryGeometry().metadataMaxSize());
                this.primaryMetadata.add(new Metadata(_io_primaryMetadata, this, _root));
            }
            this.backupMetadata = new ArrayList<Metadata>();
            for (int i = 0; i < primaryGeometry().metadataSlotCount(); i++) {
                KaitaiStream _io_backupMetadata = this._io.substream(primaryGeometry().metadataMaxSize());
                this.backupMetadata.add(new Metadata(_io_backupMetadata, this, _root));
            }
        }

        public void _fetchInstances() {
            this.primaryGeometry._fetchInstances();
            this.backupGeometry._fetchInstances();
            for (int i = 0; i < this.primaryMetadata.size(); i++) {
                this.primaryMetadata.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.backupMetadata.size(); i++) {
                this.backupMetadata.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private Geometry primaryGeometry;
        private Geometry backupGeometry;
        private List<Metadata> primaryMetadata;
        private List<Metadata> backupMetadata;
        private AndroidSuper _root;
        private AndroidSuper _parent;
        public Geometry primaryGeometry() { return primaryGeometry; }
        public Geometry backupGeometry() { return backupGeometry; }
        public List<Metadata> primaryMetadata() { return primaryMetadata; }
        public List<Metadata> backupMetadata() { return backupMetadata; }
        public AndroidSuper _root() { return _root; }
        public AndroidSuper _parent() { return _parent; }
    }
    private Root root;
    public Root root() {
        if (this.root != null)
            return this.root;
        long _pos = this._io.pos();
        this._io.seek(4096);
        this.root = new Root(this._io, this, _root);
        this._io.seek(_pos);
        return this.root;
    }
    private AndroidSuper _root;
    private KaitaiStruct _parent;
    public AndroidSuper _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
