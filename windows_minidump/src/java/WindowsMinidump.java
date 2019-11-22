// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * Windows MiniDump (MDMP) file provides a concise way to store process
 * core dumps, which is useful for debugging. Given its small size,
 * modularity, some cross-platform features and native support in some
 * debuggers, it is particularly useful for crash reporting, and is
 * used for that purpose in Windows and Google Chrome projects.
 * 
 * The file itself is a container, which contains a number of typed
 * "streams", which contain some data according to its type attribute.
 * @see <a href="https://msdn.microsoft.com/en-us/library/ms680378(VS.85).aspx">Source</a>
 */
public class WindowsMinidump extends KaitaiStruct {
    public static WindowsMinidump fromFile(String fileName) throws IOException {
        return new WindowsMinidump(new ByteBufferKaitaiStream(fileName));
    }

    public enum StreamTypes {
        UNUSED(0),
        RESERVED_0(1),
        RESERVED_1(2),
        THREAD_LIST(3),
        MODULE_LIST(4),
        MEMORY_LIST(5),
        EXCEPTION(6),
        SYSTEM_INFO(7),
        THREAD_EX_LIST(8),
        MEMORY_64_LIST(9),
        COMMENT_A(10),
        COMMENT_W(11),
        HANDLE_DATA(12),
        FUNCTION_TABLE(13),
        UNLOADED_MODULE_LIST(14),
        MISC_INFO(15),
        MEMORY_INFO_LIST(16),
        THREAD_INFO_LIST(17),
        HANDLE_OPERATION_LIST(18);

        private final long id;
        StreamTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, StreamTypes> byId = new HashMap<Long, StreamTypes>(19);
        static {
            for (StreamTypes e : StreamTypes.values())
                byId.put(e.id(), e);
        }
        public static StreamTypes byId(long id) { return byId.get(id); }
    }

