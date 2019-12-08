// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;


/**
 * UTF-8 is a popular character encoding scheme that allows to
 * represent strings as sequence of code points defined in Unicode
 * standard. Its features are:
 * 
 * * variable width (i.e. one code point might be represented by 1 to 4
 *   bytes)
 * * backward compatiblity with ASCII
 * * basic validity checking (and thus distinguishing from other legacy
 *   8-bit encodings)
 * * maintaining sort order of codepoints if sorted as a byte array
 * 
 * WARNING: For vast majority of practical purposes of format definitions
 * in Kaitai Struct, you'd likely note want to use this and rather just
 * use `type: str` with `encoding: utf8`. That will use native string
 * implementations, which are most likely more efficient and will give you
 * native language strings, rather than an array of individual codepoints.
 * This format definition is provided mostly for educational / research
 * purposes.
 */
public class Utf8String extends KaitaiStruct {
    public static Utf8String fromFile(String fileName) throws IOException {
        return new Utf8String(new ByteBufferKaitaiStream(fileName));
    }

    public Utf8String(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Utf8String(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Utf8String(KaitaiStream _io, KaitaiStruct _parent, Utf8String _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.codepoints = new ArrayList<Utf8Codepoint>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.codepoints.add(new Utf8Codepoint(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Utf8Codepoint extends KaitaiStruct {
        public static Utf8Codepoint fromFile(String fileName) throws IOException {
            return new Utf8Codepoint(new ByteBufferKaitaiStream(fileName));
        }

        public Utf8Codepoint(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Utf8Codepoint(KaitaiStream _io, Utf8String _parent) {
            this(_io, _parent, null);
        }

        public Utf8Codepoint(KaitaiStream _io, Utf8String _parent, Utf8String _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.byte1 = this._io.readU1();
            if (len() >= 2) {
                this.byte2 = this._io.readU1();
            }
            if (len() >= 3) {
                this.byte3 = this._io.readU1();
            }
            if (len() >= 4) {
                this.byte4 = this._io.readU1();
            }
        }
        private Integer raw1;
        public Integer raw1() {
            if (this.raw1 != null)
                return this.raw1;
            int _tmp = (int) ((byte1() & (len() == 1 ? 127 : (len() == 2 ? 31 : (len() == 3 ? 15 : (len() == 4 ? 7 : 0))))));
            this.raw1 = _tmp;
            return this.raw1;
        }
        private Integer raw4;
        public Integer raw4() {
            if (this.raw4 != null)
                return this.raw4;
            if (len() >= 4) {
                int _tmp = (int) ((byte4() & 63));
                this.raw4 = _tmp;
            }
            return this.raw4;
        }
        private Integer raw3;
        public Integer raw3() {
            if (this.raw3 != null)
                return this.raw3;
            if (len() >= 3) {
                int _tmp = (int) ((byte3() & 63));
                this.raw3 = _tmp;
            }
            return this.raw3;
        }
        private Integer valueAsInt;
        public Integer valueAsInt() {
            if (this.valueAsInt != null)
                return this.valueAsInt;
            int _tmp = (int) ((len() == 1 ? raw1() : (len() == 2 ? ((raw1() << 6) | raw2()) : (len() == 3 ? (((raw1() << 12) | (raw2() << 6)) | raw3()) : (len() == 4 ? ((((raw1() << 18) | (raw2() << 12)) | (raw3() << 6)) | raw4()) : -1)))));
            this.valueAsInt = _tmp;
            return this.valueAsInt;
        }
        private Integer raw2;
        public Integer raw2() {
            if (this.raw2 != null)
                return this.raw2;
            if (len() >= 2) {
                int _tmp = (int) ((byte2() & 63));
                this.raw2 = _tmp;
            }
            return this.raw2;
        }
        private Integer len;
        public Integer len() {
            if (this.len != null)
                return this.len;
            int _tmp = (int) (((byte1() & 128) == 0 ? 1 : ((byte1() & 224) == 192 ? 2 : ((byte1() & 240) == 224 ? 3 : ((byte1() & 248) == 240 ? 4 : -1)))));
            this.len = _tmp;
            return this.len;
        }
        private int byte1;
        private Integer byte2;
        private Integer byte3;
        private Integer byte4;
        private Utf8String _root;
        private Utf8String _parent;
        public int byte1() { return byte1; }
        public Integer byte2() { return byte2; }
        public Integer byte3() { return byte3; }
        public Integer byte4() { return byte4; }
        public Utf8String _root() { return _root; }
        public Utf8String _parent() { return _parent; }
    }
    private ArrayList<Utf8Codepoint> codepoints;
    private Utf8String _root;
    private KaitaiStruct _parent;
    public ArrayList<Utf8Codepoint> codepoints() { return codepoints; }
    public Utf8String _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
