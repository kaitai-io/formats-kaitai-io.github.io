// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
    /// solution in free/open source software world to do i18n/l10n of
    /// software, by providing translated strings that will substitute
    /// strings in original language (typically, English).
    /// 
    /// gettext .mo is a binary database format which stores these string
    /// translation pairs in an efficient binary format, ready to be used by
    /// gettext-enabled software. .mo format is a result of compilation of
    /// text-based .po files using
    /// [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
    /// utility. The reverse conversion (.mo -&gt; .po) is also possible using
    /// [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
    /// decompiler utility.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://gitlab.com/worr/libintl">Source</a>
    /// </remarks>
    public partial class GettextMo : KaitaiStruct
    {
        public static GettextMo FromFile(string fileName)
        {
            return new GettextMo(new KaitaiStream(fileName));
        }

        public GettextMo(KaitaiStream p__io, KaitaiStruct p__parent = null, GettextMo p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _signature = m_io.ReadBytes(4);
            _mo = new Mo(m_io, this, m_root);
        }
        public partial class HashLookupIteration : KaitaiStruct
        {
            public HashLookupIteration(uint p_idx, uint p_collisionStep, KaitaiStream p__io, KaitaiStruct p__parent = null, GettextMo p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _collisionStep = p_collisionStep;
                f_original = false;
                f_translation = false;
                f_nextIdx = false;
                f_next = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_original;
            private string _original;
            public string Original
            {
                get
                {
                    if (f_original)
                        return _original;
                    _original = (string) (M_Root.Mo.Originals[Idx].Str);
                    f_original = true;
                    return _original;
                }
            }
            private bool f_translation;
            private string _translation;
            public string Translation
            {
                get
                {
                    if (f_translation)
                        return _translation;
                    _translation = (string) (M_Root.Mo.Translations[Idx].Str);
                    f_translation = true;
                    return _translation;
                }
            }
            private bool f_nextIdx;
            private int _nextIdx;
            public int NextIdx
            {
                get
                {
                    if (f_nextIdx)
                        return _nextIdx;
                    _nextIdx = (int) (((Idx + CollisionStep) - (Idx >= (M_Root.Mo.NumHashtableItems - CollisionStep) ? M_Root.Mo.NumHashtableItems : 0)));
                    f_nextIdx = true;
                    return _nextIdx;
                }
            }
            private bool f_next;
            private HashLookupIteration _next;
            public HashLookupIteration Next
            {
                get
                {
                    if (f_next)
                        return _next;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _next = new HashLookupIteration(M_Root.Mo.HashtableItems[NextIdx].Val, CollisionStep, m_io, this, m_root);
                    m_io.Seek(_pos);
                    f_next = true;
                    return _next;
                }
            }
            private uint _idx;
            private uint _collisionStep;
            private GettextMo m_root;
            private KaitaiStruct m_parent;
            public uint Idx { get { return _idx; } }
            public uint CollisionStep { get { return _collisionStep; } }
            public GettextMo M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class LookupIteration : KaitaiStruct
        {
            public LookupIteration(HashLookupIteration p_current, string p_query, KaitaiStream p__io, KaitaiStruct p__parent = null, GettextMo p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _current = p_current;
                _query = p_query;
                f_found = false;
                f_next = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_found;
            private bool _found;
            public bool Found
            {
                get
                {
                    if (f_found)
                        return _found;
                    _found = (bool) (Query == Current.Original);
                    f_found = true;
                    return _found;
                }
            }
            private bool f_next;
            private LookupIteration _next;
            public LookupIteration Next
            {
                get
                {
                    if (f_next)
                        return _next;
                    if (!(Found)) {
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _next = new LookupIteration(Current.Next, Query, m_io, this, m_root);
                        m_io.Seek(_pos);
                        f_next = true;
                    }
                    return _next;
                }
            }
            private HashLookupIteration _current;
            private string _query;
            private GettextMo m_root;
            private KaitaiStruct m_parent;
            public HashLookupIteration Current { get { return _current; } }
            public string Query { get { return _query; } }
            public GettextMo M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// def lookup(s:str, t:gettext_mo.GettextMo):
        ///   try:
        ///     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
        ///     e=l.entry
        ///     while(not e.found):
        ///       e=e.next
        ///     return e.current
        ///   except:
        ///     raise Exception(&quot;Not found &quot;+s+&quot; in the hashtable!&quot;)
        /// 
        /// lookup(t.mo.originals[145].str, t)
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c">Source</a>
        /// </remarks>
        public partial class HashtableLookup : KaitaiStruct
        {
            public HashtableLookup(string p_query, uint p_hash, KaitaiStream p__io, KaitaiStruct p__parent = null, GettextMo p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _query = p_query;
                _hash = p_hash;
                f_collisionStep = false;
                f_idx = false;
                f_hashLookupIteration = false;
                f_entry = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_collisionStep;
            private int _collisionStep;
            public int CollisionStep
            {
                get
                {
                    if (f_collisionStep)
                        return _collisionStep;
                    _collisionStep = (int) ((KaitaiStream.Mod(Hash, (M_Root.Mo.NumHashtableItems - 2)) + 1));
                    f_collisionStep = true;
                    return _collisionStep;
                }
            }
            private bool f_idx;
            private int _idx;
            public int Idx
            {
                get
                {
                    if (f_idx)
                        return _idx;
                    _idx = (int) (KaitaiStream.Mod(Hash, M_Root.Mo.NumHashtableItems));
                    f_idx = true;
                    return _idx;
                }
            }
            private bool f_hashLookupIteration;
            private HashLookupIteration _hashLookupIteration;
            public HashLookupIteration HashLookupIteration
            {
                get
                {
                    if (f_hashLookupIteration)
                        return _hashLookupIteration;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _hashLookupIteration = new HashLookupIteration(M_Root.Mo.HashtableItems[Idx].Val, CollisionStep, m_io, this, m_root);
                    m_io.Seek(_pos);
                    f_hashLookupIteration = true;
                    return _hashLookupIteration;
                }
            }
            private bool f_entry;
            private LookupIteration _entry;
            public LookupIteration Entry
            {
                get
                {
                    if (f_entry)
                        return _entry;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _entry = new LookupIteration(HashLookupIteration, Query, m_io, this, m_root);
                    m_io.Seek(_pos);
                    f_entry = true;
                    return _entry;
                }
            }
            private string _query;
            private uint _hash;
            private GettextMo m_root;
            private KaitaiStruct m_parent;
            public string Query { get { return _query; } }

            /// <summary>
            /// def string_hash(s):
            ///   s=s.encode(&quot;utf-8&quot;)
            ///   h = 0
            ///   for i in range(len(s)):
            ///     h = h &lt;&lt; 4
            ///     h += s[i]
            ///     tmp = h &amp; 0xF0000000
            ///     if tmp != 0:
            ///       h ^= tmp
            ///       h ^= tmp &gt;&gt; 24
            ///   return h
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/strhash.c">Source</a>
            /// </remarks>
            public uint Hash { get { return _hash; } }
            public GettextMo M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Mo : KaitaiStruct
        {
            public static Mo FromFile(string fileName)
            {
                return new Mo(new KaitaiStream(fileName));
            }

            private bool? m_isLe;
            public Mo(KaitaiStream p__io, GettextMo p__parent = null, GettextMo p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_originals = false;
                f_translations = false;
                f_hashtableItems = false;
                _read();
            }
            private void _read()
            {
                {
                    byte[] on = M_Root.Signature;
                    if ((KaitaiStream.ByteArrayCompare(on, new byte[] { 222, 18, 4, 149 }) == 0))
                    {
                        m_isLe = (bool) (true);
                    }
                    else if ((KaitaiStream.ByteArrayCompare(on, new byte[] { 149, 4, 18, 222 }) == 0))
                    {
                        m_isLe = (bool) (false);
                    }
                }

                if (m_isLe == null) {
                    throw new UndecidedEndiannessError();
                } else if (m_isLe == true) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE()
            {
                _version = new Version(m_io, this, m_root, m_isLe);
                _numTranslations = m_io.ReadU4le();
                _ofsOriginals = m_io.ReadU4le();
                _ofsTranslations = m_io.ReadU4le();
                _numHashtableItems = m_io.ReadU4le();
                _ofsHashtableItems = m_io.ReadU4le();
            }
            private void _readBE()
            {
                _version = new Version(m_io, this, m_root, m_isLe);
                _numTranslations = m_io.ReadU4be();
                _ofsOriginals = m_io.ReadU4be();
                _ofsTranslations = m_io.ReadU4be();
                _numHashtableItems = m_io.ReadU4be();
                _ofsHashtableItems = m_io.ReadU4be();
            }
            public partial class Version : KaitaiStruct
            {
                public static Version FromFile(string fileName)
                {
                    return new Version(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Version(KaitaiStream p__io, GettextMo.Mo p__parent = null, GettextMo p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_major = false;
                    f_minor = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _versionRaw = m_io.ReadU4le();
                }
                private void _readBE()
                {
                    _versionRaw = m_io.ReadU4be();
                }
                private bool f_major;
                private int _major;
                public int Major
                {
                    get
                    {
                        if (f_major)
                            return _major;
                        _major = (int) ((VersionRaw >> 16));
                        f_major = true;
                        return _major;
                    }
                }
                private bool f_minor;
                private int _minor;
                public int Minor
                {
                    get
                    {
                        if (f_minor)
                            return _minor;
                        _minor = (int) ((VersionRaw & 65535));
                        f_minor = true;
                        return _minor;
                    }
                }
                private uint _versionRaw;
                private GettextMo m_root;
                private GettextMo.Mo m_parent;
                public uint VersionRaw { get { return _versionRaw; } }
                public GettextMo M_Root { get { return m_root; } }
                public GettextMo.Mo M_Parent { get { return m_parent; } }
            }
            public partial class HashtableItem : KaitaiStruct
            {
                public static HashtableItem FromFile(string fileName)
                {
                    return new HashtableItem(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public HashtableItem(KaitaiStream p__io, GettextMo.Mo p__parent = null, GettextMo p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_mask = false;
                    f_val1 = false;
                    f_isSystemDependent = false;
                    f_val = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _rawVal = m_io.ReadU4le();
                }
                private void _readBE()
                {
                    _rawVal = m_io.ReadU4be();
                }
                private bool f_mask;
                private int _mask;
                public int Mask
                {
                    get
                    {
                        if (f_mask)
                            return _mask;
                        _mask = (int) (2147483648);
                        f_mask = true;
                        return _mask;
                    }
                }
                private bool f_val1;
                private int? _val1;
                public int? Val1
                {
                    get
                    {
                        if (f_val1)
                            return _val1;
                        if (RawVal != 0) {
                            _val1 = (int) ((RawVal - 1));
                        }
                        f_val1 = true;
                        return _val1;
                    }
                }
                private bool f_isSystemDependent;
                private bool? _isSystemDependent;
                public bool? IsSystemDependent
                {
                    get
                    {
                        if (f_isSystemDependent)
                            return _isSystemDependent;
                        if (RawVal != 0) {
                            _isSystemDependent = (bool) ((Val1 & Mask) == 1);
                        }
                        f_isSystemDependent = true;
                        return _isSystemDependent;
                    }
                }
                private bool f_val;
                private int? _val;
                public int? Val
                {
                    get
                    {
                        if (f_val)
                            return _val;
                        if (RawVal != 0) {
                            _val = (int) ((Val1 & ~(Mask)));
                        }
                        f_val = true;
                        return _val;
                    }
                }
                private uint _rawVal;
                private GettextMo m_root;
                private GettextMo.Mo m_parent;
                public uint RawVal { get { return _rawVal; } }
                public GettextMo M_Root { get { return m_root; } }
                public GettextMo.Mo M_Parent { get { return m_parent; } }
            }
            public partial class Descriptor : KaitaiStruct
            {
                public static Descriptor FromFile(string fileName)
                {
                    return new Descriptor(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public Descriptor(KaitaiStream p__io, GettextMo.Mo p__parent = null, GettextMo p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_str = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _lenStr = m_io.ReadU4le();
                    _ofsStr = m_io.ReadU4le();
                }
                private void _readBE()
                {
                    _lenStr = m_io.ReadU4be();
                    _ofsStr = m_io.ReadU4be();
                }
                private bool f_str;
                private string _str;
                public string Str
                {
                    get
                    {
                        if (f_str)
                            return _str;
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsStr);
                        if (m_isLe == true) {
                            _str = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(io.ReadBytes(LenStr), 0, false));
                        } else {
                            _str = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(io.ReadBytes(LenStr), 0, false));
                        }
                        io.Seek(_pos);
                        f_str = true;
                        return _str;
                    }
                }
                private uint _lenStr;
                private uint _ofsStr;
                private GettextMo m_root;
                private GettextMo.Mo m_parent;
                public uint LenStr { get { return _lenStr; } }
                public uint OfsStr { get { return _ofsStr; } }
                public GettextMo M_Root { get { return m_root; } }
                public GettextMo.Mo M_Parent { get { return m_parent; } }
            }
            private bool f_originals;
            private List<Descriptor> _originals;
            public List<Descriptor> Originals
            {
                get
                {
                    if (f_originals)
                        return _originals;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsOriginals);
                    if (m_isLe == true) {
                        _originals = new List<Descriptor>();
                        for (var i = 0; i < NumTranslations; i++)
                        {
                            _originals.Add(new Descriptor(io, this, m_root, m_isLe));
                        }
                    } else {
                        _originals = new List<Descriptor>();
                        for (var i = 0; i < NumTranslations; i++)
                        {
                            _originals.Add(new Descriptor(io, this, m_root, m_isLe));
                        }
                    }
                    io.Seek(_pos);
                    f_originals = true;
                    return _originals;
                }
            }
            private bool f_translations;
            private List<Descriptor> _translations;
            public List<Descriptor> Translations
            {
                get
                {
                    if (f_translations)
                        return _translations;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsTranslations);
                    if (m_isLe == true) {
                        _translations = new List<Descriptor>();
                        for (var i = 0; i < NumTranslations; i++)
                        {
                            _translations.Add(new Descriptor(io, this, m_root, m_isLe));
                        }
                    } else {
                        _translations = new List<Descriptor>();
                        for (var i = 0; i < NumTranslations; i++)
                        {
                            _translations.Add(new Descriptor(io, this, m_root, m_isLe));
                        }
                    }
                    io.Seek(_pos);
                    f_translations = true;
                    return _translations;
                }
            }
            private bool f_hashtableItems;
            private List<HashtableItem> _hashtableItems;
            public List<HashtableItem> HashtableItems
            {
                get
                {
                    if (f_hashtableItems)
                        return _hashtableItems;
                    if (OfsHashtableItems != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsHashtableItems);
                        if (m_isLe == true) {
                            _hashtableItems = new List<HashtableItem>();
                            for (var i = 0; i < NumHashtableItems; i++)
                            {
                                _hashtableItems.Add(new HashtableItem(io, this, m_root, m_isLe));
                            }
                        } else {
                            _hashtableItems = new List<HashtableItem>();
                            for (var i = 0; i < NumHashtableItems; i++)
                            {
                                _hashtableItems.Add(new HashtableItem(io, this, m_root, m_isLe));
                            }
                        }
                        io.Seek(_pos);
                        f_hashtableItems = true;
                    }
                    return _hashtableItems;
                }
            }
            private Version _version;
            private uint _numTranslations;
            private uint _ofsOriginals;
            private uint _ofsTranslations;
            private uint _numHashtableItems;
            private uint _ofsHashtableItems;
            private GettextMo m_root;
            private GettextMo m_parent;
            public Version Version { get { return _version; } }
            public uint NumTranslations { get { return _numTranslations; } }
            public uint OfsOriginals { get { return _ofsOriginals; } }
            public uint OfsTranslations { get { return _ofsTranslations; } }
            public uint NumHashtableItems { get { return _numHashtableItems; } }
            public uint OfsHashtableItems { get { return _ofsHashtableItems; } }
            public GettextMo M_Root { get { return m_root; } }
            public GettextMo M_Parent { get { return m_parent; } }
        }
        private byte[] _signature;
        private Mo _mo;
        private GettextMo m_root;
        private KaitaiStruct m_parent;
        public byte[] Signature { get { return _signature; } }
        public Mo Mo { get { return _mo; } }
        public GettextMo M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
