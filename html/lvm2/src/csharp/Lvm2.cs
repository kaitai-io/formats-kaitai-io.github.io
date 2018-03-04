// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// ### Building a test file
    /// 
    /// ```
    /// dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
    /// sudo losetup /dev/loop1 image.img
    /// sudo pvcreate /dev/loop1
    /// sudo vgcreate vg_test /dev/loop1
    /// sudo lvcreate --name lv_test1 vg_test
    /// sudo losetup -d /dev/loop1
    /// ```
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/libyal/libvslvm/blob/master/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc">Source</a>
    /// </remarks>
    public partial class Lvm2 : KaitaiStruct
    {
        public static Lvm2 FromFile(string fileName)
        {
            return new Lvm2(new KaitaiStream(fileName));
        }

        public Lvm2(KaitaiStream p__io, KaitaiStruct p__parent = null, Lvm2 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_sectorSize = false;
            _read();
        }
        private void _read()
        {
            _pv = new PhysicalVolume(m_io, this, m_root);
        }
        public partial class PhysicalVolume : KaitaiStruct
        {
            public static PhysicalVolume FromFile(string fileName)
            {
                return new PhysicalVolume(new KaitaiStream(fileName));
            }

            public PhysicalVolume(KaitaiStream p__io, Lvm2 p__parent = null, Lvm2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _emptySector = m_io.ReadBytes(M_Root.SectorSize);
                _label = new Label(m_io, this, m_root);
            }
            public partial class Label : KaitaiStruct
            {
                public static Label FromFile(string fileName)
                {
                    return new Label(new KaitaiStream(fileName));
                }

                public Label(KaitaiStream p__io, Lvm2.PhysicalVolume p__parent = null, Lvm2 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _labelHeader = new LabelHeader(m_io, this, m_root);
                    _volumeHeader = new VolumeHeader(m_io, this, m_root);
                }
                public partial class LabelHeader : KaitaiStruct
                {
                    public static LabelHeader FromFile(string fileName)
                    {
                        return new LabelHeader(new KaitaiStream(fileName));
                    }

                    public LabelHeader(KaitaiStream p__io, Lvm2.PhysicalVolume.Label p__parent = null, Lvm2 p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _signature = m_io.EnsureFixedContents(new byte[] { 76, 65, 66, 69, 76, 79, 78, 69 });
                        _sectorNumber = m_io.ReadU8le();
                        _checksum = m_io.ReadU4le();
                        _labelHeader = new LabelHeader(m_io, this, m_root);
                    }
                    public partial class LabelHeader : KaitaiStruct
                    {
                        public static LabelHeader FromFile(string fileName)
                        {
                            return new LabelHeader(new KaitaiStream(fileName));
                        }

                        public LabelHeader(KaitaiStream p__io, Lvm2.PhysicalVolume.Label.LabelHeader p__parent = null, Lvm2 p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _dataOffset = m_io.ReadU4le();
                            _typeIndicator = m_io.EnsureFixedContents(new byte[] { 76, 86, 77, 50, 32, 48, 48, 49 });
                        }
                        private uint _dataOffset;
                        private byte[] _typeIndicator;
                        private Lvm2 m_root;
                        private Lvm2.PhysicalVolume.Label.LabelHeader m_parent;

                        /// <summary>
                        /// The offset, in bytes, relative from the start of the physical volume label header where data is stored
                        /// </summary>
                        public uint DataOffset { get { return _dataOffset; } }
                        public byte[] TypeIndicator { get { return _typeIndicator; } }
                        public Lvm2 M_Root { get { return m_root; } }
                        public Lvm2.PhysicalVolume.Label.LabelHeader M_Parent { get { return m_parent; } }
                    }
                    private byte[] _signature;
                    private ulong _sectorNumber;
                    private uint _checksum;
                    private LabelHeader _labelHeader;
                    private Lvm2 m_root;
                    private Lvm2.PhysicalVolume.Label m_parent;
                    public byte[] Signature { get { return _signature; } }

                    /// <summary>
                    /// The sector number of the physical volume label header
                    /// </summary>
                    public ulong SectorNumber { get { return _sectorNumber; } }

                    /// <summary>
                    /// CRC-32 for offset 20 to end of the physical volume label sector
                    /// </summary>
                    public uint Checksum { get { return _checksum; } }
                    public LabelHeader LabelHeader { get { return _labelHeader; } }
                    public Lvm2 M_Root { get { return m_root; } }
                    public Lvm2.PhysicalVolume.Label M_Parent { get { return m_parent; } }
                }
                public partial class VolumeHeader : KaitaiStruct
                {
                    public static VolumeHeader FromFile(string fileName)
                    {
                        return new VolumeHeader(new KaitaiStream(fileName));
                    }

                    public VolumeHeader(KaitaiStream p__io, Lvm2.PhysicalVolume.Label p__parent = null, Lvm2 p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _id = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(32));
                        _size = m_io.ReadU8le();
                        _dataAreaDescriptors = new List<DataAreaDescriptor>();
                        {
                            var i = 0;
                            DataAreaDescriptor M_;
                            do {
                                M_ = new DataAreaDescriptor(m_io, this, m_root);
                                _dataAreaDescriptors.Add(M_);
                                i++;
                            } while (!( ((M_.Size != 0) && (M_.Offset != 0)) ));
                        }
                        _metadataAreaDescriptors = new List<MetadataAreaDescriptor>();
                        {
                            var i = 0;
                            MetadataAreaDescriptor M_;
                            do {
                                M_ = new MetadataAreaDescriptor(m_io, this, m_root);
                                _metadataAreaDescriptors.Add(M_);
                                i++;
                            } while (!( ((M_.Size != 0) && (M_.Offset != 0)) ));
                        }
                    }
                    public partial class DataAreaDescriptor : KaitaiStruct
                    {
                        public static DataAreaDescriptor FromFile(string fileName)
                        {
                            return new DataAreaDescriptor(new KaitaiStream(fileName));
                        }

                        public DataAreaDescriptor(KaitaiStream p__io, Lvm2.PhysicalVolume.Label.VolumeHeader p__parent = null, Lvm2 p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            f_data = false;
                            _read();
                        }
                        private void _read()
                        {
                            _offset = m_io.ReadU8le();
                            _size = m_io.ReadU8le();
                        }
                        private bool f_data;
                        private string _data;
                        public string Data
                        {
                            get
                            {
                                if (f_data)
                                    return _data;
                                if (Size != 0) {
                                    long _pos = m_io.Pos;
                                    m_io.Seek(Offset);
                                    _data = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(Size));
                                    m_io.Seek(_pos);
                                }
                                f_data = true;
                                return _data;
                            }
                        }
                        private ulong _offset;
                        private ulong _size;
                        private Lvm2 m_root;
                        private Lvm2.PhysicalVolume.Label.VolumeHeader m_parent;

                        /// <summary>
                        /// The offset, in bytes, relative from the start of the physical volume
                        /// </summary>
                        public ulong Offset { get { return _offset; } }

                        /// <summary>
                        /// Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
                        /// </summary>
                        public ulong Size { get { return _size; } }
                        public Lvm2 M_Root { get { return m_root; } }
                        public Lvm2.PhysicalVolume.Label.VolumeHeader M_Parent { get { return m_parent; } }
                    }
                    public partial class MetadataAreaDescriptor : KaitaiStruct
                    {
                        public static MetadataAreaDescriptor FromFile(string fileName)
                        {
                            return new MetadataAreaDescriptor(new KaitaiStream(fileName));
                        }

                        public MetadataAreaDescriptor(KaitaiStream p__io, Lvm2.PhysicalVolume.Label.VolumeHeader p__parent = null, Lvm2 p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            f_data = false;
                            _read();
                        }
                        private void _read()
                        {
                            _offset = m_io.ReadU8le();
                            _size = m_io.ReadU8le();
                        }
                        private bool f_data;
                        private MetadataArea _data;
                        public MetadataArea Data
                        {
                            get
                            {
                                if (f_data)
                                    return _data;
                                if (Size != 0) {
                                    long _pos = m_io.Pos;
                                    m_io.Seek(Offset);
                                    __raw_data = m_io.ReadBytes(Size);
                                    var io___raw_data = new KaitaiStream(__raw_data);
                                    _data = new MetadataArea(io___raw_data, this, m_root);
                                    m_io.Seek(_pos);
                                }
                                f_data = true;
                                return _data;
                            }
                        }
                        private ulong _offset;
                        private ulong _size;
                        private Lvm2 m_root;
                        private Lvm2.PhysicalVolume.Label.VolumeHeader m_parent;
                        private byte[] __raw_data;

                        /// <summary>
                        /// The offset, in bytes, relative from the start of the physical volume
                        /// </summary>
                        public ulong Offset { get { return _offset; } }

                        /// <summary>
                        /// Value in bytes
                        /// </summary>
                        public ulong Size { get { return _size; } }
                        public Lvm2 M_Root { get { return m_root; } }
                        public Lvm2.PhysicalVolume.Label.VolumeHeader M_Parent { get { return m_parent; } }
                        public byte[] M_RawData { get { return __raw_data; } }
                    }

                    /// <summary>
                    /// According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
                    /// </summary>
                    public partial class MetadataArea : KaitaiStruct
                    {
                        public static MetadataArea FromFile(string fileName)
                        {
                            return new MetadataArea(new KaitaiStream(fileName));
                        }

                        public MetadataArea(KaitaiStream p__io, Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor p__parent = null, Lvm2 p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _header = new MetadataAreaHeader(m_io, this, m_root);
                        }
                        public partial class MetadataAreaHeader : KaitaiStruct
                        {
                            public static MetadataAreaHeader FromFile(string fileName)
                            {
                                return new MetadataAreaHeader(new KaitaiStream(fileName));
                            }

                            public MetadataAreaHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, Lvm2 p__root = null) : base(p__io)
                            {
                                m_parent = p__parent;
                                m_root = p__root;
                                f_metadata = false;
                                _read();
                            }
                            private void _read()
                            {
                                _checksum = new MetadataAreaHeader(m_io, this, m_root);
                                _signature = m_io.EnsureFixedContents(new byte[] { 32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62 });
                                _version = m_io.ReadU4le();
                                _metadataAreaOffset = m_io.ReadU8le();
                                _metadataAreaSize = m_io.ReadU8le();
                                _rawLocationDescriptors = new List<RawLocationDescriptor>();
                                {
                                    var i = 0;
                                    RawLocationDescriptor M_;
                                    do {
                                        M_ = new RawLocationDescriptor(m_io, this, m_root);
                                        _rawLocationDescriptors.Add(M_);
                                        i++;
                                    } while (!( ((M_.Offset != 0) && (M_.Size != 0) && (M_.Checksum != 0)) ));
                                }
                            }

                            /// <summary>
                            /// The data area size can be 0. It is assumed it represents the remaining  available data.
                            /// </summary>
                            public partial class RawLocationDescriptor : KaitaiStruct
                            {
                                public static RawLocationDescriptor FromFile(string fileName)
                                {
                                    return new RawLocationDescriptor(new KaitaiStream(fileName));
                                }


                                public enum RawLocationDescriptorFlags
                                {
                                    RawLocationIgnored = 1,
                                }
                                public RawLocationDescriptor(KaitaiStream p__io, Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader p__parent = null, Lvm2 p__root = null) : base(p__io)
                                {
                                    m_parent = p__parent;
                                    m_root = p__root;
                                    _read();
                                }
                                private void _read()
                                {
                                    _offset = m_io.ReadU8le();
                                    _size = m_io.ReadU8le();
                                    _checksum = m_io.ReadU4le();
                                    _flags = ((RawLocationDescriptorFlags) m_io.ReadU4le());
                                }
                                private ulong _offset;
                                private ulong _size;
                                private uint _checksum;
                                private RawLocationDescriptorFlags _flags;
                                private Lvm2 m_root;
                                private Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader m_parent;

                                /// <summary>
                                /// The data area offset, in bytes, relative from the start of the metadata area
                                /// </summary>
                                public ulong Offset { get { return _offset; } }

                                /// <summary>
                                /// data area size in bytes
                                /// </summary>
                                public ulong Size { get { return _size; } }

                                /// <summary>
                                /// CRC-32 of *TODO (metadata?)*
                                /// </summary>
                                public uint Checksum { get { return _checksum; } }
                                public RawLocationDescriptorFlags Flags { get { return _flags; } }
                                public Lvm2 M_Root { get { return m_root; } }
                                public Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader M_Parent { get { return m_parent; } }
                            }
                            private bool f_metadata;
                            private byte[] _metadata;
                            public byte[] Metadata
                            {
                                get
                                {
                                    if (f_metadata)
                                        return _metadata;
                                    long _pos = m_io.Pos;
                                    m_io.Seek(MetadataAreaOffset);
                                    _metadata = m_io.ReadBytes(MetadataAreaSize);
                                    m_io.Seek(_pos);
                                    f_metadata = true;
                                    return _metadata;
                                }
                            }
                            private MetadataAreaHeader _checksum;
                            private byte[] _signature;
                            private uint _version;
                            private ulong _metadataAreaOffset;
                            private ulong _metadataAreaSize;
                            private List<RawLocationDescriptor> _rawLocationDescriptors;
                            private Lvm2 m_root;
                            private KaitaiStruct m_parent;

                            /// <summary>
                            /// CRC-32 for offset 4 to end of the metadata area header
                            /// </summary>
                            public MetadataAreaHeader Checksum { get { return _checksum; } }
                            public byte[] Signature { get { return _signature; } }
                            public uint Version { get { return _version; } }

                            /// <summary>
                            /// The offset, in bytes, of the metadata area relative from the start of the physical volume
                            /// </summary>
                            public ulong MetadataAreaOffset { get { return _metadataAreaOffset; } }
                            public ulong MetadataAreaSize { get { return _metadataAreaSize; } }

                            /// <summary>
                            /// The last descriptor in the list is terminator and consists of 0-byte values.
                            /// </summary>
                            public List<RawLocationDescriptor> RawLocationDescriptors { get { return _rawLocationDescriptors; } }
                            public Lvm2 M_Root { get { return m_root; } }
                            public KaitaiStruct M_Parent { get { return m_parent; } }
                        }
                        private MetadataAreaHeader _header;
                        private Lvm2 m_root;
                        private Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor m_parent;
                        public MetadataAreaHeader Header { get { return _header; } }
                        public Lvm2 M_Root { get { return m_root; } }
                        public Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor M_Parent { get { return m_parent; } }
                    }
                    private string _id;
                    private ulong _size;
                    private List<DataAreaDescriptor> _dataAreaDescriptors;
                    private List<MetadataAreaDescriptor> _metadataAreaDescriptors;
                    private Lvm2 m_root;
                    private Lvm2.PhysicalVolume.Label m_parent;

                    /// <summary>
                    /// Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
                    /// </summary>
                    public string Id { get { return _id; } }

                    /// <summary>
                    /// Physical Volume size. Value in bytes
                    /// </summary>
                    public ulong Size { get { return _size; } }

                    /// <summary>
                    /// The last descriptor in the list is terminator and consists of 0-byte values.
                    /// </summary>
                    public List<DataAreaDescriptor> DataAreaDescriptors { get { return _dataAreaDescriptors; } }
                    public List<MetadataAreaDescriptor> MetadataAreaDescriptors { get { return _metadataAreaDescriptors; } }
                    public Lvm2 M_Root { get { return m_root; } }
                    public Lvm2.PhysicalVolume.Label M_Parent { get { return m_parent; } }
                }
                private LabelHeader _labelHeader;
                private VolumeHeader _volumeHeader;
                private Lvm2 m_root;
                private Lvm2.PhysicalVolume m_parent;
                public LabelHeader LabelHeader { get { return _labelHeader; } }
                public VolumeHeader VolumeHeader { get { return _volumeHeader; } }
                public Lvm2 M_Root { get { return m_root; } }
                public Lvm2.PhysicalVolume M_Parent { get { return m_parent; } }
            }
            private byte[] _emptySector;
            private Label _label;
            private Lvm2 m_root;
            private Lvm2 m_parent;
            public byte[] EmptySector { get { return _emptySector; } }
            public Label Label { get { return _label; } }
            public Lvm2 M_Root { get { return m_root; } }
            public Lvm2 M_Parent { get { return m_parent; } }
        }
        private bool f_sectorSize;
        private int _sectorSize;
        public int SectorSize
        {
            get
            {
                if (f_sectorSize)
                    return _sectorSize;
                _sectorSize = (int) (512);
                f_sectorSize = true;
                return _sectorSize;
            }
        }
        private PhysicalVolume _pv;
        private Lvm2 m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Physical volume
        /// </summary>
        public PhysicalVolume Pv { get { return _pv; } }
        public Lvm2 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
