// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.WindowsMinidump || (root.WindowsMinidump = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (WindowsMinidump_, KaitaiStream) {
/**
 * Windows MiniDump (MDMP) file provides a concise way to store process
 * core dumps, which is useful for debugging. Given its small size,
 * modularity, some cross-platform features and native support in some
 * debuggers, it is particularly useful for crash reporting, and is
 * used for that purpose in Windows and Google Chrome projects.
 * 
 * The file itself is a container, which contains a number of typed
 * "streams", which contain some data according to its type attribute.
 * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header|Source}
 */

var WindowsMinidump = (function() {
  WindowsMinidump.StreamTypes = Object.freeze({
    UNUSED: 0,
    RESERVED_0: 1,
    RESERVED_1: 2,
    THREAD_LIST: 3,
    MODULE_LIST: 4,
    MEMORY_LIST: 5,
    EXCEPTION: 6,
    SYSTEM_INFO: 7,
    THREAD_EX_LIST: 8,
    MEMORY_64_LIST: 9,
    COMMENT_A: 10,
    COMMENT_W: 11,
    HANDLE_DATA: 12,
    FUNCTION_TABLE: 13,
    UNLOADED_MODULE_LIST: 14,
    MISC_INFO: 15,
    MEMORY_INFO_LIST: 16,
    THREAD_INFO_LIST: 17,
    HANDLE_OPERATION_LIST: 18,
    TOKEN: 19,
    JAVA_SCRIPT_DATA: 20,
    SYSTEM_MEMORY_INFO: 21,
    PROCESS_VM_COUNTERS: 22,
    IPT_TRACE: 23,
    THREAD_NAMES: 24,
    CE_NULL: 32768,
    CE_SYSTEM_INFO: 32769,
    CE_EXCEPTION: 32770,
    CE_MODULE_LIST: 32771,
    CE_PROCESS_LIST: 32772,
    CE_THREAD_LIST: 32773,
    CE_THREAD_CONTEXT_LIST: 32774,
    CE_THREAD_CALL_STACK_LIST: 32775,
    CE_MEMORY_VIRTUAL_LIST: 32776,
    CE_MEMORY_PHYSICAL_LIST: 32777,
    CE_BUCKET_PARAMETERS: 32778,
    CE_PROCESS_MODULE_MAP: 32779,
    CE_DIAGNOSIS_LIST: 32780,
    MD_CRASHPAD_INFO_STREAM: 1129316353,
    MD_RAW_BREAKPAD_INFO: 1197932545,
    MD_RAW_ASSERTION_INFO: 1197932546,
    MD_LINUX_CPU_INFO: 1197932547,
    MD_LINUX_PROC_STATUS: 1197932548,
    MD_LINUX_LSB_RELEASE: 1197932549,
    MD_LINUX_CMD_LINE: 1197932550,
    MD_LINUX_ENVIRON: 1197932551,
    MD_LINUX_AUXV: 1197932552,
    MD_LINUX_MAPS: 1197932553,
    MD_LINUX_DSO_DEBUG: 1197932554,

    0: "UNUSED",
    1: "RESERVED_0",
    2: "RESERVED_1",
    3: "THREAD_LIST",
    4: "MODULE_LIST",
    5: "MEMORY_LIST",
    6: "EXCEPTION",
    7: "SYSTEM_INFO",
    8: "THREAD_EX_LIST",
    9: "MEMORY_64_LIST",
    10: "COMMENT_A",
    11: "COMMENT_W",
    12: "HANDLE_DATA",
    13: "FUNCTION_TABLE",
    14: "UNLOADED_MODULE_LIST",
    15: "MISC_INFO",
    16: "MEMORY_INFO_LIST",
    17: "THREAD_INFO_LIST",
    18: "HANDLE_OPERATION_LIST",
    19: "TOKEN",
    20: "JAVA_SCRIPT_DATA",
    21: "SYSTEM_MEMORY_INFO",
    22: "PROCESS_VM_COUNTERS",
    23: "IPT_TRACE",
    24: "THREAD_NAMES",
    32768: "CE_NULL",
    32769: "CE_SYSTEM_INFO",
    32770: "CE_EXCEPTION",
    32771: "CE_MODULE_LIST",
    32772: "CE_PROCESS_LIST",
    32773: "CE_THREAD_LIST",
    32774: "CE_THREAD_CONTEXT_LIST",
    32775: "CE_THREAD_CALL_STACK_LIST",
    32776: "CE_MEMORY_VIRTUAL_LIST",
    32777: "CE_MEMORY_PHYSICAL_LIST",
    32778: "CE_BUCKET_PARAMETERS",
    32779: "CE_PROCESS_MODULE_MAP",
    32780: "CE_DIAGNOSIS_LIST",
    1129316353: "MD_CRASHPAD_INFO_STREAM",
    1197932545: "MD_RAW_BREAKPAD_INFO",
    1197932546: "MD_RAW_ASSERTION_INFO",
    1197932547: "MD_LINUX_CPU_INFO",
    1197932548: "MD_LINUX_PROC_STATUS",
    1197932549: "MD_LINUX_LSB_RELEASE",
    1197932550: "MD_LINUX_CMD_LINE",
    1197932551: "MD_LINUX_ENVIRON",
    1197932552: "MD_LINUX_AUXV",
    1197932553: "MD_LINUX_MAPS",
    1197932554: "MD_LINUX_DSO_DEBUG",
  });

  function WindowsMinidump(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  WindowsMinidump.prototype._read = function() {
    this.magic1 = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic1, new Uint8Array([77, 68, 77, 80])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([77, 68, 77, 80]), this.magic1, this._io, "/seq/0");
    }
    this.magic2 = this._io.readBytes(2);
    if (!((KaitaiStream.byteArrayCompare(this.magic2, new Uint8Array([147, 167])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([147, 167]), this.magic2, this._io, "/seq/1");
    }
    this.version = this._io.readU2le();
    this.numStreams = this._io.readU4le();
    this.ofsStreams = this._io.readU4le();
    this.checksum = this._io.readU4le();
    this.timestamp = this._io.readU4le();
    this.flags = this._io.readU8le();
  }

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory|Source}
   */

  var Dir = WindowsMinidump.Dir = (function() {
    function Dir(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Dir.prototype._read = function() {
      this.streamType = this._io.readU4le();
      this.lenData = this._io.readU4le();
      this.ofsData = this._io.readU4le();
    }
    Object.defineProperty(Dir.prototype, 'data', {
      get: function() {
        if (this._m_data !== undefined)
          return this._m_data;
        var _pos = this._io.pos;
        this._io.seek(this.ofsData);
        switch (this.streamType) {
        case WindowsMinidump.StreamTypes.EXCEPTION:
          this._raw__m_data = this._io.readBytes(this.lenData);
          var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
          this._m_data = new ExceptionStream(_io__raw__m_data, this, this._root);
          break;
        case WindowsMinidump.StreamTypes.MEMORY_LIST:
          this._raw__m_data = this._io.readBytes(this.lenData);
          var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
          this._m_data = new MemoryList(_io__raw__m_data, this, this._root);
          break;
        case WindowsMinidump.StreamTypes.MISC_INFO:
          this._raw__m_data = this._io.readBytes(this.lenData);
          var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
          this._m_data = new MiscInfo(_io__raw__m_data, this, this._root);
          break;
        case WindowsMinidump.StreamTypes.SYSTEM_INFO:
          this._raw__m_data = this._io.readBytes(this.lenData);
          var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
          this._m_data = new SystemInfo(_io__raw__m_data, this, this._root);
          break;
        case WindowsMinidump.StreamTypes.THREAD_LIST:
          this._raw__m_data = this._io.readBytes(this.lenData);
          var _io__raw__m_data = new KaitaiStream(this._raw__m_data);
          this._m_data = new ThreadList(_io__raw__m_data, this, this._root);
          break;
        default:
          this._m_data = this._io.readBytes(this.lenData);
          break;
        }
        this._io.seek(_pos);
        return this._m_data;
      }
    });

    /**
     * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor|Source}
     */

    return Dir;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception|Source}
   */

  var ExceptionRecord = WindowsMinidump.ExceptionRecord = (function() {
    function ExceptionRecord(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ExceptionRecord.prototype._read = function() {
      this.code = this._io.readU4le();
      this.flags = this._io.readU4le();
      this.innerException = this._io.readU8le();
      this.addr = this._io.readU8le();
      this.numParams = this._io.readU4le();
      this.reserved = this._io.readU4le();
      this.params = [];
      for (var i = 0; i < 15; i++) {
        this.params.push(this._io.readU8le());
      }
    }

    /**
     * Memory address where exception has occurred
     */

    /**
     * Additional parameters passed along with exception raise
     * function (for WinAPI, that is `RaiseException`). Meaning is
     * exception-specific. Given that this type is originally
     * defined by a C structure, it is described there as array of
     * fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
     * 15), but in reality only first `num_params` would be used.
     */

    return ExceptionRecord;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream|Source}
   */

  var ExceptionStream = WindowsMinidump.ExceptionStream = (function() {
    function ExceptionStream(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ExceptionStream.prototype._read = function() {
      this.threadId = this._io.readU4le();
      this.reserved = this._io.readU4le();
      this.exceptionRec = new ExceptionRecord(this._io, this, this._root);
      this.threadContext = new LocationDescriptor(this._io, this, this._root);
    }

    return ExceptionStream;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor|Source}
   */

  var LocationDescriptor = WindowsMinidump.LocationDescriptor = (function() {
    function LocationDescriptor(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LocationDescriptor.prototype._read = function() {
      this.lenData = this._io.readU4le();
      this.ofsData = this._io.readU4le();
    }
    Object.defineProperty(LocationDescriptor.prototype, 'data', {
      get: function() {
        if (this._m_data !== undefined)
          return this._m_data;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsData);
        this._m_data = io.readBytes(this.lenData);
        io.seek(_pos);
        return this._m_data;
      }
    });

    return LocationDescriptor;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor|Source}
   */

  var MemoryDescriptor = WindowsMinidump.MemoryDescriptor = (function() {
    function MemoryDescriptor(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MemoryDescriptor.prototype._read = function() {
      this.addrMemoryRange = this._io.readU8le();
      this.memory = new LocationDescriptor(this._io, this, this._root);
    }

    return MemoryDescriptor;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list|Source}
   */

  var MemoryList = WindowsMinidump.MemoryList = (function() {
    function MemoryList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MemoryList.prototype._read = function() {
      this.numMemRanges = this._io.readU4le();
      this.memRanges = [];
      for (var i = 0; i < this.numMemRanges; i++) {
        this.memRanges.push(new MemoryDescriptor(this._io, this, this._root));
      }
    }

    return MemoryList;
  })();

  /**
   * Specific string serialization scheme used in MiniDump format is
   * actually a simple 32-bit length-prefixed UTF-16 string.
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string|Source}
   */

  var MinidumpString = WindowsMinidump.MinidumpString = (function() {
    function MinidumpString(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MinidumpString.prototype._read = function() {
      this.lenStr = this._io.readU4le();
      this.str = KaitaiStream.bytesToStr(this._io.readBytes(this.lenStr), "UTF-16LE");
    }

    return MinidumpString;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info|Source}
   */

  var MiscInfo = WindowsMinidump.MiscInfo = (function() {
    function MiscInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MiscInfo.prototype._read = function() {
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

    return MiscInfo;
  })();

  /**
   * "System info" stream provides basic information about the
   * hardware and operating system which produces this dump.
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info|Source}
   */

  var SystemInfo = WindowsMinidump.SystemInfo = (function() {
    SystemInfo.CpuArchs = Object.freeze({
      INTEL: 0,
      ARM: 5,
      IA64: 6,
      AMD64: 9,
      UNKNOWN: 65535,

      0: "INTEL",
      5: "ARM",
      6: "IA64",
      9: "AMD64",
      65535: "UNKNOWN",
    });

    function SystemInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SystemInfo.prototype._read = function() {
      this.cpuArch = this._io.readU2le();
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
    Object.defineProperty(SystemInfo.prototype, 'servicePack', {
      get: function() {
        if (this._m_servicePack !== undefined)
          return this._m_servicePack;
        if (this.ofsServicePack > 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsServicePack);
          this._m_servicePack = new MinidumpString(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_servicePack;
      }
    });

    return SystemInfo;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread|Source}
   */

  var Thread = WindowsMinidump.Thread = (function() {
    function Thread(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Thread.prototype._read = function() {
      this.threadId = this._io.readU4le();
      this.suspendCount = this._io.readU4le();
      this.priorityClass = this._io.readU4le();
      this.priority = this._io.readU4le();
      this.teb = this._io.readU8le();
      this.stack = new MemoryDescriptor(this._io, this, this._root);
      this.threadContext = new LocationDescriptor(this._io, this, this._root);
    }

    /**
     * Thread Environment Block
     */

    return Thread;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list|Source}
   */

  var ThreadList = WindowsMinidump.ThreadList = (function() {
    function ThreadList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ThreadList.prototype._read = function() {
      this.numThreads = this._io.readU4le();
      this.threads = [];
      for (var i = 0; i < this.numThreads; i++) {
        this.threads.push(new Thread(this._io, this, this._root));
      }
    }

    return ThreadList;
  })();
  Object.defineProperty(WindowsMinidump.prototype, 'streams', {
    get: function() {
      if (this._m_streams !== undefined)
        return this._m_streams;
      var _pos = this._io.pos;
      this._io.seek(this.ofsStreams);
      this._m_streams = [];
      for (var i = 0; i < this.numStreams; i++) {
        this._m_streams.push(new Dir(this._io, this, this._root));
      }
      this._io.seek(_pos);
      return this._m_streams;
    }
  });

  return WindowsMinidump;
})();
WindowsMinidump_.WindowsMinidump = WindowsMinidump;
});
