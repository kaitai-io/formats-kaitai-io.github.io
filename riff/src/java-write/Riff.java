// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.ArrayList;


/**
 * The Resource Interchange File Format (RIFF) is a generic file container format
 * for storing data in tagged chunks. It is primarily used to store multimedia
 * such as sound and video, though it may also be used to store any arbitrary data.
 * 
 * The Microsoft implementation is mostly known through container formats
 * like AVI, ANI and WAV, which use RIFF as their basis.
 * @see <a href="https://www.johnloomis.org/cpe102/asgn/asgn1/riff.html">Source</a>
 */
public class Riff extends KaitaiStruct.ReadWrite {
    public static Riff fromFile(String fileName) throws IOException {
        return new Riff(new ByteBufferKaitaiStream(fileName));
    }

    public enum Fourcc {
        RIFF(1179011410),
        INFO(1330007625),
        LIST(1414744396);

        private final long id;
        Fourcc(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Fourcc> byId = new HashMap<Long, Fourcc>(3);
        static {
            for (Fourcc e : Fourcc.values())
                byId.put(e.id(), e);
        }
        public static Fourcc byId(long id) { return byId.get(id); }
    }
    public Riff() {
        this(null, null, null);
    }

    public Riff(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Riff(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Riff(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Riff _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.chunk = new Chunk(this._io, this, _root);
        this.chunk._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.chunk._fetchInstances();
        parentChunkData();
        if (this.parentChunkData != null) {
            this.parentChunkData._fetchInstances();
        }
        subchunks();
        if (this.subchunks != null) {
            for (int i = 0; i < this.subchunks.size(); i++) {
                this.subchunks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteParentChunkData = _enabledParentChunkData;
        _shouldWriteSubchunks = _enabledSubchunks;
        this.chunk._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.chunk._root(), _root()))
            throw new ConsistencyError("chunk", _root(), this.chunk._root());
        if (!Objects.equals(this.chunk._parent(), this))
            throw new ConsistencyError("chunk", this, this.chunk._parent());
        if (_enabledParentChunkData) {
            if (isRiffChunk()) {
                if (!Objects.equals(this.parentChunkData._root(), _root()))
                    throw new ConsistencyError("parent_chunk_data", _root(), this.parentChunkData._root());
                if (!Objects.equals(this.parentChunkData._parent(), this))
                    throw new ConsistencyError("parent_chunk_data", this, this.parentChunkData._parent());
            }
        }
        if (_enabledSubchunks) {
            if (isRiffChunk()) {
                for (int i = 0; i < this.subchunks.size(); i++) {
                    if (!Objects.equals(this.subchunks.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("subchunks", _root(), this.subchunks.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.subchunks.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("subchunks", this, this.subchunks.get(((Number) (i)).intValue())._parent());
                }
            }
        }
        _dirty = false;
    }
    public static class Chunk extends KaitaiStruct.ReadWrite {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }
        public Chunk() {
            this(null, null, null);
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Riff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = this._io.readU4le();
            this.len = this._io.readU4le();
            this._raw_dataSlot = this._io.readBytes(len());
            KaitaiStream _io__raw_dataSlot = new ByteBufferKaitaiStream(this._raw_dataSlot);
            this.dataSlot = new Slot(_io__raw_dataSlot, this, _root);
            this.dataSlot._read();
            this.padByte = this._io.readBytes(KaitaiStream.mod(len(), 2));
            _dirty = false;
        }

        public void _fetchInstances() {
            this.dataSlot._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.id);
            this._io.writeU4le(this.len);
            final KaitaiStream _io__raw_dataSlot = new ByteBufferKaitaiStream(len());
            this._io.addChildStream(_io__raw_dataSlot);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (len()));
                final Chunk _this = this;
                _io__raw_dataSlot.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_dataSlot = _io__raw_dataSlot.toByteArray();
                        if (_this._raw_dataSlot.length != len())
                            throw new ConsistencyError("raw(data_slot)", len(), _this._raw_dataSlot.length);
                        parent.writeBytes(_this._raw_dataSlot);
                    }
                });
            }
            this.dataSlot._write_Seq(_io__raw_dataSlot);
            this._io.writeBytes(this.padByte);
        }

