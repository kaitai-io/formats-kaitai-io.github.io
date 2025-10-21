// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
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
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header">Source</a>
 */
public class WindowsMinidump extends KaitaiStruct.ReadWrite {
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
        HANDLE_OPERATION_LIST(18),
        TOKEN(19),
        JAVA_SCRIPT_DATA(20),
        SYSTEM_MEMORY_INFO(21),
        PROCESS_VM_COUNTERS(22),
        IPT_TRACE(23),
        THREAD_NAMES(24),
        CE_NULL(32768),
        CE_SYSTEM_INFO(32769),
        CE_EXCEPTION(32770),
        CE_MODULE_LIST(32771),
        CE_PROCESS_LIST(32772),
        CE_THREAD_LIST(32773),
        CE_THREAD_CONTEXT_LIST(32774),
        CE_THREAD_CALL_STACK_LIST(32775),
        CE_MEMORY_VIRTUAL_LIST(32776),
        CE_MEMORY_PHYSICAL_LIST(32777),
        CE_BUCKET_PARAMETERS(32778),
        CE_PROCESS_MODULE_MAP(32779),
        CE_DIAGNOSIS_LIST(32780),
        MD_CRASHPAD_INFO_STREAM(1129316353),
        MD_RAW_BREAKPAD_INFO(1197932545),
        MD_RAW_ASSERTION_INFO(1197932546),
        MD_LINUX_CPU_INFO(1197932547),
        MD_LINUX_PROC_STATUS(1197932548),
        MD_LINUX_LSB_RELEASE(1197932549),
        MD_LINUX_CMD_LINE(1197932550),
        MD_LINUX_ENVIRON(1197932551),
        MD_LINUX_AUXV(1197932552),
        MD_LINUX_MAPS(1197932553),
        MD_LINUX_DSO_DEBUG(1197932554);

