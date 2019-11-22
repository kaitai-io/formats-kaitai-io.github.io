<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Windows MiniDump (MDMP) file provides a concise way to store process
 * core dumps, which is useful for debugging. Given its small size,
 * modularity, some cross-platform features and native support in some
 * debuggers, it is particularly useful for crash reporting, and is
 * used for that purpose in Windows and Google Chrome projects.
 * 
 * The file itself is a container, which contains a number of typed
 * "streams", which contain some data according to its type attribute.
 */

class WindowsMinidump extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic1 = $this->_io->ensureFixedContents("\x4D\x44\x4D\x50");
        $this->_m_magic2 = $this->_io->ensureFixedContents("\x93\xA7");
        $this->_m_version = $this->_io->readU2le();
        $this->_m_numStreams = $this->_io->readU4le();
        $this->_m_ofsStreams = $this->_io->readU4le();
        $this->_m_checksum = $this->_io->readU4le();
        $this->_m_timestamp = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU8le();
    }
    protected $_m_streams;
    public function streams() {
        if ($this->_m_streams !== null)
            return $this->_m_streams;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->ofsStreams());
        $this->_m_streams = [];
        $n = $this->numStreams();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_streams[] = new \WindowsMinidump\Dir($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_streams;
    }
    protected $_m_magic1;
    protected $_m_magic2;
    protected $_m_version;
    protected $_m_numStreams;
    protected $_m_ofsStreams;
    protected $_m_checksum;
    protected $_m_timestamp;
    protected $_m_flags;
    public function magic1() { return $this->_m_magic1; }
    public function magic2() { return $this->_m_magic2; }
    public function version() { return $this->_m_version; }
    public function numStreams() { return $this->_m_numStreams; }
    public function ofsStreams() { return $this->_m_ofsStreams; }
    public function checksum() { return $this->_m_checksum; }
    public function timestamp() { return $this->_m_timestamp; }
    public function flags() { return $this->_m_flags; }
}

namespace \WindowsMinidump;

class ThreadList extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump\Dir $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numThreads = $this->_io->readU4le();
        $this->_m_threads = [];
        $n = $this->numThreads();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_threads[] = new \WindowsMinidump\Thread($this->_io, $this, $this->_root);
        }
    }
    protected $_m_numThreads;
    protected $_m_threads;
    public function numThreads() { return $this->_m_numThreads; }
    public function threads() { return $this->_m_threads; }
}

namespace \WindowsMinidump;

class LocationDescriptor extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenData = $this->_io->readU4le();
        $this->_m_ofsData = $this->_io->readU4le();
    }
    protected $_m_data;
    public function data() {
        if ($this->_m_data !== null)
            return $this->_m_data;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->ofsData());
        $this->_m_data = $io->readBytes($this->lenData());
        $io->seek($_pos);
        return $this->_m_data;
    }
    protected $_m_lenData;
    protected $_m_ofsData;
    public function lenData() { return $this->_m_lenData; }
    public function ofsData() { return $this->_m_ofsData; }
}

/**
 * Specific string serialization scheme used in MiniDump format is
 * actually a simple 32-bit length-prefixed UTF-16 string.
 */

namespace \WindowsMinidump;

class MinidumpString extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump\SystemInfo $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenStr = $this->_io->readU4le();
        $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenStr()), "UTF-16LE");
    }
    protected $_m_lenStr;
    protected $_m_str;
    public function lenStr() { return $this->_m_lenStr; }
    public function str() { return $this->_m_str; }
}

/**
 * "System info" stream provides basic information about the
 * hardware and operating system which produces this dump.
 */

namespace \WindowsMinidump;

class SystemInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump\Dir $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_cpuArch = $this->_io->readU2le();
        $this->_m_cpuLevel = $this->_io->readU2le();
        $this->_m_cpuRevision = $this->_io->readU2le();
        $this->_m_numCpus = $this->_io->readU1();
        $this->_m_osType = $this->_io->readU1();
        $this->_m_osVerMajor = $this->_io->readU4le();
        $this->_m_osVerMinor = $this->_io->readU4le();
        $this->_m_osBuild = $this->_io->readU4le();
        $this->_m_osPlatform = $this->_io->readU4le();
        $this->_m_ofsServicePack = $this->_io->readU4le();
        $this->_m_osSuiteMask = $this->_io->readU2le();
        $this->_m_reserved2 = $this->_io->readU2le();
    }
    protected $_m_servicePack;
    public function servicePack() {
        if ($this->_m_servicePack !== null)
            return $this->_m_servicePack;
        if ($this->ofsServicePack() > 0) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsServicePack());
            $this->_m_servicePack = new \WindowsMinidump\MinidumpString($io, $this, $this->_root);
            $io->seek($_pos);
        }
        return $this->_m_servicePack;
    }
    protected $_m_cpuArch;
    protected $_m_cpuLevel;
    protected $_m_cpuRevision;
    protected $_m_numCpus;
    protected $_m_osType;
    protected $_m_osVerMajor;
    protected $_m_osVerMinor;
    protected $_m_osBuild;
    protected $_m_osPlatform;
    protected $_m_ofsServicePack;
    protected $_m_osSuiteMask;
    protected $_m_reserved2;
    public function cpuArch() { return $this->_m_cpuArch; }
    public function cpuLevel() { return $this->_m_cpuLevel; }
    public function cpuRevision() { return $this->_m_cpuRevision; }
    public function numCpus() { return $this->_m_numCpus; }
    public function osType() { return $this->_m_osType; }
    public function osVerMajor() { return $this->_m_osVerMajor; }
    public function osVerMinor() { return $this->_m_osVerMinor; }
    public function osBuild() { return $this->_m_osBuild; }
    public function osPlatform() { return $this->_m_osPlatform; }
    public function ofsServicePack() { return $this->_m_ofsServicePack; }
    public function osSuiteMask() { return $this->_m_osSuiteMask; }
    public function reserved2() { return $this->_m_reserved2; }
}

