// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// XM (standing for eXtended Module) is a popular module music file
    /// format, that was introduced in 1994 in FastTracker2 by Triton demo
    /// group. Akin to MOD files, it bundles both digital samples
    /// (instruments) and instructions on which note to play at what time
    /// (patterns), which provides good audio quality with relatively small
    /// file size. Audio is reproducible without relying on the sound of
    /// particular hardware samplers or synths.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
    /// ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
    /// ">Source</a>
    /// </remarks>
    public partial class FasttrackerXmModule : KaitaiStruct
    {
        public static FasttrackerXmModule FromFile(string fileName)
        {
            return new FasttrackerXmModule(new KaitaiStream(fileName));
        }

        public FasttrackerXmModule(KaitaiStream p__io, KaitaiStruct p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _preheader = new Preheader(m_io, this, m_root);
            __raw_header = m_io.ReadBytes((Preheader.HeaderSize - 4));
            var io___raw_header = new KaitaiStream(__raw_header);
            _header = new Header(io___raw_header, this, m_root);
            _patterns = new List<Pattern>((int) (Header.NumPatterns));
            for (var i = 0; i < Header.NumPatterns; i++)
            {
                _patterns.Add(new Pattern(m_io, this, m_root));
            }
            _instruments = new List<Instrument>((int) (Header.NumInstruments));
            for (var i = 0; i < Header.NumInstruments; i++)
            {
                _instruments.Add(new Instrument(m_io, this, m_root));
            }
        }
        public partial class Preheader : KaitaiStruct
        {
            public static Preheader FromFile(string fileName)
            {
                return new Preheader(new KaitaiStream(fileName));
            }

            public Preheader(KaitaiStream p__io, FasttrackerXmModule p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _signature0 = m_io.EnsureFixedContents(new byte[] { 69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32 });
                _moduleName = System.Text.Encoding.GetEncoding("utf-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(20), 0, false));
                _signature1 = m_io.EnsureFixedContents(new byte[] { 26 });
                _trackerName = System.Text.Encoding.GetEncoding("utf-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(20), 0, false));
                _versionNumber = new Version(m_io, this, m_root);
                _headerSize = m_io.ReadU4le();
            }
            public partial class Version : KaitaiStruct
            {
                public static Version FromFile(string fileName)
                {
                    return new Version(new KaitaiStream(fileName));
                }

                public Version(KaitaiStream p__io, FasttrackerXmModule.Preheader p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_value = false;
                    _read();
                }
                private void _read()
                {
                    _minor = m_io.ReadU1();
                    _major = m_io.ReadU1();
                }
                private bool f_value;
                private int _value;
                public int Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        _value = (int) (((Major << 8) | Minor));
                        f_value = true;
                        return _value;
                    }
                }
                private byte _minor;
                private byte _major;
                private FasttrackerXmModule m_root;
                private FasttrackerXmModule.Preheader m_parent;

                /// <summary>
                /// currently 0x04
                /// </summary>
                public byte Minor { get { return _minor; } }

                /// <summary>
                /// currently 0x01
                /// </summary>
                public byte Major { get { return _major; } }
                public FasttrackerXmModule M_Root { get { return m_root; } }
                public FasttrackerXmModule.Preheader M_Parent { get { return m_parent; } }
            }
            private byte[] _signature0;
            private string _moduleName;
            private byte[] _signature1;
            private string _trackerName;
            private Version _versionNumber;
            private uint _headerSize;
            private FasttrackerXmModule m_root;
            private FasttrackerXmModule m_parent;
            public byte[] Signature0 { get { return _signature0; } }

            /// <summary>
            /// Module name, padded with zeroes
            /// </summary>
            public string ModuleName { get { return _moduleName; } }
            public byte[] Signature1 { get { return _signature1; } }

            /// <summary>
            /// Tracker name
            /// </summary>
            public string TrackerName { get { return _trackerName; } }

            /// <summary>
            /// Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
            /// </summary>
            public Version VersionNumber { get { return _versionNumber; } }

            /// <summary>
            /// Header size &lt;&lt; Calculated FROM THIS OFFSET, not from the beginning of the file! &gt;&gt;
            /// </summary>
            public uint HeaderSize { get { return _headerSize; } }
            public FasttrackerXmModule M_Root { get { return m_root; } }
            public FasttrackerXmModule M_Parent { get { return m_parent; } }
        }
        public partial class Pattern : KaitaiStruct
        {
            public static Pattern FromFile(string fileName)
            {
                return new Pattern(new KaitaiStream(fileName));
            }

            public Pattern(KaitaiStream p__io, FasttrackerXmModule p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new Header(m_io, this, m_root);
                _packedData = m_io.ReadBytes(Header.Main.LenPackedPattern);
            }
            public partial class Header : KaitaiStruct
            {
                public static Header FromFile(string fileName)
                {
                    return new Header(new KaitaiStream(fileName));
                }

                public Header(KaitaiStream p__io, FasttrackerXmModule.Pattern p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _headerLength = m_io.ReadU4le();
                    __raw_main = m_io.ReadBytes((HeaderLength - 4));
                    var io___raw_main = new KaitaiStream(__raw_main);
                    _main = new HeaderMain(io___raw_main, this, m_root);
                }
                public partial class HeaderMain : KaitaiStruct
                {
                    public static HeaderMain FromFile(string fileName)
                    {
                        return new HeaderMain(new KaitaiStream(fileName));
                    }

                    public HeaderMain(KaitaiStream p__io, FasttrackerXmModule.Pattern.Header p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_numRows = false;
                        _read();
                    }
                    private void _read()
                    {
                        _packingType = m_io.ReadU1();
                        switch (M_Root.Preheader.VersionNumber.Value) {
                        case 258: {
                            _numRowsRaw = m_io.ReadU1();
                            break;
                        }
                        default: {
                            _numRowsRaw = m_io.ReadU2le();
                            break;
                        }
                        }
                        _lenPackedPattern = m_io.ReadU2le();
                    }
                    private bool f_numRows;
                    private int _numRows;
                    public int NumRows
                    {
                        get
                        {
                            if (f_numRows)
                                return _numRows;
                            _numRows = (int) ((NumRowsRaw + (M_Root.Preheader.VersionNumber.Value == 258 ? 1 : 0)));
                            f_numRows = true;
                            return _numRows;
                        }
                    }
                    private byte _packingType;
                    private ushort _numRowsRaw;
                    private ushort _lenPackedPattern;
                    private FasttrackerXmModule m_root;
                    private FasttrackerXmModule.Pattern.Header m_parent;

                    /// <summary>
                    /// Packing type (always 0)
                    /// </summary>
                    public byte PackingType { get { return _packingType; } }

                    /// <summary>
                    /// Number of rows in pattern (1..256)
                    /// </summary>
                    public ushort NumRowsRaw { get { return _numRowsRaw; } }

                    /// <summary>
                    /// Packed pattern data size
                    /// </summary>
                    public ushort LenPackedPattern { get { return _lenPackedPattern; } }
                    public FasttrackerXmModule M_Root { get { return m_root; } }
                    public FasttrackerXmModule.Pattern.Header M_Parent { get { return m_parent; } }
                }
                private uint _headerLength;
                private HeaderMain _main;
                private FasttrackerXmModule m_root;
                private FasttrackerXmModule.Pattern m_parent;
                private byte[] __raw_main;

                /// <summary>
                /// Pattern header length
                /// </summary>
                public uint HeaderLength { get { return _headerLength; } }
                public HeaderMain Main { get { return _main; } }
                public FasttrackerXmModule M_Root { get { return m_root; } }
                public FasttrackerXmModule.Pattern M_Parent { get { return m_parent; } }
                public byte[] M_RawMain { get { return __raw_main; } }
            }
            private Header _header;
            private byte[] _packedData;
            private FasttrackerXmModule m_root;
            private FasttrackerXmModule m_parent;
            public Header Header { get { return _header; } }
            public byte[] PackedData { get { return _packedData; } }
            public FasttrackerXmModule M_Root { get { return m_root; } }
            public FasttrackerXmModule M_Parent { get { return m_parent; } }
        }
        public partial class Flags : KaitaiStruct
        {
            public static Flags FromFile(string fileName)
            {
                return new Flags(new KaitaiStream(fileName));
            }

            public Flags(KaitaiStream p__io, FasttrackerXmModule.Header p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved = m_io.ReadBitsInt(15);
                _freqTableType = m_io.ReadBitsInt(1) != 0;
            }
            private ulong _reserved;
            private bool _freqTableType;
            private FasttrackerXmModule m_root;
            private FasttrackerXmModule.Header m_parent;
            public ulong Reserved { get { return _reserved; } }

            /// <summary>
            /// 0 = Amiga frequency table (see below); 1 = Linear frequency table
            /// </summary>
            public bool FreqTableType { get { return _freqTableType; } }
            public FasttrackerXmModule M_Root { get { return m_root; } }
            public FasttrackerXmModule.Header M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, FasttrackerXmModule p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _songLength = m_io.ReadU2le();
                _restartPosition = m_io.ReadU2le();
                _numChannels = m_io.ReadU2le();
                _numPatterns = m_io.ReadU2le();
                _numInstruments = m_io.ReadU2le();
                _flags = new Flags(m_io, this, m_root);
                _defaultTempo = m_io.ReadU2le();
                _defaultBpm = m_io.ReadU2le();
                _patternOrderTable = new List<byte>((int) (256));
                for (var i = 0; i < 256; i++)
                {
                    _patternOrderTable.Add(m_io.ReadU1());
                }
            }
            private ushort _songLength;
            private ushort _restartPosition;
            private ushort _numChannels;
            private ushort _numPatterns;
            private ushort _numInstruments;
            private Flags _flags;
            private ushort _defaultTempo;
            private ushort _defaultBpm;
            private List<byte> _patternOrderTable;
            private FasttrackerXmModule m_root;
            private FasttrackerXmModule m_parent;

            /// <summary>
            /// Song length (in pattern order table)
            /// </summary>
            public ushort SongLength { get { return _songLength; } }
            public ushort RestartPosition { get { return _restartPosition; } }

            /// <summary>
            /// (2,4,6,8,10,...,32)
            /// </summary>
            public ushort NumChannels { get { return _numChannels; } }

            /// <summary>
            /// (max 256)
            /// </summary>
            public ushort NumPatterns { get { return _numPatterns; } }

            /// <summary>
            /// (max 128)
            /// </summary>
            public ushort NumInstruments { get { return _numInstruments; } }
            public Flags Flags { get { return _flags; } }
            public ushort DefaultTempo { get { return _defaultTempo; } }
            public ushort DefaultBpm { get { return _defaultBpm; } }

            /// <summary>
            /// max 256
            /// </summary>
            public List<byte> PatternOrderTable { get { return _patternOrderTable; } }
            public FasttrackerXmModule M_Root { get { return m_root; } }
            public FasttrackerXmModule M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// XM's notion of &quot;instrument&quot; typically constitutes of a
        /// instrument metadata and one or several samples. Metadata
        /// includes:
        /// 
        /// * instrument's name
        /// * instruction of which sample to use for which note
        /// * volume and panning envelopes and looping instructions
        /// * vibrato settings
        /// </summary>
        public partial class Instrument : KaitaiStruct
        {
            public static Instrument FromFile(string fileName)
            {
                return new Instrument(new KaitaiStream(fileName));
            }

            public Instrument(KaitaiStream p__io, FasttrackerXmModule p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _headerSize = m_io.ReadU4le();
                __raw_header = m_io.ReadBytes((HeaderSize - 4));
                var io___raw_header = new KaitaiStream(__raw_header);
                _header = new Header(io___raw_header, this, m_root);
                _samplesHeaders = new List<SampleHeader>((int) (Header.NumSamples));
                for (var i = 0; i < Header.NumSamples; i++)
                {
                    _samplesHeaders.Add(new SampleHeader(m_io, this, m_root));
                }
                _samples = new List<SamplesData>((int) (Header.NumSamples));
                for (var i = 0; i < Header.NumSamples; i++)
                {
                    _samples.Add(new SamplesData(SamplesHeaders[i], m_io, this, m_root));
                }
            }
            public partial class Header : KaitaiStruct
            {
                public static Header FromFile(string fileName)
                {
                    return new Header(new KaitaiStream(fileName));
                }

                public Header(KaitaiStream p__io, FasttrackerXmModule.Instrument p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _name = System.Text.Encoding.GetEncoding("utf-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(22), 0, false));
                    _type = m_io.ReadU1();
                    _numSamples = m_io.ReadU2le();
                    if (NumSamples > 0) {
                        _extraHeader = new ExtraHeader(m_io, this, m_root);
                    }
                }
                private string _name;
                private byte _type;
                private ushort _numSamples;
                private ExtraHeader _extraHeader;
                private FasttrackerXmModule m_root;
                private FasttrackerXmModule.Instrument m_parent;
                public string Name { get { return _name; } }

                /// <summary>
                /// Usually zero, but this seems pretty random, don't assume it's zero
                /// </summary>
                public byte Type { get { return _type; } }
                public ushort NumSamples { get { return _numSamples; } }
                public ExtraHeader ExtraHeader { get { return _extraHeader; } }
                public FasttrackerXmModule M_Root { get { return m_root; } }
                public FasttrackerXmModule.Instrument M_Parent { get { return m_parent; } }
            }
            public partial class ExtraHeader : KaitaiStruct
            {
                public static ExtraHeader FromFile(string fileName)
                {
                    return new ExtraHeader(new KaitaiStream(fileName));
                }


                public enum Type
                {
                    True = 0,
                    Sustain = 1,
                    Loop = 2,
                }
                public ExtraHeader(KaitaiStream p__io, FasttrackerXmModule.Instrument.Header p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _lenSampleHeader = m_io.ReadU4le();
                    _idxSamplePerNote = new List<byte>((int) (96));
                    for (var i = 0; i < 96; i++)
                    {
                        _idxSamplePerNote.Add(m_io.ReadU1());
                    }
                    _volumePoints = new List<EnvelopePoint>((int) (12));
                    for (var i = 0; i < 12; i++)
                    {
                        _volumePoints.Add(new EnvelopePoint(m_io, this, m_root));
                    }
                    _panningPoints = new List<EnvelopePoint>((int) (12));
                    for (var i = 0; i < 12; i++)
                    {
                        _panningPoints.Add(new EnvelopePoint(m_io, this, m_root));
                    }
                    _numVolumePoints = m_io.ReadU1();
                    _numPanningPoints = m_io.ReadU1();
                    _volumeSustainPoint = m_io.ReadU1();
                    _volumeLoopStartPoint = m_io.ReadU1();
                    _volumeLoopEndPoint = m_io.ReadU1();
                    _panningSustainPoint = m_io.ReadU1();
                    _panningLoopStartPoint = m_io.ReadU1();
                    _panningLoopEndPoint = m_io.ReadU1();
                    _volumeType = ((Type) m_io.ReadU1());
                    _panningType = ((Type) m_io.ReadU1());
                    _vibratoType = m_io.ReadU1();
                    _vibratoSweep = m_io.ReadU1();
                    _vibratoDepth = m_io.ReadU1();
                    _vibratoRate = m_io.ReadU1();
                    _volumeFadeout = m_io.ReadU2le();
                    _reserved = m_io.ReadU2le();
                }

                /// <summary>
                /// Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
                /// BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
                /// Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
                /// !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
                /// Of course it does not help if all instruments have the values inside FT2 supported range.
                /// The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
                /// </summary>
                public partial class EnvelopePoint : KaitaiStruct
                {
                    public static EnvelopePoint FromFile(string fileName)
                    {
                        return new EnvelopePoint(new KaitaiStream(fileName));
                    }

                    public EnvelopePoint(KaitaiStream p__io, FasttrackerXmModule.Instrument.ExtraHeader p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _x = m_io.ReadU2le();
                        _y = m_io.ReadU2le();
                    }
                    private ushort _x;
                    private ushort _y;
                    private FasttrackerXmModule m_root;
                    private FasttrackerXmModule.Instrument.ExtraHeader m_parent;

                    /// <summary>
                    /// Frame number of the point
                    /// </summary>
                    public ushort X { get { return _x; } }

                    /// <summary>
                    /// Value of the point
                    /// </summary>
                    public ushort Y { get { return _y; } }
                    public FasttrackerXmModule M_Root { get { return m_root; } }
                    public FasttrackerXmModule.Instrument.ExtraHeader M_Parent { get { return m_parent; } }
                }
                private uint _lenSampleHeader;
                private List<byte> _idxSamplePerNote;
                private List<EnvelopePoint> _volumePoints;
                private List<EnvelopePoint> _panningPoints;
                private byte _numVolumePoints;
                private byte _numPanningPoints;
                private byte _volumeSustainPoint;
                private byte _volumeLoopStartPoint;
                private byte _volumeLoopEndPoint;
                private byte _panningSustainPoint;
                private byte _panningLoopStartPoint;
                private byte _panningLoopEndPoint;
                private Type _volumeType;
                private Type _panningType;
                private byte _vibratoType;
                private byte _vibratoSweep;
                private byte _vibratoDepth;
                private byte _vibratoRate;
                private ushort _volumeFadeout;
                private ushort _reserved;
                private FasttrackerXmModule m_root;
                private FasttrackerXmModule.Instrument.Header m_parent;
                public uint LenSampleHeader { get { return _lenSampleHeader; } }

                /// <summary>
                /// Index of sample that should be used for any particular
                /// note. In the simplest case, where it's only one sample
                /// is available, it's an array of full of zeroes.
                /// </summary>
                public List<byte> IdxSamplePerNote { get { return _idxSamplePerNote; } }

                /// <summary>
                /// Points for volume envelope. Only `num_volume_points` will be actually used.
                /// </summary>
                public List<EnvelopePoint> VolumePoints { get { return _volumePoints; } }

                /// <summary>
                /// Points for panning envelope. Only `num_panning_points` will be actually used.
                /// </summary>
                public List<EnvelopePoint> PanningPoints { get { return _panningPoints; } }
                public byte NumVolumePoints { get { return _numVolumePoints; } }
                public byte NumPanningPoints { get { return _numPanningPoints; } }
                public byte VolumeSustainPoint { get { return _volumeSustainPoint; } }
                public byte VolumeLoopStartPoint { get { return _volumeLoopStartPoint; } }
                public byte VolumeLoopEndPoint { get { return _volumeLoopEndPoint; } }
                public byte PanningSustainPoint { get { return _panningSustainPoint; } }
                public byte PanningLoopStartPoint { get { return _panningLoopStartPoint; } }
                public byte PanningLoopEndPoint { get { return _panningLoopEndPoint; } }
                public Type VolumeType { get { return _volumeType; } }
                public Type PanningType { get { return _panningType; } }
                public byte VibratoType { get { return _vibratoType; } }
                public byte VibratoSweep { get { return _vibratoSweep; } }
                public byte VibratoDepth { get { return _vibratoDepth; } }
                public byte VibratoRate { get { return _vibratoRate; } }
                public ushort VolumeFadeout { get { return _volumeFadeout; } }
                public ushort Reserved { get { return _reserved; } }
                public FasttrackerXmModule M_Root { get { return m_root; } }
                public FasttrackerXmModule.Instrument.Header M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
            /// Pseudocode for converting the delta-coded data to normal data,
            /// old = 0;
            /// for i in range(data_len):
            ///   new = sample[i] + old;
            ///   sample[i] = new;
            ///   old = new;
            /// </summary>
            public partial class SamplesData : KaitaiStruct
            {
                public SamplesData(SampleHeader p_header, KaitaiStream p__io, FasttrackerXmModule.Instrument p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _header = p_header;
                    _read();
                }
                private void _read()
                {
                    _data = m_io.ReadBytes((Header.SampleLength * (Header.Type.IsSampleData16Bit ? 2 : 1)));
                }
                private byte[] _data;
                private SampleHeader _header;
                private FasttrackerXmModule m_root;
                private FasttrackerXmModule.Instrument m_parent;
                public byte[] Data { get { return _data; } }
                public SampleHeader Header { get { return _header; } }
                public FasttrackerXmModule M_Root { get { return m_root; } }
                public FasttrackerXmModule.Instrument M_Parent { get { return m_parent; } }
            }
            public partial class SampleHeader : KaitaiStruct
            {
                public static SampleHeader FromFile(string fileName)
                {
                    return new SampleHeader(new KaitaiStream(fileName));
                }

                public SampleHeader(KaitaiStream p__io, FasttrackerXmModule.Instrument p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _sampleLength = m_io.ReadU4le();
                    _sampleLoopStart = m_io.ReadU4le();
                    _sampleLoopLength = m_io.ReadU4le();
                    _volume = m_io.ReadU1();
                    _fineTune = m_io.ReadS1();
                    _type = new LoopType(m_io, this, m_root);
                    _panning = m_io.ReadU1();
                    _relativeNoteNumber = m_io.ReadS1();
                    _reserved = m_io.ReadU1();
                    _name = System.Text.Encoding.GetEncoding("utf-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(22), 0, false));
                }
                public partial class LoopType : KaitaiStruct
                {
                    public static LoopType FromFile(string fileName)
                    {
                        return new LoopType(new KaitaiStream(fileName));
                    }


                    public enum LoopType
                    {
                        None = 0,
                        Forward = 1,
                        PingPong = 2,
                    }
                    public LoopType(KaitaiStream p__io, FasttrackerXmModule.Instrument.SampleHeader p__parent = null, FasttrackerXmModule p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _reserved0 = m_io.ReadBitsInt(3);
                        _isSampleData16Bit = m_io.ReadBitsInt(1) != 0;
                        _reserved1 = m_io.ReadBitsInt(2);
                        _loopType = ((LoopType) m_io.ReadBitsInt(2));
                    }
                    private ulong _reserved0;
                    private bool _isSampleData16Bit;
                    private ulong _reserved1;
                    private LoopType _loopType;
                    private FasttrackerXmModule m_root;
                    private FasttrackerXmModule.Instrument.SampleHeader m_parent;
                    public ulong Reserved0 { get { return _reserved0; } }
                    public bool IsSampleData16Bit { get { return _isSampleData16Bit; } }
                    public ulong Reserved1 { get { return _reserved1; } }
                    public LoopType LoopType { get { return _loopType; } }
                    public FasttrackerXmModule M_Root { get { return m_root; } }
                    public FasttrackerXmModule.Instrument.SampleHeader M_Parent { get { return m_parent; } }
                }
                private uint _sampleLength;
                private uint _sampleLoopStart;
                private uint _sampleLoopLength;
                private byte _volume;
                private sbyte _fineTune;
                private LoopType _type;
                private byte _panning;
                private sbyte _relativeNoteNumber;
                private byte _reserved;
                private string _name;
                private FasttrackerXmModule m_root;
                private FasttrackerXmModule.Instrument m_parent;
                public uint SampleLength { get { return _sampleLength; } }
                public uint SampleLoopStart { get { return _sampleLoopStart; } }
                public uint SampleLoopLength { get { return _sampleLoopLength; } }
                public byte Volume { get { return _volume; } }

                /// <summary>
                /// -16..+15
                /// </summary>
                public sbyte FineTune { get { return _fineTune; } }
                public LoopType Type { get { return _type; } }

                /// <summary>
                /// (0-255)
                /// </summary>
                public byte Panning { get { return _panning; } }
                public sbyte RelativeNoteNumber { get { return _relativeNoteNumber; } }
                public byte Reserved { get { return _reserved; } }
                public string Name { get { return _name; } }
                public FasttrackerXmModule M_Root { get { return m_root; } }
                public FasttrackerXmModule.Instrument M_Parent { get { return m_parent; } }
            }
            private uint _headerSize;
            private Header _header;
            private List<SampleHeader> _samplesHeaders;
            private List<SamplesData> _samples;
            private FasttrackerXmModule m_root;
            private FasttrackerXmModule m_parent;
            private byte[] __raw_header;

            /// <summary>
            /// Instrument size &lt;&lt; header that is &gt;&gt;
            /// &lt;&lt; &quot;Instrument Size&quot; field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header &gt;&gt;
            /// </summary>
            public uint HeaderSize { get { return _headerSize; } }
            public Header Header { get { return _header; } }
            public List<SampleHeader> SamplesHeaders { get { return _samplesHeaders; } }
            public List<SamplesData> Samples { get { return _samples; } }
            public FasttrackerXmModule M_Root { get { return m_root; } }
            public FasttrackerXmModule M_Parent { get { return m_parent; } }
            public byte[] M_RawHeader { get { return __raw_header; } }
        }
        private Preheader _preheader;
        private Header _header;
        private List<Pattern> _patterns;
        private List<Instrument> _instruments;
        private FasttrackerXmModule m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_header;
        public Preheader Preheader { get { return _preheader; } }
        public Header Header { get { return _header; } }
        public List<Pattern> Patterns { get { return _patterns; } }
        public List<Instrument> Instruments { get { return _instruments; } }
        public FasttrackerXmModule M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeader { get { return __raw_header; } }
    }
}
