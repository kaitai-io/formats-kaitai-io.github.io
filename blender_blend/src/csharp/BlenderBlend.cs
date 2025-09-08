// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Blender is an open source suite for 3D modelling, sculpting,
    /// animation, compositing, rendering, preparation of assets for its own
    /// game engine and exporting to others, etc. `.blend` is its own binary
    /// format that saves whole state of suite: current scene, animations,
    /// all software settings, extensions, etc.
    /// 
    /// Internally, .blend format is a hybrid semi-self-descriptive
    /// format. On top level, it contains a simple header and a sequence of
    /// file blocks, which more or less follow typical [TLV
    /// pattern](https://en.wikipedia.org/wiki/Type-length-value). Pre-last
    /// block would be a structure with code `DNA1`, which is a essentially
    /// a machine-readable schema of all other structures used in this file.
    /// </summary>
    public partial class BlenderBlend : KaitaiStruct
    {
        public static BlenderBlend FromFile(string fileName)
        {
            return new BlenderBlend(new KaitaiStream(fileName));
        }


        public enum Endian
        {
            Be = 86,
            Le = 118,
        }

        public enum PtrSize
        {
            Bits64 = 45,
            Bits32 = 95,
        }
        public BlenderBlend(KaitaiStream p__io, KaitaiStruct p__parent = null, BlenderBlend p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_sdnaStructs = false;
            _read();
        }
        private void _read()
        {
            _hdr = new Header(m_io, this, m_root);
            _blocks = new List<FileBlock>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _blocks.Add(new FileBlock(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <summary>
        /// DNA1, also known as &quot;Structure DNA&quot;, is a special block in
        /// .blend file, which contains machine-readable specifications of
        /// all other structures used in this .blend file.
        /// 
        /// Effectively, this block contains:
        /// 
        /// * a sequence of &quot;names&quot; (strings which represent field names)
        /// * a sequence of &quot;types&quot; (strings which represent type name)
        /// * a sequence of &quot;type lengths&quot;
        /// * a sequence of &quot;structs&quot; (which describe contents of every
        ///   structure, referring to types and names by index)
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://archive.blender.org/wiki/index.php/Dev:Source/Architecture/File_Format/#Structure_DNA">Source</a>
        /// </remarks>
        public partial class Dna1Body : KaitaiStruct
        {
            public static Dna1Body FromFile(string fileName)
            {
                return new Dna1Body(new KaitaiStream(fileName));
            }

            public Dna1Body(KaitaiStream p__io, BlenderBlend.FileBlock p__parent = null, BlenderBlend p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_id, new byte[] { 83, 68, 78, 65 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 83, 68, 78, 65 }, _id, m_io, "/types/dna1_body/seq/0");
                }
                _nameMagic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_nameMagic, new byte[] { 78, 65, 77, 69 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 78, 65, 77, 69 }, _nameMagic, m_io, "/types/dna1_body/seq/1");
                }
                _numNames = m_io.ReadU4le();
                _names = new List<string>();
                for (var i = 0; i < NumNames; i++)
                {
                    _names.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                }
                _padding1 = m_io.ReadBytes(KaitaiStream.Mod(4 - M_Io.Pos, 4));
                _typeMagic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_typeMagic, new byte[] { 84, 89, 80, 69 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 84, 89, 80, 69 }, _typeMagic, m_io, "/types/dna1_body/seq/5");
                }
                _numTypes = m_io.ReadU4le();
                _types = new List<string>();
                for (var i = 0; i < NumTypes; i++)
                {
                    _types.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                }
                _padding2 = m_io.ReadBytes(KaitaiStream.Mod(4 - M_Io.Pos, 4));
                _tlenMagic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_tlenMagic, new byte[] { 84, 76, 69, 78 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 84, 76, 69, 78 }, _tlenMagic, m_io, "/types/dna1_body/seq/9");
                }
                _lengths = new List<ushort>();
                for (var i = 0; i < NumTypes; i++)
                {
                    _lengths.Add(m_io.ReadU2le());
                }
                _padding3 = m_io.ReadBytes(KaitaiStream.Mod(4 - M_Io.Pos, 4));
                _strcMagic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_strcMagic, new byte[] { 83, 84, 82, 67 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 83, 84, 82, 67 }, _strcMagic, m_io, "/types/dna1_body/seq/12");
                }
                _numStructs = m_io.ReadU4le();
                _structs = new List<DnaStruct>();
                for (var i = 0; i < NumStructs; i++)
                {
                    _structs.Add(new DnaStruct(m_io, this, m_root));
                }
            }
            private byte[] _id;
            private byte[] _nameMagic;
            private uint _numNames;
            private List<string> _names;
            private byte[] _padding1;
            private byte[] _typeMagic;
            private uint _numTypes;
            private List<string> _types;
            private byte[] _padding2;
            private byte[] _tlenMagic;
            private List<ushort> _lengths;
            private byte[] _padding3;
            private byte[] _strcMagic;
            private uint _numStructs;
            private List<DnaStruct> _structs;
            private BlenderBlend m_root;
            private BlenderBlend.FileBlock m_parent;
            public byte[] Id { get { return _id; } }
            public byte[] NameMagic { get { return _nameMagic; } }
            public uint NumNames { get { return _numNames; } }
            public List<string> Names { get { return _names; } }
            public byte[] Padding1 { get { return _padding1; } }
            public byte[] TypeMagic { get { return _typeMagic; } }
            public uint NumTypes { get { return _numTypes; } }
            public List<string> Types { get { return _types; } }
            public byte[] Padding2 { get { return _padding2; } }
            public byte[] TlenMagic { get { return _tlenMagic; } }
            public List<ushort> Lengths { get { return _lengths; } }
            public byte[] Padding3 { get { return _padding3; } }
            public byte[] StrcMagic { get { return _strcMagic; } }
            public uint NumStructs { get { return _numStructs; } }
            public List<DnaStruct> Structs { get { return _structs; } }
            public BlenderBlend M_Root { get { return m_root; } }
            public BlenderBlend.FileBlock M_Parent { get { return m_parent; } }
        }
        public partial class DnaField : KaitaiStruct
        {
            public static DnaField FromFile(string fileName)
            {
                return new DnaField(new KaitaiStream(fileName));
            }

            public DnaField(KaitaiStream p__io, BlenderBlend.DnaStruct p__parent = null, BlenderBlend p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_name = false;
                f_type = false;
                _read();
            }
            private void _read()
            {
                _idxType = m_io.ReadU2le();
                _idxName = m_io.ReadU2le();
            }
            private bool f_name;
            private string _name;
            public string Name
            {
                get
                {
                    if (f_name)
                        return _name;
                    f_name = true;
                    _name = (string) (M_Parent.M_Parent.Names[IdxName]);
                    return _name;
                }
            }
            private bool f_type;
            private string _type;
            public string Type
            {
                get
                {
                    if (f_type)
                        return _type;
                    f_type = true;
                    _type = (string) (M_Parent.M_Parent.Types[IdxType]);
                    return _type;
                }
            }
            private ushort _idxType;
            private ushort _idxName;
            private BlenderBlend m_root;
            private BlenderBlend.DnaStruct m_parent;
            public ushort IdxType { get { return _idxType; } }
            public ushort IdxName { get { return _idxName; } }
            public BlenderBlend M_Root { get { return m_root; } }
            public BlenderBlend.DnaStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// DNA struct contains a `type` (type name), which is specified as
        /// an index in types table, and sequence of fields.
        /// </summary>
        public partial class DnaStruct : KaitaiStruct
        {
            public static DnaStruct FromFile(string fileName)
            {
                return new DnaStruct(new KaitaiStream(fileName));
            }

            public DnaStruct(KaitaiStream p__io, BlenderBlend.Dna1Body p__parent = null, BlenderBlend p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_type = false;
                _read();
            }
            private void _read()
            {
                _idxType = m_io.ReadU2le();
                _numFields = m_io.ReadU2le();
                _fields = new List<DnaField>();
                for (var i = 0; i < NumFields; i++)
                {
                    _fields.Add(new DnaField(m_io, this, m_root));
                }
            }
            private bool f_type;
            private string _type;
            public string Type
            {
                get
                {
                    if (f_type)
                        return _type;
                    f_type = true;
                    _type = (string) (M_Parent.Types[IdxType]);
                    return _type;
                }
            }
            private ushort _idxType;
            private ushort _numFields;
            private List<DnaField> _fields;
            private BlenderBlend m_root;
            private BlenderBlend.Dna1Body m_parent;
            public ushort IdxType { get { return _idxType; } }
            public ushort NumFields { get { return _numFields; } }
            public List<DnaField> Fields { get { return _fields; } }
            public BlenderBlend M_Root { get { return m_root; } }
            public BlenderBlend.Dna1Body M_Parent { get { return m_parent; } }
        }
        public partial class FileBlock : KaitaiStruct
        {
            public static FileBlock FromFile(string fileName)
            {
                return new FileBlock(new KaitaiStream(fileName));
            }

            public FileBlock(KaitaiStream p__io, BlenderBlend p__parent = null, BlenderBlend p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_sdnaStruct = false;
                _read();
            }
            private void _read()
            {
                _code = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _lenBody = m_io.ReadU4le();
                _memAddr = m_io.ReadBytes(M_Root.Hdr.Psize);
                _sdnaIndex = m_io.ReadU4le();
                _count = m_io.ReadU4le();
                switch (Code) {
                case "DNA1": {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Dna1Body(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(LenBody);
                    break;
                }
                }
            }
            private bool f_sdnaStruct;
            private DnaStruct _sdnaStruct;
            public DnaStruct SdnaStruct
            {
                get
                {
                    if (f_sdnaStruct)
                        return _sdnaStruct;
                    f_sdnaStruct = true;
                    if (SdnaIndex != 0) {
                        _sdnaStruct = (DnaStruct) (M_Root.SdnaStructs[SdnaIndex]);
                    }
                    return _sdnaStruct;
                }
            }
            private string _code;
            private uint _lenBody;
            private byte[] _memAddr;
            private uint _sdnaIndex;
            private uint _count;
            private object _body;
            private BlenderBlend m_root;
            private BlenderBlend m_parent;
            private byte[] __raw_body;

            /// <summary>
            /// Identifier of the file block
            /// </summary>
            public string Code { get { return _code; } }

            /// <summary>
            /// Total length of the data after the header of file block
            /// </summary>
            public uint LenBody { get { return _lenBody; } }

            /// <summary>
            /// Memory address the structure was located when written to disk
            /// </summary>
            public byte[] MemAddr { get { return _memAddr; } }

            /// <summary>
            /// Index of the SDNA structure
            /// </summary>
            public uint SdnaIndex { get { return _sdnaIndex; } }

            /// <summary>
            /// Number of structure located in this file-block
            /// </summary>
            public uint Count { get { return _count; } }
            public object Body { get { return _body; } }
            public BlenderBlend M_Root { get { return m_root; } }
            public BlenderBlend M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, BlenderBlend p__parent = null, BlenderBlend p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_psize = false;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(7);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 66, 76, 69, 78, 68, 69, 82 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 66, 76, 69, 78, 68, 69, 82 }, _magic, m_io, "/types/header/seq/0");
                }
                _ptrSizeId = ((BlenderBlend.PtrSize) m_io.ReadU1());
                _endian = ((BlenderBlend.Endian) m_io.ReadU1());
                _version = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(3));
            }
            private bool f_psize;
            private sbyte _psize;

            /// <summary>
            /// Number of bytes that a pointer occupies
            /// </summary>
            public sbyte Psize
            {
                get
                {
                    if (f_psize)
                        return _psize;
                    f_psize = true;
                    _psize = (sbyte) ((PtrSizeId == BlenderBlend.PtrSize.Bits64 ? 8 : 4));
                    return _psize;
                }
            }
            private byte[] _magic;
            private PtrSize _ptrSizeId;
            private Endian _endian;
            private string _version;
            private BlenderBlend m_root;
            private BlenderBlend m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Size of a pointer; all pointers in the file are stored in this format
            /// </summary>
            public PtrSize PtrSizeId { get { return _ptrSizeId; } }

            /// <summary>
            /// Type of byte ordering used
            /// </summary>
            public Endian Endian { get { return _endian; } }

            /// <summary>
            /// Blender version used to save this file
            /// </summary>
            public string Version { get { return _version; } }
            public BlenderBlend M_Root { get { return m_root; } }
            public BlenderBlend M_Parent { get { return m_parent; } }
        }
        private bool f_sdnaStructs;
        private List<DnaStruct> _sdnaStructs;
        public List<DnaStruct> SdnaStructs
        {
            get
            {
                if (f_sdnaStructs)
                    return _sdnaStructs;
                f_sdnaStructs = true;
                _sdnaStructs = (List<DnaStruct>) (((BlenderBlend.Dna1Body) (Blocks[Blocks.Count - 2].Body)).Structs);
                return _sdnaStructs;
            }
        }
        private Header _hdr;
        private List<FileBlock> _blocks;
        private BlenderBlend m_root;
        private KaitaiStruct m_parent;
        public Header Hdr { get { return _hdr; } }
        public List<FileBlock> Blocks { get { return _blocks; } }
        public BlenderBlend M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
