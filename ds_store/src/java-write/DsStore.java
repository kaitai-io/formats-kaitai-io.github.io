// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * Apple macOS '.DS_Store' file format.
 * @see <a href="https://en.wikipedia.org/wiki/.DS_Store">Source</a>
 * @see <a href="https://metacpan.org/dist/Mac-Finder-DSStore/view/DSStoreFormat.pod">Source</a>
 * @see <a href="https://0day.work/parsing-the-ds_store-file-format/">Source</a>
 */
public class DsStore extends KaitaiStruct.ReadWrite {
    public static DsStore fromFile(String fileName) throws IOException {
        return new DsStore(new ByteBufferKaitaiStream(fileName));
    }
    public DsStore() {
        this(null, null, null);
    }

    public DsStore(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DsStore(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public DsStore(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DsStore _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.alignmentHeader = this._io.readBytes(4);
        if (!(Arrays.equals(this.alignmentHeader, new byte[] { 0, 0, 0, 1 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 1 }, this.alignmentHeader, this._io, "/seq/0");
        }
        this.buddyAllocatorHeader = new BuddyAllocatorHeader(this._io, this, _root);
        this.buddyAllocatorHeader._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.buddyAllocatorHeader._fetchInstances();
        buddyAllocatorBody();
        if (this.buddyAllocatorBody != null) {
            this.buddyAllocatorBody._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteBuddyAllocatorBody = _enabledBuddyAllocatorBody;
        this._io.writeBytes(this.alignmentHeader);
        this.buddyAllocatorHeader._write_Seq(this._io);
    }

    public void _check() {
        if (this.alignmentHeader.length != 4)
            throw new ConsistencyError("alignment_header", 4, this.alignmentHeader.length);
        if (!(Arrays.equals(this.alignmentHeader, new byte[] { 0, 0, 0, 1 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 1 }, this.alignmentHeader, null, "/seq/0");
        }
        if (!Objects.equals(this.buddyAllocatorHeader._root(), _root()))
            throw new ConsistencyError("buddy_allocator_header", _root(), this.buddyAllocatorHeader._root());
        if (!Objects.equals(this.buddyAllocatorHeader._parent(), this))
            throw new ConsistencyError("buddy_allocator_header", this, this.buddyAllocatorHeader._parent());
        if (_enabledBuddyAllocatorBody) {
            if (!Objects.equals(this.buddyAllocatorBody._root(), _root()))
                throw new ConsistencyError("buddy_allocator_body", _root(), this.buddyAllocatorBody._root());
            if (!Objects.equals(this.buddyAllocatorBody._parent(), this))
                throw new ConsistencyError("buddy_allocator_body", this, this.buddyAllocatorBody._parent());
        }
        _dirty = false;
    }
    public static class Block extends KaitaiStruct.ReadWrite {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }
        public Block() {
            this(null, null, null);
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DsStore _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.mode = this._io.readU4be();
            this.counter = this._io.readU4be();
            this.data = new ArrayList<BlockData>();
            for (int i = 0; i < counter(); i++) {
                BlockData _t_data = new BlockData(this._io, this, _root, mode());
                try {
                    _t_data._read();
                } finally {
                    this.data.add(_t_data);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.data.size(); i++) {
                this.data.get(((Number) (i)).intValue())._fetchInstances();
            }
            rightmostBlock();
            if (this.rightmostBlock != null) {
                this.rightmostBlock._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteRightmostBlock = _enabledRightmostBlock;
            this._io.writeU4be(this.mode);
            this._io.writeU4be(this.counter);
            for (int i = 0; i < this.data.size(); i++) {
                this.data.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.data.size() != counter())
                throw new ConsistencyError("data", counter(), this.data.size());
            for (int i = 0; i < this.data.size(); i++) {
                if (!Objects.equals(this.data.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("data", _root(), this.data.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.data.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("data", this, this.data.get(((Number) (i)).intValue())._parent());
                if (this.data.get(((Number) (i)).intValue()).mode() != mode())
                    throw new ConsistencyError("data", mode(), this.data.get(((Number) (i)).intValue()).mode());
            }
            if (_enabledRightmostBlock) {
                if (mode() > 0) {
                    if (!Objects.equals(this.rightmostBlock._root(), _root()))
                        throw new ConsistencyError("rightmost_block", _root(), this.rightmostBlock._root());
                    if (!Objects.equals(this.rightmostBlock._parent(), this))
                        throw new ConsistencyError("rightmost_block", this, this.rightmostBlock._parent());
                }
            }
            _dirty = false;
        }
        public static class BlockData extends KaitaiStruct.ReadWrite {
            public BlockData(long mode) {
                this(null, null, null, mode);
            }

            public BlockData(KaitaiStream _io, long mode) {
                this(_io, null, null, mode);
            }

            public BlockData(KaitaiStream _io, DsStore.Block _parent, long mode) {
                this(_io, _parent, null, mode);
            }

            public BlockData(KaitaiStream _io, DsStore.Block _parent, DsStore _root, long mode) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.mode = mode;
            }
            public void _read() {
                if (mode() > 0) {
                    this.blockId = this._io.readU4be();
                }
                this.record = new Record(this._io, this, _root);
                this.record._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                if (mode() > 0) {
                }
                this.record._fetchInstances();
                block();
                if (this.block != null) {
                    this.block._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteBlock = _enabledBlock;
                if (mode() > 0) {
                    this._io.writeU4be(this.blockId);
                }
                this.record._write_Seq(this._io);
            }

            public void _check() {
                if (mode() > 0) {
                }
                if (!Objects.equals(this.record._root(), _root()))
                    throw new ConsistencyError("record", _root(), this.record._root());
                if (!Objects.equals(this.record._parent(), this))
                    throw new ConsistencyError("record", this, this.record._parent());
                if (_enabledBlock) {
                    if (mode() > 0) {
                        if (!Objects.equals(this.block._root(), _root()))
                            throw new ConsistencyError("block", _root(), this.block._root());
                        if (!Objects.equals(this.block._parent(), this))
                            throw new ConsistencyError("block", this, this.block._parent());
                    }
                }
                _dirty = false;
            }
            public static class Record extends KaitaiStruct.ReadWrite {
                public static Record fromFile(String fileName) throws IOException {
                    return new Record(new ByteBufferKaitaiStream(fileName));
                }
                public Record() {
                    this(null, null, null);
                }

                public Record(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Record(KaitaiStream _io, DsStore.Block.BlockData _parent) {
                    this(_io, _parent, null);
                }

                public Record(KaitaiStream _io, DsStore.Block.BlockData _parent, DsStore _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.filename = new Ustr(this._io, this, _root);
                    this.filename._read();
                    this.structureType = new FourCharCode(this._io, this, _root);
                    this.structureType._read();
                    this.dataType = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
                    switch (dataType()) {
                    case "blob": {
                        this.value = new RecordBlob(this._io, this, _root);
                        ((RecordBlob) (this.value))._read();
                        break;
                    }
                    case "bool": {
                        this.value = ((Object) (this._io.readU1()));
                        break;
                    }
                    case "comp": {
                        this.value = ((Object) (this._io.readU8be()));
                        break;
                    }
                    case "dutc": {
                        this.value = ((Object) (this._io.readU8be()));
                        break;
                    }
                    case "long": {
                        this.value = ((Object) (this._io.readU4be()));
                        break;
                    }
                    case "shor": {
                        this.value = ((Object) (this._io.readU4be()));
                        break;
                    }
                    case "type": {
                        this.value = new FourCharCode(this._io, this, _root);
                        ((FourCharCode) (this.value))._read();
                        break;
                    }
                    case "ustr": {
                        this.value = new Ustr(this._io, this, _root);
                        ((Ustr) (this.value))._read();
                        break;
                    }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.filename._fetchInstances();
                    this.structureType._fetchInstances();
                    switch (dataType()) {
                    case "blob": {
                        ((RecordBlob) (this.value))._fetchInstances();
                        break;
                    }
                    case "bool": {
                        break;
                    }
                    case "comp": {
                        break;
                    }
                    case "dutc": {
                        break;
                    }
                    case "long": {
                        break;
                    }
                    case "shor": {
                        break;
                    }
                    case "type": {
                        ((FourCharCode) (this.value))._fetchInstances();
                        break;
                    }
                    case "ustr": {
                        ((Ustr) (this.value))._fetchInstances();
                        break;
                    }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.filename._write_Seq(this._io);
                    this.structureType._write_Seq(this._io);
                    this._io.writeBytes((this.dataType).getBytes(Charset.forName("UTF-8")));
                    switch (dataType()) {
                    case "blob": {
                        ((RecordBlob) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case "bool": {
                        this._io.writeU1(((Number) (this.value)).intValue());
                        break;
                    }
                    case "comp": {
                        this._io.writeU8be(((Number) (this.value)).longValue());
                        break;
                    }
                    case "dutc": {
                        this._io.writeU8be(((Number) (this.value)).longValue());
                        break;
                    }
                    case "long": {
                        this._io.writeU4be(((Number) (this.value)).longValue());
                        break;
                    }
                    case "shor": {
                        this._io.writeU4be(((Number) (this.value)).longValue());
                        break;
                    }
                    case "type": {
                        ((FourCharCode) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case "ustr": {
                        ((Ustr) (this.value))._write_Seq(this._io);
                        break;
                    }
                    }
                }

                public void _check() {
                    if (!Objects.equals(this.filename._root(), _root()))
                        throw new ConsistencyError("filename", _root(), this.filename._root());
                    if (!Objects.equals(this.filename._parent(), this))
                        throw new ConsistencyError("filename", this, this.filename._parent());
                    if (!Objects.equals(this.structureType._root(), _root()))
                        throw new ConsistencyError("structure_type", _root(), this.structureType._root());
                    if (!Objects.equals(this.structureType._parent(), this))
                        throw new ConsistencyError("structure_type", this, this.structureType._parent());
                    if ((this.dataType).getBytes(Charset.forName("UTF-8")).length != 4)
                        throw new ConsistencyError("data_type", 4, (this.dataType).getBytes(Charset.forName("UTF-8")).length);
                    switch (dataType()) {
                    case "blob": {
                        if (!Objects.equals(((DsStore.Block.BlockData.Record.RecordBlob) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((DsStore.Block.BlockData.Record.RecordBlob) (this.value))._root());
                        if (!Objects.equals(((DsStore.Block.BlockData.Record.RecordBlob) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((DsStore.Block.BlockData.Record.RecordBlob) (this.value))._parent());
                        break;
                    }
                    case "bool": {
                        break;
                    }
                    case "comp": {
                        break;
                    }
                    case "dutc": {
                        break;
                    }
                    case "long": {
                        break;
                    }
                    case "shor": {
                        break;
                    }
                    case "type": {
                        if (!Objects.equals(((DsStore.Block.BlockData.Record.FourCharCode) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((DsStore.Block.BlockData.Record.FourCharCode) (this.value))._root());
                        if (!Objects.equals(((DsStore.Block.BlockData.Record.FourCharCode) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((DsStore.Block.BlockData.Record.FourCharCode) (this.value))._parent());
                        break;
                    }
                    case "ustr": {
                        if (!Objects.equals(((DsStore.Block.BlockData.Record.Ustr) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((DsStore.Block.BlockData.Record.Ustr) (this.value))._root());
                        if (!Objects.equals(((DsStore.Block.BlockData.Record.Ustr) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((DsStore.Block.BlockData.Record.Ustr) (this.value))._parent());
                        break;
                    }
                    }
                    _dirty = false;
                }
                public static class FourCharCode extends KaitaiStruct.ReadWrite {
                    public static FourCharCode fromFile(String fileName) throws IOException {
                        return new FourCharCode(new ByteBufferKaitaiStream(fileName));
                    }
                    public FourCharCode() {
                        this(null, null, null);
                    }

                    public FourCharCode(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public FourCharCode(KaitaiStream _io, DsStore.Block.BlockData.Record _parent) {
                        this(_io, _parent, null);
                    }

                    public FourCharCode(KaitaiStream _io, DsStore.Block.BlockData.Record _parent, DsStore _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.value = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeBytes((this.value).getBytes(Charset.forName("UTF-8")));
                    }

                    public void _check() {
                        if ((this.value).getBytes(Charset.forName("UTF-8")).length != 4)
                            throw new ConsistencyError("value", 4, (this.value).getBytes(Charset.forName("UTF-8")).length);
                        _dirty = false;
                    }
                    private String value;
                    private DsStore _root;
                    private DsStore.Block.BlockData.Record _parent;
                    public String value() { return value; }
                    public void setValue(String _v) { _dirty = true; value = _v; }
                    public DsStore _root() { return _root; }
                    public void set_root(DsStore _v) { _dirty = true; _root = _v; }
                    public DsStore.Block.BlockData.Record _parent() { return _parent; }
                    public void set_parent(DsStore.Block.BlockData.Record _v) { _dirty = true; _parent = _v; }
                }
                public static class RecordBlob extends KaitaiStruct.ReadWrite {
                    public static RecordBlob fromFile(String fileName) throws IOException {
                        return new RecordBlob(new ByteBufferKaitaiStream(fileName));
                    }
                    public RecordBlob() {
                        this(null, null, null);
                    }

                    public RecordBlob(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public RecordBlob(KaitaiStream _io, DsStore.Block.BlockData.Record _parent) {
                        this(_io, _parent, null);
                    }

                    public RecordBlob(KaitaiStream _io, DsStore.Block.BlockData.Record _parent, DsStore _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.length = this._io.readU4be();
                        this.value = this._io.readBytes(length());
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeU4be(this.length);
                        this._io.writeBytes(this.value);
                    }

                    public void _check() {
                        if (this.value.length != length())
                            throw new ConsistencyError("value", length(), this.value.length);
                        _dirty = false;
                    }
                    private long length;
                    private byte[] value;
                    private DsStore _root;
                    private DsStore.Block.BlockData.Record _parent;
                    public long length() { return length; }
                    public void setLength(long _v) { _dirty = true; length = _v; }
                    public byte[] value() { return value; }
                    public void setValue(byte[] _v) { _dirty = true; value = _v; }
                    public DsStore _root() { return _root; }
                    public void set_root(DsStore _v) { _dirty = true; _root = _v; }
                    public DsStore.Block.BlockData.Record _parent() { return _parent; }
                    public void set_parent(DsStore.Block.BlockData.Record _v) { _dirty = true; _parent = _v; }
                }
                public static class Ustr extends KaitaiStruct.ReadWrite {
                    public static Ustr fromFile(String fileName) throws IOException {
                        return new Ustr(new ByteBufferKaitaiStream(fileName));
                    }
                    public Ustr() {
                        this(null, null, null);
                    }

                    public Ustr(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public Ustr(KaitaiStream _io, DsStore.Block.BlockData.Record _parent) {
                        this(_io, _parent, null);
                    }

                    public Ustr(KaitaiStream _io, DsStore.Block.BlockData.Record _parent, DsStore _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.length = this._io.readU4be();
                        this.value = new String(this._io.readBytes(2 * length()), StandardCharsets.UTF_16BE);
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeU4be(this.length);
                        this._io.writeBytes((this.value).getBytes(Charset.forName("UTF-16BE")));
                    }

                    public void _check() {
                        if ((this.value).getBytes(Charset.forName("UTF-16BE")).length != 2 * length())
                            throw new ConsistencyError("value", 2 * length(), (this.value).getBytes(Charset.forName("UTF-16BE")).length);
                        _dirty = false;
                    }
                    private long length;
                    private String value;
                    private DsStore _root;
                    private DsStore.Block.BlockData.Record _parent;
                    public long length() { return length; }
                    public void setLength(long _v) { _dirty = true; length = _v; }
                    public String value() { return value; }
                    public void setValue(String _v) { _dirty = true; value = _v; }
                    public DsStore _root() { return _root; }
                    public void set_root(DsStore _v) { _dirty = true; _root = _v; }
                    public DsStore.Block.BlockData.Record _parent() { return _parent; }
                    public void set_parent(DsStore.Block.BlockData.Record _v) { _dirty = true; _parent = _v; }
                }
                private Ustr filename;
                private FourCharCode structureType;
                private String dataType;
                private Object value;
                private DsStore _root;
                private DsStore.Block.BlockData _parent;
                public Ustr filename() { return filename; }
                public void setFilename(Ustr _v) { _dirty = true; filename = _v; }

                /**
                 * Description of the entry's property.
                 */
                public FourCharCode structureType() { return structureType; }
                public void setStructureType(FourCharCode _v) { _dirty = true; structureType = _v; }

                /**
                 * Data type of the value.
                 */
                public String dataType() { return dataType; }
                public void setDataType(String _v) { _dirty = true; dataType = _v; }
                public Object value() { return value; }
                public void setValue(Object _v) { _dirty = true; value = _v; }
                public DsStore _root() { return _root; }
                public void set_root(DsStore _v) { _dirty = true; _root = _v; }
                public DsStore.Block.BlockData _parent() { return _parent; }
                public void set_parent(DsStore.Block.BlockData _v) { _dirty = true; _parent = _v; }
            }
            private Block block;
            private boolean _shouldWriteBlock = false;
            private boolean _enabledBlock = true;
            public Block block() {
                if (_shouldWriteBlock)
                    _writeBlock();
                if (this.block != null)
                    return this.block;
                if (!_enabledBlock)
                    return null;
                if (mode() > 0) {
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(_root().buddyAllocatorBody().blockAddresses().get(((Number) (((Number) (blockId())).longValue())).intValue()).offset());
                    this.block = new Block(io, this, _root);
                    this.block._read();
                    io.seek(_pos);
                }
                return this.block;
            }
            public void setBlock(Block _v) { _dirty = true; block = _v; }
            public void setBlock_Enabled(boolean _v) { _dirty = true; _enabledBlock = _v; }

            private void _writeBlock() {
                _shouldWriteBlock = false;
                if (mode() > 0) {
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(_root().buddyAllocatorBody().blockAddresses().get(((Number) (((Number) (blockId())).longValue())).intValue()).offset());
                    this.block._write_Seq(io);
                    io.seek(_pos);
                }
            }
            private Long blockId;
            private Record record;
            private long mode;
            private DsStore _root;
            private DsStore.Block _parent;
            public Long blockId() { return blockId; }
            public void setBlockId(Long _v) { _dirty = true; blockId = _v; }
            public Record record() { return record; }
            public void setRecord(Record _v) { _dirty = true; record = _v; }
            public long mode() { return mode; }
            public void setMode(long _v) { _dirty = true; mode = _v; }
            public DsStore _root() { return _root; }
            public void set_root(DsStore _v) { _dirty = true; _root = _v; }
            public DsStore.Block _parent() { return _parent; }
            public void set_parent(DsStore.Block _v) { _dirty = true; _parent = _v; }
        }
        private Block rightmostBlock;
        private boolean _shouldWriteRightmostBlock = false;
        private boolean _enabledRightmostBlock = true;

        /**
         * Rightmost child block pointer.
         */
        public Block rightmostBlock() {
            if (_shouldWriteRightmostBlock)
                _writeRightmostBlock();
            if (this.rightmostBlock != null)
                return this.rightmostBlock;
            if (!_enabledRightmostBlock)
                return null;
            if (mode() > 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(_root().buddyAllocatorBody().blockAddresses().get(((Number) (mode())).intValue()).offset());
                this.rightmostBlock = new Block(io, this, _root);
                this.rightmostBlock._read();
                io.seek(_pos);
            }
            return this.rightmostBlock;
        }
        public void setRightmostBlock(Block _v) { _dirty = true; rightmostBlock = _v; }
        public void setRightmostBlock_Enabled(boolean _v) { _dirty = true; _enabledRightmostBlock = _v; }

        private void _writeRightmostBlock() {
            _shouldWriteRightmostBlock = false;
            if (mode() > 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(_root().buddyAllocatorBody().blockAddresses().get(((Number) (mode())).intValue()).offset());
                this.rightmostBlock._write_Seq(io);
                io.seek(_pos);
            }
        }
        private long mode;
        private long counter;
        private List<BlockData> data;
        private DsStore _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * If mode is 0, this is a leaf node, otherwise it is an internal node.
         */
        public long mode() { return mode; }
        public void setMode(long _v) { _dirty = true; mode = _v; }

        /**
         * Number of records or number of block id + record pairs.
         */
        public long counter() { return counter; }
        public void setCounter(long _v) { _dirty = true; counter = _v; }
        public List<BlockData> data() { return data; }
        public void setData(List<BlockData> _v) { _dirty = true; data = _v; }
        public DsStore _root() { return _root; }
        public void set_root(DsStore _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class BuddyAllocatorBody extends KaitaiStruct.ReadWrite {
        public static BuddyAllocatorBody fromFile(String fileName) throws IOException {
            return new BuddyAllocatorBody(new ByteBufferKaitaiStream(fileName));
        }
        public BuddyAllocatorBody() {
            this(null, null, null);
        }

        public BuddyAllocatorBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BuddyAllocatorBody(KaitaiStream _io, DsStore _parent) {
            this(_io, _parent, null);
        }

        public BuddyAllocatorBody(KaitaiStream _io, DsStore _parent, DsStore _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numBlocks = this._io.readU4be();
            this._unnamed1 = this._io.readBytes(4);
            this.blockAddresses = new ArrayList<BlockDescriptor>();
            for (int i = 0; i < numBlockAddresses(); i++) {
                BlockDescriptor _t_blockAddresses = new BlockDescriptor(this._io, this, _root);
                try {
                    _t_blockAddresses._read();
                } finally {
                    this.blockAddresses.add(_t_blockAddresses);
                }
            }
            this.numDirectories = this._io.readU4be();
            this.directoryEntries = new ArrayList<DirectoryEntry>();
            for (int i = 0; i < numDirectories(); i++) {
                DirectoryEntry _t_directoryEntries = new DirectoryEntry(this._io, this, _root);
                try {
                    _t_directoryEntries._read();
                } finally {
                    this.directoryEntries.add(_t_directoryEntries);
                }
            }
            this.freeLists = new ArrayList<FreeList>();
            for (int i = 0; i < numFreeLists(); i++) {
                FreeList _t_freeLists = new FreeList(this._io, this, _root);
                try {
                    _t_freeLists._read();
                } finally {
                    this.freeLists.add(_t_freeLists);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.blockAddresses.size(); i++) {
                this.blockAddresses.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.directoryEntries.size(); i++) {
                this.directoryEntries.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.freeLists.size(); i++) {
                this.freeLists.get(((Number) (i)).intValue())._fetchInstances();
            }
            directories();
            if (this.directories != null) {
                for (int i = 0; i < this.directories.size(); i++) {
                    this.directories.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteDirectories = _enabledDirectories;
            this._io.writeU4be(this.numBlocks);
            this._io.writeBytes(this._unnamed1);
            for (int i = 0; i < this.blockAddresses.size(); i++) {
                this.blockAddresses.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeU4be(this.numDirectories);
            for (int i = 0; i < this.directoryEntries.size(); i++) {
                this.directoryEntries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.freeLists.size(); i++) {
                this.freeLists.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this._unnamed1.length != 4)
                throw new ConsistencyError("_unnamed1", 4, this._unnamed1.length);
            if (this.blockAddresses.size() != numBlockAddresses())
                throw new ConsistencyError("block_addresses", numBlockAddresses(), this.blockAddresses.size());
            for (int i = 0; i < this.blockAddresses.size(); i++) {
                if (!Objects.equals(this.blockAddresses.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("block_addresses", _root(), this.blockAddresses.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.blockAddresses.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("block_addresses", this, this.blockAddresses.get(((Number) (i)).intValue())._parent());
            }
            if (this.directoryEntries.size() != numDirectories())
                throw new ConsistencyError("directory_entries", numDirectories(), this.directoryEntries.size());
            for (int i = 0; i < this.directoryEntries.size(); i++) {
                if (!Objects.equals(this.directoryEntries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("directory_entries", _root(), this.directoryEntries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.directoryEntries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("directory_entries", this, this.directoryEntries.get(((Number) (i)).intValue())._parent());
            }
            if (this.freeLists.size() != numFreeLists())
                throw new ConsistencyError("free_lists", numFreeLists(), this.freeLists.size());
            for (int i = 0; i < this.freeLists.size(); i++) {
                if (!Objects.equals(this.freeLists.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("free_lists", _root(), this.freeLists.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.freeLists.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("free_lists", this, this.freeLists.get(((Number) (i)).intValue())._parent());
            }
            if (_enabledDirectories) {
                if (this.directories.size() != numDirectories())
                    throw new ConsistencyError("directories", numDirectories(), this.directories.size());
                for (int i = 0; i < this.directories.size(); i++) {
                    if (!Objects.equals(this.directories.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("directories", _root(), this.directories.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.directories.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("directories", this, this.directories.get(((Number) (i)).intValue())._parent());
                    if (this.directories.get(((Number) (i)).intValue()).idx() != i)
                        throw new ConsistencyError("directories", i, this.directories.get(((Number) (i)).intValue()).idx());
                }
            }
            _dirty = false;
        }
        public static class BlockDescriptor extends KaitaiStruct.ReadWrite {
            public static BlockDescriptor fromFile(String fileName) throws IOException {
                return new BlockDescriptor(new ByteBufferKaitaiStream(fileName));
            }
            public BlockDescriptor() {
                this(null, null, null);
            }

            public BlockDescriptor(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BlockDescriptor(KaitaiStream _io, DsStore.BuddyAllocatorBody _parent) {
                this(_io, _parent, null);
            }

            public BlockDescriptor(KaitaiStream _io, DsStore.BuddyAllocatorBody _parent, DsStore _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.addressRaw = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(this.addressRaw);
            }

            public void _check() {
                _dirty = false;
            }
            private Integer offset;
            public Integer offset() {
                if (this.offset != null)
                    return this.offset;
                this.offset = ((Number) ((addressRaw() & ~(_root().blockAddressMask())) + 4)).intValue();
                return this.offset;
            }
            public void _invalidateOffset() { this.offset = null; }
            private Integer size;
            public Integer size() {
                if (this.size != null)
                    return this.size;
                this.size = ((Number) (1 << (addressRaw() & _root().blockAddressMask()))).intValue();
                return this.size;
            }
            public void _invalidateSize() { this.size = null; }
            private long addressRaw;
            private DsStore _root;
            private DsStore.BuddyAllocatorBody _parent;
            public long addressRaw() { return addressRaw; }
            public void setAddressRaw(long _v) { _dirty = true; addressRaw = _v; }
            public DsStore _root() { return _root; }
            public void set_root(DsStore _v) { _dirty = true; _root = _v; }
            public DsStore.BuddyAllocatorBody _parent() { return _parent; }
            public void set_parent(DsStore.BuddyAllocatorBody _v) { _dirty = true; _parent = _v; }
        }
        public static class DirectoryEntry extends KaitaiStruct.ReadWrite {
            public static DirectoryEntry fromFile(String fileName) throws IOException {
                return new DirectoryEntry(new ByteBufferKaitaiStream(fileName));
            }
            public DirectoryEntry() {
                this(null, null, null);
            }

            public DirectoryEntry(KaitaiStream _io) {
                this(_io, null, null);
            }

            public DirectoryEntry(KaitaiStream _io, DsStore.BuddyAllocatorBody _parent) {
                this(_io, _parent, null);
            }

            public DirectoryEntry(KaitaiStream _io, DsStore.BuddyAllocatorBody _parent, DsStore _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.lenName = this._io.readU1();
                this.name = new String(this._io.readBytes(lenName()), StandardCharsets.UTF_8);
                this.blockId = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.lenName);
                this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                this._io.writeU4be(this.blockId);
            }

            public void _check() {
                if ((this.name).getBytes(Charset.forName("UTF-8")).length != lenName())
                    throw new ConsistencyError("name", lenName(), (this.name).getBytes(Charset.forName("UTF-8")).length);
                _dirty = false;
            }
            private int lenName;
            private String name;
            private long blockId;
            private DsStore _root;
            private DsStore.BuddyAllocatorBody _parent;
            public int lenName() { return lenName; }
            public void setLenName(int _v) { _dirty = true; lenName = _v; }
            public String name() { return name; }
            public void setName(String _v) { _dirty = true; name = _v; }
            public long blockId() { return blockId; }
            public void setBlockId(long _v) { _dirty = true; blockId = _v; }
            public DsStore _root() { return _root; }
            public void set_root(DsStore _v) { _dirty = true; _root = _v; }
            public DsStore.BuddyAllocatorBody _parent() { return _parent; }
            public void set_parent(DsStore.BuddyAllocatorBody _v) { _dirty = true; _parent = _v; }
        }
        public static class FreeList extends KaitaiStruct.ReadWrite {
            public static FreeList fromFile(String fileName) throws IOException {
                return new FreeList(new ByteBufferKaitaiStream(fileName));
            }
            public FreeList() {
                this(null, null, null);
            }

            public FreeList(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FreeList(KaitaiStream _io, DsStore.BuddyAllocatorBody _parent) {
                this(_io, _parent, null);
            }

            public FreeList(KaitaiStream _io, DsStore.BuddyAllocatorBody _parent, DsStore _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.counter = this._io.readU4be();
                this.offsets = new ArrayList<Long>();
                for (int i = 0; i < counter(); i++) {
                    this.offsets.add(this._io.readU4be());
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.offsets.size(); i++) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4be(this.counter);
                for (int i = 0; i < this.offsets.size(); i++) {
                    this._io.writeU4be(this.offsets.get(((Number) (i)).intValue()));
                }
            }

            public void _check() {
                if (this.offsets.size() != counter())
                    throw new ConsistencyError("offsets", counter(), this.offsets.size());
                for (int i = 0; i < this.offsets.size(); i++) {
                }
                _dirty = false;
            }
            private long counter;
            private List<Long> offsets;
            private DsStore _root;
            private DsStore.BuddyAllocatorBody _parent;
            public long counter() { return counter; }
            public void setCounter(long _v) { _dirty = true; counter = _v; }
            public List<Long> offsets() { return offsets; }
            public void setOffsets(List<Long> _v) { _dirty = true; offsets = _v; }
            public DsStore _root() { return _root; }
            public void set_root(DsStore _v) { _dirty = true; _root = _v; }
            public DsStore.BuddyAllocatorBody _parent() { return _parent; }
            public void set_parent(DsStore.BuddyAllocatorBody _v) { _dirty = true; _parent = _v; }
        }
        private List<MasterBlockRef> directories;
        private boolean _shouldWriteDirectories = false;
        private boolean _enabledDirectories = true;

        /**
         * Master blocks of the different B-trees.
         */
        public List<MasterBlockRef> directories() {
            if (_shouldWriteDirectories)
                _writeDirectories();
            if (this.directories != null)
                return this.directories;
            if (!_enabledDirectories)
                return null;
            KaitaiStream io = _root()._io();
            this.directories = new ArrayList<MasterBlockRef>();
            for (int i = 0; i < numDirectories(); i++) {
                MasterBlockRef _t_directories = new MasterBlockRef(io, this, _root, i);
                try {
                    _t_directories._read();
                } finally {
                    this.directories.add(_t_directories);
                }
            }
            return this.directories;
        }
        public void setDirectories(List<MasterBlockRef> _v) { _dirty = true; directories = _v; }
        public void setDirectories_Enabled(boolean _v) { _dirty = true; _enabledDirectories = _v; }

        private void _writeDirectories() {
            _shouldWriteDirectories = false;
            KaitaiStream io = _root()._io();
            for (int i = 0; i < this.directories.size(); i++) {
                this.directories.get(((Number) (i)).intValue())._write_Seq(io);
            }
        }
        private Integer numBlockAddresses;
        public Integer numBlockAddresses() {
            if (this.numBlockAddresses != null)
                return this.numBlockAddresses;
            this.numBlockAddresses = ((int) 256);
            return this.numBlockAddresses;
        }
        public void _invalidateNumBlockAddresses() { this.numBlockAddresses = null; }
        private Byte numFreeLists;
        public Byte numFreeLists() {
            if (this.numFreeLists != null)
                return this.numFreeLists;
            this.numFreeLists = ((byte) 32);
            return this.numFreeLists;
        }
        public void _invalidateNumFreeLists() { this.numFreeLists = null; }
        private long numBlocks;
        private byte[] _unnamed1;
        private List<BlockDescriptor> blockAddresses;
        private long numDirectories;
        private List<DirectoryEntry> directoryEntries;
        private List<FreeList> freeLists;
        private DsStore _root;
        private DsStore _parent;

        /**
         * Number of blocks in the allocated-blocks list.
         */
        public long numBlocks() { return numBlocks; }
        public void setNumBlocks(long _v) { _dirty = true; numBlocks = _v; }

        /**
         * Unknown field which appears to always be 0.
         */
        public byte[] _unnamed1() { return _unnamed1; }
        public void set_unnamed1(byte[] _v) { _dirty = true; _unnamed1 = _v; }

        /**
         * Addresses of the different blocks.
         */
        public List<BlockDescriptor> blockAddresses() { return blockAddresses; }
        public void setBlockAddresses(List<BlockDescriptor> _v) { _dirty = true; blockAddresses = _v; }

        /**
         * Indicates the number of directory entries.
         */
        public long numDirectories() { return numDirectories; }
        public void setNumDirectories(long _v) { _dirty = true; numDirectories = _v; }

        /**
         * Each directory is an independent B-tree.
         */
        public List<DirectoryEntry> directoryEntries() { return directoryEntries; }
        public void setDirectoryEntries(List<DirectoryEntry> _v) { _dirty = true; directoryEntries = _v; }
        public List<FreeList> freeLists() { return freeLists; }
        public void setFreeLists(List<FreeList> _v) { _dirty = true; freeLists = _v; }
        public DsStore _root() { return _root; }
        public void set_root(DsStore _v) { _dirty = true; _root = _v; }
        public DsStore _parent() { return _parent; }
        public void set_parent(DsStore _v) { _dirty = true; _parent = _v; }
    }
    public static class BuddyAllocatorHeader extends KaitaiStruct.ReadWrite {
        public static BuddyAllocatorHeader fromFile(String fileName) throws IOException {
            return new BuddyAllocatorHeader(new ByteBufferKaitaiStream(fileName));
        }
        public BuddyAllocatorHeader() {
            this(null, null, null);
        }

        public BuddyAllocatorHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BuddyAllocatorHeader(KaitaiStream _io, DsStore _parent) {
            this(_io, _parent, null);
        }

        public BuddyAllocatorHeader(KaitaiStream _io, DsStore _parent, DsStore _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 66, 117, 100, 49 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 117, 100, 49 }, this.magic, this._io, "/types/buddy_allocator_header/seq/0");
            }
            this.ofsBookkeepingInfoBlock = this._io.readU4be();
            this.lenBookkeepingInfoBlock = this._io.readU4be();
            this.copyOfsBookkeepingInfoBlock = this._io.readU4be();
            this._unnamed4 = this._io.readBytes(16);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4be(this.ofsBookkeepingInfoBlock);
            this._io.writeU4be(this.lenBookkeepingInfoBlock);
            this._io.writeU4be(this.copyOfsBookkeepingInfoBlock);
            this._io.writeBytes(this._unnamed4);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 66, 117, 100, 49 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 117, 100, 49 }, this.magic, null, "/types/buddy_allocator_header/seq/0");
            }
            if (this._unnamed4.length != 16)
                throw new ConsistencyError("_unnamed4", 16, this._unnamed4.length);
            _dirty = false;
        }
        private byte[] magic;
        private long ofsBookkeepingInfoBlock;
        private long lenBookkeepingInfoBlock;
        private long copyOfsBookkeepingInfoBlock;
        private byte[] _unnamed4;
        private DsStore _root;
        private DsStore _parent;

        /**
         * Magic number 'Bud1'.
         */
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long ofsBookkeepingInfoBlock() { return ofsBookkeepingInfoBlock; }
        public void setOfsBookkeepingInfoBlock(long _v) { _dirty = true; ofsBookkeepingInfoBlock = _v; }
        public long lenBookkeepingInfoBlock() { return lenBookkeepingInfoBlock; }
        public void setLenBookkeepingInfoBlock(long _v) { _dirty = true; lenBookkeepingInfoBlock = _v; }

        /**
         * Needs to match 'offset_bookkeeping_info_block'.
         */
        public long copyOfsBookkeepingInfoBlock() { return copyOfsBookkeepingInfoBlock; }
        public void setCopyOfsBookkeepingInfoBlock(long _v) { _dirty = true; copyOfsBookkeepingInfoBlock = _v; }

        /**
         * Unused field which might simply be the unused space at the end of the block,
         * since the minimum allocation size is 32 bytes.
         */
        public byte[] _unnamed4() { return _unnamed4; }
        public void set_unnamed4(byte[] _v) { _dirty = true; _unnamed4 = _v; }
        public DsStore _root() { return _root; }
        public void set_root(DsStore _v) { _dirty = true; _root = _v; }
        public DsStore _parent() { return _parent; }
        public void set_parent(DsStore _v) { _dirty = true; _parent = _v; }
    }
    public static class MasterBlockRef extends KaitaiStruct.ReadWrite {
        public MasterBlockRef(long idx) {
            this(null, null, null, idx);
        }

        public MasterBlockRef(KaitaiStream _io, long idx) {
            this(_io, null, null, idx);
        }

        public MasterBlockRef(KaitaiStream _io, DsStore.BuddyAllocatorBody _parent, long idx) {
            this(_io, _parent, null, idx);
        }

        public MasterBlockRef(KaitaiStream _io, DsStore.BuddyAllocatorBody _parent, DsStore _root, long idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
            masterBlock();
            if (this.masterBlock != null) {
                this.masterBlock._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteMasterBlock = _enabledMasterBlock;
        }

        public void _check() {
            if (_enabledMasterBlock) {
                if (!Objects.equals(this.masterBlock._root(), _root()))
                    throw new ConsistencyError("master_block", _root(), this.masterBlock._root());
                if (!Objects.equals(this.masterBlock._parent(), this))
                    throw new ConsistencyError("master_block", this, this.masterBlock._parent());
            }
            _dirty = false;
        }
        public static class MasterBlock extends KaitaiStruct.ReadWrite {
            public static MasterBlock fromFile(String fileName) throws IOException {
                return new MasterBlock(new ByteBufferKaitaiStream(fileName));
            }
            public MasterBlock() {
                this(null, null, null);
            }

            public MasterBlock(KaitaiStream _io) {
                this(_io, null, null);
            }

            public MasterBlock(KaitaiStream _io, DsStore.MasterBlockRef _parent) {
                this(_io, _parent, null);
            }

            public MasterBlock(KaitaiStream _io, DsStore.MasterBlockRef _parent, DsStore _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.blockId = this._io.readU4be();
                this.numInternalNodes = this._io.readU4be();
                this.numRecords = this._io.readU4be();
                this.numNodes = this._io.readU4be();
                this._unnamed4 = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
                rootBlock();
                if (this.rootBlock != null) {
                    this.rootBlock._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteRootBlock = _enabledRootBlock;
                this._io.writeU4be(this.blockId);
                this._io.writeU4be(this.numInternalNodes);
                this._io.writeU4be(this.numRecords);
                this._io.writeU4be(this.numNodes);
                this._io.writeU4be(this._unnamed4);
            }

            public void _check() {
                if (_enabledRootBlock) {
                    if (!Objects.equals(this.rootBlock._root(), _root()))
                        throw new ConsistencyError("root_block", _root(), this.rootBlock._root());
                    if (!Objects.equals(this.rootBlock._parent(), this))
                        throw new ConsistencyError("root_block", this, this.rootBlock._parent());
                }
                _dirty = false;
            }
            private Block rootBlock;
            private boolean _shouldWriteRootBlock = false;
            private boolean _enabledRootBlock = true;
            public Block rootBlock() {
                if (_shouldWriteRootBlock)
                    _writeRootBlock();
                if (this.rootBlock != null)
                    return this.rootBlock;
                if (!_enabledRootBlock)
                    return null;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(_root().buddyAllocatorBody().blockAddresses().get(((Number) (blockId())).intValue()).offset());
                this.rootBlock = new Block(io, this, _root);
                this.rootBlock._read();
                io.seek(_pos);
                return this.rootBlock;
            }
            public void setRootBlock(Block _v) { _dirty = true; rootBlock = _v; }
            public void setRootBlock_Enabled(boolean _v) { _dirty = true; _enabledRootBlock = _v; }

            private void _writeRootBlock() {
                _shouldWriteRootBlock = false;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(_root().buddyAllocatorBody().blockAddresses().get(((Number) (blockId())).intValue()).offset());
                this.rootBlock._write_Seq(io);
                io.seek(_pos);
            }
            private long blockId;
            private long numInternalNodes;
            private long numRecords;
            private long numNodes;
            private long _unnamed4;
            private DsStore _root;
            private DsStore.MasterBlockRef _parent;

            /**
             * Block number of the B-tree's root node.
             */
            public long blockId() { return blockId; }
            public void setBlockId(long _v) { _dirty = true; blockId = _v; }

            /**
             * Number of internal node levels.
             */
            public long numInternalNodes() { return numInternalNodes; }
            public void setNumInternalNodes(long _v) { _dirty = true; numInternalNodes = _v; }

            /**
             * Number of records in the tree.
             */
            public long numRecords() { return numRecords; }
            public void setNumRecords(long _v) { _dirty = true; numRecords = _v; }

            /**
             * Number of nodes in the tree.
             */
            public long numNodes() { return numNodes; }
            public void setNumNodes(long _v) { _dirty = true; numNodes = _v; }

            /**
             * Always 0x1000, probably the B-tree node page size.
             */
            public long _unnamed4() { return _unnamed4; }
            public void set_unnamed4(long _v) { _dirty = true; _unnamed4 = _v; }
            public DsStore _root() { return _root; }
            public void set_root(DsStore _v) { _dirty = true; _root = _v; }
            public DsStore.MasterBlockRef _parent() { return _parent; }
            public void set_parent(DsStore.MasterBlockRef _v) { _dirty = true; _parent = _v; }
        }
        private MasterBlock masterBlock;
        private boolean _shouldWriteMasterBlock = false;
        private boolean _enabledMasterBlock = true;
        public MasterBlock masterBlock() {
            if (_shouldWriteMasterBlock)
                _writeMasterBlock();
            if (this.masterBlock != null)
                return this.masterBlock;
            if (!_enabledMasterBlock)
                return null;
            long _pos = this._io.pos();
            this._io.seek(_parent().blockAddresses().get(((Number) (_parent().directoryEntries().get(((Number) (idx())).intValue()).blockId())).intValue()).offset());
            this._raw_masterBlock = this._io.readBytes(_parent().blockAddresses().get(((Number) (_parent().directoryEntries().get(((Number) (idx())).intValue()).blockId())).intValue()).size());
            KaitaiStream _io__raw_masterBlock = new ByteBufferKaitaiStream(this._raw_masterBlock);
            this.masterBlock = new MasterBlock(_io__raw_masterBlock, this, _root);
            this.masterBlock._read();
            this._io.seek(_pos);
            return this.masterBlock;
        }
        public void setMasterBlock(MasterBlock _v) { _dirty = true; masterBlock = _v; }
        public void setMasterBlock_Enabled(boolean _v) { _dirty = true; _enabledMasterBlock = _v; }

        private void _writeMasterBlock() {
            _shouldWriteMasterBlock = false;
            long _pos = this._io.pos();
            this._io.seek(_parent().blockAddresses().get(((Number) (_parent().directoryEntries().get(((Number) (idx())).intValue()).blockId())).intValue()).offset());
            final KaitaiStream _io__raw_masterBlock = new ByteBufferKaitaiStream(_parent().blockAddresses().get(((Number) (_parent().directoryEntries().get(((Number) (idx())).intValue()).blockId())).intValue()).size());
            this._io.addChildStream(_io__raw_masterBlock);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (_parent().blockAddresses().get(((Number) (_parent().directoryEntries().get(((Number) (idx())).intValue()).blockId())).intValue()).size()));
                final MasterBlockRef _this = this;
                _io__raw_masterBlock.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_masterBlock = _io__raw_masterBlock.toByteArray();
                        if (_this._raw_masterBlock.length != _parent().blockAddresses().get(((Number) (_parent().directoryEntries().get(((Number) (idx())).intValue()).blockId())).intValue()).size())
                            throw new ConsistencyError("raw(master_block)", _parent().blockAddresses().get(((Number) (_parent().directoryEntries().get(((Number) (idx())).intValue()).blockId())).intValue()).size(), _this._raw_masterBlock.length);
                        parent.writeBytes(_this._raw_masterBlock);
                    }
                });
            }
            this.masterBlock._write_Seq(_io__raw_masterBlock);
            this._io.seek(_pos);
        }
        private long idx;
        private DsStore _root;
        private DsStore.BuddyAllocatorBody _parent;
        private byte[] _raw_masterBlock;
        public long idx() { return idx; }
        public void setIdx(long _v) { _dirty = true; idx = _v; }
        public DsStore _root() { return _root; }
        public void set_root(DsStore _v) { _dirty = true; _root = _v; }
        public DsStore.BuddyAllocatorBody _parent() { return _parent; }
        public void set_parent(DsStore.BuddyAllocatorBody _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_masterBlock() { return _raw_masterBlock; }
        public void set_raw_MasterBlock(byte[] _v) { _dirty = true; _raw_masterBlock = _v; }
    }
    private Byte blockAddressMask;

    /**
     * Bitmask used to calculate the position and the size of each block
     * of the B-tree from the block addresses.
     */
    public Byte blockAddressMask() {
        if (this.blockAddressMask != null)
            return this.blockAddressMask;
        this.blockAddressMask = ((byte) 31);
        return this.blockAddressMask;
    }
    public void _invalidateBlockAddressMask() { this.blockAddressMask = null; }
    private BuddyAllocatorBody buddyAllocatorBody;
    private boolean _shouldWriteBuddyAllocatorBody = false;
    private boolean _enabledBuddyAllocatorBody = true;
    public BuddyAllocatorBody buddyAllocatorBody() {
        if (_shouldWriteBuddyAllocatorBody)
            _writeBuddyAllocatorBody();
        if (this.buddyAllocatorBody != null)
            return this.buddyAllocatorBody;
        if (!_enabledBuddyAllocatorBody)
            return null;
        long _pos = this._io.pos();
        this._io.seek(buddyAllocatorHeader().ofsBookkeepingInfoBlock() + 4);
        this._raw_buddyAllocatorBody = this._io.readBytes(buddyAllocatorHeader().lenBookkeepingInfoBlock());
        KaitaiStream _io__raw_buddyAllocatorBody = new ByteBufferKaitaiStream(this._raw_buddyAllocatorBody);
        this.buddyAllocatorBody = new BuddyAllocatorBody(_io__raw_buddyAllocatorBody, this, _root);
        this.buddyAllocatorBody._read();
        this._io.seek(_pos);
        return this.buddyAllocatorBody;
    }
    public void setBuddyAllocatorBody(BuddyAllocatorBody _v) { _dirty = true; buddyAllocatorBody = _v; }
    public void setBuddyAllocatorBody_Enabled(boolean _v) { _dirty = true; _enabledBuddyAllocatorBody = _v; }

    private void _writeBuddyAllocatorBody() {
        _shouldWriteBuddyAllocatorBody = false;
        long _pos = this._io.pos();
        this._io.seek(buddyAllocatorHeader().ofsBookkeepingInfoBlock() + 4);
        final KaitaiStream _io__raw_buddyAllocatorBody = new ByteBufferKaitaiStream(buddyAllocatorHeader().lenBookkeepingInfoBlock());
        this._io.addChildStream(_io__raw_buddyAllocatorBody);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (buddyAllocatorHeader().lenBookkeepingInfoBlock()));
            final DsStore _this = this;
            _io__raw_buddyAllocatorBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_buddyAllocatorBody = _io__raw_buddyAllocatorBody.toByteArray();
                    if (_this._raw_buddyAllocatorBody.length != buddyAllocatorHeader().lenBookkeepingInfoBlock())
                        throw new ConsistencyError("raw(buddy_allocator_body)", buddyAllocatorHeader().lenBookkeepingInfoBlock(), _this._raw_buddyAllocatorBody.length);
                    parent.writeBytes(_this._raw_buddyAllocatorBody);
                }
            });
        }
        this.buddyAllocatorBody._write_Seq(_io__raw_buddyAllocatorBody);
        this._io.seek(_pos);
    }
    private byte[] alignmentHeader;
    private BuddyAllocatorHeader buddyAllocatorHeader;
    private DsStore _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_buddyAllocatorBody;
    public byte[] alignmentHeader() { return alignmentHeader; }
    public void setAlignmentHeader(byte[] _v) { _dirty = true; alignmentHeader = _v; }
    public BuddyAllocatorHeader buddyAllocatorHeader() { return buddyAllocatorHeader; }
    public void setBuddyAllocatorHeader(BuddyAllocatorHeader _v) { _dirty = true; buddyAllocatorHeader = _v; }
    public DsStore _root() { return _root; }
    public void set_root(DsStore _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_buddyAllocatorBody() { return _raw_buddyAllocatorBody; }
    public void set_raw_BuddyAllocatorBody(byte[] _v) { _dirty = true; _raw_buddyAllocatorBody = _v; }
}
