// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


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
public class Utf8String extends KaitaiStruct.ReadWrite {
    public static Utf8String fromFile(String fileName) throws IOException {
        return new Utf8String(new ByteBufferKaitaiStream(fileName));
    }
    public Utf8String() {
        this(null, null, null);
    }

    public Utf8String(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Utf8String(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Utf8String(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Utf8String _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.codepoints = new ArrayList<Utf8Codepoint>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Utf8Codepoint _t_codepoints = new Utf8Codepoint(this._io, this, _root, _io().pos());
                try {
                    _t_codepoints._read();
                } finally {
                    this.codepoints.add(_t_codepoints);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.codepoints.size(); i++) {
            this.codepoints.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.codepoints.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("codepoints", 0, this._io.size() - this._io.pos());
            if (this.codepoints.get(((Number) (i)).intValue()).ofs() != _io().pos())
                throw new ConsistencyError("codepoints", _io().pos(), this.codepoints.get(((Number) (i)).intValue()).ofs());
            this.codepoints.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("codepoints", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.codepoints.size(); i++) {
            if (!Objects.equals(this.codepoints.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("codepoints", _root(), this.codepoints.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.codepoints.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("codepoints", this, this.codepoints.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Utf8Codepoint extends KaitaiStruct.ReadWrite {
        public Utf8Codepoint(long ofs) {
            this(null, null, null, ofs);
        }

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
        }
        public void _read() {
            this.bytes = this._io.readBytes(lenBytes());
            _dirty = false;
        }

        public void _fetchInstances() {
            byte0();
            if (this.byte0 != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteByte0 = _enabledByte0;
            if (this.bytes.length != lenBytes())
                throw new ConsistencyError("bytes", lenBytes(), this.bytes.length);
            this._io.writeBytes(this.bytes);
        }

        public void _check() {
            if (_enabledByte0) {
            }
            _dirty = false;
        }
        private Integer byte0;
        private boolean _shouldWriteByte0 = false;
        private boolean _enabledByte0 = true;
        public Integer byte0() {
            if (_shouldWriteByte0)
                _writeByte0();
            if (this.byte0 != null)
                return this.byte0;
            if (!_enabledByte0)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofs());
            this.byte0 = this._io.readU1();
            this._io.seek(_pos);
            return this.byte0;
        }
        public void setByte0(int _v) { _dirty = true; byte0 = _v; }
        public void setByte0_Enabled(boolean _v) { _dirty = true; _enabledByte0 = _v; }

        private void _writeByte0() {
            _shouldWriteByte0 = false;
            long _pos = this._io.pos();
            this._io.seek(ofs());
            this._io.writeU1(this.byte0);
            this._io.seek(_pos);
        }
        private Integer lenBytes;
        public Integer lenBytes() {
            if (this.lenBytes != null)
                return this.lenBytes;
            this.lenBytes = ((Number) (((byte0() & 128) == 0 ? 1 : ((byte0() & 224) == 192 ? 2 : ((byte0() & 240) == 224 ? 3 : ((byte0() & 248) == 240 ? 4 : -1)))))).intValue();
            return this.lenBytes;
        }
        public void _invalidateLenBytes() { this.lenBytes = null; }
        private Integer raw0;
        public Integer raw0() {
            if (this.raw0 != null)
                return this.raw0;
            this.raw0 = ((Number) ((bytes()[((int) 0)] & 0xff) & (lenBytes() == 1 ? 127 : (lenBytes() == 2 ? 31 : (lenBytes() == 3 ? 15 : (lenBytes() == 4 ? 7 : 0)))))).intValue();
            return this.raw0;
        }
        public void _invalidateRaw0() { this.raw0 = null; }
        private Integer raw1;
        public Integer raw1() {
            if (this.raw1 != null)
                return this.raw1;
            if (lenBytes() >= 2) {
                this.raw1 = ((Number) ((bytes()[((int) 1)] & 0xff) & 63)).intValue();
            }
            return this.raw1;
        }
        public void _invalidateRaw1() { this.raw1 = null; }
        private Integer raw2;
        public Integer raw2() {
            if (this.raw2 != null)
                return this.raw2;
            if (lenBytes() >= 3) {
                this.raw2 = ((Number) ((bytes()[((int) 2)] & 0xff) & 63)).intValue();
            }
            return this.raw2;
        }
        public void _invalidateRaw2() { this.raw2 = null; }
        private Integer raw3;
        public Integer raw3() {
            if (this.raw3 != null)
                return this.raw3;
            if (lenBytes() >= 4) {
                this.raw3 = ((Number) ((bytes()[((int) 3)] & 0xff) & 63)).intValue();
            }
            return this.raw3;
        }
        public void _invalidateRaw3() { this.raw3 = null; }
        private Integer valueAsInt;
        public Integer valueAsInt() {
            if (this.valueAsInt != null)
                return this.valueAsInt;
            this.valueAsInt = ((Number) ((lenBytes() == 1 ? raw0() : (lenBytes() == 2 ? raw0() << 6 | raw1() : (lenBytes() == 3 ? (raw0() << 12 | raw1() << 6) | raw2() : (lenBytes() == 4 ? ((raw0() << 18 | raw1() << 12) | raw2() << 6) | raw3() : -1)))))).intValue();
            return this.valueAsInt;
        }
        public void _invalidateValueAsInt() { this.valueAsInt = null; }
        private byte[] bytes;
        private long ofs;
        private Utf8String _root;
        private Utf8String _parent;
        public byte[] bytes() { return bytes; }
        public void setBytes(byte[] _v) { _dirty = true; bytes = _v; }
        public long ofs() { return ofs; }
        public void setOfs(long _v) { _dirty = true; ofs = _v; }
        public Utf8String _root() { return _root; }
        public void set_root(Utf8String _v) { _dirty = true; _root = _v; }
        public Utf8String _parent() { return _parent; }
        public void set_parent(Utf8String _v) { _dirty = true; _parent = _v; }
    }
    private List<Utf8Codepoint> codepoints;
    private Utf8String _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Utf8Codepoint> codepoints() { return codepoints; }
    public void setCodepoints(List<Utf8Codepoint> _v) { _dirty = true; codepoints = _v; }
    public Utf8String _root() { return _root; }
    public void set_root(Utf8String _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
