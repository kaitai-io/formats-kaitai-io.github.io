// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Duck IVF is a simple container format for raw VP8 data, which is an open and
    /// royalty-free video compression format, currently developed by Google.
    /// 
    /// Test .ivf files are available at
    /// &lt;https://chromium.googlesource.com/webm/vp8-test-vectors&gt;
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://wiki.multimedia.cx/index.php/Duck_IVF">Source</a>
    /// </remarks>
    public partial class Vp8DuckIvf : KaitaiStruct
    {
        public static Vp8DuckIvf FromFile(string fileName)
        {
            return new Vp8DuckIvf(new KaitaiStream(fileName));
        }

        public Vp8DuckIvf(KaitaiStream p__io, KaitaiStruct p__parent = null, Vp8DuckIvf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic1 = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic1, new byte[] { 68, 75, 73, 70 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 68, 75, 73, 70 }, _magic1, m_io, "/seq/0");
            }
            _version = m_io.ReadU2le();
            _lenHeader = m_io.ReadU2le();
            _codec = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_codec, new byte[] { 86, 80, 56, 48 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 86, 80, 56, 48 }, _codec, m_io, "/seq/3");
            }
            _width = m_io.ReadU2le();
            _height = m_io.ReadU2le();
            _framerate = m_io.ReadU4le();
            _timescale = m_io.ReadU4le();
            _numFrames = m_io.ReadU4le();
            _unused = m_io.ReadU4le();
            _imageData = new List<Blocks>();
            for (var i = 0; i < NumFrames; i++)
            {
                _imageData.Add(new Blocks(m_io, this, m_root));
            }
        }
        public partial class Block : KaitaiStruct
        {
            public static Block FromFile(string fileName)
            {
                return new Block(new KaitaiStream(fileName));
            }

            public Block(KaitaiStream p__io, Vp8DuckIvf.Blocks p__parent = null, Vp8DuckIvf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenFrame = m_io.ReadU4le();
                _timestamp = m_io.ReadU8le();
                _framedata = m_io.ReadBytes(LenFrame);
            }
            private uint _lenFrame;
            private ulong _timestamp;
            private byte[] _framedata;
            private Vp8DuckIvf m_root;
            private Vp8DuckIvf.Blocks m_parent;

            /// <summary>
            /// size of the frame data
            /// </summary>
            public uint LenFrame { get { return _lenFrame; } }
            public ulong Timestamp { get { return _timestamp; } }
            public byte[] Framedata { get { return _framedata; } }
            public Vp8DuckIvf M_Root { get { return m_root; } }
            public Vp8DuckIvf.Blocks M_Parent { get { return m_parent; } }
        }
        public partial class Blocks : KaitaiStruct
        {
            public static Blocks FromFile(string fileName)
            {
                return new Blocks(new KaitaiStream(fileName));
            }

            public Blocks(KaitaiStream p__io, Vp8DuckIvf p__parent = null, Vp8DuckIvf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new Block(m_io, this, m_root);
            }
            private Block _entries;
            private Vp8DuckIvf m_root;
            private Vp8DuckIvf m_parent;
            public Block Entries { get { return _entries; } }
            public Vp8DuckIvf M_Root { get { return m_root; } }
            public Vp8DuckIvf M_Parent { get { return m_parent; } }
        }
        private byte[] _magic1;
        private ushort _version;
        private ushort _lenHeader;
        private byte[] _codec;
        private ushort _width;
        private ushort _height;
        private uint _framerate;
        private uint _timescale;
        private uint _numFrames;
        private uint _unused;
        private List<Blocks> _imageData;
        private Vp8DuckIvf m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Magic Number of IVF Files
        /// </summary>
        public byte[] Magic1 { get { return _magic1; } }

        /// <summary>
        /// This should be 0
        /// </summary>
        public ushort Version { get { return _version; } }

        /// <summary>
        /// Normally the header length is 32 byte
        /// </summary>
        public ushort LenHeader { get { return _lenHeader; } }

        /// <summary>
        /// Name of the codec e.g. 'VP80' for VP8
        /// </summary>
        public byte[] Codec { get { return _codec; } }

        /// <summary>
        /// The (initial) width of the video, every keyframe may change the resolution
        /// </summary>
        public ushort Width { get { return _width; } }

        /// <summary>
        /// The (initial) height of the video, every keyframe may change the resolution
        /// </summary>
        public ushort Height { get { return _height; } }

        /// <summary>
        /// the (framerate * timescale) e.g. for 30 fps -&gt; 30000
        /// </summary>
        public uint Framerate { get { return _framerate; } }

        /// <summary>
        /// the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
        /// </summary>
        public uint Timescale { get { return _timescale; } }

        /// <summary>
        /// the number of frames (if not a camera stream)
        /// </summary>
        public uint NumFrames { get { return _numFrames; } }
        public uint Unused { get { return _unused; } }
        public List<Blocks> ImageData { get { return _imageData; } }
        public Vp8DuckIvf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
