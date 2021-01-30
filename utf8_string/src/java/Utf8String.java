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
 * WARNING: For the vast majority of practical purposes of format
 * definitions in Kaitai Struct, you'd likely NOT want to use this and
 * rather just use `type: str` with `encoding: utf-8`. That will use
 * native string implementations, which are most likely more efficient
 * and will give you native language strings, rather than an array of
 * individual codepoints.  This format definition is provided mostly
 * for educational / research purposes.
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
                this.codepoints.add(new Utf8Codepoint(this._io, this, _root, _io().pos()));
                i++;
            }
        }
    }
    public static class Utf8Codepoint extends KaitaiStruct {

        public Utf8Codepoint(KaitaiStream _io, long ofs) {
            this(_io, null, null, ofs);
        }

        public Utf8Codepoint(KaitaiStream _io, Utf8String _parent, long ofs) {
            this(_io, _parent, null, ofs);
        }

        public Utf8Codepoint(KaitaiStream _io, Utf8String _parent, Utf8String _root, long ofs) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.ofs = ofs;
            _read();
        }
        private void _read() {
            this.bytes = this._io.readBytes(lenBytes());
        }
        private Integer raw1;
        public Integer raw1() {
            if (this.raw1 != null)
                return this.raw1;
            if (lenBytes() >= 2) {
                int _tmp = (int) ((bytes()[1] & 63));
                this.raw1 = _tmp;
            }
            return this.raw1;
        }
        private Integer lenBytes;
        public Integer lenBytes() {
            if (this.lenBytes != null)
                return this.lenBytes;
            int _tmp = (int) (((byte0() & 128) == 0 ? 1 : ((byte0() & 224) == 192 ? 2 : ((byte0() & 240) == 224 ? 3 : ((byte0() & 248) == 240 ? 4 : -1)))));
            this.lenBytes = _tmp;
            return this.lenBytes;
        }
        private Integer raw3;
        public Integer raw3() {
            if (this.raw3 != null)
                return this.raw3;
            if (lenBytes() >= 4) {
                int _tmp = (int) ((bytes()[3] & 63));
                this.raw3 = _tmp;
            }
            return this.raw3;
        }
        private Integer valueAsInt;
        public Integer valueAsInt() {
            if (this.valueAsInt != null)
                return this.valueAsInt;
            int _tmp = (int) ((lenBytes() == 1 ? raw0() : (lenBytes() == 2 ? ((raw0() << 6) | raw1()) : (lenBytes() == 3 ? (((raw0() << 12) | (raw1() << 6)) | raw2()) : (lenBytes() == 4 ? ((((raw0() << 18) | (raw1() << 12)) | (raw2() << 6)) | raw3()) : -1)))));
            this.valueAsInt = _tmp;
            return this.valueAsInt;
        }
        private Integer raw0;
        public Integer raw0() {
            if (this.raw0 != null)
                return this.raw0;
            int _tmp = (int) ((bytes()[0] & (lenBytes() == 1 ? 127 : (lenBytes() == 2 ? 31 : (lenBytes() == 3 ? 15 : (lenBytes() == 4 ? 7 : 0))))));
            this.raw0 = _tmp;
            return this.raw0;
        }
        private Integer byte0;
        public Integer byte0() {
            if (this.byte0 != null)
                return this.byte0;
            long _pos = this._io.pos();
            this._io.seek(ofs());
            this.byte0 = this._io.readU1();
            this._io.seek(_pos);
            return this.byte0;
        }
        private Integer raw2;
        public Integer raw2() {
            if (this.raw2 != null)
                return this.raw2;
            if (lenBytes() >= 3) {
                int _tmp = (int) ((bytes()[2] & 63));
                this.raw2 = _tmp;
            }
            return this.raw2;
        }
        private byte[] bytes;
        private long ofs;
        private Utf8String _root;
        private Utf8String _parent;
        public byte[] bytes() { return bytes; }
        public long ofs() { return ofs; }
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