        private final long id;
        StreamTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, StreamTypes> byId = new HashMap<Long, StreamTypes>(49);
        static {
            for (StreamTypes e : StreamTypes.values())
                byId.put(e.id(), e);
        }
        public static StreamTypes byId(long id) { return byId.get(id); }
    }
    public WindowsMinidump() {
        this(null, null, null);
    }

    public WindowsMinidump(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsMinidump(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public WindowsMinidump(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, WindowsMinidump _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic1 = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic1, new byte[] { 77, 68, 77, 80 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 68, 77, 80 }, this.magic1, this._io, "/seq/0");
        }
        this.magic2 = this._io.readBytes(2);
        if (!(Arrays.equals(this.magic2, new byte[] { -109, -89 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -109, -89 }, this.magic2, this._io, "/seq/1");
        }
        this.version = this._io.readU2le();
        this.numStreams = this._io.readU4le();
        this.ofsStreams = this._io.readU4le();
        this.checksum = this._io.readU4le();
        this.timestamp = this._io.readU4le();
        this.flags = this._io.readU8le();
        _dirty = false;
    }

    public void _fetchInstances() {
        streams();
        if (this.streams != null) {
            for (int i = 0; i < this.streams.size(); i++) {
                this.streams.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteStreams = _enabledStreams;
        this._io.writeBytes(this.magic1);
        this._io.writeBytes(this.magic2);
        this._io.writeU2le(this.version);
        this._io.writeU4le(this.numStreams);
        this._io.writeU4le(this.ofsStreams);
        this._io.writeU4le(this.checksum);
        this._io.writeU4le(this.timestamp);
        this._io.writeU8le(this.flags);
    }

    public void _check() {
        if (this.magic1.length != 4)
            throw new ConsistencyError("magic1", 4, this.magic1.length);
        if (!(Arrays.equals(this.magic1, new byte[] { 77, 68, 77, 80 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 68, 77, 80 }, this.magic1, null, "/seq/0");
        }
        if (this.magic2.length != 2)
            throw new ConsistencyError("magic2", 2, this.magic2.length);
        if (!(Arrays.equals(this.magic2, new byte[] { -109, -89 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -109, -89 }, this.magic2, null, "/seq/1");
        }
        if (_enabledStreams) {
            if (this.streams.size() != numStreams())
                throw new ConsistencyError("streams", numStreams(), this.streams.size());
            for (int i = 0; i < this.streams.size(); i++) {
                if (!Objects.equals(this.streams.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("streams", _root(), this.streams.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.streams.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("streams", this, this.streams.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory">Source</a>
     */
    public static class Dir extends KaitaiStruct.ReadWrite {
        public static Dir fromFile(String fileName) throws IOException {
            return new Dir(new ByteBufferKaitaiStream(fileName));
        }
        public Dir() {
            this(null, null, null);
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
        }
        public void _read() {
            this.streamType = WindowsMinidump.StreamTypes.byId(this._io.readU4le());
            this.lenData = this._io.readU4le();
            this.ofsData = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            data();
            if (this.data != null) {
                {
                    StreamTypes on = streamType();
                    if (on != null) {
                        switch (streamType()) {
                        case EXCEPTION: {
                            ((ExceptionStream) (this.data))._fetchInstances();
                            break;
                        }
                        case MEMORY_64_LIST: {
                            ((Memory64List) (this.data))._fetchInstances();
                            break;
                        }
                        case MEMORY_LIST: {
                            ((MemoryList) (this.data))._fetchInstances();
                            break;
                        }
                        case MISC_INFO: {
                            ((MiscInfo) (this.data))._fetchInstances();
                            break;
                        }
                        case SYSTEM_INFO: {
                            ((SystemInfo) (this.data))._fetchInstances();
                            break;
                        }
                        case THREAD_LIST: {
                            ((ThreadList) (this.data))._fetchInstances();
                            break;
                        }
                        default: {
                            break;
                        }
                        }
                    } else {
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteData = _enabledData;
            this._io.writeU4le(((Number) (this.streamType.id())).longValue());
            this._io.writeU4le(this.lenData);
            this._io.writeU4le(this.ofsData);
        }

        public void _check() {
            if (_enabledData) {
                {
                    StreamTypes on = streamType();
                    if (on != null) {
                        switch (streamType()) {
                        case EXCEPTION: {
                            if (!Objects.equals(((WindowsMinidump.ExceptionStream) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((WindowsMinidump.ExceptionStream) (this.data))._root());
                            if (!Objects.equals(((WindowsMinidump.ExceptionStream) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((WindowsMinidump.ExceptionStream) (this.data))._parent());
                            break;
                        }
                        case MEMORY_64_LIST: {
                            if (!Objects.equals(((WindowsMinidump.Memory64List) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((WindowsMinidump.Memory64List) (this.data))._root());
                            if (!Objects.equals(((WindowsMinidump.Memory64List) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((WindowsMinidump.Memory64List) (this.data))._parent());
                            break;
                        }
                        case MEMORY_LIST: {
                            if (!Objects.equals(((WindowsMinidump.MemoryList) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((WindowsMinidump.MemoryList) (this.data))._root());
                            if (!Objects.equals(((WindowsMinidump.MemoryList) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((WindowsMinidump.MemoryList) (this.data))._parent());
                            break;
                        }
                        case MISC_INFO: {
                            if (!Objects.equals(((WindowsMinidump.MiscInfo) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((WindowsMinidump.MiscInfo) (this.data))._root());
                            if (!Objects.equals(((WindowsMinidump.MiscInfo) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((WindowsMinidump.MiscInfo) (this.data))._parent());
                            break;
                        }
                        case SYSTEM_INFO: {
                            if (!Objects.equals(((WindowsMinidump.SystemInfo) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((WindowsMinidump.SystemInfo) (this.data))._root());
                            if (!Objects.equals(((WindowsMinidump.SystemInfo) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((WindowsMinidump.SystemInfo) (this.data))._parent());
                            break;
                        }
                        case THREAD_LIST: {
                            if (!Objects.equals(((WindowsMinidump.ThreadList) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((WindowsMinidump.ThreadList) (this.data))._root());
                            if (!Objects.equals(((WindowsMinidump.ThreadList) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((WindowsMinidump.ThreadList) (this.data))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.data)).length != lenData())
                                throw new ConsistencyError("data", lenData(), ((byte[]) (this.data)).length);
                            break;
                        }
                        }
                    } else {
                        if (((byte[]) (this.data)).length != lenData())
                            throw new ConsistencyError("data", lenData(), ((byte[]) (this.data)).length);
                    }
                }
            }
            _dirty = false;
        }
        private Object data;
        private boolean _shouldWriteData = false;
        private boolean _enabledData = true;
        public Object data() {
            if (_shouldWriteData)
                _writeData();
            if (this.data != null)
                return this.data;
            if (!_enabledData)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsData());
            {
                StreamTypes on = streamType();
                if (on != null) {
                    switch (streamType()) {
                    case EXCEPTION: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new ExceptionStream(_io__raw_data, this, _root);
                        ((ExceptionStream) (this.data))._read();
                        break;
                    }
                    case MEMORY_64_LIST: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Memory64List(_io__raw_data, this, _root);
                        ((Memory64List) (this.data))._read();
                        break;
                    }
                    case MEMORY_LIST: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new MemoryList(_io__raw_data, this, _root);
                        ((MemoryList) (this.data))._read();
                        break;
                    }
                    case MISC_INFO: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new MiscInfo(_io__raw_data, this, _root);
                        ((MiscInfo) (this.data))._read();
                        break;
                    }
                    case SYSTEM_INFO: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new SystemInfo(_io__raw_data, this, _root);
                        ((SystemInfo) (this.data))._read();
                        break;
                    }
                    case THREAD_LIST: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new ThreadList(_io__raw_data, this, _root);
                        ((ThreadList) (this.data))._read();
                        break;
                    }
                    default: {
                        this.data = this._io.readBytes(lenData());
                        break;
                    }
                    }
                } else {
                    this.data = this._io.readBytes(lenData());
                }
            }
            this._io.seek(_pos);
            return this.data;
        }
        public void setData(Object _v) { _dirty = true; data = _v; }
        public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

        private void _writeData() {
            _shouldWriteData = false;
            long _pos = this._io.pos();
            this._io.seek(ofsData());
            {
                StreamTypes on = streamType();
                if (on != null) {
                    switch (streamType()) {
                    case EXCEPTION: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Dir _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((ExceptionStream) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case MEMORY_64_LIST: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Dir _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Memory64List) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case MEMORY_LIST: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Dir _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((MemoryList) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case MISC_INFO: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Dir _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((MiscInfo) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case SYSTEM_INFO: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Dir _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((SystemInfo) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case THREAD_LIST: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Dir _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((ThreadList) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                }
            }
            this._io.seek(_pos);
        }
        private StreamTypes streamType;
        private long lenData;
        private long ofsData;
        private WindowsMinidump _root;
        private WindowsMinidump _parent;
        private byte[] _raw_data;
        public StreamTypes streamType() { return streamType; }
        public void setStreamType(StreamTypes _v) { _dirty = true; streamType = _v; }

        /**
         * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">Source</a>
         */
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public long ofsData() { return ofsData; }
        public void setOfsData(long _v) { _dirty = true; ofsData = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump _parent() { return _parent; }
        public void set_parent(WindowsMinidump _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception">Source</a>
     */
    public static class ExceptionRecord extends KaitaiStruct.ReadWrite {
        public static ExceptionRecord fromFile(String fileName) throws IOException {
            return new ExceptionRecord(new ByteBufferKaitaiStream(fileName));
        }
        public ExceptionRecord() {
            this(null, null, null);
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
        }
        public void _read() {
            this.code = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.innerException = this._io.readU8le();
            this.addr = this._io.readU8le();
            this.numParams = this._io.readU4le();
            this.reserved = this._io.readU4le();
            this.params = new ArrayList<Long>();
            for (int i = 0; i < 15; i++) {
                this.params.add(this._io.readU8le());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.params.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.code);
            this._io.writeU4le(this.flags);
            this._io.writeU8le(this.innerException);
            this._io.writeU8le(this.addr);
            this._io.writeU4le(this.numParams);
            this._io.writeU4le(this.reserved);
            for (int i = 0; i < this.params.size(); i++) {
                this._io.writeU8le(this.params.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.params.size() != 15)
                throw new ConsistencyError("params", 15, this.params.size());
            for (int i = 0; i < this.params.size(); i++) {
            }
            _dirty = false;
        }
        private long code;
        private long flags;
        private long innerException;
        private long addr;
        private long numParams;
        private long reserved;
        private List<Long> params;
        private WindowsMinidump _root;
        private WindowsMinidump.ExceptionStream _parent;
        public long code() { return code; }
        public void setCode(long _v) { _dirty = true; code = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public long innerException() { return innerException; }
        public void setInnerException(long _v) { _dirty = true; innerException = _v; }

        /**
         * Memory address where exception has occurred
         */
        public long addr() { return addr; }
        public void setAddr(long _v) { _dirty = true; addr = _v; }
        public long numParams() { return numParams; }
        public void setNumParams(long _v) { _dirty = true; numParams = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }

        /**
         * Additional parameters passed along with exception raise
         * function (for WinAPI, that is `RaiseException`). Meaning is
         * exception-specific. Given that this type is originally
         * defined by a C structure, it is described there as array of
         * fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
         * 15), but in reality only first `num_params` would be used.
         */
        public List<Long> params() { return params; }
        public void setParams(List<Long> _v) { _dirty = true; params = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.ExceptionStream _parent() { return _parent; }
        public void set_parent(WindowsMinidump.ExceptionStream _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream">Source</a>
     */
    public static class ExceptionStream extends KaitaiStruct.ReadWrite {
        public static ExceptionStream fromFile(String fileName) throws IOException {
            return new ExceptionStream(new ByteBufferKaitaiStream(fileName));
        }
        public ExceptionStream() {
            this(null, null, null);
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
        }
        public void _read() {
            this.threadId = this._io.readU4le();
            this.reserved = this._io.readU4le();
            this.exceptionRec = new ExceptionRecord(this._io, this, _root);
            this.exceptionRec._read();
            this.threadContext = new LocationDescriptor(this._io, this, _root);
            this.threadContext._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.exceptionRec._fetchInstances();
            this.threadContext._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.threadId);
            this._io.writeU4le(this.reserved);
            this.exceptionRec._write_Seq(this._io);
            this.threadContext._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.exceptionRec._root(), _root()))
                throw new ConsistencyError("exception_rec", _root(), this.exceptionRec._root());
            if (!Objects.equals(this.exceptionRec._parent(), this))
                throw new ConsistencyError("exception_rec", this, this.exceptionRec._parent());
            if (!Objects.equals(this.threadContext._root(), _root()))
                throw new ConsistencyError("thread_context", _root(), this.threadContext._root());
            if (!Objects.equals(this.threadContext._parent(), this))
                throw new ConsistencyError("thread_context", this, this.threadContext._parent());
            _dirty = false;
        }
        private long threadId;
        private long reserved;
        private ExceptionRecord exceptionRec;
        private LocationDescriptor threadContext;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public long threadId() { return threadId; }
        public void setThreadId(long _v) { _dirty = true; threadId = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public ExceptionRecord exceptionRec() { return exceptionRec; }
        public void setExceptionRec(ExceptionRecord _v) { _dirty = true; exceptionRec = _v; }
        public LocationDescriptor threadContext() { return threadContext; }
        public void setThreadContext(LocationDescriptor _v) { _dirty = true; threadContext = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.Dir _parent() { return _parent; }
        public void set_parent(WindowsMinidump.Dir _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">Source</a>
     */
    public static class LocationDescriptor extends KaitaiStruct.ReadWrite {
        public static LocationDescriptor fromFile(String fileName) throws IOException {
            return new LocationDescriptor(new ByteBufferKaitaiStream(fileName));
        }
        public LocationDescriptor() {
            this(null, null, null);
        }

        public LocationDescriptor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LocationDescriptor(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public LocationDescriptor(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenData = this._io.readU4le();
            this.ofsData = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            data();
            if (this.data != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteData = _enabledData;
            this._io.writeU4le(this.lenData);
            this._io.writeU4le(this.ofsData);
        }

        public void _check() {
            if (_enabledData) {
                if (this.data.length != lenData())
                    throw new ConsistencyError("data", lenData(), this.data.length);
            }
            _dirty = false;
        }
        private byte[] data;
        private boolean _shouldWriteData = false;
        private boolean _enabledData = true;
        public byte[] data() {
            if (_shouldWriteData)
                _writeData();
            if (this.data != null)
                return this.data;
            if (!_enabledData)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsData());
            this.data = io.readBytes(lenData());
            io.seek(_pos);
            return this.data;
        }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

        private void _writeData() {
            _shouldWriteData = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsData());
            io.writeBytes(this.data);
            io.seek(_pos);
        }
        private long lenData;
        private long ofsData;
        private WindowsMinidump _root;
        private KaitaiStruct.ReadWrite _parent;
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public long ofsData() { return ofsData; }
        public void setOfsData(long _v) { _dirty = true; ofsData = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list">Source</a>
     */
    public static class Memory64List extends KaitaiStruct.ReadWrite {
        public static Memory64List fromFile(String fileName) throws IOException {
            return new Memory64List(new ByteBufferKaitaiStream(fileName));
        }
        public Memory64List() {
            this(null, null, null);
        }

        public Memory64List(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Memory64List(KaitaiStream _io, WindowsMinidump.Dir _parent) {
            this(_io, _parent, null);
        }

        public Memory64List(KaitaiStream _io, WindowsMinidump.Dir _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numMemRanges = this._io.readU8le();
            this.ofsBase = this._io.readU8le();
            this.memRanges = new ArrayList<MemoryDescriptor64>();
            for (int i = 0; i < numMemRanges(); i++) {
                MemoryDescriptor64 _t_memRanges = new MemoryDescriptor64(this._io, this, _root);
                try {
                    _t_memRanges._read();
                } finally {
                    this.memRanges.add(_t_memRanges);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.memRanges.size(); i++) {
                this.memRanges.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.numMemRanges);
            this._io.writeU8le(this.ofsBase);
            for (int i = 0; i < this.memRanges.size(); i++) {
                this.memRanges.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.memRanges.size() != numMemRanges())
                throw new ConsistencyError("mem_ranges", numMemRanges(), this.memRanges.size());
            for (int i = 0; i < this.memRanges.size(); i++) {
                if (!Objects.equals(this.memRanges.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("mem_ranges", _root(), this.memRanges.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.memRanges.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("mem_ranges", this, this.memRanges.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long numMemRanges;
        private long ofsBase;
        private List<MemoryDescriptor64> memRanges;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public long numMemRanges() { return numMemRanges; }
        public void setNumMemRanges(long _v) { _dirty = true; numMemRanges = _v; }
        public long ofsBase() { return ofsBase; }
        public void setOfsBase(long _v) { _dirty = true; ofsBase = _v; }
        public List<MemoryDescriptor64> memRanges() { return memRanges; }
        public void setMemRanges(List<MemoryDescriptor64> _v) { _dirty = true; memRanges = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.Dir _parent() { return _parent; }
        public void set_parent(WindowsMinidump.Dir _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor">Source</a>
     */
    public static class MemoryDescriptor extends KaitaiStruct.ReadWrite {
        public static MemoryDescriptor fromFile(String fileName) throws IOException {
            return new MemoryDescriptor(new ByteBufferKaitaiStream(fileName));
        }
        public MemoryDescriptor() {
            this(null, null, null);
        }

        public MemoryDescriptor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MemoryDescriptor(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public MemoryDescriptor(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.addrMemoryRange = this._io.readU8le();
            this.memory = new LocationDescriptor(this._io, this, _root);
            this.memory._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.memory._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.addrMemoryRange);
            this.memory._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.memory._root(), _root()))
                throw new ConsistencyError("memory", _root(), this.memory._root());
            if (!Objects.equals(this.memory._parent(), this))
                throw new ConsistencyError("memory", this, this.memory._parent());
            _dirty = false;
        }
        private long addrMemoryRange;
        private LocationDescriptor memory;
        private WindowsMinidump _root;
        private KaitaiStruct.ReadWrite _parent;
        public long addrMemoryRange() { return addrMemoryRange; }
        public void setAddrMemoryRange(long _v) { _dirty = true; addrMemoryRange = _v; }
        public LocationDescriptor memory() { return memory; }
        public void setMemory(LocationDescriptor _v) { _dirty = true; memory = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor64">Source</a>
     */
    public static class MemoryDescriptor64 extends KaitaiStruct.ReadWrite {
        public static MemoryDescriptor64 fromFile(String fileName) throws IOException {
            return new MemoryDescriptor64(new ByteBufferKaitaiStream(fileName));
        }
        public MemoryDescriptor64() {
            this(null, null, null);
        }

        public MemoryDescriptor64(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MemoryDescriptor64(KaitaiStream _io, WindowsMinidump.Memory64List _parent) {
            this(_io, _parent, null);
        }

        public MemoryDescriptor64(KaitaiStream _io, WindowsMinidump.Memory64List _parent, WindowsMinidump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.addrMemoryRange = this._io.readU8le();
            this.lenData = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.addrMemoryRange);
            this._io.writeU8le(this.lenData);
        }

        public void _check() {
            _dirty = false;
        }
        private long addrMemoryRange;
        private long lenData;
        private WindowsMinidump _root;
        private WindowsMinidump.Memory64List _parent;
        public long addrMemoryRange() { return addrMemoryRange; }
        public void setAddrMemoryRange(long _v) { _dirty = true; addrMemoryRange = _v; }
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.Memory64List _parent() { return _parent; }
        public void set_parent(WindowsMinidump.Memory64List _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_list">Source</a>
     */
    public static class MemoryList extends KaitaiStruct.ReadWrite {
        public static MemoryList fromFile(String fileName) throws IOException {
            return new MemoryList(new ByteBufferKaitaiStream(fileName));
        }
        public MemoryList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numMemRanges = this._io.readU4le();
            this.memRanges = new ArrayList<MemoryDescriptor>();
            for (int i = 0; i < numMemRanges(); i++) {
                MemoryDescriptor _t_memRanges = new MemoryDescriptor(this._io, this, _root);
                try {
                    _t_memRanges._read();
                } finally {
                    this.memRanges.add(_t_memRanges);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.memRanges.size(); i++) {
                this.memRanges.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numMemRanges);
            for (int i = 0; i < this.memRanges.size(); i++) {
                this.memRanges.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.memRanges.size() != numMemRanges())
                throw new ConsistencyError("mem_ranges", numMemRanges(), this.memRanges.size());
            for (int i = 0; i < this.memRanges.size(); i++) {
                if (!Objects.equals(this.memRanges.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("mem_ranges", _root(), this.memRanges.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.memRanges.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("mem_ranges", this, this.memRanges.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long numMemRanges;
        private List<MemoryDescriptor> memRanges;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public long numMemRanges() { return numMemRanges; }
        public void setNumMemRanges(long _v) { _dirty = true; numMemRanges = _v; }
        public List<MemoryDescriptor> memRanges() { return memRanges; }
        public void setMemRanges(List<MemoryDescriptor> _v) { _dirty = true; memRanges = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.Dir _parent() { return _parent; }
        public void set_parent(WindowsMinidump.Dir _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Specific string serialization scheme used in MiniDump format is
     * actually a simple 32-bit length-prefixed UTF-16 string.
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string">Source</a>
     */
    public static class MinidumpString extends KaitaiStruct.ReadWrite {
        public static MinidumpString fromFile(String fileName) throws IOException {
            return new MinidumpString(new ByteBufferKaitaiStream(fileName));
        }
        public MinidumpString() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenStr = this._io.readU4le();
            this.str = new String(this._io.readBytes(lenStr()), StandardCharsets.UTF_16LE);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenStr);
            this._io.writeBytes((this.str).getBytes(Charset.forName("UTF-16LE")));
        }

        public void _check() {
            if ((this.str).getBytes(Charset.forName("UTF-16LE")).length != lenStr())
                throw new ConsistencyError("str", lenStr(), (this.str).getBytes(Charset.forName("UTF-16LE")).length);
            _dirty = false;
        }
        private long lenStr;
        private String str;
        private WindowsMinidump _root;
        private WindowsMinidump.SystemInfo _parent;
        public long lenStr() { return lenStr; }
        public void setLenStr(long _v) { _dirty = true; lenStr = _v; }
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.SystemInfo _parent() { return _parent; }
        public void set_parent(WindowsMinidump.SystemInfo _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info">Source</a>
     */
    public static class MiscInfo extends KaitaiStruct.ReadWrite {
        public static MiscInfo fromFile(String fileName) throws IOException {
            return new MiscInfo(new ByteBufferKaitaiStream(fileName));
        }
        public MiscInfo() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenInfo);
            this._io.writeU4le(this.flags1);
            this._io.writeU4le(this.processId);
            this._io.writeU4le(this.processCreateTime);
            this._io.writeU4le(this.processUserTime);
            this._io.writeU4le(this.processKernelTime);
            this._io.writeU4le(this.cpuMaxMhz);
            this._io.writeU4le(this.cpuCurMhz);
            this._io.writeU4le(this.cpuLimitMhz);
            this._io.writeU4le(this.cpuMaxIdleState);
            this._io.writeU4le(this.cpuCurIdleState);
        }

        public void _check() {
            _dirty = false;
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
        public void setLenInfo(long _v) { _dirty = true; lenInfo = _v; }
        public long flags1() { return flags1; }
        public void setFlags1(long _v) { _dirty = true; flags1 = _v; }
        public long processId() { return processId; }
        public void setProcessId(long _v) { _dirty = true; processId = _v; }
        public long processCreateTime() { return processCreateTime; }
        public void setProcessCreateTime(long _v) { _dirty = true; processCreateTime = _v; }
        public long processUserTime() { return processUserTime; }
        public void setProcessUserTime(long _v) { _dirty = true; processUserTime = _v; }
        public long processKernelTime() { return processKernelTime; }
        public void setProcessKernelTime(long _v) { _dirty = true; processKernelTime = _v; }
        public long cpuMaxMhz() { return cpuMaxMhz; }
        public void setCpuMaxMhz(long _v) { _dirty = true; cpuMaxMhz = _v; }
        public long cpuCurMhz() { return cpuCurMhz; }
        public void setCpuCurMhz(long _v) { _dirty = true; cpuCurMhz = _v; }
        public long cpuLimitMhz() { return cpuLimitMhz; }
        public void setCpuLimitMhz(long _v) { _dirty = true; cpuLimitMhz = _v; }
        public long cpuMaxIdleState() { return cpuMaxIdleState; }
        public void setCpuMaxIdleState(long _v) { _dirty = true; cpuMaxIdleState = _v; }
        public long cpuCurIdleState() { return cpuCurIdleState; }
        public void setCpuCurIdleState(long _v) { _dirty = true; cpuCurIdleState = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.Dir _parent() { return _parent; }
        public void set_parent(WindowsMinidump.Dir _v) { _dirty = true; _parent = _v; }
    }

    /**
     * "System info" stream provides basic information about the
     * hardware and operating system which produces this dump.
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info">Source</a>
     */
    public static class SystemInfo extends KaitaiStruct.ReadWrite {
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
        public SystemInfo() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
            servicePack();
            if (this.servicePack != null) {
                this.servicePack._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteServicePack = _enabledServicePack;
            this._io.writeU2le(((Number) (this.cpuArch.id())).intValue());
            this._io.writeU2le(this.cpuLevel);
            this._io.writeU2le(this.cpuRevision);
            this._io.writeU1(this.numCpus);
            this._io.writeU1(this.osType);
            this._io.writeU4le(this.osVerMajor);
            this._io.writeU4le(this.osVerMinor);
            this._io.writeU4le(this.osBuild);
            this._io.writeU4le(this.osPlatform);
            this._io.writeU4le(this.ofsServicePack);
            this._io.writeU2le(this.osSuiteMask);
            this._io.writeU2le(this.reserved2);
        }

        public void _check() {
            if (_enabledServicePack) {
                if (ofsServicePack() > 0) {
                    if (!Objects.equals(this.servicePack._root(), _root()))
                        throw new ConsistencyError("service_pack", _root(), this.servicePack._root());
                    if (!Objects.equals(this.servicePack._parent(), this))
                        throw new ConsistencyError("service_pack", this, this.servicePack._parent());
                }
            }
            _dirty = false;
        }
        private MinidumpString servicePack;
        private boolean _shouldWriteServicePack = false;
        private boolean _enabledServicePack = true;
        public MinidumpString servicePack() {
            if (_shouldWriteServicePack)
                _writeServicePack();
            if (this.servicePack != null)
                return this.servicePack;
            if (!_enabledServicePack)
                return null;
            if (ofsServicePack() > 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsServicePack());
                this.servicePack = new MinidumpString(io, this, _root);
                this.servicePack._read();
                io.seek(_pos);
            }
            return this.servicePack;
        }
        public void setServicePack(MinidumpString _v) { _dirty = true; servicePack = _v; }
        public void setServicePack_Enabled(boolean _v) { _dirty = true; _enabledServicePack = _v; }

        private void _writeServicePack() {
            _shouldWriteServicePack = false;
            if (ofsServicePack() > 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsServicePack());
                this.servicePack._write_Seq(io);
                io.seek(_pos);
            }
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
        public void setCpuArch(CpuArchs _v) { _dirty = true; cpuArch = _v; }
        public int cpuLevel() { return cpuLevel; }
        public void setCpuLevel(int _v) { _dirty = true; cpuLevel = _v; }
        public int cpuRevision() { return cpuRevision; }
        public void setCpuRevision(int _v) { _dirty = true; cpuRevision = _v; }
        public int numCpus() { return numCpus; }
        public void setNumCpus(int _v) { _dirty = true; numCpus = _v; }
        public int osType() { return osType; }
        public void setOsType(int _v) { _dirty = true; osType = _v; }
        public long osVerMajor() { return osVerMajor; }
        public void setOsVerMajor(long _v) { _dirty = true; osVerMajor = _v; }
        public long osVerMinor() { return osVerMinor; }
        public void setOsVerMinor(long _v) { _dirty = true; osVerMinor = _v; }
        public long osBuild() { return osBuild; }
        public void setOsBuild(long _v) { _dirty = true; osBuild = _v; }
        public long osPlatform() { return osPlatform; }
        public void setOsPlatform(long _v) { _dirty = true; osPlatform = _v; }
        public long ofsServicePack() { return ofsServicePack; }
        public void setOfsServicePack(long _v) { _dirty = true; ofsServicePack = _v; }
        public int osSuiteMask() { return osSuiteMask; }
        public void setOsSuiteMask(int _v) { _dirty = true; osSuiteMask = _v; }
        public int reserved2() { return reserved2; }
        public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.Dir _parent() { return _parent; }
        public void set_parent(WindowsMinidump.Dir _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread">Source</a>
     */
    public static class Thread extends KaitaiStruct.ReadWrite {
        public static Thread fromFile(String fileName) throws IOException {
            return new Thread(new ByteBufferKaitaiStream(fileName));
        }
        public Thread() {
            this(null, null, null);
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
        }
        public void _read() {
            this.threadId = this._io.readU4le();
            this.suspendCount = this._io.readU4le();
            this.priorityClass = this._io.readU4le();
            this.priority = this._io.readU4le();
            this.teb = this._io.readU8le();
            this.stack = new MemoryDescriptor(this._io, this, _root);
            this.stack._read();
            this.threadContext = new LocationDescriptor(this._io, this, _root);
            this.threadContext._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.stack._fetchInstances();
            this.threadContext._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.threadId);
            this._io.writeU4le(this.suspendCount);
            this._io.writeU4le(this.priorityClass);
            this._io.writeU4le(this.priority);
            this._io.writeU8le(this.teb);
            this.stack._write_Seq(this._io);
            this.threadContext._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.stack._root(), _root()))
                throw new ConsistencyError("stack", _root(), this.stack._root());
            if (!Objects.equals(this.stack._parent(), this))
                throw new ConsistencyError("stack", this, this.stack._parent());
            if (!Objects.equals(this.threadContext._root(), _root()))
                throw new ConsistencyError("thread_context", _root(), this.threadContext._root());
            if (!Objects.equals(this.threadContext._parent(), this))
                throw new ConsistencyError("thread_context", this, this.threadContext._parent());
            _dirty = false;
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
        public void setThreadId(long _v) { _dirty = true; threadId = _v; }
        public long suspendCount() { return suspendCount; }
        public void setSuspendCount(long _v) { _dirty = true; suspendCount = _v; }
        public long priorityClass() { return priorityClass; }
        public void setPriorityClass(long _v) { _dirty = true; priorityClass = _v; }
        public long priority() { return priority; }
        public void setPriority(long _v) { _dirty = true; priority = _v; }

        /**
         * Thread Environment Block
         */
        public long teb() { return teb; }
        public void setTeb(long _v) { _dirty = true; teb = _v; }
        public MemoryDescriptor stack() { return stack; }
        public void setStack(MemoryDescriptor _v) { _dirty = true; stack = _v; }
        public LocationDescriptor threadContext() { return threadContext; }
        public void setThreadContext(LocationDescriptor _v) { _dirty = true; threadContext = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.ThreadList _parent() { return _parent; }
        public void set_parent(WindowsMinidump.ThreadList _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list">Source</a>
     */
    public static class ThreadList extends KaitaiStruct.ReadWrite {
        public static ThreadList fromFile(String fileName) throws IOException {
            return new ThreadList(new ByteBufferKaitaiStream(fileName));
        }
        public ThreadList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numThreads = this._io.readU4le();
            this.threads = new ArrayList<Thread>();
            for (int i = 0; i < numThreads(); i++) {
                Thread _t_threads = new Thread(this._io, this, _root);
                try {
                    _t_threads._read();
                } finally {
                    this.threads.add(_t_threads);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.threads.size(); i++) {
                this.threads.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numThreads);
            for (int i = 0; i < this.threads.size(); i++) {
                this.threads.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.threads.size() != numThreads())
                throw new ConsistencyError("threads", numThreads(), this.threads.size());
            for (int i = 0; i < this.threads.size(); i++) {
                if (!Objects.equals(this.threads.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("threads", _root(), this.threads.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.threads.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("threads", this, this.threads.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long numThreads;
        private List<Thread> threads;
        private WindowsMinidump _root;
        private WindowsMinidump.Dir _parent;
        public long numThreads() { return numThreads; }
        public void setNumThreads(long _v) { _dirty = true; numThreads = _v; }
        public List<Thread> threads() { return threads; }
        public void setThreads(List<Thread> _v) { _dirty = true; threads = _v; }
        public WindowsMinidump _root() { return _root; }
        public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
        public WindowsMinidump.Dir _parent() { return _parent; }
        public void set_parent(WindowsMinidump.Dir _v) { _dirty = true; _parent = _v; }
    }
    private List<Dir> streams;
    private boolean _shouldWriteStreams = false;
    private boolean _enabledStreams = true;
    public List<Dir> streams() {
        if (_shouldWriteStreams)
            _writeStreams();
        if (this.streams != null)
            return this.streams;
        if (!_enabledStreams)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsStreams());
        this.streams = new ArrayList<Dir>();
        for (int i = 0; i < numStreams(); i++) {
            Dir _t_streams = new Dir(this._io, this, _root);
            try {
                _t_streams._read();
            } finally {
                this.streams.add(_t_streams);
            }
        }
        this._io.seek(_pos);
        return this.streams;
    }
    public void setStreams(List<Dir> _v) { _dirty = true; streams = _v; }
    public void setStreams_Enabled(boolean _v) { _dirty = true; _enabledStreams = _v; }

    private void _writeStreams() {
        _shouldWriteStreams = false;
        long _pos = this._io.pos();
        this._io.seek(ofsStreams());
        for (int i = 0; i < this.streams.size(); i++) {
            this.streams.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
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
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic1() { return magic1; }
    public void setMagic1(byte[] _v) { _dirty = true; magic1 = _v; }
    public byte[] magic2() { return magic2; }
    public void setMagic2(byte[] _v) { _dirty = true; magic2 = _v; }
    public int version() { return version; }
    public void setVersion(int _v) { _dirty = true; version = _v; }
    public long numStreams() { return numStreams; }
    public void setNumStreams(long _v) { _dirty = true; numStreams = _v; }
    public long ofsStreams() { return ofsStreams; }
    public void setOfsStreams(long _v) { _dirty = true; ofsStreams = _v; }
    public long checksum() { return checksum; }
    public void setChecksum(long _v) { _dirty = true; checksum = _v; }
    public long timestamp() { return timestamp; }
    public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
    public long flags() { return flags; }
    public void setFlags(long _v) { _dirty = true; flags = _v; }
    public WindowsMinidump _root() { return _root; }
    public void set_root(WindowsMinidump _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
