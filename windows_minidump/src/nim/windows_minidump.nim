import kaitai_struct_nim_runtime
import options

type
  WindowsMinidump* = ref object of KaitaiStruct
    `magic1`*: seq[byte]
    `magic2`*: seq[byte]
    `version`*: uint16
    `numStreams`*: uint32
    `ofsStreams`*: uint32
    `checksum`*: uint32
    `timestamp`*: uint32
    `flags`*: uint64
    `parent`*: KaitaiStruct
    `streamsInst`: seq[WindowsMinidump_Dir]
    `streamsInstFlag`: bool
  WindowsMinidump_StreamTypes* = enum
    unused = 0
    reserved_0 = 1
    reserved_1 = 2
    thread_list = 3
    module_list = 4
    memory_list = 5
    exception = 6
    system_info = 7
    thread_ex_list = 8
    memory_64_list = 9
    comment_a = 10
    comment_w = 11
    handle_data = 12
    function_table = 13
    unloaded_module_list = 14
    misc_info = 15
    memory_info_list = 16
    thread_info_list = 17
    handle_operation_list = 18
    token = 19
    java_script_data = 20
    system_memory_info = 21
    process_vm_counters = 22
    ipt_trace = 23
    thread_names = 24
    ce_null = 32768
    ce_system_info = 32769
    ce_exception = 32770
    ce_module_list = 32771
    ce_process_list = 32772
    ce_thread_list = 32773
    ce_thread_context_list = 32774
    ce_thread_call_stack_list = 32775
    ce_memory_virtual_list = 32776
    ce_memory_physical_list = 32777
    ce_bucket_parameters = 32778
    ce_process_module_map = 32779
    ce_diagnosis_list = 32780
    md_crashpad_info_stream = 1129316353
    md_raw_breakpad_info = 1197932545
    md_raw_assertion_info = 1197932546
    md_linux_cpu_info = 1197932547
    md_linux_proc_status = 1197932548
    md_linux_lsb_release = 1197932549
    md_linux_cmd_line = 1197932550
    md_linux_environ = 1197932551
    md_linux_auxv = 1197932552
    md_linux_maps = 1197932553
    md_linux_dso_debug = 1197932554
  WindowsMinidump_ThreadList* = ref object of KaitaiStruct
    `numThreads`*: uint32
    `threads`*: seq[WindowsMinidump_Thread]
    `parent`*: WindowsMinidump_Dir
  WindowsMinidump_LocationDescriptor* = ref object of KaitaiStruct
    `lenData`*: uint32
    `ofsData`*: uint32
    `parent`*: KaitaiStruct
    `dataInst`: seq[byte]
    `dataInstFlag`: bool
  WindowsMinidump_MinidumpString* = ref object of KaitaiStruct
    `lenStr`*: uint32
    `str`*: string
    `parent`*: WindowsMinidump_SystemInfo
  WindowsMinidump_SystemInfo* = ref object of KaitaiStruct
    `cpuArch`*: WindowsMinidump_SystemInfo_CpuArchs
    `cpuLevel`*: uint16
    `cpuRevision`*: uint16
    `numCpus`*: uint8
    `osType`*: uint8
    `osVerMajor`*: uint32
    `osVerMinor`*: uint32
    `osBuild`*: uint32
    `osPlatform`*: uint32
    `ofsServicePack`*: uint32
    `osSuiteMask`*: uint16
    `reserved2`*: uint16
    `parent`*: WindowsMinidump_Dir
    `servicePackInst`: WindowsMinidump_MinidumpString
    `servicePackInstFlag`: bool
  WindowsMinidump_SystemInfo_CpuArchs* = enum
    intel = 0
    arm = 5
    ia64 = 6
    amd64 = 9
    unknown = 65535
  WindowsMinidump_ExceptionRecord* = ref object of KaitaiStruct
    `code`*: uint32
    `flags`*: uint32
    `innerException`*: uint64
    `addr`*: uint64
    `numParams`*: uint32
    `reserved`*: uint32
    `params`*: seq[uint64]
    `parent`*: WindowsMinidump_ExceptionStream
  WindowsMinidump_MiscInfo* = ref object of KaitaiStruct
    `lenInfo`*: uint32
    `flags1`*: uint32
    `processId`*: uint32
    `processCreateTime`*: uint32
    `processUserTime`*: uint32
    `processKernelTime`*: uint32
    `cpuMaxMhz`*: uint32
    `cpuCurMhz`*: uint32
    `cpuLimitMhz`*: uint32
    `cpuMaxIdleState`*: uint32
    `cpuCurIdleState`*: uint32
    `parent`*: WindowsMinidump_Dir
  WindowsMinidump_Dir* = ref object of KaitaiStruct
    `streamType`*: WindowsMinidump_StreamTypes
    `lenData`*: uint32
    `ofsData`*: uint32
    `parent`*: WindowsMinidump
    `rawDataInst`*: seq[byte]
    `dataInst`: KaitaiStruct
    `dataInstFlag`: bool
  WindowsMinidump_Thread* = ref object of KaitaiStruct
    `threadId`*: uint32
    `suspendCount`*: uint32
    `priorityClass`*: uint32
    `priority`*: uint32
    `teb`*: uint64
    `stack`*: WindowsMinidump_MemoryDescriptor
    `threadContext`*: WindowsMinidump_LocationDescriptor
    `parent`*: WindowsMinidump_ThreadList
  WindowsMinidump_MemoryList* = ref object of KaitaiStruct
    `numMemRanges`*: uint32
    `memRanges`*: seq[WindowsMinidump_MemoryDescriptor]
    `parent`*: WindowsMinidump_Dir
  WindowsMinidump_MemoryDescriptor* = ref object of KaitaiStruct
    `addrMemoryRange`*: uint64
    `memory`*: WindowsMinidump_LocationDescriptor
    `parent`*: KaitaiStruct
  WindowsMinidump_ExceptionStream* = ref object of KaitaiStruct
    `threadId`*: uint32
    `reserved`*: uint32
    `exceptionRec`*: WindowsMinidump_ExceptionRecord
    `threadContext`*: WindowsMinidump_LocationDescriptor
    `parent`*: WindowsMinidump_Dir

