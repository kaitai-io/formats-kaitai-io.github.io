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
 * Native format of Hashcat password "recovery" utility.
 * 
 * A sample of file for testing can be downloaded from
 * <https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap>
 * @see <a href="https://hashcat.net/wiki/doku.php?id=hccap">Source</a>
 */
public class Hccap extends KaitaiStruct.ReadWrite {
    public static Hccap fromFile(String fileName) throws IOException {
        return new Hccap(new ByteBufferKaitaiStream(fileName));
    }
    public Hccap() {
        this(null, null, null);
    }

    public Hccap(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Hccap(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Hccap(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Hccap _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.records = new ArrayList<HccapRecord>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                HccapRecord _t_records = new HccapRecord(this._io, this, _root);
                try {
                    _t_records._read();
                } finally {
                    this.records.add(_t_records);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.records.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
            this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class EapolDummy extends KaitaiStruct.ReadWrite {
        public static EapolDummy fromFile(String fileName) throws IOException {
            return new EapolDummy(new ByteBufferKaitaiStream(fileName));
        }
        public EapolDummy() {
            this(null, null, null);
        }

        public EapolDummy(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EapolDummy(KaitaiStream _io, Hccap.HccapRecord _parent) {
            this(_io, _parent, null);
        }

        public EapolDummy(KaitaiStream _io, Hccap.HccapRecord _parent, Hccap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
        }
        private Hccap _root;
        private Hccap.HccapRecord _parent;
        public Hccap _root() { return _root; }
        public void set_root(Hccap _v) { _dirty = true; _root = _v; }
        public Hccap.HccapRecord _parent() { return _parent; }
        public void set_parent(Hccap.HccapRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class HccapRecord extends KaitaiStruct.ReadWrite {
        public static HccapRecord fromFile(String fileName) throws IOException {
            return new HccapRecord(new ByteBufferKaitaiStream(fileName));
        }
        public HccapRecord() {
            this(null, null, null);
        }

        public HccapRecord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HccapRecord(KaitaiStream _io, Hccap _parent) {
            this(_io, _parent, null);
        }

        public HccapRecord(KaitaiStream _io, Hccap _parent, Hccap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.essid = this._io.readBytes(36);
            this.macAp = this._io.readBytes(6);
            this.macStation = this._io.readBytes(6);
            this.nonceStation = this._io.readBytes(32);
            this.nonceAp = this._io.readBytes(32);
            this._raw_eapolBuffer = this._io.readBytes(256);
            KaitaiStream _io__raw_eapolBuffer = new ByteBufferKaitaiStream(this._raw_eapolBuffer);
            this.eapolBuffer = new EapolDummy(_io__raw_eapolBuffer, this, _root);
            this.eapolBuffer._read();
            this.lenEapol = this._io.readU4le();
            this.keyver = this._io.readU4le();
            this.keymic = this._io.readBytes(16);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.eapolBuffer._fetchInstances();
            eapol();
            if (this.eapol != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteEapol = _enabledEapol;
            this._io.writeBytes(this.essid);
            this._io.writeBytes(this.macAp);
            this._io.writeBytes(this.macStation);
            this._io.writeBytes(this.nonceStation);
            this._io.writeBytes(this.nonceAp);
            final KaitaiStream _io__raw_eapolBuffer = new ByteBufferKaitaiStream(256);
            this._io.addChildStream(_io__raw_eapolBuffer);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (256));
                final HccapRecord _this = this;
                _io__raw_eapolBuffer.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_eapolBuffer = _io__raw_eapolBuffer.toByteArray();
                        if (_this._raw_eapolBuffer.length != 256)
                            throw new ConsistencyError("raw(eapol_buffer)", 256, _this._raw_eapolBuffer.length);
                        parent.writeBytes(_this._raw_eapolBuffer);
                    }
                });
            }
            this.eapolBuffer._write_Seq(_io__raw_eapolBuffer);
            this._io.writeU4le(this.lenEapol);
            this._io.writeU4le(this.keyver);
            this._io.writeBytes(this.keymic);
        }

        public void _check() {
            if (this.essid.length != 36)
                throw new ConsistencyError("essid", 36, this.essid.length);
            if (this.macAp.length != 6)
                throw new ConsistencyError("mac_ap", 6, this.macAp.length);
            if (this.macStation.length != 6)
                throw new ConsistencyError("mac_station", 6, this.macStation.length);
            if (this.nonceStation.length != 32)
                throw new ConsistencyError("nonce_station", 32, this.nonceStation.length);
            if (this.nonceAp.length != 32)
                throw new ConsistencyError("nonce_ap", 32, this.nonceAp.length);
            if (!Objects.equals(this.eapolBuffer._root(), _root()))
                throw new ConsistencyError("eapol_buffer", _root(), this.eapolBuffer._root());
            if (!Objects.equals(this.eapolBuffer._parent(), this))
                throw new ConsistencyError("eapol_buffer", this, this.eapolBuffer._parent());
            if (this.keymic.length != 16)
                throw new ConsistencyError("keymic", 16, this.keymic.length);
            if (_enabledEapol) {
                if (this.eapol.length != lenEapol())
                    throw new ConsistencyError("eapol", lenEapol(), this.eapol.length);
            }
            _dirty = false;
        }
        private byte[] eapol;
        private boolean _shouldWriteEapol = false;
        private boolean _enabledEapol = true;
        public byte[] eapol() {
            if (_shouldWriteEapol)
                _writeEapol();
            if (this.eapol != null)
                return this.eapol;
            if (!_enabledEapol)
                return null;
            KaitaiStream io = eapolBuffer()._io();
            long _pos = io.pos();
            io.seek(0);
            this.eapol = io.readBytes(lenEapol());
            io.seek(_pos);
            return this.eapol;
        }
        public void setEapol(byte[] _v) { _dirty = true; eapol = _v; }
        public void setEapol_Enabled(boolean _v) { _dirty = true; _enabledEapol = _v; }

        private void _writeEapol() {
            _shouldWriteEapol = false;
            KaitaiStream io = eapolBuffer()._io();
            long _pos = io.pos();
            io.seek(0);
            io.writeBytes(this.eapol);
            io.seek(_pos);
        }
        private byte[] essid;
        private byte[] macAp;
        private byte[] macStation;
        private byte[] nonceStation;
        private byte[] nonceAp;
        private EapolDummy eapolBuffer;
        private long lenEapol;
        private long keyver;
        private byte[] keymic;
        private Hccap _root;
        private Hccap _parent;
        private byte[] _raw_eapolBuffer;
        public byte[] essid() { return essid; }
        public void setEssid(byte[] _v) { _dirty = true; essid = _v; }

        /**
         * The BSSID (MAC address) of the access point
         */
        public byte[] macAp() { return macAp; }
        public void setMacAp(byte[] _v) { _dirty = true; macAp = _v; }

        /**
         * The MAC address of a client connecting to the access point
         */
        public byte[] macStation() { return macStation; }
        public void setMacStation(byte[] _v) { _dirty = true; macStation = _v; }

        /**
         * Nonce (random salt) generated by the client connecting to the access point.
         */
        public byte[] nonceStation() { return nonceStation; }
        public void setNonceStation(byte[] _v) { _dirty = true; nonceStation = _v; }

        /**
         * Nonce (random salt) generated by the access point.
         */
        public byte[] nonceAp() { return nonceAp; }
        public void setNonceAp(byte[] _v) { _dirty = true; nonceAp = _v; }

        /**
         * Buffer for EAPOL data, only first `len_eapol` bytes are used
         */
        public EapolDummy eapolBuffer() { return eapolBuffer; }
        public void setEapolBuffer(EapolDummy _v) { _dirty = true; eapolBuffer = _v; }

        /**
         * Size of EAPOL data
         */
        public long lenEapol() { return lenEapol; }
        public void setLenEapol(long _v) { _dirty = true; lenEapol = _v; }

        /**
         * The flag used to distinguish WPA from WPA2 ciphers. Value of
         * 1 means WPA, other - WPA2.
         */
        public long keyver() { return keyver; }
        public void setKeyver(long _v) { _dirty = true; keyver = _v; }

        /**
         * The final hash value. MD5 for WPA and SHA-1 for WPA2
         * (truncated to 128 bit).
         */
        public byte[] keymic() { return keymic; }
        public void setKeymic(byte[] _v) { _dirty = true; keymic = _v; }
        public Hccap _root() { return _root; }
        public void set_root(Hccap _v) { _dirty = true; _root = _v; }
        public Hccap _parent() { return _parent; }
        public void set_parent(Hccap _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_eapolBuffer() { return _raw_eapolBuffer; }
        public void set_raw_EapolBuffer(byte[] _v) { _dirty = true; _raw_eapolBuffer = _v; }
    }
    private List<HccapRecord> records;
    private Hccap _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<HccapRecord> records() { return records; }
    public void setRecords(List<HccapRecord> _v) { _dirty = true; records = _v; }
    public Hccap _root() { return _root; }
    public void set_root(Hccap _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