    public WindowsMinidump(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsMinidump(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public WindowsMinidump(KaitaiStream _io, KaitaiStruct _parent, WindowsMinidump _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic1 = this._io.ensureFixedContents(new byte[] { 77, 68, 77, 80 });
        this.magic2 = this._io.ensureFixedContents(new byte[] { -109, -89 });
        this.version = this._io.readU2le();
        this.numStreams = this._io.readU4le();
        this.ofsStreams = this._io.readU4le();
        this.checksum = this._io.readU4le();
        this.timestamp = this._io.readU4le();
        this.flags = this._io.readU8le();
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680515(v=vs.85).aspx">Source</a>
     */
    public static class ThreadList extends KaitaiStruct {
        public static ThreadList fromFile(String fileName) throws IOException {
            return new ThreadList(new ByteBufferKaitaiStream(fileName));
        }

        public ThreadList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ThreadList(KaitaiStream _io, WindowsMinidump.Dir _parent) {
            this(_io, _parent, null);
        }

        public ThreadList(KaitaiStream _io, WindowsMinidump.Dir _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numThreads = this._io.readU4le();
            threads = new ArrayList<Thread>((int) (numThreads()));
            for (int i = 0; i < numThreads(); i++) {
                this.threads.add(new Thread(this._io, this, _root));
            }
        }
        private long numThreads;
        private ArrayList<Thread> threads;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public long numThreads() { return numThreads; }
        public ArrayList<Thread> threads() { return threads; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump.Dir _parent() { return _parent; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680383(v=vs.85).aspx">Source</a>
     */
    public static class LocationDescriptor extends KaitaiStruct {
        public static LocationDescriptor fromFile(String fileName) throws IOException {
            return new LocationDescriptor(new ByteBufferKaitaiStream(fileName));
        }

        public LocationDescriptor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LocationDescriptor(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public LocationDescriptor(KaitaiStream _io, KaitaiStruct _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenData = this._io.readU4le();
            this.ofsData = this._io.readU4le();
        }
        private byte[] data;
        public byte[] data() {
            if (this.data != null)
                return this.data;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(ofsData());
            this.data = io.readBytes(lenData());
            io.seek(_pos);
            return this.data;
        }
        private long lenData;
        private long ofsData;
        private WindowsMinidump _root;
        private KaitaiStruct _parent;
        public long lenData() { return lenData; }
        public long ofsData() { return ofsData; }
        public WindowsMinidump _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * Specific string serialization scheme used in MiniDump format is
     * actually a simple 32-bit length-prefixed UTF-16 string.
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680395(v=vs.85).aspx">Source</a>
     */
    public static class MinidumpString extends KaitaiStruct {
        public static MinidumpString fromFile(String fileName) throws IOException {
            return new MinidumpString(new ByteBufferKaitaiStream(fileName));
        }

        public MinidumpString(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MinidumpString(KaitaiStream _io, WindowsMinidump.SystemInfo _parent) {
            this(_io, _parent, null);
        }

        public MinidumpString(KaitaiStream _io, WindowsMinidump.SystemInfo _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenStr = this._io.readU4le();
            this.str = new String(this._io.readBytes(lenStr()), Charset.forName("UTF-16LE"));
        }
        private long lenStr;
        private String str;
        private WindowsMinidump _root;
        private WindowsMinidump.SystemInfo _parent;
        public long lenStr() { return lenStr; }
        public String str() { return str; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump.SystemInfo _parent() { return _parent; }
    }

    /**
     * "System info" stream provides basic information about the
     * hardware and operating system which produces this dump.
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680396(v=vs.85).aspx">Source</a>
     */
    public static class SystemInfo extends KaitaiStruct {
        public static SystemInfo fromFile(String fileName) throws IOException {
            return new SystemInfo(new ByteBufferKaitaiStream(fileName));
        }

        public enum CpuArchs {
            INTEL(0),
            ARM(5),
            IA64(6),
            AMD64(9),
            UNKNOWN(65535);

            private final long id;
            CpuArchs(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, CpuArchs> byId = new HashMap<Long, CpuArchs>(5);
            static {
                for (CpuArchs e : CpuArchs.values())
                    byId.put(e.id(), e);
            }
            public static CpuArchs byId(long id) { return byId.get(id); }
        }

        public SystemInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SystemInfo(KaitaiStream _io, WindowsMinidump.Dir _parent) {
            this(_io, _parent, null);
        }

        public SystemInfo(KaitaiStream _io, WindowsMinidump.Dir _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.cpuArch = CpuArchs.byId(this._io.readU2le());
            this.cpuLevel = this._io.readU2le();
            this.cpuRevision = this._io.readU2le();
            this.numCpus = this._io.readU1();
            this.osType = this._io.readU1();
            this.osVerMajor = this._io.readU4le();
            this.osVerMinor = this._io.readU4le();
            this.osBuild = this._io.readU4le();
            this.osPlatform = this._io.readU4le();
            this.ofsServicePack = this._io.readU4le();
            this.osSuiteMask = this._io.readU2le();
            this.reserved2 = this._io.readU2le();
        }
        private MinidumpString servicePack;
        public MinidumpString servicePack() {
            if (this.servicePack != null)
                return this.servicePack;
            if (ofsServicePack() > 0) {
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek(ofsServicePack());
                this.servicePack = new MinidumpString(io, this, _root);
                io.seek(_pos);
            }
            return this.servicePack;
        }
        private CpuArchs cpuArch;
        private int cpuLevel;
        private int cpuRevision;
        private int numCpus;
        private int osType;
        private long osVerMajor;
        private long osVerMinor;
        private long osBuild;
        private long osPlatform;
        private long ofsServicePack;
        private int osSuiteMask;
        private int reserved2;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public CpuArchs cpuArch() { return cpuArch; }
        public int cpuLevel() { return cpuLevel; }
        public int cpuRevision() { return cpuRevision; }
        public int numCpus() { return numCpus; }
        public int osType() { return osType; }
        public long osVerMajor() { return osVerMajor; }
        public long osVerMinor() { return osVerMinor; }
        public long osBuild() { return osBuild; }
        public long osPlatform() { return osPlatform; }
        public long ofsServicePack() { return ofsServicePack; }
        public int osSuiteMask() { return osSuiteMask; }
        public int reserved2() { return reserved2; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump.Dir _parent() { return _parent; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680367(v=vs.85).aspx">Source</a>
     */
    public static class ExceptionRecord extends KaitaiStruct {
        public static ExceptionRecord fromFile(String fileName) throws IOException {
            return new ExceptionRecord(new ByteBufferKaitaiStream(fileName));
        }

        public ExceptionRecord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExceptionRecord(KaitaiStream _io, WindowsMinidump.ExceptionStream _parent) {
            this(_io, _parent, null);
        }

        public ExceptionRecord(KaitaiStream _io, WindowsMinidump.ExceptionStream _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.innerException = this._io.readU8le();
            this.addr = this._io.readU8le();
            this.numParams = this._io.readU4le();
            this.reserved = this._io.readU4le();
            params = new ArrayList<Long>((int) (15));
            for (int i = 0; i < 15; i++) {
                this.params.add(this._io.readU8le());
            }
        }
        private long code;
        private long flags;
        private long innerException;
        private long addr;
        private long numParams;
        private long reserved;
        private ArrayList<Long> params;
        private WindowsMinidump _root;
        private WindowsMinidump.ExceptionStream _parent;
        public long code() { return code; }
        public long flags() { return flags; }
        public long innerException() { return innerException; }

        /**
         * Memory address where exception has occurred
         */
        public long addr() { return addr; }
        public long numParams() { return numParams; }
        public long reserved() { return reserved; }

        /**
         * Additional parameters passed along with exception raise
         * function (for WinAPI, that is `RaiseException`). Meaning is
         * exception-specific. Given that this type is originally
         * defined by a C structure, it is described there as array of
         * fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
         * 15), but in reality only first `num_params` would be used.
         */
        public ArrayList<Long> params() { return params; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump.ExceptionStream _parent() { return _parent; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680389(v=vs.85).aspx">Source</a>
     */
    public static class MiscInfo extends KaitaiStruct {
        public static MiscInfo fromFile(String fileName) throws IOException {
            return new MiscInfo(new ByteBufferKaitaiStream(fileName));
        }

        public MiscInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MiscInfo(KaitaiStream _io, WindowsMinidump.Dir _parent) {
            this(_io, _parent, null);
        }

        public MiscInfo(KaitaiStream _io, WindowsMinidump.Dir _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenInfo = this._io.readU4le();
            this.flags1 = this._io.readU4le();
            this.processId = this._io.readU4le();
            this.processCreateTime = this._io.readU4le();
            this.processUserTime = this._io.readU4le();
            this.processKernelTime = this._io.readU4le();
            this.cpuMaxMhz = this._io.readU4le();
            this.cpuCurMhz = this._io.readU4le();
            this.cpuLimitMhz = this._io.readU4le();
            this.cpuMaxIdleState = this._io.readU4le();
            this.cpuCurIdleState = this._io.readU4le();
        }
        private long lenInfo;
        private long flags1;
        private long processId;
        private long processCreateTime;
        private long processUserTime;
        private long processKernelTime;
        private long cpuMaxMhz;
        private long cpuCurMhz;
        private long cpuLimitMhz;
        private long cpuMaxIdleState;
        private long cpuCurIdleState;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public long lenInfo() { return lenInfo; }
        public long flags1() { return flags1; }
        public long processId() { return processId; }
        public long processCreateTime() { return processCreateTime; }
        public long processUserTime() { return processUserTime; }
        public long processKernelTime() { return processKernelTime; }
        public long cpuMaxMhz() { return cpuMaxMhz; }
        public long cpuCurMhz() { return cpuCurMhz; }
        public long cpuLimitMhz() { return cpuLimitMhz; }
        public long cpuMaxIdleState() { return cpuMaxIdleState; }
        public long cpuCurIdleState() { return cpuCurIdleState; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump.Dir _parent() { return _parent; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680365(v=vs.85).aspx">Source</a>
     */
    public static class Dir extends KaitaiStruct {
        public static Dir fromFile(String fileName) throws IOException {
            return new Dir(new ByteBufferKaitaiStream(fileName));
        }

        public Dir(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Dir(KaitaiStream _io, WindowsMinidump _parent) {
            this(_io, _parent, null);
        }

        public Dir(KaitaiStream _io, WindowsMinidump _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.streamType = WindowsMinidump.StreamTypes.byId(this._io.readU4le());
            this.lenData = this._io.readU4le();
            this.ofsData = this._io.readU4le();
        }
        private Object data;
        public Object data() {
            if (this.data != null)
                return this.data;
            long _pos = this._io.pos();
            this._io.seek(ofsData());
            switch (streamType()) {
            case MISC_INFO: {
                this._raw_data = this._io.readBytes(lenData());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new MiscInfo(_io__raw_data, this, _root);
                break;
            }
            case EXCEPTION: {
                this._raw_data = this._io.readBytes(lenData());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new ExceptionStream(_io__raw_data, this, _root);
                break;
            }
            case MEMORY_LIST: {
                this._raw_data = this._io.readBytes(lenData());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new MemoryList(_io__raw_data, this, _root);
                break;
            }
            case SYSTEM_INFO: {
                this._raw_data = this._io.readBytes(lenData());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new SystemInfo(_io__raw_data, this, _root);
                break;
            }
            case THREAD_LIST: {
                this._raw_data = this._io.readBytes(lenData());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new ThreadList(_io__raw_data, this, _root);
                break;
            }
            default: {
                this.data = this._io.readBytes(lenData());
                break;
            }
            }
            this._io.seek(_pos);
            return this.data;
        }
        private StreamTypes streamType;
        private long lenData;
        private long ofsData;
        private WindowsMinidump _root;
        private WindowsMinidump _parent;
        private byte[] _raw_data;
        public StreamTypes streamType() { return streamType; }

        /**
         * @see <a href="https://msdn.microsoft.com/en-us/library/ms680383(v=vs.85).aspx">Source</a>
         */
        public long lenData() { return lenData; }
        public long ofsData() { return ofsData; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump _parent() { return _parent; }
        public byte[] _raw_data() { return _raw_data; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680517(v=vs.85).aspx">Source</a>
     */
    public static class Thread extends KaitaiStruct {
        public static Thread fromFile(String fileName) throws IOException {
            return new Thread(new ByteBufferKaitaiStream(fileName));
        }

        public Thread(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Thread(KaitaiStream _io, WindowsMinidump.ThreadList _parent) {
            this(_io, _parent, null);
        }

        public Thread(KaitaiStream _io, WindowsMinidump.ThreadList _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.threadId = this._io.readU4le();
            this.suspendCount = this._io.readU4le();
            this.priorityClass = this._io.readU4le();
            this.priority = this._io.readU4le();
            this.teb = this._io.readU8le();
            this.stack = new MemoryDescriptor(this._io, this, _root);
            this.threadContext = new LocationDescriptor(this._io, this, _root);
        }
        private long threadId;
        private long suspendCount;
        private long priorityClass;
        private long priority;
        private long teb;
        private MemoryDescriptor stack;
        private LocationDescriptor threadContext;
        private WindowsMinidump _root;
        private WindowsMinidump.ThreadList _parent;
        public long threadId() { return threadId; }
        public long suspendCount() { return suspendCount; }
        public long priorityClass() { return priorityClass; }
        public long priority() { return priority; }

        /**
         * Thread Environment Block
         */
        public long teb() { return teb; }
        public MemoryDescriptor stack() { return stack; }
        public LocationDescriptor threadContext() { return threadContext; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump.ThreadList _parent() { return _parent; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680387(v=vs.85).aspx">Source</a>
     */
    public static class MemoryList extends KaitaiStruct {
        public static MemoryList fromFile(String fileName) throws IOException {
            return new MemoryList(new ByteBufferKaitaiStream(fileName));
        }

        public MemoryList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MemoryList(KaitaiStream _io, WindowsMinidump.Dir _parent) {
            this(_io, _parent, null);
        }

        public MemoryList(KaitaiStream _io, WindowsMinidump.Dir _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numMemRanges = this._io.readU4le();
            memRanges = new ArrayList<MemoryDescriptor>((int) (numMemRanges()));
            for (int i = 0; i < numMemRanges(); i++) {
                this.memRanges.add(new MemoryDescriptor(this._io, this, _root));
            }
        }
        private long numMemRanges;
        private ArrayList<MemoryDescriptor> memRanges;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public long numMemRanges() { return numMemRanges; }
        public ArrayList<MemoryDescriptor> memRanges() { return memRanges; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump.Dir _parent() { return _parent; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680384(v=vs.85).aspx">Source</a>
     */
    public static class MemoryDescriptor extends KaitaiStruct {
        public static MemoryDescriptor fromFile(String fileName) throws IOException {
            return new MemoryDescriptor(new ByteBufferKaitaiStream(fileName));
        }

        public MemoryDescriptor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MemoryDescriptor(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public MemoryDescriptor(KaitaiStream _io, KaitaiStruct _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.addrMemoryRange = this._io.readU8le();
            this.memory = new LocationDescriptor(this._io, this, _root);
        }
        private long addrMemoryRange;
        private LocationDescriptor memory;
        private WindowsMinidump _root;
        private KaitaiStruct _parent;
        public long addrMemoryRange() { return addrMemoryRange; }
        public LocationDescriptor memory() { return memory; }
        public WindowsMinidump _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/ms680368(v=vs.85).aspx">Source</a>
     */
    public static class ExceptionStream extends KaitaiStruct {
        public static ExceptionStream fromFile(String fileName) throws IOException {
            return new ExceptionStream(new ByteBufferKaitaiStream(fileName));
        }

        public ExceptionStream(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExceptionStream(KaitaiStream _io, WindowsMinidump.Dir _parent) {
            this(_io, _parent, null);
        }

        public ExceptionStream(KaitaiStream _io, WindowsMinidump.Dir _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.threadId = this._io.readU4le();
            this.reserved = this._io.readU4le();
            this.exceptionRec = new ExceptionRecord(this._io, this, _root);
            this.threadContext = new LocationDescriptor(this._io, this, _root);
        }
        private long threadId;
        private long reserved;
        private ExceptionRecord exceptionRec;
        private LocationDescriptor threadContext;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public long threadId() { return threadId; }
        public long reserved() { return reserved; }
        public ExceptionRecord exceptionRec() { return exceptionRec; }
        public LocationDescriptor threadContext() { return threadContext; }
        public WindowsMinidump _root() { return _root; }
        public WindowsMinidump.Dir _parent() { return _parent; }
    }
    private ArrayList<Dir> streams;
    public ArrayList<Dir> streams() {
        if (this.streams != null)
            return this.streams;
        long _pos = this._io.pos();
        this._io.seek(ofsStreams());
        streams = new ArrayList<Dir>((int) (numStreams()));
        for (int i = 0; i < numStreams(); i++) {
            this.streams.add(new Dir(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.streams;
    }
    private byte[] magic1;
    private byte[] magic2;
    private int version;
    private long numStreams;
    private long ofsStreams;
    private long checksum;
    private long timestamp;
    private long flags;
    private WindowsMinidump _root;
    private KaitaiStruct _parent;
    public byte[] magic1() { return magic1; }
    public byte[] magic2() { return magic2; }
    public int version() { return version; }
    public long numStreams() { return numStreams; }
    public long ofsStreams() { return ofsStreams; }
    public long checksum() { return checksum; }
    public long timestamp() { return timestamp; }
    public long flags() { return flags; }
    public WindowsMinidump _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