proc read*(_: typedesc[WindowsMinidump], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsMinidump
proc read*(_: typedesc[WindowsMinidump_ThreadList], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_ThreadList
proc read*(_: typedesc[WindowsMinidump_LocationDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsMinidump_LocationDescriptor
proc read*(_: typedesc[WindowsMinidump_MinidumpString], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_SystemInfo): WindowsMinidump_MinidumpString
proc read*(_: typedesc[WindowsMinidump_SystemInfo], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_SystemInfo
proc read*(_: typedesc[WindowsMinidump_ExceptionRecord], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_ExceptionStream): WindowsMinidump_ExceptionRecord
proc read*(_: typedesc[WindowsMinidump_MiscInfo], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_MiscInfo
proc read*(_: typedesc[WindowsMinidump_Dir], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump): WindowsMinidump_Dir
proc read*(_: typedesc[WindowsMinidump_Thread], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_ThreadList): WindowsMinidump_Thread
proc read*(_: typedesc[WindowsMinidump_MemoryList], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_MemoryList
proc read*(_: typedesc[WindowsMinidump_MemoryDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsMinidump_MemoryDescriptor
proc read*(_: typedesc[WindowsMinidump_ExceptionStream], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_ExceptionStream

proc streams*(this: WindowsMinidump): seq[WindowsMinidump_Dir]
proc data*(this: WindowsMinidump_LocationDescriptor): seq[byte]
proc servicePack*(this: WindowsMinidump_SystemInfo): WindowsMinidump_MinidumpString
proc data*(this: WindowsMinidump_Dir): KaitaiStruct


##[
Windows MiniDump (MDMP) file provides a concise way to store process
core dumps, which is useful for debugging. Given its small size,
modularity, some cross-platform features and native support in some
debuggers, it is particularly useful for crash reporting, and is
used for that purpose in Windows and Google Chrome projects.

The file itself is a container, which contains a number of typed
"streams", which contain some data according to its type attribute.

@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsMinidump =
  template this: untyped = result
  this = new(WindowsMinidump)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magic1Expr = this.io.readBytes(int(4))
  this.magic1 = magic1Expr
  let magic2Expr = this.io.readBytes(int(2))
  this.magic2 = magic2Expr
  let versionExpr = this.io.readU2le()
  this.version = versionExpr
  let numStreamsExpr = this.io.readU4le()
  this.numStreams = numStreamsExpr
  let ofsStreamsExpr = this.io.readU4le()
  this.ofsStreams = ofsStreamsExpr
  let checksumExpr = this.io.readU4le()
  this.checksum = checksumExpr
  let timestampExpr = this.io.readU4le()
  this.timestamp = timestampExpr
  let flagsExpr = this.io.readU8le()
  this.flags = flagsExpr

proc streams(this: WindowsMinidump): seq[WindowsMinidump_Dir] = 
  if this.streamsInstFlag:
    return this.streamsInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsStreams))
  for i in 0 ..< int(this.numStreams):
    let it = WindowsMinidump_Dir.read(this.io, this.root, this)
    this.streamsInst.add(it)
  this.io.seek(pos)
  this.streamsInstFlag = true
  return this.streamsInst

proc fromFile*(_: typedesc[WindowsMinidump], filename: string): WindowsMinidump =
  WindowsMinidump.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_ThreadList], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_ThreadList =
  template this: untyped = result
  this = new(WindowsMinidump_ThreadList)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numThreadsExpr = this.io.readU4le()
  this.numThreads = numThreadsExpr
  for i in 0 ..< int(this.numThreads):
    let it = WindowsMinidump_Thread.read(this.io, this.root, this)
    this.threads.add(it)

proc fromFile*(_: typedesc[WindowsMinidump_ThreadList], filename: string): WindowsMinidump_ThreadList =
  WindowsMinidump_ThreadList.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_LocationDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsMinidump_LocationDescriptor =
  template this: untyped = result
  this = new(WindowsMinidump_LocationDescriptor)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let ofsDataExpr = this.io.readU4le()
  this.ofsData = ofsDataExpr

proc data(this: WindowsMinidump_LocationDescriptor): seq[byte] = 
  if this.dataInstFlag:
    return this.dataInst
  let io = WindowsMinidump(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsData))
  let dataInstExpr = io.readBytes(int(this.lenData))
  this.dataInst = dataInstExpr
  io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[WindowsMinidump_LocationDescriptor], filename: string): WindowsMinidump_LocationDescriptor =
  WindowsMinidump_LocationDescriptor.read(newKaitaiFileStream(filename), nil, nil)


##[
Specific string serialization scheme used in MiniDump format is
actually a simple 32-bit length-prefixed UTF-16 string.

@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_MinidumpString], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_SystemInfo): WindowsMinidump_MinidumpString =
  template this: untyped = result
  this = new(WindowsMinidump_MinidumpString)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenStrExpr = this.io.readU4le()
  this.lenStr = lenStrExpr
  let strExpr = encode(this.io.readBytes(int(this.lenStr)), "UTF-16LE")
  this.str = strExpr

proc fromFile*(_: typedesc[WindowsMinidump_MinidumpString], filename: string): WindowsMinidump_MinidumpString =
  WindowsMinidump_MinidumpString.read(newKaitaiFileStream(filename), nil, nil)


##[
"System info" stream provides basic information about the
hardware and operating system which produces this dump.

@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_SystemInfo], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_SystemInfo =
  template this: untyped = result
  this = new(WindowsMinidump_SystemInfo)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let cpuArchExpr = WindowsMinidump_SystemInfo_CpuArchs(this.io.readU2le())
  this.cpuArch = cpuArchExpr
  let cpuLevelExpr = this.io.readU2le()
  this.cpuLevel = cpuLevelExpr
  let cpuRevisionExpr = this.io.readU2le()
  this.cpuRevision = cpuRevisionExpr
  let numCpusExpr = this.io.readU1()
  this.numCpus = numCpusExpr
  let osTypeExpr = this.io.readU1()
  this.osType = osTypeExpr
  let osVerMajorExpr = this.io.readU4le()
  this.osVerMajor = osVerMajorExpr
  let osVerMinorExpr = this.io.readU4le()
  this.osVerMinor = osVerMinorExpr
  let osBuildExpr = this.io.readU4le()
  this.osBuild = osBuildExpr
  let osPlatformExpr = this.io.readU4le()
  this.osPlatform = osPlatformExpr
  let ofsServicePackExpr = this.io.readU4le()
  this.ofsServicePack = ofsServicePackExpr
  let osSuiteMaskExpr = this.io.readU2le()
  this.osSuiteMask = osSuiteMaskExpr
  let reserved2Expr = this.io.readU2le()
  this.reserved2 = reserved2Expr

proc servicePack(this: WindowsMinidump_SystemInfo): WindowsMinidump_MinidumpString = 
  if this.servicePackInstFlag:
    return this.servicePackInst
  if this.ofsServicePack > 0:
    let io = WindowsMinidump(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsServicePack))
    let servicePackInstExpr = WindowsMinidump_MinidumpString.read(io, this.root, this)
    this.servicePackInst = servicePackInstExpr
    io.seek(pos)
  this.servicePackInstFlag = true
  return this.servicePackInst

proc fromFile*(_: typedesc[WindowsMinidump_SystemInfo], filename: string): WindowsMinidump_SystemInfo =
  WindowsMinidump_SystemInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_ExceptionRecord], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_ExceptionStream): WindowsMinidump_ExceptionRecord =
  template this: untyped = result
  this = new(WindowsMinidump_ExceptionRecord)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = this.io.readU4le()
  this.code = codeExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let innerExceptionExpr = this.io.readU8le()
  this.innerException = innerExceptionExpr

  ##[
  Memory address where exception has occurred
  ]##
  let addrExpr = this.io.readU8le()
  this.addr = addrExpr
  let numParamsExpr = this.io.readU4le()
  this.numParams = numParamsExpr
  let reservedExpr = this.io.readU4le()
  this.reserved = reservedExpr

  ##[
  Additional parameters passed along with exception raise
