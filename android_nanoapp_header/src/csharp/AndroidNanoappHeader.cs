// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130">Source</a>
    /// </remarks>
    public partial class AndroidNanoappHeader : KaitaiStruct
    {
        public static AndroidNanoappHeader FromFile(string fileName)
        {
            return new AndroidNanoappHeader(new KaitaiStream(fileName));
        }

        public AndroidNanoappHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, AndroidNanoappHeader p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_isEncrypted = false;
            f_isSigned = false;
            f_isTcmCapable = false;
            _read();
        }
        private void _read()
        {
            _headerVersion = m_io.ReadU4le();
            if (!(_headerVersion == 1))
            {
                throw new ValidationNotEqualError(1, _headerVersion, m_io, "/seq/0");
            }
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 78, 65, 78, 79 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 78, 65, 78, 79 }, _magic, m_io, "/seq/1");
            }
            _appId = m_io.ReadU8le();
            _appVersion = m_io.ReadU4le();
            _flags = m_io.ReadU4le();
            _hubType = m_io.ReadU8le();
            _chreApiMajorVersion = m_io.ReadU1();
            _chreApiMinorVersion = m_io.ReadU1();
            _reserved = m_io.ReadBytes(6);
            if (!((KaitaiStream.ByteArrayCompare(_reserved, new byte[] { 0, 0, 0, 0, 0, 0 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0 }, _reserved, m_io, "/seq/8");
            }
        }
        private bool f_isEncrypted;
        private bool _isEncrypted;
        public bool IsEncrypted
        {
            get
            {
                if (f_isEncrypted)
                    return _isEncrypted;
                f_isEncrypted = true;
                _isEncrypted = (bool) ((Flags & 2) != 0);
                return _isEncrypted;
            }
        }
        private bool f_isSigned;
        private bool _isSigned;
        public bool IsSigned
        {
            get
            {
                if (f_isSigned)
                    return _isSigned;
                f_isSigned = true;
                _isSigned = (bool) ((Flags & 1) != 0);
                return _isSigned;
            }
        }
        private bool f_isTcmCapable;
        private bool _isTcmCapable;
        public bool IsTcmCapable
        {
            get
            {
                if (f_isTcmCapable)
                    return _isTcmCapable;
                f_isTcmCapable = true;
                _isTcmCapable = (bool) ((Flags & 4) != 0);
                return _isTcmCapable;
            }
        }
        private uint _headerVersion;
        private byte[] _magic;
        private ulong _appId;
        private uint _appVersion;
        private uint _flags;
        private ulong _hubType;
        private byte _chreApiMajorVersion;
        private byte _chreApiMinorVersion;
        private byte[] _reserved;
        private AndroidNanoappHeader m_root;
        private KaitaiStruct m_parent;
        public uint HeaderVersion { get { return _headerVersion; } }
        public byte[] Magic { get { return _magic; } }
        public ulong AppId { get { return _appId; } }
        public uint AppVersion { get { return _appVersion; } }
        public uint Flags { get { return _flags; } }
        public ulong HubType { get { return _hubType; } }
        public byte ChreApiMajorVersion { get { return _chreApiMajorVersion; } }
        public byte ChreApiMinorVersion { get { return _chreApiMinorVersion; } }
        public byte[] Reserved { get { return _reserved; } }
        public AndroidNanoappHeader M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
