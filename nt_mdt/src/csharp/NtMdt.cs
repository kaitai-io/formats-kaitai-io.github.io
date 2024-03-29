// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// A native file format of NT-MDT scientific software. Usually contains
    /// any of:
    /// 
    /// * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
    /// * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
    /// * results of their analysis
    /// 
    /// Some examples of mdt files can be downloaded at:
    /// 
    /// * &lt;https://www.ntmdt-si.ru/resources/scan-gallery&gt;
    /// * &lt;http://callistosoft.narod.ru/Resources/Mdt.zip&gt;
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c">Source</a>
    /// </remarks>
    public partial class NtMdt : KaitaiStruct
    {
        public static NtMdt FromFile(string fileName)
        {
            return new NtMdt(new KaitaiStream(fileName));
        }


        public enum AdcMode
        {
            Height = 0,
            Dfl = 1,
            LateralF = 2,
            BiasV = 3,
            Current = 4,
            FbOut = 5,
            Mag = 6,
            MagSin = 7,
            MagCos = 8,
            Rms = 9,
            CalcMag = 10,
            Phase1 = 11,
            Phase2 = 12,
            CalcPhase = 13,
            Ex1 = 14,
            Ex2 = 15,
            HvX = 16,
            HvY = 17,
            SnapBack = 18,
            False = 255,
        }

        public enum XmlScanLocation
        {
            Hlt = 0,
            Hlb = 1,
            Hrt = 2,
            Hrb = 3,
            Vlt = 4,
            Vlb = 5,
            Vrt = 6,
            Vrb = 7,
        }

        public enum DataType
        {
            Floatfix = -65544,
            Float80 = -16138,
            Float64 = -13320,
            Float48 = -9990,
            Float32 = -5892,
            Int64 = -8,
            Int32 = -4,
            Int16 = -2,
            Int8 = -1,
            Unknown0 = 0,
            Uint8 = 1,
            Uint16 = 2,
            Uint32 = 4,
            Uint64 = 8,
        }

        public enum XmlParamType
        {
            None = 0,
            LaserWavelength = 1,
            Units = 2,
            DataArray = 255,
        }

        public enum SpmMode
        {
            ConstantForce = 0,
            ContactConstantHeight = 1,
            ContactError = 2,
            LateralForce = 3,
            ForceModulation = 4,
            SpreadingResistanceImaging = 5,
            SemicontactTopography = 6,
            SemicontactError = 7,
            PhaseContrast = 8,
            AcMagneticForce = 9,
            DcMagneticForce = 10,
            ElectrostaticForce = 11,
            CapacitanceContrast = 12,
            KelvinProbe = 13,
            ConstantCurrent = 14,
            BarrierHeight = 15,
            ConstantHeight = 16,
            Afam = 17,
            ContactEfm = 18,
            ShearForceTopography = 19,
            Sfom = 20,
            ContactCapacitance = 21,
            SnomTransmission = 22,
            SnomReflection = 23,
            SnomAll = 24,
            Snom = 25,
        }

        public enum Unit
        {
            RamanShift = -10,
            Reserved0 = -9,
            Reserved1 = -8,
            Reserved2 = -7,
            Reserved3 = -6,
            Meter = -5,
            CentiMeter = -4,
            MilliMeter = -3,
            MicroMeter = -2,
            NanoMeter = -1,
            Angstrom = 0,
            NanoAmpere = 1,
            Volt = 2,
            None = 3,
            KiloHertz = 4,
            Degrees = 5,
            Percent = 6,
            CelsiusDegree = 7,
            VoltHigh = 8,
            Second = 9,
            MilliSecond = 10,
            MicroSecond = 11,
            NanoSecond = 12,
            Counts = 13,
            Pixels = 14,
            ReservedSfom0 = 15,
            ReservedSfom1 = 16,
            ReservedSfom2 = 17,
            ReservedSfom3 = 18,
            ReservedSfom4 = 19,
            Ampere2 = 20,
            MilliAmpere = 21,
            MicroAmpere = 22,
            NanoAmpere2 = 23,
            PicoAmpere = 24,
            Volt2 = 25,
            MilliVolt = 26,
            MicroVolt = 27,
            NanoVolt = 28,
            PicoVolt = 29,
            Newton = 30,
            MilliNewton = 31,
            MicroNewton = 32,
            NanoNewton = 33,
            PicoNewton = 34,
            ReservedDos0 = 35,
            ReservedDos1 = 36,
            ReservedDos2 = 37,
            ReservedDos3 = 38,
            ReservedDos4 = 39,
        }

        public enum SpmTechnique
        {
            ContactMode = 0,
            SemicontactMode = 1,
            TunnelCurrent = 2,
            Snom = 3,
        }

        public enum Consts
        {
            FrameModeSize = 8,
            FrameHeaderSize = 22,
            AxisScalesSize = 30,
            FileHeaderSize = 32,
            SpectroVarsMinSize = 38,
            ScanVarsMinSize = 77,
        }
        public NtMdt(KaitaiStream p__io, KaitaiStruct p__parent = null, NtMdt p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _signature = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(Signature, new byte[] { 1, 176, 147, 255 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 1, 176, 147, 255 }, Signature, M_Io, "/seq/0");
            }
            _size = m_io.ReadU4le();
            _reserved0 = m_io.ReadBytes(4);
            _lastFrame = m_io.ReadU2le();
            _reserved1 = m_io.ReadBytes(18);
            _wrondDoc = m_io.ReadBytes(1);
            __raw_frames = m_io.ReadBytes(Size);
            var io___raw_frames = new KaitaiStream(__raw_frames);
            _frames = new Framez(io___raw_frames, this, m_root);
        }
        public partial class Uuid : KaitaiStruct
        {
            public static Uuid FromFile(string fileName)
            {
                return new Uuid(new KaitaiStream(fileName));
            }

            public Uuid(KaitaiStream p__io, NtMdt.Frame.FdMetaData p__parent = null, NtMdt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _data = new List<byte>();
                for (var i = 0; i < 16; i++)
                {
                    _data.Add(m_io.ReadU1());
                }
            }
            private List<byte> _data;
            private NtMdt m_root;
            private NtMdt.Frame.FdMetaData m_parent;
            public List<byte> Data { get { return _data; } }
            public NtMdt M_Root { get { return m_root; } }
            public NtMdt.Frame.FdMetaData M_Parent { get { return m_parent; } }
        }
        public partial class Framez : KaitaiStruct
        {
            public static Framez FromFile(string fileName)
            {
                return new Framez(new KaitaiStream(fileName));
            }

            public Framez(KaitaiStream p__io, NtMdt p__parent = null, NtMdt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _frames = new List<Frame>();
                for (var i = 0; i < (M_Root.LastFrame + 1); i++)
                {
                    _frames.Add(new Frame(m_io, this, m_root));
                }
            }
            private List<Frame> _frames;
            private NtMdt m_root;
            private NtMdt m_parent;
            public List<Frame> Frames { get { return _frames; } }
            public NtMdt M_Root { get { return m_root; } }
            public NtMdt M_Parent { get { return m_parent; } }
        }
        public partial class Frame : KaitaiStruct
        {
            public static Frame FromFile(string fileName)
            {
                return new Frame(new KaitaiStream(fileName));
            }


            public enum FrameType
            {
                Scanned = 0,
                Spectroscopy = 1,
                Text = 3,
                OldMda = 105,
                Mda = 106,
                Palette = 107,
                CurvesNew = 190,
                Curves = 201,
            }
            public Frame(KaitaiStream p__io, NtMdt.Framez p__parent = null, NtMdt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _size = m_io.ReadU4le();
                __raw_main = m_io.ReadBytes((Size - 4));
                var io___raw_main = new KaitaiStream(__raw_main);
                _main = new FrameMain(io___raw_main, this, m_root);
            }
            public partial class Dots : KaitaiStruct
            {
                public static Dots FromFile(string fileName)
                {
                    return new Dots(new KaitaiStream(fileName));
                }

                public Dots(KaitaiStream p__io, KaitaiStruct p__parent = null, NtMdt p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _fmNdots = m_io.ReadU2le();
                    if (FmNdots > 0) {
                        _coordHeader = new DotsHeader(m_io, this, m_root);
                    }
                    _coordinates = new List<DotsData>();
                    for (var i = 0; i < FmNdots; i++)
                    {
                        _coordinates.Add(new DotsData(m_io, this, m_root));
                    }
                    _data = new List<DataLinez>();
                    for (var i = 0; i < FmNdots; i++)
                    {
                        _data.Add(new DataLinez(i, m_io, this, m_root));
                    }
                }
                public partial class DotsHeader : KaitaiStruct
                {
                    public static DotsHeader FromFile(string fileName)
                    {
                        return new DotsHeader(new KaitaiStream(fileName));
                    }

                    public DotsHeader(KaitaiStream p__io, NtMdt.Frame.Dots p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _headerSize = m_io.ReadS4le();
                        __raw_header = m_io.ReadBytes(HeaderSize);
                        var io___raw_header = new KaitaiStream(__raw_header);
                        _header = new Header(io___raw_header, this, m_root);
                    }
                    public partial class Header : KaitaiStruct
                    {
                        public static Header FromFile(string fileName)
                        {
                            return new Header(new KaitaiStream(fileName));
                        }

                        public Header(KaitaiStream p__io, NtMdt.Frame.Dots.DotsHeader p__parent = null, NtMdt p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _coordSize = m_io.ReadS4le();
                            _version = m_io.ReadS4le();
                            _xyunits = ((NtMdt.Unit) m_io.ReadS2le());
                        }
                        private int _coordSize;
                        private int _version;
                        private Unit _xyunits;
                        private NtMdt m_root;
                        private NtMdt.Frame.Dots.DotsHeader m_parent;
                        public int CoordSize { get { return _coordSize; } }
                        public int Version { get { return _version; } }
                        public Unit Xyunits { get { return _xyunits; } }
                        public NtMdt M_Root { get { return m_root; } }
                        public NtMdt.Frame.Dots.DotsHeader M_Parent { get { return m_parent; } }
                    }
                    private int _headerSize;
                    private Header _header;
                    private NtMdt m_root;
                    private NtMdt.Frame.Dots m_parent;
                    private byte[] __raw_header;
                    public int HeaderSize { get { return _headerSize; } }
                    public Header Header { get { return _header; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.Dots M_Parent { get { return m_parent; } }
                    public byte[] M_RawHeader { get { return __raw_header; } }
                }
                public partial class DotsData : KaitaiStruct
                {
                    public static DotsData FromFile(string fileName)
                    {
                        return new DotsData(new KaitaiStream(fileName));
                    }

                    public DotsData(KaitaiStream p__io, NtMdt.Frame.Dots p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _coordX = m_io.ReadF4le();
                        _coordY = m_io.ReadF4le();
                        _forwardSize = m_io.ReadS4le();
                        _backwardSize = m_io.ReadS4le();
                    }
                    private float _coordX;
                    private float _coordY;
                    private int _forwardSize;
                    private int _backwardSize;
                    private NtMdt m_root;
                    private NtMdt.Frame.Dots m_parent;
                    public float CoordX { get { return _coordX; } }
                    public float CoordY { get { return _coordY; } }
                    public int ForwardSize { get { return _forwardSize; } }
                    public int BackwardSize { get { return _backwardSize; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.Dots M_Parent { get { return m_parent; } }
                }
                public partial class DataLinez : KaitaiStruct
                {
                    public DataLinez(ushort p_index, KaitaiStream p__io, NtMdt.Frame.Dots p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _index = p_index;
                        _read();
                    }
                    private void _read()
                    {
                        _forward = new List<short>();
                        for (var i = 0; i < M_Parent.Coordinates[Index].ForwardSize; i++)
                        {
                            _forward.Add(m_io.ReadS2le());
                        }
                        _backward = new List<short>();
                        for (var i = 0; i < M_Parent.Coordinates[Index].BackwardSize; i++)
                        {
                            _backward.Add(m_io.ReadS2le());
                        }
                    }
                    private List<short> _forward;
                    private List<short> _backward;
                    private ushort _index;
                    private NtMdt m_root;
                    private NtMdt.Frame.Dots m_parent;
                    public List<short> Forward { get { return _forward; } }
                    public List<short> Backward { get { return _backward; } }
                    public ushort Index { get { return _index; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.Dots M_Parent { get { return m_parent; } }
                }
                private ushort _fmNdots;
                private DotsHeader _coordHeader;
                private List<DotsData> _coordinates;
                private List<DataLinez> _data;
                private NtMdt m_root;
                private KaitaiStruct m_parent;
                public ushort FmNdots { get { return _fmNdots; } }
                public DotsHeader CoordHeader { get { return _coordHeader; } }
                public List<DotsData> Coordinates { get { return _coordinates; } }
                public List<DataLinez> Data { get { return _data; } }
                public NtMdt M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            public partial class FrameMain : KaitaiStruct
            {
                public static FrameMain FromFile(string fileName)
                {
                    return new FrameMain(new KaitaiStream(fileName));
                }

                public FrameMain(KaitaiStream p__io, NtMdt.Frame p__parent = null, NtMdt p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _type = ((NtMdt.Frame.FrameType) m_io.ReadU2le());
                    _version = new Version(m_io, this, m_root);
                    _dateTime = new DateTime(m_io, this, m_root);
                    _varSize = m_io.ReadU2le();
                    switch (Type) {
                    case NtMdt.Frame.FrameType.Mda: {
                        __raw_frameData = m_io.ReadBytesFull();
                        var io___raw_frameData = new KaitaiStream(__raw_frameData);
                        _frameData = new FdMetaData(io___raw_frameData, this, m_root);
                        break;
                    }
                    case NtMdt.Frame.FrameType.CurvesNew: {
                        __raw_frameData = m_io.ReadBytesFull();
                        var io___raw_frameData = new KaitaiStream(__raw_frameData);
                        _frameData = new FdCurvesNew(io___raw_frameData, this, m_root);
                        break;
                    }
                    case NtMdt.Frame.FrameType.Curves: {
                        __raw_frameData = m_io.ReadBytesFull();
                        var io___raw_frameData = new KaitaiStream(__raw_frameData);
                        _frameData = new FdSpectroscopy(io___raw_frameData, this, m_root);
                        break;
                    }
                    case NtMdt.Frame.FrameType.Spectroscopy: {
                        __raw_frameData = m_io.ReadBytesFull();
                        var io___raw_frameData = new KaitaiStream(__raw_frameData);
                        _frameData = new FdSpectroscopy(io___raw_frameData, this, m_root);
                        break;
                    }
                    case NtMdt.Frame.FrameType.Scanned: {
                        __raw_frameData = m_io.ReadBytesFull();
                        var io___raw_frameData = new KaitaiStream(__raw_frameData);
                        _frameData = new FdScanned(io___raw_frameData, this, m_root);
                        break;
                    }
                    default: {
                        _frameData = m_io.ReadBytesFull();
                        break;
                    }
                    }
                }
                private FrameType _type;
                private Version _version;
                private DateTime _dateTime;
                private ushort _varSize;
                private object _frameData;
                private NtMdt m_root;
                private NtMdt.Frame m_parent;
                private byte[] __raw_frameData;

                /// <summary>
                /// h_what
                /// </summary>
                public FrameType Type { get { return _type; } }
                public Version Version { get { return _version; } }
                public DateTime DateTime { get { return _dateTime; } }

                /// <summary>
                /// h_am, v6 and older only
                /// </summary>
                public ushort VarSize { get { return _varSize; } }

                /// <summary>
                /// 
                /// </summary>
                public object FrameData { get { return _frameData; } }
                public NtMdt M_Root { get { return m_root; } }
                public NtMdt.Frame M_Parent { get { return m_parent; } }
                public byte[] M_RawFrameData { get { return __raw_frameData; } }
            }
            public partial class FdCurvesNew : KaitaiStruct
            {
                public static FdCurvesNew FromFile(string fileName)
                {
                    return new FdCurvesNew(new KaitaiStream(fileName));
                }

                public FdCurvesNew(KaitaiStream p__io, NtMdt.Frame.FrameMain p__parent = null, NtMdt p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _blockCount = m_io.ReadU4le();
                    _blocksHeaders = new List<BlockDescr>();
                    for (var i = 0; i < BlockCount; i++)
                    {
                        _blocksHeaders.Add(new BlockDescr(m_io, this, m_root));
                    }
                    _blocksNames = new List<string>();
                    for (var i = 0; i < BlockCount; i++)
                    {
                        _blocksNames.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(BlocksHeaders[i].NameLen)));
                    }
                    _blocksData = new List<byte[]>();
                    for (var i = 0; i < BlockCount; i++)
                    {
                        _blocksData.Add(m_io.ReadBytes(BlocksHeaders[i].Len));
                    }
                }
                public partial class BlockDescr : KaitaiStruct
                {
                    public static BlockDescr FromFile(string fileName)
                    {
                        return new BlockDescr(new KaitaiStream(fileName));
                    }

                    public BlockDescr(KaitaiStream p__io, NtMdt.Frame.FdCurvesNew p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _nameLen = m_io.ReadU4le();
                        _len = m_io.ReadU4le();
                    }
                    private uint _nameLen;
                    private uint _len;
                    private NtMdt m_root;
                    private NtMdt.Frame.FdCurvesNew m_parent;
                    public uint NameLen { get { return _nameLen; } }
                    public uint Len { get { return _len; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.FdCurvesNew M_Parent { get { return m_parent; } }
                }
                private uint _blockCount;
                private List<BlockDescr> _blocksHeaders;
                private List<string> _blocksNames;
                private List<byte[]> _blocksData;
                private NtMdt m_root;
                private NtMdt.Frame.FrameMain m_parent;
                public uint BlockCount { get { return _blockCount; } }
                public List<BlockDescr> BlocksHeaders { get { return _blocksHeaders; } }
                public List<string> BlocksNames { get { return _blocksNames; } }
                public List<byte[]> BlocksData { get { return _blocksData; } }
                public NtMdt M_Root { get { return m_root; } }
                public NtMdt.Frame.FrameMain M_Parent { get { return m_parent; } }
            }
            public partial class FdMetaData : KaitaiStruct
            {
                public static FdMetaData FromFile(string fileName)
                {
                    return new FdMetaData(new KaitaiStream(fileName));
                }

                public FdMetaData(KaitaiStream p__io, NtMdt.Frame.FrameMain p__parent = null, NtMdt p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_image = false;
                    _read();
                }
                private void _read()
                {
                    _headSize = m_io.ReadU4le();
                    _totLen = m_io.ReadU4le();
                    _guids = new List<Uuid>();
                    for (var i = 0; i < 2; i++)
                    {
                        _guids.Add(new Uuid(m_io, this, m_root));
                    }
                    _frameStatus = m_io.ReadBytes(4);
                    _nameSize = m_io.ReadU4le();
                    _commSize = m_io.ReadU4le();
                    _viewInfoSize = m_io.ReadU4le();
                    _specSize = m_io.ReadU4le();
                    _sourceInfoSize = m_io.ReadU4le();
                    _varSize = m_io.ReadU4le();
                    _dataOffset = m_io.ReadU4le();
                    _dataSize = m_io.ReadU4le();
                    _title = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(NameSize));
                    _xml = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(CommSize));
                    _structLen = m_io.ReadU4le();
                    _arraySize = m_io.ReadU8le();
                    _cellSize = m_io.ReadU4le();
                    _nDimensions = m_io.ReadU4le();
                    _nMesurands = m_io.ReadU4le();
                    _dimensions = new List<Calibration>();
                    for (var i = 0; i < NDimensions; i++)
                    {
                        _dimensions.Add(new Calibration(m_io, this, m_root));
                    }
                    _mesurands = new List<Calibration>();
                    for (var i = 0; i < NMesurands; i++)
                    {
                        _mesurands.Add(new Calibration(m_io, this, m_root));
                    }
                }
                public partial class Image : KaitaiStruct
                {
                    public static Image FromFile(string fileName)
                    {
                        return new Image(new KaitaiStream(fileName));
                    }

                    public Image(KaitaiStream p__io, NtMdt.Frame.FdMetaData p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _image = new List<Vec>();
                        {
                            var i = 0;
                            while (!m_io.IsEof) {
                                _image.Add(new Vec(m_io, this, m_root));
                                i++;
                            }
                        }
                    }
                    public partial class Vec : KaitaiStruct
                    {
                        public static Vec FromFile(string fileName)
                        {
                            return new Vec(new KaitaiStream(fileName));
                        }

                        public Vec(KaitaiStream p__io, NtMdt.Frame.FdMetaData.Image p__parent = null, NtMdt p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _items = new List<double>();
                            for (var i = 0; i < M_Parent.M_Parent.NMesurands; i++)
                            {
                                switch (M_Parent.M_Parent.Mesurands[i].DataType) {
                                case NtMdt.DataType.Uint64: {
                                    _items.Add(m_io.ReadU8le());
                                    break;
                                }
                                case NtMdt.DataType.Uint8: {
                                    _items.Add(m_io.ReadU1());
                                    break;
                                }
                                case NtMdt.DataType.Float32: {
                                    _items.Add(m_io.ReadF4le());
                                    break;
                                }
                                case NtMdt.DataType.Int8: {
                                    _items.Add(m_io.ReadS1());
                                    break;
                                }
                                case NtMdt.DataType.Uint16: {
                                    _items.Add(m_io.ReadU2le());
                                    break;
                                }
                                case NtMdt.DataType.Int64: {
                                    _items.Add(m_io.ReadS8le());
                                    break;
                                }
                                case NtMdt.DataType.Uint32: {
                                    _items.Add(m_io.ReadU4le());
                                    break;
                                }
                                case NtMdt.DataType.Float64: {
                                    _items.Add(m_io.ReadF8le());
                                    break;
                                }
                                case NtMdt.DataType.Int16: {
                                    _items.Add(m_io.ReadS2le());
                                    break;
                                }
                                case NtMdt.DataType.Int32: {
                                    _items.Add(m_io.ReadS4le());
                                    break;
                                }
                                }
                            }
                        }
                        private List<double> _items;
                        private NtMdt m_root;
                        private NtMdt.Frame.FdMetaData.Image m_parent;
                        public List<double> Items { get { return _items; } }
                        public NtMdt M_Root { get { return m_root; } }
                        public NtMdt.Frame.FdMetaData.Image M_Parent { get { return m_parent; } }
                    }
                    private List<Vec> _image;
                    private NtMdt m_root;
                    private NtMdt.Frame.FdMetaData m_parent;
                    public List<Vec> Image { get { return _image; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.FdMetaData M_Parent { get { return m_parent; } }
                }
                public partial class Calibration : KaitaiStruct
                {
                    public static Calibration FromFile(string fileName)
                    {
                        return new Calibration(new KaitaiStream(fileName));
                    }

                    public Calibration(KaitaiStream p__io, NtMdt.Frame.FdMetaData p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_count = false;
                        _read();
                    }
                    private void _read()
                    {
                        _lenTot = m_io.ReadU4le();
                        _lenStruct = m_io.ReadU4le();
                        _lenName = m_io.ReadU4le();
                        _lenComment = m_io.ReadU4le();
                        _lenUnit = m_io.ReadU4le();
                        _siUnit = m_io.ReadU8le();
                        _accuracy = m_io.ReadF8le();
                        _functionIdAndDimensions = m_io.ReadU8le();
                        _bias = m_io.ReadF8le();
                        _scale = m_io.ReadF8le();
                        _minIndex = m_io.ReadU8le();
                        _maxIndex = m_io.ReadU8le();
                        _dataType = ((NtMdt.DataType) m_io.ReadS4le());
                        _lenAuthor = m_io.ReadU4le();
                        _name = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytes(LenName));
                        _comment = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytes(LenComment));
                        _unit = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytes(LenUnit));
                        _author = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytes(LenAuthor));
                    }
                    private bool f_count;
                    private int _count;
                    public int Count
                    {
                        get
                        {
                            if (f_count)
                                return _count;
                            _count = (int) (((MaxIndex - MinIndex) + 1));
                            f_count = true;
                            return _count;
                        }
                    }
                    private uint _lenTot;
                    private uint _lenStruct;
                    private uint _lenName;
                    private uint _lenComment;
                    private uint _lenUnit;
                    private ulong _siUnit;
                    private double _accuracy;
                    private ulong _functionIdAndDimensions;
                    private double _bias;
                    private double _scale;
                    private ulong _minIndex;
                    private ulong _maxIndex;
                    private DataType _dataType;
                    private uint _lenAuthor;
                    private string _name;
                    private string _comment;
                    private string _unit;
                    private string _author;
                    private NtMdt m_root;
                    private NtMdt.Frame.FdMetaData m_parent;
                    public uint LenTot { get { return _lenTot; } }
                    public uint LenStruct { get { return _lenStruct; } }
                    public uint LenName { get { return _lenName; } }
                    public uint LenComment { get { return _lenComment; } }
                    public uint LenUnit { get { return _lenUnit; } }
                    public ulong SiUnit { get { return _siUnit; } }
                    public double Accuracy { get { return _accuracy; } }
                    public ulong FunctionIdAndDimensions { get { return _functionIdAndDimensions; } }
                    public double Bias { get { return _bias; } }
                    public double Scale { get { return _scale; } }
                    public ulong MinIndex { get { return _minIndex; } }
                    public ulong MaxIndex { get { return _maxIndex; } }
                    public DataType DataType { get { return _dataType; } }
                    public uint LenAuthor { get { return _lenAuthor; } }
                    public string Name { get { return _name; } }
                    public string Comment { get { return _comment; } }
                    public string Unit { get { return _unit; } }
                    public string Author { get { return _author; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.FdMetaData M_Parent { get { return m_parent; } }
                }
                private bool f_image;
                private Image _image;
                public Image Image
                {
                    get
                    {
                        if (f_image)
                            return _image;
                        long _pos = m_io.Pos;
                        m_io.Seek(DataOffset);
                        __raw_image = m_io.ReadBytes(DataSize);
                        var io___raw_image = new KaitaiStream(__raw_image);
                        _image = new Image(io___raw_image, this, m_root);
                        m_io.Seek(_pos);
                        f_image = true;
                        return _image;
                    }
                }
                private uint _headSize;
                private uint _totLen;
                private List<Uuid> _guids;
                private byte[] _frameStatus;
                private uint _nameSize;
                private uint _commSize;
                private uint _viewInfoSize;
                private uint _specSize;
                private uint _sourceInfoSize;
                private uint _varSize;
                private uint _dataOffset;
                private uint _dataSize;
                private string _title;
                private string _xml;
                private uint _structLen;
                private ulong _arraySize;
                private uint _cellSize;
                private uint _nDimensions;
                private uint _nMesurands;
                private List<Calibration> _dimensions;
                private List<Calibration> _mesurands;
                private NtMdt m_root;
                private NtMdt.Frame.FrameMain m_parent;
                private byte[] __raw_image;
                public uint HeadSize { get { return _headSize; } }
                public uint TotLen { get { return _totLen; } }
                public List<Uuid> Guids { get { return _guids; } }
                public byte[] FrameStatus { get { return _frameStatus; } }
                public uint NameSize { get { return _nameSize; } }
                public uint CommSize { get { return _commSize; } }
                public uint ViewInfoSize { get { return _viewInfoSize; } }
                public uint SpecSize { get { return _specSize; } }
                public uint SourceInfoSize { get { return _sourceInfoSize; } }
                public uint VarSize { get { return _varSize; } }
                public uint DataOffset { get { return _dataOffset; } }
                public uint DataSize { get { return _dataSize; } }
                public string Title { get { return _title; } }
                public string Xml { get { return _xml; } }
                public uint StructLen { get { return _structLen; } }
                public ulong ArraySize { get { return _arraySize; } }
                public uint CellSize { get { return _cellSize; } }
                public uint NDimensions { get { return _nDimensions; } }
                public uint NMesurands { get { return _nMesurands; } }
                public List<Calibration> Dimensions { get { return _dimensions; } }
                public List<Calibration> Mesurands { get { return _mesurands; } }
                public NtMdt M_Root { get { return m_root; } }
                public NtMdt.Frame.FrameMain M_Parent { get { return m_parent; } }
                public byte[] M_RawImage { get { return __raw_image; } }
            }
            public partial class FdSpectroscopy : KaitaiStruct
            {
                public static FdSpectroscopy FromFile(string fileName)
                {
                    return new FdSpectroscopy(new KaitaiStream(fileName));
                }

                public FdSpectroscopy(KaitaiStream p__io, NtMdt.Frame.FrameMain p__parent = null, NtMdt p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    __raw_vars = m_io.ReadBytes(M_Parent.VarSize);
                    var io___raw_vars = new KaitaiStream(__raw_vars);
                    _vars = new Vars(io___raw_vars, this, m_root);
                    _fmMode = m_io.ReadU2le();
                    _fmXres = m_io.ReadU2le();
                    _fmYres = m_io.ReadU2le();
                    _dots = new Dots(m_io, this, m_root);
                    _data = new List<short>();
                    for (var i = 0; i < (FmXres * FmYres); i++)
                    {
                        _data.Add(m_io.ReadS2le());
                    }
                    _title = new Title(m_io, this, m_root);
                    _xml = new Xml(m_io, this, m_root);
                }
                public partial class Vars : KaitaiStruct
                {
                    public static Vars FromFile(string fileName)
                    {
                        return new Vars(new KaitaiStream(fileName));
                    }

                    public Vars(KaitaiStream p__io, NtMdt.Frame.FdSpectroscopy p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _xScale = new AxisScale(m_io, this, m_root);
                        _yScale = new AxisScale(m_io, this, m_root);
                        _zScale = new AxisScale(m_io, this, m_root);
                        _spMode = m_io.ReadU2le();
                        _spFilter = m_io.ReadU2le();
                        _uBegin = m_io.ReadF4le();
                        _uEnd = m_io.ReadF4le();
                        _zUp = m_io.ReadS2le();
                        _zDown = m_io.ReadS2le();
                        _spAveraging = m_io.ReadU2le();
                        _spRepeat = m_io.ReadU1();
                        _spBack = m_io.ReadU1();
                        _sp4nx = m_io.ReadS2le();
                        _spOsc = m_io.ReadU1();
                        _spN4 = m_io.ReadU1();
                        _sp4x0 = m_io.ReadF4le();
                        _sp4xr = m_io.ReadF4le();
                        _sp4u = m_io.ReadS2le();
                        _sp4i = m_io.ReadS2le();
                        _spNx = m_io.ReadS2le();
                    }
                    private AxisScale _xScale;
                    private AxisScale _yScale;
                    private AxisScale _zScale;
                    private ushort _spMode;
                    private ushort _spFilter;
                    private float _uBegin;
                    private float _uEnd;
                    private short _zUp;
                    private short _zDown;
                    private ushort _spAveraging;
                    private byte _spRepeat;
                    private byte _spBack;
                    private short _sp4nx;
                    private byte _spOsc;
                    private byte _spN4;
                    private float _sp4x0;
                    private float _sp4xr;
                    private short _sp4u;
                    private short _sp4i;
                    private short _spNx;
                    private NtMdt m_root;
                    private NtMdt.Frame.FdSpectroscopy m_parent;
                    public AxisScale XScale { get { return _xScale; } }
                    public AxisScale YScale { get { return _yScale; } }
                    public AxisScale ZScale { get { return _zScale; } }
                    public ushort SpMode { get { return _spMode; } }
                    public ushort SpFilter { get { return _spFilter; } }
                    public float UBegin { get { return _uBegin; } }
                    public float UEnd { get { return _uEnd; } }
                    public short ZUp { get { return _zUp; } }
                    public short ZDown { get { return _zDown; } }
                    public ushort SpAveraging { get { return _spAveraging; } }
                    public byte SpRepeat { get { return _spRepeat; } }
                    public byte SpBack { get { return _spBack; } }
                    public short Sp4nx { get { return _sp4nx; } }
                    public byte SpOsc { get { return _spOsc; } }
                    public byte SpN4 { get { return _spN4; } }
                    public float Sp4x0 { get { return _sp4x0; } }
                    public float Sp4xr { get { return _sp4xr; } }
                    public short Sp4u { get { return _sp4u; } }
                    public short Sp4i { get { return _sp4i; } }
                    public short SpNx { get { return _spNx; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.FdSpectroscopy M_Parent { get { return m_parent; } }
                }
                private Vars _vars;
                private ushort _fmMode;
                private ushort _fmXres;
                private ushort _fmYres;
                private Dots _dots;
                private List<short> _data;
                private Title _title;
                private Xml _xml;
                private NtMdt m_root;
                private NtMdt.Frame.FrameMain m_parent;
                private byte[] __raw_vars;
                public Vars Vars { get { return _vars; } }
                public ushort FmMode { get { return _fmMode; } }
                public ushort FmXres { get { return _fmXres; } }
                public ushort FmYres { get { return _fmYres; } }
                public Dots Dots { get { return _dots; } }
                public List<short> Data { get { return _data; } }
                public Title Title { get { return _title; } }
                public Xml Xml { get { return _xml; } }
                public NtMdt M_Root { get { return m_root; } }
                public NtMdt.Frame.FrameMain M_Parent { get { return m_parent; } }
                public byte[] M_RawVars { get { return __raw_vars; } }
            }
            public partial class DateTime : KaitaiStruct
            {
                public static DateTime FromFile(string fileName)
                {
                    return new DateTime(new KaitaiStream(fileName));
                }

                public DateTime(KaitaiStream p__io, NtMdt.Frame.FrameMain p__parent = null, NtMdt p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _date = new Date(m_io, this, m_root);
                    _time = new Time(m_io, this, m_root);
                }
                public partial class Date : KaitaiStruct
                {
                    public static Date FromFile(string fileName)
                    {
                        return new Date(new KaitaiStream(fileName));
                    }

                    public Date(KaitaiStream p__io, NtMdt.Frame.DateTime p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _year = m_io.ReadU2le();
                        _month = m_io.ReadU2le();
                        _day = m_io.ReadU2le();
                    }
                    private ushort _year;
                    private ushort _month;
                    private ushort _day;
                    private NtMdt m_root;
                    private NtMdt.Frame.DateTime m_parent;

                    /// <summary>
                    /// h_yea
                    /// </summary>
                    public ushort Year { get { return _year; } }

                    /// <summary>
                    /// h_mon
                    /// </summary>
                    public ushort Month { get { return _month; } }

                    /// <summary>
                    /// h_day
                    /// </summary>
                    public ushort Day { get { return _day; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.DateTime M_Parent { get { return m_parent; } }
                }
                public partial class Time : KaitaiStruct
                {
                    public static Time FromFile(string fileName)
                    {
                        return new Time(new KaitaiStream(fileName));
                    }

                    public Time(KaitaiStream p__io, NtMdt.Frame.DateTime p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _hour = m_io.ReadU2le();
                        _min = m_io.ReadU2le();
                        _sec = m_io.ReadU2le();
                    }
                    private ushort _hour;
                    private ushort _min;
                    private ushort _sec;
                    private NtMdt m_root;
                    private NtMdt.Frame.DateTime m_parent;

                    /// <summary>
                    /// h_h
                    /// </summary>
                    public ushort Hour { get { return _hour; } }

                    /// <summary>
                    /// h_m
                    /// </summary>
                    public ushort Min { get { return _min; } }

                    /// <summary>
                    /// h_s
                    /// </summary>
                    public ushort Sec { get { return _sec; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.DateTime M_Parent { get { return m_parent; } }
                }
                private Date _date;
                private Time _time;
                private NtMdt m_root;
                private NtMdt.Frame.FrameMain m_parent;
                public Date Date { get { return _date; } }
                public Time Time { get { return _time; } }
                public NtMdt M_Root { get { return m_root; } }
                public NtMdt.Frame.FrameMain M_Parent { get { return m_parent; } }
            }
            public partial class AxisScale : KaitaiStruct
            {
                public static AxisScale FromFile(string fileName)
                {
                    return new AxisScale(new KaitaiStream(fileName));
                }

                public AxisScale(KaitaiStream p__io, KaitaiStruct p__parent = null, NtMdt p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _offset = m_io.ReadF4le();
                    _step = m_io.ReadF4le();
                    _unit = ((NtMdt.Unit) m_io.ReadS2le());
                }
                private float _offset;
                private float _step;
                private Unit _unit;
                private NtMdt m_root;
                private KaitaiStruct m_parent;

                /// <summary>
                /// x_scale-&gt;offset = gwy_get_gfloat_le(&amp;p);# r0 (physical units)
                /// </summary>
                public float Offset { get { return _offset; } }

                /// <summary>
                /// x_scale-&gt;step = gwy_get_gfloat_le(&amp;p); r (physical units) x_scale-&gt;step = fabs(x_scale-&gt;step); if (!x_scale-&gt;step) {
                ///   g_warning(&quot;x_scale.step == 0, changing to 1&quot;);
                ///   x_scale-&gt;step = 1.0;
                /// }
                /// </summary>
                public float Step { get { return _step; } }

                /// <summary>
                /// U
                /// </summary>
                public Unit Unit { get { return _unit; } }
                public NtMdt M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            public partial class FdScanned : KaitaiStruct
            {
                public static FdScanned FromFile(string fileName)
                {
                    return new FdScanned(new KaitaiStream(fileName));
                }


                public enum Mode
                {
                    Stm = 0,
                    Afm = 1,
                    Unknown2 = 2,
                    Unknown3 = 3,
                    Unknown4 = 4,
                }

                public enum InputSignal
                {
                    ExtensionSlot = 0,
                    BiasV = 1,
                    Ground = 2,
                }

                public enum LiftMode
                {
                    Step = 0,
                    Fine = 1,
                    Slope = 2,
                }
                public FdScanned(KaitaiStream p__io, NtMdt.Frame.FrameMain p__parent = null, NtMdt p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    __raw_vars = m_io.ReadBytes(M_Parent.VarSize);
                    var io___raw_vars = new KaitaiStream(__raw_vars);
                    _vars = new Vars(io___raw_vars, this, m_root);
                    if (false) {
                        _origFormat = m_io.ReadU4le();
                    }
                    if (false) {
                        _tune = ((LiftMode) m_io.ReadU4le());
                    }
                    if (false) {
                        _feedbackGain = m_io.ReadF8le();
                    }
                    if (false) {
                        _dacScale = m_io.ReadS4le();
                    }
                    if (false) {
                        _overscan = m_io.ReadS4le();
                    }
                    _fmMode = m_io.ReadU2le();
                    _fmXres = m_io.ReadU2le();
                    _fmYres = m_io.ReadU2le();
                    _dots = new Dots(m_io, this, m_root);
                    _image = new List<short>();
                    for (var i = 0; i < (FmXres * FmYres); i++)
                    {
                        _image.Add(m_io.ReadS2le());
                    }
                    _title = new Title(m_io, this, m_root);
                    _xml = new Xml(m_io, this, m_root);
                }
                public partial class Vars : KaitaiStruct
                {
                    public static Vars FromFile(string fileName)
                    {
                        return new Vars(new KaitaiStream(fileName));
                    }

                    public Vars(KaitaiStream p__io, NtMdt.Frame.FdScanned p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _xScale = new AxisScale(m_io, this, m_root);
                        _yScale = new AxisScale(m_io, this, m_root);
                        _zScale = new AxisScale(m_io, this, m_root);
                        _channelIndex = ((NtMdt.AdcMode) m_io.ReadU1());
                        _mode = ((NtMdt.Frame.FdScanned.Mode) m_io.ReadU1());
                        _xres = m_io.ReadU2le();
                        _yres = m_io.ReadU2le();
                        _ndacq = m_io.ReadU2le();
                        _stepLength = m_io.ReadF4le();
                        _adt = m_io.ReadU2le();
                        _adcGainAmpLog10 = m_io.ReadU1();
                        _adcIndex = m_io.ReadU1();
                        _inputSignalOrVersion = m_io.ReadU1();
                        _substrPlaneOrderOrPassNum = m_io.ReadU1();
                        _scanDir = new ScanDir(m_io, this, m_root);
                        _powerOf2 = m_io.ReadU1();
                        _velocity = m_io.ReadF4le();
                        _setpoint = m_io.ReadF4le();
                        _biasVoltage = m_io.ReadF4le();
                        _draw = m_io.ReadU1();
                        _reserved = m_io.ReadU1();
                        _xoff = m_io.ReadS4le();
                        _yoff = m_io.ReadS4le();
                        _nlCorr = m_io.ReadU1();
                    }
                    private AxisScale _xScale;
                    private AxisScale _yScale;
                    private AxisScale _zScale;
                    private AdcMode _channelIndex;
                    private Mode _mode;
                    private ushort _xres;
                    private ushort _yres;
                    private ushort _ndacq;
                    private float _stepLength;
                    private ushort _adt;
                    private byte _adcGainAmpLog10;
                    private byte _adcIndex;
                    private byte _inputSignalOrVersion;
                    private byte _substrPlaneOrderOrPassNum;
                    private ScanDir _scanDir;
                    private byte _powerOf2;
                    private float _velocity;
                    private float _setpoint;
                    private float _biasVoltage;
                    private byte _draw;
                    private byte _reserved;
                    private int _xoff;
                    private int _yoff;
                    private byte _nlCorr;
                    private NtMdt m_root;
                    private NtMdt.Frame.FdScanned m_parent;
                    public AxisScale XScale { get { return _xScale; } }
                    public AxisScale YScale { get { return _yScale; } }
                    public AxisScale ZScale { get { return _zScale; } }

                    /// <summary>
                    /// s_mode
                    /// </summary>
                    public AdcMode ChannelIndex { get { return _channelIndex; } }

                    /// <summary>
                    /// s_dev
                    /// </summary>
                    public Mode Mode { get { return _mode; } }

                    /// <summary>
                    /// s_nx
                    /// </summary>
                    public ushort Xres { get { return _xres; } }

                    /// <summary>
                    /// s_ny
                    /// </summary>
                    public ushort Yres { get { return _yres; } }

                    /// <summary>
                    /// Step (DAC)
                    /// </summary>
                    public ushort Ndacq { get { return _ndacq; } }

                    /// <summary>
                    /// s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&amp;p))
                    /// </summary>
                    public float StepLength { get { return _stepLength; } }

                    /// <summary>
                    /// s_adt
                    /// </summary>
                    public ushort Adt { get { return _adt; } }

                    /// <summary>
                    /// s_adc_a
                    /// </summary>
                    public byte AdcGainAmpLog10 { get { return _adcGainAmpLog10; } }

                    /// <summary>
                    /// ADC index
                    /// </summary>
                    public byte AdcIndex { get { return _adcIndex; } }

                    /// <summary>
                    /// MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
                    /// </summary>
                    public byte InputSignalOrVersion { get { return _inputSignalOrVersion; } }

                    /// <summary>
                    /// s_spl or z_03
                    /// </summary>
                    public byte SubstrPlaneOrderOrPassNum { get { return _substrPlaneOrderOrPassNum; } }

                    /// <summary>
                    /// s_xy TODO: interpretation
                    /// </summary>
                    public ScanDir ScanDir { get { return _scanDir; } }

                    /// <summary>
                    /// s_2n (bool)
                    /// </summary>
                    public byte PowerOf2 { get { return _powerOf2; } }

                    /// <summary>
                    /// s_vel (Angstrom/second)
                    /// </summary>
                    public float Velocity { get { return _velocity; } }

                    /// <summary>
                    /// s_i0
                    /// </summary>
                    public float Setpoint { get { return _setpoint; } }

                    /// <summary>
                    /// s_ut
                    /// </summary>
                    public float BiasVoltage { get { return _biasVoltage; } }

                    /// <summary>
                    /// s_draw (bool)
                    /// </summary>
                    public byte Draw { get { return _draw; } }
                    public byte Reserved { get { return _reserved; } }

                    /// <summary>
                    /// s_x00 (in DAC quants)
                    /// </summary>
                    public int Xoff { get { return _xoff; } }

                    /// <summary>
                    /// s_y00 (in DAC quants)
                    /// </summary>
                    public int Yoff { get { return _yoff; } }

                    /// <summary>
                    /// s_cor (bool)
                    /// </summary>
                    public byte NlCorr { get { return _nlCorr; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.FdScanned M_Parent { get { return m_parent; } }
                }
                public partial class Dot : KaitaiStruct
                {
                    public static Dot FromFile(string fileName)
                    {
                        return new Dot(new KaitaiStream(fileName));
                    }

                    public Dot(KaitaiStream p__io, KaitaiStruct p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _x = m_io.ReadS2le();
                        _y = m_io.ReadS2le();
                    }
                    private short _x;
                    private short _y;
                    private NtMdt m_root;
                    private KaitaiStruct m_parent;
                    public short X { get { return _x; } }
                    public short Y { get { return _y; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public KaitaiStruct M_Parent { get { return m_parent; } }
                }
                public partial class ScanDir : KaitaiStruct
                {
                    public static ScanDir FromFile(string fileName)
                    {
                        return new ScanDir(new KaitaiStream(fileName));
                    }

                    public ScanDir(KaitaiStream p__io, NtMdt.Frame.FdScanned.Vars p__parent = null, NtMdt p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _unkn = m_io.ReadBitsIntBe(4);
                        _doublePass = m_io.ReadBitsIntBe(1) != 0;
                        _bottom = m_io.ReadBitsIntBe(1) != 0;
                        _left = m_io.ReadBitsIntBe(1) != 0;
                        _horizontal = m_io.ReadBitsIntBe(1) != 0;
                    }
                    private ulong _unkn;
                    private bool _doublePass;
                    private bool _bottom;
                    private bool _left;
                    private bool _horizontal;
                    private NtMdt m_root;
                    private NtMdt.Frame.FdScanned.Vars m_parent;
                    public ulong Unkn { get { return _unkn; } }
                    public bool DoublePass { get { return _doublePass; } }

                    /// <summary>
                    /// Bottom - 1 Top - 0
                    /// </summary>
                    public bool Bottom { get { return _bottom; } }

                    /// <summary>
                    /// Left - 1 Right - 0
                    /// </summary>
                    public bool Left { get { return _left; } }

                    /// <summary>
                    /// Horizontal - 1 Vertical - 0
                    /// </summary>
                    public bool Horizontal { get { return _horizontal; } }
                    public NtMdt M_Root { get { return m_root; } }
                    public NtMdt.Frame.FdScanned.Vars M_Parent { get { return m_parent; } }
                }
                private Vars _vars;
                private uint? _origFormat;
                private LiftMode _tune;
                private double? _feedbackGain;
                private int? _dacScale;
                private int? _overscan;
                private ushort _fmMode;
                private ushort _fmXres;
                private ushort _fmYres;
                private Dots _dots;
                private List<short> _image;
                private Title _title;
                private Xml _xml;
                private NtMdt m_root;
                private NtMdt.Frame.FrameMain m_parent;
                private byte[] __raw_vars;
                public Vars Vars { get { return _vars; } }

                /// <summary>
                /// s_oem
                /// </summary>
                public uint? OrigFormat { get { return _origFormat; } }

                /// <summary>
                /// z_tune
                /// </summary>
                public LiftMode Tune { get { return _tune; } }

                /// <summary>
                /// s_fbg
                /// </summary>
                public double? FeedbackGain { get { return _feedbackGain; } }

                /// <summary>
                /// s_s
                /// </summary>
                public int? DacScale { get { return _dacScale; } }

                /// <summary>
                /// s_xov (in %)
                /// </summary>
                public int? Overscan { get { return _overscan; } }

                /// <summary>
                /// m_mode
                /// </summary>
                public ushort FmMode { get { return _fmMode; } }

                /// <summary>
                /// m_nx
                /// </summary>
                public ushort FmXres { get { return _fmXres; } }

                /// <summary>
                /// m_ny
                /// </summary>
                public ushort FmYres { get { return _fmYres; } }
                public Dots Dots { get { return _dots; } }
                public List<short> Image { get { return _image; } }
                public Title Title { get { return _title; } }
                public Xml Xml { get { return _xml; } }
                public NtMdt M_Root { get { return m_root; } }
                public NtMdt.Frame.FrameMain M_Parent { get { return m_parent; } }
                public byte[] M_RawVars { get { return __raw_vars; } }
            }
            private uint _size;
            private FrameMain _main;
            private NtMdt m_root;
            private NtMdt.Framez m_parent;
            private byte[] __raw_main;

            /// <summary>
            /// h_sz
            /// </summary>
            public uint Size { get { return _size; } }
            public FrameMain Main { get { return _main; } }
            public NtMdt M_Root { get { return m_root; } }
            public NtMdt.Framez M_Parent { get { return m_parent; } }
            public byte[] M_RawMain { get { return __raw_main; } }
        }
        public partial class Version : KaitaiStruct
        {
            public static Version FromFile(string fileName)
            {
                return new Version(new KaitaiStream(fileName));
            }

            public Version(KaitaiStream p__io, NtMdt.Frame.FrameMain p__parent = null, NtMdt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _minor = m_io.ReadU1();
                _major = m_io.ReadU1();
            }
            private byte _minor;
            private byte _major;
            private NtMdt m_root;
            private NtMdt.Frame.FrameMain m_parent;
            public byte Minor { get { return _minor; } }
            public byte Major { get { return _major; } }
            public NtMdt M_Root { get { return m_root; } }
            public NtMdt.Frame.FrameMain M_Parent { get { return m_parent; } }
        }
        public partial class Xml : KaitaiStruct
        {
            public static Xml FromFile(string fileName)
            {
                return new Xml(new KaitaiStream(fileName));
            }

            public Xml(KaitaiStream p__io, KaitaiStruct p__parent = null, NtMdt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _xmlLen = m_io.ReadU4le();
                _xml = System.Text.Encoding.GetEncoding("UTF-16LE").GetString(m_io.ReadBytes(XmlLen));
            }
            private uint _xmlLen;
            private string _xml;
            private NtMdt m_root;
            private KaitaiStruct m_parent;
            public uint XmlLen { get { return _xmlLen; } }
            public string Xml { get { return _xml; } }
            public NtMdt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Title : KaitaiStruct
        {
            public static Title FromFile(string fileName)
            {
                return new Title(new KaitaiStream(fileName));
            }

            public Title(KaitaiStream p__io, KaitaiStruct p__parent = null, NtMdt p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _titleLen = m_io.ReadU4le();
                _title = System.Text.Encoding.GetEncoding("cp1251").GetString(m_io.ReadBytes(TitleLen));
            }
            private uint _titleLen;
            private string _title;
            private NtMdt m_root;
            private KaitaiStruct m_parent;
            public uint TitleLen { get { return _titleLen; } }
            public string Title { get { return _title; } }
            public NtMdt M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        private byte[] _signature;
        private uint _size;
        private byte[] _reserved0;
        private ushort _lastFrame;
        private byte[] _reserved1;
        private byte[] _wrondDoc;
        private Framez _frames;
        private NtMdt m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_frames;
        public byte[] Signature { get { return _signature; } }

        /// <summary>
        /// File size (w/o header)
        /// </summary>
        public uint Size { get { return _size; } }
        public byte[] Reserved0 { get { return _reserved0; } }
        public ushort LastFrame { get { return _lastFrame; } }
        public byte[] Reserved1 { get { return _reserved1; } }

        /// <summary>
        /// documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
        /// </summary>
        public byte[] WrondDoc { get { return _wrondDoc; } }
        public Framez Frames { get { return _frames; } }
        public NtMdt M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawFrames { get { return __raw_frames; } }
    }
}
