// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// rtpdump is a format used by rtptools to record and replay
    /// rtp data from network capture.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h">Source</a>
    /// </remarks>
    public partial class Rtpdump : KaitaiStruct
    {
        public static Rtpdump FromFile(string fileName)
        {
            return new Rtpdump(new KaitaiStream(fileName));
        }

        public Rtpdump(KaitaiStream p__io, KaitaiStruct p__parent = null, Rtpdump p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _fileHeader = new HeaderT(m_io, this, m_root);
            _packets = new List<PacketT>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _packets.Add(new PacketT(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class HeaderT : KaitaiStruct
        {
            public static HeaderT FromFile(string fileName)
            {
                return new HeaderT(new KaitaiStream(fileName));
            }

            public HeaderT(KaitaiStream p__io, Rtpdump p__parent = null, Rtpdump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _shebang = m_io.ReadBytes(12);
                if (!((KaitaiStream.ByteArrayCompare(_shebang, new byte[] { 35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48 }, _shebang, m_io, "/types/header_t/seq/0");
                }
                _space = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_space, new byte[] { 32 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 32 }, _space, m_io, "/types/header_t/seq/1");
                }
                _ip = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(47, false, true, true));
                _port = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(10, false, true, true));
                _startSec = m_io.ReadU4be();
                _startUsec = m_io.ReadU4be();
                _ip2 = m_io.ReadU4be();
                _port2 = m_io.ReadU2be();
                _padding = m_io.ReadU2be();
            }
            private byte[] _shebang;
            private byte[] _space;
            private string _ip;
            private string _port;
            private uint _startSec;
            private uint _startUsec;
            private uint _ip2;
            private ushort _port2;
            private ushort _padding;
            private Rtpdump m_root;
            private Rtpdump m_parent;
            public byte[] Shebang { get { return _shebang; } }
            public byte[] Space { get { return _space; } }
            public string Ip { get { return _ip; } }
            public string Port { get { return _port; } }

            /// <summary>
            /// start of recording, the seconds part.
            /// </summary>
            public uint StartSec { get { return _startSec; } }

            /// <summary>
            /// start of recording, the microseconds part.
            /// </summary>
            public uint StartUsec { get { return _startUsec; } }

            /// <summary>
            /// network source.
            /// </summary>
            public uint Ip2 { get { return _ip2; } }

            /// <summary>
            /// port.
            /// </summary>
            public ushort Port2 { get { return _port2; } }

            /// <summary>
            /// 2 bytes padding.
            /// </summary>
            public ushort Padding { get { return _padding; } }
            public Rtpdump M_Root { get { return m_root; } }
            public Rtpdump M_Parent { get { return m_parent; } }
        }
        public partial class PacketT : KaitaiStruct
        {
            public static PacketT FromFile(string fileName)
            {
                return new PacketT(new KaitaiStream(fileName));
            }

            public PacketT(KaitaiStream p__io, Rtpdump p__parent = null, Rtpdump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _length = m_io.ReadU2be();
                _lenBody = m_io.ReadU2be();
                _packetUsec = m_io.ReadU4be();
                __raw_body = m_io.ReadBytes(LenBody);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new RtpPacket(io___raw_body);
            }
            private ushort _length;
            private ushort _lenBody;
            private uint _packetUsec;
            private RtpPacket _body;
            private Rtpdump m_root;
            private Rtpdump m_parent;
            private byte[] __raw_body;

            /// <summary>
            /// packet length (including this header).
            /// </summary>
            public ushort Length { get { return _length; } }

            /// <summary>
            /// payload length.
            /// </summary>
            public ushort LenBody { get { return _lenBody; } }

            /// <summary>
            /// timestamp of packet since the start.
            /// </summary>
            public uint PacketUsec { get { return _packetUsec; } }
            public RtpPacket Body { get { return _body; } }
            public Rtpdump M_Root { get { return m_root; } }
            public Rtpdump M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        private HeaderT _fileHeader;
        private List<PacketT> _packets;
        private Rtpdump m_root;
        private KaitaiStruct m_parent;
        public HeaderT FileHeader { get { return _fileHeader; } }
        public List<PacketT> Packets { get { return _packets; } }
        public Rtpdump M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
