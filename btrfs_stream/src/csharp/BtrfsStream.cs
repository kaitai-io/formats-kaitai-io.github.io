// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
    /// administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
    /// integral multi-device spanning in Linux file systems.
    /// Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
    /// using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
    /// different Btrfs file system. The `btrfs send` command creates a set of data modifications required
    /// for converting one subvolume into another.
    /// This spec can be used to disassemble the binary diff created by the `btrfs send` command.
    /// If you want a text representation you may want to checkout `btrfs receive --dump` instead.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive.html">Source</a>
    /// </remarks>
    public partial class BtrfsStream : KaitaiStruct
    {
        public static BtrfsStream FromFile(string fileName)
        {
            return new BtrfsStream(new KaitaiStream(fileName));
        }


        public enum Command
        {
            Unspec = 0,
            Subvol = 1,
            Snapshot = 2,
            Mkfile = 3,
            Mkdir = 4,
            Mknod = 5,
            Mkfifo = 6,
            Mksock = 7,
            Symlink = 8,
            Rename = 9,
            Link = 10,
            Unlink = 11,
            Rmdir = 12,
            SetXattr = 13,
            RemoveXattr = 14,
            Write = 15,
            Clone = 16,
            Truncate = 17,
            Chmod = 18,
            Chown = 19,
            Utimes = 20,
            End = 21,
            UpdateExtent = 22,
        }

        public enum Attribute
        {
            Unspec = 0,
            Uuid = 1,
            Ctransid = 2,
            Ino = 3,
            Size = 4,
            Mode = 5,
            Uid = 6,
            Gid = 7,
            Rdev = 8,
            Ctime = 9,
            Mtime = 10,
            Atime = 11,
            Otime = 12,
            XattrName = 13,
            XattrData = 14,
            Path = 15,
            PathTo = 16,
            PathLink = 17,
            FileOffset = 18,
            Data = 19,
            CloneUuid = 20,
            CloneCtransid = 21,
            ClonePath = 22,
            CloneOffset = 23,
            CloneLen = 24,
        }
        public BtrfsStream(KaitaiStream p__io, KaitaiStruct p__parent = null, BtrfsStream p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new SendStreamHeader(m_io, this, m_root);
            _commands = new List<SendCommand>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _commands.Add(new SendCommand(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class SendStreamHeader : KaitaiStruct
        {
            public static SendStreamHeader FromFile(string fileName)
            {
                return new SendStreamHeader(new KaitaiStream(fileName));
            }

            public SendStreamHeader(KaitaiStream p__io, BtrfsStream p__parent = null, BtrfsStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(13);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0 }, Magic, M_Io, "/types/send_stream_header/seq/0");
                }
                _version = m_io.ReadU4le();
            }
            private byte[] _magic;
            private uint _version;
            private BtrfsStream m_root;
            private BtrfsStream m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint Version { get { return _version; } }
            public BtrfsStream M_Root { get { return m_root; } }
            public BtrfsStream M_Parent { get { return m_parent; } }
        }
        public partial class SendCommand : KaitaiStruct
        {
            public static SendCommand FromFile(string fileName)
            {
                return new SendCommand(new KaitaiStream(fileName));
            }

            public SendCommand(KaitaiStream p__io, BtrfsStream p__parent = null, BtrfsStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenData = m_io.ReadU4le();
                _type = ((BtrfsStream.Command) m_io.ReadU2le());
                _checksum = m_io.ReadBytes(4);
                __raw_data = m_io.ReadBytes(LenData);
                var io___raw_data = new KaitaiStream(__raw_data);
                _data = new Tlvs(io___raw_data, this, m_root);
            }
            public partial class Tlv : KaitaiStruct
            {
                public static Tlv FromFile(string fileName)
                {
                    return new Tlv(new KaitaiStream(fileName));
                }

                public Tlv(KaitaiStream p__io, BtrfsStream.SendCommand.Tlvs p__parent = null, BtrfsStream p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _type = ((BtrfsStream.Attribute) m_io.ReadU2le());
                    _length = m_io.ReadU2le();
                    switch (Type) {
                    case BtrfsStream.Attribute.Ctransid: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.Size: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.CloneUuid: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new Uuid(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.FileOffset: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.Otime: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new Timespec(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.Uid: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.Atime: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new Timespec(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.Ctime: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new Timespec(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.Uuid: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new Uuid(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.CloneLen: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.XattrName: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new String(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.CloneCtransid: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.Mode: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.Mtime: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new Timespec(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.PathLink: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new String(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.Rdev: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.PathTo: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new String(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.Path: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new String(io___raw_value, this, m_root);
                        break;
                    }
                    case BtrfsStream.Attribute.CloneOffset: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.Gid: {
                        _value = m_io.ReadU8le();
                        break;
                    }
                    case BtrfsStream.Attribute.ClonePath: {
                        __raw_value = m_io.ReadBytes(Length);
                        var io___raw_value = new KaitaiStream(__raw_value);
                        _value = new String(io___raw_value, this, m_root);
                        break;
                    }
                    default: {
                        _value = m_io.ReadBytes(Length);
                        break;
                    }
                    }
                }
                private Attribute _type;
                private ushort _length;
                private object _value;
                private BtrfsStream m_root;
                private BtrfsStream.SendCommand.Tlvs m_parent;
                private byte[] __raw_value;
                public Attribute Type { get { return _type; } }
                public ushort Length { get { return _length; } }
                public object Value { get { return _value; } }
                public BtrfsStream M_Root { get { return m_root; } }
                public BtrfsStream.SendCommand.Tlvs M_Parent { get { return m_parent; } }
                public byte[] M_RawValue { get { return __raw_value; } }
            }
            public partial class Uuid : KaitaiStruct
            {
                public static Uuid FromFile(string fileName)
                {
                    return new Uuid(new KaitaiStream(fileName));
                }

                public Uuid(KaitaiStream p__io, BtrfsStream.SendCommand.Tlv p__parent = null, BtrfsStream p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _uuid = m_io.ReadBytes(16);
                }
                private byte[] _uuid;
                private BtrfsStream m_root;
                private BtrfsStream.SendCommand.Tlv m_parent;
                public byte[] Uuid { get { return _uuid; } }
                public BtrfsStream M_Root { get { return m_root; } }
                public BtrfsStream.SendCommand.Tlv M_Parent { get { return m_parent; } }
            }
            public partial class Tlvs : KaitaiStruct
            {
                public static Tlvs FromFile(string fileName)
                {
                    return new Tlvs(new KaitaiStream(fileName));
                }

                public Tlvs(KaitaiStream p__io, BtrfsStream.SendCommand p__parent = null, BtrfsStream p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _tlv = new List<Tlv>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _tlv.Add(new Tlv(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                private List<Tlv> _tlv;
                private BtrfsStream m_root;
                private BtrfsStream.SendCommand m_parent;
                public List<Tlv> Tlv { get { return _tlv; } }
                public BtrfsStream M_Root { get { return m_root; } }
                public BtrfsStream.SendCommand M_Parent { get { return m_parent; } }
            }
            public partial class String : KaitaiStruct
            {
                public static String FromFile(string fileName)
                {
                    return new String(new KaitaiStream(fileName));
                }

                public String(KaitaiStream p__io, BtrfsStream.SendCommand.Tlv p__parent = null, BtrfsStream p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _string = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
                }
                private string _string;
                private BtrfsStream m_root;
                private BtrfsStream.SendCommand.Tlv m_parent;
                public string String { get { return _string; } }
                public BtrfsStream M_Root { get { return m_root; } }
                public BtrfsStream.SendCommand.Tlv M_Parent { get { return m_parent; } }
            }
            public partial class Timespec : KaitaiStruct
            {
                public static Timespec FromFile(string fileName)
                {
                    return new Timespec(new KaitaiStream(fileName));
                }

                public Timespec(KaitaiStream p__io, BtrfsStream.SendCommand.Tlv p__parent = null, BtrfsStream p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _tsSec = m_io.ReadS8le();
                    _tsNsec = m_io.ReadS4le();
                }
                private long _tsSec;
                private int _tsNsec;
                private BtrfsStream m_root;
                private BtrfsStream.SendCommand.Tlv m_parent;
                public long TsSec { get { return _tsSec; } }
                public int TsNsec { get { return _tsNsec; } }
                public BtrfsStream M_Root { get { return m_root; } }
                public BtrfsStream.SendCommand.Tlv M_Parent { get { return m_parent; } }
            }
            private uint _lenData;
            private Command _type;
            private byte[] _checksum;
            private Tlvs _data;
            private BtrfsStream m_root;
            private BtrfsStream m_parent;
            private byte[] __raw_data;
            public uint LenData { get { return _lenData; } }
            public Command Type { get { return _type; } }

            /// <summary>
            /// CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
            /// </summary>
            public byte[] Checksum { get { return _checksum; } }
            public Tlvs Data { get { return _data; } }
            public BtrfsStream M_Root { get { return m_root; } }
            public BtrfsStream M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }
        private SendStreamHeader _header;
        private List<SendCommand> _commands;
        private BtrfsStream m_root;
        private KaitaiStruct m_parent;
        public SendStreamHeader Header { get { return _header; } }
        public List<SendCommand> Commands { get { return _commands; } }
        public BtrfsStream M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
