// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;


/**
 * The main tasks of the Service Discovery Protocol are communicating the
 * availability of functional entities called services in the in-vehicle
 * communication as well as controlling the send behavior of event messages.
 * This allows sending only event messages to receivers requiring them (Publish/Subscribe).
 * The solution described here is also known as SOME/IP-SD
 * (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
 * @see <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf">Source</a>
 */
public class SomeIpSd extends KaitaiStruct.ReadWrite {
    public static SomeIpSd fromFile(String fileName) throws IOException {
        return new SomeIpSd(new ByteBufferKaitaiStream(fileName));
    }
    public SomeIpSd() {
        this(null, null, null);
    }

    public SomeIpSd(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIpSd(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SomeIpSd(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SomeIpSd _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.flags = new SdFlags(this._io, this, _root);
        this.flags._read();
        this.reserved = this._io.readBytes(3);
        this.lenEntries = this._io.readU4be();
        this._raw_entries = this._io.readBytes(lenEntries());
        KaitaiStream _io__raw_entries = new ByteBufferKaitaiStream(this._raw_entries);
        this.entries = new SomeIpSdEntries(_io__raw_entries);
        this.entries._read();
        this.lenOptions = this._io.readU4be();
        this._raw_options = this._io.readBytes(lenOptions());
        KaitaiStream _io__raw_options = new ByteBufferKaitaiStream(this._raw_options);
        this.options = new SomeIpSdOptions(_io__raw_options);
        this.options._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.flags._fetchInstances();
        this.entries._fetchInstances();
        this.options._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.flags._write_Seq(this._io);
        this._io.writeBytes(this.reserved);
        this._io.writeU4be(this.lenEntries);
        final KaitaiStream _io__raw_entries = new ByteBufferKaitaiStream(lenEntries());
        this._io.addChildStream(_io__raw_entries);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenEntries()));
            final SomeIpSd _this = this;
            _io__raw_entries.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_entries = _io__raw_entries.toByteArray();
                    if (_this._raw_entries.length != lenEntries())
                        throw new ConsistencyError("raw(entries)", lenEntries(), _this._raw_entries.length);
                    parent.writeBytes(_this._raw_entries);
                }
            });
        }
        this.entries._write_Seq(_io__raw_entries);
        this._io.writeU4be(this.lenOptions);
        final KaitaiStream _io__raw_options = new ByteBufferKaitaiStream(lenOptions());
        this._io.addChildStream(_io__raw_options);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenOptions()));
            final SomeIpSd _this = this;
            _io__raw_options.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_options = _io__raw_options.toByteArray();
                    if (_this._raw_options.length != lenOptions())
                        throw new ConsistencyError("raw(options)", lenOptions(), _this._raw_options.length);
                    parent.writeBytes(_this._raw_options);
                }
            });
        }
        this.options._write_Seq(_io__raw_options);
    }

    public void _check() {
        if (!Objects.equals(this.flags._root(), _root()))
            throw new ConsistencyError("flags", _root(), this.flags._root());
        if (!Objects.equals(this.flags._parent(), this))
            throw new ConsistencyError("flags", this, this.flags._parent());
        if (this.reserved.length != 3)
            throw new ConsistencyError("reserved", 3, this.reserved.length);
        _dirty = false;
    }

    /**
     * @see "AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3"
     */
    public static class SdFlags extends KaitaiStruct.ReadWrite {
        public static SdFlags fromFile(String fileName) throws IOException {
            return new SdFlags(new ByteBufferKaitaiStream(fileName));
        }
        public SdFlags() {
            this(null, null, null);
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
        }
        public void _read() {
            this.reboot = this._io.readBitsIntBe(1) != 0;
            this.unicast = this._io.readBitsIntBe(1) != 0;
            this.initialData = this._io.readBitsIntBe(1) != 0;
            this.reserved = this._io.readBitsIntBe(5);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.reboot ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.unicast ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.initialData ? 1 : 0));
            this._io.writeBitsIntBe(5, this.reserved);
        }

        public void _check() {
            _dirty = false;
        }
        private boolean reboot;
        private boolean unicast;
        private boolean initialData;
        private long reserved;
        private SomeIpSd _root;
        private SomeIpSd _parent;
        public boolean reboot() { return reboot; }
        public void setReboot(boolean _v) { _dirty = true; reboot = _v; }
        public boolean unicast() { return unicast; }
        public void setUnicast(boolean _v) { _dirty = true; unicast = _v; }
        public boolean initialData() { return initialData; }
        public void setInitialData(boolean _v) { _dirty = true; initialData = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public SomeIpSd _root() { return _root; }
        public void set_root(SomeIpSd _v) { _dirty = true; _root = _v; }
        public SomeIpSd _parent() { return _parent; }
        public void set_parent(SomeIpSd _v) { _dirty = true; _parent = _v; }
    }
    private SdFlags flags;
    private byte[] reserved;
    private long lenEntries;
    private SomeIpSdEntries entries;
    private long lenOptions;
    private SomeIpSdOptions options;
    private SomeIpSd _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_entries;
    private byte[] _raw_options;

    /**
     * The SOME/IP-SD Header shall start with an 8 Bit field called flags.
     */
    public SdFlags flags() { return flags; }
    public void setFlags(SdFlags _v) { _dirty = true; flags = _v; }
    public byte[] reserved() { return reserved; }
    public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
    public long lenEntries() { return lenEntries; }
    public void setLenEntries(long _v) { _dirty = true; lenEntries = _v; }
    public SomeIpSdEntries entries() { return entries; }
    public void setEntries(SomeIpSdEntries _v) { _dirty = true; entries = _v; }
    public long lenOptions() { return lenOptions; }
    public void setLenOptions(long _v) { _dirty = true; lenOptions = _v; }
    public SomeIpSdOptions options() { return options; }
    public void setOptions(SomeIpSdOptions _v) { _dirty = true; options = _v; }
    public SomeIpSd _root() { return _root; }
    public void set_root(SomeIpSd _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_entries() { return _raw_entries; }
    public void set_raw_Entries(byte[] _v) { _dirty = true; _raw_entries = _v; }
    public byte[] _raw_options() { return _raw_options; }
    public void set_raw_Options(byte[] _v) { _dirty = true; _raw_options = _v; }
}
