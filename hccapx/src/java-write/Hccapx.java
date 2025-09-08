// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.util.List;


/**
 * Native format of Hashcat password "recovery" utility
 * @see <a href="https://hashcat.net/wiki/doku.php?id=hccapx">Source</a>
 */
public class Hccapx extends KaitaiStruct.ReadWrite {
    public static Hccapx fromFile(String fileName) throws IOException {
        return new Hccapx(new ByteBufferKaitaiStream(fileName));
    }
    public Hccapx() {
        this(null, null, null);
    }

    public Hccapx(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Hccapx(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Hccapx(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Hccapx _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.records = new ArrayList<HccapxRecord>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                HccapxRecord _t_records = new HccapxRecord(this._io, this, _root);
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
    public static class HccapxRecord extends KaitaiStruct.ReadWrite {
        public static HccapxRecord fromFile(String fileName) throws IOException {
            return new HccapxRecord(new ByteBufferKaitaiStream(fileName));
        }
        public HccapxRecord() {
            this(null, null, null);
        }

        public HccapxRecord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HccapxRecord(KaitaiStream _io, Hccapx _parent) {
            this(_io, _parent, null);
        }

        public HccapxRecord(KaitaiStream _io, Hccapx _parent, Hccapx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 72, 67, 80, 88 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 72, 67, 80, 88 }, this.magic, this._io, "/types/hccapx_record/seq/0");
            }
            this.version = this._io.readU4le();
            this.ignoreReplayCounter = this._io.readBitsIntBe(1) != 0;
            this.messagePair = this._io.readBitsIntBe(7);
            this.lenEssid = this._io.readU1();
            this.essid = this._io.readBytes(lenEssid());
            this.padding1 = this._io.readBytes(32 - lenEssid());
            this.keyver = this._io.readU1();
            this.keymic = this._io.readBytes(16);
            this.macAp = this._io.readBytes(6);
            this.nonceAp = this._io.readBytes(32);
            this.macStation = this._io.readBytes(6);
            this.nonceStation = this._io.readBytes(32);
            this.lenEapol = this._io.readU2le();
            this.eapol = this._io.readBytes(lenEapol());
            this.padding2 = this._io.readBytes(256 - lenEapol());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.version);
            this._io.writeBitsIntBe(1, (this.ignoreReplayCounter ? 1 : 0));
            this._io.writeBitsIntBe(7, this.messagePair);
            this._io.writeU1(this.lenEssid);
            this._io.writeBytes(this.essid);
            this._io.writeBytes(this.padding1);
            this._io.writeU1(this.keyver);
            this._io.writeBytes(this.keymic);
            this._io.writeBytes(this.macAp);
            this._io.writeBytes(this.nonceAp);
            this._io.writeBytes(this.macStation);
            this._io.writeBytes(this.nonceStation);
            this._io.writeU2le(this.lenEapol);
            this._io.writeBytes(this.eapol);
            this._io.writeBytes(this.padding2);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 72, 67, 80, 88 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 72, 67, 80, 88 }, this.magic, null, "/types/hccapx_record/seq/0");
            }
            if (this.essid.length != lenEssid())
                throw new ConsistencyError("essid", lenEssid(), this.essid.length);
            if (this.padding1.length != 32 - lenEssid())
                throw new ConsistencyError("padding1", 32 - lenEssid(), this.padding1.length);
            if (this.keymic.length != 16)
                throw new ConsistencyError("keymic", 16, this.keymic.length);
            if (this.macAp.length != 6)
                throw new ConsistencyError("mac_ap", 6, this.macAp.length);
            if (this.nonceAp.length != 32)
                throw new ConsistencyError("nonce_ap", 32, this.nonceAp.length);
            if (this.macStation.length != 6)
                throw new ConsistencyError("mac_station", 6, this.macStation.length);
            if (this.nonceStation.length != 32)
                throw new ConsistencyError("nonce_station", 32, this.nonceStation.length);
            if (this.eapol.length != lenEapol())
                throw new ConsistencyError("eapol", lenEapol(), this.eapol.length);
            if (this.padding2.length != 256 - lenEapol())
                throw new ConsistencyError("padding2", 256 - lenEapol(), this.padding2.length);
            _dirty = false;
        }
        private byte[] magic;
        private long version;
        private boolean ignoreReplayCounter;
        private long messagePair;
        private int lenEssid;
        private byte[] essid;
        private byte[] padding1;
        private int keyver;
        private byte[] keymic;
        private byte[] macAp;
        private byte[] nonceAp;
        private byte[] macStation;
        private byte[] nonceStation;
        private int lenEapol;
        private byte[] eapol;
        private byte[] padding2;
        private Hccapx _root;
        private Hccapx _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * The version number of the .hccapx file format.
         */
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }

        /**
         * Indicates if the message pair matching was done based on
         * replay counter or not.
         * 
         * Whenever it was set to 1 it means that the replay counter
         * was ignored (i.e. it was not considered at all by the
         * matching algorithm).
         * 
         * Hashcat currently does not perform any particular action
         * based on this bit, but nonetheless this information could be
         * crucial for some 3th party tools and for
         * analysis/statistics. There could be some opportunity to
         * implement some further logic based on this particular
         * information also within hashcat (in the future).
         */
        public boolean ignoreReplayCounter() { return ignoreReplayCounter; }
        public void setIgnoreReplayCounter(boolean _v) { _dirty = true; ignoreReplayCounter = _v; }

        /**
         * The message_pair value describes which messages of the 4-way
         * handshake were combined to form the .hccapx structure. It is
         * always a pair of 2 messages: 1 from the AP (access point)
         * and 1 from the STA (client).
         * 
         * Furthermore, the message_pair value also gives a hint from
         * which of the 2 messages the EAPOL origins. This is
         * interesting data, but not necessarily needed for hashcat to
         * be able to crack the hash.
         * 
         * On the other hand, it could be very important to know if
         * "only" message 1 and message 2 were captured or if for
         * instance message 3 and/or message 4 were captured too. If
         * message 3 and/or message 4 were captured it should be a hard
         * evidence that the connection was established and that the
         * password the client used was the correct one.
         */
        public long messagePair() { return messagePair; }
        public void setMessagePair(long _v) { _dirty = true; messagePair = _v; }
        public int lenEssid() { return lenEssid; }
        public void setLenEssid(int _v) { _dirty = true; lenEssid = _v; }
        public byte[] essid() { return essid; }
        public void setEssid(byte[] _v) { _dirty = true; essid = _v; }
        public byte[] padding1() { return padding1; }
        public void setPadding1(byte[] _v) { _dirty = true; padding1 = _v; }

        /**
         * The flag used to distinguish WPA from WPA2 ciphers. Value of
         * 1 means WPA, other - WPA2.
         */
        public int keyver() { return keyver; }
        public void setKeyver(int _v) { _dirty = true; keyver = _v; }

        /**
         * The final hash value. MD5 for WPA and SHA-1 for WPA2
         * (truncated to 128 bit).
         */
        public byte[] keymic() { return keymic; }
        public void setKeymic(byte[] _v) { _dirty = true; keymic = _v; }

        /**
         * The BSSID (MAC address) of the access point.
         */
        public byte[] macAp() { return macAp; }
        public void setMacAp(byte[] _v) { _dirty = true; macAp = _v; }

        /**
         * Nonce (random salt) generated by the access point.
         */
        public byte[] nonceAp() { return nonceAp; }
        public void setNonceAp(byte[] _v) { _dirty = true; nonceAp = _v; }

        /**
         * The MAC address of the client connecting to the access point.
         */
        public byte[] macStation() { return macStation; }
        public void setMacStation(byte[] _v) { _dirty = true; macStation = _v; }

        /**
         * Nonce (random salt) generated by the client connecting to the access point.
         */
        public byte[] nonceStation() { return nonceStation; }
        public void setNonceStation(byte[] _v) { _dirty = true; nonceStation = _v; }

        /**
         * The length of the EAPOL data.
         */
        public int lenEapol() { return lenEapol; }
        public void setLenEapol(int _v) { _dirty = true; lenEapol = _v; }
        public byte[] eapol() { return eapol; }
        public void setEapol(byte[] _v) { _dirty = true; eapol = _v; }
        public byte[] padding2() { return padding2; }
        public void setPadding2(byte[] _v) { _dirty = true; padding2 = _v; }
        public Hccapx _root() { return _root; }
        public void set_root(Hccapx _v) { _dirty = true; _root = _v; }
        public Hccapx _parent() { return _parent; }
        public void set_parent(Hccapx _v) { _dirty = true; _parent = _v; }
    }
    private List<HccapxRecord> records;
    private Hccapx _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<HccapxRecord> records() { return records; }
    public void setRecords(List<HccapxRecord> _v) { _dirty = true; records = _v; }
    public Hccapx _root() { return _root; }
    public void set_root(Hccapx _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
