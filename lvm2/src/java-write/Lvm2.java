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
 * ### Building a test file
 * 
 * ```
 * dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
 * sudo losetup /dev/loop1 image.img
 * sudo pvcreate /dev/loop1
 * sudo vgcreate vg_test /dev/loop1
 * sudo lvcreate --name lv_test1 vg_test
 * sudo losetup -d /dev/loop1
 * ```
 * @see <a href="https://github.com/libyal/libvslvm/blob/main/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc">Source</a>
 */
public class Lvm2 extends KaitaiStruct.ReadWrite {
    public static Lvm2 fromFile(String fileName) throws IOException {
        return new Lvm2(new ByteBufferKaitaiStream(fileName));
    }
    public Lvm2() {
        this(null, null, null);
    }

    public Lvm2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Lvm2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Lvm2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Lvm2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.pv = new PhysicalVolume(this._io, this, _root);
        this.pv._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.pv._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.pv._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.pv._root(), _root()))
            throw new ConsistencyError("pv", _root(), this.pv._root());
        if (!Objects.equals(this.pv._parent(), this))
            throw new ConsistencyError("pv", this, this.pv._parent());
        _dirty = false;
    }
    public static class PhysicalVolume extends KaitaiStruct.ReadWrite {
        public static PhysicalVolume fromFile(String fileName) throws IOException {
            return new PhysicalVolume(new ByteBufferKaitaiStream(fileName));
        }
        public PhysicalVolume() {
            this(null, null, null);
        }

        public PhysicalVolume(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PhysicalVolume(KaitaiStream _io, Lvm2 _parent) {
            this(_io, _parent, null);
        }

        public PhysicalVolume(KaitaiStream _io, Lvm2 _parent, Lvm2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.emptySector = this._io.readBytes(_root().sectorSize());
            this.label = new Label(this._io, this, _root);
            this.label._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.label._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.emptySector);
            this.label._write_Seq(this._io);
        }

        public void _check() {
            if (this.emptySector.length != _root().sectorSize())
                throw new ConsistencyError("empty_sector", _root().sectorSize(), this.emptySector.length);
            if (!Objects.equals(this.label._root(), _root()))
                throw new ConsistencyError("label", _root(), this.label._root());
            if (!Objects.equals(this.label._parent(), this))
                throw new ConsistencyError("label", this, this.label._parent());
            _dirty = false;
        }
        public static class Label extends KaitaiStruct.ReadWrite {
            public static Label fromFile(String fileName) throws IOException {
                return new Label(new ByteBufferKaitaiStream(fileName));
            }
            public Label() {
                this(null, null, null);
            }

            public Label(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Label(KaitaiStream _io, Lvm2.PhysicalVolume _parent) {
                this(_io, _parent, null);
            }

            public Label(KaitaiStream _io, Lvm2.PhysicalVolume _parent, Lvm2 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.labelHeader = new LabelHeader(this._io, this, _root);
                this.labelHeader._read();
                this.volumeHeader = new VolumeHeader(this._io, this, _root);
                this.volumeHeader._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.labelHeader._fetchInstances();
                this.volumeHeader._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.labelHeader._write_Seq(this._io);
                this.volumeHeader._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.labelHeader._root(), _root()))
                    throw new ConsistencyError("label_header", _root(), this.labelHeader._root());
                if (!Objects.equals(this.labelHeader._parent(), this))
                    throw new ConsistencyError("label_header", this, this.labelHeader._parent());
                if (!Objects.equals(this.volumeHeader._root(), _root()))
                    throw new ConsistencyError("volume_header", _root(), this.volumeHeader._root());
                if (!Objects.equals(this.volumeHeader._parent(), this))
                    throw new ConsistencyError("volume_header", this, this.volumeHeader._parent());
                _dirty = false;
            }
            public static class LabelHeader extends KaitaiStruct.ReadWrite {
                public static LabelHeader fromFile(String fileName) throws IOException {
                    return new LabelHeader(new ByteBufferKaitaiStream(fileName));
                }
                public LabelHeader() {
                    this(null, null, null);
                }

                public LabelHeader(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public LabelHeader(KaitaiStream _io, Lvm2.PhysicalVolume.Label _parent) {
                    this(_io, _parent, null);
                }

                public LabelHeader(KaitaiStream _io, Lvm2.PhysicalVolume.Label _parent, Lvm2 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.signature = this._io.readBytes(8);
                    if (!(Arrays.equals(this.signature, new byte[] { 76, 65, 66, 69, 76, 79, 78, 69 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 65, 66, 69, 76, 79, 78, 69 }, this.signature, this._io, "/types/physical_volume/types/label/types/label_header/seq/0");
                    }
                    this.sectorNumber = this._io.readU8le();
                    this.checksum = this._io.readU4le();
                    this.labelHeader = new LabelHeader(this._io, this, _root);
                    this.labelHeader._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.labelHeader._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.signature);
                    this._io.writeU8le(this.sectorNumber);
                    this._io.writeU4le(this.checksum);
                    this.labelHeader._write_Seq(this._io);
                }

                public void _check() {
                    if (this.signature.length != 8)
                        throw new ConsistencyError("signature", 8, this.signature.length);
                    if (!(Arrays.equals(this.signature, new byte[] { 76, 65, 66, 69, 76, 79, 78, 69 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 65, 66, 69, 76, 79, 78, 69 }, this.signature, null, "/types/physical_volume/types/label/types/label_header/seq/0");
                    }
                    if (!Objects.equals(this.labelHeader._root(), _root()))
                        throw new ConsistencyError("label_header_", _root(), this.labelHeader._root());
                    if (!Objects.equals(this.labelHeader._parent(), this))
                        throw new ConsistencyError("label_header_", this, this.labelHeader._parent());
                    _dirty = false;
                }
                public static class LabelHeader extends KaitaiStruct.ReadWrite {
                    public static LabelHeader fromFile(String fileName) throws IOException {
                        return new LabelHeader(new ByteBufferKaitaiStream(fileName));
                    }
                    public LabelHeader() {
                        this(null, null, null);
                    }

                    public LabelHeader(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public LabelHeader(KaitaiStream _io, Lvm2.PhysicalVolume.Label.LabelHeader _parent) {
                        this(_io, _parent, null);
                    }

                    public LabelHeader(KaitaiStream _io, Lvm2.PhysicalVolume.Label.LabelHeader _parent, Lvm2 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.dataOffset = this._io.readU4le();
                        this.typeIndicator = this._io.readBytes(8);
                        if (!(Arrays.equals(this.typeIndicator, new byte[] { 76, 86, 77, 50, 32, 48, 48, 49 }))) {
                            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 86, 77, 50, 32, 48, 48, 49 }, this.typeIndicator, this._io, "/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1");
                        }
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeU4le(this.dataOffset);
                        this._io.writeBytes(this.typeIndicator);
                    }

                    public void _check() {
                        if (this.typeIndicator.length != 8)
                            throw new ConsistencyError("type_indicator", 8, this.typeIndicator.length);
                        if (!(Arrays.equals(this.typeIndicator, new byte[] { 76, 86, 77, 50, 32, 48, 48, 49 }))) {
                            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 86, 77, 50, 32, 48, 48, 49 }, this.typeIndicator, null, "/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1");
                        }
                        _dirty = false;
                    }
                    private long dataOffset;
                    private byte[] typeIndicator;
                    private Lvm2 _root;
                    private Lvm2.PhysicalVolume.Label.LabelHeader _parent;

                    /**
                     * The offset, in bytes, relative from the start of the physical volume label header where data is stored
                     */
                    public long dataOffset() { return dataOffset; }
                    public void setDataOffset(long _v) { _dirty = true; dataOffset = _v; }
                    public byte[] typeIndicator() { return typeIndicator; }
                    public void setTypeIndicator(byte[] _v) { _dirty = true; typeIndicator = _v; }
                    public Lvm2 _root() { return _root; }
                    public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
                    public Lvm2.PhysicalVolume.Label.LabelHeader _parent() { return _parent; }
                    public void set_parent(Lvm2.PhysicalVolume.Label.LabelHeader _v) { _dirty = true; _parent = _v; }
                }
                private byte[] signature;
                private long sectorNumber;
                private long checksum;
                private LabelHeader labelHeader;
                private Lvm2 _root;
                private Lvm2.PhysicalVolume.Label _parent;
                public byte[] signature() { return signature; }
                public void setSignature(byte[] _v) { _dirty = true; signature = _v; }

                /**
                 * The sector number of the physical volume label header
                 */
                public long sectorNumber() { return sectorNumber; }
                public void setSectorNumber(long _v) { _dirty = true; sectorNumber = _v; }

                /**
                 * CRC-32 for offset 20 to end of the physical volume label sector
                 */
                public long checksum() { return checksum; }
                public void setChecksum(long _v) { _dirty = true; checksum = _v; }
                public LabelHeader labelHeader() { return labelHeader; }
                public void setLabelHeader(LabelHeader _v) { _dirty = true; labelHeader = _v; }
                public Lvm2 _root() { return _root; }
                public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
                public Lvm2.PhysicalVolume.Label _parent() { return _parent; }
                public void set_parent(Lvm2.PhysicalVolume.Label _v) { _dirty = true; _parent = _v; }
            }
            public static class VolumeHeader extends KaitaiStruct.ReadWrite {
                public static VolumeHeader fromFile(String fileName) throws IOException {
                    return new VolumeHeader(new ByteBufferKaitaiStream(fileName));
                }
                public VolumeHeader() {
                    this(null, null, null);
                }

                public VolumeHeader(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public VolumeHeader(KaitaiStream _io, Lvm2.PhysicalVolume.Label _parent) {
                    this(_io, _parent, null);
                }

                public VolumeHeader(KaitaiStream _io, Lvm2.PhysicalVolume.Label _parent, Lvm2 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.id = new String(this._io.readBytes(32), StandardCharsets.US_ASCII);
                    this.size = this._io.readU8le();
                    this.dataAreaDescriptors = new ArrayList<DataAreaDescriptor>();
                    {
                        DataAreaDescriptor _it;
                        int i = 0;
                        do {
                            DataAreaDescriptor _t_dataAreaDescriptors = new DataAreaDescriptor(this._io, this, _root);
                            try {
                                _t_dataAreaDescriptors._read();
                            } finally {
                                _it = _t_dataAreaDescriptors;
                                this.dataAreaDescriptors.add(_it);
                            }
                            i++;
                        } while (!( ((_it.size() != 0) && (_it.offset() != 0)) ));
                    }
                    this.metadataAreaDescriptors = new ArrayList<MetadataAreaDescriptor>();
                    {
                        MetadataAreaDescriptor _it;
                        int i = 0;
                        do {
                            MetadataAreaDescriptor _t_metadataAreaDescriptors = new MetadataAreaDescriptor(this._io, this, _root);
                            try {
                                _t_metadataAreaDescriptors._read();
                            } finally {
                                _it = _t_metadataAreaDescriptors;
                                this.metadataAreaDescriptors.add(_it);
                            }
                            i++;
                        } while (!( ((_it.size() != 0) && (_it.offset() != 0)) ));
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.dataAreaDescriptors.size(); i++) {
                        this.dataAreaDescriptors.get(((Number) (i)).intValue())._fetchInstances();
                    }
                    for (int i = 0; i < this.metadataAreaDescriptors.size(); i++) {
                        this.metadataAreaDescriptors.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes((this.id).getBytes(Charset.forName("ASCII")));
                    this._io.writeU8le(this.size);
                    for (int i = 0; i < this.dataAreaDescriptors.size(); i++) {
                        this.dataAreaDescriptors.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    for (int i = 0; i < this.metadataAreaDescriptors.size(); i++) {
                        this.metadataAreaDescriptors.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if ((this.id).getBytes(Charset.forName("ASCII")).length != 32)
                        throw new ConsistencyError("id", 32, (this.id).getBytes(Charset.forName("ASCII")).length);
                    if (this.dataAreaDescriptors.size() == 0)
                        throw new ConsistencyError("data_area_descriptors", 0, this.dataAreaDescriptors.size());
                    for (int i = 0; i < this.dataAreaDescriptors.size(); i++) {
                        if (!Objects.equals(this.dataAreaDescriptors.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("data_area_descriptors", _root(), this.dataAreaDescriptors.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.dataAreaDescriptors.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("data_area_descriptors", this, this.dataAreaDescriptors.get(((Number) (i)).intValue())._parent());
                        {
                            DataAreaDescriptor _it = this.dataAreaDescriptors.get(((Number) (i)).intValue());
                            if ( ((_it.size() != 0) && (_it.offset() != 0))  != (i == this.dataAreaDescriptors.size() - 1))
                                throw new ConsistencyError("data_area_descriptors", i == this.dataAreaDescriptors.size() - 1,  ((_it.size() != 0) && (_it.offset() != 0)) );
                        }
                    }
                    if (this.metadataAreaDescriptors.size() == 0)
                        throw new ConsistencyError("metadata_area_descriptors", 0, this.metadataAreaDescriptors.size());
                    for (int i = 0; i < this.metadataAreaDescriptors.size(); i++) {
                        if (!Objects.equals(this.metadataAreaDescriptors.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("metadata_area_descriptors", _root(), this.metadataAreaDescriptors.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.metadataAreaDescriptors.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("metadata_area_descriptors", this, this.metadataAreaDescriptors.get(((Number) (i)).intValue())._parent());
                        {
                            MetadataAreaDescriptor _it = this.metadataAreaDescriptors.get(((Number) (i)).intValue());
                            if ( ((_it.size() != 0) && (_it.offset() != 0))  != (i == this.metadataAreaDescriptors.size() - 1))
                                throw new ConsistencyError("metadata_area_descriptors", i == this.metadataAreaDescriptors.size() - 1,  ((_it.size() != 0) && (_it.offset() != 0)) );
                        }
                    }
                    _dirty = false;
                }
                public static class DataAreaDescriptor extends KaitaiStruct.ReadWrite {
                    public static DataAreaDescriptor fromFile(String fileName) throws IOException {
                        return new DataAreaDescriptor(new ByteBufferKaitaiStream(fileName));
                    }
                    public DataAreaDescriptor() {
                        this(null, null, null);
                    }

                    public DataAreaDescriptor(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public DataAreaDescriptor(KaitaiStream _io, Lvm2.PhysicalVolume.Label.VolumeHeader _parent) {
                        this(_io, _parent, null);
                    }

                    public DataAreaDescriptor(KaitaiStream _io, Lvm2.PhysicalVolume.Label.VolumeHeader _parent, Lvm2 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.offset = this._io.readU8le();
                        this.size = this._io.readU8le();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        data();
                        if (this.data != null) {
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        _shouldWriteData = _enabledData;
                        this._io.writeU8le(this.offset);
                        this._io.writeU8le(this.size);
                    }

                    public void _check() {
                        if (_enabledData) {
                            if (size() != 0) {
                                if ((this.data).getBytes(Charset.forName("ASCII")).length != size())
                                    throw new ConsistencyError("data", size(), (this.data).getBytes(Charset.forName("ASCII")).length);
                            }
                        }
                        _dirty = false;
                    }
                    private String data;
                    private boolean _shouldWriteData = false;
                    private boolean _enabledData = true;
                    public String data() {
                        if (_shouldWriteData)
                            _writeData();
                        if (this.data != null)
                            return this.data;
                        if (!_enabledData)
                            return null;
                        if (size() != 0) {
                            long _pos = this._io.pos();
                            this._io.seek(offset());
                            this.data = new String(this._io.readBytes(size()), StandardCharsets.US_ASCII);
                            this._io.seek(_pos);
                        }
                        return this.data;
                    }
                    public void setData(String _v) { _dirty = true; data = _v; }
                    public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

                    private void _writeData() {
                        _shouldWriteData = false;
                        if (size() != 0) {
                            long _pos = this._io.pos();
                            this._io.seek(offset());
                            this._io.writeBytes((this.data).getBytes(Charset.forName("ASCII")));
                            this._io.seek(_pos);
                        }
                    }
                    private long offset;
                    private long size;
                    private Lvm2 _root;
                    private Lvm2.PhysicalVolume.Label.VolumeHeader _parent;

                    /**
                     * The offset, in bytes, relative from the start of the physical volume
                     */
                    public long offset() { return offset; }
                    public void setOffset(long _v) { _dirty = true; offset = _v; }

                    /**
                     * Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
                     */
                    public long size() { return size; }
                    public void setSize(long _v) { _dirty = true; size = _v; }
                    public Lvm2 _root() { return _root; }
                    public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
                    public Lvm2.PhysicalVolume.Label.VolumeHeader _parent() { return _parent; }
                    public void set_parent(Lvm2.PhysicalVolume.Label.VolumeHeader _v) { _dirty = true; _parent = _v; }
                }

                /**
                 * According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
                 */
                public static class MetadataArea extends KaitaiStruct.ReadWrite {
                    public static MetadataArea fromFile(String fileName) throws IOException {
                        return new MetadataArea(new ByteBufferKaitaiStream(fileName));
                    }
                    public MetadataArea() {
                        this(null, null, null);
                    }

                    public MetadataArea(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public MetadataArea(KaitaiStream _io, Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor _parent) {
                        this(_io, _parent, null);
                    }

                    public MetadataArea(KaitaiStream _io, Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor _parent, Lvm2 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.header = new MetadataAreaHeader(this._io, this, _root);
                        this.header._read();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        this.header._fetchInstances();
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this.header._write_Seq(this._io);
                    }

                    public void _check() {
                        if (!Objects.equals(this.header._root(), _root()))
                            throw new ConsistencyError("header", _root(), this.header._root());
                        if (!Objects.equals(this.header._parent(), this))
                            throw new ConsistencyError("header", this, this.header._parent());
                        _dirty = false;
                    }
                    public static class MetadataAreaHeader extends KaitaiStruct.ReadWrite {
                        public static MetadataAreaHeader fromFile(String fileName) throws IOException {
                            return new MetadataAreaHeader(new ByteBufferKaitaiStream(fileName));
                        }
                        public MetadataAreaHeader() {
                            this(null, null, null);
                        }

                        public MetadataAreaHeader(KaitaiStream _io) {
                            this(_io, null, null);
                        }

                        public MetadataAreaHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                            this(_io, _parent, null);
                        }

                        public MetadataAreaHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Lvm2 _root) {
                            super(_io);
                            this._parent = _parent;
                            this._root = _root;
                        }
                        public void _read() {
                            this.checksum = new MetadataAreaHeader(this._io, this, _root);
                            this.checksum._read();
                            this.signature = this._io.readBytes(16);
                            if (!(Arrays.equals(this.signature, new byte[] { 32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62 }))) {
                                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62 }, this.signature, this._io, "/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1");
                            }
                            this.version = this._io.readU4le();
                            this.metadataAreaOffset = this._io.readU8le();
                            this.metadataAreaSize = this._io.readU8le();
                            this.rawLocationDescriptors = new ArrayList<RawLocationDescriptor>();
                            {
                                RawLocationDescriptor _it;
                                int i = 0;
                                do {
                                    RawLocationDescriptor _t_rawLocationDescriptors = new RawLocationDescriptor(this._io, this, _root);
                                    try {
                                        _t_rawLocationDescriptors._read();
                                    } finally {
                                        _it = _t_rawLocationDescriptors;
                                        this.rawLocationDescriptors.add(_it);
                                    }
                                    i++;
                                } while (!( ((_it.offset() != 0) && (_it.size() != 0) && (_it.checksum() != 0)) ));
                            }
                            _dirty = false;
                        }

                        public void _fetchInstances() {
                            this.checksum._fetchInstances();
                            for (int i = 0; i < this.rawLocationDescriptors.size(); i++) {
                                this.rawLocationDescriptors.get(((Number) (i)).intValue())._fetchInstances();
                            }
                            metadata();
                            if (this.metadata != null) {
                            }
                        }

                        public void _write_Seq() {
                            _assertNotDirty();
                            _shouldWriteMetadata = _enabledMetadata;
                            this.checksum._write_Seq(this._io);
                            this._io.writeBytes(this.signature);
                            this._io.writeU4le(this.version);
                            this._io.writeU8le(this.metadataAreaOffset);
                            this._io.writeU8le(this.metadataAreaSize);
                            for (int i = 0; i < this.rawLocationDescriptors.size(); i++) {
                                this.rawLocationDescriptors.get(((Number) (i)).intValue())._write_Seq(this._io);
                            }
                        }

                        public void _check() {
                            if (!Objects.equals(this.checksum._root(), _root()))
                                throw new ConsistencyError("checksum", _root(), this.checksum._root());
                            if (!Objects.equals(this.checksum._parent(), this))
                                throw new ConsistencyError("checksum", this, this.checksum._parent());
                            if (this.signature.length != 16)
                                throw new ConsistencyError("signature", 16, this.signature.length);
                            if (!(Arrays.equals(this.signature, new byte[] { 32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62 }))) {
                                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62 }, this.signature, null, "/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1");
                            }
                            if (this.rawLocationDescriptors.size() == 0)
                                throw new ConsistencyError("raw_location_descriptors", 0, this.rawLocationDescriptors.size());
                            for (int i = 0; i < this.rawLocationDescriptors.size(); i++) {
                                if (!Objects.equals(this.rawLocationDescriptors.get(((Number) (i)).intValue())._root(), _root()))
                                    throw new ConsistencyError("raw_location_descriptors", _root(), this.rawLocationDescriptors.get(((Number) (i)).intValue())._root());
                                if (!Objects.equals(this.rawLocationDescriptors.get(((Number) (i)).intValue())._parent(), this))
                                    throw new ConsistencyError("raw_location_descriptors", this, this.rawLocationDescriptors.get(((Number) (i)).intValue())._parent());
                                {
                                    RawLocationDescriptor _it = this.rawLocationDescriptors.get(((Number) (i)).intValue());
                                    if ( ((_it.offset() != 0) && (_it.size() != 0) && (_it.checksum() != 0))  != (i == this.rawLocationDescriptors.size() - 1))
                                        throw new ConsistencyError("raw_location_descriptors", i == this.rawLocationDescriptors.size() - 1,  ((_it.offset() != 0) && (_it.size() != 0) && (_it.checksum() != 0)) );
                                }
                            }
                            if (_enabledMetadata) {
                                if (this.metadata.length != metadataAreaSize())
                                    throw new ConsistencyError("metadata", metadataAreaSize(), this.metadata.length);
                            }
                            _dirty = false;
                        }

                        /**
                         * The data area size can be 0. It is assumed it represents the remaining  available data.
                         */
                        public static class RawLocationDescriptor extends KaitaiStruct.ReadWrite {
                            public static RawLocationDescriptor fromFile(String fileName) throws IOException {
                                return new RawLocationDescriptor(new ByteBufferKaitaiStream(fileName));
                            }

                            public enum RawLocationDescriptorFlags {
                                RAW_LOCATION_IGNORED(1);

                                private final long id;
                                RawLocationDescriptorFlags(long id) { this.id = id; }
                                public long id() { return id; }
                                private static final Map<Long, RawLocationDescriptorFlags> byId = new HashMap<Long, RawLocationDescriptorFlags>(1);
                                static {
                                    for (RawLocationDescriptorFlags e : RawLocationDescriptorFlags.values())
                                        byId.put(e.id(), e);
                                }
                                public static RawLocationDescriptorFlags byId(long id) { return byId.get(id); }
                            }
                            public RawLocationDescriptor() {
                                this(null, null, null);
                            }

                            public RawLocationDescriptor(KaitaiStream _io) {
                                this(_io, null, null);
                            }

                            public RawLocationDescriptor(KaitaiStream _io, Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader _parent) {
                                this(_io, _parent, null);
                            }

                            public RawLocationDescriptor(KaitaiStream _io, Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader _parent, Lvm2 _root) {
                                super(_io);
                                this._parent = _parent;
                                this._root = _root;
                            }
                            public void _read() {
                                this.offset = this._io.readU8le();
                                this.size = this._io.readU8le();
                                this.checksum = this._io.readU4le();
                                this.flags = RawLocationDescriptorFlags.byId(this._io.readU4le());
                                _dirty = false;
                            }

                            public void _fetchInstances() {
                            }

                            public void _write_Seq() {
                                _assertNotDirty();
                                this._io.writeU8le(this.offset);
                                this._io.writeU8le(this.size);
                                this._io.writeU4le(this.checksum);
                                this._io.writeU4le(((Number) (this.flags.id())).longValue());
                            }

                            public void _check() {
                                _dirty = false;
                            }
                            private long offset;
                            private long size;
                            private long checksum;
                            private RawLocationDescriptorFlags flags;
                            private Lvm2 _root;
                            private Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader _parent;

                            /**
                             * The data area offset, in bytes, relative from the start of the metadata area
                             */
                            public long offset() { return offset; }
                            public void setOffset(long _v) { _dirty = true; offset = _v; }

                            /**
                             * data area size in bytes
                             */
                            public long size() { return size; }
                            public void setSize(long _v) { _dirty = true; size = _v; }

                            /**
                             * CRC-32 of *TODO (metadata?)*
                             */
                            public long checksum() { return checksum; }
                            public void setChecksum(long _v) { _dirty = true; checksum = _v; }
                            public RawLocationDescriptorFlags flags() { return flags; }
                            public void setFlags(RawLocationDescriptorFlags _v) { _dirty = true; flags = _v; }
                            public Lvm2 _root() { return _root; }
                            public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
                            public Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader _parent() { return _parent; }
                            public void set_parent(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader _v) { _dirty = true; _parent = _v; }
                        }
                        private byte[] metadata;
                        private boolean _shouldWriteMetadata = false;
                        private boolean _enabledMetadata = true;
                        public byte[] metadata() {
                            if (_shouldWriteMetadata)
                                _writeMetadata();
                            if (this.metadata != null)
                                return this.metadata;
                            if (!_enabledMetadata)
                                return null;
                            long _pos = this._io.pos();
                            this._io.seek(metadataAreaOffset());
                            this.metadata = this._io.readBytes(metadataAreaSize());
                            this._io.seek(_pos);
                            return this.metadata;
                        }
                        public void setMetadata(byte[] _v) { _dirty = true; metadata = _v; }
                        public void setMetadata_Enabled(boolean _v) { _dirty = true; _enabledMetadata = _v; }

                        private void _writeMetadata() {
                            _shouldWriteMetadata = false;
                            long _pos = this._io.pos();
                            this._io.seek(metadataAreaOffset());
                            this._io.writeBytes(this.metadata);
                            this._io.seek(_pos);
                        }
                        private MetadataAreaHeader checksum;
                        private byte[] signature;
                        private long version;
                        private long metadataAreaOffset;
                        private long metadataAreaSize;
                        private List<RawLocationDescriptor> rawLocationDescriptors;
                        private Lvm2 _root;
                        private KaitaiStruct.ReadWrite _parent;

                        /**
                         * CRC-32 for offset 4 to end of the metadata area header
                         */
                        public MetadataAreaHeader checksum() { return checksum; }
                        public void setChecksum(MetadataAreaHeader _v) { _dirty = true; checksum = _v; }
                        public byte[] signature() { return signature; }
                        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
                        public long version() { return version; }
                        public void setVersion(long _v) { _dirty = true; version = _v; }

                        /**
                         * The offset, in bytes, of the metadata area relative from the start of the physical volume
                         */
                        public long metadataAreaOffset() { return metadataAreaOffset; }
                        public void setMetadataAreaOffset(long _v) { _dirty = true; metadataAreaOffset = _v; }
                        public long metadataAreaSize() { return metadataAreaSize; }
                        public void setMetadataAreaSize(long _v) { _dirty = true; metadataAreaSize = _v; }

                        /**
                         * The last descriptor in the list is terminator and consists of 0-byte values.
                         */
                        public List<RawLocationDescriptor> rawLocationDescriptors() { return rawLocationDescriptors; }
                        public void setRawLocationDescriptors(List<RawLocationDescriptor> _v) { _dirty = true; rawLocationDescriptors = _v; }
                        public Lvm2 _root() { return _root; }
                        public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
                        public KaitaiStruct.ReadWrite _parent() { return _parent; }
                        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
                    }
                    private MetadataAreaHeader header;
                    private Lvm2 _root;
                    private Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor _parent;
                    public MetadataAreaHeader header() { return header; }
                    public void setHeader(MetadataAreaHeader _v) { _dirty = true; header = _v; }
                    public Lvm2 _root() { return _root; }
                    public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
                    public Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor _parent() { return _parent; }
                    public void set_parent(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor _v) { _dirty = true; _parent = _v; }
                }
                public static class MetadataAreaDescriptor extends KaitaiStruct.ReadWrite {
                    public static MetadataAreaDescriptor fromFile(String fileName) throws IOException {
                        return new MetadataAreaDescriptor(new ByteBufferKaitaiStream(fileName));
                    }
                    public MetadataAreaDescriptor() {
                        this(null, null, null);
                    }

                    public MetadataAreaDescriptor(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public MetadataAreaDescriptor(KaitaiStream _io, Lvm2.PhysicalVolume.Label.VolumeHeader _parent) {
                        this(_io, _parent, null);
                    }

                    public MetadataAreaDescriptor(KaitaiStream _io, Lvm2.PhysicalVolume.Label.VolumeHeader _parent, Lvm2 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.offset = this._io.readU8le();
                        this.size = this._io.readU8le();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        data();
                        if (this.data != null) {
                            this.data._fetchInstances();
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        _shouldWriteData = _enabledData;
                        this._io.writeU8le(this.offset);
                        this._io.writeU8le(this.size);
                    }

                    public void _check() {
                        if (_enabledData) {
                            if (size() != 0) {
                                if (!Objects.equals(this.data._root(), _root()))
                                    throw new ConsistencyError("data", _root(), this.data._root());
                                if (!Objects.equals(this.data._parent(), this))
                                    throw new ConsistencyError("data", this, this.data._parent());
                            }
                        }
                        _dirty = false;
                    }
                    private MetadataArea data;
                    private boolean _shouldWriteData = false;
                    private boolean _enabledData = true;
                    public MetadataArea data() {
                        if (_shouldWriteData)
                            _writeData();
                        if (this.data != null)
                            return this.data;
                        if (!_enabledData)
                            return null;
                        if (size() != 0) {
                            long _pos = this._io.pos();
                            this._io.seek(offset());
                            this._raw_data = this._io.readBytes(size());
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                            this.data = new MetadataArea(_io__raw_data, this, _root);
                            this.data._read();
                            this._io.seek(_pos);
                        }
                        return this.data;
                    }
                    public void setData(MetadataArea _v) { _dirty = true; data = _v; }
                    public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

                    private void _writeData() {
                        _shouldWriteData = false;
                        if (size() != 0) {
                            long _pos = this._io.pos();
                            this._io.seek(offset());
                            final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(size());
                            this._io.addChildStream(_io__raw_data);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (size()));
                                final MetadataAreaDescriptor _this = this;
                                _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_data = _io__raw_data.toByteArray();
                                        if (_this._raw_data.length != size())
                                            throw new ConsistencyError("raw(data)", size(), _this._raw_data.length);
                                        parent.writeBytes(_this._raw_data);
                                    }
                                });
                            }
                            this.data._write_Seq(_io__raw_data);
                            this._io.seek(_pos);
                        }
                    }
                    private long offset;
                    private long size;
                    private Lvm2 _root;
                    private Lvm2.PhysicalVolume.Label.VolumeHeader _parent;
                    private byte[] _raw_data;

                    /**
                     * The offset, in bytes, relative from the start of the physical volume
                     */
                    public long offset() { return offset; }
                    public void setOffset(long _v) { _dirty = true; offset = _v; }

                    /**
                     * Value in bytes
                     */
                    public long size() { return size; }
                    public void setSize(long _v) { _dirty = true; size = _v; }
                    public Lvm2 _root() { return _root; }
                    public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
                    public Lvm2.PhysicalVolume.Label.VolumeHeader _parent() { return _parent; }
                    public void set_parent(Lvm2.PhysicalVolume.Label.VolumeHeader _v) { _dirty = true; _parent = _v; }
                    public byte[] _raw_data() { return _raw_data; }
                    public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
                }
                private String id;
                private long size;
                private List<DataAreaDescriptor> dataAreaDescriptors;
                private List<MetadataAreaDescriptor> metadataAreaDescriptors;
                private Lvm2 _root;
                private Lvm2.PhysicalVolume.Label _parent;

                /**
                 * Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
                 */
                public String id() { return id; }
                public void setId(String _v) { _dirty = true; id = _v; }

                /**
                 * Physical Volume size. Value in bytes
                 */
                public long size() { return size; }
                public void setSize(long _v) { _dirty = true; size = _v; }

                /**
                 * The last descriptor in the list is terminator and consists of 0-byte values.
                 */
                public List<DataAreaDescriptor> dataAreaDescriptors() { return dataAreaDescriptors; }
                public void setDataAreaDescriptors(List<DataAreaDescriptor> _v) { _dirty = true; dataAreaDescriptors = _v; }
                public List<MetadataAreaDescriptor> metadataAreaDescriptors() { return metadataAreaDescriptors; }
                public void setMetadataAreaDescriptors(List<MetadataAreaDescriptor> _v) { _dirty = true; metadataAreaDescriptors = _v; }
                public Lvm2 _root() { return _root; }
                public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
                public Lvm2.PhysicalVolume.Label _parent() { return _parent; }
                public void set_parent(Lvm2.PhysicalVolume.Label _v) { _dirty = true; _parent = _v; }
            }
            private LabelHeader labelHeader;
            private VolumeHeader volumeHeader;
            private Lvm2 _root;
            private Lvm2.PhysicalVolume _parent;
            public LabelHeader labelHeader() { return labelHeader; }
            public void setLabelHeader(LabelHeader _v) { _dirty = true; labelHeader = _v; }
            public VolumeHeader volumeHeader() { return volumeHeader; }
            public void setVolumeHeader(VolumeHeader _v) { _dirty = true; volumeHeader = _v; }
            public Lvm2 _root() { return _root; }
            public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
            public Lvm2.PhysicalVolume _parent() { return _parent; }
            public void set_parent(Lvm2.PhysicalVolume _v) { _dirty = true; _parent = _v; }
        }
        private byte[] emptySector;
        private Label label;
        private Lvm2 _root;
        private Lvm2 _parent;
        public byte[] emptySector() { return emptySector; }
        public void setEmptySector(byte[] _v) { _dirty = true; emptySector = _v; }
        public Label label() { return label; }
        public void setLabel(Label _v) { _dirty = true; label = _v; }
        public Lvm2 _root() { return _root; }
        public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
        public Lvm2 _parent() { return _parent; }
        public void set_parent(Lvm2 _v) { _dirty = true; _parent = _v; }
    }
    private Integer sectorSize;
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        this.sectorSize = ((int) 512);
        return this.sectorSize;
    }
    public void _invalidateSectorSize() { this.sectorSize = null; }
    private PhysicalVolume pv;
    private Lvm2 _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * Physical volume
     */
    public PhysicalVolume pv() { return pv; }
    public void setPv(PhysicalVolume _v) { _dirty = true; pv = _v; }
    public Lvm2 _root() { return _root; }
    public void set_root(Lvm2 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
