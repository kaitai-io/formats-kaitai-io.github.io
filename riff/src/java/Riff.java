// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;
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
public class Riff extends KaitaiStruct {
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

    public Riff(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Riff(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Riff(KaitaiStream _io, KaitaiStruct _parent, Riff _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.chunk = new Chunk(this._io, this, _root);
    }
    public static class ListChunkData extends KaitaiStruct {
        public static ListChunkData fromFile(String fileName) throws IOException {
            return new ListChunkData(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            if (parentChunkDataOfs() < 0) {
                this.saveParentChunkDataOfs = this._io.readBytes(0);
            }
            this.parentChunkData = new ParentChunkData(this._io, this, _root);
        }
        private Integer parentChunkDataOfs;
        public Integer parentChunkDataOfs() {
            if (this.parentChunkDataOfs != null)
                return this.parentChunkDataOfs;
            int _tmp = (int) (_io().pos());
            this.parentChunkDataOfs = _tmp;
            return this.parentChunkDataOfs;
        }
        private Fourcc formType;
        public Fourcc formType() {
            if (this.formType != null)
                return this.formType;
            this.formType = Riff.Fourcc.byId(parentChunkData().formType());
            return this.formType;
        }
        private String formTypeReadable;
        public String formTypeReadable() {
            if (this.formTypeReadable != null)
                return this.formTypeReadable;
            long _pos = this._io.pos();
            this._io.seek(parentChunkDataOfs());
            this.formTypeReadable = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this._io.seek(_pos);
            return this.formTypeReadable;
        }
        private ArrayList<KaitaiStruct> subchunks;
        public ArrayList<KaitaiStruct> subchunks() {
            if (this.subchunks != null)
                return this.subchunks;
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.subchunks = new ArrayList<KaitaiStruct>();
            {
                int i = 0;
                while (!io.isEof()) {
                    {
                        Fourcc on = formType();
                        if (on != null) {
                            switch (formType()) {
                            case INFO: {
                                this.subchunks.add(new InfoSubchunk(io, this, _root));
                                break;
                            }
                            default: {
                                this.subchunks.add(new ChunkType(io, this, _root));
                                break;
                            }
                            }
                        } else {
                            this.subchunks.add(new ChunkType(io, this, _root));
                        }
                    }
                    i++;
                }
            }
            io.seek(_pos);
            return this.subchunks;
        }
        private byte[] saveParentChunkDataOfs;
        private ParentChunkData parentChunkData;
        private Riff _root;
        private Riff.ChunkType _parent;
        public byte[] saveParentChunkDataOfs() { return saveParentChunkDataOfs; }
        public ParentChunkData parentChunkData() { return parentChunkData; }
        public Riff _root() { return _root; }
        public Riff.ChunkType _parent() { return _parent; }
    }
    public static class Chunk extends KaitaiStruct {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, KaitaiStruct _parent, Riff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.id = this._io.readU4le();
            this.len = this._io.readU4le();
            this._raw_dataSlot = this._io.readBytes(len());
            KaitaiStream _io__raw_dataSlot = new ByteBufferKaitaiStream(_raw_dataSlot);
            this.dataSlot = new Slot(_io__raw_dataSlot, this, _root);
            this.padByte = this._io.readBytes(KaitaiStream.mod(len(), 2));
        }
        public static class Slot extends KaitaiStruct {
            public static Slot fromFile(String fileName) throws IOException {
                return new Slot(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
            }
            private Riff _root;
            private Riff.Chunk _parent;
            public Riff _root() { return _root; }
            public Riff.Chunk _parent() { return _parent; }
        }
        private long id;
        private long len;
        private Slot dataSlot;
        private byte[] padByte;
        private Riff _root;
        private KaitaiStruct _parent;
        private byte[] _raw_dataSlot;
        public long id() { return id; }
        public long len() { return len; }
        public Slot dataSlot() { return dataSlot; }
        public byte[] padByte() { return padByte; }
        public Riff _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
        public byte[] _raw_dataSlot() { return _raw_dataSlot; }
    }
    public static class ParentChunkData extends KaitaiStruct {
        public static ParentChunkData fromFile(String fileName) throws IOException {
            return new ParentChunkData(new ByteBufferKaitaiStream(fileName));
        }

        public ParentChunkData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParentChunkData(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public ParentChunkData(KaitaiStream _io, KaitaiStruct _parent, Riff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.formType = this._io.readU4le();
            this._raw_subchunksSlot = this._io.readBytesFull();
            KaitaiStream _io__raw_subchunksSlot = new ByteBufferKaitaiStream(_raw_subchunksSlot);
            this.subchunksSlot = new Slot(_io__raw_subchunksSlot, this, _root);
        }
        public static class Slot extends KaitaiStruct {
            public static Slot fromFile(String fileName) throws IOException {
                return new Slot(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
            }
            private Riff _root;
            private Riff.ParentChunkData _parent;
            public Riff _root() { return _root; }
            public Riff.ParentChunkData _parent() { return _parent; }
        }
        private long formType;
        private Slot subchunksSlot;
        private Riff _root;
        private KaitaiStruct _parent;
        private byte[] _raw_subchunksSlot;
        public long formType() { return formType; }
        public Slot subchunksSlot() { return subchunksSlot; }
        public Riff _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
        public byte[] _raw_subchunksSlot() { return _raw_subchunksSlot; }
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
    public static class InfoSubchunk extends KaitaiStruct {
        public static InfoSubchunk fromFile(String fileName) throws IOException {
            return new InfoSubchunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            if (chunkOfs() < 0) {
                this.saveChunkOfs = this._io.readBytes(0);
            }
            this.chunk = new Chunk(this._io, this, _root);
        }
        private String chunkData;
        public String chunkData() {
            if (this.chunkData != null)
                return this.chunkData;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            {
                boolean on = isUnregisteredTag();
                if (on == false) {
                    this.chunkData = new String(io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8"));
                }
            }
            io.seek(_pos);
            return this.chunkData;
        }
        private Boolean isUnregisteredTag;

        /**
         * Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
         */
        public Boolean isUnregisteredTag() {
            if (this.isUnregisteredTag != null)
                return this.isUnregisteredTag;
            boolean _tmp = (boolean) ( (( ((idChars()[0] >= 97) && (idChars()[0] <= 122)) ) || ( ((idChars()[1] >= 97) && (idChars()[1] <= 122)) ) || ( ((idChars()[2] >= 97) && (idChars()[2] <= 122)) ) || ( ((idChars()[3] >= 97) && (idChars()[3] <= 122)) )) );
            this.isUnregisteredTag = _tmp;
            return this.isUnregisteredTag;
        }
        private byte[] idChars;
        public byte[] idChars() {
            if (this.idChars != null)
                return this.idChars;
            long _pos = this._io.pos();
            this._io.seek(chunkOfs());
            this.idChars = this._io.readBytes(4);
            this._io.seek(_pos);
            return this.idChars;
        }
        private String chunkIdReadable;
        public String chunkIdReadable() {
            if (this.chunkIdReadable != null)
                return this.chunkIdReadable;
            this.chunkIdReadable = new String(idChars(), Charset.forName("ASCII"));
            return this.chunkIdReadable;
        }
        private Integer chunkOfs;
        public Integer chunkOfs() {
            if (this.chunkOfs != null)
                return this.chunkOfs;
            int _tmp = (int) (_io().pos());
            this.chunkOfs = _tmp;
            return this.chunkOfs;
        }
        private byte[] saveChunkOfs;
        private Chunk chunk;
        private Riff _root;
        private Riff.ListChunkData _parent;
        public byte[] saveChunkOfs() { return saveChunkOfs; }
        public Chunk chunk() { return chunk; }
        public Riff _root() { return _root; }
        public Riff.ListChunkData _parent() { return _parent; }
    }
    public static class ChunkType extends KaitaiStruct {
        public static ChunkType fromFile(String fileName) throws IOException {
            return new ChunkType(new ByteBufferKaitaiStream(fileName));
        }

        public ChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChunkType(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public ChunkType(KaitaiStream _io, KaitaiStruct _parent, Riff _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            if (chunkOfs() < 0) {
                this.saveChunkOfs = this._io.readBytes(0);
            }
            this.chunk = new Chunk(this._io, this, _root);
        }
        private Integer chunkOfs;
        public Integer chunkOfs() {
            if (this.chunkOfs != null)
                return this.chunkOfs;
            int _tmp = (int) (_io().pos());
            this.chunkOfs = _tmp;
            return this.chunkOfs;
        }
        private Fourcc chunkId;
        public Fourcc chunkId() {
            if (this.chunkId != null)
                return this.chunkId;
            this.chunkId = Riff.Fourcc.byId(chunk().id());
            return this.chunkId;
        }
        private String chunkIdReadable;
        public String chunkIdReadable() {
            if (this.chunkIdReadable != null)
                return this.chunkIdReadable;
            long _pos = this._io.pos();
            this._io.seek(chunkOfs());
            this.chunkIdReadable = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this._io.seek(_pos);
            return this.chunkIdReadable;
        }
        private ListChunkData chunkData;
        public ListChunkData chunkData() {
            if (this.chunkData != null)
                return this.chunkData;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            {
                Fourcc on = chunkId();
                if (on != null) {
                    switch (chunkId()) {
                    case LIST: {
                        this.chunkData = new ListChunkData(io, this, _root);
                        break;
                    }
                    }
                }
            }
            io.seek(_pos);
            return this.chunkData;
        }
        private byte[] saveChunkOfs;
        private Chunk chunk;
        private Riff _root;
        private KaitaiStruct _parent;
        public byte[] saveChunkOfs() { return saveChunkOfs; }
        public Chunk chunk() { return chunk; }
        public Riff _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private Fourcc chunkId;
    public Fourcc chunkId() {
        if (this.chunkId != null)
            return this.chunkId;
        this.chunkId = Fourcc.byId(chunk().id());
        return this.chunkId;
    }
    private Boolean isRiffChunk;
    public Boolean isRiffChunk() {
        if (this.isRiffChunk != null)
            return this.isRiffChunk;
        boolean _tmp = (boolean) (chunkId() == Fourcc.RIFF);
        this.isRiffChunk = _tmp;
        return this.isRiffChunk;
    }
    private ParentChunkData parentChunkData;
    public ParentChunkData parentChunkData() {
        if (this.parentChunkData != null)
            return this.parentChunkData;
        if (isRiffChunk()) {
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.parentChunkData = new ParentChunkData(io, this, _root);
            io.seek(_pos);
        }
        return this.parentChunkData;
    }
    private ArrayList<ChunkType> subchunks;
    public ArrayList<ChunkType> subchunks() {
        if (this.subchunks != null)
            return this.subchunks;
        if (isRiffChunk()) {
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.subchunks = new ArrayList<ChunkType>();
            {
                int i = 0;
                while (!io.isEof()) {
                    this.subchunks.add(new ChunkType(io, this, _root));
                    i++;
                }
            }
            io.seek(_pos);
        }
        return this.subchunks;
    }
    private Chunk chunk;
    private Riff _root;
    private KaitaiStruct _parent;
    public Chunk chunk() { return chunk; }
    public Riff _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