function (for WinAPI, that is `RaiseException`). Meaning is
exception-specific. Given that this type is originally
defined by a C structure, it is described there as array of
fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
15), but in reality only first `num_params` would be used.

  ]##
  for i in 0 ..< int(15):
    let it = this.io.readU8le()
    this.params.add(it)

proc fromFile*(_: typedesc[WindowsMinidump_ExceptionRecord], filename: string): WindowsMinidump_ExceptionRecord =
  WindowsMinidump_ExceptionRecord.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_MiscInfo], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_MiscInfo =
  template this: untyped = result
  this = new(WindowsMinidump_MiscInfo)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenInfoExpr = this.io.readU4le()
  this.lenInfo = lenInfoExpr
  let flags1Expr = this.io.readU4le()
  this.flags1 = flags1Expr
  let processIdExpr = this.io.readU4le()
  this.processId = processIdExpr
  let processCreateTimeExpr = this.io.readU4le()
  this.processCreateTime = processCreateTimeExpr
  let processUserTimeExpr = this.io.readU4le()
  this.processUserTime = processUserTimeExpr
  let processKernelTimeExpr = this.io.readU4le()
  this.processKernelTime = processKernelTimeExpr
  let cpuMaxMhzExpr = this.io.readU4le()
  this.cpuMaxMhz = cpuMaxMhzExpr
  let cpuCurMhzExpr = this.io.readU4le()
  this.cpuCurMhz = cpuCurMhzExpr
  let cpuLimitMhzExpr = this.io.readU4le()
  this.cpuLimitMhz = cpuLimitMhzExpr
  let cpuMaxIdleStateExpr = this.io.readU4le()
  this.cpuMaxIdleState = cpuMaxIdleStateExpr
  let cpuCurIdleStateExpr = this.io.readU4le()
  this.cpuCurIdleState = cpuCurIdleStateExpr

