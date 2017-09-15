// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * It is a color scheme for visualising SPM scans.
 */
public class NtMdtPal extends KaitaiStruct {
    public static NtMdtPal fromFile(String fileName) throws IOException {
        return new NtMdtPal(new ByteBufferKaitaiStream(fileName));
    }

    public NtMdtPal(KaitaiStream _io) {
        this(_io, null, null);
    }

    public NtMdtPal(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public NtMdtPal(KaitaiStream _io, KaitaiStruct _parent, NtMdtPal _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.signature = this._io.ensureFixedContents(new byte[] { 78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33 });
        this.count = this._io.readU4be();
        meta = new ArrayList<Meta>((int) (count()));
        for (int i = 0; i < count(); i++) {
            this.meta.add(new Meta(this._io, this, _root));
        }
        this.something2 = this._io.readBytes(1);
        tables = new ArrayList<ColTable>((int) (count()));
        for (int i = 0; i < count(); i++) {
            this.tables.add(new ColTable(this._io, this, _root, i));
        }
    }
    public static class Meta extends KaitaiStruct {
        public static Meta fromFile(String fileName) throws IOException {
            return new Meta(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.unkn0 = this._io.readBytes(7);
            this.colorsCount = this._io.readU2le();
            this.unkn1 = this._io.readBytes(5);
            this.nameSize = this._io.readU2be();
        }
        private byte[] unkn0;
        private int colorsCount;
        private byte[] unkn1;
        private int nameSize;
        private NtMdtPal _root;
        private NtMdtPal _parent;
        public byte[] unkn0() { return unkn0; }
        public int colorsCount() { return colorsCount; }
        public byte[] unkn1() { return unkn1; }
        public int nameSize() { return nameSize; }
        public NtMdtPal _root() { return _root; }
        public NtMdtPal _parent() { return _parent; }
    }
    public static class Color extends KaitaiStruct {
        public static Color fromFile(String fileName) throws IOException {
            return new Color(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.data = this._io.readBytes(4);
        }
        private byte[] data;
        private NtMdtPal _root;
        private NtMdtPal.ColTable _parent;
        public byte[] data() { return data; }
        public NtMdtPal _root() { return _root; }
        public NtMdtPal.ColTable _parent() { return _parent; }
    }
    public static class ColTable extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
            this.size1 = this._io.readU1();
            this.unkn = this._io.readU1();
            this.title = new String(this._io.readBytes(_root.meta().get((int) index()).nameSize()), Charset.forName("UTF-16"));
            this.unkn1 = this._io.readU2be();
            colors = new ArrayList<Color>((int) ((_root.meta().get((int) index()).colorsCount() - 1)));
            for (int i = 0; i < (_root.meta().get((int) index()).colorsCount() - 1); i++) {
                this.colors.add(new Color(this._io, this, _root));
            }
        }
        private int size1;
        private int unkn;
        private String title;
        private int unkn1;
        private ArrayList<Color> colors;
        private int index;
        private NtMdtPal _root;
        private NtMdtPal _parent;
        public int size1() { return size1; }
        public int unkn() { return unkn; }
        public String title() { return title; }
        public int unkn1() { return unkn1; }
        public ArrayList<Color> colors() { return colors; }
        public int index() { return index; }
        public NtMdtPal _root() { return _root; }
        public NtMdtPal _parent() { return _parent; }
    }
    private byte[] signature;
    private long count;
    private ArrayList<Meta> meta;
    private byte[] something2;
    private ArrayList<ColTable> tables;
    private NtMdtPal _root;
    private KaitaiStruct _parent;
    public byte[] signature() { return signature; }
    public long count() { return count; }
    public ArrayList<Meta> meta() { return meta; }
    public byte[] something2() { return something2; }
    public ArrayList<ColTable> tables() { return tables; }
    public NtMdtPal _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
