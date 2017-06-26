// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Scream Tracker 3 module is a tracker music file format that, as all
    /// tracker music, bundles both sound samples and instructions on which
    /// notes to play. It originates from a Scream Tracker 3 music editor
    /// (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
    /// module format.
    /// 
    /// Instrument descriptions in S3M format allow to use either digital
    /// samples or setup and control AdLib (OPL2) synth.
    /// 
    /// Music is organized in so called `patterns`. &quot;Pattern&quot; is a generally
    /// a 64-row long table, which instructs which notes to play on which
    /// time measure. &quot;Patterns&quot; are played one-by-one in a sequence
    /// determined by `orders`, which is essentially an array of pattern IDs
    /// - this way it's possible to reuse certain patterns more than once
    /// for repetitive musical phrases.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://hackipedia.org/File%20formats/Music/Sample%20based/text/Scream%20Tracker%203.20%20file%20format.cp437.txt.utf-8.txt">Source</a>
    /// </remarks>
    public partial class S3m : KaitaiStruct
    {
        public static S3m FromFile(string fileName)
        {
            return new S3m(new KaitaiStream(fileName));
        }

        public S3m(KaitaiStream io, KaitaiStruct parent = null, S3m root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _songName = KaitaiStream.BytesTerminate(m_io.ReadBytes(28), 0, false);
            _magic1 = m_io.EnsureFixedContents(new byte[] { 26 });
            _fileType = m_io.ReadU1();
            _reserved1 = m_io.ReadBytes(2);
            _numOrders = m_io.ReadU2le();
            _numInstruments = m_io.ReadU2le();
            _numPatterns = m_io.ReadU2le();
            _flags = m_io.ReadU2le();
            _version = m_io.ReadU2le();
            _samplesFormat = m_io.ReadU2le();
            _magic2 = m_io.EnsureFixedContents(new byte[] { 83, 67, 82, 77 });
            _globalVolume = m_io.ReadU1();
            _initialSpeed = m_io.ReadU1();
            _initialTempo = m_io.ReadU1();
            _isStereo = m_io.ReadBitsInt(1) != 0;
            _masterVolume = m_io.ReadBitsInt(7);
            m_io.AlignToByte();
            _ultraClickRemoval = m_io.ReadU1();
            _hasCustomPan = m_io.ReadU1();
            _reserved2 = m_io.ReadBytes(8);
            _ofsSpecial = m_io.ReadU2le();
            _channels = new List<Channel>((int) (32));
            for (var i = 0; i < 32; i++) {
                _channels.Add(new Channel(m_io, this, m_root));
            }
            _orders = m_io.ReadBytes(NumOrders);
            _instruments = new List<InstrumentPtr>((int) (NumInstruments));
            for (var i = 0; i < NumInstruments; i++) {
                _instruments.Add(new InstrumentPtr(m_io, this, m_root));
            }
            _patterns = new List<PatternPtr>((int) (NumPatterns));
            for (var i = 0; i < NumPatterns; i++) {
                _patterns.Add(new PatternPtr(m_io, this, m_root));
            }
            if (HasCustomPan == 252) {
                _channelPans = new List<ChannelPan>((int) (32));
                for (var i = 0; i < 32; i++) {
                    _channelPans.Add(new ChannelPan(m_io, this, m_root));
                }
            }
            }
        public partial class ChannelPan : KaitaiStruct
        {
            public static ChannelPan FromFile(string fileName)
            {
                return new ChannelPan(new KaitaiStream(fileName));
            }

            public ChannelPan(KaitaiStream io, S3m parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _reserved1 = m_io.ReadBitsInt(2);
                _hasCustomPan = m_io.ReadBitsInt(1) != 0;
                _reserved2 = m_io.ReadBitsInt(1) != 0;
                _pan = m_io.ReadBitsInt(4);
                }
            private ulong _reserved1;
            private bool _hasCustomPan;
            private bool _reserved2;
            private ulong _pan;
            private S3m m_root;
            private S3m m_parent;
            public ulong Reserved1 { get { return _reserved1; } }

            /// <summary>
            /// If true, then use a custom pan setting provided in the `pan`
            /// field. If false, the channel would use the default setting
            /// (0x7 for mono, 0x3 or 0xc for stereo).
            /// </summary>
            public bool HasCustomPan { get { return _hasCustomPan; } }
            public bool Reserved2 { get { return _reserved2; } }
            public ulong Pan { get { return _pan; } }
            public S3m M_Root { get { return m_root; } }
            public S3m M_Parent { get { return m_parent; } }
        }
        public partial class PatternCell : KaitaiStruct
        {
            public static PatternCell FromFile(string fileName)
            {
                return new PatternCell(new KaitaiStream(fileName));
            }

            public PatternCell(KaitaiStream io, S3m.PatternCells parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _hasFx = m_io.ReadBitsInt(1) != 0;
                _hasVolume = m_io.ReadBitsInt(1) != 0;
                _hasNoteAndInstrument = m_io.ReadBitsInt(1) != 0;
                _channelNum = m_io.ReadBitsInt(5);
                m_io.AlignToByte();
                if (HasNoteAndInstrument) {
                    _note = m_io.ReadU1();
                }
                if (HasNoteAndInstrument) {
                    _instrument = m_io.ReadU1();
                }
                if (HasVolume) {
                    _volume = m_io.ReadU1();
                }
                if (HasFx) {
                    _fxType = m_io.ReadU1();
                }
                if (HasFx) {
                    _fxValue = m_io.ReadU1();
                }
                }
            private bool _hasFx;
            private bool _hasVolume;
            private bool _hasNoteAndInstrument;
            private ulong _channelNum;
            private byte _note;
            private byte _instrument;
            private byte _volume;
            private byte _fxType;
            private byte _fxValue;
            private S3m m_root;
            private S3m.PatternCells m_parent;
            public bool HasFx { get { return _hasFx; } }
            public bool HasVolume { get { return _hasVolume; } }
            public bool HasNoteAndInstrument { get { return _hasNoteAndInstrument; } }
            public ulong ChannelNum { get { return _channelNum; } }
            public byte Note { get { return _note; } }
            public byte Instrument { get { return _instrument; } }
            public byte Volume { get { return _volume; } }
            public byte FxType { get { return _fxType; } }
            public byte FxValue { get { return _fxValue; } }
            public S3m M_Root { get { return m_root; } }
            public S3m.PatternCells M_Parent { get { return m_parent; } }
        }
        public partial class PatternCells : KaitaiStruct
        {
            public static PatternCells FromFile(string fileName)
            {
                return new PatternCells(new KaitaiStream(fileName));
            }

            public PatternCells(KaitaiStream io, S3m.Pattern parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _cells = new List<PatternCell>();
                while (!m_io.IsEof) {
                    _cells.Add(new PatternCell(m_io, this, m_root));
                }
                }
            private List<PatternCell> _cells;
            private S3m m_root;
            private S3m.Pattern m_parent;
            public List<PatternCell> Cells { get { return _cells; } }
            public S3m M_Root { get { return m_root; } }
            public S3m.Pattern M_Parent { get { return m_parent; } }
        }
        public partial class Channel : KaitaiStruct
        {
            public static Channel FromFile(string fileName)
            {
                return new Channel(new KaitaiStream(fileName));
            }

            public Channel(KaitaiStream io, S3m parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _isDisabled = m_io.ReadBitsInt(1) != 0;
                _chType = m_io.ReadBitsInt(7);
                }
            private bool _isDisabled;
            private ulong _chType;
            private S3m m_root;
            private S3m m_parent;
            public bool IsDisabled { get { return _isDisabled; } }

            /// <summary>
            /// Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
            /// </summary>
            public ulong ChType { get { return _chType; } }
            public S3m M_Root { get { return m_root; } }
            public S3m M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Custom 3-byte integer, stored in mixed endian manner.
        /// </summary>
        public partial class SwappedU3 : KaitaiStruct
        {
            public static SwappedU3 FromFile(string fileName)
            {
                return new SwappedU3(new KaitaiStream(fileName));
            }

            public SwappedU3(KaitaiStream io, S3m.Instrument.Sampled parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_value = false;
                _read();
            }
            private void _read() {
                _hi = m_io.ReadU1();
                _lo = m_io.ReadU2le();
                }
            private bool f_value;
            private int _value;
            public int Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    _value = (int) ((Lo | (Hi << 16)));
                    f_value = true;
                    return _value;
                }
            }
            private byte _hi;
            private ushort _lo;
            private S3m m_root;
            private S3m.Instrument.Sampled m_parent;
            public byte Hi { get { return _hi; } }
            public ushort Lo { get { return _lo; } }
            public S3m M_Root { get { return m_root; } }
            public S3m.Instrument.Sampled M_Parent { get { return m_parent; } }
        }
        public partial class Pattern : KaitaiStruct
        {
            public static Pattern FromFile(string fileName)
            {
                return new Pattern(new KaitaiStream(fileName));
            }

            public Pattern(KaitaiStream io, S3m.PatternPtr parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _size = m_io.ReadU2le();
                __raw_body = m_io.ReadBytes((Size - 2));
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new PatternCells(io___raw_body, this, m_root);
                }
            private ushort _size;
            private PatternCells _body;
            private S3m m_root;
            private S3m.PatternPtr m_parent;
            private byte[] __raw_body;
            public ushort Size { get { return _size; } }
            public PatternCells Body { get { return _body; } }
            public S3m M_Root { get { return m_root; } }
            public S3m.PatternPtr M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class PatternPtr : KaitaiStruct
        {
            public static PatternPtr FromFile(string fileName)
            {
                return new PatternPtr(new KaitaiStream(fileName));
            }

            public PatternPtr(KaitaiStream io, S3m parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_body = false;
                _read();
            }
            private void _read() {
                _paraptr = m_io.ReadU2le();
                }
            private bool f_body;
            private Pattern _body;
            public Pattern Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    long _pos = m_io.Pos;
                    m_io.Seek((Paraptr * 16));
                    _body = new Pattern(m_io, this, m_root);
                    m_io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private ushort _paraptr;
            private S3m m_root;
            private S3m m_parent;
            public ushort Paraptr { get { return _paraptr; } }
            public S3m M_Root { get { return m_root; } }
            public S3m M_Parent { get { return m_parent; } }
        }
        public partial class InstrumentPtr : KaitaiStruct
        {
            public static InstrumentPtr FromFile(string fileName)
            {
                return new InstrumentPtr(new KaitaiStream(fileName));
            }

            public InstrumentPtr(KaitaiStream io, S3m parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_body = false;
                _read();
            }
            private void _read() {
                _paraptr = m_io.ReadU2le();
                }
            private bool f_body;
            private Instrument _body;
            public Instrument Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    long _pos = m_io.Pos;
                    m_io.Seek((Paraptr * 16));
                    _body = new Instrument(m_io, this, m_root);
                    m_io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private ushort _paraptr;
            private S3m m_root;
            private S3m m_parent;
            public ushort Paraptr { get { return _paraptr; } }
            public S3m M_Root { get { return m_root; } }
            public S3m M_Parent { get { return m_parent; } }
        }
        public partial class Instrument : KaitaiStruct
        {
            public static Instrument FromFile(string fileName)
            {
                return new Instrument(new KaitaiStream(fileName));
            }

            public enum InstTypes
            {
                Sample = 1,
                Melodic = 2,
                BassDrum = 3,
                SnareDrum = 4,
                Tom = 5,
                Cymbal = 6,
                Hihat = 7,
            }

            public Instrument(KaitaiStream io, S3m.InstrumentPtr parent = null, S3m root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _type = ((InstTypes) m_io.ReadU1());
                _filename = KaitaiStream.BytesTerminate(m_io.ReadBytes(12), 0, false);
                switch (Type) {
                case InstTypes.Sample: {
                    _body = new Sampled(m_io, this, m_root);
                    break;
                }
                default: {
                    _body = new Adlib(m_io, this, m_root);
                    break;
                }
                }
                _tuningHz = m_io.ReadU4le();
                _reserved2 = m_io.ReadBytes(12);
                _sampleName = KaitaiStream.BytesTerminate(m_io.ReadBytes(28), 0, false);
                _magic = m_io.EnsureFixedContents(new byte[] { 83, 67, 82, 83 });
                }
            public partial class Sampled : KaitaiStruct
            {
                public static Sampled FromFile(string fileName)
                {
                    return new Sampled(new KaitaiStream(fileName));
                }

                public Sampled(KaitaiStream io, S3m.Instrument parent = null, S3m root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    f_sample = false;
                    _read();
                }
                private void _read() {
                    _paraptrSample = new SwappedU3(m_io, this, m_root);
                    _lenSample = m_io.ReadU4le();
                    _loopBegin = m_io.ReadU4le();
                    _loopEnd = m_io.ReadU4le();
                    _defaultVolume = m_io.ReadU1();
                    _reserved1 = m_io.ReadU1();
                    _isPacked = m_io.ReadU1();
                    _flags = m_io.ReadU1();
                    }
                private bool f_sample;
                private byte[] _sample;
                public byte[] Sample
                {
                    get
                    {
                        if (f_sample)
                            return _sample;
                        long _pos = m_io.Pos;
                        m_io.Seek((ParaptrSample.Value * 16));
                        _sample = m_io.ReadBytes(LenSample);
                        m_io.Seek(_pos);
                        f_sample = true;
                        return _sample;
                    }
                }
                private SwappedU3 _paraptrSample;
                private uint _lenSample;
                private uint _loopBegin;
                private uint _loopEnd;
                private byte _defaultVolume;
                private byte _reserved1;
                private byte _isPacked;
                private byte _flags;
                private S3m m_root;
                private S3m.Instrument m_parent;
                public SwappedU3 ParaptrSample { get { return _paraptrSample; } }
                public uint LenSample { get { return _lenSample; } }
                public uint LoopBegin { get { return _loopBegin; } }
                public uint LoopEnd { get { return _loopEnd; } }

                /// <summary>
                /// Default volume
                /// </summary>
                public byte DefaultVolume { get { return _defaultVolume; } }
                public byte Reserved1 { get { return _reserved1; } }

                /// <summary>
                /// 0 = unpacked, 1 = DP30ADPCM packing
                /// </summary>
                public byte IsPacked { get { return _isPacked; } }
                public byte Flags { get { return _flags; } }
                public S3m M_Root { get { return m_root; } }
                public S3m.Instrument M_Parent { get { return m_parent; } }
            }
            public partial class Adlib : KaitaiStruct
            {
                public static Adlib FromFile(string fileName)
                {
                    return new Adlib(new KaitaiStream(fileName));
                }

                public Adlib(KaitaiStream io, S3m.Instrument parent = null, S3m root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    _read();
                }
                private void _read() {
                    _reserved1 = m_io.EnsureFixedContents(new byte[] { 0, 0, 0 });
                    __unnamed1 = m_io.ReadBytes(16);
                    }
                private byte[] _reserved1;
                private byte[] __unnamed1;
                private S3m m_root;
                private S3m.Instrument m_parent;
                public byte[] Reserved1 { get { return _reserved1; } }
                public byte[] Unnamed_1 { get { return __unnamed1; } }
                public S3m M_Root { get { return m_root; } }
                public S3m.Instrument M_Parent { get { return m_parent; } }
            }
            private InstTypes _type;
            private byte[] _filename;
            private KaitaiStruct _body;
            private uint _tuningHz;
            private byte[] _reserved2;
            private byte[] _sampleName;
            private byte[] _magic;
            private S3m m_root;
            private S3m.InstrumentPtr m_parent;
            public InstTypes Type { get { return _type; } }
            public byte[] Filename { get { return _filename; } }
            public KaitaiStruct Body { get { return _body; } }
            public uint TuningHz { get { return _tuningHz; } }
            public byte[] Reserved2 { get { return _reserved2; } }
            public byte[] SampleName { get { return _sampleName; } }
            public byte[] Magic { get { return _magic; } }
            public S3m M_Root { get { return m_root; } }
            public S3m.InstrumentPtr M_Parent { get { return m_parent; } }
        }
        private byte[] _songName;
        private byte[] _magic1;
        private byte _fileType;
        private byte[] _reserved1;
        private ushort _numOrders;
        private ushort _numInstruments;
        private ushort _numPatterns;
        private ushort _flags;
        private ushort _version;
        private ushort _samplesFormat;
        private byte[] _magic2;
        private byte _globalVolume;
        private byte _initialSpeed;
        private byte _initialTempo;
        private bool _isStereo;
        private ulong _masterVolume;
        private byte _ultraClickRemoval;
        private byte _hasCustomPan;
        private byte[] _reserved2;
        private ushort _ofsSpecial;
        private List<Channel> _channels;
        private byte[] _orders;
        private List<InstrumentPtr> _instruments;
        private List<PatternPtr> _patterns;
        private List<ChannelPan> _channelPans;
        private S3m m_root;
        private KaitaiStruct m_parent;
        public byte[] SongName { get { return _songName; } }
        public byte[] Magic1 { get { return _magic1; } }
        public byte FileType { get { return _fileType; } }
        public byte[] Reserved1 { get { return _reserved1; } }

        /// <summary>
        /// Number of orders in a song
        /// </summary>
        public ushort NumOrders { get { return _numOrders; } }

        /// <summary>
        /// Number of instruments in a song
        /// </summary>
        public ushort NumInstruments { get { return _numInstruments; } }

        /// <summary>
        /// Number of patterns in a song
        /// </summary>
        public ushort NumPatterns { get { return _numPatterns; } }
        public ushort Flags { get { return _flags; } }

        /// <summary>
        /// Scream Tracker version that was used to save this file
        /// </summary>
        public ushort Version { get { return _version; } }

        /// <summary>
        /// 1 = signed samples, 2 = unsigned samples
        /// </summary>
        public ushort SamplesFormat { get { return _samplesFormat; } }
        public byte[] Magic2 { get { return _magic2; } }
        public byte GlobalVolume { get { return _globalVolume; } }
        public byte InitialSpeed { get { return _initialSpeed; } }
        public byte InitialTempo { get { return _initialTempo; } }
        public bool IsStereo { get { return _isStereo; } }
        public ulong MasterVolume { get { return _masterVolume; } }
        public byte UltraClickRemoval { get { return _ultraClickRemoval; } }
        public byte HasCustomPan { get { return _hasCustomPan; } }
        public byte[] Reserved2 { get { return _reserved2; } }

        /// <summary>
        /// Offset of special data, not used by Scream Tracker directly.
        /// </summary>
        public ushort OfsSpecial { get { return _ofsSpecial; } }
        public List<Channel> Channels { get { return _channels; } }
        public byte[] Orders { get { return _orders; } }
        public List<InstrumentPtr> Instruments { get { return _instruments; } }
        public List<PatternPtr> Patterns { get { return _patterns; } }
        public List<ChannelPan> ChannelPans { get { return _channelPans; } }
        public S3m M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
