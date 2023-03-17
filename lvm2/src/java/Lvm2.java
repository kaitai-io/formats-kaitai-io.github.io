// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;


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
public class Lvm2 extends KaitaiStruct {
    public static Lvm2 fromFile(String fileName) throws IOException {
        return new Lvm2(new ByteBufferKaitaiStream(fileName));
    }

    public Lvm2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Lvm2(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Lvm2(KaitaiStream _io, KaitaiStruct _parent, Lvm2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.pv = new PhysicalVolume(this._io, this, _root);
    }
    public static class PhysicalVolume extends KaitaiStruct {
        public static PhysicalVolume fromFile(String fileName) throws IOException {
            return new PhysicalVolume(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.emptySector = this._io.readBytes(_root().sectorSize());
            this.label = new Label(this._io, this, _root);
        }
        public static class Label extends KaitaiStruct {
            public static Label fromFile(String fileName) throws IOException {
                return new Label(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.labelHeader = new LabelHeader(this._io, this, _root);
                this.volumeHeader = new VolumeHeader(this._io, this, _root);
            }
            public static class LabelHeader extends KaitaiStruct {
                public static LabelHeader fromFile(String fileName) throws IOException {
                    return new LabelHeader(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.signature = this._io.readBytes(8);
                    if (!(Arrays.equals(signature(), new byte[] { 76, 65, 66, 69, 76, 79, 78, 69 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 65, 66, 69, 76, 79, 78, 69 }, signature(), _io(), "/types/physical_volume/types/label/types/label_header/seq/0");
                    }
                    this.sectorNumber = this._io.readU8le();
                    this.checksum = this._io.readU4le();
                    this.labelHeader = new LabelHeader(this._io, this, _root);
                }
                public static class LabelHeader extends KaitaiStruct {
                    public static LabelHeader fromFile(String fileName) throws IOException {
                        return new LabelHeader(new ByteBufferKaitaiStream(fileName));
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
                        _read();
                    }
                    private void _read() {
                        this.dataOffset = this._io.readU4le();
                        this.typeIndicator = this._io.readBytes(8);
                        if (!(Arrays.equals(typeIndicator(), new byte[] { 76, 86, 77, 50, 32, 48, 48, 49 }))) {
                            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 86, 77, 50, 32, 48, 48, 49 }, typeIndicator(), _io(), "/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1");
                        }
                    }
                    private long dataOffset;
                    private byte[] typeIndicator;
                    private Lvm2 _root;
                    private Lvm2.PhysicalVolume.Label.LabelHeader _parent;

                    /**
                     * The offset, in bytes, relative from the start of the physical volume label header where data is stored
                     */
                    public long dataOffset() { return dataOffset; }
                    public byte[] typeIndicator() { return typeIndicator; }
                    public Lvm2 _root() { return _root; }
                    public Lvm2.PhysicalVolume.Label.LabelHeader _parent() { return _parent; }
                }
                private byte[] signature;
                private long sectorNumber;
                private long checksum;
                private LabelHeader labelHeader;
                private Lvm2 _root;
                private Lvm2.PhysicalVolume.Label _parent;
                public byte[] signature() { return signature; }

                /**
                 * The sector number of the physical volume label header
                 */
                public long sectorNumber() { return sectorNumber; }

                /**
                 * CRC-32 for offset 20 to end of the physical volume label sector
                 */
                public long checksum() { return checksum; }
                public LabelHeader labelHeader() { return labelHeader; }
                public Lvm2 _root() { return _root; }
                public Lvm2.PhysicalVolume.Label _parent() { return _parent; }
            }
            public static class VolumeHeader extends KaitaiStruct {
                public static VolumeHeader fromFile(String fileName) throws IOException {
                    return new VolumeHeader(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.id = new String(this._io.readBytes(32), Charset.forName("ascii"));
                    this.size = this._io.readU8le();
                    this.dataAreaDescriptors = new ArrayList<DataAreaDescriptor>();
                    {
                        DataAreaDescriptor _it;
                        int i = 0;
                        do {
                            _it = new DataAreaDescriptor(this._io, this, _root);
                            this.dataAreaDescriptors.add(_it);
                            i++;
                        } while (!( ((_it.size() != 0) && (_it.offset() != 0)) ));
                    }
                    this.metadataAreaDescriptors = new ArrayList<MetadataAreaDescriptor>();
                    {
                        MetadataAreaDescriptor _it;
                        int i = 0;
                        do {
                            _it = new MetadataAreaDescriptor(this._io, this, _root);
                            this.metadataAreaDescriptors.add(_it);
                            i++;
                        } while (!( ((_it.size() != 0) && (_it.offset() != 0)) ));
                    }
                }
                public static class DataAreaDescriptor extends KaitaiStruct {
                    public static DataAreaDescriptor fromFile(String fileName) throws IOException {
                        return new DataAreaDescriptor(new ByteBufferKaitaiStream(fileName));
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
                        _read();
                    }
                    private void _read() {
                        this.offset = this._io.readU8le();
                        this.size = this._io.readU8le();
                    }
                    private String data;
                    public String data() {
                        if (this.data != null)
                            return this.data;
                        if (size() != 0) {
                            long _pos = this._io.pos();
                            this._io.seek(offset());
                            this.data = new String(this._io.readBytes(size()), Charset.forName("ascii"));
                            this._io.seek(_pos);
                        }
                        return this.data;
                    }
                    private long offset;
                    private long size;
                    private Lvm2 _root;
                    private Lvm2.PhysicalVolume.Label.VolumeHeader _parent;

                    /**
                     * The offset, in bytes, relative from the start of the physical volume
                     */
                    public long offset() { return offset; }

                    /**
                     * Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
                     */
                    public long size() { return size; }
                    public Lvm2 _root() { return _root; }
                    public Lvm2.PhysicalVolume.Label.VolumeHeader _parent() { return _parent; }
                }
                public static class MetadataAreaDescriptor extends KaitaiStruct {
                    public static MetadataAreaDescriptor fromFile(String fileName) throws IOException {
                        return new MetadataAreaDescriptor(new ByteBufferKaitaiStream(fileName));
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
                        _read();
                    }
                    private void _read() {
                        this.offset = this._io.readU8le();
                        this.size = this._io.readU8le();
                    }
                    private MetadataArea data;
                    public MetadataArea data() {
                        if (this.data != null)
                            return this.data;
                        if (size() != 0) {
                            long _pos = this._io.pos();
                            this._io.seek(offset());
                            this._raw_data = this._io.readBytes(size());
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                            this.data = new MetadataArea(_io__raw_data, this, _root);
                            this._io.seek(_pos);
                        }
                        return this.data;
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

                    /**
                     * Value in bytes
                     */
                    public long size() { return size; }
                    public Lvm2 _root() { return _root; }
                    public Lvm2.PhysicalVolume.Label.VolumeHeader _parent() { return _parent; }
                    public byte[] _raw_data() { return _raw_data; }
                }

                /**
                 * According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
                 */
                public static class MetadataArea extends KaitaiStruct {
                    public static MetadataArea fromFile(String fileName) throws IOException {
                        return new MetadataArea(new ByteBufferKaitaiStream(fileName));
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
                        _read();
                    }
                    private void _read() {
                        this.header = new MetadataAreaHeader(this._io, this, _root);
                    }
                    public static class MetadataAreaHeader extends KaitaiStruct {
                        public static MetadataAreaHeader fromFile(String fileName) throws IOException {
                            return new MetadataAreaHeader(new ByteBufferKaitaiStream(fileName));
                        }

                        public MetadataAreaHeader(KaitaiStream _io) {
                            this(_io, null, null);
                        }

                        public MetadataAreaHeader(KaitaiStream _io, KaitaiStruct _parent) {
                            this(_io, _parent, null);
                        }

                        public MetadataAreaHeader(KaitaiStream _io, KaitaiStruct _parent, Lvm2 _root) {
                            super(_io);
                            this._parent = _parent;
                            this._root = _root;
                            _read();
                        }
                        private void _read() {
                            this.checksum = new MetadataAreaHeader(this._io, this, _root);
                            this.signature = this._io.readBytes(16);
                            if (!(Arrays.equals(signature(), new byte[] { 32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62 }))) {
                                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62 }, signature(), _io(), "/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1");
                            }
                            this.version = this._io.readU4le();
                            this.metadataAreaOffset = this._io.readU8le();
                            this.metadataAreaSize = this._io.readU8le();
                            this.rawLocationDescriptors = new ArrayList<RawLocationDescriptor>();
                            {
                                RawLocationDescriptor _it;
                                int i = 0;
                                do {
                                    _it = new RawLocationDescriptor(this._io, this, _root);
                                    this.rawLocationDescriptors.add(_it);
                                    i++;
                                } while (!( ((_it.offset() != 0) && (_it.size() != 0) && (_it.checksum() != 0)) ));
                            }
                        }

                        /**
                         * The data area size can be 0. It is assumed it represents the remaining  available data.
                         */
                        public static class RawLocationDescriptor extends KaitaiStruct {
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
                                _read();
                            }
                            private void _read() {
                                this.offset = this._io.readU8le();
                                this.size = this._io.readU8le();
                                this.checksum = this._io.readU4le();
                                this.flags = RawLocationDescriptorFlags.byId(this._io.readU4le());
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

                            /**
                             * data area size in bytes
                             */
                            public long size() { return size; }

                            /**
                             * CRC-32 of *TODO (metadata?)*
                             */
                            public long checksum() { return checksum; }
                            public RawLocationDescriptorFlags flags() { return flags; }
                            public Lvm2 _root() { return _root; }
                            public Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader _parent() { return _parent; }
                        }
                        private byte[] metadata;
                        public byte[] metadata() {
                            if (this.metadata != null)
                                return this.metadata;
                            long _pos = this._io.pos();
                            this._io.seek(metadataAreaOffset());
                            this.metadata = this._io.readBytes(metadataAreaSize());
                            this._io.seek(_pos);
                            return this.metadata;
                        }
                        private MetadataAreaHeader checksum;
                        private byte[] signature;
                        private long version;
                        private long metadataAreaOffset;
                        private long metadataAreaSize;
                        private ArrayList<RawLocationDescriptor> rawLocationDescriptors;
                        private Lvm2 _root;
                        private KaitaiStruct _parent;

                        /**
                         * CRC-32 for offset 4 to end of the metadata area header
                         */
                        public MetadataAreaHeader checksum() { return checksum; }
                        public byte[] signature() { return signature; }
                        public long version() { return version; }

                        /**
                         * The offset, in bytes, of the metadata area relative from the start of the physical volume
                         */
                        public long metadataAreaOffset() { return metadataAreaOffset; }
                        public long metadataAreaSize() { return metadataAreaSize; }

                        /**
                         * The last descriptor in the list is terminator and consists of 0-byte values.
                         */
                        public ArrayList<RawLocationDescriptor> rawLocationDescriptors() { return rawLocationDescriptors; }
                        public Lvm2 _root() { return _root; }
                        public KaitaiStruct _parent() { return _parent; }
                    }
                    private MetadataAreaHeader header;
                    private Lvm2 _root;
                    private Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor _parent;
                    public MetadataAreaHeader header() { return header; }
                    public Lvm2 _root() { return _root; }
                    public Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor _parent() { return _parent; }
                }
                private String id;
                private long size;
                private ArrayList<DataAreaDescriptor> dataAreaDescriptors;
                private ArrayList<MetadataAreaDescriptor> metadataAreaDescriptors;
                private Lvm2 _root;
                private Lvm2.PhysicalVolume.Label _parent;

                /**
                 * Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
                 */
                public String id() { return id; }

                /**
                 * Physical Volume size. Value in bytes
                 */
                public long size() { return size; }

                /**
                 * The last descriptor in the list is terminator and consists of 0-byte values.
                 */
                public ArrayList<DataAreaDescriptor> dataAreaDescriptors() { return dataAreaDescriptors; }
                public ArrayList<MetadataAreaDescriptor> metadataAreaDescriptors() { return metadataAreaDescriptors; }
                public Lvm2 _root() { return _root; }
                public Lvm2.PhysicalVolume.Label _parent() { return _parent; }
            }
            private LabelHeader labelHeader;
            private VolumeHeader volumeHeader;
            private Lvm2 _root;
            private Lvm2.PhysicalVolume _parent;
            public LabelHeader labelHeader() { return labelHeader; }
            public VolumeHeader volumeHeader() { return volumeHeader; }
            public Lvm2 _root() { return _root; }
            public Lvm2.PhysicalVolume _parent() { return _parent; }
        }
        private byte[] emptySector;
        private Label label;
        private Lvm2 _root;
        private Lvm2 _parent;
        public byte[] emptySector() { return emptySector; }
        public Label label() { return label; }
        public Lvm2 _root() { return _root; }
        public Lvm2 _parent() { return _parent; }
    }
    private Integer sectorSize;
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        int _tmp = (int) (512);
        this.sectorSize = _tmp;
        return this.sectorSize;
    }
    private PhysicalVolume pv;
    private Lvm2 _root;
    private KaitaiStruct _parent;

    /**
     * Physical volume
     */
    public PhysicalVolume pv() { return pv; }
    public Lvm2 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
