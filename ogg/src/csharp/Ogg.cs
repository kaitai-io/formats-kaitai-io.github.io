// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Ogg is a popular media container format, which provides basic
    /// streaming / buffering mechanisms and is content-agnostic. Most
    /// popular codecs that are used within Ogg streams are Vorbis (thus
    /// making Ogg/Vorbis streams) and Theora (Ogg/Theora).
    /// 
    /// Ogg stream is a sequence Ogg pages. They can be read sequentially,
    /// or one can jump into arbitrary stream location and scan for &quot;OggS&quot;
    /// sync code to find the beginning of a new Ogg page and continue
    /// decoding the stream contents from that one.
    /// </summary>
    public partial class Ogg : KaitaiStruct
    {
        public static Ogg FromFile(string fileName)
        {
            return new Ogg(new KaitaiStream(fileName));
        }

        public Ogg(KaitaiStream p__io, KaitaiStruct p__parent = null, Ogg p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _pages = new List<Page>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _pages.Add(new Page(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <summary>
        /// Ogg page is a basic unit of data in an Ogg bitstream, usually
        /// it's around 4-8 KB, with a maximum size of 65307 bytes.
        /// </summary>
        public partial class Page : KaitaiStruct
        {
            public static Page FromFile(string fileName)
            {
                return new Page(new KaitaiStream(fileName));
            }

            public Page(KaitaiStream p__io, Ogg p__parent = null, Ogg p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _syncCode = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_syncCode, new byte[] { 79, 103, 103, 83 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 79, 103, 103, 83 }, _syncCode, m_io, "/types/page/seq/0");
                }
                _version = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_version, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, _version, m_io, "/types/page/seq/1");
                }
                _reserved1 = m_io.ReadBitsIntBe(5);
                _isEndOfStream = m_io.ReadBitsIntBe(1) != 0;
                _isBeginningOfStream = m_io.ReadBitsIntBe(1) != 0;
                _isContinuation = m_io.ReadBitsIntBe(1) != 0;
                m_io.AlignToByte();
                _granulePos = m_io.ReadU8le();
                _bitstreamSerial = m_io.ReadU4le();
                _pageSeqNum = m_io.ReadU4le();
                _crc32 = m_io.ReadU4le();
                _numSegments = m_io.ReadU1();
                _lenSegments = new List<byte>();
                for (var i = 0; i < NumSegments; i++)
                {
                    _lenSegments.Add(m_io.ReadU1());
                }
                _segments = new List<byte[]>();
                for (var i = 0; i < NumSegments; i++)
                {
                    _segments.Add(m_io.ReadBytes(LenSegments[i]));
                }
            }
            private byte[] _syncCode;
            private byte[] _version;
            private ulong _reserved1;
            private bool _isEndOfStream;
            private bool _isBeginningOfStream;
            private bool _isContinuation;
            private ulong _granulePos;
            private uint _bitstreamSerial;
            private uint _pageSeqNum;
            private uint _crc32;
            private byte _numSegments;
            private List<byte> _lenSegments;
            private List<byte[]> _segments;
            private Ogg m_root;
            private Ogg m_parent;
            public byte[] SyncCode { get { return _syncCode; } }

            /// <summary>
            /// Version of the Ogg bitstream format. Currently must be 0.
            /// </summary>
            public byte[] Version { get { return _version; } }
            public ulong Reserved1 { get { return _reserved1; } }

            /// <summary>
            /// EOS (End Of Stream) mark. This page is the last page in the
            /// logical bitstream. The EOS flag must be set on the final page of
            /// every logical bitstream, and must not be set on any other page.
            /// </summary>
            public bool IsEndOfStream { get { return _isEndOfStream; } }

            /// <summary>
            /// BOS (Beginning Of Stream) mark. This page is the first page in
            /// the logical bitstream. The BOS flag must be set on the first
            /// page of every logical bitstream, and must not be set on any
            /// other page.
            /// </summary>
            public bool IsBeginningOfStream { get { return _isBeginningOfStream; } }

            /// <summary>
            /// The first packet on this page is a continuation of the previous
            /// packet in the logical bitstream.
            /// </summary>
            public bool IsContinuation { get { return _isContinuation; } }

            /// <summary>
            /// &quot;Granule position&quot; is the time marker in Ogg files. It is an
            /// abstract value, whose meaning is determined by the codec. It
            /// may, for example, be a count of the number of samples, the
            /// number of frames or a more complex scheme.
            /// </summary>
            public ulong GranulePos { get { return _granulePos; } }

            /// <summary>
            /// Serial number that identifies a page as belonging to a
            /// particular logical bitstream. Each logical bitstream in a file
            /// has a unique value, and this field allows implementations to
            /// deliver the pages to the appropriate decoder. In a typical
            /// Vorbis and Theora file, one stream is the audio (Vorbis), and
            /// the other is the video (Theora).
            /// </summary>
            public uint BitstreamSerial { get { return _bitstreamSerial; } }

            /// <summary>
            /// Sequential number of page, guaranteed to be monotonically
            /// increasing for each logical bitstream. The first page is 0, the
            /// second 1, etc. This allows implementations to detect when data
            /// has been lost.
            /// </summary>
            public uint PageSeqNum { get { return _pageSeqNum; } }

            /// <summary>
            /// This field provides a CRC32 checksum of the data in the entire
            /// page (including the page header, calculated with the checksum
            /// field set to 0). This allows verification that the data has not
            /// been corrupted since it was created. Pages that fail the
            /// checksum should be discarded. The checksum is generated using a
            /// polynomial value of 0x04C11DB7.
            /// </summary>
            public uint Crc32 { get { return _crc32; } }

            /// <summary>
            /// The number of segments that exist in this page. There can be a
            /// maximum of 255 segments in any one page.
            /// </summary>
            public byte NumSegments { get { return _numSegments; } }

            /// <summary>
            /// Table of lengths of segments.
            /// </summary>
            public List<byte> LenSegments { get { return _lenSegments; } }

            /// <summary>
            /// Segment content bytes make up the rest of the Ogg page.
            /// </summary>
            public List<byte[]> Segments { get { return _segments; } }
            public Ogg M_Root { get { return m_root; } }
            public Ogg M_Parent { get { return m_parent; } }
        }
        private List<Page> _pages;
        private Ogg m_root;
        private KaitaiStruct m_parent;
        public List<Page> Pages { get { return _pages; } }
        public Ogg M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