proc fromFile*(_: typedesc[WindowsMinidump_MiscInfo], filename: string): WindowsMinidump_MiscInfo =
  WindowsMinidump_MiscInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_Dir], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump): WindowsMinidump_Dir =
  template this: untyped = result
  this = new(WindowsMinidump_Dir)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let streamTypeExpr = WindowsMinidump_StreamTypes(this.io.readU4le())
  this.streamType = streamTypeExpr

  ##[
  @see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">Source</a>
  ]##
  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let ofsDataExpr = this.io.readU4le()
  this.ofsData = ofsDataExpr

proc data(this: WindowsMinidump_Dir): KaitaiStruct = 
  if this.dataInstFlag:
    return this.dataInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsData))
  block:
    let on = this.streamType
    if on == windows_minidump.memory_list:
      let rawDataInstExpr = this.io.readBytes(int(this.lenData))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = WindowsMinidump_MemoryList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == windows_minidump.misc_info:
      let rawDataInstExpr = this.io.readBytes(int(this.lenData))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = WindowsMinidump_MiscInfo.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == windows_minidump.thread_list:
      let rawDataInstExpr = this.io.readBytes(int(this.lenData))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = WindowsMinidump_ThreadList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == windows_minidump.exception:
      let rawDataInstExpr = this.io.readBytes(int(this.lenData))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = WindowsMinidump_ExceptionStream.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == windows_minidump.system_info:
      let rawDataInstExpr = this.io.readBytes(int(this.lenData))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = WindowsMinidump_SystemInfo.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    else:
      let dataInstExpr = this.io.readBytes(int(this.lenData))
      this.dataInst = dataInstExpr
  this.io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[WindowsMinidump_Dir], filename: string): WindowsMinidump_Dir =
  WindowsMinidump_Dir.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_Thread], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_ThreadList): WindowsMinidump_Thread =
  template this: untyped = result
  this = new(WindowsMinidump_Thread)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let threadIdExpr = this.io.readU4le()
  this.threadId = threadIdExpr
  let suspendCountExpr = this.io.readU4le()
  this.suspendCount = suspendCountExpr
  let priorityClassExpr = this.io.readU4le()
  this.priorityClass = priorityClassExpr
  let priorityExpr = this.io.readU4le()
  this.priority = priorityExpr

  ##[
  Thread Environment Block
  ]##
  let tebExpr = this.io.readU8le()
  this.teb = tebExpr
  let stackExpr = WindowsMinidump_MemoryDescriptor.read(this.io, this.root, this)
  this.stack = stackExpr
  let threadContextExpr = WindowsMinidump_LocationDescriptor.read(this.io, this.root, this)
  this.threadContext = threadContextExpr