namespace \WindowsMinidump\SystemInfo;

class CpuArchs {
    const INTEL = 0;
    const ARM = 5;
    const IA64 = 6;
    const AMD64 = 9;
    const UNKNOWN = 65535;
}

namespace \WindowsMinidump;

class ExceptionRecord extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump\ExceptionStream $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU4le();
        $this->_m_innerException = $this->_io->readU8le();
        $this->_m_addr = $this->_io->readU8le();
        $this->_m_numParams = $this->_io->readU4le();
        $this->_m_reserved = $this->_io->readU4le();
        $this->_m_params = [];
        $n = 15;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_params[] = $this->_io->readU8le();
        }
    }
    protected $_m_code;
    protected $_m_flags;
    protected $_m_innerException;
    protected $_m_addr;
    protected $_m_numParams;
    protected $_m_reserved;
    protected $_m_params;
    public function code() { return $this->_m_code; }
    public function flags() { return $this->_m_flags; }
    public function innerException() { return $this->_m_innerException; }

    /**
     * Memory address where exception has occurred
     */
    public function addr() { return $this->_m_addr; }
    public function numParams() { return $this->_m_numParams; }
    public function reserved() { return $this->_m_reserved; }

    /**
     * Additional parameters passed along with exception raise
     * function (for WinAPI, that is `RaiseException`). Meaning is
     * exception-specific. Given that this type is originally
     * defined by a C structure, it is described there as array of
     * fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
     * 15), but in reality only first `num_params` would be used.
     */
    public function params() { return $this->_m_params; }
}

namespace \WindowsMinidump;

class MiscInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump\Dir $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenInfo = $this->_io->readU4le();
        $this->_m_flags1 = $this->_io->readU4le();
        $this->_m_processId = $this->_io->readU4le();
        $this->_m_processCreateTime = $this->_io->readU4le();
        $this->_m_processUserTime = $this->_io->readU4le();
        $this->_m_processKernelTime = $this->_io->readU4le();
        $this->_m_cpuMaxMhz = $this->_io->readU4le();
        $this->_m_cpuCurMhz = $this->_io->readU4le();
        $this->_m_cpuLimitMhz = $this->_io->readU4le();
        $this->_m_cpuMaxIdleState = $this->_io->readU4le();
        $this->_m_cpuCurIdleState = $this->_io->readU4le();
    }
    protected $_m_lenInfo;
    protected $_m_flags1;
    protected $_m_processId;
    protected $_m_processCreateTime;
    protected $_m_processUserTime;
    protected $_m_processKernelTime;
    protected $_m_cpuMaxMhz;
    protected $_m_cpuCurMhz;
    protected $_m_cpuLimitMhz;
    protected $_m_cpuMaxIdleState;
    protected $_m_cpuCurIdleState;
    public function lenInfo() { return $this->_m_lenInfo; }
    public function flags1() { return $this->_m_flags1; }
    public function processId() { return $this->_m_processId; }
    public function processCreateTime() { return $this->_m_processCreateTime; }
    public function processUserTime() { return $this->_m_processUserTime; }
    public function processKernelTime() { return $this->_m_processKernelTime; }
    public function cpuMaxMhz() { return $this->_m_cpuMaxMhz; }
    public function cpuCurMhz() { return $this->_m_cpuCurMhz; }
    public function cpuLimitMhz() { return $this->_m_cpuLimitMhz; }
    public function cpuMaxIdleState() { return $this->_m_cpuMaxIdleState; }
    public function cpuCurIdleState() { return $this->_m_cpuCurIdleState; }
}

namespace \WindowsMinidump;

