// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// The data format of Macintosh resource forks,
    /// used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
    /// The kinds of data stored in resource forks include:
    /// 
    /// * Document resources:
    ///   images, sounds, etc. used by a document
    /// * Application resources:
    ///   graphics, GUI layouts, localizable strings,
    ///   and even code used by an application, a library, or system files
    /// * Common metadata:
    ///   custom icons and version metadata that could be displayed by the Finder
    /// * Application-specific metadata:
    ///   because resource forks follow a common format,
    ///   other applications can store new metadata in them,
    ///   even if the original application does not recognize or understand it
    /// 
    /// Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
    /// which allows storing resources along with any file.
    /// Non-Macintosh file systems and protocols have little or no support for resource forks,
    /// so the resource fork data must be stored in some other way when using such file systems or protocols.
    /// Various file formats and tools exist for this purpose,
    /// such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
    /// In some cases,
    /// resource forks are stored as plain data in separate files with a .rsrc extension,
    /// even on Mac systems that natively support resource forks.
    /// 
    /// On modern Mac OS X/macOS systems,
    /// resource forks are used far less commonly than on classic Mac OS systems,
    /// because of compatibility issues with other systems and historical limitations in the format.
    /// Modern macOS APIs and libraries do not use resource forks,
    /// and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
    /// Despite this,
    /// even current macOS systems still use resource forks for certain purposes,
    /// such as custom file icons.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151">Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://www.pagetable.com/?p=50">Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks">Source</a>
    /// </remarks>
    public partial class ResourceFork : KaitaiStruct
    {
        public static ResourceFork FromFile(string fileName)
        {
            return new ResourceFork(new KaitaiStream(fileName));
        }

        public ResourceFork(KaitaiStream p__io, KaitaiStruct p__parent = null, ResourceFork p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_dataBlocks = false;
            f_dataBlocksWithIo = false;
            f_resourceMap = false;
            _read();
        }
        private void _read()
        {
            _header = new FileHeader(m_io, this, m_root);
            _systemData = m_io.ReadBytes(112);
            _applicationData = m_io.ReadBytes(128);
        }

        /// <summary>
        /// A resource data block,
        /// as stored in the resource data area.
        /// 
        /// Each data block stores the data contained in a resource,
        /// along with its length.
        /// </summary>
        public partial class DataBlock : KaitaiStruct
        {
            public static DataBlock FromFile(string fileName)
            {
                return new DataBlock(new KaitaiStream(fileName));
            }

            public DataBlock(KaitaiStream p__io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference p__parent = null, ResourceFork p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenData = m_io.ReadU4be();
                _data = m_io.ReadBytes(LenData);
            }
            private uint _lenData;
            private byte[] _data;
            private ResourceFork m_root;
            private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference m_parent;

            /// <summary>
            /// The length of the resource data stored in this block.
            /// </summary>
            public uint LenData { get { return _lenData; } }

            /// <summary>
            /// The data stored in this block.
            /// </summary>
            public byte[] Data { get { return _data; } }
            public ResourceFork M_Root { get { return m_root; } }
            public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Resource file header,
        /// containing the offsets and lengths of the resource data area and resource map.
        /// </summary>
        public partial class FileHeader : KaitaiStruct
        {
            public static FileHeader FromFile(string fileName)
            {
                return new FileHeader(new KaitaiStream(fileName));
            }

            public FileHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, ResourceFork p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _ofsDataBlocks = m_io.ReadU4be();
                _ofsResourceMap = m_io.ReadU4be();
                _lenDataBlocks = m_io.ReadU4be();
                _lenResourceMap = m_io.ReadU4be();
            }
            private uint _ofsDataBlocks;
            private uint _ofsResourceMap;
            private uint _lenDataBlocks;
            private uint _lenResourceMap;
            private ResourceFork m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Offset of the resource data area,
            /// from the start of the resource file.
            /// 
            /// In practice,
            /// this should always be `256`,
            /// i. e. the resource data area should directly follow the application-specific data area.
            /// </summary>
            public uint OfsDataBlocks { get { return _ofsDataBlocks; } }

            /// <summary>
            /// Offset of the resource map,
            /// from the start of the resource file.
            /// 
            /// In practice,
            /// this should always be `ofs_data_blocks + len_data_blocks`,
            /// i. e. the resource map should directly follow the resource data area.
            /// </summary>
            public uint OfsResourceMap { get { return _ofsResourceMap; } }

            /// <summary>
            /// Length of the resource data area.
            /// </summary>
            public uint LenDataBlocks { get { return _lenDataBlocks; } }

            /// <summary>
            /// Length of the resource map.
            /// 
            /// In practice,
            /// this should always be `_root._io.size - ofs_resource_map`,
            /// i. e. the resource map should extend to the end of the resource file.
            /// </summary>
            public uint LenResourceMap { get { return _lenResourceMap; } }
            public ResourceFork M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Resource map,
        /// containing information about the resources in the file and where they are located in the data area.
        /// </summary>
        public partial class ResourceMap : KaitaiStruct
        {
            public static ResourceMap FromFile(string fileName)
            {
                return new ResourceMap(new KaitaiStream(fileName));
            }

            public ResourceMap(KaitaiStream p__io, ResourceFork p__parent = null, ResourceFork p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_names = false;
                f_namesWithIo = false;
                f_typeListAndReferenceLists = false;
                _read();
            }
            private void _read()
            {
                _reservedFileHeaderCopy = new FileHeader(m_io, this, m_root);
                _reservedNextResourceMapHandle = m_io.ReadU4be();
                _reservedFileReferenceNumber = m_io.ReadU2be();
                __raw_fileAttributes = m_io.ReadBytes(2);
                var io___raw_fileAttributes = new KaitaiStream(__raw_fileAttributes);
                _fileAttributes = new FileAttributes(io___raw_fileAttributes, this, m_root);
                _ofsTypeList = m_io.ReadU2be();
                _ofsNames = m_io.ReadU2be();
            }

            /// <summary>
            /// A resource file's attributes,
            /// as stored in the resource map.
            /// 
            /// These attributes are sometimes also referred to as resource map attributes,
            /// because of where they are stored in the file.
            /// </summary>
            public partial class FileAttributes : KaitaiStruct
            {
                public static FileAttributes FromFile(string fileName)
                {
                    return new FileAttributes(new KaitaiStream(fileName));
                }

                public FileAttributes(KaitaiStream p__io, ResourceFork.ResourceMap p__parent = null, ResourceFork p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_asInt = false;
                    _read();
                }
                private void _read()
                {
                    _resourcesLocked = m_io.ReadBitsIntBe(1) != 0;
                    _reserved0 = m_io.ReadBitsIntBe(6);
                    _printerDriverMultifinderCompatible = m_io.ReadBitsIntBe(1) != 0;
                    _noWriteChanges = m_io.ReadBitsIntBe(1) != 0;
                    _needsCompact = m_io.ReadBitsIntBe(1) != 0;
                    _mapNeedsWrite = m_io.ReadBitsIntBe(1) != 0;
                    _reserved1 = m_io.ReadBitsIntBe(5);
                }
                private bool f_asInt;
                private ushort _asInt;

                /// <summary>
                /// The attributes as a packed integer,
                /// as they are stored in the file.
                /// </summary>
                public ushort AsInt
                {
                    get
                    {
                        if (f_asInt)
                            return _asInt;
                        f_asInt = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _asInt = m_io.ReadU2be();
                        m_io.Seek(_pos);
                        return _asInt;
                    }
                }
                private bool _resourcesLocked;
                private ulong _reserved0;
                private bool _printerDriverMultifinderCompatible;
                private bool _noWriteChanges;
                private bool _needsCompact;
                private bool _mapNeedsWrite;
                private ulong _reserved1;
                private ResourceFork m_root;
                private ResourceFork.ResourceMap m_parent;

                /// <summary>
                /// TODO What does this attribute actually do,
                /// and how is it different from `read_only`?
                /// 
                /// This attribute is undocumented and not defined in &lt;CarbonCore/Resources.h&gt;,
                /// but ResEdit has a checkbox called &quot;Resources Locked&quot; for this attribute.
                /// </summary>
                public bool ResourcesLocked { get { return _resourcesLocked; } }

                /// <summary>
                /// These attributes have no known usage or meaning and should always be zero.
                /// </summary>
                public ulong Reserved0 { get { return _reserved0; } }

                /// <summary>
                /// Indicates that this printer driver is compatible with MultiFinder,
                /// i. e. can be used simultaneously by multiple applications.
                /// This attribute is only meant to be set on printer driver resource forks.
                /// 
                /// This attribute is not documented in Inside Macintosh and is not defined in &lt;CarbonCore/Resources.h&gt;.
                /// It is documented in technote PR510,
                /// and ResEdit has a checkbox called &quot;Printer Driver MultiFinder Compatible&quot; for this attribute.
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://developer.apple.com/library/archive/technotes/pr/pr_510.html">Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit'</a>
                /// </remarks>
                public bool PrinterDriverMultifinderCompatible { get { return _printerDriverMultifinderCompatible; } }

                /// <summary>
                /// Indicates that the Resource Manager should not write any changes from memory into the resource file.
                /// Any modification operations requested by the application will return successfully,
                /// but will not actually update the resource file.
                /// 
                /// TODO Is this attribute supposed to be set on disk or only in memory?
                /// </summary>
                public bool NoWriteChanges { get { return _noWriteChanges; } }

                /// <summary>
                /// Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
                /// This attribute is only meant to be set in memory;
                /// it is cleared when the resource file is written to disk.
                /// 
                /// This attribute is mainly used internally by the Resource Manager,
                /// but may also be set manually by the application.
                /// </summary>
                public bool NeedsCompact { get { return _needsCompact; } }

                /// <summary>
                /// Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
                /// This attribute is only meant to be set in memory;
                /// it is cleared when the resource file is written to disk.
                /// 
                /// This attribute is mainly used internally by the Resource Manager,
                /// but may also be set manually by the application.
                /// </summary>
                public bool MapNeedsWrite { get { return _mapNeedsWrite; } }

                /// <summary>
                /// These attributes have no known usage or meaning and should always be zero.
                /// </summary>
                public ulong Reserved1 { get { return _reserved1; } }
                public ResourceFork M_Root { get { return m_root; } }
                public ResourceFork.ResourceMap M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// A resource name,
            /// as stored in the resource name storage area in the resource map.
            /// 
            /// The resource names are not required to appear in any particular order.
            /// There may be unused space between and around resource names,
            /// but in practice they are often contiguous.
            /// </summary>
            public partial class Name : KaitaiStruct
            {
                public static Name FromFile(string fileName)
                {
                    return new Name(new KaitaiStream(fileName));
                }

                public Name(KaitaiStream p__io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference p__parent = null, ResourceFork p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _lenValue = m_io.ReadU1();
                    _value = m_io.ReadBytes(LenValue);
                }
                private byte _lenValue;
                private byte[] _value;
                private ResourceFork m_root;
                private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference m_parent;

                /// <summary>
                /// The length of the resource name, in bytes.
                /// </summary>
                public byte LenValue { get { return _lenValue; } }

                /// <summary>
                /// The resource name.
                /// 
                /// This field is exposed as a byte array,
                /// because there is no universal encoding for resource names.
                /// Most Classic Mac software does not deal with encodings explicitly and instead assumes that all strings,
                /// including resource names,
                /// use the system encoding,
                /// which varies depending on the system language.
                /// This means that resource names can use different encodings depending on what system language they were created with.
                /// 
                /// Many resource names are plain ASCII,
                /// meaning that the encoding often does not matter
                /// (because all Mac OS encodings are ASCII-compatible).
                /// For non-ASCII resource names,
                /// the most common encoding is perhaps MacRoman
                /// (used for English and other Western languages),
                /// but other encodings are also sometimes used,
                /// especially for software in non-Western languages.
                /// 
                /// There is no requirement that all names in a single resource file use the same encoding.
                /// For example,
                /// localized software may have some (but not all) of its resource names translated.
                /// For non-Western languages,
                /// this can lead to some resource names using MacRoman,
                /// and others using a different encoding.
                /// </summary>
                public byte[] Value { get { return _value; } }
                public ResourceFork M_Root { get { return m_root; } }
                public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Resource type list and storage area for resource reference lists in the resource map.
            /// 
            /// The two parts are combined into a single type here for technical reasons:
            /// the start of the resource reference list area is not stored explicitly in the file,
            /// instead it always starts directly after the resource type list.
            /// The simplest way to implement this is by placing both types into a single `seq`.
            /// </summary>
            public partial class TypeListAndReferenceLists : KaitaiStruct
            {
                public static TypeListAndReferenceLists FromFile(string fileName)
                {
                    return new TypeListAndReferenceLists(new KaitaiStream(fileName));
                }

                public TypeListAndReferenceLists(KaitaiStream p__io, ResourceFork.ResourceMap p__parent = null, ResourceFork p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _typeList = new TypeList(m_io, this, m_root);
                    _referenceLists = m_io.ReadBytesFull();
                }

                /// <summary>
                /// A resource reference list,
                /// as stored in the reference list area.
                /// 
                /// Each reference list has exactly one matching entry in the resource type list,
                /// and describes all resources of a single type in the file.
                /// </summary>
                public partial class ReferenceList : KaitaiStruct
                {
                    public ReferenceList(ushort p_numReferences, KaitaiStream p__io, ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry p__parent = null, ResourceFork p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _numReferences = p_numReferences;
                        _read();
                    }
                    private void _read()
                    {
                        _references = new List<Reference>();
                        for (var i = 0; i < NumReferences; i++)
                        {
                            _references.Add(new Reference(m_io, this, m_root));
                        }
                    }

                    /// <summary>
                    /// A single resource reference in a resource reference list.
                    /// </summary>
                    public partial class Reference : KaitaiStruct
                    {
                        public static Reference FromFile(string fileName)
                        {
                            return new Reference(new KaitaiStream(fileName));
                        }

                        public Reference(KaitaiStream p__io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList p__parent = null, ResourceFork p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            f_dataBlock = false;
                            f_name = false;
                            _read();
                        }
                        private void _read()
                        {
                            _id = m_io.ReadS2be();
                            _ofsName = m_io.ReadU2be();
                            __raw_attributes = m_io.ReadBytes(1);
                            var io___raw_attributes = new KaitaiStream(__raw_attributes);
                            _attributes = new Attributes(io___raw_attributes, this, m_root);
                            _ofsDataBlock = m_io.ReadBitsIntBe(24);
                            m_io.AlignToByte();
                            _reservedHandle = m_io.ReadU4be();
                        }

                        /// <summary>
                        /// A resource's attributes,
                        /// as stored in a resource reference.
                        /// </summary>
                        public partial class Attributes : KaitaiStruct
                        {
                            public static Attributes FromFile(string fileName)
                            {
                                return new Attributes(new KaitaiStream(fileName));
                            }

                            public Attributes(KaitaiStream p__io, ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference p__parent = null, ResourceFork p__root = null) : base(p__io)
                            {
                                m_parent = p__parent;
                                m_root = p__root;
                                f_asInt = false;
                                _read();
                            }
                            private void _read()
                            {
                                _systemReference = m_io.ReadBitsIntBe(1) != 0;
                                _loadIntoSystemHeap = m_io.ReadBitsIntBe(1) != 0;
                                _purgeable = m_io.ReadBitsIntBe(1) != 0;
                                _locked = m_io.ReadBitsIntBe(1) != 0;
                                _protected = m_io.ReadBitsIntBe(1) != 0;
                                _preload = m_io.ReadBitsIntBe(1) != 0;
                                _needsWrite = m_io.ReadBitsIntBe(1) != 0;
                                _compressed = m_io.ReadBitsIntBe(1) != 0;
                            }
                            private bool f_asInt;
                            private byte _asInt;

                            /// <summary>
                            /// The attributes as a packed integer,
                            /// as they are stored in the file.
                            /// </summary>
                            public byte AsInt
                            {
                                get
                                {
                                    if (f_asInt)
                                        return _asInt;
                                    f_asInt = true;
                                    long _pos = m_io.Pos;
                                    m_io.Seek(0);
                                    _asInt = m_io.ReadU1();
                                    m_io.Seek(_pos);
                                    return _asInt;
                                }
                            }
                            private bool _systemReference;
                            private bool _loadIntoSystemHeap;
                            private bool _purgeable;
                            private bool _locked;
                            private bool _protected;
                            private bool _preload;
                            private bool _needsWrite;
                            private bool _compressed;
                            private ResourceFork m_root;
                            private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference m_parent;

                            /// <summary>
                            /// Indicates that this resource reference is a system reference rather than a regular local reference.
                            /// This attribute is nearly undocumented.
                            /// For all practical purposes,
                            /// it should be considered reserved and should always be zero.
                            /// 
                            /// This attribute was last documented in the Promotional Edition of Inside Macintosh,
                            /// in the Resource Manager chapter,
                            /// on pages 37-41,
                            /// in a &quot;System References&quot; section that calls itself &quot;of historical interest only&quot;.
                            /// The final versions of Inside Macintosh only mention this attribute as &quot;reserved for use by the Resource Manager&quot;.
                            /// &lt;CarbonCore/Resources.h&gt; contains a `resSysRefBit` constant,
                            /// but no corresponding `resSysRef` constant like for all other resource attributes.
                            /// 
                            /// According to the Inside Macintosh Promotional Edition,
                            /// a system reference was effectively an alias pointing to a resource stored in the system file,
                            /// possibly with a different ID and name (but not type) than the system reference.
                            /// If this attribute is set,
                            /// `ofs_data_block` is ignored and should be zero,
                            /// and `reserved_handle` contains
                            /// (in its high and low two bytes, respectively)
                            /// the ID and name offset of the real system resource that this system reference points to.
                            /// 
                            /// TODO Do any publicly available Mac OS versions support system references,
                            /// and do any real files/applications use them?
                            /// So far the answer seems to be no,
                            /// but I would like to be proven wrong!
                            /// </summary>
                            public bool SystemReference { get { return _systemReference; } }

                            /// <summary>
                            /// Indicates that this resource should be loaded into the system heap if possible,
                            /// rather than the application heap.
                            /// 
                            /// This attribute is only meant to be used by Mac OS itself,
                            /// for System and Finder resources,
                            /// and not by normal applications.
                            /// 
                            /// This attribute may be set both in memory and on disk,
                            /// but it only has any meaning while the resource file is loaded into memory.
                            /// </summary>
                            public bool LoadIntoSystemHeap { get { return _loadIntoSystemHeap; } }

                            /// <summary>
                            /// Indicates that this resource's data should be purgeable by the Mac OS Memory Manager.
                            /// This allows the resource data to be purged from memory if space is needed on the heap.
                            /// Purged resources can later be reloaded from disk if their data is needed again.
                            /// 
                            /// If the `locked` attribute is set,
                            /// this attribute has no effect
                            /// (i. e. locked resources are never purgeable).
                            /// 
                            /// This attribute may be set both in memory and on disk,
                            /// but it only has any meaning while the resource file is loaded into memory.
                            /// </summary>
                            public bool Purgeable { get { return _purgeable; } }

                            /// <summary>
                            /// Indicates that this resource's data should be locked to the Mac OS Memory Manager.
                            /// This prevents the resource data from being moved when the heap is compacted.
                            /// 
                            /// This attribute may be set both in memory and on disk,
                            /// but it only has any meaning while the resource file is loaded into memory.
                            /// </summary>
                            public bool Locked { get { return _locked; } }

                            /// <summary>
                            /// Indicates that this resource should be protected (i. e. unmodifiable) in memory.
                            /// This prevents the application from using the Resource Manager to change the resource's data or metadata,
                            /// or delete it.
                            /// The only exception are the resource's attributes,
                            /// which can always be changed,
                            /// even for protected resources.
                            /// This allows protected resources to be unprotected again by the application.
                            /// 
                            /// This attribute may be set both in memory and on disk,
                            /// but it only has any meaning while the resource file is loaded into memory.
                            /// </summary>
                            public bool Protected { get { return _protected; } }

                            /// <summary>
                            /// Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
                            /// 
                            /// This attribute may be set both in memory and on disk,
                            /// but it only has any meaning when the resource file is first opened.
                            /// </summary>
                            public bool Preload { get { return _preload; } }

                            /// <summary>
                            /// Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
                            /// This attribute is only meant to be set in memory;
                            /// it is cleared when the resource file is written to disk.
                            /// 
                            /// This attribute is used internally by the Resource Manager and should not be set manually by the application.
                            /// </summary>
                            public bool NeedsWrite { get { return _needsWrite; } }

                            /// <summary>
                            /// Indicates that this resource's data is compressed.
                            /// Compressed resource data is decompressed transparently by the Resource Manager when reading.
                            /// 
                            /// For a detailed description of the structure of compressed resources as they are stored in the file,
                            /// see the compressed_resource.ksy spec.
                            /// </summary>
                            public bool Compressed { get { return _compressed; } }
                            public ResourceFork M_Root { get { return m_root; } }
                            public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList.Reference M_Parent { get { return m_parent; } }
                        }
                        private bool f_dataBlock;
                        private DataBlock _dataBlock;

                        /// <summary>
                        /// The data block containing the data for the resource described by this reference.
                        /// </summary>
                        public DataBlock DataBlock
                        {
                            get
                            {
                                if (f_dataBlock)
                                    return _dataBlock;
                                f_dataBlock = true;
                                KaitaiStream io = M_Root.DataBlocksWithIo.M_Io;
                                long _pos = io.Pos;
                                io.Seek(OfsDataBlock);
                                _dataBlock = new DataBlock(io, this, m_root);
                                io.Seek(_pos);
                                return _dataBlock;
                            }
                        }
                        private bool f_name;
                        private Name _name;

                        /// <summary>
                        /// The name (if any) of the resource described by this reference.
                        /// </summary>
                        public Name Name
                        {
                            get
                            {
                                if (f_name)
                                    return _name;
                                f_name = true;
                                if (OfsName != 65535) {
                                    KaitaiStream io = M_Root.ResourceMap.NamesWithIo.M_Io;
                                    long _pos = io.Pos;
                                    io.Seek(OfsName);
                                    _name = new Name(io, this, m_root);
                                    io.Seek(_pos);
                                }
                                return _name;
                            }
                        }
                        private short _id;
                        private ushort _ofsName;
                        private Attributes _attributes;
                        private ulong _ofsDataBlock;
                        private uint _reservedHandle;
                        private ResourceFork m_root;
                        private ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList m_parent;
                        private byte[] __raw_attributes;

                        /// <summary>
                        /// ID of the resource described by this reference.
                        /// </summary>
                        public short Id { get { return _id; } }

                        /// <summary>
                        /// Offset of the name for the resource described by this reference,
                        /// from the start of the resource name area.
                        /// 
                        /// If the resource has no name,
                        /// the value of this field is `0xffff`
                        /// i. e. `-1` truncated to a 16-bit unsigned integer.
                        /// </summary>
                        public ushort OfsName { get { return _ofsName; } }

                        /// <summary>
                        /// Attributes of the resource described by this reference.
                        /// </summary>
                        public Attributes Attributes { get { return _attributes; } }

                        /// <summary>
                        /// Offset of the data block for the resource described by this reference,
                        /// from the start of the resource data area.
                        /// </summary>
                        public ulong OfsDataBlock { get { return _ofsDataBlock; } }

                        /// <summary>
                        /// Reserved space for the resource's handle in memory.
                        /// </summary>
                        public uint ReservedHandle { get { return _reservedHandle; } }
                        public ResourceFork M_Root { get { return m_root; } }
                        public ResourceFork.ResourceMap.TypeListAndReferenceLists.ReferenceList M_Parent { get { return m_parent; } }
                        public byte[] M_RawAttributes { get { return __raw_attributes; } }
                    }
                    private List<Reference> _references;
                    private ushort _numReferences;
                    private ResourceFork m_root;
                    private ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry m_parent;

                    /// <summary>
                    /// The resource references in this reference list.
                    /// </summary>
                    public List<Reference> References { get { return _references; } }

                    /// <summary>
                    /// The number of references in this resource reference list.
                    /// 
                    /// This information needs to be passed in as a parameter,
                    /// because it is stored in the reference list's type list entry,
                    /// and not in the reference list itself.
                    /// </summary>
                    public ushort NumReferences { get { return _numReferences; } }
                    public ResourceFork M_Root { get { return m_root; } }
                    public ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList.TypeListEntry M_Parent { get { return m_parent; } }
                }

                /// <summary>
                /// Resource type list in the resource map.
                /// </summary>
                public partial class TypeList : KaitaiStruct
                {
                    public static TypeList FromFile(string fileName)
                    {
                        return new TypeList(new KaitaiStream(fileName));
                    }

                    public TypeList(KaitaiStream p__io, ResourceFork.ResourceMap.TypeListAndReferenceLists p__parent = null, ResourceFork p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_numTypes = false;
                        _read();
                    }
                    private void _read()
                    {
                        _numTypesM1 = m_io.ReadU2be();
                        _entries = new List<TypeListEntry>();
                        for (var i = 0; i < NumTypes; i++)
                        {
                            _entries.Add(new TypeListEntry(m_io, this, m_root));
                        }
                    }

                    /// <summary>
                    /// A single entry in the resource type list.
                    /// 
                    /// Each entry corresponds to exactly one resource reference list.
                    /// </summary>
                    public partial class TypeListEntry : KaitaiStruct
                    {
                        public static TypeListEntry FromFile(string fileName)
                        {
                            return new TypeListEntry(new KaitaiStream(fileName));
                        }

                        public TypeListEntry(KaitaiStream p__io, ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList p__parent = null, ResourceFork p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            f_numReferences = false;
                            f_referenceList = false;
                            _read();
                        }
                        private void _read()
                        {
                            _type = m_io.ReadBytes(4);
                            _numReferencesM1 = m_io.ReadU2be();
                            _ofsReferenceList = m_io.ReadU2be();
                        }
                        private bool f_numReferences;
                        private int _numReferences;

                        /// <summary>
                        /// The number of resources in the reference list for this type.
                        /// </summary>
                        public int NumReferences
                        {
                            get
                            {
                                if (f_numReferences)
                                    return _numReferences;
                                f_numReferences = true;
                                _numReferences = (int) (KaitaiStream.Mod(NumReferencesM1 + 1, 65536));
                                return _numReferences;
                            }
                        }
                        private bool f_referenceList;
                        private ReferenceList _referenceList;

                        /// <summary>
                        /// The resource reference list for this resource type.
                        /// </summary>
                        public ReferenceList ReferenceList
                        {
                            get
                            {
                                if (f_referenceList)
                                    return _referenceList;
                                f_referenceList = true;
                                KaitaiStream io = M_Parent.M_Parent.M_Io;
                                long _pos = io.Pos;
                                io.Seek(OfsReferenceList);
                                _referenceList = new ReferenceList(NumReferences, io, this, m_root);
                                io.Seek(_pos);
                                return _referenceList;
                            }
                        }
                        private byte[] _type;
                        private ushort _numReferencesM1;
                        private ushort _ofsReferenceList;
                        private ResourceFork m_root;
                        private ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList m_parent;

                        /// <summary>
                        /// The four-character type code of the resources in the reference list.
                        /// </summary>
                        public byte[] Type { get { return _type; } }

                        /// <summary>
                        /// The number of resources in the reference list for this type,
                        /// minus one.
                        /// 
                        /// Empty reference lists should never exist.
                        /// </summary>
                        public ushort NumReferencesM1 { get { return _numReferencesM1; } }

                        /// <summary>
                        /// Offset of the resource reference list for this resource type,
                        /// from the start of the resource type list.
                        /// 
                        /// Although the offset is relative to the start of the type list,
                        /// it should never point into the type list itself,
                        /// but into the reference list storage area that directly follows it.
                        /// That is,
                        /// it should always be at least `_parent._sizeof`.
                        /// </summary>
                        public ushort OfsReferenceList { get { return _ofsReferenceList; } }
                        public ResourceFork M_Root { get { return m_root; } }
                        public ResourceFork.ResourceMap.TypeListAndReferenceLists.TypeList M_Parent { get { return m_parent; } }
                    }
                    private bool f_numTypes;
                    private int _numTypes;

                    /// <summary>
                    /// The number of resource types in this list.
                    /// </summary>
                    public int NumTypes
                    {
                        get
                        {
                            if (f_numTypes)
                                return _numTypes;
                            f_numTypes = true;
                            _numTypes = (int) (KaitaiStream.Mod(NumTypesM1 + 1, 65536));
                            return _numTypes;
                        }
                    }
                    private ushort _numTypesM1;
                    private List<TypeListEntry> _entries;
                    private ResourceFork m_root;
                    private ResourceFork.ResourceMap.TypeListAndReferenceLists m_parent;

                    /// <summary>
                    /// The number of resource types in this list,
                    /// minus one.
                    /// 
                    /// If the resource list is empty,
                    /// the value of this field is `0xffff`,
                    /// i. e. `-1` truncated to a 16-bit unsigned integer.
                    /// </summary>
                    public ushort NumTypesM1 { get { return _numTypesM1; } }

                    /// <summary>
                    /// Entries in the resource type list.
                    /// </summary>
                    public List<TypeListEntry> Entries { get { return _entries; } }
                    public ResourceFork M_Root { get { return m_root; } }
                    public ResourceFork.ResourceMap.TypeListAndReferenceLists M_Parent { get { return m_parent; } }
                }
                private TypeList _typeList;
                private byte[] _referenceLists;
                private ResourceFork m_root;
                private ResourceFork.ResourceMap m_parent;

                /// <summary>
                /// The resource map's resource type list.
                /// </summary>
                public TypeList TypeList { get { return _typeList; } }

                /// <summary>
                /// Storage area for the resource map's resource reference lists.
                /// 
                /// According to Inside Macintosh,
                /// the reference lists are stored contiguously,
                /// in the same order as their corresponding resource type list entries.
                /// </summary>
                public byte[] ReferenceLists { get { return _referenceLists; } }
                public ResourceFork M_Root { get { return m_root; } }
                public ResourceFork.ResourceMap M_Parent { get { return m_parent; } }
            }
            private bool f_names;
            private byte[] _names;

            /// <summary>
            /// Storage area for the names of all resources.
            /// </summary>
            public byte[] Names
            {
                get
                {
                    if (f_names)
                        return _names;
                    f_names = true;
                    _names = (byte[]) (NamesWithIo.Data);
                    return _names;
                }
            }
            private bool f_namesWithIo;
            private BytesWithIo _namesWithIo;

            /// <summary>
            /// Use `names` instead,
            /// unless you need access to this instance's `_io`.
            /// </summary>
            public BytesWithIo NamesWithIo
            {
                get
                {
                    if (f_namesWithIo)
                        return _namesWithIo;
                    f_namesWithIo = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsNames);
                    __raw_namesWithIo = m_io.ReadBytesFull();
                    var io___raw_namesWithIo = new KaitaiStream(__raw_namesWithIo);
                    _namesWithIo = new BytesWithIo(io___raw_namesWithIo);
                    m_io.Seek(_pos);
                    return _namesWithIo;
                }
            }
            private bool f_typeListAndReferenceLists;
            private TypeListAndReferenceLists _typeListAndReferenceLists;

            /// <summary>
            /// The resource map's resource type list, followed by the resource reference list area.
            /// </summary>
            public TypeListAndReferenceLists TypeListAndReferenceLists
            {
                get
                {
                    if (f_typeListAndReferenceLists)
                        return _typeListAndReferenceLists;
                    f_typeListAndReferenceLists = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsTypeList);
                    __raw_typeListAndReferenceLists = m_io.ReadBytes(OfsNames - OfsTypeList);
                    var io___raw_typeListAndReferenceLists = new KaitaiStream(__raw_typeListAndReferenceLists);
                    _typeListAndReferenceLists = new TypeListAndReferenceLists(io___raw_typeListAndReferenceLists, this, m_root);
                    m_io.Seek(_pos);
                    return _typeListAndReferenceLists;
                }
            }
            private FileHeader _reservedFileHeaderCopy;
            private uint _reservedNextResourceMapHandle;
            private ushort _reservedFileReferenceNumber;
            private FileAttributes _fileAttributes;
            private ushort _ofsTypeList;
            private ushort _ofsNames;
            private ResourceFork m_root;
            private ResourceFork m_parent;
            private byte[] __raw_fileAttributes;
            private byte[] __raw_namesWithIo;
            private byte[] __raw_typeListAndReferenceLists;

            /// <summary>
            /// Reserved space for a copy of the resource file header.
            /// </summary>
            public FileHeader ReservedFileHeaderCopy { get { return _reservedFileHeaderCopy; } }

            /// <summary>
            /// Reserved space for a handle to the next loaded resource map in memory.
            /// </summary>
            public uint ReservedNextResourceMapHandle { get { return _reservedNextResourceMapHandle; } }

            /// <summary>
            /// Reserved space for the resource file's file reference number.
            /// </summary>
            public ushort ReservedFileReferenceNumber { get { return _reservedFileReferenceNumber; } }

            /// <summary>
            /// The resource file's attributes.
            /// </summary>
            public FileAttributes FileAttributes { get { return _fileAttributes; } }

            /// <summary>
            /// Offset of the resource type list,
            /// from the start of the resource map.
            /// 
            /// In practice,
            /// this should always be `sizeof&lt;resource_map&gt;`,
            /// i. e. the resource type list should directly follow the resource map.
            /// </summary>
            public ushort OfsTypeList { get { return _ofsTypeList; } }

            /// <summary>
            /// Offset of the resource name area,
            /// from the start of the resource map.
            /// </summary>
            public ushort OfsNames { get { return _ofsNames; } }
            public ResourceFork M_Root { get { return m_root; } }
            public ResourceFork M_Parent { get { return m_parent; } }
            public byte[] M_RawFileAttributes { get { return __raw_fileAttributes; } }
            public byte[] M_RawNamesWithIo { get { return __raw_namesWithIo; } }
            public byte[] M_RawTypeListAndReferenceLists { get { return __raw_typeListAndReferenceLists; } }
        }
        private bool f_dataBlocks;
        private byte[] _dataBlocks;

        /// <summary>
        /// Storage area for the data blocks of all resources.
        /// 
        /// These data blocks are not required to appear in any particular order,
        /// and there may be unused space between and around them.
        /// 
        /// In practice,
        /// the data blocks in newly created resource files are usually contiguous.
        /// When existing resources are shortened,
        /// the Mac OS resource manager leaves unused space where the now removed resource data was,
        /// as this is quicker than moving the following resource data into the newly freed space.
        /// Such unused space may be cleaned up later when the resource manager &quot;compacts&quot; the resource file,
        /// which happens when resources are removed entirely,
        /// or when resources are added or grown so that more space is needed in the data area.
        /// </summary>
        public byte[] DataBlocks
        {
            get
            {
                if (f_dataBlocks)
                    return _dataBlocks;
                f_dataBlocks = true;
                _dataBlocks = (byte[]) (DataBlocksWithIo.Data);
                return _dataBlocks;
            }
        }
        private bool f_dataBlocksWithIo;
        private BytesWithIo _dataBlocksWithIo;

        /// <summary>
        /// Use `data_blocks` instead,
        /// unless you need access to this instance's `_io`.
        /// </summary>
        public BytesWithIo DataBlocksWithIo
        {
            get
            {
                if (f_dataBlocksWithIo)
                    return _dataBlocksWithIo;
                f_dataBlocksWithIo = true;
                long _pos = m_io.Pos;
                m_io.Seek(Header.OfsDataBlocks);
                __raw_dataBlocksWithIo = m_io.ReadBytes(Header.LenDataBlocks);
                var io___raw_dataBlocksWithIo = new KaitaiStream(__raw_dataBlocksWithIo);
                _dataBlocksWithIo = new BytesWithIo(io___raw_dataBlocksWithIo);
                m_io.Seek(_pos);
                return _dataBlocksWithIo;
            }
        }
        private bool f_resourceMap;
        private ResourceMap _resourceMap;

        /// <summary>
        /// The resource file's resource map.
        /// </summary>
        public ResourceMap ResourceMap
        {
            get
            {
                if (f_resourceMap)
                    return _resourceMap;
                f_resourceMap = true;
                long _pos = m_io.Pos;
                m_io.Seek(Header.OfsResourceMap);
                __raw_resourceMap = m_io.ReadBytes(Header.LenResourceMap);
                var io___raw_resourceMap = new KaitaiStream(__raw_resourceMap);
                _resourceMap = new ResourceMap(io___raw_resourceMap, this, m_root);
                m_io.Seek(_pos);
                return _resourceMap;
            }
        }
        private FileHeader _header;
        private byte[] _systemData;
        private byte[] _applicationData;
        private ResourceFork m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_dataBlocksWithIo;
        private byte[] __raw_resourceMap;

        /// <summary>
        /// The resource file's header information.
        /// </summary>
        public FileHeader Header { get { return _header; } }

        /// <summary>
        /// System-reserved data area.
        /// This field can generally be ignored when reading and writing.
        /// 
        /// This field is used by the Classic Mac OS Finder as temporary storage space.
        /// It usually contains parts of the file metadata (name, type/creator code, etc.).
        /// Any existing data in this field is ignored and overwritten.
        /// 
        /// In resource files written by Mac OS X,
        /// this field is set to all zero bytes.
        /// </summary>
        public byte[] SystemData { get { return _systemData; } }

        /// <summary>
        /// Application-specific data area.
        /// This field can generally be ignored when reading and writing.
        /// 
        /// According to early revisions of Inside Macintosh,
        /// this field is &quot;available for application data&quot;.
        /// In practice, it is almost never used for this purpose,
        /// and usually contains only junk data.
        /// 
        /// In resource files written by Mac OS X,
        /// this field is set to all zero bytes.
        /// </summary>
        public byte[] ApplicationData { get { return _applicationData; } }
        public ResourceFork M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawDataBlocksWithIo { get { return __raw_dataBlocksWithIo; } }
        public byte[] M_RawResourceMap { get { return __raw_resourceMap; } }
    }
}
