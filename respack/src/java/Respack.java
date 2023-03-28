// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Arrays;


/**
 * Resource file found in CPB firmware archives, mostly used on older CoolPad
 * phones and/or tablets. The only observed files are called "ResPack.cfg".
 */
public class Respack extends KaitaiStruct {
    public static Respack fromFile(String fileName) throws IOException {
        return new Respack(new ByteBufferKaitaiStream(fileName));
    }

    public Respack(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Respack(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Respack(KaitaiStream _io, KaitaiStruct _parent, Respack _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
        this.json = new String(this._io.readBytes(header().lenJson()), Charset.forName("UTF-8"));
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Respack _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Respack _parent, Respack _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(magic(), new byte[] { 82, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 83 }, magic(), _io(), "/types/header/seq/0");
            }
            this.unknown = this._io.readBytes(8);
            this.lenJson = this._io.readU4le();
            this.md5 = new String(this._io.readBytes(32), Charset.forName("UTF-8"));
        }
        private byte[] magic;
        private byte[] unknown;
        private long lenJson;
        private String md5;
        private Respack _root;
        private Respack _parent;
        public byte[] magic() { return magic; }
        public byte[] unknown() { return unknown; }
        public long lenJson() { return lenJson; }

        /**
         * MD5 of data that follows the header
         */
        public String md5() { return md5; }
        public Respack _root() { return _root; }
        public Respack _parent() { return _parent; }
    }
    private Header header;
    private String json;
    private Respack _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public String json() { return json; }
    public Respack _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