proc fromFile*(_: typedesc[WindowsMinidump_Thread], filename: string): WindowsMinidump_Thread =
  WindowsMinidump_Thread.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_MemoryList], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_MemoryList =
  template this: untyped = result
  this = new(WindowsMinidump_MemoryList)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numMemRangesExpr = this.io.readU4le()
  this.numMemRanges = numMemRangesExpr
  for i in 0 ..< int(this.numMemRanges):
    let it = WindowsMinidump_MemoryDescriptor.read(this.io, this.root, this)
    this.memRanges.add(it)

proc fromFile*(_: typedesc[WindowsMinidump_MemoryList], filename: string): WindowsMinidump_MemoryList =
  WindowsMinidump_MemoryList.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_MemoryDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsMinidump_MemoryDescriptor =
  template this: untyped = result
  this = new(WindowsMinidump_MemoryDescriptor)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let addrMemoryRangeExpr = this.io.readU8le()
  this.addrMemoryRange = addrMemoryRangeExpr
  let memoryExpr = WindowsMinidump_LocationDescriptor.read(this.io, this.root, this)
  this.memory = memoryExpr

proc fromFile*(_: typedesc[WindowsMinidump_MemoryDescriptor], filename: string): WindowsMinidump_MemoryDescriptor =
  WindowsMinidump_MemoryDescriptor.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream">Source</a>
]##
proc read*(_: typedesc[WindowsMinidump_ExceptionStream], io: KaitaiStream, root: KaitaiStruct, parent: WindowsMinidump_Dir): WindowsMinidump_ExceptionStream =
  template this: untyped = result
  this = new(WindowsMinidump_ExceptionStream)
  let root = if root == nil: cast[WindowsMinidump](this) else: cast[WindowsMinidump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let threadIdExpr = this.io.readU4le()
  this.threadId = threadIdExpr
  let reservedExpr = this.io.readU4le()
  this.reserved = reservedExpr
  let exceptionRecExpr = WindowsMinidump_ExceptionRecord.read(this.io, this.root, this)
  this.exceptionRec = exceptionRecExpr
  let threadContextExpr = WindowsMinidump_LocationDescriptor.read(this.io, this.root, this)
  this.threadContext = threadContextExpr

proc fromFile*(_: typedesc[WindowsMinidump_ExceptionStream], filename: string): WindowsMinidump_ExceptionStream =
  WindowsMinidump_ExceptionStream.read(newKaitaiFileStream(filename), nil, nil)

