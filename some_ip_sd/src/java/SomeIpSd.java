// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * The main tasks of the Service Discovery Protocol are communicating the
 * availability of functional entities called services in the in-vehicle
 * communication as well as controlling the send behavior of event messages.
 * This allows sending only event messages to receivers requiring them (Publish/Subscribe).
 * The solution described here is also known as SOME/IP-SD
 * (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
 * @see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf">Source</a>
 */
public class SomeIpSd extends KaitaiStruct {
    public static SomeIpSd fromFile(String fileName) throws IOException {
        return new SomeIpSd(new ByteBufferKaitaiStream(fileName));
    }

    public SomeIpSd(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIpSd(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SomeIpSd(KaitaiStream _io, KaitaiStruct _parent, SomeIpSd _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.flags = new SdFlags(this._io, this, _root);
        this.reserved = this._io.readBytes(3);
        this.lenEntries = this._io.readU4be();
        this._raw_entries = this._io.readBytes(lenEntries());
        KaitaiStream _io__raw_entries = new ByteBufferKaitaiStream(_raw_entries);
        this.entries = new SomeIpSdEntries(_io__raw_entries);
        this.lenOptions = this._io.readU4be();
        this._raw_options = this._io.readBytes(lenOptions());
        KaitaiStream _io__raw_options = new ByteBufferKaitaiStream(_raw_options);
        this.options = new SomeIpSdOptions(_io__raw_options);
    }

    /**
     * @see "AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3"
     */
    public static class SdFlags extends KaitaiStruct {
        public static SdFlags fromFile(String fileName) throws IOException {
            return new SdFlags(new ByteBufferKaitaiStream(fileName));
        }

        public SdFlags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SdFlags(KaitaiStream _io, SomeIpSd _parent) {
            this(_io, _parent, null);
        }

        public SdFlags(KaitaiStream _io, SomeIpSd _parent, SomeIpSd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.reboot = this._io.readBitsIntBe(1) != 0;
            this.unicast = this._io.readBitsIntBe(1) != 0;
            this.initialData = this._io.readBitsIntBe(1) != 0;
            this.reserved = this._io.readBitsIntBe(5);
        }
        private boolean reboot;
        private boolean unicast;
        private boolean initialData;
        private long reserved;
        private SomeIpSd _root;
        private SomeIpSd _parent;
        public boolean reboot() { return reboot; }
        public boolean unicast() { return unicast; }
        public boolean initialData() { return initialData; }
        public long reserved() { return reserved; }
        public SomeIpSd _root() { return _root; }
        public SomeIpSd _parent() { return _parent; }
    }
    private SdFlags flags;
    private byte[] reserved;
    private long lenEntries;
    private SomeIpSdEntries entries;
    private long lenOptions;
    private SomeIpSdOptions options;
    private SomeIpSd _root;
    private KaitaiStruct _parent;
    private byte[] _raw_entries;
    private byte[] _raw_options;

    /**
     * The SOME/IP-SD Header shall start with an 8 Bit field called flags.
     */
    public SdFlags flags() { return flags; }
    public byte[] reserved() { return reserved; }
    public long lenEntries() { return lenEntries; }
    public SomeIpSdEntries entries() { return entries; }
    public long lenOptions() { return lenOptions; }
    public SomeIpSdOptions options() { return options; }
    public SomeIpSd _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_entries() { return _raw_entries; }
    public byte[] _raw_options() { return _raw_options; }
}
