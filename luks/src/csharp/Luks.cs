// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Linux Unified Key Setup (LUKS) is a format specification for storing disk
    /// encryption parameters and up to 8 user keys (which can unlock the master key).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://gitlab.com/cryptsetup/cryptsetup/wikis/LUKS-standard/on-disk-format.pdf">Source</a>
    /// </remarks>
    public partial class Luks : KaitaiStruct
    {
        public static Luks FromFile(string fileName)
        {
            return new Luks(new KaitaiStream(fileName));
        }

        public Luks(KaitaiStream p__io, KaitaiStruct p__parent = null, Luks p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_payload = false;
            _read();
        }
        private void _read()
        {
            _partitionHeader = new PartitionHeader(m_io, this, m_root);
        }
        public partial class PartitionHeader : KaitaiStruct
        {
            public static PartitionHeader FromFile(string fileName)
            {
                return new PartitionHeader(new KaitaiStream(fileName));
            }

            public PartitionHeader(KaitaiStream p__io, Luks p__parent = null, Luks p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(6);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 76, 85, 75, 83, 186, 190 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 76, 85, 75, 83, 186, 190 }, Magic, M_Io, "/types/partition_header/seq/0");
                }
                _version = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(Version, new byte[] { 0, 1 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 1 }, Version, M_Io, "/types/partition_header/seq/1");
                }
                _cipherNameSpecification = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(32));
                _cipherModeSpecification = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(32));
                _hashSpecification = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(32));
                _payloadOffset = m_io.ReadU4be();
                _numberOfKeyBytes = m_io.ReadU4be();
                _masterKeyChecksum = m_io.ReadBytes(20);
                _masterKeySaltParameter = m_io.ReadBytes(32);
                _masterKeyIterationsParameter = m_io.ReadU4be();
                _uuid = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(40));
                _keySlots = new List<KeySlot>((int) (8));
                for (var i = 0; i < 8; i++)
                {
                    _keySlots.Add(new KeySlot(m_io, this, m_root));
                }
            }
            public partial class KeySlot : KaitaiStruct
            {
                public static KeySlot FromFile(string fileName)
                {
                    return new KeySlot(new KaitaiStream(fileName));
                }


                public enum KeySlotStates
                {
                    DisabledKeySlot = 57005,
                    EnabledKeySlot = 11301363,
                }
                public KeySlot(KaitaiStream p__io, Luks.PartitionHeader p__parent = null, Luks p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_keyMaterial = false;
                    _read();
                }
                private void _read()
                {
                    _stateOfKeySlot = ((KeySlotStates) m_io.ReadU4be());
                    _iterationParameter = m_io.ReadU4be();
                    _saltParameter = m_io.ReadBytes(32);
                    _startSectorOfKeyMaterial = m_io.ReadU4be();
                    _numberOfAntiForensicStripes = m_io.ReadU4be();
                }
                private bool f_keyMaterial;
                private byte[] _keyMaterial;
                public byte[] KeyMaterial
                {
                    get
                    {
                        if (f_keyMaterial)
                            return _keyMaterial;
                        long _pos = m_io.Pos;
                        m_io.Seek((StartSectorOfKeyMaterial * 512));
                        _keyMaterial = m_io.ReadBytes((M_Parent.NumberOfKeyBytes * NumberOfAntiForensicStripes));
                        m_io.Seek(_pos);
                        f_keyMaterial = true;
                        return _keyMaterial;
                    }
                }
                private KeySlotStates _stateOfKeySlot;
                private uint _iterationParameter;
                private byte[] _saltParameter;
                private uint _startSectorOfKeyMaterial;
                private uint _numberOfAntiForensicStripes;
                private Luks m_root;
                private Luks.PartitionHeader m_parent;
                public KeySlotStates StateOfKeySlot { get { return _stateOfKeySlot; } }
                public uint IterationParameter { get { return _iterationParameter; } }
                public byte[] SaltParameter { get { return _saltParameter; } }
                public uint StartSectorOfKeyMaterial { get { return _startSectorOfKeyMaterial; } }
                public uint NumberOfAntiForensicStripes { get { return _numberOfAntiForensicStripes; } }
                public Luks M_Root { get { return m_root; } }
                public Luks.PartitionHeader M_Parent { get { return m_parent; } }
            }
            private byte[] _magic;
            private byte[] _version;
            private string _cipherNameSpecification;
            private string _cipherModeSpecification;
            private string _hashSpecification;
            private uint _payloadOffset;
            private uint _numberOfKeyBytes;
            private byte[] _masterKeyChecksum;
            private byte[] _masterKeySaltParameter;
            private uint _masterKeyIterationsParameter;
            private string _uuid;
            private List<KeySlot> _keySlots;
            private Luks m_root;
            private Luks m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte[] Version { get { return _version; } }
            public string CipherNameSpecification { get { return _cipherNameSpecification; } }
            public string CipherModeSpecification { get { return _cipherModeSpecification; } }
            public string HashSpecification { get { return _hashSpecification; } }
            public uint PayloadOffset { get { return _payloadOffset; } }
            public uint NumberOfKeyBytes { get { return _numberOfKeyBytes; } }
            public byte[] MasterKeyChecksum { get { return _masterKeyChecksum; } }
            public byte[] MasterKeySaltParameter { get { return _masterKeySaltParameter; } }
            public uint MasterKeyIterationsParameter { get { return _masterKeyIterationsParameter; } }
            public string Uuid { get { return _uuid; } }
            public List<KeySlot> KeySlots { get { return _keySlots; } }
            public Luks M_Root { get { return m_root; } }
            public Luks M_Parent { get { return m_parent; } }
        }
        private bool f_payload;
        private byte[] _payload;
        public byte[] Payload
        {
            get
            {
                if (f_payload)
                    return _payload;
                long _pos = m_io.Pos;
                m_io.Seek((PartitionHeader.PayloadOffset * 512));
                _payload = m_io.ReadBytesFull();
                m_io.Seek(_pos);
                f_payload = true;
                return _payload;
            }
        }
        private PartitionHeader _partitionHeader;
        private Luks m_root;
        private KaitaiStruct m_parent;
        public PartitionHeader PartitionHeader { get { return _partitionHeader; } }
        public Luks M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
