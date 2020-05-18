// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// The WAVE file format is a subset of Microsoft's RIFF specification for the
    /// storage of multimedia files. A RIFF file starts out with a file header
    /// followed by a sequence of data chunks. A WAVE file is often just a RIFF
    /// file with a single &quot;WAVE&quot; chunk which consists of two sub-chunks --
    /// a &quot;fmt &quot; chunk specifying the data format and a &quot;data&quot; chunk containing
    /// the actual sample data.
    /// 
    /// This Kaitai implementation was written by John Byrd of Gigantic Software
    /// (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.loc.gov/preservation/digital/formats/fdd/fdd000001.shtml">Source</a>
    /// </remarks>
    public partial class Wav : KaitaiStruct
    {
        public static Wav FromFile(string fileName)
        {
            return new Wav(new KaitaiStream(fileName));
        }


        public enum WFormatTagType
        {
            Unknown = 0,
            Pcm = 1,
            Adpcm = 2,
            IeeeFloat = 3,
            Vselp = 4,
            IbmCvsd = 5,
            Alaw = 6,
            Mulaw = 7,
            Dts = 8,
            Drm = 9,
            Wmavoice9 = 10,
            Wmavoice10 = 11,
            OkiAdpcm = 16,
            DviAdpcm = 17,
            MediaspaceAdpcm = 18,
            SierraAdpcm = 19,
            G723Adpcm = 20,
            Digistd = 21,
            Digifix = 22,
            DialogicOkiAdpcm = 23,
            MediavisionAdpcm = 24,
            CuCodec = 25,
            HpDynVoice = 26,
            YamahaAdpcm = 32,
            Sonarc = 33,
            DspgroupTruespeech = 34,
            Echosc1 = 35,
            AudiofileAf36 = 36,
            Aptx = 37,
            AudiofileAf10 = 38,
            Prosody1612 = 39,
            Lrc = 40,
            DolbyAc2 = 48,
            Gsm610 = 49,
            Msnaudio = 50,
            AntexAdpcme = 51,
            ControlResVqlpc = 52,
            Digireal = 53,
            Digiadpcm = 54,
            ControlResCr10 = 55,
            NmsVbxadpcm = 56,
            CsImaadpcm = 57,
            Echosc3 = 58,
            RockwellAdpcm = 59,
            RockwellDigitalk = 60,
            Xebec = 61,
            G721Adpcm = 64,
            G728Celp = 65,
            Msg723 = 66,
            IntelG7231 = 67,
            IntelG729 = 68,
            SharpG726 = 69,
            Mpeg = 80,
            Rt24 = 82,
            Pac = 83,
            Mpeglayer3 = 85,
            LucentG723 = 89,
            Cirrus = 96,
            Espcm = 97,
            Voxware = 98,
            CanopusAtrac = 99,
            G726Adpcm = 100,
            G722Adpcm = 101,
            Dsat = 102,
            DsatDisplay = 103,
            VoxwareByteAligned = 105,
            VoxwareAc8 = 112,
            VoxwareAc10 = 113,
            VoxwareAc16 = 114,
            VoxwareAc20 = 115,
            VoxwareRt24 = 116,
            VoxwareRt29 = 117,
            VoxwareRt29hw = 118,
            VoxwareVr12 = 119,
            VoxwareVr18 = 120,
            VoxwareTq40 = 121,
            VoxwareSc3 = 122,
            VoxwareSc31 = 123,
            Softsound = 128,
            VoxwareTq60 = 129,
            Msrt24 = 130,
            G729a = 131,
            MviMvi2 = 132,
            DfG726 = 133,
            DfGsm610 = 134,
            Isiaudio = 136,
            Onlive = 137,
            MultitudeFtSx20 = 138,
            InfocomItsG721Adpcm = 139,
            ConvediaG729 = 140,
            Congruency = 141,
            Sbc24 = 145,
            DolbyAc3Spdif = 146,
            MediasonicG723 = 147,
            Prosody8kbps = 148,
            ZyxelAdpcm = 151,
            PhilipsLpcbb = 152,
            Packed = 153,
            MaldenPhonytalk = 160,
            RacalRecorderGsm = 161,
            RacalRecorderG720A = 162,
            RacalRecorderG7231 = 163,
            RacalRecorderTetraAcelp = 164,
            NecAac = 176,
            RawAac1 = 255,
            RhetorexAdpcm = 256,
            Irat = 257,
            VivoG723 = 273,
            VivoSiren = 274,
            PhilipsCelp = 288,
            PhilipsGrundig = 289,
            DigitalG723 = 291,
            SanyoLdAdpcm = 293,
            SiprolabAceplnet = 304,
            SiprolabAcelp4800 = 305,
            SiprolabAcelp8v3 = 306,
            SiprolabG729 = 307,
            SiprolabG729a = 308,
            SiprolabKelvin = 309,
            VoiceageAmr = 310,
            G726adpcm = 320,
            DictaphoneCelp68 = 321,
            DictaphoneCelp54 = 322,
            QualcommPurevoice = 336,
            QualcommHalfrate = 337,
            Tubgsm = 341,
            Msaudio1 = 352,
            Wmaudio2 = 353,
            Wmaudio3 = 354,
            WmaudioLossless = 355,
            Wmaspdif = 356,
            UnisysNapAdpcm = 368,
            UnisysNapUlaw = 369,
            UnisysNapAlaw = 370,
            UnisysNap16k = 371,
            SycomAcmSyc008 = 372,
            SycomAcmSyc701G726l = 373,
            SycomAcmSyc701Celp54 = 374,
            SycomAcmSyc701Celp68 = 375,
            KnowledgeAdventureAdpcm = 376,
            FraunhoferIisMpeg2Aac = 384,
            DtsDs = 400,
            CreativeAdpcm = 512,
            CreativeFastspeech8 = 514,
            CreativeFastspeech10 = 515,
            UherAdpcm = 528,
            UleadDvAudio = 533,
            UleadDvAudio1 = 534,
            Quarterdeck = 544,
            IlinkVc = 560,
            RawSport = 576,
            EsstAc3 = 577,
            GenericPassthru = 585,
            IpiHsx = 592,
            IpiRpelp = 593,
            Cs2 = 608,
            SonyScx = 624,
            SonyScy = 625,
            SonyAtrac3 = 626,
            SonySpc = 627,
            TelumAudio = 640,
            TelumIaAudio = 641,
            NorcomVoiceSystemsAdpcm = 645,
            FmTownsSnd = 768,
            Micronas = 848,
            MicronasCelp833 = 849,
            BtvDigital = 1024,
            IntelMusicCoder = 1025,
            IndeoAudio = 1026,
            QdesignMusic = 1104,
            On2Vp7Audio = 1280,
            On2Vp6Audio = 1281,
            VmeVmpcm = 1664,
            Tpc = 1665,
            LightwaveLossless = 2222,
            Oligsm = 4096,
            Oliadpcm = 4097,
            Olicelp = 4098,
            Olisbc = 4099,
            Oliopr = 4100,
            LhCodec = 4352,
            LhCodecCelp = 4353,
            LhCodecSbc8 = 4354,
            LhCodecSbc12 = 4355,
            LhCodecSbc16 = 4356,
            Norris = 5120,
            Isiaudio2 = 5121,
            SoundspaceMusicompress = 5376,
            MpegAdtsAac = 5632,
            MpegRawAac = 5633,
            MpegLoas = 5634,
            NokiaMpegAdtsAac = 5640,
            NokiaMpegRawAac = 5641,
            VodafoneMpegAdtsAac = 5642,
            VodafoneMpegRawAac = 5643,
            MpegHeaac = 5648,
            VoxwareRt24Speech = 6172,
            SonicfoundryLossless = 6513,
            InningsTelecomAdpcm = 6521,
            LucentSx8300p = 7175,
            LucentSx5363s = 7180,
            Cuseeme = 7939,
            NtcsoftAlf2cmAcm = 8132,
            Dvm = 8192,
            Dts2 = 8193,
            Makeavis = 13075,
            DivioMpeg4Aac = 16707,
            NokiaAdaptiveMultirate = 16897,
            DivioG726 = 16963,
            LeadSpeech = 17228,
            LeadVorbis = 22092,
            WavpackAudio = 22358,
            OggVorbisMode1 = 26447,
            OggVorbisMode2 = 26448,
            OggVorbisMode3 = 26449,
            OggVorbisMode1Plus = 26479,
            OggVorbisMode2Plus = 26480,
            OggVorbisMode3Plus = 26481,
            ThreecomNbx = 28672,
            FaadAac = 28781,
            AmrNb = 29537,
            AmrWb = 29538,
            AmrWp = 29539,
            GsmAmrCbr = 31265,
            GsmAmrVbrSid = 31266,
            ComverseInfosysG7231 = 41216,
            ComverseInfosysAvqsbc = 41217,
            ComverseInfosysSbc = 41218,
            SymbolG729A = 41219,
            VoiceageAmrWb = 41220,
            IngenientG726 = 41221,
            Mpeg4Aac = 41222,
            EncoreG726 = 41223,
            ZollAsao = 41224,
            SpeexVoice = 41225,
            VianixMasc = 41226,
            Wm9SpectrumAnalyzer = 41227,
            WmfSpectrumAnayzer = 41228,
            Gsm610 = 41229,
            Gsm620 = 41230,
            Gsm660 = 41231,
            Gsm690 = 41232,
            GsmAdaptiveMultirateWb = 41233,
            PolycomG722 = 41234,
            PolycomG728 = 41235,
            PolycomG729A = 41236,
            PolycomSiren = 41237,
            GlobalIpIlbc = 41238,
            RadiotimeTimeShiftRadio = 41239,
            NiceAca = 41240,
            NiceAdpcm = 41241,
            VocordG721 = 41242,
            VocordG726 = 41243,
            VocordG7221 = 41244,
            VocordG728 = 41245,
            VocordG729 = 41246,
            VocordG729A = 41247,
            VocordG7231 = 41248,
            VocordLbc = 41249,
            NiceG728 = 41250,
            FraceTelecomG729 = 41251,
            Codian = 41252,
            Flac = 61868,
            Extensible = 65534,
            Development = 65535,
        }

        public enum ChunkType
        {
            Fmt = 544501094,
            Bext = 1650817140,
            Cue = 1668637984,
            Data = 1684108385,
            Minf = 1835626086,
            Regn = 1919248238,
            Umid = 1970104676,
        }
        public Wav(KaitaiStream p__io, KaitaiStruct p__parent = null, Wav p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_formatChunk = false;
            _read();
        }
        private void _read()
        {
            _riffId = m_io.EnsureFixedContents(new byte[] { 82, 73, 70, 70 });
            _fileSize = m_io.ReadU4le();
            _waveId = m_io.EnsureFixedContents(new byte[] { 87, 65, 86, 69 });
            __raw_chunks = m_io.ReadBytes((FileSize - 4));
            var io___raw_chunks = new KaitaiStream(__raw_chunks);
            _chunks = new ChunksType(io___raw_chunks, this, m_root);
            _padByte = m_io.ReadBytes(KaitaiStream.Mod(FileSize, 2));
        }
        public partial class SampleType : KaitaiStruct
        {
            public static SampleType FromFile(string fileName)
            {
                return new SampleType(new KaitaiStream(fileName));
            }

            public SampleType(KaitaiStream p__io, KaitaiStruct p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sample = m_io.ReadU2le();
            }
            private ushort _sample;
            private Wav m_root;
            private KaitaiStruct m_parent;
            public ushort Sample { get { return _sample; } }
            public Wav M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class FormatChunkType : KaitaiStruct
        {
            public static FormatChunkType FromFile(string fileName)
            {
                return new FormatChunkType(new KaitaiStream(fileName));
            }

            public FormatChunkType(KaitaiStream p__io, Wav.ChunkType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isExtensible = false;
                f_isBasicPcm = false;
                f_isBasicFloat = false;
                f_isCbSizeMeaningful = false;
                _read();
            }
            private void _read()
            {
                _wFormatTag = ((Wav.WFormatTagType) m_io.ReadU2le());
                _nChannels = m_io.ReadU2le();
                _nSamplesPerSec = m_io.ReadU4le();
                _nAvgBytesPerSec = m_io.ReadU4le();
                _nBlockAlign = m_io.ReadU2le();
                _wBitsPerSample = m_io.ReadU2le();
                if (!(IsBasicPcm)) {
                    _cbSize = m_io.ReadU2le();
                }
                if (IsCbSizeMeaningful) {
                    _wValidBitsPerSample = m_io.ReadU2le();
                }
                if (IsExtensible) {
                    _channelMaskAndSubformat = new ChannelMaskAndSubformatType(m_io, this, m_root);
                }
            }
            private bool f_isExtensible;
            private bool _isExtensible;
            public bool IsExtensible
            {
                get
                {
                    if (f_isExtensible)
                        return _isExtensible;
                    _isExtensible = (bool) (WFormatTag == Wav.WFormatTagType.Extensible);
                    f_isExtensible = true;
                    return _isExtensible;
                }
            }
            private bool f_isBasicPcm;
            private bool _isBasicPcm;
            public bool IsBasicPcm
            {
                get
                {
                    if (f_isBasicPcm)
                        return _isBasicPcm;
                    _isBasicPcm = (bool) (WFormatTag == Wav.WFormatTagType.Pcm);
                    f_isBasicPcm = true;
                    return _isBasicPcm;
                }
            }
            private bool f_isBasicFloat;
            private bool _isBasicFloat;
            public bool IsBasicFloat
            {
                get
                {
                    if (f_isBasicFloat)
                        return _isBasicFloat;
                    _isBasicFloat = (bool) (WFormatTag == Wav.WFormatTagType.IeeeFloat);
                    f_isBasicFloat = true;
                    return _isBasicFloat;
                }
            }
            private bool f_isCbSizeMeaningful;
            private bool _isCbSizeMeaningful;
            public bool IsCbSizeMeaningful
            {
                get
                {
                    if (f_isCbSizeMeaningful)
                        return _isCbSizeMeaningful;
                    _isCbSizeMeaningful = (bool) ( ((!(IsBasicPcm)) && (CbSize != 0)) );
                    f_isCbSizeMeaningful = true;
                    return _isCbSizeMeaningful;
                }
            }
            private WFormatTagType _wFormatTag;
            private ushort _nChannels;
            private uint _nSamplesPerSec;
            private uint _nAvgBytesPerSec;
            private ushort _nBlockAlign;
            private ushort _wBitsPerSample;
            private ushort? _cbSize;
            private ushort? _wValidBitsPerSample;
            private ChannelMaskAndSubformatType _channelMaskAndSubformat;
            private Wav m_root;
            private Wav.ChunkType m_parent;
            public WFormatTagType WFormatTag { get { return _wFormatTag; } }
            public ushort NChannels { get { return _nChannels; } }
            public uint NSamplesPerSec { get { return _nSamplesPerSec; } }
            public uint NAvgBytesPerSec { get { return _nAvgBytesPerSec; } }
            public ushort NBlockAlign { get { return _nBlockAlign; } }
            public ushort WBitsPerSample { get { return _wBitsPerSample; } }
            public ushort? CbSize { get { return _cbSize; } }
            public ushort? WValidBitsPerSample { get { return _wValidBitsPerSample; } }
            public ChannelMaskAndSubformatType ChannelMaskAndSubformat { get { return _channelMaskAndSubformat; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.ChunkType M_Parent { get { return m_parent; } }
        }
        public partial class GuidType : KaitaiStruct
        {
            public static GuidType FromFile(string fileName)
            {
                return new GuidType(new KaitaiStream(fileName));
            }

            public GuidType(KaitaiStream p__io, Wav.ChannelMaskAndSubformatType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _data1 = m_io.ReadU4le();
                _data2 = m_io.ReadU2le();
                _data3 = m_io.ReadU2le();
                _data4 = m_io.ReadU4be();
                _data4a = m_io.ReadU4be();
            }
            private uint _data1;
            private ushort _data2;
            private ushort _data3;
            private uint _data4;
            private uint _data4a;
            private Wav m_root;
            private Wav.ChannelMaskAndSubformatType m_parent;
            public uint Data1 { get { return _data1; } }
            public ushort Data2 { get { return _data2; } }
            public ushort Data3 { get { return _data3; } }
            public uint Data4 { get { return _data4; } }
            public uint Data4a { get { return _data4a; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.ChannelMaskAndSubformatType M_Parent { get { return m_parent; } }
        }
        public partial class CuePointType : KaitaiStruct
        {
            public static CuePointType FromFile(string fileName)
            {
                return new CuePointType(new KaitaiStream(fileName));
            }

            public CuePointType(KaitaiStream p__io, Wav.CueChunkType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _dwName = m_io.ReadU4le();
                _dwPosition = m_io.ReadU4le();
                _fccChunk = m_io.ReadU4le();
                _dwChunkStart = m_io.ReadU4le();
                _dwBlockStart = m_io.ReadU4le();
                _dwSampleOffset = m_io.ReadU4le();
            }
            private uint _dwName;
            private uint _dwPosition;
            private uint _fccChunk;
            private uint _dwChunkStart;
            private uint _dwBlockStart;
            private uint _dwSampleOffset;
            private Wav m_root;
            private Wav.CueChunkType m_parent;
            public uint DwName { get { return _dwName; } }
            public uint DwPosition { get { return _dwPosition; } }
            public uint FccChunk { get { return _fccChunk; } }
            public uint DwChunkStart { get { return _dwChunkStart; } }
            public uint DwBlockStart { get { return _dwBlockStart; } }
            public uint DwSampleOffset { get { return _dwSampleOffset; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.CueChunkType M_Parent { get { return m_parent; } }
        }
        public partial class DataChunkType : KaitaiStruct
        {
            public static DataChunkType FromFile(string fileName)
            {
                return new DataChunkType(new KaitaiStream(fileName));
            }

            public DataChunkType(KaitaiStream p__io, Wav.ChunkType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _data = m_io.ReadBytesFull();
            }
            private byte[] _data;
            private Wav m_root;
            private Wav.ChunkType m_parent;
            public byte[] Data { get { return _data; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.ChunkType M_Parent { get { return m_parent; } }
        }
        public partial class SamplesType : KaitaiStruct
        {
            public static SamplesType FromFile(string fileName)
            {
                return new SamplesType(new KaitaiStream(fileName));
            }

            public SamplesType(KaitaiStream p__io, KaitaiStruct p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _samples = m_io.ReadU4le();
            }
            private uint _samples;
            private Wav m_root;
            private KaitaiStruct m_parent;
            public uint Samples { get { return _samples; } }
            public Wav M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class ChannelMaskAndSubformatType : KaitaiStruct
        {
            public static ChannelMaskAndSubformatType FromFile(string fileName)
            {
                return new ChannelMaskAndSubformatType(new KaitaiStream(fileName));
            }

            public ChannelMaskAndSubformatType(KaitaiStream p__io, Wav.FormatChunkType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _dwChannelMask = new ChannelMaskType(m_io, this, m_root);
                _subformat = new GuidType(m_io, this, m_root);
            }
            private ChannelMaskType _dwChannelMask;
            private GuidType _subformat;
            private Wav m_root;
            private Wav.FormatChunkType m_parent;
            public ChannelMaskType DwChannelMask { get { return _dwChannelMask; } }
            public GuidType Subformat { get { return _subformat; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.FormatChunkType M_Parent { get { return m_parent; } }
        }
        public partial class ChunksType : KaitaiStruct
        {
            public static ChunksType FromFile(string fileName)
            {
                return new ChunksType(new KaitaiStream(fileName));
            }

            public ChunksType(KaitaiStream p__io, Wav p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _chunk = new List<ChunkType>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _chunk.Add(new ChunkType(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<ChunkType> _chunk;
            private Wav m_root;
            private Wav m_parent;
            public List<ChunkType> Chunk { get { return _chunk; } }
            public Wav M_Root { get { return m_root; } }
            public Wav M_Parent { get { return m_parent; } }
        }
        public partial class CueChunkType : KaitaiStruct
        {
            public static CueChunkType FromFile(string fileName)
            {
                return new CueChunkType(new KaitaiStream(fileName));
            }

            public CueChunkType(KaitaiStream p__io, Wav.ChunkType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _dwCuePoints = m_io.ReadU4le();
                if (DwCuePoints != 0) {
                    _cuePoints = new List<CuePointType>((int) (DwCuePoints));
                    for (var i = 0; i < DwCuePoints; i++)
                    {
                        _cuePoints.Add(new CuePointType(m_io, this, m_root));
                    }
                }
            }
            private uint _dwCuePoints;
            private List<CuePointType> _cuePoints;
            private Wav m_root;
            private Wav.ChunkType m_parent;
            public uint DwCuePoints { get { return _dwCuePoints; } }
            public List<CuePointType> CuePoints { get { return _cuePoints; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.ChunkType M_Parent { get { return m_parent; } }
        }
        public partial class ChannelMaskType : KaitaiStruct
        {
            public static ChannelMaskType FromFile(string fileName)
            {
                return new ChannelMaskType(new KaitaiStream(fileName));
            }

            public ChannelMaskType(KaitaiStream p__io, Wav.ChannelMaskAndSubformatType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _frontRightOfCenter = m_io.ReadBitsInt(1) != 0;
                _frontLeftOfCenter = m_io.ReadBitsInt(1) != 0;
                _backRight = m_io.ReadBitsInt(1) != 0;
                _backLeft = m_io.ReadBitsInt(1) != 0;
                _lowFrequency = m_io.ReadBitsInt(1) != 0;
                _frontCenter = m_io.ReadBitsInt(1) != 0;
                _frontRight = m_io.ReadBitsInt(1) != 0;
                _frontLeft = m_io.ReadBitsInt(1) != 0;
                _topCenter = m_io.ReadBitsInt(1) != 0;
                _sideRight = m_io.ReadBitsInt(1) != 0;
                _sideLeft = m_io.ReadBitsInt(1) != 0;
                _backCenter = m_io.ReadBitsInt(1) != 0;
                _topBackLeft = m_io.ReadBitsInt(1) != 0;
                _topFrontRight = m_io.ReadBitsInt(1) != 0;
                _topFrontCenter = m_io.ReadBitsInt(1) != 0;
                _topFrontLeft = m_io.ReadBitsInt(1) != 0;
                _unused1 = m_io.ReadBitsInt(6);
                _topBackRight = m_io.ReadBitsInt(1) != 0;
                _topBackCenter = m_io.ReadBitsInt(1) != 0;
                _unused2 = m_io.ReadBitsInt(8);
            }
            private bool _frontRightOfCenter;
            private bool _frontLeftOfCenter;
            private bool _backRight;
            private bool _backLeft;
            private bool _lowFrequency;
            private bool _frontCenter;
            private bool _frontRight;
            private bool _frontLeft;
            private bool _topCenter;
            private bool _sideRight;
            private bool _sideLeft;
            private bool _backCenter;
            private bool _topBackLeft;
            private bool _topFrontRight;
            private bool _topFrontCenter;
            private bool _topFrontLeft;
            private ulong _unused1;
            private bool _topBackRight;
            private bool _topBackCenter;
            private ulong _unused2;
            private Wav m_root;
            private Wav.ChannelMaskAndSubformatType m_parent;
            public bool FrontRightOfCenter { get { return _frontRightOfCenter; } }
            public bool FrontLeftOfCenter { get { return _frontLeftOfCenter; } }
            public bool BackRight { get { return _backRight; } }
            public bool BackLeft { get { return _backLeft; } }
            public bool LowFrequency { get { return _lowFrequency; } }
            public bool FrontCenter { get { return _frontCenter; } }
            public bool FrontRight { get { return _frontRight; } }
            public bool FrontLeft { get { return _frontLeft; } }
            public bool TopCenter { get { return _topCenter; } }
            public bool SideRight { get { return _sideRight; } }
            public bool SideLeft { get { return _sideLeft; } }
            public bool BackCenter { get { return _backCenter; } }
            public bool TopBackLeft { get { return _topBackLeft; } }
            public bool TopFrontRight { get { return _topFrontRight; } }
            public bool TopFrontCenter { get { return _topFrontCenter; } }
            public bool TopFrontLeft { get { return _topFrontLeft; } }
            public ulong Unused1 { get { return _unused1; } }
            public bool TopBackRight { get { return _topBackRight; } }
            public bool TopBackCenter { get { return _topBackCenter; } }
            public ulong Unused2 { get { return _unused2; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.ChannelMaskAndSubformatType M_Parent { get { return m_parent; } }
        }
        public partial class ChunkType : KaitaiStruct
        {
            public static ChunkType FromFile(string fileName)
            {
                return new ChunkType(new KaitaiStream(fileName));
            }

            public ChunkType(KaitaiStream p__io, Wav.ChunksType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _chunkId = m_io.ReadU4be();
                _len = m_io.ReadU4le();
                switch (ChunkId) {
                case 1684108385: {
                    __raw_data = m_io.ReadBytes(Len);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new DataChunkType(io___raw_data, this, m_root);
                    break;
                }
                case 1668637984: {
                    __raw_data = m_io.ReadBytes(Len);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new CueChunkType(io___raw_data, this, m_root);
                    break;
                }
                case 1650817140: {
                    __raw_data = m_io.ReadBytes(Len);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new BextChunkType(io___raw_data, this, m_root);
                    break;
                }
                case 1718449184: {
                    __raw_data = m_io.ReadBytes(Len);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new FormatChunkType(io___raw_data, this, m_root);
                    break;
                }
                default: {
                    _data = m_io.ReadBytes(Len);
                    break;
                }
                }
                _padByte = m_io.ReadBytes(KaitaiStream.Mod(Len, 2));
            }
            private uint _chunkId;
            private uint _len;
            private object _data;
            private byte[] _padByte;
            private Wav m_root;
            private Wav.ChunksType m_parent;
            private byte[] __raw_data;
            public uint ChunkId { get { return _chunkId; } }
            public uint Len { get { return _len; } }
            public object Data { get { return _data; } }
            public byte[] PadByte { get { return _padByte; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.ChunksType M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }
        public partial class BextChunkType : KaitaiStruct
        {
            public static BextChunkType FromFile(string fileName)
            {
                return new BextChunkType(new KaitaiStream(fileName));
            }

            public BextChunkType(KaitaiStream p__io, Wav.ChunkType p__parent = null, Wav p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _description = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(256));
                _originator = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(32));
                _originatorReference = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(32));
                _originationDate = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(10));
                _originationTime = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(8));
                _timeReferenceLow = m_io.ReadU4le();
                _timeReferenceHigh = m_io.ReadU4le();
                _version = m_io.ReadU2le();
                _umid = m_io.ReadBytes(64);
                _loudnessValue = m_io.ReadU2le();
                _loudnessRange = m_io.ReadU2le();
                _maxTruePeakLevel = m_io.ReadU2le();
                _maxMomentaryLoudness = m_io.ReadU2le();
                _maxShortTermLoudness = m_io.ReadU2le();
            }
            private string _description;
            private string _originator;
            private string _originatorReference;
            private string _originationDate;
            private string _originationTime;
            private uint _timeReferenceLow;
            private uint _timeReferenceHigh;
            private ushort _version;
            private byte[] _umid;
            private ushort _loudnessValue;
            private ushort _loudnessRange;
            private ushort _maxTruePeakLevel;
            private ushort _maxMomentaryLoudness;
            private ushort _maxShortTermLoudness;
            private Wav m_root;
            private Wav.ChunkType m_parent;
            public string Description { get { return _description; } }
            public string Originator { get { return _originator; } }
            public string OriginatorReference { get { return _originatorReference; } }
            public string OriginationDate { get { return _originationDate; } }
            public string OriginationTime { get { return _originationTime; } }
            public uint TimeReferenceLow { get { return _timeReferenceLow; } }
            public uint TimeReferenceHigh { get { return _timeReferenceHigh; } }
            public ushort Version { get { return _version; } }
            public byte[] Umid { get { return _umid; } }
            public ushort LoudnessValue { get { return _loudnessValue; } }
            public ushort LoudnessRange { get { return _loudnessRange; } }
            public ushort MaxTruePeakLevel { get { return _maxTruePeakLevel; } }
            public ushort MaxMomentaryLoudness { get { return _maxMomentaryLoudness; } }
            public ushort MaxShortTermLoudness { get { return _maxShortTermLoudness; } }
            public Wav M_Root { get { return m_root; } }
            public Wav.ChunkType M_Parent { get { return m_parent; } }
        }
        private bool f_formatChunk;
        private object _formatChunk;
        public object FormatChunk
        {
            get
            {
                if (f_formatChunk)
                    return _formatChunk;
                _formatChunk = (object) (Chunks.Chunk[0].Data);
                f_formatChunk = true;
                return _formatChunk;
            }
        }
        private byte[] _riffId;
        private uint _fileSize;
        private byte[] _waveId;
        private ChunksType _chunks;
        private byte[] _padByte;
        private Wav m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_chunks;
        public byte[] RiffId { get { return _riffId; } }
        public uint FileSize { get { return _fileSize; } }
        public byte[] WaveId { get { return _waveId; } }
        public ChunksType Chunks { get { return _chunks; } }
        public byte[] PadByte { get { return _padByte; } }
        public Wav M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawChunks { get { return __raw_chunks; } }
    }
}
