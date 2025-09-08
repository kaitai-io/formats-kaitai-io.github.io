// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
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
public class AndroidSuper extends KaitaiStruct.ReadWrite {
    public static AndroidSuper fromFile(String fileName) throws IOException {
        return new AndroidSuper(new ByteBufferKaitaiStream(fileName));
    }
    public AndroidSuper() {
        this(null, null, null);
    }

    public AndroidSuper(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidSuper(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidSuper(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidSuper _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        _dirty = false;
    }

    public void _fetchInstances() {
        root();
        if (this.root != null) {
            this.root._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteRoot = _enabledRoot;
    }

    public void _check() {
        if (_enabledRoot) {
            if (!Objects.equals(this.root._root(), _root()))
                throw new ConsistencyError("root", _root(), this.root._root());
            if (!Objects.equals(this.root._parent(), this))
                throw new ConsistencyError("root", this, this.root._parent());
        }
        _dirty = false;
    }
    public static class Geometry extends KaitaiStruct.ReadWrite {
        public static Geometry fromFile(String fileName) throws IOException {
            return new Geometry(new ByteBufferKaitaiStream(fileName));
        }
        public Geometry() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 103, 68, 108, 97 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 103, 68, 108, 97 }, this.magic, this._io, "/types/geometry/seq/0");
            }
            this.structSize = this._io.readU4le();
            this.checksum = this._io.readBytes(32);
            this.metadataMaxSize = this._io.readU4le();
            this.metadataSlotCount = this._io.readU4le();
            this.logicalBlockSize = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.structSize);
            this._io.writeBytes(this.checksum);
            this._io.writeU4le(this.metadataMaxSize);
            this._io.writeU4le(this.metadataSlotCount);
            this._io.writeU4le(this.logicalBlockSize);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 103, 68, 108, 97 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 103, 68, 108, 97 }, this.magic, null, "/types/geometry/seq/0");
            }
            if (this.checksum.length != 32)
                throw new ConsistencyError("checksum", 32, this.checksum.length);
            _dirty = false;
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
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long structSize() { return structSize; }
        public void setStructSize(long _v) { _dirty = true; structSize = _v; }

        /**
         * SHA-256 hash of struct_size bytes from beginning of geometry,
         * calculated as if checksum were zeroed out
         */
        public byte[] checksum() { return checksum; }
        public void setChecksum(byte[] _v) { _dirty = true; checksum = _v; }
        public long metadataMaxSize() { return metadataMaxSize; }
        public void setMetadataMaxSize(long _v) { _dirty = true; metadataMaxSize = _v; }
        public long metadataSlotCount() { return metadataSlotCount; }
        public void setMetadataSlotCount(long _v) { _dirty = true; metadataSlotCount = _v; }
        public long logicalBlockSize() { return logicalBlockSize; }
        public void setLogicalBlockSize(long _v) { _dirty = true; logicalBlockSize = _v; }
        public AndroidSuper _root() { return _root; }
        public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
        public AndroidSuper.Root _parent() { return _parent; }
        public void set_parent(AndroidSuper.Root _v) { _dirty = true; _parent = _v; }
    }
    public static class Metadata extends KaitaiStruct.ReadWrite {
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
        public Metadata() {
            this(null, null, null);
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
        }
        public void _read() {
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
            this.partitions._read();
            this.extents = new TableDescriptor(this._io, this, _root, TableKind.EXTENTS);
            this.extents._read();
            this.groups = new TableDescriptor(this._io, this, _root, TableKind.GROUPS);
            this.groups._read();
            this.blockDevices = new TableDescriptor(this._io, this, _root, TableKind.BLOCK_DEVICES);
            this.blockDevices._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.partitions._fetchInstances();
            this.extents._fetchInstances();
            this.groups._fetchInstances();
            this.blockDevices._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU2le(this.majorVersion);
            this._io.writeU2le(this.minorVersion);
            this._io.writeU4le(this.headerSize);
            this._io.writeBytes(this.headerChecksum);
            this._io.writeU4le(this.tablesSize);
            this._io.writeBytes(this.tablesChecksum);
            this.partitions._write_Seq(this._io);
            this.extents._write_Seq(this._io);
            this.groups._write_Seq(this._io);
            this.blockDevices._write_Seq(this._io);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 48, 80, 76, 65 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 48, 80, 76, 65 }, this.magic, null, "/types/metadata/seq/0");
            }
            if (this.headerChecksum.length != 32)
                throw new ConsistencyError("header_checksum", 32, this.headerChecksum.length);
            if (this.tablesChecksum.length != 32)
                throw new ConsistencyError("tables_checksum", 32, this.tablesChecksum.length);
            if (!Objects.equals(this.partitions._root(), _root()))
                throw new ConsistencyError("partitions", _root(), this.partitions._root());
            if (!Objects.equals(this.partitions._parent(), this))
                throw new ConsistencyError("partitions", this, this.partitions._parent());
            if (this.partitions.kind() != TableKind.PARTITIONS)
                throw new ConsistencyError("partitions", TableKind.PARTITIONS, this.partitions.kind());
            if (!Objects.equals(this.extents._root(), _root()))
                throw new ConsistencyError("extents", _root(), this.extents._root());
            if (!Objects.equals(this.extents._parent(), this))
                throw new ConsistencyError("extents", this, this.extents._parent());
            if (this.extents.kind() != TableKind.EXTENTS)
                throw new ConsistencyError("extents", TableKind.EXTENTS, this.extents.kind());
            if (!Objects.equals(this.groups._root(), _root()))
                throw new ConsistencyError("groups", _root(), this.groups._root());
            if (!Objects.equals(this.groups._parent(), this))
                throw new ConsistencyError("groups", this, this.groups._parent());
            if (this.groups.kind() != TableKind.GROUPS)
                throw new ConsistencyError("groups", TableKind.GROUPS, this.groups.kind());
            if (!Objects.equals(this.blockDevices._root(), _root()))
                throw new ConsistencyError("block_devices", _root(), this.blockDevices._root());
            if (!Objects.equals(this.blockDevices._parent(), this))
                throw new ConsistencyError("block_devices", this, this.blockDevices._parent());
            if (this.blockDevices.kind() != TableKind.BLOCK_DEVICES)
                throw new ConsistencyError("block_devices", TableKind.BLOCK_DEVICES, this.blockDevices.kind());
            _dirty = false;
        }
        public static class BlockDevice extends KaitaiStruct.ReadWrite {
            public static BlockDevice fromFile(String fileName) throws IOException {
                return new BlockDevice(new ByteBufferKaitaiStream(fileName));
            }
            public BlockDevice() {
                this(null, null, null);
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
            }
            public void _read() {
                this.firstLogicalSector = this._io.readU8le();
                this.alignment = this._io.readU4le();
                this.alignmentOffset = this._io.readU4le();
                this.size = this._io.readU8le();
                this.partitionName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(36), (byte) 0, false), StandardCharsets.UTF_8);
                this.flagSlotSuffixed = this._io.readBitsIntLe(1) != 0;
                this.flagsReserved = this._io.readBitsIntLe(31);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU8le(this.firstLogicalSector);
                this._io.writeU4le(this.alignment);
                this._io.writeU4le(this.alignmentOffset);
                this._io.writeU8le(this.size);
                this._io.writeBytesLimit((this.partitionName).getBytes(Charset.forName("UTF-8")), 36, (byte) 0, (byte) 0);
                this._io.writeBitsIntLe(1, (this.flagSlotSuffixed ? 1 : 0));
                this._io.writeBitsIntLe(31, this.flagsReserved);
            }

            public void _check() {
                if ((this.partitionName).getBytes(Charset.forName("UTF-8")).length > 36)
                    throw new ConsistencyError("partition_name", 36, (this.partitionName).getBytes(Charset.forName("UTF-8")).length);
                if (KaitaiStream.byteArrayIndexOf((this.partitionName).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("partition_name", -1, KaitaiStream.byteArrayIndexOf((this.partitionName).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                _dirty = false;
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
            public void setFirstLogicalSector(long _v) { _dirty = true; firstLogicalSector = _v; }
            public long alignment() { return alignment; }
            public void setAlignment(long _v) { _dirty = true; alignment = _v; }
            public long alignmentOffset() { return alignmentOffset; }
            public void setAlignmentOffset(long _v) { _dirty = true; alignmentOffset = _v; }
            public long size() { return size; }
            public void setSize(long _v) { _dirty = true; size = _v; }
            public String partitionName() { return partitionName; }
            public void setPartitionName(String _v) { _dirty = true; partitionName = _v; }
            public boolean flagSlotSuffixed() { return flagSlotSuffixed; }
            public void setFlagSlotSuffixed(boolean _v) { _dirty = true; flagSlotSuffixed = _v; }
            public long flagsReserved() { return flagsReserved; }
            public void setFlagsReserved(long _v) { _dirty = true; flagsReserved = _v; }
            public AndroidSuper _root() { return _root; }
            public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
            public AndroidSuper.Metadata.TableDescriptor _parent() { return _parent; }
            public void set_parent(AndroidSuper.Metadata.TableDescriptor _v) { _dirty = true; _parent = _v; }
        }
        public static class Extent extends KaitaiStruct.ReadWrite {
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
            public Extent() {
                this(null, null, null);
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
            }
            public void _read() {
                this.numSectors = this._io.readU8le();
                this.targetType = TargetType.byId(this._io.readU4le());
                this.targetData = this._io.readU8le();
                this.targetSource = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU8le(this.numSectors);
                this._io.writeU4le(((Number) (this.targetType.id())).longValue());
                this._io.writeU8le(this.targetData);
                this._io.writeU4le(this.targetSource);
            }

            public void _check() {
                _dirty = false;
            }
            private long numSectors;
            private TargetType targetType;
            private long targetData;
            private long targetSource;
            private AndroidSuper _root;
            private AndroidSuper.Metadata.TableDescriptor _parent;
            public long numSectors() { return numSectors; }
            public void setNumSectors(long _v) { _dirty = true; numSectors = _v; }
            public TargetType targetType() { return targetType; }
            public void setTargetType(TargetType _v) { _dirty = true; targetType = _v; }
            public long targetData() { return targetData; }
            public void setTargetData(long _v) { _dirty = true; targetData = _v; }
            public long targetSource() { return targetSource; }
            public void setTargetSource(long _v) { _dirty = true; targetSource = _v; }
            public AndroidSuper _root() { return _root; }
            public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
            public AndroidSuper.Metadata.TableDescriptor _parent() { return _parent; }
            public void set_parent(AndroidSuper.Metadata.TableDescriptor _v) { _dirty = true; _parent = _v; }
        }
        public static class Group extends KaitaiStruct.ReadWrite {
            public static Group fromFile(String fileName) throws IOException {
                return new Group(new ByteBufferKaitaiStream(fileName));
            }
            public Group() {
                this(null, null, null);
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
            }
            public void _read() {
                this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(36), (byte) 0, false), StandardCharsets.UTF_8);
                this.flagSlotSuffixed = this._io.readBitsIntLe(1) != 0;
                this.flagsReserved = this._io.readBitsIntLe(31);
                this.maximumSize = this._io.readU8le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytesLimit((this.name).getBytes(Charset.forName("UTF-8")), 36, (byte) 0, (byte) 0);
                this._io.writeBitsIntLe(1, (this.flagSlotSuffixed ? 1 : 0));
                this._io.writeBitsIntLe(31, this.flagsReserved);
                this._io.writeU8le(this.maximumSize);
            }

            public void _check() {
                if ((this.name).getBytes(Charset.forName("UTF-8")).length > 36)
                    throw new ConsistencyError("name", 36, (this.name).getBytes(Charset.forName("UTF-8")).length);
                if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                _dirty = false;
            }
            private String name;
            private boolean flagSlotSuffixed;
            private long flagsReserved;
            private long maximumSize;
            private AndroidSuper _root;
            private AndroidSuper.Metadata.TableDescriptor _parent;
            public String name() { return name; }
            public void setName(String _v) { _dirty = true; name = _v; }
            public boolean flagSlotSuffixed() { return flagSlotSuffixed; }
            public void setFlagSlotSuffixed(boolean _v) { _dirty = true; flagSlotSuffixed = _v; }
            public long flagsReserved() { return flagsReserved; }
            public void setFlagsReserved(long _v) { _dirty = true; flagsReserved = _v; }
            public long maximumSize() { return maximumSize; }
            public void setMaximumSize(long _v) { _dirty = true; maximumSize = _v; }
            public AndroidSuper _root() { return _root; }
            public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
            public AndroidSuper.Metadata.TableDescriptor _parent() { return _parent; }
            public void set_parent(AndroidSuper.Metadata.TableDescriptor _v) { _dirty = true; _parent = _v; }
        }
        public static class Partition extends KaitaiStruct.ReadWrite {
            public static Partition fromFile(String fileName) throws IOException {
                return new Partition(new ByteBufferKaitaiStream(fileName));
            }
            public Partition() {
                this(null, null, null);
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
            }
            public void _read() {
                this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(36), (byte) 0, false), StandardCharsets.UTF_8);
                this.attrReadonly = this._io.readBitsIntLe(1) != 0;
                this.attrSlotSuffixed = this._io.readBitsIntLe(1) != 0;
                this.attrUpdated = this._io.readBitsIntLe(1) != 0;
                this.attrDisabled = this._io.readBitsIntLe(1) != 0;
                this.attrsReserved = this._io.readBitsIntLe(28);
                this.firstExtentIndex = this._io.readU4le();
                this.numExtents = this._io.readU4le();
                this.groupIndex = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytesLimit((this.name).getBytes(Charset.forName("UTF-8")), 36, (byte) 0, (byte) 0);
                this._io.writeBitsIntLe(1, (this.attrReadonly ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.attrSlotSuffixed ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.attrUpdated ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.attrDisabled ? 1 : 0));
                this._io.writeBitsIntLe(28, this.attrsReserved);
                this._io.writeU4le(this.firstExtentIndex);
                this._io.writeU4le(this.numExtents);
                this._io.writeU4le(this.groupIndex);
            }

            public void _check() {
                if ((this.name).getBytes(Charset.forName("UTF-8")).length > 36)
                    throw new ConsistencyError("name", 36, (this.name).getBytes(Charset.forName("UTF-8")).length);
                if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                _dirty = false;
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
            public void setName(String _v) { _dirty = true; name = _v; }
            public boolean attrReadonly() { return attrReadonly; }
            public void setAttrReadonly(boolean _v) { _dirty = true; attrReadonly = _v; }
            public boolean attrSlotSuffixed() { return attrSlotSuffixed; }
            public void setAttrSlotSuffixed(boolean _v) { _dirty = true; attrSlotSuffixed = _v; }
            public boolean attrUpdated() { return attrUpdated; }
            public void setAttrUpdated(boolean _v) { _dirty = true; attrUpdated = _v; }
            public boolean attrDisabled() { return attrDisabled; }
            public void setAttrDisabled(boolean _v) { _dirty = true; attrDisabled = _v; }
            public long attrsReserved() { return attrsReserved; }
            public void setAttrsReserved(long _v) { _dirty = true; attrsReserved = _v; }
            public long firstExtentIndex() { return firstExtentIndex; }
            public void setFirstExtentIndex(long _v) { _dirty = true; firstExtentIndex = _v; }
            public long numExtents() { return numExtents; }
            public void setNumExtents(long _v) { _dirty = true; numExtents = _v; }
            public long groupIndex() { return groupIndex; }
            public void setGroupIndex(long _v) { _dirty = true; groupIndex = _v; }
            public AndroidSuper _root() { return _root; }
            public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
            public AndroidSuper.Metadata.TableDescriptor _parent() { return _parent; }
            public void set_parent(AndroidSuper.Metadata.TableDescriptor _v) { _dirty = true; _parent = _v; }
        }
        public static class TableDescriptor extends KaitaiStruct.ReadWrite {
            public TableDescriptor(TableKind kind) {
                this(null, null, null, kind);
            }

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
            }
            public void _read() {
                this.offset = this._io.readU4le();
                this.numEntries = this._io.readU4le();
                this.entrySize = this._io.readU4le();
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteTable = _enabledTable;
                this._io.writeU4le(this.offset);
                this._io.writeU4le(this.numEntries);
                this._io.writeU4le(this.entrySize);
            }

            public void _check() {
                if (_enabledTable) {
                    if (this.table.size() != numEntries())
                        throw new ConsistencyError("table", numEntries(), this.table.size());
                    for (int i = 0; i < this.table.size(); i++) {
                        {
                            TableKind on = kind();
                            if (on != null) {
                                switch (kind()) {
                                case BLOCK_DEVICES: {
                                    if (!Objects.equals(((AndroidSuper.Metadata.BlockDevice) (this.table.get(((Number) (i)).intValue())))._root(), _root()))
                                        throw new ConsistencyError("table", _root(), ((AndroidSuper.Metadata.BlockDevice) (this.table.get(((Number) (i)).intValue())))._root());
                                    if (!Objects.equals(((AndroidSuper.Metadata.BlockDevice) (this.table.get(((Number) (i)).intValue())))._parent(), this))
                                        throw new ConsistencyError("table", this, ((AndroidSuper.Metadata.BlockDevice) (this.table.get(((Number) (i)).intValue())))._parent());
                                    break;
                                }
                                case EXTENTS: {
                                    if (!Objects.equals(((AndroidSuper.Metadata.Extent) (this.table.get(((Number) (i)).intValue())))._root(), _root()))
                                        throw new ConsistencyError("table", _root(), ((AndroidSuper.Metadata.Extent) (this.table.get(((Number) (i)).intValue())))._root());
                                    if (!Objects.equals(((AndroidSuper.Metadata.Extent) (this.table.get(((Number) (i)).intValue())))._parent(), this))
                                        throw new ConsistencyError("table", this, ((AndroidSuper.Metadata.Extent) (this.table.get(((Number) (i)).intValue())))._parent());
                                    break;
                                }
                                case GROUPS: {
                                    if (!Objects.equals(((AndroidSuper.Metadata.Group) (this.table.get(((Number) (i)).intValue())))._root(), _root()))
                                        throw new ConsistencyError("table", _root(), ((AndroidSuper.Metadata.Group) (this.table.get(((Number) (i)).intValue())))._root());
                                    if (!Objects.equals(((AndroidSuper.Metadata.Group) (this.table.get(((Number) (i)).intValue())))._parent(), this))
                                        throw new ConsistencyError("table", this, ((AndroidSuper.Metadata.Group) (this.table.get(((Number) (i)).intValue())))._parent());
                                    break;
                                }
                                case PARTITIONS: {
                                    if (!Objects.equals(((AndroidSuper.Metadata.Partition) (this.table.get(((Number) (i)).intValue())))._root(), _root()))
                                        throw new ConsistencyError("table", _root(), ((AndroidSuper.Metadata.Partition) (this.table.get(((Number) (i)).intValue())))._root());
                                    if (!Objects.equals(((AndroidSuper.Metadata.Partition) (this.table.get(((Number) (i)).intValue())))._parent(), this))
                                        throw new ConsistencyError("table", this, ((AndroidSuper.Metadata.Partition) (this.table.get(((Number) (i)).intValue())))._parent());
                                    break;
                                }
                                default: {
                                    if (((byte[]) (this.table.get(((Number) (i)).intValue()))).length != entrySize())
                                        throw new ConsistencyError("table", entrySize(), ((byte[]) (this.table.get(((Number) (i)).intValue()))).length);
                                    break;
                                }
                                }
                            } else {
                                if (((byte[]) (this.table.get(((Number) (i)).intValue()))).length != entrySize())
                                    throw new ConsistencyError("table", entrySize(), ((byte[]) (this.table.get(((Number) (i)).intValue()))).length);
                            }
                        }
                    }
                }
                _dirty = false;
            }
            private List<Object> table;
            private boolean _shouldWriteTable = false;
            private boolean _enabledTable = true;
            public List<Object> table() {
                if (_shouldWriteTable)
                    _writeTable();
                if (this.table != null)
                    return this.table;
                if (!_enabledTable)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(_parent().headerSize() + offset());
                this._raw_table = new ArrayList<byte[]>();
                this.table = new ArrayList<Object>();
                for (int i = 0; i < numEntries(); i++) {
                    {
                        TableKind on = kind();
                        if (on != null) {
                            switch (kind()) {
                            case BLOCK_DEVICES: {
                                this._raw_table.add(this._io.readBytes(entrySize()));
                                KaitaiStream _io__raw_table = new ByteBufferKaitaiStream(this._raw_table.get(i));
                                BlockDevice _t_table = new BlockDevice(_io__raw_table, this, _root);
                                try {
                                    ((BlockDevice) (_t_table))._read();
                                } finally {
                                    this.table.add(_t_table);
                                }
                                break;
                            }
                            case EXTENTS: {
                                this._raw_table.add(this._io.readBytes(entrySize()));
                                KaitaiStream _io__raw_table = new ByteBufferKaitaiStream(this._raw_table.get(i));
                                Extent _t_table = new Extent(_io__raw_table, this, _root);
                                try {
                                    ((Extent) (_t_table))._read();
                                } finally {
                                    this.table.add(_t_table);
                                }
                                break;
                            }
                            case GROUPS: {
                                this._raw_table.add(this._io.readBytes(entrySize()));
                                KaitaiStream _io__raw_table = new ByteBufferKaitaiStream(this._raw_table.get(i));
                                Group _t_table = new Group(_io__raw_table, this, _root);
                                try {
                                    ((Group) (_t_table))._read();
                                } finally {
                                    this.table.add(_t_table);
                                }
                                break;
                            }
                            case PARTITIONS: {
                                this._raw_table.add(this._io.readBytes(entrySize()));
                                KaitaiStream _io__raw_table = new ByteBufferKaitaiStream(this._raw_table.get(i));
                                Partition _t_table = new Partition(_io__raw_table, this, _root);
                                try {
                                    ((Partition) (_t_table))._read();
                                } finally {
                                    this.table.add(_t_table);
                                }
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
            public void setTable(List<Object> _v) { _dirty = true; table = _v; }
            public void setTable_Enabled(boolean _v) { _dirty = true; _enabledTable = _v; }

            private void _writeTable() {
                _shouldWriteTable = false;
                long _pos = this._io.pos();
                this._io.seek(_parent().headerSize() + offset());
                this._raw_table = new ArrayList<byte[]>();
                for (int i = 0; i < this.table.size(); i++) {
                    {
                        TableKind on = kind();
                        if (on != null) {
                            switch (kind()) {
                            case BLOCK_DEVICES: {
                                final KaitaiStream _io__raw_table = new ByteBufferKaitaiStream(entrySize());
                                this._io.addChildStream(_io__raw_table);
                                {
                                    long _pos2 = this._io.pos();
                                    this._io.seek(this._io.pos() + (entrySize()));
                                    final TableDescriptor _this = this;
                                    final int _i = i;
                                    _io__raw_table.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                        @Override
                                        protected void write(KaitaiStream parent) {
                                            _this._raw_table.add(_io__raw_table.toByteArray());
                                            if (((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))).length != entrySize())
                                                throw new ConsistencyError("raw(table)", entrySize(), ((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))).length);
                                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))))));
                                        }
                                    });
                                }
                                ((BlockDevice) (this.table.get(((Number) (i)).intValue())))._write_Seq(_io__raw_table);
                                break;
                            }
                            case EXTENTS: {
                                final KaitaiStream _io__raw_table = new ByteBufferKaitaiStream(entrySize());
                                this._io.addChildStream(_io__raw_table);
                                {
                                    long _pos2 = this._io.pos();
                                    this._io.seek(this._io.pos() + (entrySize()));
                                    final TableDescriptor _this = this;
                                    final int _i = i;
                                    _io__raw_table.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                        @Override
                                        protected void write(KaitaiStream parent) {
                                            _this._raw_table.add(_io__raw_table.toByteArray());
                                            if (((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))).length != entrySize())
                                                throw new ConsistencyError("raw(table)", entrySize(), ((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))).length);
                                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))))));
                                        }
                                    });
                                }
                                ((Extent) (this.table.get(((Number) (i)).intValue())))._write_Seq(_io__raw_table);
                                break;
                            }
                            case GROUPS: {
                                final KaitaiStream _io__raw_table = new ByteBufferKaitaiStream(entrySize());
                                this._io.addChildStream(_io__raw_table);
                                {
                                    long _pos2 = this._io.pos();
                                    this._io.seek(this._io.pos() + (entrySize()));
                                    final TableDescriptor _this = this;
                                    final int _i = i;
                                    _io__raw_table.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                        @Override
                                        protected void write(KaitaiStream parent) {
                                            _this._raw_table.add(_io__raw_table.toByteArray());
                                            if (((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))).length != entrySize())
                                                throw new ConsistencyError("raw(table)", entrySize(), ((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))).length);
                                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))))));
                                        }
                                    });
                                }
                                ((Group) (this.table.get(((Number) (i)).intValue())))._write_Seq(_io__raw_table);
                                break;
                            }
                            case PARTITIONS: {
                                final KaitaiStream _io__raw_table = new ByteBufferKaitaiStream(entrySize());
                                this._io.addChildStream(_io__raw_table);
                                {
                                    long _pos2 = this._io.pos();
                                    this._io.seek(this._io.pos() + (entrySize()));
                                    final TableDescriptor _this = this;
                                    final int _i = i;
                                    _io__raw_table.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                        @Override
                                        protected void write(KaitaiStream parent) {
                                            _this._raw_table.add(_io__raw_table.toByteArray());
                                            if (((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))).length != entrySize())
                                                throw new ConsistencyError("raw(table)", entrySize(), ((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))).length);
                                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_table.get(((Number) (_i)).intValue()))))));
                                        }
                                    });
                                }
                                ((Partition) (this.table.get(((Number) (i)).intValue())))._write_Seq(_io__raw_table);
                                break;
                            }
                            default: {
                                this._io.writeBytes(((byte[]) (((byte[]) (this.table.get(((Number) (i)).intValue()))))));
                                break;
                            }
                            }
                        } else {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.table.get(((Number) (i)).intValue()))))));
                        }
                    }
                }
                this._io.seek(_pos);
            }
            private long offset;
            private long numEntries;
            private long entrySize;
            private TableKind kind;
            private AndroidSuper _root;
            private AndroidSuper.Metadata _parent;
            private List<byte[]> _raw_table;
            public long offset() { return offset; }
            public void setOffset(long _v) { _dirty = true; offset = _v; }
            public long numEntries() { return numEntries; }
            public void setNumEntries(long _v) { _dirty = true; numEntries = _v; }
            public long entrySize() { return entrySize; }
            public void setEntrySize(long _v) { _dirty = true; entrySize = _v; }
            public TableKind kind() { return kind; }
            public void setKind(TableKind _v) { _dirty = true; kind = _v; }
            public AndroidSuper _root() { return _root; }
            public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
            public AndroidSuper.Metadata _parent() { return _parent; }
            public void set_parent(AndroidSuper.Metadata _v) { _dirty = true; _parent = _v; }
            public List<byte[]> _raw_table() { return _raw_table; }
            public void set_raw_Table(List<byte[]> _v) { _dirty = true; _raw_table = _v; }
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
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public int majorVersion() { return majorVersion; }
        public void setMajorVersion(int _v) { _dirty = true; majorVersion = _v; }
        public int minorVersion() { return minorVersion; }
        public void setMinorVersion(int _v) { _dirty = true; minorVersion = _v; }
        public long headerSize() { return headerSize; }
        public void setHeaderSize(long _v) { _dirty = true; headerSize = _v; }

        /**
         * SHA-256 hash of header_size bytes from beginning of metadata,
         * calculated as if header_checksum were zeroed out
         */
        public byte[] headerChecksum() { return headerChecksum; }
        public void setHeaderChecksum(byte[] _v) { _dirty = true; headerChecksum = _v; }
        public long tablesSize() { return tablesSize; }
        public void setTablesSize(long _v) { _dirty = true; tablesSize = _v; }

        /**
         * SHA-256 hash of tables_size bytes from end of header
         */
        public byte[] tablesChecksum() { return tablesChecksum; }
        public void setTablesChecksum(byte[] _v) { _dirty = true; tablesChecksum = _v; }
        public TableDescriptor partitions() { return partitions; }
        public void setPartitions(TableDescriptor _v) { _dirty = true; partitions = _v; }
        public TableDescriptor extents() { return extents; }
        public void setExtents(TableDescriptor _v) { _dirty = true; extents = _v; }
        public TableDescriptor groups() { return groups; }
        public void setGroups(TableDescriptor _v) { _dirty = true; groups = _v; }
        public TableDescriptor blockDevices() { return blockDevices; }
        public void setBlockDevices(TableDescriptor _v) { _dirty = true; blockDevices = _v; }
        public AndroidSuper _root() { return _root; }
        public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
        public AndroidSuper.Root _parent() { return _parent; }
        public void set_parent(AndroidSuper.Root _v) { _dirty = true; _parent = _v; }
    }
    public static class Root extends KaitaiStruct.ReadWrite {
        public static Root fromFile(String fileName) throws IOException {
            return new Root(new ByteBufferKaitaiStream(fileName));
        }
        public Root() {
            this(null, null, null);
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
        }
        public void _read() {
            this._raw_primaryGeometry = this._io.readBytes(4096);
            KaitaiStream _io__raw_primaryGeometry = new ByteBufferKaitaiStream(this._raw_primaryGeometry);
            this.primaryGeometry = new Geometry(_io__raw_primaryGeometry, this, _root);
            this.primaryGeometry._read();
            this._raw_backupGeometry = this._io.readBytes(4096);
            KaitaiStream _io__raw_backupGeometry = new ByteBufferKaitaiStream(this._raw_backupGeometry);
            this.backupGeometry = new Geometry(_io__raw_backupGeometry, this, _root);
            this.backupGeometry._read();
            this._raw_primaryMetadata = new ArrayList<byte[]>();
            this.primaryMetadata = new ArrayList<Metadata>();
            for (int i = 0; i < primaryGeometry().metadataSlotCount(); i++) {
                this._raw_primaryMetadata.add(this._io.readBytes(primaryGeometry().metadataMaxSize()));
                KaitaiStream _io__raw_primaryMetadata = new ByteBufferKaitaiStream(this._raw_primaryMetadata.get(i));
                Metadata _t_primaryMetadata = new Metadata(_io__raw_primaryMetadata, this, _root);
                try {
                    _t_primaryMetadata._read();
                } finally {
                    this.primaryMetadata.add(_t_primaryMetadata);
                }
            }
            this._raw_backupMetadata = new ArrayList<byte[]>();
            this.backupMetadata = new ArrayList<Metadata>();
            for (int i = 0; i < primaryGeometry().metadataSlotCount(); i++) {
                this._raw_backupMetadata.add(this._io.readBytes(primaryGeometry().metadataMaxSize()));
                KaitaiStream _io__raw_backupMetadata = new ByteBufferKaitaiStream(this._raw_backupMetadata.get(i));
                Metadata _t_backupMetadata = new Metadata(_io__raw_backupMetadata, this, _root);
                try {
                    _t_backupMetadata._read();
                } finally {
                    this.backupMetadata.add(_t_backupMetadata);
                }
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_primaryGeometry = new ByteBufferKaitaiStream(4096);
            this._io.addChildStream(_io__raw_primaryGeometry);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4096));
                final Root _this = this;
                _io__raw_primaryGeometry.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_primaryGeometry = _io__raw_primaryGeometry.toByteArray();
                        if (_this._raw_primaryGeometry.length != 4096)
                            throw new ConsistencyError("raw(primary_geometry)", 4096, _this._raw_primaryGeometry.length);
                        parent.writeBytes(_this._raw_primaryGeometry);
                    }
                });
            }
            this.primaryGeometry._write_Seq(_io__raw_primaryGeometry);
            final KaitaiStream _io__raw_backupGeometry = new ByteBufferKaitaiStream(4096);
            this._io.addChildStream(_io__raw_backupGeometry);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4096));
                final Root _this = this;
                _io__raw_backupGeometry.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_backupGeometry = _io__raw_backupGeometry.toByteArray();
                        if (_this._raw_backupGeometry.length != 4096)
                            throw new ConsistencyError("raw(backup_geometry)", 4096, _this._raw_backupGeometry.length);
                        parent.writeBytes(_this._raw_backupGeometry);
                    }
                });
            }
            this.backupGeometry._write_Seq(_io__raw_backupGeometry);
            this._raw_primaryMetadata = new ArrayList<byte[]>();
            for (int i = 0; i < this.primaryMetadata.size(); i++) {
                final KaitaiStream _io__raw_primaryMetadata = new ByteBufferKaitaiStream(primaryGeometry().metadataMaxSize());
                this._io.addChildStream(_io__raw_primaryMetadata);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (primaryGeometry().metadataMaxSize()));
                    final Root _this = this;
                    final int _i = i;
                    _io__raw_primaryMetadata.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_primaryMetadata.add(_io__raw_primaryMetadata.toByteArray());
                            if (_this._raw_primaryMetadata.get(((Number) (_i)).intValue()).length != primaryGeometry().metadataMaxSize())
                                throw new ConsistencyError("raw(primary_metadata)", primaryGeometry().metadataMaxSize(), _this._raw_primaryMetadata.get(((Number) (_i)).intValue()).length);
                            parent.writeBytes(_this._raw_primaryMetadata.get(((Number) (_i)).intValue()));
                        }
                    });
                }
                this.primaryMetadata.get(((Number) (i)).intValue())._write_Seq(_io__raw_primaryMetadata);
            }
            this._raw_backupMetadata = new ArrayList<byte[]>();
            for (int i = 0; i < this.backupMetadata.size(); i++) {
                final KaitaiStream _io__raw_backupMetadata = new ByteBufferKaitaiStream(primaryGeometry().metadataMaxSize());
                this._io.addChildStream(_io__raw_backupMetadata);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (primaryGeometry().metadataMaxSize()));
                    final Root _this = this;
                    final int _i = i;
                    _io__raw_backupMetadata.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_backupMetadata.add(_io__raw_backupMetadata.toByteArray());
                            if (_this._raw_backupMetadata.get(((Number) (_i)).intValue()).length != primaryGeometry().metadataMaxSize())
                                throw new ConsistencyError("raw(backup_metadata)", primaryGeometry().metadataMaxSize(), _this._raw_backupMetadata.get(((Number) (_i)).intValue()).length);
                            parent.writeBytes(_this._raw_backupMetadata.get(((Number) (_i)).intValue()));
                        }
                    });
                }
                this.backupMetadata.get(((Number) (i)).intValue())._write_Seq(_io__raw_backupMetadata);
            }
        }

        public void _check() {
            if (!Objects.equals(this.primaryGeometry._root(), _root()))
                throw new ConsistencyError("primary_geometry", _root(), this.primaryGeometry._root());
            if (!Objects.equals(this.primaryGeometry._parent(), this))
                throw new ConsistencyError("primary_geometry", this, this.primaryGeometry._parent());
            if (!Objects.equals(this.backupGeometry._root(), _root()))
                throw new ConsistencyError("backup_geometry", _root(), this.backupGeometry._root());
            if (!Objects.equals(this.backupGeometry._parent(), this))
                throw new ConsistencyError("backup_geometry", this, this.backupGeometry._parent());
            if (this.primaryMetadata.size() != primaryGeometry().metadataSlotCount())
                throw new ConsistencyError("primary_metadata", primaryGeometry().metadataSlotCount(), this.primaryMetadata.size());
            for (int i = 0; i < this.primaryMetadata.size(); i++) {
                if (!Objects.equals(this.primaryMetadata.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("primary_metadata", _root(), this.primaryMetadata.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.primaryMetadata.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("primary_metadata", this, this.primaryMetadata.get(((Number) (i)).intValue())._parent());
            }
            if (this.backupMetadata.size() != primaryGeometry().metadataSlotCount())
                throw new ConsistencyError("backup_metadata", primaryGeometry().metadataSlotCount(), this.backupMetadata.size());
            for (int i = 0; i < this.backupMetadata.size(); i++) {
                if (!Objects.equals(this.backupMetadata.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("backup_metadata", _root(), this.backupMetadata.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.backupMetadata.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("backup_metadata", this, this.backupMetadata.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Geometry primaryGeometry;
        private Geometry backupGeometry;
        private List<Metadata> primaryMetadata;
        private List<Metadata> backupMetadata;
        private AndroidSuper _root;
        private AndroidSuper _parent;
        private byte[] _raw_primaryGeometry;
        private byte[] _raw_backupGeometry;
        private List<byte[]> _raw_primaryMetadata;
        private List<byte[]> _raw_backupMetadata;
        public Geometry primaryGeometry() { return primaryGeometry; }
        public void setPrimaryGeometry(Geometry _v) { _dirty = true; primaryGeometry = _v; }
        public Geometry backupGeometry() { return backupGeometry; }
        public void setBackupGeometry(Geometry _v) { _dirty = true; backupGeometry = _v; }
        public List<Metadata> primaryMetadata() { return primaryMetadata; }
        public void setPrimaryMetadata(List<Metadata> _v) { _dirty = true; primaryMetadata = _v; }
        public List<Metadata> backupMetadata() { return backupMetadata; }
        public void setBackupMetadata(List<Metadata> _v) { _dirty = true; backupMetadata = _v; }
        public AndroidSuper _root() { return _root; }
        public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
        public AndroidSuper _parent() { return _parent; }
        public void set_parent(AndroidSuper _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_primaryGeometry() { return _raw_primaryGeometry; }
        public void set_raw_PrimaryGeometry(byte[] _v) { _dirty = true; _raw_primaryGeometry = _v; }
        public byte[] _raw_backupGeometry() { return _raw_backupGeometry; }
        public void set_raw_BackupGeometry(byte[] _v) { _dirty = true; _raw_backupGeometry = _v; }
        public List<byte[]> _raw_primaryMetadata() { return _raw_primaryMetadata; }
        public void set_raw_PrimaryMetadata(List<byte[]> _v) { _dirty = true; _raw_primaryMetadata = _v; }
        public List<byte[]> _raw_backupMetadata() { return _raw_backupMetadata; }
        public void set_raw_BackupMetadata(List<byte[]> _v) { _dirty = true; _raw_backupMetadata = _v; }
    }
    private Root root;
    private boolean _shouldWriteRoot = false;
    private boolean _enabledRoot = true;
    public Root root() {
        if (_shouldWriteRoot)
            _writeRoot();
        if (this.root != null)
            return this.root;
        if (!_enabledRoot)
            return null;
        long _pos = this._io.pos();
        this._io.seek(4096);
        this.root = new Root(this._io, this, _root);
        this.root._read();
        this._io.seek(_pos);
        return this.root;
    }
    public void setRoot(Root _v) { _dirty = true; root = _v; }
    public void setRoot_Enabled(boolean _v) { _dirty = true; _enabledRoot = _v; }

    private void _writeRoot() {
        _shouldWriteRoot = false;
        long _pos = this._io.pos();
        this._io.seek(4096);
        this.root._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private AndroidSuper _root;
    private KaitaiStruct.ReadWrite _parent;
    public AndroidSuper _root() { return _root; }
    public void set_root(AndroidSuper _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
