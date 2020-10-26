// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Sound resources were introduced in Classic MacOS with the Sound Manager program.
    /// They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
    /// They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf">Source</a>
    /// </remarks>
    public partial class MacOsResourceSnd : KaitaiStruct
    {
        public static MacOsResourceSnd FromFile(string fileName)
        {
            return new MacOsResourceSnd(new KaitaiStream(fileName));
        }


        public enum CmdType
        {
            NullCmd = 0,
            QuietCmd = 3,
            FlushCmd = 4,
            ReInitCmd = 5,
            WaitCmd = 10,
            PauseCmd = 11,
            ResumeCmd = 12,
            CallBackCmd = 13,
            SyncCmd = 14,
            EmptyCmd = 15,
            AvailableCmd = 24,
            VersionCmd = 25,
            TotalLoadCmd = 26,
            LoadCmd = 27,
            FreqDurationCmd = 40,
            RestCmd = 41,
            FreqCmd = 42,
            AmpCmd = 43,
            TimbreCmd = 44,
            GetAmpCmd = 45,
            VolumeCmd = 46,
            GetVolumeCmd = 47,
            WaveTableCmd = 60,
            PhaseCmd = 61,
            SoundCmd = 80,
            BufferCmd = 81,
            RateCmd = 82,
            GetRateCmd = 85,
        }

        public enum SoundHeaderType
        {
            Standard = 0,
            Compressed = 254,
            Extended = 255,
        }

        public enum DataType
        {
            SquareWaveSynth = 1,
            WaveTableSynth = 3,
            SampledSynth = 5,
        }

        public enum WaveInitOption
        {
            Channel0 = 4,
            Channel1 = 5,
            Channel2 = 6,
            Channel3 = 7,
        }

        public enum InitOption
        {
            ChanLeft = 2,
            ChanRight = 3,
            NoInterp = 4,
            NoDrop = 8,
            Mono = 128,
            Stereo = 192,
            Mace3 = 768,
            Mace6 = 1024,
        }

        public enum CompressionTypeEnum
        {
            VariableCompression = -2,
            FixedCompression = -1,
            NotCompressed = 0,
            TwoToOne = 1,
            EightToThree = 2,
            ThreeToOne = 3,
            SixToOne = 4,
        }
        public MacOsResourceSnd(KaitaiStream p__io, KaitaiStruct p__parent = null, MacOsResourceSnd p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_midiNoteToFrequency = false;
            _read();
        }
        private void _read()
        {
            _format = m_io.ReadU2be();
            if (Format == 1) {
                _numDataFormats = m_io.ReadU2be();
            }
            if (Format == 1) {
                _dataFormats = new List<DataFormat>((int) (NumDataFormats));
                for (var i = 0; i < NumDataFormats; i++)
                {
                    _dataFormats.Add(new DataFormat(m_io, this, m_root));
                }
            }
            if (Format == 2) {
                _referenceCount = m_io.ReadU2be();
            }
            _numSoundCommands = m_io.ReadU2be();
            _soundCommands = new List<SoundCommand>((int) (NumSoundCommands));
            for (var i = 0; i < NumSoundCommands; i++)
            {
                _soundCommands.Add(new SoundCommand(m_io, this, m_root));
            }
        }
        public partial class Extended : KaitaiStruct
        {
            public static Extended FromFile(string fileName)
            {
                return new Extended(new KaitaiStream(fileName));
            }

            public Extended(KaitaiStream p__io, MacOsResourceSnd.ExtendedOrCompressed p__parent = null, MacOsResourceSnd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _instrumentChunkPtr = m_io.ReadU4be();
                _aesRecordingPtr = m_io.ReadU4be();
            }
            private uint _instrumentChunkPtr;
            private uint _aesRecordingPtr;
            private MacOsResourceSnd m_root;
            private MacOsResourceSnd.ExtendedOrCompressed m_parent;

            /// <summary>
            /// pointer to instrument info
            /// </summary>
            public uint InstrumentChunkPtr { get { return _instrumentChunkPtr; } }

            /// <summary>
            /// pointer to audio info
            /// </summary>
            public uint AesRecordingPtr { get { return _aesRecordingPtr; } }
            public MacOsResourceSnd M_Root { get { return m_root; } }
            public MacOsResourceSnd.ExtendedOrCompressed M_Parent { get { return m_parent; } }
        }
        public partial class SoundHeader : KaitaiStruct
        {
            public static SoundHeader FromFile(string fileName)
            {
                return new SoundHeader(new KaitaiStream(fileName));
            }

            public SoundHeader(KaitaiStream p__io, MacOsResourceSnd.SoundCommand p__parent = null, MacOsResourceSnd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_startOfs = false;
                f_baseFreqeuncy = false;
                f_soundHeaderType = false;
                _read();
            }
            private void _read()
            {
                if (StartOfs < 0) {
                    __unnamed0 = m_io.ReadBytes(0);
                }
                _samplePtr = m_io.ReadU4be();
                if (SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Standard) {
                    _numSamples = m_io.ReadU4be();
                }
                if ( ((SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Extended) || (SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Compressed)) ) {
                    _numChannels = m_io.ReadU4be();
                }
                _sampleRate = new UnsignedFixedPoint(m_io, this, m_root);
                _loopStart = m_io.ReadU4be();
                _loopEnd = m_io.ReadU4be();
                _encode = ((MacOsResourceSnd.SoundHeaderType) m_io.ReadU1());
                _midiNote = m_io.ReadU1();
                if ( ((SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Extended) || (SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Compressed)) ) {
                    _extendedOrCompressed = new ExtendedOrCompressed(m_io, this, m_root);
                }
                if (SamplePtr == 0) {
                    _sampleArea = m_io.ReadBytes((SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Standard ? NumSamples : (SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Extended ? (((ExtendedOrCompressed.NumFrames * NumChannels) * ExtendedOrCompressed.BitsPerSample) / 8) : (M_Io.Size - M_Io.Pos))));
                }
            }
            private bool f_startOfs;
            private int _startOfs;
            public int StartOfs
            {
                get
                {
                    if (f_startOfs)
                        return _startOfs;
                    _startOfs = (int) (M_Io.Pos);
                    f_startOfs = true;
                    return _startOfs;
                }
            }
            private bool f_baseFreqeuncy;
            private double? _baseFreqeuncy;

            /// <summary>
            /// base frequency of sample in Hz
            /// Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
            /// </remarks>
            public double? BaseFreqeuncy
            {
                get
                {
                    if (f_baseFreqeuncy)
                        return _baseFreqeuncy;
                    if ( ((MidiNote >= 0) && (MidiNote < 128)) ) {
                        _baseFreqeuncy = (double) (M_Root.MidiNoteToFrequency[MidiNote]);
                    }
                    f_baseFreqeuncy = true;
                    return _baseFreqeuncy;
                }
            }
            private bool f_soundHeaderType;
            private SoundHeaderType _soundHeaderType;
            public SoundHeaderType SoundHeaderType
            {
                get
                {
                    if (f_soundHeaderType)
                        return _soundHeaderType;
                    long _pos = m_io.Pos;
                    m_io.Seek((StartOfs + 20));
                    _soundHeaderType = ((MacOsResourceSnd.SoundHeaderType) m_io.ReadU1());
                    m_io.Seek(_pos);
                    f_soundHeaderType = true;
                    return _soundHeaderType;
                }
            }
            private byte[] __unnamed0;
            private uint _samplePtr;
            private uint? _numSamples;
            private uint? _numChannels;
            private UnsignedFixedPoint _sampleRate;
            private uint _loopStart;
            private uint _loopEnd;
            private SoundHeaderType _encode;
            private byte _midiNote;
            private ExtendedOrCompressed _extendedOrCompressed;
            private byte[] _sampleArea;
            private MacOsResourceSnd m_root;
            private MacOsResourceSnd.SoundCommand m_parent;
            public byte[] Unnamed_0 { get { return __unnamed0; } }

            /// <summary>
            /// pointer to samples (or 0 if samples follow data structure)
            /// </summary>
            public uint SamplePtr { get { return _samplePtr; } }

            /// <summary>
            /// number of samples
            /// </summary>
            public uint? NumSamples { get { return _numSamples; } }

            /// <summary>
            /// number of channels in sample
            /// </summary>
            public uint? NumChannels { get { return _numChannels; } }

            /// <summary>
            /// The rate at which the sample was originally recorded.
            /// </summary>
            public UnsignedFixedPoint SampleRate { get { return _sampleRate; } }

            /// <summary>
            /// loop point beginning
            /// </summary>
            public uint LoopStart { get { return _loopStart; } }

            /// <summary>
            /// loop point ending
            /// </summary>
            public uint LoopEnd { get { return _loopEnd; } }

            /// <summary>
            /// sample's encoding option
            /// </summary>
            public SoundHeaderType Encode { get { return _encode; } }

            /// <summary>
            /// base frequency of sample, expressed as MIDI note values, 60 is middle C
            /// </summary>
            public byte MidiNote { get { return _midiNote; } }
            public ExtendedOrCompressed ExtendedOrCompressed { get { return _extendedOrCompressed; } }

            /// <summary>
            /// sampled-sound data
            /// </summary>
            public byte[] SampleArea { get { return _sampleArea; } }
            public MacOsResourceSnd M_Root { get { return m_root; } }
            public MacOsResourceSnd.SoundCommand M_Parent { get { return m_parent; } }
        }
        public partial class UnsignedFixedPoint : KaitaiStruct
        {
            public static UnsignedFixedPoint FromFile(string fileName)
            {
                return new UnsignedFixedPoint(new KaitaiStream(fileName));
            }

            public UnsignedFixedPoint(KaitaiStream p__io, MacOsResourceSnd.SoundHeader p__parent = null, MacOsResourceSnd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _integerPart = m_io.ReadU2be();
                _fractionPart = m_io.ReadU2be();
            }
            private bool f_value;
            private double _value;
            public double Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    _value = (double) ((IntegerPart + (FractionPart / 65535.0)));
                    f_value = true;
                    return _value;
                }
            }
            private ushort _integerPart;
            private ushort _fractionPart;
            private MacOsResourceSnd m_root;
            private MacOsResourceSnd.SoundHeader m_parent;
            public ushort IntegerPart { get { return _integerPart; } }
            public ushort FractionPart { get { return _fractionPart; } }
            public MacOsResourceSnd M_Root { get { return m_root; } }
            public MacOsResourceSnd.SoundHeader M_Parent { get { return m_parent; } }
        }
        public partial class SoundCommand : KaitaiStruct
        {
            public static SoundCommand FromFile(string fileName)
            {
                return new SoundCommand(new KaitaiStream(fileName));
            }

            public SoundCommand(KaitaiStream p__io, MacOsResourceSnd p__parent = null, MacOsResourceSnd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_soundHeader = false;
                _read();
            }
            private void _read()
            {
                _isDataOffset = m_io.ReadBitsIntBe(1) != 0;
                _cmd = ((MacOsResourceSnd.CmdType) m_io.ReadBitsIntBe(15));
                m_io.AlignToByte();
                _param1 = m_io.ReadU2be();
                _param2 = m_io.ReadU4be();
            }
            private bool f_soundHeader;
            private SoundHeader _soundHeader;
            public SoundHeader SoundHeader
            {
                get
                {
                    if (f_soundHeader)
                        return _soundHeader;
                    if ( ((IsDataOffset) && (Cmd == MacOsResourceSnd.CmdType.BufferCmd)) ) {
                        long _pos = m_io.Pos;
                        m_io.Seek(Param2);
                        _soundHeader = new SoundHeader(m_io, this, m_root);
                        m_io.Seek(_pos);
                        f_soundHeader = true;
                    }
                    return _soundHeader;
                }
            }
            private bool _isDataOffset;
            private CmdType _cmd;
            private ushort _param1;
            private uint _param2;
            private MacOsResourceSnd m_root;
            private MacOsResourceSnd m_parent;
            public bool IsDataOffset { get { return _isDataOffset; } }
            public CmdType Cmd { get { return _cmd; } }
            public ushort Param1 { get { return _param1; } }
            public uint Param2 { get { return _param2; } }
            public MacOsResourceSnd M_Root { get { return m_root; } }
            public MacOsResourceSnd M_Parent { get { return m_parent; } }
        }
        public partial class Compressed : KaitaiStruct
        {
            public static Compressed FromFile(string fileName)
            {
                return new Compressed(new KaitaiStream(fileName));
            }

            public Compressed(KaitaiStream p__io, MacOsResourceSnd.ExtendedOrCompressed p__parent = null, MacOsResourceSnd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_compressionType = false;
                _read();
            }
            private void _read()
            {
                _format = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _reserved = m_io.ReadBytes(4);
                _stateVarsPtr = m_io.ReadU4be();
                _leftOverSamplesPtr = m_io.ReadU4be();
                _compressionId = m_io.ReadS2be();
                _packetSize = m_io.ReadU2be();
                _synthesizerId = m_io.ReadU2be();
            }
            private bool f_compressionType;
            private CompressionTypeEnum _compressionType;
            public CompressionTypeEnum CompressionType
            {
                get
                {
                    if (f_compressionType)
                        return _compressionType;
                    _compressionType = (CompressionTypeEnum) (((MacOsResourceSnd.CompressionTypeEnum) CompressionId));
                    f_compressionType = true;
                    return _compressionType;
                }
            }
            private string _format;
            private byte[] _reserved;
            private uint _stateVarsPtr;
            private uint _leftOverSamplesPtr;
            private short _compressionId;
            private ushort _packetSize;
            private ushort _synthesizerId;
            private MacOsResourceSnd m_root;
            private MacOsResourceSnd.ExtendedOrCompressed m_parent;

            /// <summary>
            /// data format type
            /// </summary>
            public string Format { get { return _format; } }
            public byte[] Reserved { get { return _reserved; } }

            /// <summary>
            /// pointer to StateBlock
            /// </summary>
            public uint StateVarsPtr { get { return _stateVarsPtr; } }

            /// <summary>
            /// pointer to LeftOverBlock
            /// </summary>
            public uint LeftOverSamplesPtr { get { return _leftOverSamplesPtr; } }

            /// <summary>
            /// ID of compression algorithm
            /// </summary>
            public short CompressionId { get { return _compressionId; } }

            /// <summary>
            /// number of bits per packet
            /// </summary>
            public ushort PacketSize { get { return _packetSize; } }

            /// <summary>
            /// Latest Sound Manager documentation specifies this field as:
            /// This field is unused. You should set it to 0.
            /// Inside Macintosh (Volume VI, 1991) specifies it as:
            /// Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf">Page 22-49, absolute page number 1169 in the PDF</a>
            /// </remarks>
            public ushort SynthesizerId { get { return _synthesizerId; } }
            public MacOsResourceSnd M_Root { get { return m_root; } }
            public MacOsResourceSnd.ExtendedOrCompressed M_Parent { get { return m_parent; } }
        }
        public partial class ExtendedOrCompressed : KaitaiStruct
        {
            public static ExtendedOrCompressed FromFile(string fileName)
            {
                return new ExtendedOrCompressed(new KaitaiStream(fileName));
            }

            public ExtendedOrCompressed(KaitaiStream p__io, MacOsResourceSnd.SoundHeader p__parent = null, MacOsResourceSnd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numFrames = m_io.ReadU4be();
                _aiffSampleRate = m_io.ReadBytes(10);
                _markerChunk = m_io.ReadU4be();
                if (M_Parent.SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Extended) {
                    _extended = new Extended(m_io, this, m_root);
                }
                if (M_Parent.SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Compressed) {
                    _compressed = new Compressed(m_io, this, m_root);
                }
                _bitsPerSample = m_io.ReadU2be();
                if (M_Parent.SoundHeaderType == MacOsResourceSnd.SoundHeaderType.Extended) {
                    _reserved = m_io.ReadBytes(14);
                }
            }
            private uint _numFrames;
            private byte[] _aiffSampleRate;
            private uint _markerChunk;
            private Extended _extended;
            private Compressed _compressed;
            private ushort _bitsPerSample;
            private byte[] _reserved;
            private MacOsResourceSnd m_root;
            private MacOsResourceSnd.SoundHeader m_parent;
            public uint NumFrames { get { return _numFrames; } }

            /// <summary>
            /// rate of original sample (Extended80)
            /// </summary>
            public byte[] AiffSampleRate { get { return _aiffSampleRate; } }

            /// <summary>
            /// reserved
            /// </summary>
            public uint MarkerChunk { get { return _markerChunk; } }
            public Extended Extended { get { return _extended; } }
            public Compressed Compressed { get { return _compressed; } }

            /// <summary>
            /// number of bits per sample
            /// </summary>
            public ushort BitsPerSample { get { return _bitsPerSample; } }

            /// <summary>
            /// reserved
            /// </summary>
            public byte[] Reserved { get { return _reserved; } }
            public MacOsResourceSnd M_Root { get { return m_root; } }
            public MacOsResourceSnd.SoundHeader M_Parent { get { return m_parent; } }
        }
        public partial class DataFormat : KaitaiStruct
        {
            public static DataFormat FromFile(string fileName)
            {
                return new DataFormat(new KaitaiStream(fileName));
            }

            public DataFormat(KaitaiStream p__io, MacOsResourceSnd p__parent = null, MacOsResourceSnd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_initPanMask = false;
                f_waveInitChannelMask = false;
                f_initStereoMask = false;
                f_waveInit = false;
                f_panInit = false;
                f_initCompMask = false;
                f_stereoInit = false;
                f_compInit = false;
                _read();
            }
            private void _read()
            {
                _id = ((MacOsResourceSnd.DataType) m_io.ReadU2be());
                _options = m_io.ReadU4be();
            }
            private bool f_initPanMask;
            private sbyte _initPanMask;

            /// <summary>
            /// mask for right/left pan values
            /// </summary>
            public sbyte InitPanMask
            {
                get
                {
                    if (f_initPanMask)
                        return _initPanMask;
                    _initPanMask = (sbyte) (3);
                    f_initPanMask = true;
                    return _initPanMask;
                }
            }
            private bool f_waveInitChannelMask;
            private sbyte _waveInitChannelMask;

            /// <summary>
            /// wave table only, Sound Manager 2.0 and earlier
            /// </summary>
            public sbyte WaveInitChannelMask
            {
                get
                {
                    if (f_waveInitChannelMask)
                        return _waveInitChannelMask;
                    _waveInitChannelMask = (sbyte) (7);
                    f_waveInitChannelMask = true;
                    return _waveInitChannelMask;
                }
            }
            private bool f_initStereoMask;
            private byte _initStereoMask;

            /// <summary>
            /// mask for mono/stereo values
            /// </summary>
            public byte InitStereoMask
            {
                get
                {
                    if (f_initStereoMask)
                        return _initStereoMask;
                    _initStereoMask = (byte) (192);
                    f_initStereoMask = true;
                    return _initStereoMask;
                }
            }
            private bool f_waveInit;
            private WaveInitOption _waveInit;
            public WaveInitOption WaveInit
            {
                get
                {
                    if (f_waveInit)
                        return _waveInit;
                    if (Id == MacOsResourceSnd.DataType.WaveTableSynth) {
                        _waveInit = (WaveInitOption) (((MacOsResourceSnd.WaveInitOption) (Options & WaveInitChannelMask)));
                    }
                    f_waveInit = true;
                    return _waveInit;
                }
            }
            private bool f_panInit;
            private InitOption _panInit;
            public InitOption PanInit
            {
                get
                {
                    if (f_panInit)
                        return _panInit;
                    _panInit = (InitOption) (((MacOsResourceSnd.InitOption) (Options & InitPanMask)));
                    f_panInit = true;
                    return _panInit;
                }
            }
            private bool f_initCompMask;
            private int _initCompMask;

            /// <summary>
            /// mask for compression IDs
            /// </summary>
            public int InitCompMask
            {
                get
                {
                    if (f_initCompMask)
                        return _initCompMask;
                    _initCompMask = (int) (65280);
                    f_initCompMask = true;
                    return _initCompMask;
                }
            }
            private bool f_stereoInit;
            private InitOption _stereoInit;
            public InitOption StereoInit
            {
                get
                {
                    if (f_stereoInit)
                        return _stereoInit;
                    _stereoInit = (InitOption) (((MacOsResourceSnd.InitOption) (Options & InitStereoMask)));
                    f_stereoInit = true;
                    return _stereoInit;
                }
            }
            private bool f_compInit;
            private InitOption _compInit;
            public InitOption CompInit
            {
                get
                {
                    if (f_compInit)
                        return _compInit;
                    _compInit = (InitOption) (((MacOsResourceSnd.InitOption) (Options & InitCompMask)));
                    f_compInit = true;
                    return _compInit;
                }
            }
            private DataType _id;
            private uint _options;
            private MacOsResourceSnd m_root;
            private MacOsResourceSnd m_parent;
            public DataType Id { get { return _id; } }

            /// <summary>
            /// contains initialisation options for the SndNewChannel function
            /// </summary>
            public uint Options { get { return _options; } }
            public MacOsResourceSnd M_Root { get { return m_root; } }
            public MacOsResourceSnd M_Parent { get { return m_parent; } }
        }
        private bool f_midiNoteToFrequency;
        private List<double> _midiNoteToFrequency;

        /// <summary>
        /// Lookup table to convert a MIDI note into a frequency in Hz
        /// The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
        /// </remarks>
        public List<double> MidiNoteToFrequency
        {
            get
            {
                if (f_midiNoteToFrequency)
                    return _midiNoteToFrequency;
                _midiNoteToFrequency = (List<double>) (new List<double> { 8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85 });
                f_midiNoteToFrequency = true;
                return _midiNoteToFrequency;
            }
        }
        private ushort _format;
        private ushort? _numDataFormats;
        private List<DataFormat> _dataFormats;
        private ushort? _referenceCount;
        private ushort _numSoundCommands;
        private List<SoundCommand> _soundCommands;
        private MacOsResourceSnd m_root;
        private KaitaiStruct m_parent;
        public ushort Format { get { return _format; } }
        public ushort? NumDataFormats { get { return _numDataFormats; } }
        public List<DataFormat> DataFormats { get { return _dataFormats; } }
        public ushort? ReferenceCount { get { return _referenceCount; } }
        public ushort NumSoundCommands { get { return _numSoundCommands; } }
        public List<SoundCommand> SoundCommands { get { return _soundCommands; } }
        public MacOsResourceSnd M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
