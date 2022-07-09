// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://hashcat.net/wiki/doku.php?id=restore">Source</a>
    /// </remarks>
    public partial class HashcatRestore : KaitaiStruct
    {
        public static HashcatRestore FromFile(string fileName)
        {
            return new HashcatRestore(new KaitaiStream(fileName));
        }

        public HashcatRestore(KaitaiStream p__io, KaitaiStruct p__parent = null, HashcatRestore p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _version = m_io.ReadU4le();
            _cwd = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(256), 0, false));
            _dictsPos = m_io.ReadU4le();
            _masksPos = m_io.ReadU4le();
            _padding = m_io.ReadBytes(4);
            _currentRestorePoint = m_io.ReadU8le();
            _argc = m_io.ReadU4le();
            _padding2 = m_io.ReadBytes(12);
            _argv = new List<string>();
            for (var i = 0; i < Argc; i++)
            {
                _argv.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(10, false, true, true)));
            }
        }
        private uint _version;
        private string _cwd;
        private uint _dictsPos;
        private uint _masksPos;
        private byte[] _padding;
        private ulong _currentRestorePoint;
        private uint _argc;
        private byte[] _padding2;
        private List<string> _argv;
        private HashcatRestore m_root;
        private KaitaiStruct m_parent;
        public uint Version { get { return _version; } }
        public string Cwd { get { return _cwd; } }
        public uint DictsPos { get { return _dictsPos; } }
        public uint MasksPos { get { return _masksPos; } }
        public byte[] Padding { get { return _padding; } }
        public ulong CurrentRestorePoint { get { return _currentRestorePoint; } }
        public uint Argc { get { return _argc; } }
        public byte[] Padding2 { get { return _padding2; } }
        public List<string> Argv { get { return _argv; } }
        public HashcatRestore M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