class Dir extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_streamType = $this->_io->readU4le();
        $this->_m_lenData = $this->_io->readU4le();
        $this->_m_ofsData = $this->_io->readU4le();
    }
    protected $_m_data;
    public function data() {
        if ($this->_m_data !== null)
            return $this->_m_data;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->ofsData());
        switch ($this->streamType()) {
            case \WindowsMinidump\StreamTypes::MISC_INFO:
                $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \WindowsMinidump\MiscInfo($io, $this, $this->_root);
                break;
            case \WindowsMinidump\StreamTypes::EXCEPTION:
                $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \WindowsMinidump\ExceptionStream($io, $this, $this->_root);
                break;
            case \WindowsMinidump\StreamTypes::MEMORY_LIST:
                $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \WindowsMinidump\MemoryList($io, $this, $this->_root);
                break;
            case \WindowsMinidump\StreamTypes::SYSTEM_INFO:
                $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \WindowsMinidump\SystemInfo($io, $this, $this->_root);
                break;
            case \WindowsMinidump\StreamTypes::THREAD_LIST:
                $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \WindowsMinidump\ThreadList($io, $this, $this->_root);
                break;
            default:
                $this->_m_data = $this->_io->readBytes($this->lenData());
                break;
        }
        $this->_io->seek($_pos);
        return $this->_m_data;
    }
    protected $_m_streamType;
    protected $_m_lenData;
    protected $_m_ofsData;
    protected $_m__raw_data;
    public function streamType() { return $this->_m_streamType; }
    public function lenData() { return $this->_m_lenData; }
    public function ofsData() { return $this->_m_ofsData; }
    public function _raw_data() { return $this->_m__raw_data; }
}

namespace \WindowsMinidump;

class Thread extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump\ThreadList $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_threadId = $this->_io->readU4le();
        $this->_m_suspendCount = $this->_io->readU4le();
        $this->_m_priorityClass = $this->_io->readU4le();
        $this->_m_priority = $this->_io->readU4le();
        $this->_m_teb = $this->_io->readU8le();
        $this->_m_stack = new \WindowsMinidump\MemoryDescriptor($this->_io, $this, $this->_root);
        $this->_m_threadContext = new \WindowsMinidump\LocationDescriptor($this->_io, $this, $this->_root);
    }
    protected $_m_threadId;
    protected $_m_suspendCount;
    protected $_m_priorityClass;
    protected $_m_priority;
    protected $_m_teb;
    protected $_m_stack;
    protected $_m_threadContext;
    public function threadId() { return $this->_m_threadId; }
    public function suspendCount() { return $this->_m_suspendCount; }
    public function priorityClass() { return $this->_m_priorityClass; }
    public function priority() { return $this->_m_priority; }

    /**
     * Thread Environment Block
     */
    public function teb() { return $this->_m_teb; }
    public function stack() { return $this->_m_stack; }
    public function threadContext() { return $this->_m_threadContext; }
}

namespace \WindowsMinidump;

class MemoryList extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump\Dir $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numMemRanges = $this->_io->readU4le();
        $this->_m_memRanges = [];
        $n = $this->numMemRanges();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_memRanges[] = new \WindowsMinidump\MemoryDescriptor($this->_io, $this, $this->_root);
        }
    }
    protected $_m_numMemRanges;
    protected $_m_memRanges;
    public function numMemRanges() { return $this->_m_numMemRanges; }
    public function memRanges() { return $this->_m_memRanges; }
}

namespace \WindowsMinidump;

class MemoryDescriptor extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_addrMemoryRange = $this->_io->readU8le();
        $this->_m_memory = new \WindowsMinidump\LocationDescriptor($this->_io, $this, $this->_root);
    }
    protected $_m_addrMemoryRange;
    protected $_m_memory;
    public function addrMemoryRange() { return $this->_m_addrMemoryRange; }
    public function memory() { return $this->_m_memory; }
}

namespace \WindowsMinidump;

class ExceptionStream extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsMinidump\Dir $_parent = null, \WindowsMinidump $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_threadId = $this->_io->readU4le();
        $this->_m_reserved = $this->_io->readU4le();
        $this->_m_exceptionRec = new \WindowsMinidump\ExceptionRecord($this->_io, $this, $this->_root);
        $this->_m_threadContext = new \WindowsMinidump\LocationDescriptor($this->_io, $this, $this->_root);
    }
    protected $_m_threadId;
    protected $_m_reserved;
    protected $_m_exceptionRec;
    protected $_m_threadContext;
    public function threadId() { return $this->_m_threadId; }
    public function reserved() { return $this->_m_reserved; }
    public function exceptionRec() { return $this->_m_exceptionRec; }
    public function threadContext() { return $this->_m_threadContext; }
}

namespace \WindowsMinidump;

class StreamTypes {
    const UNUSED = 0;
    const RESERVED_0 = 1;
    const RESERVED_1 = 2;
    const THREAD_LIST = 3;
    const MODULE_LIST = 4;
    const MEMORY_LIST = 5;
    const EXCEPTION = 6;
    const SYSTEM_INFO = 7;
    const THREAD_EX_LIST = 8;
    const MEMORY_64_LIST = 9;
    const COMMENT_A = 10;
    const COMMENT_W = 11;
    const HANDLE_DATA = 12;
    const FUNCTION_TABLE = 13;
    const UNLOADED_MODULE_LIST = 14;
    const MISC_INFO = 15;
    const MEMORY_INFO_LIST = 16;
    const THREAD_INFO_LIST = 17;
    const HANDLE_OPERATION_LIST = 18;
}
