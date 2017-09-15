// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class SaintsRow2VppPc extends KaitaiStruct {
    public static SaintsRow2VppPc fromFile(String fileName) throws IOException {
        return new SaintsRow2VppPc(new ByteBufferKaitaiStream(fileName));
    }

    public SaintsRow2VppPc(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SaintsRow2VppPc(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SaintsRow2VppPc(KaitaiStream _io, KaitaiStruct _parent, SaintsRow2VppPc _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.ensureFixedContents(new byte[] { -50, 10, -119, 81, 4 });
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
    }
    public static class Offsets extends KaitaiStruct {
        public static Offsets fromFile(String fileName) throws IOException {
            return new Offsets(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Offset>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Offset(this._io, this, _root));
                    i++;
                }
            }
        }
        public static class Offset extends KaitaiStruct {
            public static Offset fromFile(String fileName) throws IOException {
                return new Offset(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.nameOfs = this._io.readU4le();
                this.extOfs = this._io.readU4le();
                this.smth2 = this._io.readS4le();
                this.ofsBody = this._io.readS4le();
                this.lenBody = this._io.readS4le();
                this.alwaysMinus1 = this._io.readS4le();
                this.alwaysZero = this._io.readS4le();
            }
            private String filename;
            public String filename() {
                if (this.filename != null)
                    return this.filename;
                KaitaiStream io = _root.filenames()._io();
                long _pos = io.pos();
                io.seek(nameOfs());
                this.filename = new String(io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8"));
                io.seek(_pos);
                return this.filename;
            }
            private String ext;
            public String ext() {
                if (this.ext != null)
                    return this.ext;
                KaitaiStream io = _root.extensions()._io();
                long _pos = io.pos();
                io.seek(extOfs());
                this.ext = new String(io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8"));
                io.seek(_pos);
                return this.ext;
            }
            private byte[] body;
            public byte[] body() {
                if (this.body != null)
                    return this.body;
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek((_root.dataStart() + ofsBody()));
                this.body = io.readBytes(lenBody());
                io.seek(_pos);
                return this.body;
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
            public long extOfs() { return extOfs; }
            public int smth2() { return smth2; }
            public int ofsBody() { return ofsBody; }
            public int lenBody() { return lenBody; }
            public int alwaysMinus1() { return alwaysMinus1; }
            public int alwaysZero() { return alwaysZero; }
            public SaintsRow2VppPc _root() { return _root; }
            public SaintsRow2VppPc.Offsets _parent() { return _parent; }
        }
        private ArrayList<Offset> entries;
        private SaintsRow2VppPc _root;
        private SaintsRow2VppPc _parent;
        public ArrayList<Offset> entries() { return entries; }
        public SaintsRow2VppPc _root() { return _root; }
        public SaintsRow2VppPc _parent() { return _parent; }
    }
    public static class Strings extends KaitaiStruct {
        public static Strings fromFile(String fileName) throws IOException {
            return new Strings(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<String>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8")));
                    i++;
                }
            }
        }
        private ArrayList<String> entries;
        private SaintsRow2VppPc _root;
        private SaintsRow2VppPc _parent;
        public ArrayList<String> entries() { return entries; }
        public SaintsRow2VppPc _root() { return _root; }
        public SaintsRow2VppPc _parent() { return _parent; }
    }
    private Strings filenames;
    public Strings filenames() {
        if (this.filenames != null)
            return this.filenames;
        long _pos = this._io.pos();
        this._io.seek(ofsFilenames());
        this._raw_filenames = this._io.readBytes(lenFilenames());
        KaitaiStream _io__raw_filenames = new ByteBufferKaitaiStream(_raw_filenames);
        this.filenames = new Strings(_io__raw_filenames, this, _root);
        this._io.seek(_pos);
        return this.filenames;
    }
    private Integer ofsExtensions;
    public Integer ofsExtensions() {
        if (this.ofsExtensions != null)
            return this.ofsExtensions;
        int _tmp = (int) ((((ofsFilenames() + lenFilenames()) & 4294965248L) + 2048));
        this.ofsExtensions = _tmp;
        return this.ofsExtensions;
    }
    private Offsets files;
    public Offsets files() {
        if (this.files != null)
            return this.files;
        long _pos = this._io.pos();
        this._io.seek(2048);
        this._raw_files = this._io.readBytes(lenOffsets());
        KaitaiStream _io__raw_files = new ByteBufferKaitaiStream(_raw_files);
        this.files = new Offsets(_io__raw_files, this, _root);
        this._io.seek(_pos);
        return this.files;
    }
    private Integer dataStart;
    public Integer dataStart() {
        if (this.dataStart != null)
            return this.dataStart;
        int _tmp = (int) ((((ofsExtensions() + lenExtensions()) & 4294965248L) + 2048));
        this.dataStart = _tmp;
        return this.dataStart;
    }
    private Strings extensions;
    public Strings extensions() {
        if (this.extensions != null)
            return this.extensions;
        long _pos = this._io.pos();
        this._io.seek(ofsExtensions());
        this._raw_extensions = this._io.readBytes(lenExtensions());
        KaitaiStream _io__raw_extensions = new ByteBufferKaitaiStream(_raw_extensions);
        this.extensions = new Strings(_io__raw_extensions, this, _root);
        this._io.seek(_pos);
        return this.extensions;
    }
    private Integer ofsFilenames;
    public Integer ofsFilenames() {
        if (this.ofsFilenames != null)
            return this.ofsFilenames;
        int _tmp = (int) ((((2048 + lenOffsets()) & 4294965248L) + 2048));
        this.ofsFilenames = _tmp;
        return this.ofsFilenames;
    }
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
    private KaitaiStruct _parent;
    private byte[] _raw_filenames;
    private byte[] _raw_files;
    private byte[] _raw_extensions;
    public byte[] magic() { return magic; }
    public byte[] pad1() { return pad1; }
    public int numFiles() { return numFiles; }
    public int containerSize() { return containerSize; }
    public int lenOffsets() { return lenOffsets; }
    public int lenFilenames() { return lenFilenames; }
    public int lenExtensions() { return lenExtensions; }
    public int smth5() { return smth5; }
    public int smth6() { return smth6; }
    public int smth7() { return smth7; }
    public int smth8() { return smth8; }
    public int smth9() { return smth9; }
    public SaintsRow2VppPc _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_filenames() { return _raw_filenames; }
    public byte[] _raw_files() { return _raw_files; }
    public byte[] _raw_extensions() { return _raw_extensions; }
}
