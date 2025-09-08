// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class DoomWad extends KaitaiStruct.ReadWrite {
    public static DoomWad fromFile(String fileName) throws IOException {
        return new DoomWad(new ByteBufferKaitaiStream(fileName));
    }
    public DoomWad() {
        this(null, null, null);
    }

    public DoomWad(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DoomWad(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public DoomWad(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DoomWad _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
        this.numIndexEntries = this._io.readS4le();
        this.indexOffset = this._io.readS4le();
        _dirty = false;
    }

    public void _fetchInstances() {
        index();
        if (this.index != null) {
            for (int i = 0; i < this.index.size(); i++) {
                this.index.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteIndex = _enabledIndex;
        this._io.writeBytes((this.magic).getBytes(Charset.forName("ASCII")));
        this._io.writeS4le(this.numIndexEntries);
        this._io.writeS4le(this.indexOffset);
    }

    public void _check() {
        if ((this.magic).getBytes(Charset.forName("ASCII")).length != 4)
            throw new ConsistencyError("magic", 4, (this.magic).getBytes(Charset.forName("ASCII")).length);
        if (_enabledIndex) {
            if (this.index.size() != numIndexEntries())
                throw new ConsistencyError("index", numIndexEntries(), this.index.size());
            for (int i = 0; i < this.index.size(); i++) {
                if (!Objects.equals(this.index.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("index", _root(), this.index.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.index.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("index", this, this.index.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }
    public static class Blockmap extends KaitaiStruct.ReadWrite {
        public static Blockmap fromFile(String fileName) throws IOException {
            return new Blockmap(new ByteBufferKaitaiStream(fileName));
        }
        public Blockmap() {
            this(null, null, null);
        }

        public Blockmap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Blockmap(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Blockmap(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.originX = this._io.readS2le();
            this.originY = this._io.readS2le();
            this.numCols = this._io.readS2le();
            this.numRows = this._io.readS2le();
            this.linedefsInBlock = new ArrayList<Blocklist>();
            for (int i = 0; i < numCols() * numRows(); i++) {
                Blocklist _t_linedefsInBlock = new Blocklist(this._io, this, _root);
                try {
                    _t_linedefsInBlock._read();
                } finally {
                    this.linedefsInBlock.add(_t_linedefsInBlock);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.linedefsInBlock.size(); i++) {
                this.linedefsInBlock.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.originX);
            this._io.writeS2le(this.originY);
            this._io.writeS2le(this.numCols);
            this._io.writeS2le(this.numRows);
            for (int i = 0; i < this.linedefsInBlock.size(); i++) {
                this.linedefsInBlock.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.linedefsInBlock.size() != numCols() * numRows())
                throw new ConsistencyError("linedefs_in_block", numCols() * numRows(), this.linedefsInBlock.size());
            for (int i = 0; i < this.linedefsInBlock.size(); i++) {
                if (!Objects.equals(this.linedefsInBlock.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("linedefs_in_block", _root(), this.linedefsInBlock.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.linedefsInBlock.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("linedefs_in_block", this, this.linedefsInBlock.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Blocklist extends KaitaiStruct.ReadWrite {
            public static Blocklist fromFile(String fileName) throws IOException {
                return new Blocklist(new ByteBufferKaitaiStream(fileName));
            }
            public Blocklist() {
                this(null, null, null);
            }

            public Blocklist(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Blocklist(KaitaiStream _io, DoomWad.Blockmap _parent) {
                this(_io, _parent, null);
            }

            public Blocklist(KaitaiStream _io, DoomWad.Blockmap _parent, DoomWad _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.offset = this._io.readU2le();
                _dirty = false;
            }

            public void _fetchInstances() {
                linedefs();
                if (this.linedefs != null) {
                    for (int i = 0; i < this.linedefs.size(); i++) {
                    }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteLinedefs = _enabledLinedefs;
                this._io.writeU2le(this.offset);
            }

            public void _check() {
                if (_enabledLinedefs) {
                    if (this.linedefs.size() == 0)
                        throw new ConsistencyError("linedefs", 0, this.linedefs.size());
                    for (int i = 0; i < this.linedefs.size(); i++) {
                        {
                            short _it = this.linedefs.get(((Number) (i)).intValue());
                            if ((_it == -1) != (i == this.linedefs.size() - 1))
                                throw new ConsistencyError("linedefs", i == this.linedefs.size() - 1, _it == -1);
                        }
                    }
                }
                _dirty = false;
            }
            private List<Short> linedefs;
            private boolean _shouldWriteLinedefs = false;
            private boolean _enabledLinedefs = true;

            /**
             * List of linedefs found in this block
             */
            public List<Short> linedefs() {
                if (_shouldWriteLinedefs)
                    _writeLinedefs();
                if (this.linedefs != null)
                    return this.linedefs;
                if (!_enabledLinedefs)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(offset() * 2);
                this.linedefs = new ArrayList<Short>();
                {
                    short _it;
                    int i = 0;
                    do {
                        _it = this._io.readS2le();
                        this.linedefs.add(_it);
                        i++;
                    } while (!(_it == -1));
                }
                this._io.seek(_pos);
                return this.linedefs;
            }
            public void setLinedefs(List<Short> _v) { _dirty = true; linedefs = _v; }
            public void setLinedefs_Enabled(boolean _v) { _dirty = true; _enabledLinedefs = _v; }

            private void _writeLinedefs() {
                _shouldWriteLinedefs = false;
                long _pos = this._io.pos();
                this._io.seek(offset() * 2);
                for (int i = 0; i < this.linedefs.size(); i++) {
                    this._io.writeS2le(this.linedefs.get(((Number) (i)).intValue()));
                }
                this._io.seek(_pos);
            }
            private int offset;
            private DoomWad _root;
            private DoomWad.Blockmap _parent;

            /**
             * Offset to the list of linedefs
             */
            public int offset() { return offset; }
            public void setOffset(int _v) { _dirty = true; offset = _v; }
            public DoomWad _root() { return _root; }
            public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
            public DoomWad.Blockmap _parent() { return _parent; }
            public void set_parent(DoomWad.Blockmap _v) { _dirty = true; _parent = _v; }
        }
        private short originX;
        private short originY;
        private short numCols;
        private short numRows;
        private List<Blocklist> linedefsInBlock;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;

        /**
         * Grid origin, X coord
         */
        public short originX() { return originX; }
        public void setOriginX(short _v) { _dirty = true; originX = _v; }

        /**
         * Grid origin, Y coord
         */
        public short originY() { return originY; }
        public void setOriginY(short _v) { _dirty = true; originY = _v; }

        /**
         * Number of columns
         */
        public short numCols() { return numCols; }
        public void setNumCols(short _v) { _dirty = true; numCols = _v; }

        /**
         * Number of rows
         */
        public short numRows() { return numRows; }
        public void setNumRows(short _v) { _dirty = true; numRows = _v; }

        /**
         * Lists of linedefs for every block
         */
        public List<Blocklist> linedefsInBlock() { return linedefsInBlock; }
        public void setLinedefsInBlock(List<Blocklist> _v) { _dirty = true; linedefsInBlock = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.IndexEntry _parent() { return _parent; }
        public void set_parent(DoomWad.IndexEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class IndexEntry extends KaitaiStruct.ReadWrite {
        public static IndexEntry fromFile(String fileName) throws IOException {
            return new IndexEntry(new ByteBufferKaitaiStream(fileName));
        }
        public IndexEntry() {
            this(null, null, null);
        }

        public IndexEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexEntry(KaitaiStream _io, DoomWad _parent) {
            this(_io, _parent, null);
        }

        public IndexEntry(KaitaiStream _io, DoomWad _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.offset = this._io.readS4le();
            this.size = this._io.readS4le();
            this.name = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 0), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
            contents();
            if (this.contents != null) {
                switch (name()) {
                case "BLOCKMAP": {
                    ((Blockmap) (this.contents))._fetchInstances();
                    break;
                }
                case "LINEDEFS": {
                    ((Linedefs) (this.contents))._fetchInstances();
                    break;
                }
                case "PNAMES": {
                    ((Pnames) (this.contents))._fetchInstances();
                    break;
                }
                case "SECTORS": {
                    ((Sectors) (this.contents))._fetchInstances();
                    break;
                }
                case "SIDEDEFS": {
                    ((Sidedefs) (this.contents))._fetchInstances();
                    break;
                }
                case "TEXTURE1": {
                    ((Texture12) (this.contents))._fetchInstances();
                    break;
                }
                case "TEXTURE2": {
                    ((Texture12) (this.contents))._fetchInstances();
                    break;
                }
                case "THINGS": {
                    ((Things) (this.contents))._fetchInstances();
                    break;
                }
                case "VERTEXES": {
                    ((Vertexes) (this.contents))._fetchInstances();
                    break;
                }
                default: {
                    break;
                }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteContents = _enabledContents;
            this._io.writeS4le(this.offset);
            this._io.writeS4le(this.size);
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 8, (byte) 0, (byte) 0);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("ASCII")).length > 8)
                throw new ConsistencyError("name", 8, (this.name).getBytes(Charset.forName("ASCII")).length);
            if ( (((this.name).getBytes(Charset.forName("ASCII")).length != 0) && (((this.name).getBytes(Charset.forName("ASCII"))[((Number) ((this.name).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                throw new ConsistencyError("name", 0, ((this.name).getBytes(Charset.forName("ASCII"))[((Number) ((this.name).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            if (_enabledContents) {
                switch (name()) {
                case "BLOCKMAP": {
                    if (!Objects.equals(((DoomWad.Blockmap) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Blockmap) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Blockmap) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Blockmap) (this.contents))._parent());
                    break;
                }
                case "LINEDEFS": {
                    if (!Objects.equals(((DoomWad.Linedefs) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Linedefs) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Linedefs) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Linedefs) (this.contents))._parent());
                    break;
                }
                case "PNAMES": {
                    if (!Objects.equals(((DoomWad.Pnames) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Pnames) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Pnames) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Pnames) (this.contents))._parent());
                    break;
                }
                case "SECTORS": {
                    if (!Objects.equals(((DoomWad.Sectors) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Sectors) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Sectors) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Sectors) (this.contents))._parent());
                    break;
                }
                case "SIDEDEFS": {
                    if (!Objects.equals(((DoomWad.Sidedefs) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Sidedefs) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Sidedefs) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Sidedefs) (this.contents))._parent());
                    break;
                }
                case "TEXTURE1": {
                    if (!Objects.equals(((DoomWad.Texture12) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Texture12) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Texture12) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Texture12) (this.contents))._parent());
                    break;
                }
                case "TEXTURE2": {
                    if (!Objects.equals(((DoomWad.Texture12) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Texture12) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Texture12) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Texture12) (this.contents))._parent());
                    break;
                }
                case "THINGS": {
                    if (!Objects.equals(((DoomWad.Things) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Things) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Things) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Things) (this.contents))._parent());
                    break;
                }
                case "VERTEXES": {
                    if (!Objects.equals(((DoomWad.Vertexes) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((DoomWad.Vertexes) (this.contents))._root());
                    if (!Objects.equals(((DoomWad.Vertexes) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((DoomWad.Vertexes) (this.contents))._parent());
                    break;
                }
                default: {
                    if (((byte[]) (this.contents)).length != size())
                        throw new ConsistencyError("contents", size(), ((byte[]) (this.contents)).length);
                    break;
                }
                }
            }
            _dirty = false;
        }
        private Object contents;
        private boolean _shouldWriteContents = false;
        private boolean _enabledContents = true;
        public Object contents() {
            if (_shouldWriteContents)
                _writeContents();
            if (this.contents != null)
                return this.contents;
            if (!_enabledContents)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            switch (name()) {
            case "BLOCKMAP": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Blockmap(_io__raw_contents, this, _root);
                ((Blockmap) (this.contents))._read();
                break;
            }
            case "LINEDEFS": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Linedefs(_io__raw_contents, this, _root);
                ((Linedefs) (this.contents))._read();
                break;
            }
            case "PNAMES": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Pnames(_io__raw_contents, this, _root);
                ((Pnames) (this.contents))._read();
                break;
            }
            case "SECTORS": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Sectors(_io__raw_contents, this, _root);
                ((Sectors) (this.contents))._read();
                break;
            }
            case "SIDEDEFS": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Sidedefs(_io__raw_contents, this, _root);
                ((Sidedefs) (this.contents))._read();
                break;
            }
            case "TEXTURE1": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Texture12(_io__raw_contents, this, _root);
                ((Texture12) (this.contents))._read();
                break;
            }
            case "TEXTURE2": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Texture12(_io__raw_contents, this, _root);
                ((Texture12) (this.contents))._read();
                break;
            }
            case "THINGS": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Things(_io__raw_contents, this, _root);
                ((Things) (this.contents))._read();
                break;
            }
            case "VERTEXES": {
                this._raw_contents = io.readBytes(size());
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new Vertexes(_io__raw_contents, this, _root);
                ((Vertexes) (this.contents))._read();
                break;
            }
            default: {
                this.contents = io.readBytes(size());
                break;
            }
            }
            io.seek(_pos);
            return this.contents;
        }
        public void setContents(Object _v) { _dirty = true; contents = _v; }
        public void setContents_Enabled(boolean _v) { _dirty = true; _enabledContents = _v; }

        private void _writeContents() {
            _shouldWriteContents = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            switch (name()) {
            case "BLOCKMAP": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Blockmap) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            case "LINEDEFS": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Linedefs) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            case "PNAMES": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Pnames) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            case "SECTORS": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Sectors) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            case "SIDEDEFS": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Sidedefs) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            case "TEXTURE1": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Texture12) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            case "TEXTURE2": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Texture12) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            case "THINGS": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Things) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            case "VERTEXES": {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(size());
                io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (size()));
                    final IndexEntry _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            if (((byte[]) (_this._raw_contents)).length != size())
                                throw new ConsistencyError("raw(contents)", size(), ((byte[]) (_this._raw_contents)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                        }
                    });
                }
                ((Vertexes) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            default: {
                io.writeBytes(((byte[]) (((byte[]) (this.contents)))));
                break;
            }
            }
            io.seek(_pos);
        }
        private int offset;
        private int size;
        private String name;
        private DoomWad _root;
        private DoomWad _parent;
        private byte[] _raw_contents;
        public int offset() { return offset; }
        public void setOffset(int _v) { _dirty = true; offset = _v; }
        public int size() { return size; }
        public void setSize(int _v) { _dirty = true; size = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad _parent() { return _parent; }
        public void set_parent(DoomWad _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_contents() { return _raw_contents; }
        public void set_raw_Contents(byte[] _v) { _dirty = true; _raw_contents = _v; }
    }
    public static class Linedef extends KaitaiStruct.ReadWrite {
        public static Linedef fromFile(String fileName) throws IOException {
            return new Linedef(new ByteBufferKaitaiStream(fileName));
        }
        public Linedef() {
            this(null, null, null);
        }

        public Linedef(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Linedef(KaitaiStream _io, DoomWad.Linedefs _parent) {
            this(_io, _parent, null);
        }

        public Linedef(KaitaiStream _io, DoomWad.Linedefs _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.vertexStartIdx = this._io.readU2le();
            this.vertexEndIdx = this._io.readU2le();
            this.flags = this._io.readU2le();
            this.lineType = this._io.readU2le();
            this.sectorTag = this._io.readU2le();
            this.sidedefRightIdx = this._io.readU2le();
            this.sidedefLeftIdx = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.vertexStartIdx);
            this._io.writeU2le(this.vertexEndIdx);
            this._io.writeU2le(this.flags);
            this._io.writeU2le(this.lineType);
            this._io.writeU2le(this.sectorTag);
            this._io.writeU2le(this.sidedefRightIdx);
            this._io.writeU2le(this.sidedefLeftIdx);
        }

        public void _check() {
            _dirty = false;
        }
        private int vertexStartIdx;
        private int vertexEndIdx;
        private int flags;
        private int lineType;
        private int sectorTag;
        private int sidedefRightIdx;
        private int sidedefLeftIdx;
        private DoomWad _root;
        private DoomWad.Linedefs _parent;
        public int vertexStartIdx() { return vertexStartIdx; }
        public void setVertexStartIdx(int _v) { _dirty = true; vertexStartIdx = _v; }
        public int vertexEndIdx() { return vertexEndIdx; }
        public void setVertexEndIdx(int _v) { _dirty = true; vertexEndIdx = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public int lineType() { return lineType; }
        public void setLineType(int _v) { _dirty = true; lineType = _v; }
        public int sectorTag() { return sectorTag; }
        public void setSectorTag(int _v) { _dirty = true; sectorTag = _v; }
        public int sidedefRightIdx() { return sidedefRightIdx; }
        public void setSidedefRightIdx(int _v) { _dirty = true; sidedefRightIdx = _v; }
        public int sidedefLeftIdx() { return sidedefLeftIdx; }
        public void setSidedefLeftIdx(int _v) { _dirty = true; sidedefLeftIdx = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.Linedefs _parent() { return _parent; }
        public void set_parent(DoomWad.Linedefs _v) { _dirty = true; _parent = _v; }
    }
    public static class Linedefs extends KaitaiStruct.ReadWrite {
        public static Linedefs fromFile(String fileName) throws IOException {
            return new Linedefs(new ByteBufferKaitaiStream(fileName));
        }
        public Linedefs() {
            this(null, null, null);
        }

        public Linedefs(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Linedefs(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Linedefs(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Linedef>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Linedef _t_entries = new Linedef(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Linedef> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public List<Linedef> entries() { return entries; }
        public void setEntries(List<Linedef> _v) { _dirty = true; entries = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.IndexEntry _parent() { return _parent; }
        public void set_parent(DoomWad.IndexEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://doom.fandom.com/wiki/PNAMES">Source</a>
     */
    public static class Pnames extends KaitaiStruct.ReadWrite {
        public static Pnames fromFile(String fileName) throws IOException {
            return new Pnames(new ByteBufferKaitaiStream(fileName));
        }
        public Pnames() {
            this(null, null, null);
        }

        public Pnames(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pnames(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Pnames(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numPatches = this._io.readU4le();
            this.names = new ArrayList<String>();
            for (int i = 0; i < numPatches(); i++) {
                this.names.add(new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 0), StandardCharsets.US_ASCII));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.names.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numPatches);
            for (int i = 0; i < this.names.size(); i++) {
                this._io.writeBytesLimit((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), 8, (byte) 0, (byte) 0);
            }
        }

        public void _check() {
            if (this.names.size() != numPatches())
                throw new ConsistencyError("names", numPatches(), this.names.size());
            for (int i = 0; i < this.names.size(); i++) {
                if ((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length > 8)
                    throw new ConsistencyError("names", 8, (this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length);
                if ( (((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length != 0) && (((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII"))[((Number) ((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                    throw new ConsistencyError("names", 0, ((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII"))[((Number) ((this.names.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
            }
            _dirty = false;
        }
        private long numPatches;
        private List<String> names;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;

        /**
         * Number of patches registered in this global game directory
         */
        public long numPatches() { return numPatches; }
        public void setNumPatches(long _v) { _dirty = true; numPatches = _v; }
        public List<String> names() { return names; }
        public void setNames(List<String> _v) { _dirty = true; names = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.IndexEntry _parent() { return _parent; }
        public void set_parent(DoomWad.IndexEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Sector extends KaitaiStruct.ReadWrite {
        public static Sector fromFile(String fileName) throws IOException {
            return new Sector(new ByteBufferKaitaiStream(fileName));
        }

        public enum SpecialSector {
            NORMAL(0),
            D_LIGHT_FLICKER(1),
            D_LIGHT_STROBE_FAST(2),
            D_LIGHT_STROBE_SLOW(3),
            D_LIGHT_STROBE_HURT(4),
            D_DAMAGE_HELLSLIME(5),
            D_DAMAGE_NUKAGE(7),
            D_LIGHT_GLOW(8),
            SECRET(9),
            D_SECTOR_DOOR_CLOSE_IN_30(10),
            D_DAMAGE_END(11),
            D_LIGHT_STROBE_SLOW_SYNC(12),
            D_LIGHT_STROBE_FAST_SYNC(13),
            D_SECTOR_DOOR_RAISE_IN_5_MINS(14),
            D_FRICTION_LOW(15),
            D_DAMAGE_SUPER_HELLSLIME(16),
            D_LIGHT_FIRE_FLICKER(17),
            D_DAMAGE_LAVA_WIMPY(18),
            D_DAMAGE_LAVA_HEFTY(19),
            D_SCROLL_EAST_LAVA_DAMAGE(20),
            LIGHT_PHASED(21),
            LIGHT_SEQUENCE_START(22),
            LIGHT_SEQUENCE_SPECIAL1(23),
            LIGHT_SEQUENCE_SPECIAL2(24);

            private final long id;
            SpecialSector(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, SpecialSector> byId = new HashMap<Long, SpecialSector>(24);
            static {
                for (SpecialSector e : SpecialSector.values())
                    byId.put(e.id(), e);
            }
            public static SpecialSector byId(long id) { return byId.get(id); }
        }
        public Sector() {
            this(null, null, null);
        }

        public Sector(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sector(KaitaiStream _io, DoomWad.Sectors _parent) {
            this(_io, _parent, null);
        }

        public Sector(KaitaiStream _io, DoomWad.Sectors _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.floorZ = this._io.readS2le();
            this.ceilZ = this._io.readS2le();
            this.floorFlat = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            this.ceilFlat = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            this.light = this._io.readS2le();
            this.specialType = SpecialSector.byId(this._io.readU2le());
            this.tag = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.floorZ);
            this._io.writeS2le(this.ceilZ);
            this._io.writeBytes((this.floorFlat).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.ceilFlat).getBytes(Charset.forName("ASCII")));
            this._io.writeS2le(this.light);
            this._io.writeU2le(((Number) (this.specialType.id())).intValue());
            this._io.writeU2le(this.tag);
        }

        public void _check() {
            if ((this.floorFlat).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("floor_flat", 8, (this.floorFlat).getBytes(Charset.forName("ASCII")).length);
            if ((this.ceilFlat).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("ceil_flat", 8, (this.ceilFlat).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private short floorZ;
        private short ceilZ;
        private String floorFlat;
        private String ceilFlat;
        private short light;
        private SpecialSector specialType;
        private int tag;
        private DoomWad _root;
        private DoomWad.Sectors _parent;
        public short floorZ() { return floorZ; }
        public void setFloorZ(short _v) { _dirty = true; floorZ = _v; }
        public short ceilZ() { return ceilZ; }
        public void setCeilZ(short _v) { _dirty = true; ceilZ = _v; }
        public String floorFlat() { return floorFlat; }
        public void setFloorFlat(String _v) { _dirty = true; floorFlat = _v; }
        public String ceilFlat() { return ceilFlat; }
        public void setCeilFlat(String _v) { _dirty = true; ceilFlat = _v; }

        /**
         * Light level of the sector [0..255]. Original engine uses
         * COLORMAP to render lighting, so only 32 actual levels are
         * available (i.e. 0..7, 8..15, etc).
         */
        public short light() { return light; }
        public void setLight(short _v) { _dirty = true; light = _v; }
        public SpecialSector specialType() { return specialType; }
        public void setSpecialType(SpecialSector _v) { _dirty = true; specialType = _v; }

        /**
         * Tag number. When the linedef with the same tag number is
         * activated, some effect will be triggered in this sector.
         */
        public int tag() { return tag; }
        public void setTag(int _v) { _dirty = true; tag = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.Sectors _parent() { return _parent; }
        public void set_parent(DoomWad.Sectors _v) { _dirty = true; _parent = _v; }
    }
    public static class Sectors extends KaitaiStruct.ReadWrite {
        public static Sectors fromFile(String fileName) throws IOException {
            return new Sectors(new ByteBufferKaitaiStream(fileName));
        }
        public Sectors() {
            this(null, null, null);
        }

        public Sectors(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sectors(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Sectors(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Sector>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Sector _t_entries = new Sector(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Sector> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public List<Sector> entries() { return entries; }
        public void setEntries(List<Sector> _v) { _dirty = true; entries = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.IndexEntry _parent() { return _parent; }
        public void set_parent(DoomWad.IndexEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Sidedef extends KaitaiStruct.ReadWrite {
        public static Sidedef fromFile(String fileName) throws IOException {
            return new Sidedef(new ByteBufferKaitaiStream(fileName));
        }
        public Sidedef() {
            this(null, null, null);
        }

        public Sidedef(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sidedef(KaitaiStream _io, DoomWad.Sidedefs _parent) {
            this(_io, _parent, null);
        }

        public Sidedef(KaitaiStream _io, DoomWad.Sidedefs _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.offsetX = this._io.readS2le();
            this.offsetY = this._io.readS2le();
            this.upperTextureName = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            this.lowerTextureName = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            this.normalTextureName = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            this.sectorId = this._io.readS2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.offsetX);
            this._io.writeS2le(this.offsetY);
            this._io.writeBytes((this.upperTextureName).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.lowerTextureName).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.normalTextureName).getBytes(Charset.forName("ASCII")));
            this._io.writeS2le(this.sectorId);
        }

        public void _check() {
            if ((this.upperTextureName).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("upper_texture_name", 8, (this.upperTextureName).getBytes(Charset.forName("ASCII")).length);
            if ((this.lowerTextureName).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("lower_texture_name", 8, (this.lowerTextureName).getBytes(Charset.forName("ASCII")).length);
            if ((this.normalTextureName).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("normal_texture_name", 8, (this.normalTextureName).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private short offsetX;
        private short offsetY;
        private String upperTextureName;
        private String lowerTextureName;
        private String normalTextureName;
        private short sectorId;
        private DoomWad _root;
        private DoomWad.Sidedefs _parent;
        public short offsetX() { return offsetX; }
        public void setOffsetX(short _v) { _dirty = true; offsetX = _v; }
        public short offsetY() { return offsetY; }
        public void setOffsetY(short _v) { _dirty = true; offsetY = _v; }
        public String upperTextureName() { return upperTextureName; }
        public void setUpperTextureName(String _v) { _dirty = true; upperTextureName = _v; }
        public String lowerTextureName() { return lowerTextureName; }
        public void setLowerTextureName(String _v) { _dirty = true; lowerTextureName = _v; }
        public String normalTextureName() { return normalTextureName; }
        public void setNormalTextureName(String _v) { _dirty = true; normalTextureName = _v; }
        public short sectorId() { return sectorId; }
        public void setSectorId(short _v) { _dirty = true; sectorId = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.Sidedefs _parent() { return _parent; }
        public void set_parent(DoomWad.Sidedefs _v) { _dirty = true; _parent = _v; }
    }
    public static class Sidedefs extends KaitaiStruct.ReadWrite {
        public static Sidedefs fromFile(String fileName) throws IOException {
            return new Sidedefs(new ByteBufferKaitaiStream(fileName));
        }
        public Sidedefs() {
            this(null, null, null);
        }

        public Sidedefs(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sidedefs(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Sidedefs(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Sidedef>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Sidedef _t_entries = new Sidedef(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Sidedef> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public List<Sidedef> entries() { return entries; }
        public void setEntries(List<Sidedef> _v) { _dirty = true; entries = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.IndexEntry _parent() { return _parent; }
        public void set_parent(DoomWad.IndexEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
     * combine wall patches to make wall textures. This essentially
     * provides a very simple form of image compression, allowing
     * certain elements ("patches") to be reused / recombined on
     * different textures for more variety in the game.
     * @see <a href="https://doom.fandom.com/wiki/TEXTURE1_and_TEXTURE2">Source</a>
     */
    public static class Texture12 extends KaitaiStruct.ReadWrite {
        public static Texture12 fromFile(String fileName) throws IOException {
            return new Texture12(new ByteBufferKaitaiStream(fileName));
        }
        public Texture12() {
            this(null, null, null);
        }

        public Texture12(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Texture12(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Texture12(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numTextures = this._io.readS4le();
            this.textures = new ArrayList<TextureIndex>();
            for (int i = 0; i < numTextures(); i++) {
                TextureIndex _t_textures = new TextureIndex(this._io, this, _root);
                try {
                    _t_textures._read();
                } finally {
                    this.textures.add(_t_textures);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.textures.size(); i++) {
                this.textures.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.numTextures);
            for (int i = 0; i < this.textures.size(); i++) {
                this.textures.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.textures.size() != numTextures())
                throw new ConsistencyError("textures", numTextures(), this.textures.size());
            for (int i = 0; i < this.textures.size(); i++) {
                if (!Objects.equals(this.textures.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("textures", _root(), this.textures.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.textures.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("textures", this, this.textures.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Patch extends KaitaiStruct.ReadWrite {
            public static Patch fromFile(String fileName) throws IOException {
                return new Patch(new ByteBufferKaitaiStream(fileName));
            }
            public Patch() {
                this(null, null, null);
            }

            public Patch(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Patch(KaitaiStream _io, DoomWad.Texture12.TextureBody _parent) {
                this(_io, _parent, null);
            }

            public Patch(KaitaiStream _io, DoomWad.Texture12.TextureBody _parent, DoomWad _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.originX = this._io.readS2le();
                this.originY = this._io.readS2le();
                this.patchId = this._io.readU2le();
                this.stepDir = this._io.readU2le();
                this.colormap = this._io.readU2le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeS2le(this.originX);
                this._io.writeS2le(this.originY);
                this._io.writeU2le(this.patchId);
                this._io.writeU2le(this.stepDir);
                this._io.writeU2le(this.colormap);
            }

            public void _check() {
                _dirty = false;
            }
            private short originX;
            private short originY;
            private int patchId;
            private int stepDir;
            private int colormap;
            private DoomWad _root;
            private DoomWad.Texture12.TextureBody _parent;

            /**
             * X offset to draw a patch at (pixels from left boundary of a texture)
             */
            public short originX() { return originX; }
            public void setOriginX(short _v) { _dirty = true; originX = _v; }

            /**
             * Y offset to draw a patch at (pixels from upper boundary of a texture)
             */
            public short originY() { return originY; }
            public void setOriginY(short _v) { _dirty = true; originY = _v; }

            /**
             * Identifier of a patch (as listed in PNAMES lump) to draw
             */
            public int patchId() { return patchId; }
            public void setPatchId(int _v) { _dirty = true; patchId = _v; }
            public int stepDir() { return stepDir; }
            public void setStepDir(int _v) { _dirty = true; stepDir = _v; }
            public int colormap() { return colormap; }
            public void setColormap(int _v) { _dirty = true; colormap = _v; }
            public DoomWad _root() { return _root; }
            public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
            public DoomWad.Texture12.TextureBody _parent() { return _parent; }
            public void set_parent(DoomWad.Texture12.TextureBody _v) { _dirty = true; _parent = _v; }
        }
        public static class TextureBody extends KaitaiStruct.ReadWrite {
            public static TextureBody fromFile(String fileName) throws IOException {
                return new TextureBody(new ByteBufferKaitaiStream(fileName));
            }
            public TextureBody() {
                this(null, null, null);
            }

            public TextureBody(KaitaiStream _io) {
                this(_io, null, null);
            }

            public TextureBody(KaitaiStream _io, DoomWad.Texture12.TextureIndex _parent) {
                this(_io, _parent, null);
            }

            public TextureBody(KaitaiStream _io, DoomWad.Texture12.TextureIndex _parent, DoomWad _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.name = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 0), StandardCharsets.US_ASCII);
                this.masked = this._io.readU4le();
                this.width = this._io.readU2le();
                this.height = this._io.readU2le();
                this.columnDirectory = this._io.readU4le();
                this.numPatches = this._io.readU2le();
                this.patches = new ArrayList<Patch>();
                for (int i = 0; i < numPatches(); i++) {
                    Patch _t_patches = new Patch(this._io, this, _root);
                    try {
                        _t_patches._read();
                    } finally {
                        this.patches.add(_t_patches);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.patches.size(); i++) {
                    this.patches.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 8, (byte) 0, (byte) 0);
                this._io.writeU4le(this.masked);
                this._io.writeU2le(this.width);
                this._io.writeU2le(this.height);
                this._io.writeU4le(this.columnDirectory);
                this._io.writeU2le(this.numPatches);
                for (int i = 0; i < this.patches.size(); i++) {
                    this.patches.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if ((this.name).getBytes(Charset.forName("ASCII")).length > 8)
                    throw new ConsistencyError("name", 8, (this.name).getBytes(Charset.forName("ASCII")).length);
                if ( (((this.name).getBytes(Charset.forName("ASCII")).length != 0) && (((this.name).getBytes(Charset.forName("ASCII"))[((Number) ((this.name).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff) == 0)) )
                    throw new ConsistencyError("name", 0, ((this.name).getBytes(Charset.forName("ASCII"))[((Number) ((this.name).getBytes(Charset.forName("ASCII")).length - 1)).intValue()] & 0xff));
                if (this.patches.size() != numPatches())
                    throw new ConsistencyError("patches", numPatches(), this.patches.size());
                for (int i = 0; i < this.patches.size(); i++) {
                    if (!Objects.equals(this.patches.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("patches", _root(), this.patches.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.patches.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("patches", this, this.patches.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private String name;
            private long masked;
            private int width;
            private int height;
            private long columnDirectory;
            private int numPatches;
            private List<Patch> patches;
            private DoomWad _root;
            private DoomWad.Texture12.TextureIndex _parent;

            /**
             * Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
             */
            public String name() { return name; }
            public void setName(String _v) { _dirty = true; name = _v; }
            public long masked() { return masked; }
            public void setMasked(long _v) { _dirty = true; masked = _v; }
            public int width() { return width; }
            public void setWidth(int _v) { _dirty = true; width = _v; }
            public int height() { return height; }
            public void setHeight(int _v) { _dirty = true; height = _v; }

            /**
             * Obsolete, ignored by all DOOM versions
             */
            public long columnDirectory() { return columnDirectory; }
            public void setColumnDirectory(long _v) { _dirty = true; columnDirectory = _v; }

            /**
             * Number of patches that are used in a texture
             */
            public int numPatches() { return numPatches; }
            public void setNumPatches(int _v) { _dirty = true; numPatches = _v; }
            public List<Patch> patches() { return patches; }
            public void setPatches(List<Patch> _v) { _dirty = true; patches = _v; }
            public DoomWad _root() { return _root; }
            public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
            public DoomWad.Texture12.TextureIndex _parent() { return _parent; }
            public void set_parent(DoomWad.Texture12.TextureIndex _v) { _dirty = true; _parent = _v; }
        }
        public static class TextureIndex extends KaitaiStruct.ReadWrite {
            public static TextureIndex fromFile(String fileName) throws IOException {
                return new TextureIndex(new ByteBufferKaitaiStream(fileName));
            }
            public TextureIndex() {
                this(null, null, null);
            }

            public TextureIndex(KaitaiStream _io) {
                this(_io, null, null);
            }

            public TextureIndex(KaitaiStream _io, DoomWad.Texture12 _parent) {
                this(_io, _parent, null);
            }

            public TextureIndex(KaitaiStream _io, DoomWad.Texture12 _parent, DoomWad _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.offset = this._io.readS4le();
                _dirty = false;
            }

            public void _fetchInstances() {
                body();
                if (this.body != null) {
                    this.body._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteBody = _enabledBody;
                this._io.writeS4le(this.offset);
            }

            public void _check() {
                if (_enabledBody) {
                    if (!Objects.equals(this.body._root(), _root()))
                        throw new ConsistencyError("body", _root(), this.body._root());
                    if (!Objects.equals(this.body._parent(), this))
                        throw new ConsistencyError("body", this, this.body._parent());
                }
                _dirty = false;
            }
            private TextureBody body;
            private boolean _shouldWriteBody = false;
            private boolean _enabledBody = true;
            public TextureBody body() {
                if (_shouldWriteBody)
                    _writeBody();
                if (this.body != null)
                    return this.body;
                if (!_enabledBody)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(offset());
                this.body = new TextureBody(this._io, this, _root);
                this.body._read();
                this._io.seek(_pos);
                return this.body;
            }
            public void setBody(TextureBody _v) { _dirty = true; body = _v; }
            public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

            private void _writeBody() {
                _shouldWriteBody = false;
                long _pos = this._io.pos();
                this._io.seek(offset());
                this.body._write_Seq(this._io);
                this._io.seek(_pos);
            }
            private int offset;
            private DoomWad _root;
            private DoomWad.Texture12 _parent;
            public int offset() { return offset; }
            public void setOffset(int _v) { _dirty = true; offset = _v; }
            public DoomWad _root() { return _root; }
            public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
            public DoomWad.Texture12 _parent() { return _parent; }
            public void set_parent(DoomWad.Texture12 _v) { _dirty = true; _parent = _v; }
        }
        private int numTextures;
        private List<TextureIndex> textures;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;

        /**
         * Number of wall textures
         */
        public int numTextures() { return numTextures; }
        public void setNumTextures(int _v) { _dirty = true; numTextures = _v; }
        public List<TextureIndex> textures() { return textures; }
        public void setTextures(List<TextureIndex> _v) { _dirty = true; textures = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.IndexEntry _parent() { return _parent; }
        public void set_parent(DoomWad.IndexEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Thing extends KaitaiStruct.ReadWrite {
        public static Thing fromFile(String fileName) throws IOException {
            return new Thing(new ByteBufferKaitaiStream(fileName));
        }
        public Thing() {
            this(null, null, null);
        }

        public Thing(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Thing(KaitaiStream _io, DoomWad.Things _parent) {
            this(_io, _parent, null);
        }

        public Thing(KaitaiStream _io, DoomWad.Things _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.x = this._io.readS2le();
            this.y = this._io.readS2le();
            this.angle = this._io.readU2le();
            this.type = this._io.readU2le();
            this.flags = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.x);
            this._io.writeS2le(this.y);
            this._io.writeU2le(this.angle);
            this._io.writeU2le(this.type);
            this._io.writeU2le(this.flags);
        }

        public void _check() {
            _dirty = false;
        }
        private short x;
        private short y;
        private int angle;
        private int type;
        private int flags;
        private DoomWad _root;
        private DoomWad.Things _parent;
        public short x() { return x; }
        public void setX(short _v) { _dirty = true; x = _v; }
        public short y() { return y; }
        public void setY(short _v) { _dirty = true; y = _v; }
        public int angle() { return angle; }
        public void setAngle(int _v) { _dirty = true; angle = _v; }
        public int type() { return type; }
        public void setType(int _v) { _dirty = true; type = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.Things _parent() { return _parent; }
        public void set_parent(DoomWad.Things _v) { _dirty = true; _parent = _v; }
    }
    public static class Things extends KaitaiStruct.ReadWrite {
        public static Things fromFile(String fileName) throws IOException {
            return new Things(new ByteBufferKaitaiStream(fileName));
        }
        public Things() {
            this(null, null, null);
        }

        public Things(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Things(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Things(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Thing>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Thing _t_entries = new Thing(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Thing> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public List<Thing> entries() { return entries; }
        public void setEntries(List<Thing> _v) { _dirty = true; entries = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.IndexEntry _parent() { return _parent; }
        public void set_parent(DoomWad.IndexEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class Vertex extends KaitaiStruct.ReadWrite {
        public static Vertex fromFile(String fileName) throws IOException {
            return new Vertex(new ByteBufferKaitaiStream(fileName));
        }
        public Vertex() {
            this(null, null, null);
        }

        public Vertex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vertex(KaitaiStream _io, DoomWad.Vertexes _parent) {
            this(_io, _parent, null);
        }

        public Vertex(KaitaiStream _io, DoomWad.Vertexes _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.x = this._io.readS2le();
            this.y = this._io.readS2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.x);
            this._io.writeS2le(this.y);
        }

        public void _check() {
            _dirty = false;
        }
        private short x;
        private short y;
        private DoomWad _root;
        private DoomWad.Vertexes _parent;
        public short x() { return x; }
        public void setX(short _v) { _dirty = true; x = _v; }
        public short y() { return y; }
        public void setY(short _v) { _dirty = true; y = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.Vertexes _parent() { return _parent; }
        public void set_parent(DoomWad.Vertexes _v) { _dirty = true; _parent = _v; }
    }
    public static class Vertexes extends KaitaiStruct.ReadWrite {
        public static Vertexes fromFile(String fileName) throws IOException {
            return new Vertexes(new ByteBufferKaitaiStream(fileName));
        }
        public Vertexes() {
            this(null, null, null);
        }

        public Vertexes(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vertexes(KaitaiStream _io, DoomWad.IndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Vertexes(KaitaiStream _io, DoomWad.IndexEntry _parent, DoomWad _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Vertex>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Vertex _t_entries = new Vertex(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Vertex> entries;
        private DoomWad _root;
        private DoomWad.IndexEntry _parent;
        public List<Vertex> entries() { return entries; }
        public void setEntries(List<Vertex> _v) { _dirty = true; entries = _v; }
        public DoomWad _root() { return _root; }
        public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
        public DoomWad.IndexEntry _parent() { return _parent; }
        public void set_parent(DoomWad.IndexEntry _v) { _dirty = true; _parent = _v; }
    }
    private List<IndexEntry> index;
    private boolean _shouldWriteIndex = false;
    private boolean _enabledIndex = true;
    public List<IndexEntry> index() {
        if (_shouldWriteIndex)
            _writeIndex();
        if (this.index != null)
            return this.index;
        if (!_enabledIndex)
            return null;
        long _pos = this._io.pos();
        this._io.seek(indexOffset());
        this.index = new ArrayList<IndexEntry>();
        for (int i = 0; i < numIndexEntries(); i++) {
            IndexEntry _t_index = new IndexEntry(this._io, this, _root);
            try {
                _t_index._read();
            } finally {
                this.index.add(_t_index);
            }
        }
        this._io.seek(_pos);
        return this.index;
    }
    public void setIndex(List<IndexEntry> _v) { _dirty = true; index = _v; }
    public void setIndex_Enabled(boolean _v) { _dirty = true; _enabledIndex = _v; }

    private void _writeIndex() {
        _shouldWriteIndex = false;
        long _pos = this._io.pos();
        this._io.seek(indexOffset());
        for (int i = 0; i < this.index.size(); i++) {
            this.index.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private String magic;
    private int numIndexEntries;
    private int indexOffset;
    private DoomWad _root;
    private KaitaiStruct.ReadWrite _parent;
    public String magic() { return magic; }
    public void setMagic(String _v) { _dirty = true; magic = _v; }

    /**
     * Number of entries in the lump index
     */
    public int numIndexEntries() { return numIndexEntries; }
    public void setNumIndexEntries(int _v) { _dirty = true; numIndexEntries = _v; }

    /**
     * Offset to the start of the index
     */
    public int indexOffset() { return indexOffset; }
    public void setIndexOffset(int _v) { _dirty = true; indexOffset = _v; }
    public DoomWad _root() { return _root; }
    public void set_root(DoomWad _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
