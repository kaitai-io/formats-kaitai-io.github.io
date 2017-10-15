// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * Native format of Hashcat password "recovery" utility
 * A sample of file for testing can be downloaded from https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap
 * @see <a href="https://hashcat.net/wiki/doku.php?id=hccap">Source</a>
 */
public class Hccap extends KaitaiStruct {
    public static Hccap fromFile(String fileName) throws IOException {
        return new Hccap(new ByteBufferKaitaiStream(fileName));
    }

    public Hccap(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Hccap(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Hccap(KaitaiStream _io, KaitaiStruct _parent, Hccap _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.records = new ArrayList<Hccap>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.records.add(new Hccap(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Hccap extends KaitaiStruct {
        public static Hccap fromFile(String fileName) throws IOException {
            return new Hccap(new ByteBufferKaitaiStream(fileName));
        }

        public Hccap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Hccap(KaitaiStream _io, Hccap _parent) {
            this(_io, _parent, null);
        }

        public Hccap(KaitaiStream _io, Hccap _parent, Hccap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root == null ? this : _root;
            _read();
        }
        private void _read() {
            this.essid = new String(KaitaiStream.bytesTerminate(this._io.readBytes(36), (byte) 0, false), Charset.forName("utf-8"));
            this.apMac = this._io.readBytes(6);
            this.stantionMac = this._io.readBytes(6);
            this.stantionNonce = this._io.readBytes(32);
            this.apNonce = this._io.readBytes(32);
            this._raw_eapol = this._io.readBytes(256);
            KaitaiStream _io__raw_eapol = new ByteBufferKaitaiStream(_raw_eapol);
            this.eapol = new EapolFrame(_io__raw_eapol, this, _root);
            this.eapolSize = this._io.readU4le();
            this.keyver = this._io.readU4le();
            this.keymic = this._io.readBytes(16);
        }
        private String essid;
        private byte[] apMac;
        private byte[] stantionMac;
        private byte[] stantionNonce;
        private byte[] apNonce;
        private EapolFrame eapol;
        private long eapolSize;
        private long keyver;
        private byte[] keymic;
        private Hccap _root;
        private Hccap _parent;
        private byte[] _raw_eapol;
        public String essid() { return essid; }

        /**
         * the bssid(MAC) of the access point
         */
        public byte[] apMac() { return apMac; }

        /**
         * the MAC address of a client connecting to the access point
         */
        public byte[] stantionMac() { return stantionMac; }
        public byte[] stantionNonce() { return stantionNonce; }
        public byte[] apNonce() { return apNonce; }
        public EapolFrame eapol() { return eapol; }

        /**
         * size of eapol
         */
        public long eapolSize() { return eapolSize; }

        /**
         * the flag used to distinguish WPA from WPA2 ciphers. Value of 1 means WPA, other - WPA2
         */
        public long keyver() { return keyver; }

        /**
         * the final hash value. MD5 for WPA and SHA-1 for WPA2 (truncated to 128 bit)
         */
        public byte[] keymic() { return keymic; }
        public Hccap _root() { return _root; }
        public Hccap _parent() { return _parent; }
        public byte[] _raw_eapol() { return _raw_eapol; }
    }
    public static class EapolFrame extends KaitaiStruct {
        public static EapolFrame fromFile(String fileName) throws IOException {
            return new EapolFrame(new ByteBufferKaitaiStream(fileName));
        }

        public EapolFrame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EapolFrame(KaitaiStream _io, Hccap.Hccap _parent) {
            this(_io, _parent, null);
        }

        public EapolFrame(KaitaiStream _io, Hccap.Hccap _parent, Hccap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.body = this._io.readBytes(_parent().eapolSize());
            this._io.seek(_pos);
            return this.body;
        }
        private Hccap _root;
        private Hccap.Hccap _parent;
        public Hccap _root() { return _root; }
        public Hccap.Hccap _parent() { return _parent; }
    }
    private ArrayList<Hccap> records;
    private Hccap _root;
    private KaitaiStruct _parent;
    public ArrayList<Hccap> records() { return records; }
    public Hccap _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
