// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Creative Voice File is a container file format for digital audio
    /// wave data. Initial revisions were able to support only unsigned
    /// 8-bit PCM and ADPCM data, later versions were revised to add support
    /// for 16-bit PCM and a-law / u-law formats.
    /// 
    /// This format was actively used in 1990s, around the advent of
    /// Creative's sound cards (Sound Blaster family). It was a popular
    /// choice for a digital sound container in lots of games and multimedia
    /// software due to simplicity and availability of Creative's recording
    /// / editing tools.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice">Source</a>
    /// </remarks>
    public partial class CreativeVoiceFile : KaitaiStruct
    {
        public static CreativeVoiceFile FromFile(string fileName)
        {
            return new CreativeVoiceFile(new KaitaiStream(fileName));
        }


        public enum BlockTypes
        {
            Terminator = 0,
            SoundData = 1,
            SoundDataCont = 2,
            Silence = 3,
            Marker = 4,
            Text = 5,
            RepeatStart = 6,
            RepeatEnd = 7,
            ExtraInfo = 8,
            SoundDataNew = 9,
        }

        public enum Codecs
        {
            Pcm8bitUnsigned = 0,
            Adpcm4bit = 1,
            Adpcm26bit = 2,
            Adpcm2Bit = 3,
            Pcm16bitSigned = 4,
            Alaw = 6,
            Ulaw = 7,
            Adpcm4To16bit = 512,
        }
        public CreativeVoiceFile(KaitaiStream p__io, KaitaiStruct p__parent = null, CreativeVoiceFile p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.EnsureFixedContents(new byte[] { 67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26 });
            _headerSize = m_io.ReadU2le();
            _version = m_io.ReadU2le();
            _checksum = m_io.ReadU2le();
            _blocks = new List<Block>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _blocks.Add(new Block(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker">Source</a>
        /// </remarks>
        public partial class BlockMarker : KaitaiStruct
        {
            public static BlockMarker FromFile(string fileName)
            {
                return new BlockMarker(new KaitaiStream(fileName));
            }

            public BlockMarker(KaitaiStream p__io, CreativeVoiceFile.Block p__parent = null, CreativeVoiceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _markerId = m_io.ReadU2le();
            }
            private ushort _markerId;
            private CreativeVoiceFile m_root;
            private CreativeVoiceFile.Block m_parent;

            /// <summary>
            /// Marker ID
            /// </summary>
            public ushort MarkerId { get { return _markerId; } }
            public CreativeVoiceFile M_Root { get { return m_root; } }
            public CreativeVoiceFile.Block M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence">Source</a>
        /// </remarks>
        public partial class BlockSilence : KaitaiStruct
        {
            public static BlockSilence FromFile(string fileName)
            {
                return new BlockSilence(new KaitaiStream(fileName));
            }

            public BlockSilence(KaitaiStream p__io, CreativeVoiceFile.Block p__parent = null, CreativeVoiceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_sampleRate = false;
                f_durationSec = false;
                _read();
            }
            private void _read()
            {
                _durationSamples = m_io.ReadU2le();
                _freqDiv = m_io.ReadU1();
            }
            private bool f_sampleRate;
            private double _sampleRate;
            public double SampleRate
            {
                get
                {
                    if (f_sampleRate)
                        return _sampleRate;
                    _sampleRate = (double) ((1000000.0 / (256 - FreqDiv)));
                    f_sampleRate = true;
                    return _sampleRate;
                }
            }
            private bool f_durationSec;
            private double _durationSec;

            /// <summary>
            /// Duration of silence, in seconds
            /// </summary>
            public double DurationSec
            {
                get
                {
                    if (f_durationSec)
                        return _durationSec;
                    _durationSec = (double) ((DurationSamples / SampleRate));
                    f_durationSec = true;
                    return _durationSec;
                }
            }
            private ushort _durationSamples;
            private byte _freqDiv;
            private CreativeVoiceFile m_root;
            private CreativeVoiceFile.Block m_parent;

            /// <summary>
            /// Duration of silence, in samples
            /// </summary>
            public ushort DurationSamples { get { return _durationSamples; } }

            /// <summary>
            /// Frequency divisor, used to determine sample rate
            /// </summary>
            public byte FreqDiv { get { return _freqDiv; } }
            public CreativeVoiceFile M_Root { get { return m_root; } }
            public CreativeVoiceFile.Block M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29">Source</a>
        /// </remarks>
        public partial class BlockSoundDataNew : KaitaiStruct
        {
            public static BlockSoundDataNew FromFile(string fileName)
            {
                return new BlockSoundDataNew(new KaitaiStream(fileName));
            }

            public BlockSoundDataNew(KaitaiStream p__io, CreativeVoiceFile.Block p__parent = null, CreativeVoiceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sampleRate = m_io.ReadU4le();
                _bitsPerSample = m_io.ReadU1();
                _numChannels = m_io.ReadU1();
                _codec = ((CreativeVoiceFile.Codecs) m_io.ReadU2le());
                _reserved = m_io.ReadBytes(4);
                _wave = m_io.ReadBytesFull();
            }
            private uint _sampleRate;
            private byte _bitsPerSample;
            private byte _numChannels;
            private Codecs _codec;
            private byte[] _reserved;
            private byte[] _wave;
            private CreativeVoiceFile m_root;
            private CreativeVoiceFile.Block m_parent;
            public uint SampleRate { get { return _sampleRate; } }
            public byte BitsPerSample { get { return _bitsPerSample; } }
            public byte NumChannels { get { return _numChannels; } }
            public Codecs Codec { get { return _codec; } }
            public byte[] Reserved { get { return _reserved; } }
            public byte[] Wave { get { return _wave; } }
            public CreativeVoiceFile M_Root { get { return m_root; } }
            public CreativeVoiceFile.Block M_Parent { get { return m_parent; } }
        }
        public partial class Block : KaitaiStruct
        {
            public static Block FromFile(string fileName)
            {
                return new Block(new KaitaiStream(fileName));
            }

            public Block(KaitaiStream p__io, CreativeVoiceFile p__parent = null, CreativeVoiceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_bodySize = false;
                _read();
            }
            private void _read()
            {
                _blockType = ((CreativeVoiceFile.BlockTypes) m_io.ReadU1());
                if (BlockType != CreativeVoiceFile.BlockTypes.Terminator) {
                    _bodySize1 = m_io.ReadU2le();
                }
                if (BlockType != CreativeVoiceFile.BlockTypes.Terminator) {
                    _bodySize2 = m_io.ReadU1();
                }
                if (BlockType != CreativeVoiceFile.BlockTypes.Terminator) {
                    switch (BlockType) {
                    case CreativeVoiceFile.BlockTypes.SoundDataNew: {
                        __raw_body = m_io.ReadBytes(BodySize);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new BlockSoundDataNew(io___raw_body, this, m_root);
                        break;
                    }
                    case CreativeVoiceFile.BlockTypes.RepeatStart: {
                        __raw_body = m_io.ReadBytes(BodySize);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new BlockRepeatStart(io___raw_body, this, m_root);
                        break;
                    }
                    case CreativeVoiceFile.BlockTypes.Marker: {
                        __raw_body = m_io.ReadBytes(BodySize);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new BlockMarker(io___raw_body, this, m_root);
                        break;
                    }
                    case CreativeVoiceFile.BlockTypes.SoundData: {
                        __raw_body = m_io.ReadBytes(BodySize);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new BlockSoundData(io___raw_body, this, m_root);
                        break;
                    }
                    case CreativeVoiceFile.BlockTypes.ExtraInfo: {
                        __raw_body = m_io.ReadBytes(BodySize);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new BlockExtraInfo(io___raw_body, this, m_root);
                        break;
                    }
                    case CreativeVoiceFile.BlockTypes.Silence: {
                        __raw_body = m_io.ReadBytes(BodySize);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new BlockSilence(io___raw_body, this, m_root);
                        break;
                    }
                    default: {
                        _body = m_io.ReadBytes(BodySize);
                        break;
                    }
                    }
                }
            }
            private bool f_bodySize;
            private int? _bodySize;

            /// <summary>
            /// body_size is a 24-bit little-endian integer, so we're
            /// emulating that by adding two standard-sized integers
            /// (body_size1 and body_size2).
            /// </summary>
            public int? BodySize
            {
                get
                {
                    if (f_bodySize)
                        return _bodySize;
                    if (BlockType != CreativeVoiceFile.BlockTypes.Terminator) {
                        _bodySize = (int) ((BodySize1 + (BodySize2 << 16)));
                    }
                    f_bodySize = true;
                    return _bodySize;
                }
            }
            private BlockTypes _blockType;
            private ushort? _bodySize1;
            private byte? _bodySize2;
            private object _body;
            private CreativeVoiceFile m_root;
            private CreativeVoiceFile m_parent;
            private byte[] __raw_body;

            /// <summary>
            /// Byte that determines type of block content
            /// </summary>
            public BlockTypes BlockType { get { return _blockType; } }
            public ushort? BodySize1 { get { return _bodySize1; } }
            public byte? BodySize2 { get { return _bodySize2; } }

            /// <summary>
            /// Block body, type depends on block type byte
            /// </summary>
            public object Body { get { return _body; } }
            public CreativeVoiceFile M_Root { get { return m_root; } }
            public CreativeVoiceFile M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start">Source</a>
        /// </remarks>
        public partial class BlockRepeatStart : KaitaiStruct
        {
            public static BlockRepeatStart FromFile(string fileName)
            {
                return new BlockRepeatStart(new KaitaiStream(fileName));
            }

            public BlockRepeatStart(KaitaiStream p__io, CreativeVoiceFile.Block p__parent = null, CreativeVoiceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _repeatCount1 = m_io.ReadU2le();
            }
            private ushort _repeatCount1;
            private CreativeVoiceFile m_root;
            private CreativeVoiceFile.Block m_parent;

            /// <summary>
            /// Number of repetitions minus 1; 0xffff means infinite repetitions
            /// </summary>
            public ushort RepeatCount1 { get { return _repeatCount1; } }
            public CreativeVoiceFile M_Root { get { return m_root; } }
            public CreativeVoiceFile.Block M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data">Source</a>
        /// </remarks>
        public partial class BlockSoundData : KaitaiStruct
        {
            public static BlockSoundData FromFile(string fileName)
            {
                return new BlockSoundData(new KaitaiStream(fileName));
            }

            public BlockSoundData(KaitaiStream p__io, CreativeVoiceFile.Block p__parent = null, CreativeVoiceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_sampleRate = false;
                _read();
            }
            private void _read()
            {
                _freqDiv = m_io.ReadU1();
                _codec = ((CreativeVoiceFile.Codecs) m_io.ReadU1());
                _wave = m_io.ReadBytesFull();
            }
            private bool f_sampleRate;
            private double _sampleRate;
            public double SampleRate
            {
                get
                {
                    if (f_sampleRate)
                        return _sampleRate;
                    _sampleRate = (double) ((1000000.0 / (256 - FreqDiv)));
                    f_sampleRate = true;
                    return _sampleRate;
                }
            }
            private byte _freqDiv;
            private Codecs _codec;
            private byte[] _wave;
            private CreativeVoiceFile m_root;
            private CreativeVoiceFile.Block m_parent;

            /// <summary>
            /// Frequency divisor, used to determine sample rate
            /// </summary>
            public byte FreqDiv { get { return _freqDiv; } }
            public Codecs Codec { get { return _codec; } }
            public byte[] Wave { get { return _wave; } }
            public CreativeVoiceFile M_Root { get { return m_root; } }
            public CreativeVoiceFile.Block M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info">Source</a>
        /// </remarks>
        public partial class BlockExtraInfo : KaitaiStruct
        {
            public static BlockExtraInfo FromFile(string fileName)
            {
                return new BlockExtraInfo(new KaitaiStream(fileName));
            }

            public BlockExtraInfo(KaitaiStream p__io, CreativeVoiceFile.Block p__parent = null, CreativeVoiceFile p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numChannels = false;
                f_sampleRate = false;
                _read();
            }
            private void _read()
            {
                _freqDiv = m_io.ReadU2le();
                _codec = ((CreativeVoiceFile.Codecs) m_io.ReadU1());
                _numChannels1 = m_io.ReadU1();
            }
            private bool f_numChannels;
            private int _numChannels;

            /// <summary>
            /// Number of channels (1 = mono, 2 = stereo)
            /// </summary>
            public int NumChannels
            {
                get
                {
                    if (f_numChannels)
                        return _numChannels;
                    _numChannels = (int) ((NumChannels1 + 1));
                    f_numChannels = true;
                    return _numChannels;
                }
            }
            private bool f_sampleRate;
            private double _sampleRate;
            public double SampleRate
            {
                get
                {
                    if (f_sampleRate)
                        return _sampleRate;
                    _sampleRate = (double) ((256000000.0 / (NumChannels * (65536 - FreqDiv))));
                    f_sampleRate = true;
                    return _sampleRate;
                }
            }
            private ushort _freqDiv;
            private Codecs _codec;
            private byte _numChannels1;
            private CreativeVoiceFile m_root;
            private CreativeVoiceFile.Block m_parent;

            /// <summary>
            /// Frequency divisor
            /// </summary>
            public ushort FreqDiv { get { return _freqDiv; } }
            public Codecs Codec { get { return _codec; } }

            /// <summary>
            /// Number of channels minus 1 (0 = mono, 1 = stereo)
            /// </summary>
            public byte NumChannels1 { get { return _numChannels1; } }
            public CreativeVoiceFile M_Root { get { return m_root; } }
            public CreativeVoiceFile.Block M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private ushort _headerSize;
        private ushort _version;
        private ushort _checksum;
        private List<Block> _blocks;
        private CreativeVoiceFile m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// Total size of this main header (usually 0x001A)
        /// </summary>
        public ushort HeaderSize { get { return _headerSize; } }
        public ushort Version { get { return _version; } }

        /// <summary>
        /// Checksum: this must be equal to ~version + 0x1234
        /// </summary>
        public ushort Checksum { get { return _checksum; } }

        /// <summary>
        /// Series of blocks that contain the actual audio data
        /// </summary>
        public List<Block> Blocks { get { return _blocks; } }
        public CreativeVoiceFile M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