        public void _check() {
            if (!Objects.equals(this.dataSlot._root(), _root()))
                throw new ConsistencyError("data_slot", _root(), this.dataSlot._root());
            if (!Objects.equals(this.dataSlot._parent(), this))
                throw new ConsistencyError("data_slot", this, this.dataSlot._parent());
            if (this.padByte.length != KaitaiStream.mod(len(), 2))
                throw new ConsistencyError("pad_byte", KaitaiStream.mod(len(), 2), this.padByte.length);
            _dirty = false;
        }
        public static class Slot extends KaitaiStruct.ReadWrite {
            public static Slot fromFile(String fileName) throws IOException {
                return new Slot(new ByteBufferKaitaiStream(fileName));
            }
            public Slot() {
                this(null, null, null);
            }

            public Slot(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Slot(KaitaiStream _io, Riff.Chunk _parent) {
                this(_io, _parent, null);
            }

            public Slot(KaitaiStream _io, Riff.Chunk _parent, Riff _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
            }

            public void _check() {
                _dirty = false;
            }
            private Riff _root;
            private Riff.Chunk _parent;
            public Riff _root() { return _root; }
            public void set_root(Riff _v) { _dirty = true; _root = _v; }
            public Riff.Chunk _parent() { return _parent; }
            public void set_parent(Riff.Chunk _v) { _dirty = true; _parent = _v; }
        }
        private long id;
        private long len;
        private Slot dataSlot;
        private byte[] padByte;
        private Riff _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_dataSlot;
        public long id() { return id; }
        public void setId(long _v) { _dirty = true; id = _v; }
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public Slot dataSlot() { return dataSlot; }
        public void setDataSlot(Slot _v) { _dirty = true; dataSlot = _v; }
        public byte[] padByte() { return padByte; }
        public void setPadByte(byte[] _v) { _dirty = true; padByte = _v; }
        public Riff _root() { return _root; }
        public void set_root(Riff _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_dataSlot() { return _raw_dataSlot; }
        public void set_raw_DataSlot(byte[] _v) { _dirty = true; _raw_dataSlot = _v; }
    }
    public static class ChunkType extends KaitaiStruct.ReadWrite {
        public static ChunkType fromFile(String fileName) throws IOException {
            return new ChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public ChunkType() {
            this(null, null, null);
        }

        public ChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChunkType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public ChunkType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Riff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            if (chunkOfs() < 0) {
                this.saveChunkOfs = this._io.readBytes(0);
            }
            this.chunk = new Chunk(this._io, this, _root);
            this.chunk._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            if (chunkOfs() < 0) {
            }
            this.chunk._fetchInstances();
            chunkData();
            if (this.chunkData != null) {
                {
                    Fourcc on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case LIST: {
                            this.chunkData._fetchInstances();
                            break;
                        }
                        }
                    }
                }
            }
            chunkIdReadable();
            if (this.chunkIdReadable != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteChunkData = _enabledChunkData;
            _shouldWriteChunkIdReadable = _enabledChunkIdReadable;
            if (chunkOfs() < 0) {
                if (this.saveChunkOfs.length != 0)
                    throw new ConsistencyError("save_chunk_ofs", 0, this.saveChunkOfs.length);
                this._io.writeBytes(this.saveChunkOfs);
            }
            this.chunk._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.chunk._root(), _root()))
                throw new ConsistencyError("chunk", _root(), this.chunk._root());
            if (!Objects.equals(this.chunk._parent(), this))
                throw new ConsistencyError("chunk", this, this.chunk._parent());
            if (_enabledChunkData) {
                {
                    Fourcc on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case LIST: {
                            if (!Objects.equals(this.chunkData._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), this.chunkData._root());
                            if (!Objects.equals(this.chunkData._parent(), this))
                                throw new ConsistencyError("chunk_data", this, this.chunkData._parent());
                            break;
                        }
                        }
                    }
                }
            }
            if (_enabledChunkIdReadable) {
                if ((this.chunkIdReadable).getBytes(Charset.forName("ASCII")).length != 4)
                    throw new ConsistencyError("chunk_id_readable", 4, (this.chunkIdReadable).getBytes(Charset.forName("ASCII")).length);
            }
            _dirty = false;
        }
        private ListChunkData chunkData;
        private boolean _shouldWriteChunkData = false;
        private boolean _enabledChunkData = true;
        public ListChunkData chunkData() {
            if (_shouldWriteChunkData)
                _writeChunkData();
            if (this.chunkData != null)
                return this.chunkData;
            if (!_enabledChunkData)
                return null;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            {
                Fourcc on = chunkId();
                if (on != null) {
                    switch (chunkId()) {
                    case LIST: {
                        this.chunkData = new ListChunkData(io, this, _root);
                        this.chunkData._read();
                        break;
                    }
                    }
                }
            }
            io.seek(_pos);
            return this.chunkData;
        }
        public void setChunkData(ListChunkData _v) { _dirty = true; chunkData = _v; }
        public void setChunkData_Enabled(boolean _v) { _dirty = true; _enabledChunkData = _v; }

        private void _writeChunkData() {
            _shouldWriteChunkData = false;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            {
                Fourcc on = chunkId();
                if (on != null) {
                    switch (chunkId()) {
                    case LIST: {
                        this.chunkData._write_Seq(io);
                        break;
                    }
                    }
                }
            }
            io.seek(_pos);
        }
        private Fourcc chunkId;
        public Fourcc chunkId() {
            if (this.chunkId != null)
                return this.chunkId;
            this.chunkId = Riff.Fourcc.byId(chunk().id());
            return this.chunkId;
        }
        public void _invalidateChunkId() { this.chunkId = null; }
        private String chunkIdReadable;
        private boolean _shouldWriteChunkIdReadable = false;
        private boolean _enabledChunkIdReadable = true;
        public String chunkIdReadable() {
            if (_shouldWriteChunkIdReadable)
                _writeChunkIdReadable();
            if (this.chunkIdReadable != null)
                return this.chunkIdReadable;
            if (!_enabledChunkIdReadable)
                return null;
            long _pos = this._io.pos();
            this._io.seek(chunkOfs());
            this.chunkIdReadable = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this._io.seek(_pos);
            return this.chunkIdReadable;
        }
        public void setChunkIdReadable(String _v) { _dirty = true; chunkIdReadable = _v; }
        public void setChunkIdReadable_Enabled(boolean _v) { _dirty = true; _enabledChunkIdReadable = _v; }

        private void _writeChunkIdReadable() {
            _shouldWriteChunkIdReadable = false;
            long _pos = this._io.pos();
            this._io.seek(chunkOfs());
            this._io.writeBytes((this.chunkIdReadable).getBytes(Charset.forName("ASCII")));
            this._io.seek(_pos);
        }
        private Integer chunkOfs;
        public Integer chunkOfs() {
            if (this.chunkOfs != null)
                return this.chunkOfs;
            this.chunkOfs = ((Number) (_io().pos())).intValue();
            return this.chunkOfs;
        }
        public void _invalidateChunkOfs() { this.chunkOfs = null; }
        private byte[] saveChunkOfs;
        private Chunk chunk;
        private Riff _root;
        private KaitaiStruct.ReadWrite _parent;
        public byte[] saveChunkOfs() { return saveChunkOfs; }
        public void setSaveChunkOfs(byte[] _v) { _dirty = true; saveChunkOfs = _v; }
        public Chunk chunk() { return chunk; }
        public void setChunk(Chunk _v) { _dirty = true; chunk = _v; }
        public Riff _root() { return _root; }
        public void set_root(Riff _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * All registered subchunks in the INFO chunk are NULL-terminated strings,
     * but the unregistered might not be. By convention, the registered
     * chunk IDs are in uppercase and the unregistered IDs are in lowercase.
     * 
     * If the chunk ID of an INFO subchunk contains a lowercase
     * letter, this chunk is considered as unregistered and thus we can make
     * no assumptions about the type of data.
     */
    public static class InfoSubchunk extends KaitaiStruct.ReadWrite {
        public static InfoSubchunk fromFile(String fileName) throws IOException {
            return new InfoSubchunk(new ByteBufferKaitaiStream(fileName));
        }
        public InfoSubchunk() {
            this(null, null, null);
        }

        public InfoSubchunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InfoSubchunk(KaitaiStream _io, Riff.ListChunkData _parent) {
            this(_io, _parent, null);
        }

        public InfoSubchunk(KaitaiStream _io, Riff.ListChunkData _parent, Riff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            if (chunkOfs() < 0) {
                this.saveChunkOfs = this._io.readBytes(0);
            }
            this.chunk = new Chunk(this._io, this, _root);
            this.chunk._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            if (chunkOfs() < 0) {
            }
            this.chunk._fetchInstances();
            chunkData();
            if (this.chunkData != null) {
                {
                    boolean on = isUnregisteredTag();
                    if (on == false) {
                    }
                }
            }
            idChars();
            if (this.idChars != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteChunkData = _enabledChunkData;
            _shouldWriteIdChars = _enabledIdChars;
            if (chunkOfs() < 0) {
                if (this.saveChunkOfs.length != 0)
                    throw new ConsistencyError("save_chunk_ofs", 0, this.saveChunkOfs.length);
                this._io.writeBytes(this.saveChunkOfs);
            }
            this.chunk._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.chunk._root(), _root()))
                throw new ConsistencyError("chunk", _root(), this.chunk._root());
            if (!Objects.equals(this.chunk._parent(), this))
                throw new ConsistencyError("chunk", this, this.chunk._parent());
            if (_enabledChunkData) {
            }
            if (_enabledIdChars) {
                if (this.idChars.length != 4)
                    throw new ConsistencyError("id_chars", 4, this.idChars.length);
            }
            _dirty = false;
        }
        private String chunkData;
        private boolean _shouldWriteChunkData = false;
        private boolean _enabledChunkData = true;
        public String chunkData() {
            if (_shouldWriteChunkData)
                _writeChunkData();
            if (this.chunkData != null)
                return this.chunkData;
            if (!_enabledChunkData)
                return null;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            {
                boolean on = isUnregisteredTag();
                if (on == false) {
                    this.chunkData = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                }
            }
            io.seek(_pos);
            return this.chunkData;
        }
        public void setChunkData(String _v) { _dirty = true; chunkData = _v; }
        public void setChunkData_Enabled(boolean _v) { _dirty = true; _enabledChunkData = _v; }

        private void _writeChunkData() {
            _shouldWriteChunkData = false;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            {
                boolean on = isUnregisteredTag();
                if (on == false) {
                    if (KaitaiStream.byteArrayIndexOf((this.chunkData).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                        throw new ConsistencyError("chunk_data", -1, KaitaiStream.byteArrayIndexOf((this.chunkData).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                    io.writeBytes(((byte[]) ((this.chunkData).getBytes(Charset.forName("UTF-8")))));
                    io.writeU1(0);
                }
            }
            io.seek(_pos);
        }
        private String chunkIdReadable;
        public String chunkIdReadable() {
            if (this.chunkIdReadable != null)
                return this.chunkIdReadable;
            this.chunkIdReadable = new String(idChars(), StandardCharsets.US_ASCII);
            return this.chunkIdReadable;
        }
        public void _invalidateChunkIdReadable() { this.chunkIdReadable = null; }
        private Integer chunkOfs;
        public Integer chunkOfs() {
            if (this.chunkOfs != null)
                return this.chunkOfs;
            this.chunkOfs = ((Number) (_io().pos())).intValue();
            return this.chunkOfs;
        }
        public void _invalidateChunkOfs() { this.chunkOfs = null; }
        private byte[] idChars;
        private boolean _shouldWriteIdChars = false;
        private boolean _enabledIdChars = true;
        public byte[] idChars() {
            if (_shouldWriteIdChars)
                _writeIdChars();
            if (this.idChars != null)
                return this.idChars;
            if (!_enabledIdChars)
                return null;
            long _pos = this._io.pos();
            this._io.seek(chunkOfs());
            this.idChars = this._io.readBytes(4);
            this._io.seek(_pos);
            return this.idChars;
        }
        public void setIdChars(byte[] _v) { _dirty = true; idChars = _v; }
        public void setIdChars_Enabled(boolean _v) { _dirty = true; _enabledIdChars = _v; }

        private void _writeIdChars() {
            _shouldWriteIdChars = false;
            long _pos = this._io.pos();
            this._io.seek(chunkOfs());
            this._io.writeBytes(this.idChars);
            this._io.seek(_pos);
        }
        private Boolean isUnregisteredTag;

        /**
         * Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
         */
        public Boolean isUnregisteredTag() {
            if (this.isUnregisteredTag != null)
                return this.isUnregisteredTag;
            this.isUnregisteredTag =  (( (((idChars()[((int) 0)] & 0xff) >= 97) && ((idChars()[((int) 0)] & 0xff) <= 122)) ) || ( (((idChars()[((int) 1)] & 0xff) >= 97) && ((idChars()[((int) 1)] & 0xff) <= 122)) ) || ( (((idChars()[((int) 2)] & 0xff) >= 97) && ((idChars()[((int) 2)] & 0xff) <= 122)) ) || ( (((idChars()[((int) 3)] & 0xff) >= 97) && ((idChars()[((int) 3)] & 0xff) <= 122)) )) ;
            return this.isUnregisteredTag;
        }
        public void _invalidateIsUnregisteredTag() { this.isUnregisteredTag = null; }
        private byte[] saveChunkOfs;
        private Chunk chunk;
        private Riff _root;
        private Riff.ListChunkData _parent;
        public byte[] saveChunkOfs() { return saveChunkOfs; }
        public void setSaveChunkOfs(byte[] _v) { _dirty = true; saveChunkOfs = _v; }
        public Chunk chunk() { return chunk; }
        public void setChunk(Chunk _v) { _dirty = true; chunk = _v; }
        public Riff _root() { return _root; }
        public void set_root(Riff _v) { _dirty = true; _root = _v; }
        public Riff.ListChunkData _parent() { return _parent; }
        public void set_parent(Riff.ListChunkData _v) { _dirty = true; _parent = _v; }
    }
    public static class ListChunkData extends KaitaiStruct.ReadWrite {
        public static ListChunkData fromFile(String fileName) throws IOException {
            return new ListChunkData(new ByteBufferKaitaiStream(fileName));
        }
        public ListChunkData() {
            this(null, null, null);
        }

        public ListChunkData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ListChunkData(KaitaiStream _io, Riff.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public ListChunkData(KaitaiStream _io, Riff.ChunkType _parent, Riff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            if (parentChunkDataOfs() < 0) {
                this.saveParentChunkDataOfs = this._io.readBytes(0);
            }
            this.parentChunkData = new ParentChunkData(this._io, this, _root);
            this.parentChunkData._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            if (parentChunkDataOfs() < 0) {
            }
            this.parentChunkData._fetchInstances();
            formTypeReadable();
            if (this.formTypeReadable != null) {
            }
            subchunks();
            if (this.subchunks != null) {
                for (int i = 0; i < this.subchunks.size(); i++) {
                    {
                        Fourcc on = formType();
                        if (on != null) {
                            switch (formType()) {
                            case INFO: {
                                ((InfoSubchunk) (this.subchunks.get(((Number) (i)).intValue())))._fetchInstances();
                                break;
                            }
                            default: {
                                ((ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._fetchInstances();
                                break;
                            }
                            }
                        } else {
                            ((ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._fetchInstances();
                        }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteFormTypeReadable = _enabledFormTypeReadable;
            _shouldWriteSubchunks = _enabledSubchunks;
            if (parentChunkDataOfs() < 0) {
                if (this.saveParentChunkDataOfs.length != 0)
                    throw new ConsistencyError("save_parent_chunk_data_ofs", 0, this.saveParentChunkDataOfs.length);
                this._io.writeBytes(this.saveParentChunkDataOfs);
            }
            this.parentChunkData._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.parentChunkData._root(), _root()))
                throw new ConsistencyError("parent_chunk_data", _root(), this.parentChunkData._root());
            if (!Objects.equals(this.parentChunkData._parent(), this))
                throw new ConsistencyError("parent_chunk_data", this, this.parentChunkData._parent());
            if (_enabledFormTypeReadable) {
                if ((this.formTypeReadable).getBytes(Charset.forName("ASCII")).length != 4)
                    throw new ConsistencyError("form_type_readable", 4, (this.formTypeReadable).getBytes(Charset.forName("ASCII")).length);
            }
            if (_enabledSubchunks) {
                for (int i = 0; i < this.subchunks.size(); i++) {
                    {
                        Fourcc on = formType();
                        if (on != null) {
                            switch (formType()) {
                            case INFO: {
                                if (!Objects.equals(((Riff.InfoSubchunk) (this.subchunks.get(((Number) (i)).intValue())))._root(), _root()))
                                    throw new ConsistencyError("subchunks", _root(), ((Riff.InfoSubchunk) (this.subchunks.get(((Number) (i)).intValue())))._root());
                                if (!Objects.equals(((Riff.InfoSubchunk) (this.subchunks.get(((Number) (i)).intValue())))._parent(), this))
                                    throw new ConsistencyError("subchunks", this, ((Riff.InfoSubchunk) (this.subchunks.get(((Number) (i)).intValue())))._parent());
                                break;
                            }
                            default: {
                                if (!Objects.equals(((Riff.ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._root(), _root()))
                                    throw new ConsistencyError("subchunks", _root(), ((Riff.ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._root());
                                if (!Objects.equals(((Riff.ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._parent(), this))
                                    throw new ConsistencyError("subchunks", this, ((Riff.ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._parent());
                                break;
                            }
                            }
                        } else {
                            if (!Objects.equals(((Riff.ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._root(), _root()))
                                throw new ConsistencyError("subchunks", _root(), ((Riff.ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._root());
                            if (!Objects.equals(((Riff.ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._parent(), this))
                                throw new ConsistencyError("subchunks", this, ((Riff.ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._parent());
                        }
                    }
                }
            }
            _dirty = false;
        }
        private Fourcc formType;
        public Fourcc formType() {
            if (this.formType != null)
                return this.formType;
            this.formType = Riff.Fourcc.byId(parentChunkData().formType());
            return this.formType;
        }
        public void _invalidateFormType() { this.formType = null; }
        private String formTypeReadable;
        private boolean _shouldWriteFormTypeReadable = false;
        private boolean _enabledFormTypeReadable = true;
        public String formTypeReadable() {
            if (_shouldWriteFormTypeReadable)
                _writeFormTypeReadable();
            if (this.formTypeReadable != null)
                return this.formTypeReadable;
            if (!_enabledFormTypeReadable)
                return null;
            long _pos = this._io.pos();
            this._io.seek(parentChunkDataOfs());
            this.formTypeReadable = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this._io.seek(_pos);
            return this.formTypeReadable;
        }
        public void setFormTypeReadable(String _v) { _dirty = true; formTypeReadable = _v; }
        public void setFormTypeReadable_Enabled(boolean _v) { _dirty = true; _enabledFormTypeReadable = _v; }

        private void _writeFormTypeReadable() {
            _shouldWriteFormTypeReadable = false;
            long _pos = this._io.pos();
            this._io.seek(parentChunkDataOfs());
            this._io.writeBytes((this.formTypeReadable).getBytes(Charset.forName("ASCII")));
            this._io.seek(_pos);
        }
        private Integer parentChunkDataOfs;
        public Integer parentChunkDataOfs() {
            if (this.parentChunkDataOfs != null)
                return this.parentChunkDataOfs;
            this.parentChunkDataOfs = ((Number) (_io().pos())).intValue();
            return this.parentChunkDataOfs;
        }
        public void _invalidateParentChunkDataOfs() { this.parentChunkDataOfs = null; }
        private List<KaitaiStruct.ReadWrite> subchunks;
        private boolean _shouldWriteSubchunks = false;
        private boolean _enabledSubchunks = true;
        public List<KaitaiStruct.ReadWrite> subchunks() {
            if (_shouldWriteSubchunks)
                _writeSubchunks();
            if (this.subchunks != null)
                return this.subchunks;
            if (!_enabledSubchunks)
                return null;
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.subchunks = new ArrayList<KaitaiStruct.ReadWrite>();
            {
                int i = 0;
                while (!io.isEof()) {
                    {
                        Fourcc on = formType();
                        if (on != null) {
                            switch (formType()) {
                            case INFO: {
                                InfoSubchunk _t_subchunks = new InfoSubchunk(io, this, _root);
                                try {
                                    ((InfoSubchunk) (_t_subchunks))._read();
                                } finally {
                                    this.subchunks.add(_t_subchunks);
                                }
                                break;
                            }
                            default: {
                                ChunkType _t_subchunks = new ChunkType(io, this, _root);
                                try {
                                    ((ChunkType) (_t_subchunks))._read();
                                } finally {
                                    this.subchunks.add(_t_subchunks);
                                }
                                break;
                            }
                            }
                        } else {
                            ChunkType _t_subchunks = new ChunkType(io, this, _root);
                            try {
                                ((ChunkType) (_t_subchunks))._read();
                            } finally {
                                this.subchunks.add(_t_subchunks);
                            }
                        }
                    }
                    i++;
                }
            }
            io.seek(_pos);
            return this.subchunks;
        }
        public void setSubchunks(List<KaitaiStruct.ReadWrite> _v) { _dirty = true; subchunks = _v; }
        public void setSubchunks_Enabled(boolean _v) { _dirty = true; _enabledSubchunks = _v; }

        private void _writeSubchunks() {
            _shouldWriteSubchunks = false;
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            for (int i = 0; i < this.subchunks.size(); i++) {
                if (io.isEof())
                    throw new ConsistencyError("subchunks", 0, io.size() - io.pos());
                {
                    Fourcc on = formType();
                    if (on != null) {
                        switch (formType()) {
                        case INFO: {
                            ((InfoSubchunk) (this.subchunks.get(((Number) (i)).intValue())))._write_Seq(io);
                            break;
                        }
                        default: {
                            ((ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._write_Seq(io);
                            break;
                        }
                        }
                    } else {
                        ((ChunkType) (this.subchunks.get(((Number) (i)).intValue())))._write_Seq(io);
                    }
                }
            }
            if (!(io.isEof()))
                throw new ConsistencyError("subchunks", 0, io.size() - io.pos());
            io.seek(_pos);
        }
        private byte[] saveParentChunkDataOfs;
        private ParentChunkData parentChunkData;
        private Riff _root;
        private Riff.ChunkType _parent;
        public byte[] saveParentChunkDataOfs() { return saveParentChunkDataOfs; }
        public void setSaveParentChunkDataOfs(byte[] _v) { _dirty = true; saveParentChunkDataOfs = _v; }
        public ParentChunkData parentChunkData() { return parentChunkData; }
        public void setParentChunkData(ParentChunkData _v) { _dirty = true; parentChunkData = _v; }
        public Riff _root() { return _root; }
        public void set_root(Riff _v) { _dirty = true; _root = _v; }
        public Riff.ChunkType _parent() { return _parent; }
        public void set_parent(Riff.ChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class ParentChunkData extends KaitaiStruct.ReadWrite {
        public static ParentChunkData fromFile(String fileName) throws IOException {
            return new ParentChunkData(new ByteBufferKaitaiStream(fileName));
        }
        public ParentChunkData() {
            this(null, null, null);
        }

        public ParentChunkData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParentChunkData(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public ParentChunkData(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Riff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.formType = this._io.readU4le();
            this._raw_subchunksSlot = this._io.readBytesFull();
            KaitaiStream _io__raw_subchunksSlot = new ByteBufferKaitaiStream(this._raw_subchunksSlot);
            this.subchunksSlot = new Slot(_io__raw_subchunksSlot, this, _root);
            this.subchunksSlot._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.subchunksSlot._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.formType);
            final KaitaiStream _io__raw_subchunksSlot = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
            this._io.addChildStream(_io__raw_subchunksSlot);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                final ParentChunkData _this = this;
                _io__raw_subchunksSlot.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_subchunksSlot = _io__raw_subchunksSlot.toByteArray();
                        parent.writeBytes(_this._raw_subchunksSlot);
                        if (!(parent.isEof()))
                            throw new ConsistencyError("raw(subchunks_slot)", 0, parent.size() - parent.pos());
                    }
                });
            }
            this.subchunksSlot._write_Seq(_io__raw_subchunksSlot);
        }

        public void _check() {
            if (!Objects.equals(this.subchunksSlot._root(), _root()))
                throw new ConsistencyError("subchunks_slot", _root(), this.subchunksSlot._root());
            if (!Objects.equals(this.subchunksSlot._parent(), this))
                throw new ConsistencyError("subchunks_slot", this, this.subchunksSlot._parent());
            _dirty = false;
        }
        public static class Slot extends KaitaiStruct.ReadWrite {
            public static Slot fromFile(String fileName) throws IOException {
                return new Slot(new ByteBufferKaitaiStream(fileName));
            }
            public Slot() {
                this(null, null, null);
            }

            public Slot(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Slot(KaitaiStream _io, Riff.ParentChunkData _parent) {
                this(_io, _parent, null);
            }

            public Slot(KaitaiStream _io, Riff.ParentChunkData _parent, Riff _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
            }

            public void _check() {
                _dirty = false;
            }
            private Riff _root;
            private Riff.ParentChunkData _parent;
            public Riff _root() { return _root; }
            public void set_root(Riff _v) { _dirty = true; _root = _v; }
            public Riff.ParentChunkData _parent() { return _parent; }
            public void set_parent(Riff.ParentChunkData _v) { _dirty = true; _parent = _v; }
        }
        private long formType;
        private Slot subchunksSlot;
        private Riff _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_subchunksSlot;
        public long formType() { return formType; }
        public void setFormType(long _v) { _dirty = true; formType = _v; }
        public Slot subchunksSlot() { return subchunksSlot; }
        public void setSubchunksSlot(Slot _v) { _dirty = true; subchunksSlot = _v; }
        public Riff _root() { return _root; }
        public void set_root(Riff _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_subchunksSlot() { return _raw_subchunksSlot; }
        public void set_raw_SubchunksSlot(byte[] _v) { _dirty = true; _raw_subchunksSlot = _v; }
    }
    private Fourcc chunkId;
    public Fourcc chunkId() {
        if (this.chunkId != null)
            return this.chunkId;
        this.chunkId = Fourcc.byId(chunk().id());
        return this.chunkId;
    }
    public void _invalidateChunkId() { this.chunkId = null; }
    private Boolean isRiffChunk;
    public Boolean isRiffChunk() {
        if (this.isRiffChunk != null)
            return this.isRiffChunk;
        this.isRiffChunk = chunkId() == Fourcc.RIFF;
        return this.isRiffChunk;
    }
    public void _invalidateIsRiffChunk() { this.isRiffChunk = null; }
    private ParentChunkData parentChunkData;
    private boolean _shouldWriteParentChunkData = false;
    private boolean _enabledParentChunkData = true;
    public ParentChunkData parentChunkData() {
        if (_shouldWriteParentChunkData)
            _writeParentChunkData();
        if (this.parentChunkData != null)
            return this.parentChunkData;
        if (!_enabledParentChunkData)
            return null;
        if (isRiffChunk()) {
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.parentChunkData = new ParentChunkData(io, this, _root);
            this.parentChunkData._read();
            io.seek(_pos);
        }
        return this.parentChunkData;
    }
    public void setParentChunkData(ParentChunkData _v) { _dirty = true; parentChunkData = _v; }
    public void setParentChunkData_Enabled(boolean _v) { _dirty = true; _enabledParentChunkData = _v; }

    private void _writeParentChunkData() {
        _shouldWriteParentChunkData = false;
        if (isRiffChunk()) {
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.parentChunkData._write_Seq(io);
            io.seek(_pos);
        }
    }
    private List<ChunkType> subchunks;
    private boolean _shouldWriteSubchunks = false;
    private boolean _enabledSubchunks = true;
    public List<ChunkType> subchunks() {
        if (_shouldWriteSubchunks)
            _writeSubchunks();
        if (this.subchunks != null)
            return this.subchunks;
        if (!_enabledSubchunks)
            return null;
        if (isRiffChunk()) {
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.subchunks = new ArrayList<ChunkType>();
            {
                int i = 0;
                while (!io.isEof()) {
                    ChunkType _t_subchunks = new ChunkType(io, this, _root);
                    try {
                        _t_subchunks._read();
                    } finally {
                        this.subchunks.add(_t_subchunks);
                    }
                    i++;
                }
            }
            io.seek(_pos);
        }
        return this.subchunks;
    }
    public void setSubchunks(List<ChunkType> _v) { _dirty = true; subchunks = _v; }
    public void setSubchunks_Enabled(boolean _v) { _dirty = true; _enabledSubchunks = _v; }

    private void _writeSubchunks() {
        _shouldWriteSubchunks = false;
        if (isRiffChunk()) {
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            for (int i = 0; i < this.subchunks.size(); i++) {
                if (io.isEof())
                    throw new ConsistencyError("subchunks", 0, io.size() - io.pos());
                this.subchunks.get(((Number) (i)).intValue())._write_Seq(io);
            }
            if (!(io.isEof()))
                throw new ConsistencyError("subchunks", 0, io.size() - io.pos());
            io.seek(_pos);
        }
    }
    private Chunk chunk;
    private Riff _root;
    private KaitaiStruct.ReadWrite _parent;
    public Chunk chunk() { return chunk; }
    public void setChunk(Chunk _v) { _dirty = true; chunk = _v; }
    public Riff _root() { return _root; }
    public void set_root(Riff _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
