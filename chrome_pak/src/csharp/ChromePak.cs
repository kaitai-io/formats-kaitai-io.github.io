// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Format mostly used by Google Chrome and various Android apps to store
    /// resources such as translated strings, help messages and images.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://web.archive.org/web/20220126211447/https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py">Source</a>
    /// </remarks>
    public partial class ChromePak : KaitaiStruct
    {
        public static ChromePak FromFile(string fileName)
        {
            return new ChromePak(new KaitaiStream(fileName));
        }


        public enum Encodings
        {
            Binary = 0,
            Utf8 = 1,
            Utf16 = 2,
        }
        public ChromePak(KaitaiStream p__io, KaitaiStruct p__parent = null, ChromePak p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_numResources = false;
            f_numAliases = false;
            _read();
        }
        private void _read()
        {
            _version = m_io.ReadU4le();
            if (!( ((Version == 4) || (Version == 5)) ))
            {
                throw new ValidationNotAnyOfError(Version, M_Io, "/seq/0");
            }
            if (Version == 4) {
                _numResourcesV4 = m_io.ReadU4le();
            }
            _encoding = ((Encodings) m_io.ReadU1());
            if (Version == 5) {
                _v5Part = new HeaderV5Part(m_io, this, m_root);
            }
            _resources = new List<Resource>();
            for (var i = 0; i < (NumResources + 1); i++)
            {
                _resources.Add(new Resource(i, i < NumResources, m_io, this, m_root));
            }
            _aliases = new List<Alias>();
            for (var i = 0; i < NumAliases; i++)
            {
                _aliases.Add(new Alias(m_io, this, m_root));
            }
        }
        public partial class HeaderV5Part : KaitaiStruct
        {
            public static HeaderV5Part FromFile(string fileName)
            {
                return new HeaderV5Part(new KaitaiStream(fileName));
            }

            public HeaderV5Part(KaitaiStream p__io, ChromePak p__parent = null, ChromePak p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _encodingPadding = m_io.ReadBytes(3);
                _numResources = m_io.ReadU2le();
                _numAliases = m_io.ReadU2le();
            }
            private byte[] _encodingPadding;
            private ushort _numResources;
            private ushort _numAliases;
            private ChromePak m_root;
            private ChromePak m_parent;
            public byte[] EncodingPadding { get { return _encodingPadding; } }
            public ushort NumResources { get { return _numResources; } }
            public ushort NumAliases { get { return _numAliases; } }
            public ChromePak M_Root { get { return m_root; } }
            public ChromePak M_Parent { get { return m_parent; } }
        }
        public partial class Resource : KaitaiStruct
        {
            public Resource(int p_idx, bool p_hasBody, KaitaiStream p__io, ChromePak p__parent = null, ChromePak p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _hasBody = p_hasBody;
                f_lenBody = false;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadU2le();
                _ofsBody = m_io.ReadU4le();
            }
            private bool f_lenBody;
            private int? _lenBody;

            /// <summary>
            /// MUST NOT be accessed until the next `resource` is parsed
            /// </summary>
            public int? LenBody
            {
                get
                {
                    if (f_lenBody)
                        return _lenBody;
                    if (HasBody) {
                        _lenBody = (int) ((M_Parent.Resources[(Idx + 1)].OfsBody - OfsBody));
                    }
                    f_lenBody = true;
                    return _lenBody;
                }
            }
            private bool f_body;
            private byte[] _body;

            /// <summary>
            /// MUST NOT be accessed until the next `resource` is parsed
            /// </summary>
            public byte[] Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    if (HasBody) {
                        long _pos = m_io.Pos;
                        m_io.Seek(OfsBody);
                        _body = m_io.ReadBytes(LenBody);
                        m_io.Seek(_pos);
                        f_body = true;
                    }
                    return _body;
                }
            }
            private ushort _id;
            private uint _ofsBody;
            private int _idx;
            private bool _hasBody;
            private ChromePak m_root;
            private ChromePak m_parent;
            public ushort Id { get { return _id; } }
            public uint OfsBody { get { return _ofsBody; } }
            public int Idx { get { return _idx; } }
            public bool HasBody { get { return _hasBody; } }
            public ChromePak M_Root { get { return m_root; } }
            public ChromePak M_Parent { get { return m_parent; } }
        }
        public partial class Alias : KaitaiStruct
        {
            public static Alias FromFile(string fileName)
            {
                return new Alias(new KaitaiStream(fileName));
            }

            public Alias(KaitaiStream p__io, ChromePak p__parent = null, ChromePak p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_resource = false;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadU2le();
                _resourceIdx = m_io.ReadU2le();
                if (!(ResourceIdx <= (M_Parent.NumResources - 1)))
                {
                    throw new ValidationGreaterThanError((M_Parent.NumResources - 1), ResourceIdx, M_Io, "/types/alias/seq/1");
                }
            }
            private bool f_resource;
            private Resource _resource;
            public Resource Resource
            {
                get
                {
                    if (f_resource)
                        return _resource;
                    _resource = (Resource) (M_Parent.Resources[ResourceIdx]);
                    f_resource = true;
                    return _resource;
                }
            }
            private ushort _id;
            private ushort _resourceIdx;
            private ChromePak m_root;
            private ChromePak m_parent;
            public ushort Id { get { return _id; } }
            public ushort ResourceIdx { get { return _resourceIdx; } }
            public ChromePak M_Root { get { return m_root; } }
            public ChromePak M_Parent { get { return m_parent; } }
        }
        private bool f_numResources;
        private uint _numResources;
        public uint NumResources
        {
            get
            {
                if (f_numResources)
                    return _numResources;
                _numResources = (uint) ((Version == 5 ? V5Part.NumResources : NumResourcesV4));
                f_numResources = true;
                return _numResources;
            }
        }
        private bool f_numAliases;
        private ushort _numAliases;
        public ushort NumAliases
        {
            get
            {
                if (f_numAliases)
                    return _numAliases;
                _numAliases = (ushort) ((Version == 5 ? V5Part.NumAliases : 0));
                f_numAliases = true;
                return _numAliases;
            }
        }
        private uint _version;
        private uint? _numResourcesV4;
        private Encodings _encoding;
        private HeaderV5Part _v5Part;
        private List<Resource> _resources;
        private List<Alias> _aliases;
        private ChromePak m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// only versions 4 and 5 are supported
        /// </summary>
        public uint Version { get { return _version; } }
        public uint? NumResourcesV4 { get { return _numResourcesV4; } }

        /// <summary>
        /// Character encoding of all text resources in the PAK file. Note that
        /// the file can **always** contain binary resources, this only applies to
        /// those that are supposed to hold text.
        /// 
        /// In practice, this will probably always be `encodings::utf8` - I haven't
        /// seen any organic file that would state otherwise. `UTF8` is also usually
        /// hardcoded in Python scripts from the GRIT repository that generate .pak
        /// files (for example
        /// [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
        /// </summary>
        public Encodings Encoding { get { return _encoding; } }
        public HeaderV5Part V5Part { get { return _v5Part; } }

        /// <summary>
        /// The length is calculated by looking at the offset of
        /// the next item, so an extra entry is stored with id 0
        /// and offset pointing to the end of the resources.
        /// </summary>
        public List<Resource> Resources { get { return _resources; } }
        public List<Alias> Aliases { get { return _aliases; } }
        public ChromePak M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
