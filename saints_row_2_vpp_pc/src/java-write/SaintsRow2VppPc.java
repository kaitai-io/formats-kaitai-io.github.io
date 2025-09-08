// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class SaintsRow2VppPc extends KaitaiStruct.ReadWrite {
    public static SaintsRow2VppPc fromFile(String fileName) throws IOException {
        return new SaintsRow2VppPc(new ByteBufferKaitaiStream(fileName));
    }
    public SaintsRow2VppPc() {
        this(null, null, null);
    }

    public SaintsRow2VppPc(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SaintsRow2VppPc(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SaintsRow2VppPc(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SaintsRow2VppPc _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(5);
        if (!(Arrays.equals(this.magic, new byte[] { -50, 10, -119, 81, 4 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -50, 10, -119, 81, 4 }, this.magic, this._io, "/seq/0");
        }
        this.pad1 = this._io.readBytes(335);
        this.numFiles = this._io.readS4le();
        this.containerSize = this._io.readS4le();
        this.lenOffsets = this._io.readS4le();
        this.lenFilenames = this._io.readS4le();
        this.lenExtensions = this._io.readS4le();
        this.smth5 = this._io.readS4le();
        this.smth6 = this._io.readS4le();
        this.smth7 = this._io.readS4le();
        this.smth8 = this._io.readS4le();
        this.smth9 = this._io.readS4le();
        _dirty = false;
    }

    public void _fetchInstances() {
        extensions();
        if (this.extensions != null) {
            this.extensions._fetchInstances();
        }
        filenames();
        if (this.filenames != null) {
            this.filenames._fetchInstances();
        }
        files();
        if (this.files != null) {
            this.files._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteExtensions = _enabledExtensions;
        _shouldWriteFilenames = _enabledFilenames;
        _shouldWriteFiles = _enabledFiles;
        this._io.writeBytes(this.magic);
        this._io.writeBytes(this.pad1);
        this._io.writeS4le(this.numFiles);
        this._io.writeS4le(this.containerSize);
        this._io.writeS4le(this.lenOffsets);
        this._io.writeS4le(this.lenFilenames);
        this._io.writeS4le(this.lenExtensions);
        this._io.writeS4le(this.smth5);
        this._io.writeS4le(this.smth6);
        this._io.writeS4le(this.smth7);
        this._io.writeS4le(this.smth8);
        this._io.writeS4le(this.smth9);
    }

    public void _check() {
        if (this.magic.length != 5)
            throw new ConsistencyError("magic", 5, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { -50, 10, -119, 81, 4 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -50, 10, -119, 81, 4 }, this.magic, null, "/seq/0");
        }
        if (this.pad1.length != 335)
            throw new ConsistencyError("pad1", 335, this.pad1.length);
        if (_enabledExtensions) {
            if (!Objects.equals(this.extensions._root(), _root()))
                throw new ConsistencyError("extensions", _root(), this.extensions._root());
            if (!Objects.equals(this.extensions._parent(), this))
                throw new ConsistencyError("extensions", this, this.extensions._parent());
        }
        if (_enabledFilenames) {
            if (!Objects.equals(this.filenames._root(), _root()))
                throw new ConsistencyError("filenames", _root(), this.filenames._root());
            if (!Objects.equals(this.filenames._parent(), this))
                throw new ConsistencyError("filenames", this, this.filenames._parent());
        }
        if (_enabledFiles) {
            if (!Objects.equals(this.files._root(), _root()))
                throw new ConsistencyError("files", _root(), this.files._root());
            if (!Objects.equals(this.files._parent(), this))
                throw new ConsistencyError("files", this, this.files._parent());
        }
        _dirty = false;
    }
    public static class Offsets extends KaitaiStruct.ReadWrite {
        public static Offsets fromFile(String fileName) throws IOException {
            return new Offsets(new ByteBufferKaitaiStream(fileName));
        }
        public Offsets() {
            this(null, null, null);
        }

        public Offsets(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Offsets(KaitaiStream _io, SaintsRow2VppPc _parent) {
            this(_io, _parent, null);
        }

        public Offsets(KaitaiStream _io, SaintsRow2VppPc _parent, SaintsRow2VppPc _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Offset>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Offset _t_entries = new Offset(this._io, this, _root);
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
        public static class Offset extends KaitaiStruct.ReadWrite {
            public static Offset fromFile(String fileName) throws IOException {
                return new Offset(new ByteBufferKaitaiStream(fileName));
            }
            public Offset() {
                this(null, null, null);
            }

            public Offset(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Offset(KaitaiStream _io, SaintsRow2VppPc.Offsets _parent) {
                this(_io, _parent, null);
            }

            public Offset(KaitaiStream _io, SaintsRow2VppPc.Offsets _parent, SaintsRow2VppPc _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.nameOfs = this._io.readU4le();
                this.extOfs = this._io.readU4le();
                this.smth2 = this._io.readS4le();
                this.ofsBody = this._io.readS4le();
                this.lenBody = this._io.readS4le();
                this.alwaysMinus1 = this._io.readS4le();
                this.alwaysZero = this._io.readS4le();
                _dirty = false;
            }

            public void _fetchInstances() {
                body();
                if (this.body != null) {
                }
                ext();
                if (this.ext != null) {
                }
                filename();
                if (this.filename != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteBody = _enabledBody;
                _shouldWriteExt = _enabledExt;
                _shouldWriteFilename = _enabledFilename;
                this._io.writeU4le(this.nameOfs);
                this._io.writeU4le(this.extOfs);
                this._io.writeS4le(this.smth2);
                this._io.writeS4le(this.ofsBody);
                this._io.writeS4le(this.lenBody);
                this._io.writeS4le(this.alwaysMinus1);
                this._io.writeS4le(this.alwaysZero);
            }

            public void _check() {
                if (_enabledBody) {
                    if (this.body.length != lenBody())
                        throw new ConsistencyError("body", lenBody(), this.body.length);
                }
                if (_enabledExt) {
                    if (KaitaiStream.byteArrayIndexOf((this.ext).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                        throw new ConsistencyError("ext", -1, KaitaiStream.byteArrayIndexOf((this.ext).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                }
                if (_enabledFilename) {
                    if (KaitaiStream.byteArrayIndexOf((this.filename).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                        throw new ConsistencyError("filename", -1, KaitaiStream.byteArrayIndexOf((this.filename).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                }
                _dirty = false;
            }
            private byte[] body;
            private boolean _shouldWriteBody = false;
            private boolean _enabledBody = true;
            public byte[] body() {
                if (_shouldWriteBody)
                    _writeBody();
                if (this.body != null)
                    return this.body;
                if (!_enabledBody)
                    return null;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(_root().dataStart() + ofsBody());
                this.body = io.readBytes(lenBody());
                io.seek(_pos);
                return this.body;
            }
            public void setBody(byte[] _v) { _dirty = true; body = _v; }
            public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

            private void _writeBody() {
                _shouldWriteBody = false;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(_root().dataStart() + ofsBody());
                io.writeBytes(this.body);
                io.seek(_pos);
            }
            private String ext;
            private boolean _shouldWriteExt = false;
            private boolean _enabledExt = true;
            public String ext() {
                if (_shouldWriteExt)
                    _writeExt();
                if (this.ext != null)
                    return this.ext;
                if (!_enabledExt)
                    return null;
                KaitaiStream io = _root().extensions()._io();
                long _pos = io.pos();
                io.seek(extOfs());
                this.ext = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                io.seek(_pos);
                return this.ext;
            }
            public void setExt(String _v) { _dirty = true; ext = _v; }
            public void setExt_Enabled(boolean _v) { _dirty = true; _enabledExt = _v; }

            private void _writeExt() {
                _shouldWriteExt = false;
                KaitaiStream io = _root().extensions()._io();
                long _pos = io.pos();
                io.seek(extOfs());
                io.writeBytes((this.ext).getBytes(Charset.forName("UTF-8")));
                io.writeU1(0);
                io.seek(_pos);
            }
            private String filename;
            private boolean _shouldWriteFilename = false;
            private boolean _enabledFilename = true;
            public String filename() {
                if (_shouldWriteFilename)
                    _writeFilename();
                if (this.filename != null)
                    return this.filename;
                if (!_enabledFilename)
                    return null;
                KaitaiStream io = _root().filenames()._io();
                long _pos = io.pos();
                io.seek(nameOfs());
                this.filename = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                io.seek(_pos);
                return this.filename;
            }
            public void setFilename(String _v) { _dirty = true; filename = _v; }
            public void setFilename_Enabled(boolean _v) { _dirty = true; _enabledFilename = _v; }

            private void _writeFilename() {
                _shouldWriteFilename = false;
                KaitaiStream io = _root().filenames()._io();
                long _pos = io.pos();
                io.seek(nameOfs());
                io.writeBytes((this.filename).getBytes(Charset.forName("UTF-8")));
                io.writeU1(0);
                io.seek(_pos);
            }
            private long nameOfs;
            private long extOfs;
            private int smth2;
            private int ofsBody;
            private int lenBody;
            private int alwaysMinus1;
            private int alwaysZero;
            private SaintsRow2VppPc _root;
            private SaintsRow2VppPc.Offsets _parent;
            public long nameOfs() { return nameOfs; }
            public void setNameOfs(long _v) { _dirty = true; nameOfs = _v; }
            public long extOfs() { return extOfs; }
            public void setExtOfs(long _v) { _dirty = true; extOfs = _v; }
            public int smth2() { return smth2; }
            public void setSmth2(int _v) { _dirty = true; smth2 = _v; }
            public int ofsBody() { return ofsBody; }
            public void setOfsBody(int _v) { _dirty = true; ofsBody = _v; }
            public int lenBody() { return lenBody; }
            public void setLenBody(int _v) { _dirty = true; lenBody = _v; }
            public int alwaysMinus1() { return alwaysMinus1; }
            public void setAlwaysMinus1(int _v) { _dirty = true; alwaysMinus1 = _v; }
            public int alwaysZero() { return alwaysZero; }
            public void setAlwaysZero(int _v) { _dirty = true; alwaysZero = _v; }
            public SaintsRow2VppPc _root() { return _root; }
            public void set_root(SaintsRow2VppPc _v) { _dirty = true; _root = _v; }
            public SaintsRow2VppPc.Offsets _parent() { return _parent; }
            public void set_parent(SaintsRow2VppPc.Offsets _v) { _dirty = true; _parent = _v; }
        }
        private List<Offset> entries;
        private SaintsRow2VppPc _root;
        private SaintsRow2VppPc _parent;
        public List<Offset> entries() { return entries; }
        public void setEntries(List<Offset> _v) { _dirty = true; entries = _v; }
        public SaintsRow2VppPc _root() { return _root; }
        public void set_root(SaintsRow2VppPc _v) { _dirty = true; _root = _v; }
        public SaintsRow2VppPc _parent() { return _parent; }
        public void set_parent(SaintsRow2VppPc _v) { _dirty = true; _parent = _v; }
    }
    public static class Strings extends KaitaiStruct.ReadWrite {
        public static Strings fromFile(String fileName) throws IOException {
            return new Strings(new ByteBufferKaitaiStream(fileName));
        }
        public Strings() {
            this(null, null, null);
        }

        public Strings(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Strings(KaitaiStream _io, SaintsRow2VppPc _parent) {
            this(_io, _parent, null);
        }

        public Strings(KaitaiStream _io, SaintsRow2VppPc _parent, SaintsRow2VppPc _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<String>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this._io.writeBytes((this.entries.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(0);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.entries.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("entries", -1, KaitaiStream.byteArrayIndexOf((this.entries.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            }
            _dirty = false;
        }
        private List<String> entries;
        private SaintsRow2VppPc _root;
        private SaintsRow2VppPc _parent;
        public List<String> entries() { return entries; }
        public void setEntries(List<String> _v) { _dirty = true; entries = _v; }
        public SaintsRow2VppPc _root() { return _root; }
        public void set_root(SaintsRow2VppPc _v) { _dirty = true; _root = _v; }
        public SaintsRow2VppPc _parent() { return _parent; }
        public void set_parent(SaintsRow2VppPc _v) { _dirty = true; _parent = _v; }
    }
    private Integer dataStart;
    public Integer dataStart() {
        if (this.dataStart != null)
            return this.dataStart;
        this.dataStart = ((Number) ((ofsExtensions() + lenExtensions() & 4294965248L) + 2048)).intValue();
        return this.dataStart;
    }
    public void _invalidateDataStart() { this.dataStart = null; }
    private Strings extensions;
    private boolean _shouldWriteExtensions = false;
    private boolean _enabledExtensions = true;
    public Strings extensions() {
        if (_shouldWriteExtensions)
            _writeExtensions();
        if (this.extensions != null)
            return this.extensions;
        if (!_enabledExtensions)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsExtensions());
        this._raw_extensions = this._io.readBytes(lenExtensions());
        KaitaiStream _io__raw_extensions = new ByteBufferKaitaiStream(this._raw_extensions);
        this.extensions = new Strings(_io__raw_extensions, this, _root);
        this.extensions._read();
        this._io.seek(_pos);
        return this.extensions;
    }
    public void setExtensions(Strings _v) { _dirty = true; extensions = _v; }
    public void setExtensions_Enabled(boolean _v) { _dirty = true; _enabledExtensions = _v; }

    private void _writeExtensions() {
        _shouldWriteExtensions = false;
        long _pos = this._io.pos();
        this._io.seek(ofsExtensions());
        final KaitaiStream _io__raw_extensions = new ByteBufferKaitaiStream(lenExtensions());
        this._io.addChildStream(_io__raw_extensions);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenExtensions()));
            final SaintsRow2VppPc _this = this;
            _io__raw_extensions.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_extensions = _io__raw_extensions.toByteArray();
                    if (_this._raw_extensions.length != lenExtensions())
                        throw new ConsistencyError("raw(extensions)", lenExtensions(), _this._raw_extensions.length);
                    parent.writeBytes(_this._raw_extensions);
                }
            });
        }
        this.extensions._write_Seq(_io__raw_extensions);
        this._io.seek(_pos);
    }
    private Strings filenames;
    private boolean _shouldWriteFilenames = false;
    private boolean _enabledFilenames = true;
    public Strings filenames() {
        if (_shouldWriteFilenames)
            _writeFilenames();
        if (this.filenames != null)
            return this.filenames;
        if (!_enabledFilenames)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsFilenames());
        this._raw_filenames = this._io.readBytes(lenFilenames());
        KaitaiStream _io__raw_filenames = new ByteBufferKaitaiStream(this._raw_filenames);
        this.filenames = new Strings(_io__raw_filenames, this, _root);
        this.filenames._read();
        this._io.seek(_pos);
        return this.filenames;
    }
    public void setFilenames(Strings _v) { _dirty = true; filenames = _v; }
    public void setFilenames_Enabled(boolean _v) { _dirty = true; _enabledFilenames = _v; }

    private void _writeFilenames() {
        _shouldWriteFilenames = false;
        long _pos = this._io.pos();
        this._io.seek(ofsFilenames());
        final KaitaiStream _io__raw_filenames = new ByteBufferKaitaiStream(lenFilenames());
        this._io.addChildStream(_io__raw_filenames);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenFilenames()));
            final SaintsRow2VppPc _this = this;
            _io__raw_filenames.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_filenames = _io__raw_filenames.toByteArray();
                    if (_this._raw_filenames.length != lenFilenames())
                        throw new ConsistencyError("raw(filenames)", lenFilenames(), _this._raw_filenames.length);
                    parent.writeBytes(_this._raw_filenames);
                }
            });
        }
        this.filenames._write_Seq(_io__raw_filenames);
        this._io.seek(_pos);
    }
    private Offsets files;
    private boolean _shouldWriteFiles = false;
    private boolean _enabledFiles = true;
    public Offsets files() {
        if (_shouldWriteFiles)
            _writeFiles();
        if (this.files != null)
            return this.files;
        if (!_enabledFiles)
            return null;
        long _pos = this._io.pos();
        this._io.seek(2048);
        this._raw_files = this._io.readBytes(lenOffsets());
        KaitaiStream _io__raw_files = new ByteBufferKaitaiStream(this._raw_files);
        this.files = new Offsets(_io__raw_files, this, _root);
        this.files._read();
        this._io.seek(_pos);
        return this.files;
    }
    public void setFiles(Offsets _v) { _dirty = true; files = _v; }
    public void setFiles_Enabled(boolean _v) { _dirty = true; _enabledFiles = _v; }

    private void _writeFiles() {
        _shouldWriteFiles = false;
        long _pos = this._io.pos();
        this._io.seek(2048);
        final KaitaiStream _io__raw_files = new ByteBufferKaitaiStream(lenOffsets());
        this._io.addChildStream(_io__raw_files);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenOffsets()));
            final SaintsRow2VppPc _this = this;
            _io__raw_files.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_files = _io__raw_files.toByteArray();
                    if (_this._raw_files.length != lenOffsets())
                        throw new ConsistencyError("raw(files)", lenOffsets(), _this._raw_files.length);
                    parent.writeBytes(_this._raw_files);
                }
            });
        }
        this.files._write_Seq(_io__raw_files);
        this._io.seek(_pos);
    }
    private Integer ofsExtensions;
    public Integer ofsExtensions() {
        if (this.ofsExtensions != null)
            return this.ofsExtensions;
        this.ofsExtensions = ((Number) ((ofsFilenames() + lenFilenames() & 4294965248L) + 2048)).intValue();
        return this.ofsExtensions;
    }
    public void _invalidateOfsExtensions() { this.ofsExtensions = null; }
    private Integer ofsFilenames;
    public Integer ofsFilenames() {
        if (this.ofsFilenames != null)
            return this.ofsFilenames;
        this.ofsFilenames = ((Number) ((2048 + lenOffsets() & 4294965248L) + 2048)).intValue();
        return this.ofsFilenames;
    }
    public void _invalidateOfsFilenames() { this.ofsFilenames = null; }
    private byte[] magic;
    private byte[] pad1;
    private int numFiles;
    private int containerSize;
    private int lenOffsets;
    private int lenFilenames;
    private int lenExtensions;
    private int smth5;
    private int smth6;
    private int smth7;
    private int smth8;
    private int smth9;
    private SaintsRow2VppPc _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_extensions;
    private byte[] _raw_filenames;
    private byte[] _raw_files;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public byte[] pad1() { return pad1; }
    public void setPad1(byte[] _v) { _dirty = true; pad1 = _v; }
    public int numFiles() { return numFiles; }
    public void setNumFiles(int _v) { _dirty = true; numFiles = _v; }
    public int containerSize() { return containerSize; }
    public void setContainerSize(int _v) { _dirty = true; containerSize = _v; }
    public int lenOffsets() { return lenOffsets; }
    public void setLenOffsets(int _v) { _dirty = true; lenOffsets = _v; }
    public int lenFilenames() { return lenFilenames; }
    public void setLenFilenames(int _v) { _dirty = true; lenFilenames = _v; }
    public int lenExtensions() { return lenExtensions; }
    public void setLenExtensions(int _v) { _dirty = true; lenExtensions = _v; }
    public int smth5() { return smth5; }
    public void setSmth5(int _v) { _dirty = true; smth5 = _v; }
    public int smth6() { return smth6; }
    public void setSmth6(int _v) { _dirty = true; smth6 = _v; }
    public int smth7() { return smth7; }
    public void setSmth7(int _v) { _dirty = true; smth7 = _v; }
    public int smth8() { return smth8; }
    public void setSmth8(int _v) { _dirty = true; smth8 = _v; }
    public int smth9() { return smth9; }
    public void setSmth9(int _v) { _dirty = true; smth9 = _v; }
    public SaintsRow2VppPc _root() { return _root; }
    public void set_root(SaintsRow2VppPc _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_extensions() { return _raw_extensions; }
    public void set_raw_Extensions(byte[] _v) { _dirty = true; _raw_extensions = _v; }
    public byte[] _raw_filenames() { return _raw_filenames; }
    public void set_raw_Filenames(byte[] _v) { _dirty = true; _raw_filenames = _v; }
    public byte[] _raw_files() { return _raw_files; }
    public void set_raw_Files(byte[] _v) { _dirty = true; _raw_files = _v; }
}
