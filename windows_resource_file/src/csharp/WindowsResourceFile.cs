// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Windows resource file (.res) are binary bundles of
    /// &quot;resources&quot;. Resource has some sort of ID (numerical or string),
    /// type (predefined or user-defined), and raw value. Resource files can
    /// be seen standalone (as .res file), or embedded inside PE executable
    /// (.exe, .dll) files.
    /// 
    /// Typical use cases include:
    /// 
    /// * providing information about the application (such as title, copyrights, etc)
    /// * embedding icon(s) to be displayed in file managers into .exe
    /// * adding non-code data into the binary, such as menus, dialog forms,
    ///   cursor images, fonts, various misc bitmaps, and locale-aware
    ///   strings
    /// 
    /// Windows provides special API to access &quot;resources&quot; from a binary.
    /// 
    /// Normally, resources files are created with `rc` compiler: it takes a
    /// .rc file (so called &quot;resource-definition script&quot;) + all the raw
    /// resource binary files for input, and outputs .res file. That .res
    /// file can be linked into an .exe / .dll afterwards using a linker.
    /// 
    /// Internally, resource file is just a sequence of individual resource
    /// definitions. RC tool ensures that first resource (#0) is always
    /// empty.
    /// </summary>
    public partial class WindowsResourceFile : KaitaiStruct
    {
        public static WindowsResourceFile FromFile(string fileName)
        {
            return new WindowsResourceFile(new KaitaiStream(fileName));
        }

        public WindowsResourceFile(KaitaiStream p__io, KaitaiStruct p__parent = null, WindowsResourceFile p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _resources = new List<Resource>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _resources.Add(new Resource(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <summary>
        /// Each resource has a `type` and a `name`, which can be used to
        /// identify it, and a `value`. Both `type` and `name` can be a
        /// number or a string.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ms648027.aspx">Source</a>
        /// </remarks>
        public partial class Resource : KaitaiStruct
        {
            public static Resource FromFile(string fileName)
            {
                return new Resource(new KaitaiStream(fileName));
            }


            public enum PredefTypes
            {
                Cursor = 1,
                Bitmap = 2,
                Icon = 3,
                Menu = 4,
                Dialog = 5,
                String = 6,
                Fontdir = 7,
                Font = 8,
                Accelerator = 9,
                Rcdata = 10,
                Messagetable = 11,
                GroupCursor = 12,
                GroupIcon = 14,
                Version = 16,
                Dlginclude = 17,
                Plugplay = 19,
                Vxd = 20,
                Anicursor = 21,
                Aniicon = 22,
                Html = 23,
                Manifest = 24,
            }
            public Resource(KaitaiStream p__io, WindowsResourceFile p__parent = null, WindowsResourceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_typeAsPredef = false;
                _read();
            }
            private void _read()
            {
                _valueSize = m_io.ReadU4le();
                _headerSize = m_io.ReadU4le();
                _type = new UnicodeOrId(m_io, this, m_root);
                _name = new UnicodeOrId(m_io, this, m_root);
                _padding1 = m_io.ReadBytes(KaitaiStream.Mod((4 - M_Io.Pos), 4));
                _formatVersion = m_io.ReadU4le();
                _flags = m_io.ReadU2le();
                _language = m_io.ReadU2le();
                _valueVersion = m_io.ReadU4le();
                _characteristics = m_io.ReadU4le();
                _value = m_io.ReadBytes(ValueSize);
                _padding2 = m_io.ReadBytes(KaitaiStream.Mod((4 - M_Io.Pos), 4));
            }
            private bool f_typeAsPredef;
            private PredefTypes _typeAsPredef;

            /// <summary>
            /// Numeric type IDs in range of [0..0xff] are reserved for
            /// system usage in Windows, and there are some predefined,
            /// well-known values in that range. This instance allows to get
            /// it as enum value, if applicable.
            /// </summary>
            public PredefTypes TypeAsPredef
            {
                get
                {
                    if (f_typeAsPredef)
                        return _typeAsPredef;
                    if ( ((!(Type.IsString)) && (Type.AsNumeric <= 255)) ) {
                        _typeAsPredef = (PredefTypes) (((PredefTypes) Type.AsNumeric));
                    }
                    f_typeAsPredef = true;
                    return _typeAsPredef;
                }
            }
            private uint _valueSize;
            private uint _headerSize;
            private UnicodeOrId _type;
            private UnicodeOrId _name;
            private byte[] _padding1;
            private uint _formatVersion;
            private ushort _flags;
            private ushort _language;
            private uint _valueVersion;
            private uint _characteristics;
            private byte[] _value;
            private byte[] _padding2;
            private WindowsResourceFile m_root;
            private WindowsResourceFile m_parent;

            /// <summary>
            /// Size of resource value that follows the header
            /// </summary>
            public uint ValueSize { get { return _valueSize; } }

            /// <summary>
            /// Size of this header (i.e. every field except `value` and an
            /// optional padding after it)
            /// </summary>
            public uint HeaderSize { get { return _headerSize; } }
            public UnicodeOrId Type { get { return _type; } }
            public UnicodeOrId Name { get { return _name; } }
            public byte[] Padding1 { get { return _padding1; } }
            public uint FormatVersion { get { return _formatVersion; } }
            public ushort Flags { get { return _flags; } }
            public ushort Language { get { return _language; } }

            /// <summary>
            /// Version for value, as specified by a user.
            /// </summary>
            public uint ValueVersion { get { return _valueVersion; } }

            /// <summary>
            /// Extra 4 bytes that can be used by user for any purpose.
            /// </summary>
            public uint Characteristics { get { return _characteristics; } }
            public byte[] Value { get { return _value; } }
            public byte[] Padding2 { get { return _padding2; } }
            public WindowsResourceFile M_Root { get { return m_root; } }
            public WindowsResourceFile M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Resources use a special serialization of names and types: they
        /// can be either a number or a string.
        /// 
        /// Use `is_string` to check which kind we've got here, and then use
        /// `as_numeric` or `as_string` to get relevant value.
        /// </summary>
        public partial class UnicodeOrId : KaitaiStruct
        {
            public static UnicodeOrId FromFile(string fileName)
            {
                return new UnicodeOrId(new KaitaiStream(fileName));
            }

            public UnicodeOrId(KaitaiStream p__io, WindowsResourceFile.Resource p__parent = null, WindowsResourceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_savePos1 = false;
                f_savePos2 = false;
                f_isString = false;
                f_asString = false;
                _read();
            }
            private void _read()
            {
                if (SavePos1 >= 0) {
                    _first = m_io.ReadU2le();
                }
                if (!(IsString)) {
                    _asNumeric = m_io.ReadU2le();
                }
                if (IsString) {
                    _rest = new List<ushort>();
                    {
                        var i = 0;
                        ushort M_;
                        do {
                            M_ = m_io.ReadU2le();
                            _rest.Add(M_);
                            i++;
                        } while (!(M_ == 0));
                    }
                }
                if ( ((IsString) && (SavePos2 >= 0)) ) {
                    _noop = m_io.ReadBytes(0);
                }
            }
            private bool f_savePos1;
            private int _savePos1;
            public int SavePos1
            {
                get
                {
                    if (f_savePos1)
                        return _savePos1;
                    _savePos1 = (int) (M_Io.Pos);
                    f_savePos1 = true;
                    return _savePos1;
                }
            }
            private bool f_savePos2;
            private int _savePos2;
            public int SavePos2
            {
                get
                {
                    if (f_savePos2)
                        return _savePos2;
                    _savePos2 = (int) (M_Io.Pos);
                    f_savePos2 = true;
                    return _savePos2;
                }
            }
            private bool f_isString;
            private bool _isString;
            public bool IsString
            {
                get
                {
                    if (f_isString)
                        return _isString;
                    _isString = (bool) (First != 65535);
                    f_isString = true;
                    return _isString;
                }
            }
            private bool f_asString;
            private string _asString;
            public string AsString
            {
                get
                {
                    if (f_asString)
                        return _asString;
                    if (IsString) {
                        long _pos = m_io.Pos;
                        m_io.Seek(SavePos1);
                        _asString = System.Text.Encoding.GetEncoding("UTF-16LE").GetString(m_io.ReadBytes(((SavePos2 - SavePos1) - 2)));
                        m_io.Seek(_pos);
                    }
                    f_asString = true;
                    return _asString;
                }
            }
            private ushort? _first;
            private ushort? _asNumeric;
            private List<ushort> _rest;
            private byte[] _noop;
            private WindowsResourceFile m_root;
            private WindowsResourceFile.Resource m_parent;
            public ushort? First { get { return _first; } }
            public ushort? AsNumeric { get { return _asNumeric; } }
            public List<ushort> Rest { get { return _rest; } }
            public byte[] Noop { get { return _noop; } }
            public WindowsResourceFile M_Root { get { return m_root; } }
            public WindowsResourceFile.Resource M_Parent { get { return m_parent; } }
        }
        private List<Resource> _resources;
        private WindowsResourceFile m_root;
        private KaitaiStruct m_parent;
        public List<Resource> Resources { get { return _resources; } }
        public WindowsResourceFile M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
