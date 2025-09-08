// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * It is a color scheme for visualising SPM scans.
 */
public class NtMdtPal extends KaitaiStruct.ReadWrite {
    public static NtMdtPal fromFile(String fileName) throws IOException {
        return new NtMdtPal(new ByteBufferKaitaiStream(fileName));
    }
    public NtMdtPal() {
        this(null, null, null);
    }

    public NtMdtPal(KaitaiStream _io) {
        this(_io, null, null);
    }

    public NtMdtPal(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public NtMdtPal(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, NtMdtPal _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.signature = this._io.readBytes(26);
        if (!(Arrays.equals(this.signature, new byte[] { 78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33 }, this.signature, this._io, "/seq/0");
        }
        this.count = this._io.readU4be();
        this.meta = new ArrayList<Meta>();
        for (int i = 0; i < count(); i++) {
            Meta _t_meta = new Meta(this._io, this, _root);
            try {
                _t_meta._read();
            } finally {
                this.meta.add(_t_meta);
            }
        }
        this.something2 = this._io.readBytes(1);
        this.tables = new ArrayList<ColTable>();
        for (int i = 0; i < count(); i++) {
            ColTable _t_tables = new ColTable(this._io, this, _root, i);
            try {
                _t_tables._read();
            } finally {
                this.tables.add(_t_tables);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.meta.size(); i++) {
            this.meta.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.tables.size(); i++) {
            this.tables.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.signature);
        this._io.writeU4be(this.count);
        for (int i = 0; i < this.meta.size(); i++) {
            this.meta.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeBytes(this.something2);
        for (int i = 0; i < this.tables.size(); i++) {
            this.tables.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.signature.length != 26)
            throw new ConsistencyError("signature", 26, this.signature.length);
        if (!(Arrays.equals(this.signature, new byte[] { 78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33 }, this.signature, null, "/seq/0");
        }
        if (this.meta.size() != count())
            throw new ConsistencyError("meta", count(), this.meta.size());
        for (int i = 0; i < this.meta.size(); i++) {
            if (!Objects.equals(this.meta.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("meta", _root(), this.meta.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.meta.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("meta", this, this.meta.get(((Number) (i)).intValue())._parent());
        }
        if (this.something2.length != 1)
            throw new ConsistencyError("something2", 1, this.something2.length);
        if (this.tables.size() != count())
            throw new ConsistencyError("tables", count(), this.tables.size());
        for (int i = 0; i < this.tables.size(); i++) {
            if (!Objects.equals(this.tables.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("tables", _root(), this.tables.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.tables.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("tables", this, this.tables.get(((Number) (i)).intValue())._parent());
            if (this.tables.get(((Number) (i)).intValue()).index() != i)
                throw new ConsistencyError("tables", i, this.tables.get(((Number) (i)).intValue()).index());
        }
        _dirty = false;
    }
    public static class ColTable extends KaitaiStruct.ReadWrite {
        public ColTable(int index) {
            this(null, null, null, index);
        }

        public ColTable(KaitaiStream _io, int index) {
            this(_io, null, null, index);
        }

        public ColTable(KaitaiStream _io, NtMdtPal _parent, int index) {
            this(_io, _parent, null, index);
        }

        public ColTable(KaitaiStream _io, NtMdtPal _parent, NtMdtPal _root, int index) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.index = index;
        }
        public void _read() {
            this.size1 = this._io.readU1();
            this.unkn = this._io.readU1();
            this.title = new String(this._io.readBytes(_root().meta().get(((Number) (index())).intValue()).nameSize()), StandardCharsets.UTF_16LE);
            this.unkn1 = this._io.readU2be();
            this.colors = new ArrayList<Color>();
            for (int i = 0; i < _root().meta().get(((Number) (index())).intValue()).colorsCount() - 1; i++) {
                Color _t_colors = new Color(this._io, this, _root);
                try {
                    _t_colors._read();
                } finally {
                    this.colors.add(_t_colors);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.colors.size(); i++) {
                this.colors.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.size1);
            this._io.writeU1(this.unkn);
            this._io.writeBytes((this.title).getBytes(Charset.forName("UTF-16LE")));
            this._io.writeU2be(this.unkn1);
            for (int i = 0; i < this.colors.size(); i++) {
                this.colors.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if ((this.title).getBytes(Charset.forName("UTF-16LE")).length != _root().meta().get(((Number) (index())).intValue()).nameSize())
                throw new ConsistencyError("title", _root().meta().get(((Number) (index())).intValue()).nameSize(), (this.title).getBytes(Charset.forName("UTF-16LE")).length);
            if (this.colors.size() != _root().meta().get(((Number) (index())).intValue()).colorsCount() - 1)
                throw new ConsistencyError("colors", _root().meta().get(((Number) (index())).intValue()).colorsCount() - 1, this.colors.size());
            for (int i = 0; i < this.colors.size(); i++) {
                if (!Objects.equals(this.colors.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("colors", _root(), this.colors.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.colors.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("colors", this, this.colors.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private int size1;
        private int unkn;
        private String title;
        private int unkn1;
        private List<Color> colors;
        private int index;
        private NtMdtPal _root;
        private NtMdtPal _parent;
        public int size1() { return size1; }
        public void setSize1(int _v) { _dirty = true; size1 = _v; }
        public int unkn() { return unkn; }
        public void setUnkn(int _v) { _dirty = true; unkn = _v; }
        public String title() { return title; }
        public void setTitle(String _v) { _dirty = true; title = _v; }
        public int unkn1() { return unkn1; }
        public void setUnkn1(int _v) { _dirty = true; unkn1 = _v; }
        public List<Color> colors() { return colors; }
        public void setColors(List<Color> _v) { _dirty = true; colors = _v; }
        public int index() { return index; }
        public void setIndex(int _v) { _dirty = true; index = _v; }
        public NtMdtPal _root() { return _root; }
        public void set_root(NtMdtPal _v) { _dirty = true; _root = _v; }
        public NtMdtPal _parent() { return _parent; }
        public void set_parent(NtMdtPal _v) { _dirty = true; _parent = _v; }
    }
    public static class Color extends KaitaiStruct.ReadWrite {
        public static Color fromFile(String fileName) throws IOException {
            return new Color(new ByteBufferKaitaiStream(fileName));
        }
        public Color() {
            this(null, null, null);
        }

        public Color(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Color(KaitaiStream _io, NtMdtPal.ColTable _parent) {
            this(_io, _parent, null);
        }

        public Color(KaitaiStream _io, NtMdtPal.ColTable _parent, NtMdtPal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.red = this._io.readU1();
            this.unkn = this._io.readU1();
            this.blue = this._io.readU1();
            this.green = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.red);
            this._io.writeU1(this.unkn);
            this._io.writeU1(this.blue);
            this._io.writeU1(this.green);
        }

        public void _check() {
            _dirty = false;
        }
        private int red;
        private int unkn;
        private int blue;
        private int green;
        private NtMdtPal _root;
        private NtMdtPal.ColTable _parent;
        public int red() { return red; }
        public void setRed(int _v) { _dirty = true; red = _v; }
        public int unkn() { return unkn; }
        public void setUnkn(int _v) { _dirty = true; unkn = _v; }
        public int blue() { return blue; }
        public void setBlue(int _v) { _dirty = true; blue = _v; }
        public int green() { return green; }
        public void setGreen(int _v) { _dirty = true; green = _v; }
        public NtMdtPal _root() { return _root; }
        public void set_root(NtMdtPal _v) { _dirty = true; _root = _v; }
        public NtMdtPal.ColTable _parent() { return _parent; }
        public void set_parent(NtMdtPal.ColTable _v) { _dirty = true; _parent = _v; }
    }
    public static class Meta extends KaitaiStruct.ReadWrite {
        public static Meta fromFile(String fileName) throws IOException {
            return new Meta(new ByteBufferKaitaiStream(fileName));
        }
        public Meta() {
            this(null, null, null);
        }

        public Meta(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Meta(KaitaiStream _io, NtMdtPal _parent) {
            this(_io, _parent, null);
        }

        public Meta(KaitaiStream _io, NtMdtPal _parent, NtMdtPal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.unkn00 = this._io.readBytes(3);
            this.unkn01 = this._io.readBytes(2);
            this.unkn02 = this._io.readBytes(1);
            this.unkn03 = this._io.readBytes(1);
            this.colorsCount = this._io.readU2le();
            this.unkn10 = this._io.readBytes(2);
            this.unkn11 = this._io.readBytes(1);
            this.unkn12 = this._io.readBytes(2);
            this.nameSize = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.unkn00);
            this._io.writeBytes(this.unkn01);
            this._io.writeBytes(this.unkn02);
            this._io.writeBytes(this.unkn03);
            this._io.writeU2le(this.colorsCount);
            this._io.writeBytes(this.unkn10);
            this._io.writeBytes(this.unkn11);
            this._io.writeBytes(this.unkn12);
            this._io.writeU2be(this.nameSize);
        }

        public void _check() {
            if (this.unkn00.length != 3)
                throw new ConsistencyError("unkn00", 3, this.unkn00.length);
            if (this.unkn01.length != 2)
                throw new ConsistencyError("unkn01", 2, this.unkn01.length);
            if (this.unkn02.length != 1)
                throw new ConsistencyError("unkn02", 1, this.unkn02.length);
            if (this.unkn03.length != 1)
                throw new ConsistencyError("unkn03", 1, this.unkn03.length);
            if (this.unkn10.length != 2)
                throw new ConsistencyError("unkn10", 2, this.unkn10.length);
            if (this.unkn11.length != 1)
                throw new ConsistencyError("unkn11", 1, this.unkn11.length);
            if (this.unkn12.length != 2)
                throw new ConsistencyError("unkn12", 2, this.unkn12.length);
            _dirty = false;
        }
        private byte[] unkn00;
        private byte[] unkn01;
        private byte[] unkn02;
        private byte[] unkn03;
        private int colorsCount;
        private byte[] unkn10;
        private byte[] unkn11;
        private byte[] unkn12;
        private int nameSize;
        private NtMdtPal _root;
        private NtMdtPal _parent;

        /**
         * usually 0s
         */
        public byte[] unkn00() { return unkn00; }
        public void setUnkn00(byte[] _v) { _dirty = true; unkn00 = _v; }
        public byte[] unkn01() { return unkn01; }
        public void setUnkn01(byte[] _v) { _dirty = true; unkn01 = _v; }
        public byte[] unkn02() { return unkn02; }
        public void setUnkn02(byte[] _v) { _dirty = true; unkn02 = _v; }

        /**
         * usually 0s
         */
        public byte[] unkn03() { return unkn03; }
        public void setUnkn03(byte[] _v) { _dirty = true; unkn03 = _v; }
        public int colorsCount() { return colorsCount; }
        public void setColorsCount(int _v) { _dirty = true; colorsCount = _v; }

        /**
         * usually 0s
         */
        public byte[] unkn10() { return unkn10; }
        public void setUnkn10(byte[] _v) { _dirty = true; unkn10 = _v; }

        /**
         * usually 4
         */
        public byte[] unkn11() { return unkn11; }
        public void setUnkn11(byte[] _v) { _dirty = true; unkn11 = _v; }

        /**
         * usually 0s
         */
        public byte[] unkn12() { return unkn12; }
        public void setUnkn12(byte[] _v) { _dirty = true; unkn12 = _v; }
        public int nameSize() { return nameSize; }
        public void setNameSize(int _v) { _dirty = true; nameSize = _v; }
        public NtMdtPal _root() { return _root; }
        public void set_root(NtMdtPal _v) { _dirty = true; _root = _v; }
        public NtMdtPal _parent() { return _parent; }
        public void set_parent(NtMdtPal _v) { _dirty = true; _parent = _v; }
    }
    private byte[] signature;
    private long count;
    private List<Meta> meta;
    private byte[] something2;
    private List<ColTable> tables;
    private NtMdtPal _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] signature() { return signature; }
    public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
    public long count() { return count; }
    public void setCount(long _v) { _dirty = true; count = _v; }
    public List<Meta> meta() { return meta; }
    public void setMeta(List<Meta> _v) { _dirty = true; meta = _v; }
    public byte[] something2() { return something2; }
    public void setSomething2(byte[] _v) { _dirty = true; something2 = _v; }
    public List<ColTable> tables() { return tables; }
    public void setTables(List<ColTable> _v) { _dirty = true; tables = _v; }
    public NtMdtPal _root() { return _root; }
    public void set_root(NtMdtPal _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
