// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Windows MiniDump (MDMP) file provides a concise way to store process
    /// core dumps, which is useful for debugging. Given its small size,
    /// modularity, some cross-platform features and native support in some
    /// debuggers, it is particularly useful for crash reporting, and is
    /// used for that purpose in Windows and Google Chrome projects.
    /// 
    /// The file itself is a container, which contains a number of typed
    /// &quot;streams&quot;, which contain some data according to its type attribute.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680378(VS.85).aspx">Source</a>
    /// </remarks>
    public partial class WindowsMinidump : KaitaiStruct
    {
        public static WindowsMinidump FromFile(string fileName)
        {
            return new WindowsMinidump(new KaitaiStream(fileName));
        }


        public enum StreamTypes
        {
            Unused = 0,
            Reserved0 = 1,
            Reserved1 = 2,
            ThreadList = 3,
            ModuleList = 4,
            MemoryList = 5,
            Exception = 6,
            SystemInfo = 7,
            ThreadExList = 8,
            Memory64List = 9,
            CommentA = 10,
            CommentW = 11,
            HandleData = 12,
            FunctionTable = 13,
            UnloadedModuleList = 14,
            MiscInfo = 15,
            MemoryInfoList = 16,
            ThreadInfoList = 17,
            HandleOperationList = 18,
        }
        public WindowsMinidump(KaitaiStream p__io, KaitaiStruct p__parent = null, WindowsMinidump p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_streams = false;
            _read();
        }
        private void _read()
        {
            _magic1 = m_io.EnsureFixedContents(new byte[] { 77, 68, 77, 80 });
            _magic2 = m_io.EnsureFixedContents(new byte[] { 147, 167 });
            _version = m_io.ReadU2le();
            _numStreams = m_io.ReadU4le();
            _ofsStreams = m_io.ReadU4le();
            _checksum = m_io.ReadU4le();
            _timestamp = m_io.ReadU4le();
            _flags = m_io.ReadU8le();
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680515(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class ThreadList : KaitaiStruct
        {
            public static ThreadList FromFile(string fileName)
            {
                return new ThreadList(new KaitaiStream(fileName));
            }

            public ThreadList(KaitaiStream p__io, WindowsMinidump.Dir p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numThreads = m_io.ReadU4le();
                _threads = new List<Thread>((int) (NumThreads));
                for (var i = 0; i < NumThreads; i++)
                {
                    _threads.Add(new Thread(m_io, this, m_root));
                }
            }
            private uint _numThreads;
            private List<Thread> _threads;
            private WindowsMinidump m_root;
            private WindowsMinidump.Dir m_parent;
            public uint NumThreads { get { return _numThreads; } }
            public List<Thread> Threads { get { return _threads; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump.Dir M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680383(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class LocationDescriptor : KaitaiStruct
        {
            public static LocationDescriptor FromFile(string fileName)
            {
                return new LocationDescriptor(new KaitaiStream(fileName));
            }

            public LocationDescriptor(KaitaiStream p__io, KaitaiStruct p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_data = false;
                _read();
            }
            private void _read()
            {
                _lenData = m_io.ReadU4le();
                _ofsData = m_io.ReadU4le();
            }
            private bool f_data;
            private byte[] _data;
            public byte[] Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsData);
                    _data = io.ReadBytes(LenData);
                    io.Seek(_pos);
                    f_data = true;
                    return _data;
                }
            }
            private uint _lenData;
            private uint _ofsData;
            private WindowsMinidump m_root;
            private KaitaiStruct m_parent;
            public uint LenData { get { return _lenData; } }
            public uint OfsData { get { return _ofsData; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Specific string serialization scheme used in MiniDump format is
        /// actually a simple 32-bit length-prefixed UTF-16 string.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680395(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class MinidumpString : KaitaiStruct
        {
            public static MinidumpString FromFile(string fileName)
            {
                return new MinidumpString(new KaitaiStream(fileName));
            }

            public MinidumpString(KaitaiStream p__io, WindowsMinidump.SystemInfo p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenStr = m_io.ReadU4le();
                _str = System.Text.Encoding.GetEncoding("UTF-16LE").GetString(m_io.ReadBytes(LenStr));
            }
            private uint _lenStr;
            private string _str;
            private WindowsMinidump m_root;
            private WindowsMinidump.SystemInfo m_parent;
            public uint LenStr { get { return _lenStr; } }
            public string Str { get { return _str; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump.SystemInfo M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// &quot;System info&quot; stream provides basic information about the
        /// hardware and operating system which produces this dump.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680396(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class SystemInfo : KaitaiStruct
        {
            public static SystemInfo FromFile(string fileName)
            {
                return new SystemInfo(new KaitaiStream(fileName));
            }


            public enum CpuArchs
            {
                Intel = 0,
                Arm = 5,
                Ia64 = 6,
                Amd64 = 9,
                Unknown = 65535,
            }
            public SystemInfo(KaitaiStream p__io, WindowsMinidump.Dir p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_servicePack = false;
                _read();
            }
            private void _read()
            {
                _cpuArch = ((CpuArchs) m_io.ReadU2le());
                _cpuLevel = m_io.ReadU2le();
                _cpuRevision = m_io.ReadU2le();
                _numCpus = m_io.ReadU1();
                _osType = m_io.ReadU1();
                _osVerMajor = m_io.ReadU4le();
                _osVerMinor = m_io.ReadU4le();
                _osBuild = m_io.ReadU4le();
                _osPlatform = m_io.ReadU4le();
                _ofsServicePack = m_io.ReadU4le();
                _osSuiteMask = m_io.ReadU2le();
                _reserved2 = m_io.ReadU2le();
            }
            private bool f_servicePack;
            private MinidumpString _servicePack;
            public MinidumpString ServicePack
            {
                get
                {
                    if (f_servicePack)
                        return _servicePack;
                    if (OfsServicePack > 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsServicePack);
                        _servicePack = new MinidumpString(io, this, m_root);
                        io.Seek(_pos);
                    }
                    f_servicePack = true;
                    return _servicePack;
                }
            }
            private CpuArchs _cpuArch;
            private ushort _cpuLevel;
            private ushort _cpuRevision;
            private byte _numCpus;
            private byte _osType;
            private uint _osVerMajor;
            private uint _osVerMinor;
            private uint _osBuild;
            private uint _osPlatform;
            private uint _ofsServicePack;
            private ushort _osSuiteMask;
            private ushort _reserved2;
            private WindowsMinidump m_root;
            private WindowsMinidump.Dir m_parent;
            public CpuArchs CpuArch { get { return _cpuArch; } }
            public ushort CpuLevel { get { return _cpuLevel; } }
            public ushort CpuRevision { get { return _cpuRevision; } }
            public byte NumCpus { get { return _numCpus; } }
            public byte OsType { get { return _osType; } }
            public uint OsVerMajor { get { return _osVerMajor; } }
            public uint OsVerMinor { get { return _osVerMinor; } }
            public uint OsBuild { get { return _osBuild; } }
            public uint OsPlatform { get { return _osPlatform; } }
            public uint OfsServicePack { get { return _ofsServicePack; } }
            public ushort OsSuiteMask { get { return _osSuiteMask; } }
            public ushort Reserved2 { get { return _reserved2; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump.Dir M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680367(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class ExceptionRecord : KaitaiStruct
        {
            public static ExceptionRecord FromFile(string fileName)
            {
                return new ExceptionRecord(new KaitaiStream(fileName));
            }

            public ExceptionRecord(KaitaiStream p__io, WindowsMinidump.ExceptionStream p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _code = m_io.ReadU4le();
                _flags = m_io.ReadU4le();
                _innerException = m_io.ReadU8le();
                _addr = m_io.ReadU8le();
                _numParams = m_io.ReadU4le();
                _reserved = m_io.ReadU4le();
                _params = new List<ulong>((int) (15));
                for (var i = 0; i < 15; i++)
                {
                    _params.Add(m_io.ReadU8le());
                }
            }
            private uint _code;
            private uint _flags;
            private ulong _innerException;
            private ulong _addr;
            private uint _numParams;
            private uint _reserved;
            private List<ulong> _params;
            private WindowsMinidump m_root;
            private WindowsMinidump.ExceptionStream m_parent;
            public uint Code { get { return _code; } }
            public uint Flags { get { return _flags; } }
            public ulong InnerException { get { return _innerException; } }

            /// <summary>
            /// Memory address where exception has occurred
            /// </summary>
            public ulong Addr { get { return _addr; } }
            public uint NumParams { get { return _numParams; } }
            public uint Reserved { get { return _reserved; } }

            /// <summary>
            /// Additional parameters passed along with exception raise
            /// function (for WinAPI, that is `RaiseException`). Meaning is
            /// exception-specific. Given that this type is originally
            /// defined by a C structure, it is described there as array of
            /// fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
            /// 15), but in reality only first `num_params` would be used.
            /// </summary>
            public List<ulong> Params { get { return _params; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump.ExceptionStream M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680389(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class MiscInfo : KaitaiStruct
        {
            public static MiscInfo FromFile(string fileName)
            {
                return new MiscInfo(new KaitaiStream(fileName));
            }

            public MiscInfo(KaitaiStream p__io, WindowsMinidump.Dir p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenInfo = m_io.ReadU4le();
                _flags1 = m_io.ReadU4le();
                _processId = m_io.ReadU4le();
                _processCreateTime = m_io.ReadU4le();
                _processUserTime = m_io.ReadU4le();
                _processKernelTime = m_io.ReadU4le();
                _cpuMaxMhz = m_io.ReadU4le();
                _cpuCurMhz = m_io.ReadU4le();
                _cpuLimitMhz = m_io.ReadU4le();
                _cpuMaxIdleState = m_io.ReadU4le();
                _cpuCurIdleState = m_io.ReadU4le();
            }
            private uint _lenInfo;
            private uint _flags1;
            private uint _processId;
            private uint _processCreateTime;
            private uint _processUserTime;
            private uint _processKernelTime;
            private uint _cpuMaxMhz;
            private uint _cpuCurMhz;
            private uint _cpuLimitMhz;
            private uint _cpuMaxIdleState;
            private uint _cpuCurIdleState;
            private WindowsMinidump m_root;
            private WindowsMinidump.Dir m_parent;
            public uint LenInfo { get { return _lenInfo; } }
            public uint Flags1 { get { return _flags1; } }
            public uint ProcessId { get { return _processId; } }
            public uint ProcessCreateTime { get { return _processCreateTime; } }
            public uint ProcessUserTime { get { return _processUserTime; } }
            public uint ProcessKernelTime { get { return _processKernelTime; } }
            public uint CpuMaxMhz { get { return _cpuMaxMhz; } }
            public uint CpuCurMhz { get { return _cpuCurMhz; } }
            public uint CpuLimitMhz { get { return _cpuLimitMhz; } }
            public uint CpuMaxIdleState { get { return _cpuMaxIdleState; } }
            public uint CpuCurIdleState { get { return _cpuCurIdleState; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump.Dir M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680365(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class Dir : KaitaiStruct
        {
            public static Dir FromFile(string fileName)
            {
                return new Dir(new KaitaiStream(fileName));
            }

            public Dir(KaitaiStream p__io, WindowsMinidump p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_data = false;
                _read();
            }
            private void _read()
            {
                _streamType = ((WindowsMinidump.StreamTypes) m_io.ReadU4le());
                _lenData = m_io.ReadU4le();
                _ofsData = m_io.ReadU4le();
            }
            private bool f_data;
            private object _data;
            public object Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsData);
                    switch (StreamType) {
                    case WindowsMinidump.StreamTypes.MemoryList: {
                        __raw_data = m_io.ReadBytes(LenData);
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new MemoryList(io___raw_data, this, m_root);
                        break;
                    }
                    case WindowsMinidump.StreamTypes.MiscInfo: {
                        __raw_data = m_io.ReadBytes(LenData);
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new MiscInfo(io___raw_data, this, m_root);
                        break;
                    }
                    case WindowsMinidump.StreamTypes.ThreadList: {
                        __raw_data = m_io.ReadBytes(LenData);
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new ThreadList(io___raw_data, this, m_root);
                        break;
                    }
                    case WindowsMinidump.StreamTypes.Exception: {
                        __raw_data = m_io.ReadBytes(LenData);
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new ExceptionStream(io___raw_data, this, m_root);
                        break;
                    }
                    case WindowsMinidump.StreamTypes.SystemInfo: {
                        __raw_data = m_io.ReadBytes(LenData);
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new SystemInfo(io___raw_data, this, m_root);
                        break;
                    }
                    default: {
                        _data = m_io.ReadBytes(LenData);
                        break;
                    }
                    }
                    m_io.Seek(_pos);
                    f_data = true;
                    return _data;
                }
            }
            private StreamTypes _streamType;
            private uint _lenData;
            private uint _ofsData;
            private WindowsMinidump m_root;
            private WindowsMinidump m_parent;
            private byte[] __raw_data;
            public StreamTypes StreamType { get { return _streamType; } }

            /// <remarks>
            /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680383(v=vs.85).aspx">Source</a>
            /// </remarks>
            public uint LenData { get { return _lenData; } }
            public uint OfsData { get { return _ofsData; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680517(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class Thread : KaitaiStruct
        {
            public static Thread FromFile(string fileName)
            {
                return new Thread(new KaitaiStream(fileName));
            }

            public Thread(KaitaiStream p__io, WindowsMinidump.ThreadList p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _threadId = m_io.ReadU4le();
                _suspendCount = m_io.ReadU4le();
                _priorityClass = m_io.ReadU4le();
                _priority = m_io.ReadU4le();
                _teb = m_io.ReadU8le();
                _stack = new MemoryDescriptor(m_io, this, m_root);
                _threadContext = new LocationDescriptor(m_io, this, m_root);
            }
            private uint _threadId;
            private uint _suspendCount;
            private uint _priorityClass;
            private uint _priority;
            private ulong _teb;
            private MemoryDescriptor _stack;
            private LocationDescriptor _threadContext;
            private WindowsMinidump m_root;
            private WindowsMinidump.ThreadList m_parent;
            public uint ThreadId { get { return _threadId; } }
            public uint SuspendCount { get { return _suspendCount; } }
            public uint PriorityClass { get { return _priorityClass; } }
            public uint Priority { get { return _priority; } }

            /// <summary>
            /// Thread Environment Block
            /// </summary>
            public ulong Teb { get { return _teb; } }
            public MemoryDescriptor Stack { get { return _stack; } }
            public LocationDescriptor ThreadContext { get { return _threadContext; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump.ThreadList M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680387(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class MemoryList : KaitaiStruct
        {
            public static MemoryList FromFile(string fileName)
            {
                return new MemoryList(new KaitaiStream(fileName));
            }

            public MemoryList(KaitaiStream p__io, WindowsMinidump.Dir p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numMemRanges = m_io.ReadU4le();
                _memRanges = new List<MemoryDescriptor>((int) (NumMemRanges));
                for (var i = 0; i < NumMemRanges; i++)
                {
                    _memRanges.Add(new MemoryDescriptor(m_io, this, m_root));
                }
            }
            private uint _numMemRanges;
            private List<MemoryDescriptor> _memRanges;
            private WindowsMinidump m_root;
            private WindowsMinidump.Dir m_parent;
            public uint NumMemRanges { get { return _numMemRanges; } }
            public List<MemoryDescriptor> MemRanges { get { return _memRanges; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump.Dir M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680384(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class MemoryDescriptor : KaitaiStruct
        {
            public static MemoryDescriptor FromFile(string fileName)
            {
                return new MemoryDescriptor(new KaitaiStream(fileName));
            }

            public MemoryDescriptor(KaitaiStream p__io, KaitaiStruct p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _addrMemoryRange = m_io.ReadU8le();
                _memory = new LocationDescriptor(m_io, this, m_root);
            }
            private ulong _addrMemoryRange;
            private LocationDescriptor _memory;
            private WindowsMinidump m_root;
            private KaitaiStruct m_parent;
            public ulong AddrMemoryRange { get { return _addrMemoryRange; } }
            public LocationDescriptor Memory { get { return _memory; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms680368(v=vs.85).aspx">Source</a>
        /// </remarks>
        public partial class ExceptionStream : KaitaiStruct
        {
            public static ExceptionStream FromFile(string fileName)
            {
                return new ExceptionStream(new KaitaiStream(fileName));
            }

            public ExceptionStream(KaitaiStream p__io, WindowsMinidump.Dir p__parent = null, WindowsMinidump p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _threadId = m_io.ReadU4le();
                _reserved = m_io.ReadU4le();
                _exceptionRec = new ExceptionRecord(m_io, this, m_root);
                _threadContext = new LocationDescriptor(m_io, this, m_root);
            }
            private uint _threadId;
            private uint _reserved;
            private ExceptionRecord _exceptionRec;
            private LocationDescriptor _threadContext;
            private WindowsMinidump m_root;
            private WindowsMinidump.Dir m_parent;
            public uint ThreadId { get { return _threadId; } }
            public uint Reserved { get { return _reserved; } }
            public ExceptionRecord ExceptionRec { get { return _exceptionRec; } }
            public LocationDescriptor ThreadContext { get { return _threadContext; } }
            public WindowsMinidump M_Root { get { return m_root; } }
            public WindowsMinidump.Dir M_Parent { get { return m_parent; } }
        }
        private bool f_streams;
        private List<Dir> _streams;
        public List<Dir> Streams
        {
            get
            {
                if (f_streams)
                    return _streams;
                long _pos = m_io.Pos;
                m_io.Seek(OfsStreams);
                _streams = new List<Dir>((int) (NumStreams));
                for (var i = 0; i < NumStreams; i++)
                {
                    _streams.Add(new Dir(m_io, this, m_root));
                }
                m_io.Seek(_pos);
                f_streams = true;
                return _streams;
            }
        }
        private byte[] _magic1;
        private byte[] _magic2;
        private ushort _version;
        private uint _numStreams;
        private uint _ofsStreams;
        private uint _checksum;
        private uint _timestamp;
        private ulong _flags;
        private WindowsMinidump m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic1 { get { return _magic1; } }
        public byte[] Magic2 { get { return _magic2; } }
        public ushort Version { get { return _version; } }
        public uint NumStreams { get { return _numStreams; } }
        public uint OfsStreams { get { return _ofsStreams; } }
        public uint Checksum { get { return _checksum; } }
        public uint Timestamp { get { return _timestamp; } }
        public ulong Flags { get { return _flags; } }
        public WindowsMinidump M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
