// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// You can get a dump for testing from this link:
    /// &lt;https://github.com/zhovner/mfdread/raw/master/dump.mfd&gt;
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/nfc-tools/libnfc
    /// https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
    /// ">Source</a>
    /// </remarks>
    public partial class MifareClassic : KaitaiStruct
    {
        public static MifareClassic FromFile(string fileName)
        {
            return new MifareClassic(new KaitaiStream(fileName));
        }

        public MifareClassic(KaitaiStream p__io, KaitaiStruct p__parent = null, MifareClassic p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            __raw_sectors = new List<byte[]>();
            _sectors = new List<Sector>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    __raw_sectors.Add(m_io.ReadBytes(((i >= 32 ? 4 : 1) * 4) * 16));
                    var io___raw_sectors = new KaitaiStream(__raw_sectors[__raw_sectors.Count - 1]);
                    _sectors.Add(new Sector(i == 0, io___raw_sectors, this, m_root));
                    i++;
                }
            }
        }
        public partial class Key : KaitaiStruct
        {
            public static Key FromFile(string fileName)
            {
                return new Key(new KaitaiStream(fileName));
            }

            public Key(KaitaiStream p__io, MifareClassic.Trailer p__parent = null, MifareClassic p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _key = m_io.ReadBytes(6);
            }
            private byte[] _key;
            private MifareClassic m_root;
            private MifareClassic.Trailer m_parent;
            public byte[] Key { get { return _key; } }
            public MifareClassic M_Root { get { return m_root; } }
            public MifareClassic.Trailer M_Parent { get { return m_parent; } }
        }
        public partial class Manufacturer : KaitaiStruct
        {
            public static Manufacturer FromFile(string fileName)
            {
                return new Manufacturer(new KaitaiStream(fileName));
            }

            public Manufacturer(KaitaiStream p__io, MifareClassic.Sector p__parent = null, MifareClassic p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _nuid = m_io.ReadU4le();
                _bcc = m_io.ReadU1();
                _sak = m_io.ReadU1();
                _atqa = m_io.ReadU2le();
                _manufacturer = m_io.ReadBytes(8);
            }
            private uint _nuid;
            private byte _bcc;
            private byte _sak;
            private ushort _atqa;
            private byte[] _manufacturer;
            private MifareClassic m_root;
            private MifareClassic.Sector m_parent;

            /// <summary>
            /// beware for 7bytes UID it goes over next fields
            /// </summary>
            public uint Nuid { get { return _nuid; } }
            public byte Bcc { get { return _bcc; } }
            public byte Sak { get { return _sak; } }
            public ushort Atqa { get { return _atqa; } }

            /// <summary>
            /// may contain manufacture date as BCD
            /// </summary>
            public byte[] Manufacturer { get { return _manufacturer; } }
            public MifareClassic M_Root { get { return m_root; } }
            public MifareClassic.Sector M_Parent { get { return m_parent; } }
        }
        public partial class Sector : KaitaiStruct
        {
            public Sector(bool p_hasManufacturer, KaitaiStream p__io, MifareClassic p__parent = null, MifareClassic p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _hasManufacturer = p_hasManufacturer;
                f_blockSize = false;
                f_blocks = false;
                f_data = false;
                f_values = false;
                _read();
            }
            private void _read()
            {
                if (HasManufacturer) {
                    _manufacturer = new Manufacturer(m_io, this, m_root);
                }
                __raw_dataFiller = m_io.ReadBytes((M_Io.Size - M_Io.Pos) - 16);
                var io___raw_dataFiller = new KaitaiStream(__raw_dataFiller);
                _dataFiller = new Filler(io___raw_dataFiller, this, m_root);
                _trailer = new Trailer(m_io, this, m_root);
            }

            /// <summary>
            /// only to create _io
            /// </summary>
            public partial class Filler : KaitaiStruct
            {
                public static Filler FromFile(string fileName)
                {
                    return new Filler(new KaitaiStream(fileName));
                }

                public Filler(KaitaiStream p__io, MifareClassic.Sector p__parent = null, MifareClassic p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _data = m_io.ReadBytes(M_Io.Size);
                }
                private byte[] _data;
                private MifareClassic m_root;
                private MifareClassic.Sector m_parent;
                public byte[] Data { get { return _data; } }
                public MifareClassic M_Root { get { return m_root; } }
                public MifareClassic.Sector M_Parent { get { return m_parent; } }
            }
            public partial class Values : KaitaiStruct
            {
                public static Values FromFile(string fileName)
                {
                    return new Values(new KaitaiStream(fileName));
                }

                public Values(KaitaiStream p__io, MifareClassic.Sector p__parent = null, MifareClassic p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _values = new List<ValueBlock>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _values.Add(new ValueBlock(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                public partial class ValueBlock : KaitaiStruct
                {
                    public static ValueBlock FromFile(string fileName)
                    {
                        return new ValueBlock(new KaitaiStream(fileName));
                    }

                    public ValueBlock(KaitaiStream p__io, MifareClassic.Sector.Values p__parent = null, MifareClassic p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_addr = false;
                        f_addrValid = false;
                        f_valid = false;
                        f_value = false;
                        f_valueValid = false;
                        _read();
                    }
                    private void _read()
                    {
                        _valuez = new List<uint>();
                        for (var i = 0; i < 3; i++)
                        {
                            _valuez.Add(m_io.ReadU4le());
                        }
                        _addrz = new List<byte>();
                        for (var i = 0; i < 4; i++)
                        {
                            _addrz.Add(m_io.ReadU1());
                        }
                    }
                    private bool f_addr;
                    private byte? _addr;
                    public byte? Addr
                    {
                        get
                        {
                            if (f_addr)
                                return _addr;
                            f_addr = true;
                            if (Valid) {
                                _addr = (byte) (Addrz[0]);
                            }
                            return _addr;
                        }
                    }
                    private bool f_addrValid;
                    private bool _addrValid;
                    public bool AddrValid
                    {
                        get
                        {
                            if (f_addrValid)
                                return _addrValid;
                            f_addrValid = true;
                            _addrValid = (bool) ( ((Addrz[0] == ~(Addrz[1])) && (Addrz[0] == Addrz[2]) && (Addrz[1] == Addrz[3])) );
                            return _addrValid;
                        }
                    }
                    private bool f_valid;
                    private bool _valid;
                    public bool Valid
                    {
                        get
                        {
                            if (f_valid)
                                return _valid;
                            f_valid = true;
                            _valid = (bool) ( ((ValueValid) && (AddrValid)) );
                            return _valid;
                        }
                    }
                    private bool f_value;
                    private uint? _value;
                    public uint? Value
                    {
                        get
                        {
                            if (f_value)
                                return _value;
                            f_value = true;
                            if (Valid) {
                                _value = (uint) (Valuez[0]);
                            }
                            return _value;
                        }
                    }
                    private bool f_valueValid;
                    private bool _valueValid;
                    public bool ValueValid
                    {
                        get
                        {
                            if (f_valueValid)
                                return _valueValid;
                            f_valueValid = true;
                            _valueValid = (bool) ( ((Valuez[0] == ~(Valuez[1])) && (Valuez[0] == Valuez[2])) );
                            return _valueValid;
                        }
                    }
                    private List<uint> _valuez;
                    private List<byte> _addrz;
                    private MifareClassic m_root;
                    private MifareClassic.Sector.Values m_parent;
                    public List<uint> Valuez { get { return _valuez; } }
                    public List<byte> Addrz { get { return _addrz; } }
                    public MifareClassic M_Root { get { return m_root; } }
                    public MifareClassic.Sector.Values M_Parent { get { return m_parent; } }
                }
                private List<ValueBlock> _values;
                private MifareClassic m_root;
                private MifareClassic.Sector m_parent;
                public List<ValueBlock> Values { get { return _values; } }
                public MifareClassic M_Root { get { return m_root; } }
                public MifareClassic.Sector M_Parent { get { return m_parent; } }
            }
            private bool f_blockSize;
            private sbyte _blockSize;
            public sbyte BlockSize
            {
                get
                {
                    if (f_blockSize)
                        return _blockSize;
                    f_blockSize = true;
                    _blockSize = (sbyte) (16);
                    return _blockSize;
                }
            }
            private bool f_blocks;
            private List<byte[]> _blocks;
            public List<byte[]> Blocks
            {
                get
                {
                    if (f_blocks)
                        return _blocks;
                    f_blocks = true;
                    KaitaiStream io = DataFiller.M_Io;
                    long _pos = io.Pos;
                    io.Seek(0);
                    _blocks = new List<byte[]>();
                    {
                        var i = 0;
                        while (!io.IsEof) {
                            _blocks.Add(io.ReadBytes(BlockSize));
                            i++;
                        }
                    }
                    io.Seek(_pos);
                    return _blocks;
                }
            }
            private bool f_data;
            private byte[] _data;
            public byte[] Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    f_data = true;
                    _data = (byte[]) (DataFiller.Data);
                    return _data;
                }
            }
            private bool f_values;
            private Values _values;
            public Values Values
            {
                get
                {
                    if (f_values)
                        return _values;
                    f_values = true;
                    KaitaiStream io = DataFiller.M_Io;
                    long _pos = io.Pos;
                    io.Seek(0);
                    _values = new Values(io, this, m_root);
                    io.Seek(_pos);
                    return _values;
                }
            }
            private Manufacturer _manufacturer;
            private Filler _dataFiller;
            private Trailer _trailer;
            private bool _hasManufacturer;
            private MifareClassic m_root;
            private MifareClassic m_parent;
            private byte[] __raw_dataFiller;
            public Manufacturer Manufacturer { get { return _manufacturer; } }
            public Filler DataFiller { get { return _dataFiller; } }
            public Trailer Trailer { get { return _trailer; } }
            public bool HasManufacturer { get { return _hasManufacturer; } }
            public MifareClassic M_Root { get { return m_root; } }
            public MifareClassic M_Parent { get { return m_parent; } }
            public byte[] M_RawDataFiller { get { return __raw_dataFiller; } }
        }
        public partial class Trailer : KaitaiStruct
        {
            public static Trailer FromFile(string fileName)
            {
                return new Trailer(new KaitaiStream(fileName));
            }

            public Trailer(KaitaiStream p__io, MifareClassic.Sector p__parent = null, MifareClassic p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_acBits = false;
                f_acCountOfChunks = false;
                f_acsInSector = false;
                _read();
            }
            private void _read()
            {
                _keyA = new Key(m_io, this, m_root);
                __raw_accessBits = m_io.ReadBytes(3);
                var io___raw_accessBits = new KaitaiStream(__raw_accessBits);
                _accessBits = new AccessConditions(io___raw_accessBits, this, m_root);
                _userByte = m_io.ReadU1();
                _keyB = new Key(m_io, this, m_root);
            }
            public partial class AccessConditions : KaitaiStruct
            {
                public static AccessConditions FromFile(string fileName)
                {
                    return new AccessConditions(new KaitaiStream(fileName));
                }

                public AccessConditions(KaitaiStream p__io, MifareClassic.Trailer p__parent = null, MifareClassic p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_acsRaw = false;
                    f_chunks = false;
                    f_dataAcs = false;
                    f_remaps = false;
                    f_trailerAc = false;
                    _read();
                }
                private void _read()
                {
                    _rawChunks = new List<ulong>();
                    for (var i = 0; i < M_Parent.AcCountOfChunks; i++)
                    {
                        _rawChunks.Add(m_io.ReadBitsIntBe(4));
                    }
                }
                public partial class Ac : KaitaiStruct
                {
                    public Ac(byte p_index, KaitaiStream p__io, MifareClassic.Trailer.AccessConditions p__parent = null, MifareClassic p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _index = p_index;
                        f_bits = false;
                        f_invShiftVal = false;
                        f_val = false;
                        _read();
                    }
                    private void _read()
                    {
                    }
                    public partial class AcBit : KaitaiStruct
                    {
                        public AcBit(byte p_i, byte p_chunk, KaitaiStream p__io, MifareClassic.Trailer.AccessConditions.Ac p__parent = null, MifareClassic p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _i = p_i;
                            _chunk = p_chunk;
                            f_b = false;
                            f_n = false;
                            _read();
                        }
                        private void _read()
                        {
                        }
                        private bool f_b;
                        private bool _b;
                        public bool B
                        {
                            get
                            {
                                if (f_b)
                                    return _b;
                                f_b = true;
                                _b = (bool) (N == 1);
                                return _b;
                            }
                        }
                        private bool f_n;
                        private int _n;
                        public int N
                        {
                            get
                            {
                                if (f_n)
                                    return _n;
                                f_n = true;
                                _n = (int) (Chunk >> I & 1);
                                return _n;
                            }
                        }
                        private byte _i;
                        private byte _chunk;
                        private MifareClassic m_root;
                        private MifareClassic.Trailer.AccessConditions.Ac m_parent;
                        public byte I { get { return _i; } }
                        public byte Chunk { get { return _chunk; } }
                        public MifareClassic M_Root { get { return m_root; } }
                        public MifareClassic.Trailer.AccessConditions.Ac M_Parent { get { return m_parent; } }
                    }
                    private bool f_bits;
                    private List<AcBit> _bits;
                    public List<AcBit> Bits
                    {
                        get
                        {
                            if (f_bits)
                                return _bits;
                            f_bits = true;
                            long _pos = m_io.Pos;
                            m_io.Seek(0);
                            _bits = new List<AcBit>();
                            for (var i = 0; i < M_Parent.M_Parent.AcBits; i++)
                            {
                                _bits.Add(new AcBit(Index, M_Parent.Chunks[i].Chunk, m_io, this, m_root));
                            }
                            m_io.Seek(_pos);
                            return _bits;
                        }
                    }
                    private bool f_invShiftVal;
                    private int _invShiftVal;
                    public int InvShiftVal
                    {
                        get
                        {
                            if (f_invShiftVal)
                                return _invShiftVal;
                            f_invShiftVal = true;
                            _invShiftVal = (int) ((Bits[0].N << 2 | Bits[1].N << 1) | Bits[2].N);
                            return _invShiftVal;
                        }
                    }
                    private bool f_val;
                    private int _val;

                    /// <summary>
                    /// c3 c2 c1
                    /// </summary>
                    public int Val
                    {
                        get
                        {
                            if (f_val)
                                return _val;
                            f_val = true;
                            _val = (int) ((Bits[2].N << 2 | Bits[1].N << 1) | Bits[0].N);
                            return _val;
                        }
                    }
                    private byte _index;
                    private MifareClassic m_root;
                    private MifareClassic.Trailer.AccessConditions m_parent;
                    public byte Index { get { return _index; } }
                    public MifareClassic M_Root { get { return m_root; } }
                    public MifareClassic.Trailer.AccessConditions M_Parent { get { return m_parent; } }
                }
                public partial class ChunkBitRemap : KaitaiStruct
                {
                    public ChunkBitRemap(byte p_bitNo, KaitaiStream p__io, MifareClassic.Trailer.AccessConditions p__parent = null, MifareClassic p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _bitNo = p_bitNo;
                        f_chunkNo = false;
                        f_invChunkNo = false;
                        f_shiftValue = false;
                        _read();
                    }
                    private void _read()
                    {
                    }
                    private bool f_chunkNo;
                    private int _chunkNo;
                    public int ChunkNo
                    {
                        get
                        {
                            if (f_chunkNo)
                                return _chunkNo;
                            f_chunkNo = true;
                            _chunkNo = (int) (KaitaiStream.Mod((InvChunkNo + ShiftValue) + M_Parent.M_Parent.AcCountOfChunks, M_Parent.M_Parent.AcCountOfChunks));
                            return _chunkNo;
                        }
                    }
                    private bool f_invChunkNo;
                    private int _invChunkNo;
                    public int InvChunkNo
                    {
                        get
                        {
                            if (f_invChunkNo)
                                return _invChunkNo;
                            f_invChunkNo = true;
                            _invChunkNo = (int) (BitNo + ShiftValue);
                            return _invChunkNo;
                        }
                    }
                    private bool f_shiftValue;
                    private int _shiftValue;
                    public int ShiftValue
                    {
                        get
                        {
                            if (f_shiftValue)
                                return _shiftValue;
                            f_shiftValue = true;
                            _shiftValue = (int) ((BitNo == 1 ? -1 : 1));
                            return _shiftValue;
                        }
                    }
                    private byte _bitNo;
                    private MifareClassic m_root;
                    private MifareClassic.Trailer.AccessConditions m_parent;
                    public byte BitNo { get { return _bitNo; } }
                    public MifareClassic M_Root { get { return m_root; } }
                    public MifareClassic.Trailer.AccessConditions M_Parent { get { return m_parent; } }
                }
                public partial class DataAc : KaitaiStruct
                {
                    public DataAc(Ac p_ac, KaitaiStream p__io, MifareClassic.Trailer.AccessConditions p__parent = null, MifareClassic p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _ac = p_ac;
                        f_decrementAvailable = false;
                        f_incrementAvailable = false;
                        f_readKeyARequired = false;
                        f_readKeyBRequired = false;
                        f_writeKeyARequired = false;
                        f_writeKeyBRequired = false;
                        _read();
                    }
                    private void _read()
                    {
                    }
                    private bool f_decrementAvailable;
                    private bool _decrementAvailable;
                    public bool DecrementAvailable
                    {
                        get
                        {
                            if (f_decrementAvailable)
                                return _decrementAvailable;
                            f_decrementAvailable = true;
                            _decrementAvailable = (bool) ( (( ((Ac.Bits[1].B) || (!(Ac.Bits[0].B))) ) && (!(Ac.Bits[2].B))) );
                            return _decrementAvailable;
                        }
                    }
                    private bool f_incrementAvailable;
                    private bool _incrementAvailable;
                    public bool IncrementAvailable
                    {
                        get
                        {
                            if (f_incrementAvailable)
                                return _incrementAvailable;
                            f_incrementAvailable = true;
                            _incrementAvailable = (bool) ( (( ((!(Ac.Bits[0].B)) && (!(ReadKeyARequired)) && (!(ReadKeyBRequired))) ) || ( ((!(Ac.Bits[0].B)) && (ReadKeyARequired) && (ReadKeyBRequired)) )) );
                            return _incrementAvailable;
                        }
                    }
                    private bool f_readKeyARequired;
                    private bool _readKeyARequired;
                    public bool ReadKeyARequired
                    {
                        get
                        {
                            if (f_readKeyARequired)
                                return _readKeyARequired;
                            f_readKeyARequired = true;
                            _readKeyARequired = (bool) (Ac.Val <= 4);
                            return _readKeyARequired;
                        }
                    }
                    private bool f_readKeyBRequired;
                    private bool _readKeyBRequired;
                    public bool ReadKeyBRequired
                    {
                        get
                        {
                            if (f_readKeyBRequired)
                                return _readKeyBRequired;
                            f_readKeyBRequired = true;
                            _readKeyBRequired = (bool) (Ac.Val <= 6);
                            return _readKeyBRequired;
                        }
                    }
                    private bool f_writeKeyARequired;
                    private bool _writeKeyARequired;
                    public bool WriteKeyARequired
                    {
                        get
                        {
                            if (f_writeKeyARequired)
                                return _writeKeyARequired;
                            f_writeKeyARequired = true;
                            _writeKeyARequired = (bool) (Ac.Val == 0);
                            return _writeKeyARequired;
                        }
                    }
                    private bool f_writeKeyBRequired;
                    private bool _writeKeyBRequired;
                    public bool WriteKeyBRequired
                    {
                        get
                        {
                            if (f_writeKeyBRequired)
                                return _writeKeyBRequired;
                            f_writeKeyBRequired = true;
                            _writeKeyBRequired = (bool) ( (( ((!(ReadKeyARequired)) || (ReadKeyBRequired)) ) && (!(Ac.Bits[0].B))) );
                            return _writeKeyBRequired;
                        }
                    }
                    private Ac _ac;
                    private MifareClassic m_root;
                    private MifareClassic.Trailer.AccessConditions m_parent;
                    public Ac Ac { get { return _ac; } }
                    public MifareClassic M_Root { get { return m_root; } }
                    public MifareClassic.Trailer.AccessConditions M_Parent { get { return m_parent; } }
                }
                public partial class TrailerAc : KaitaiStruct
                {
                    public TrailerAc(Ac p_ac, KaitaiStream p__io, MifareClassic.Trailer.AccessConditions p__parent = null, MifareClassic p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _ac = p_ac;
                        f_canReadKeyB = false;
                        f_canWriteAccessBits = false;
                        f_canWriteKeys = false;
                        f_keyBControlsWrite = false;
                        _read();
                    }
                    private void _read()
                    {
                    }
                    private bool f_canReadKeyB;
                    private bool _canReadKeyB;

                    /// <summary>
                    /// key A is required
                    /// </summary>
                    public bool CanReadKeyB
                    {
                        get
                        {
                            if (f_canReadKeyB)
                                return _canReadKeyB;
                            f_canReadKeyB = true;
                            _canReadKeyB = (bool) (Ac.InvShiftVal <= 2);
                            return _canReadKeyB;
                        }
                    }
                    private bool f_canWriteAccessBits;
                    private bool _canWriteAccessBits;
                    public bool CanWriteAccessBits
                    {
                        get
                        {
                            if (f_canWriteAccessBits)
                                return _canWriteAccessBits;
                            f_canWriteAccessBits = true;
                            _canWriteAccessBits = (bool) (Ac.Bits[2].B);
                            return _canWriteAccessBits;
                        }
                    }
                    private bool f_canWriteKeys;
                    private bool _canWriteKeys;
                    public bool CanWriteKeys
                    {
                        get
                        {
                            if (f_canWriteKeys)
                                return _canWriteKeys;
                            f_canWriteKeys = true;
                            _canWriteKeys = (bool) ( ((KaitaiStream.Mod(Ac.InvShiftVal + 1, 3) != 0) && (Ac.InvShiftVal < 6)) );
                            return _canWriteKeys;
                        }
                    }
                    private bool f_keyBControlsWrite;
                    private bool _keyBControlsWrite;
                    public bool KeyBControlsWrite
                    {
                        get
                        {
                            if (f_keyBControlsWrite)
                                return _keyBControlsWrite;
                            f_keyBControlsWrite = true;
                            _keyBControlsWrite = (bool) (!(CanReadKeyB));
                            return _keyBControlsWrite;
                        }
                    }
                    private Ac _ac;
                    private MifareClassic m_root;
                    private MifareClassic.Trailer.AccessConditions m_parent;
                    public Ac Ac { get { return _ac; } }
                    public MifareClassic M_Root { get { return m_root; } }
                    public MifareClassic.Trailer.AccessConditions M_Parent { get { return m_parent; } }
                }
                public partial class ValidChunk : KaitaiStruct
                {
                    public ValidChunk(byte p_invChunk, byte p_chunk, KaitaiStream p__io, MifareClassic.Trailer.AccessConditions p__parent = null, MifareClassic p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _invChunk = p_invChunk;
                        _chunk = p_chunk;
                        f_valid = false;
                        _read();
                    }
                    private void _read()
                    {
                    }
                    private bool f_valid;
                    private bool _valid;
                    public bool Valid
                    {
                        get
                        {
                            if (f_valid)
                                return _valid;
                            f_valid = true;
                            _valid = (bool) ((InvChunk ^ Chunk) == 15);
                            return _valid;
                        }
                    }
                    private byte _invChunk;
                    private byte _chunk;
                    private MifareClassic m_root;
                    private MifareClassic.Trailer.AccessConditions m_parent;
                    public byte InvChunk { get { return _invChunk; } }

                    /// <summary>
                    /// c3 c2 c1 c0
                    /// </summary>
                    public byte Chunk { get { return _chunk; } }
                    public MifareClassic M_Root { get { return m_root; } }
                    public MifareClassic.Trailer.AccessConditions M_Parent { get { return m_parent; } }
                }
                private bool f_acsRaw;
                private List<Ac> _acsRaw;
                public List<Ac> AcsRaw
                {
                    get
                    {
                        if (f_acsRaw)
                            return _acsRaw;
                        f_acsRaw = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _acsRaw = new List<Ac>();
                        for (var i = 0; i < M_Parent.AcsInSector; i++)
                        {
                            _acsRaw.Add(new Ac(i, m_io, this, m_root));
                        }
                        m_io.Seek(_pos);
                        return _acsRaw;
                    }
                }
                private bool f_chunks;
                private List<ValidChunk> _chunks;
                public List<ValidChunk> Chunks
                {
                    get
                    {
                        if (f_chunks)
                            return _chunks;
                        f_chunks = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _chunks = new List<ValidChunk>();
                        for (var i = 0; i < M_Parent.AcBits; i++)
                        {
                            _chunks.Add(new ValidChunk(RawChunks[Remaps[i].InvChunkNo], RawChunks[Remaps[i].ChunkNo], m_io, this, m_root));
                        }
                        m_io.Seek(_pos);
                        return _chunks;
                    }
                }
                private bool f_dataAcs;
                private List<DataAc> _dataAcs;
                public List<DataAc> DataAcs
                {
                    get
                    {
                        if (f_dataAcs)
                            return _dataAcs;
                        f_dataAcs = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _dataAcs = new List<DataAc>();
                        for (var i = 0; i < M_Parent.AcsInSector - 1; i++)
                        {
                            _dataAcs.Add(new DataAc(AcsRaw[i], m_io, this, m_root));
                        }
                        m_io.Seek(_pos);
                        return _dataAcs;
                    }
                }
                private bool f_remaps;
                private List<ChunkBitRemap> _remaps;
                public List<ChunkBitRemap> Remaps
                {
                    get
                    {
                        if (f_remaps)
                            return _remaps;
                        f_remaps = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _remaps = new List<ChunkBitRemap>();
                        for (var i = 0; i < M_Parent.AcBits; i++)
                        {
                            _remaps.Add(new ChunkBitRemap(i, m_io, this, m_root));
                        }
                        m_io.Seek(_pos);
                        return _remaps;
                    }
                }
                private bool f_trailerAc;
                private TrailerAc _trailerAc;
                public TrailerAc TrailerAc
                {
                    get
                    {
                        if (f_trailerAc)
                            return _trailerAc;
                        f_trailerAc = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _trailerAc = new TrailerAc(AcsRaw[M_Parent.AcsInSector - 1], m_io, this, m_root);
                        m_io.Seek(_pos);
                        return _trailerAc;
                    }
                }
                private List<ulong> _rawChunks;
                private MifareClassic m_root;
                private MifareClassic.Trailer m_parent;
                public List<ulong> RawChunks { get { return _rawChunks; } }
                public MifareClassic M_Root { get { return m_root; } }
                public MifareClassic.Trailer M_Parent { get { return m_parent; } }
            }
            private bool f_acBits;
            private sbyte _acBits;
            public sbyte AcBits
            {
                get
                {
                    if (f_acBits)
                        return _acBits;
                    f_acBits = true;
                    _acBits = (sbyte) (3);
                    return _acBits;
                }
            }
            private bool f_acCountOfChunks;
            private int _acCountOfChunks;
            public int AcCountOfChunks
            {
                get
                {
                    if (f_acCountOfChunks)
                        return _acCountOfChunks;
                    f_acCountOfChunks = true;
                    _acCountOfChunks = (int) (AcBits * 2);
                    return _acCountOfChunks;
                }
            }
            private bool f_acsInSector;
            private sbyte _acsInSector;
            public sbyte AcsInSector
            {
                get
                {
                    if (f_acsInSector)
                        return _acsInSector;
                    f_acsInSector = true;
                    _acsInSector = (sbyte) (4);
                    return _acsInSector;
                }
            }
            private Key _keyA;
            private AccessConditions _accessBits;
            private byte _userByte;
            private Key _keyB;
            private MifareClassic m_root;
            private MifareClassic.Sector m_parent;
            private byte[] __raw_accessBits;
            public Key KeyA { get { return _keyA; } }
            public AccessConditions AccessBits { get { return _accessBits; } }
            public byte UserByte { get { return _userByte; } }
            public Key KeyB { get { return _keyB; } }
            public MifareClassic M_Root { get { return m_root; } }
            public MifareClassic.Sector M_Parent { get { return m_parent; } }
            public byte[] M_RawAccessBits { get { return __raw_accessBits; } }
        }
        private List<Sector> _sectors;
        private MifareClassic m_root;
        private KaitaiStruct m_parent;
        private List<byte[]> __raw_sectors;
        public List<Sector> Sectors { get { return _sectors; } }
        public MifareClassic M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public List<byte[]> M_RawSectors { get { return __raw_sectors; } }
    }
}
