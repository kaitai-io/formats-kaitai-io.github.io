// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * FormatOptions are used to transport additional information to the entries.
 * This includes forinstance the information how a service instance is
 * reachable (IP-Address, TransportProtocol, Port Number).
 * @see <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * -">section 4.1.2.4 Options Format</a>
 */
public class SomeIpSdOptions extends KaitaiStruct.ReadWrite {
    public static SomeIpSdOptions fromFile(String fileName) throws IOException {
        return new SomeIpSdOptions(new ByteBufferKaitaiStream(fileName));
    }
    public SomeIpSdOptions() {
        this(null, null, null);
    }

    public SomeIpSdOptions(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIpSdOptions(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SomeIpSdOptions(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SomeIpSdOptions _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.entries = new ArrayList<SdOption>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                SdOption _t_entries = new SdOption(this._io, this, _root);
                try {
                    _t_entries._read();
                } finally {
                    this.entries.add(_t_entries);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.entries.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
            this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.entries.size(); i++) {
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class SdOption extends KaitaiStruct.ReadWrite {
        public static SdOption fromFile(String fileName) throws IOException {
            return new SdOption(new ByteBufferKaitaiStream(fileName));
        }

        public enum OptionTypes {
            CONFIGURATION_OPTION(1),
            LOAD_BALANCING_OPTION(2),
            IPV4_ENDPOINT_OPTION(4),
            IPV6_ENDPOINT_OPTION(6),
            IPV4_MULTICAST_OPTION(20),
            IPV6_MULTICAST_OPTION(22),
            IPV4_SD_ENDPOINT_OPTION(36),
            IPV6_SD_ENDPOINT_OPTION(38);

            private final long id;
            OptionTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, OptionTypes> byId = new HashMap<Long, OptionTypes>(8);
            static {
                for (OptionTypes e : OptionTypes.values())
                    byId.put(e.id(), e);
            }
            public static OptionTypes byId(long id) { return byId.get(id); }
        }
        public SdOption() {
            this(null, null, null);
        }

        public SdOption(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SdOption(KaitaiStream _io, SomeIpSdOptions _parent) {
            this(_io, _parent, null);
        }

        public SdOption(KaitaiStream _io, SomeIpSdOptions _parent, SomeIpSdOptions _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new SdOptionHeader(this._io, this, _root);
            this.header._read();
            {
                OptionTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case CONFIGURATION_OPTION: {
                        this.content = new SdConfigurationOption(this._io, this, _root);
                        ((SdConfigurationOption) (this.content))._read();
                        break;
                    }
                    case IPV4_ENDPOINT_OPTION: {
                        this.content = new SdIpv4EndpointOption(this._io, this, _root);
                        ((SdIpv4EndpointOption) (this.content))._read();
                        break;
                    }
                    case IPV4_MULTICAST_OPTION: {
                        this.content = new SdIpv4MulticastOption(this._io, this, _root);
                        ((SdIpv4MulticastOption) (this.content))._read();
                        break;
                    }
                    case IPV4_SD_ENDPOINT_OPTION: {
                        this.content = new SdIpv4SdEndpointOption(this._io, this, _root);
                        ((SdIpv4SdEndpointOption) (this.content))._read();
                        break;
                    }
                    case IPV6_ENDPOINT_OPTION: {
                        this.content = new SdIpv6EndpointOption(this._io, this, _root);
                        ((SdIpv6EndpointOption) (this.content))._read();
                        break;
                    }
                    case IPV6_MULTICAST_OPTION: {
                        this.content = new SdIpv6MulticastOption(this._io, this, _root);
                        ((SdIpv6MulticastOption) (this.content))._read();
                        break;
                    }
                    case IPV6_SD_ENDPOINT_OPTION: {
                        this.content = new SdIpv6SdEndpointOption(this._io, this, _root);
                        ((SdIpv6SdEndpointOption) (this.content))._read();
                        break;
                    }
                    case LOAD_BALANCING_OPTION: {
                        this.content = new SdLoadBalancingOption(this._io, this, _root);
                        ((SdLoadBalancingOption) (this.content))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            {
                OptionTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case CONFIGURATION_OPTION: {
                        ((SdConfigurationOption) (this.content))._fetchInstances();
                        break;
                    }
                    case IPV4_ENDPOINT_OPTION: {
                        ((SdIpv4EndpointOption) (this.content))._fetchInstances();
                        break;
                    }
                    case IPV4_MULTICAST_OPTION: {
                        ((SdIpv4MulticastOption) (this.content))._fetchInstances();
                        break;
                    }
                    case IPV4_SD_ENDPOINT_OPTION: {
                        ((SdIpv4SdEndpointOption) (this.content))._fetchInstances();
                        break;
                    }
                    case IPV6_ENDPOINT_OPTION: {
                        ((SdIpv6EndpointOption) (this.content))._fetchInstances();
                        break;
                    }
                    case IPV6_MULTICAST_OPTION: {
                        ((SdIpv6MulticastOption) (this.content))._fetchInstances();
                        break;
                    }
                    case IPV6_SD_ENDPOINT_OPTION: {
                        ((SdIpv6SdEndpointOption) (this.content))._fetchInstances();
                        break;
                    }
                    case LOAD_BALANCING_OPTION: {
                        ((SdLoadBalancingOption) (this.content))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            {
                OptionTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case CONFIGURATION_OPTION: {
                        ((SdConfigurationOption) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case IPV4_ENDPOINT_OPTION: {
                        ((SdIpv4EndpointOption) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case IPV4_MULTICAST_OPTION: {
                        ((SdIpv4MulticastOption) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case IPV4_SD_ENDPOINT_OPTION: {
                        ((SdIpv4SdEndpointOption) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case IPV6_ENDPOINT_OPTION: {
                        ((SdIpv6EndpointOption) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case IPV6_MULTICAST_OPTION: {
                        ((SdIpv6MulticastOption) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case IPV6_SD_ENDPOINT_OPTION: {
                        ((SdIpv6SdEndpointOption) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case LOAD_BALANCING_OPTION: {
                        ((SdLoadBalancingOption) (this.content))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            {
                OptionTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case CONFIGURATION_OPTION: {
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdConfigurationOption) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdOptions.SdOption.SdConfigurationOption) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdConfigurationOption) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdOptions.SdOption.SdConfigurationOption) (this.content))._parent());
                        break;
                    }
                    case IPV4_ENDPOINT_OPTION: {
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv4EndpointOption) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdOptions.SdOption.SdIpv4EndpointOption) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv4EndpointOption) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdOptions.SdOption.SdIpv4EndpointOption) (this.content))._parent());
                        break;
                    }
                    case IPV4_MULTICAST_OPTION: {
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv4MulticastOption) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdOptions.SdOption.SdIpv4MulticastOption) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv4MulticastOption) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdOptions.SdOption.SdIpv4MulticastOption) (this.content))._parent());
                        break;
                    }
                    case IPV4_SD_ENDPOINT_OPTION: {
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption) (this.content))._parent());
                        break;
                    }
                    case IPV6_ENDPOINT_OPTION: {
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv6EndpointOption) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdOptions.SdOption.SdIpv6EndpointOption) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv6EndpointOption) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdOptions.SdOption.SdIpv6EndpointOption) (this.content))._parent());
                        break;
                    }
                    case IPV6_MULTICAST_OPTION: {
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv6MulticastOption) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdOptions.SdOption.SdIpv6MulticastOption) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv6MulticastOption) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdOptions.SdOption.SdIpv6MulticastOption) (this.content))._parent());
                        break;
                    }
                    case IPV6_SD_ENDPOINT_OPTION: {
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption) (this.content))._parent());
                        break;
                    }
                    case LOAD_BALANCING_OPTION: {
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdLoadBalancingOption) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((SomeIpSdOptions.SdOption.SdLoadBalancingOption) (this.content))._root());
                        if (!Objects.equals(((SomeIpSdOptions.SdOption.SdLoadBalancingOption) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((SomeIpSdOptions.SdOption.SdLoadBalancingOption) (this.content))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        public static class SdConfigKvPair extends KaitaiStruct.ReadWrite {
            public static SdConfigKvPair fromFile(String fileName) throws IOException {
                return new SdConfigKvPair(new ByteBufferKaitaiStream(fileName));
            }
            public SdConfigKvPair() {
                this(null, null, null);
            }

            public SdConfigKvPair(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdConfigKvPair(KaitaiStream _io, SomeIpSdOptions.SdOption.SdConfigString _parent) {
                this(_io, _parent, null);
            }

            public SdConfigKvPair(KaitaiStream _io, SomeIpSdOptions.SdOption.SdConfigString _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.key = new String(this._io.readBytesTerm((byte) 61, false, true, true), StandardCharsets.US_ASCII);
                this.value = new String(this._io.readBytesFull(), StandardCharsets.US_ASCII);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes((this.key).getBytes(Charset.forName("ASCII")));
                this._io.writeU1(61);
                this._io.writeBytes((this.value).getBytes(Charset.forName("ASCII")));
                if (!(this._io.isEof()))
                    throw new ConsistencyError("value", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                if (KaitaiStream.byteArrayIndexOf((this.key).getBytes(Charset.forName("ASCII")), ((byte) 61)) != -1)
                    throw new ConsistencyError("key", -1, KaitaiStream.byteArrayIndexOf((this.key).getBytes(Charset.forName("ASCII")), ((byte) 61)));
                _dirty = false;
            }
            private String key;
            private String value;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption.SdConfigString _parent;
            public String key() { return key; }
            public void setKey(String _v) { _dirty = true; key = _v; }
            public String value() { return value; }
            public void setValue(String _v) { _dirty = true; value = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption.SdConfigString _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption.SdConfigString _v) { _dirty = true; _parent = _v; }
        }
        public static class SdConfigString extends KaitaiStruct.ReadWrite {
            public static SdConfigString fromFile(String fileName) throws IOException {
                return new SdConfigString(new ByteBufferKaitaiStream(fileName));
            }
            public SdConfigString() {
                this(null, null, null);
            }

            public SdConfigString(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdConfigString(KaitaiStream _io, SomeIpSdOptions.SdOption.SdConfigStringsContainer _parent) {
                this(_io, _parent, null);
            }

            public SdConfigString(KaitaiStream _io, SomeIpSdOptions.SdOption.SdConfigStringsContainer _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.length = this._io.readU1();
                if (length() != 0) {
                    this._raw_config = this._io.readBytes(length());
                    KaitaiStream _io__raw_config = new ByteBufferKaitaiStream(this._raw_config);
                    this.config = new SdConfigKvPair(_io__raw_config, this, _root);
                    this.config._read();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (length() != 0) {
                    this.config._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.length);
                if (length() != 0) {
                    final KaitaiStream _io__raw_config = new ByteBufferKaitaiStream(length());
                    this._io.addChildStream(_io__raw_config);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (length()));
                        final SdConfigString _this = this;
                        _io__raw_config.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_config = _io__raw_config.toByteArray();
                                if (_this._raw_config.length != length())
                                    throw new ConsistencyError("raw(config)", length(), _this._raw_config.length);
                                parent.writeBytes(_this._raw_config);
                            }
                        });
                    }
                    this.config._write_Seq(_io__raw_config);
                }
            }

            public void _check() {
                if (length() != 0) {
                    if (!Objects.equals(this.config._root(), _root()))
                        throw new ConsistencyError("config", _root(), this.config._root());
                    if (!Objects.equals(this.config._parent(), this))
                        throw new ConsistencyError("config", this, this.config._parent());
                }
                _dirty = false;
            }
            private int length;
            private SdConfigKvPair config;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption.SdConfigStringsContainer _parent;
            private byte[] _raw_config;
            public int length() { return length; }
            public void setLength(int _v) { _dirty = true; length = _v; }
            public SdConfigKvPair config() { return config; }
            public void setConfig(SdConfigKvPair _v) { _dirty = true; config = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption.SdConfigStringsContainer _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption.SdConfigStringsContainer _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_config() { return _raw_config; }
            public void set_raw_Config(byte[] _v) { _dirty = true; _raw_config = _v; }
        }
        public static class SdConfigStringsContainer extends KaitaiStruct.ReadWrite {
            public static SdConfigStringsContainer fromFile(String fileName) throws IOException {
                return new SdConfigStringsContainer(new ByteBufferKaitaiStream(fileName));
            }
            public SdConfigStringsContainer() {
                this(null, null, null);
            }

            public SdConfigStringsContainer(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdConfigStringsContainer(KaitaiStream _io, SomeIpSdOptions.SdOption.SdConfigurationOption _parent) {
                this(_io, _parent, null);
            }

            public SdConfigStringsContainer(KaitaiStream _io, SomeIpSdOptions.SdOption.SdConfigurationOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.configStrings = new ArrayList<SdConfigString>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        SdConfigString _t_configStrings = new SdConfigString(this._io, this, _root);
                        try {
                            _t_configStrings._read();
                        } finally {
                            this.configStrings.add(_t_configStrings);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.configStrings.size(); i++) {
                    this.configStrings.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                for (int i = 0; i < this.configStrings.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("config_strings", 0, this._io.size() - this._io.pos());
                    this.configStrings.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("config_strings", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.configStrings.size(); i++) {
                    if (!Objects.equals(this.configStrings.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("config_strings", _root(), this.configStrings.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.configStrings.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("config_strings", this, this.configStrings.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private List<SdConfigString> configStrings;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption.SdConfigurationOption _parent;
            public List<SdConfigString> configStrings() { return configStrings; }
            public void setConfigStrings(List<SdConfigString> _v) { _dirty = true; configStrings = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption.SdConfigurationOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption.SdConfigurationOption _v) { _dirty = true; _parent = _v; }
        }
        public static class SdConfigurationOption extends KaitaiStruct.ReadWrite {
            public static SdConfigurationOption fromFile(String fileName) throws IOException {
                return new SdConfigurationOption(new ByteBufferKaitaiStream(fileName));
            }
            public SdConfigurationOption() {
                this(null, null, null);
            }

            public SdConfigurationOption(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdConfigurationOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdConfigurationOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this._raw_configurations = this._io.readBytes(_parent().header().length() - 1);
                KaitaiStream _io__raw_configurations = new ByteBufferKaitaiStream(this._raw_configurations);
                this.configurations = new SdConfigStringsContainer(_io__raw_configurations, this, _root);
                this.configurations._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.configurations._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                final KaitaiStream _io__raw_configurations = new ByteBufferKaitaiStream(_parent().header().length() - 1);
                this._io.addChildStream(_io__raw_configurations);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (_parent().header().length() - 1));
                    final SdConfigurationOption _this = this;
                    _io__raw_configurations.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_configurations = _io__raw_configurations.toByteArray();
                            if (_this._raw_configurations.length != _parent().header().length() - 1)
                                throw new ConsistencyError("raw(configurations)", _parent().header().length() - 1, _this._raw_configurations.length);
                            parent.writeBytes(_this._raw_configurations);
                        }
                    });
                }
                this.configurations._write_Seq(_io__raw_configurations);
            }

            public void _check() {
                if (!Objects.equals(this.configurations._root(), _root()))
                    throw new ConsistencyError("configurations", _root(), this.configurations._root());
                if (!Objects.equals(this.configurations._parent(), this))
                    throw new ConsistencyError("configurations", this, this.configurations._parent());
                _dirty = false;
            }
            private int reserved;
            private SdConfigStringsContainer configurations;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            private byte[] _raw_configurations;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public SdConfigStringsContainer configurations() { return configurations; }
            public void setConfigurations(SdConfigStringsContainer _v) { _dirty = true; configurations = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_configurations() { return _raw_configurations; }
            public void set_raw_Configurations(byte[] _v) { _dirty = true; _raw_configurations = _v; }
        }
        public static class SdIpv4EndpointOption extends KaitaiStruct.ReadWrite {
            public static SdIpv4EndpointOption fromFile(String fileName) throws IOException {
                return new SdIpv4EndpointOption(new ByteBufferKaitaiStream(fileName));
            }
            public SdIpv4EndpointOption() {
                this(null, null, null);
            }

            public SdIpv4EndpointOption(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdIpv4EndpointOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdIpv4EndpointOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(4);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                this._io.writeBytes(this.address);
                this._io.writeU1(this.reserved2);
                this._io.writeU1(this.l4Protocol);
                this._io.writeU2be(this.port);
            }

            public void _check() {
                if (this.address.length != 4)
                    throw new ConsistencyError("address", 4, this.address.length);
                _dirty = false;
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public byte[] address() { return address; }
            public void setAddress(byte[] _v) { _dirty = true; address = _v; }
            public int reserved2() { return reserved2; }
            public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
            public int l4Protocol() { return l4Protocol; }
            public void setL4Protocol(int _v) { _dirty = true; l4Protocol = _v; }
            public int port() { return port; }
            public void setPort(int _v) { _dirty = true; port = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
        }
        public static class SdIpv4MulticastOption extends KaitaiStruct.ReadWrite {
            public static SdIpv4MulticastOption fromFile(String fileName) throws IOException {
                return new SdIpv4MulticastOption(new ByteBufferKaitaiStream(fileName));
            }
            public SdIpv4MulticastOption() {
                this(null, null, null);
            }

            public SdIpv4MulticastOption(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdIpv4MulticastOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdIpv4MulticastOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(4);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                this._io.writeBytes(this.address);
                this._io.writeU1(this.reserved2);
                this._io.writeU1(this.l4Protocol);
                this._io.writeU2be(this.port);
            }

            public void _check() {
                if (this.address.length != 4)
                    throw new ConsistencyError("address", 4, this.address.length);
                _dirty = false;
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public byte[] address() { return address; }
            public void setAddress(byte[] _v) { _dirty = true; address = _v; }
            public int reserved2() { return reserved2; }
            public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
            public int l4Protocol() { return l4Protocol; }
            public void setL4Protocol(int _v) { _dirty = true; l4Protocol = _v; }
            public int port() { return port; }
            public void setPort(int _v) { _dirty = true; port = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
        }
        public static class SdIpv4SdEndpointOption extends KaitaiStruct.ReadWrite {
            public static SdIpv4SdEndpointOption fromFile(String fileName) throws IOException {
                return new SdIpv4SdEndpointOption(new ByteBufferKaitaiStream(fileName));
            }
            public SdIpv4SdEndpointOption() {
                this(null, null, null);
            }

            public SdIpv4SdEndpointOption(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdIpv4SdEndpointOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdIpv4SdEndpointOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(4);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                this._io.writeBytes(this.address);
                this._io.writeU1(this.reserved2);
                this._io.writeU1(this.l4Protocol);
                this._io.writeU2be(this.port);
            }

            public void _check() {
                if (this.address.length != 4)
                    throw new ConsistencyError("address", 4, this.address.length);
                _dirty = false;
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public byte[] address() { return address; }
            public void setAddress(byte[] _v) { _dirty = true; address = _v; }
            public int reserved2() { return reserved2; }
            public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
            public int l4Protocol() { return l4Protocol; }
            public void setL4Protocol(int _v) { _dirty = true; l4Protocol = _v; }
            public int port() { return port; }
            public void setPort(int _v) { _dirty = true; port = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
        }
        public static class SdIpv6EndpointOption extends KaitaiStruct.ReadWrite {
            public static SdIpv6EndpointOption fromFile(String fileName) throws IOException {
                return new SdIpv6EndpointOption(new ByteBufferKaitaiStream(fileName));
            }
            public SdIpv6EndpointOption() {
                this(null, null, null);
            }

            public SdIpv6EndpointOption(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdIpv6EndpointOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdIpv6EndpointOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(16);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                this._io.writeBytes(this.address);
                this._io.writeU1(this.reserved2);
                this._io.writeU1(this.l4Protocol);
                this._io.writeU2be(this.port);
            }

            public void _check() {
                if (this.address.length != 16)
                    throw new ConsistencyError("address", 16, this.address.length);
                _dirty = false;
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public byte[] address() { return address; }
            public void setAddress(byte[] _v) { _dirty = true; address = _v; }
            public int reserved2() { return reserved2; }
            public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
            public int l4Protocol() { return l4Protocol; }
            public void setL4Protocol(int _v) { _dirty = true; l4Protocol = _v; }
            public int port() { return port; }
            public void setPort(int _v) { _dirty = true; port = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
        }
        public static class SdIpv6MulticastOption extends KaitaiStruct.ReadWrite {
            public static SdIpv6MulticastOption fromFile(String fileName) throws IOException {
                return new SdIpv6MulticastOption(new ByteBufferKaitaiStream(fileName));
            }
            public SdIpv6MulticastOption() {
                this(null, null, null);
            }

            public SdIpv6MulticastOption(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdIpv6MulticastOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdIpv6MulticastOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(16);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                this._io.writeBytes(this.address);
                this._io.writeU1(this.reserved2);
                this._io.writeU1(this.l4Protocol);
                this._io.writeU2be(this.port);
            }

            public void _check() {
                if (this.address.length != 16)
                    throw new ConsistencyError("address", 16, this.address.length);
                _dirty = false;
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public byte[] address() { return address; }
            public void setAddress(byte[] _v) { _dirty = true; address = _v; }
            public int reserved2() { return reserved2; }
            public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
            public int l4Protocol() { return l4Protocol; }
            public void setL4Protocol(int _v) { _dirty = true; l4Protocol = _v; }
            public int port() { return port; }
            public void setPort(int _v) { _dirty = true; port = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
        }
        public static class SdIpv6SdEndpointOption extends KaitaiStruct.ReadWrite {
            public static SdIpv6SdEndpointOption fromFile(String fileName) throws IOException {
                return new SdIpv6SdEndpointOption(new ByteBufferKaitaiStream(fileName));
            }
            public SdIpv6SdEndpointOption() {
                this(null, null, null);
            }

            public SdIpv6SdEndpointOption(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdIpv6SdEndpointOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdIpv6SdEndpointOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(16);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                this._io.writeBytes(this.address);
                this._io.writeU1(this.reserved2);
                this._io.writeU1(this.l4Protocol);
                this._io.writeU2be(this.port);
            }

            public void _check() {
                if (this.address.length != 16)
                    throw new ConsistencyError("address", 16, this.address.length);
                _dirty = false;
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public byte[] address() { return address; }
            public void setAddress(byte[] _v) { _dirty = true; address = _v; }
            public int reserved2() { return reserved2; }
            public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
            public int l4Protocol() { return l4Protocol; }
            public void setL4Protocol(int _v) { _dirty = true; l4Protocol = _v; }
            public int port() { return port; }
            public void setPort(int _v) { _dirty = true; port = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
        }
        public static class SdLoadBalancingOption extends KaitaiStruct.ReadWrite {
            public static SdLoadBalancingOption fromFile(String fileName) throws IOException {
                return new SdLoadBalancingOption(new ByteBufferKaitaiStream(fileName));
            }
            public SdLoadBalancingOption() {
                this(null, null, null);
            }

            public SdLoadBalancingOption(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdLoadBalancingOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdLoadBalancingOption(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved = this._io.readU1();
                this.priority = this._io.readU2be();
                this.weight = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.reserved);
                this._io.writeU2be(this.priority);
                this._io.writeU2be(this.weight);
            }

            public void _check() {
                _dirty = false;
            }
            private int reserved;
            private int priority;
            private int weight;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public void setReserved(int _v) { _dirty = true; reserved = _v; }
            public int priority() { return priority; }
            public void setPriority(int _v) { _dirty = true; priority = _v; }
            public int weight() { return weight; }
            public void setWeight(int _v) { _dirty = true; weight = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
        }
        public static class SdOptionHeader extends KaitaiStruct.ReadWrite {
            public static SdOptionHeader fromFile(String fileName) throws IOException {
                return new SdOptionHeader(new ByteBufferKaitaiStream(fileName));
            }
            public SdOptionHeader() {
                this(null, null, null);
            }

            public SdOptionHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SdOptionHeader(KaitaiStream _io, SomeIpSdOptions.SdOption _parent) {
                this(_io, _parent, null);
            }

            public SdOptionHeader(KaitaiStream _io, SomeIpSdOptions.SdOption _parent, SomeIpSdOptions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.length = this._io.readU2be();
                this.type = SomeIpSdOptions.SdOption.OptionTypes.byId(this._io.readU1());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.length);
                this._io.writeU1(((Number) (this.type.id())).intValue());
            }

            public void _check() {
                _dirty = false;
            }
            private int length;
            private OptionTypes type;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int length() { return length; }
            public void setLength(int _v) { _dirty = true; length = _v; }
            public OptionTypes type() { return type; }
            public void setType(OptionTypes _v) { _dirty = true; type = _v; }
            public SomeIpSdOptions _root() { return _root; }
            public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public void set_parent(SomeIpSdOptions.SdOption _v) { _dirty = true; _parent = _v; }
        }
        private SdOptionHeader header;
        private KaitaiStruct.ReadWrite content;
        private SomeIpSdOptions _root;
        private SomeIpSdOptions _parent;
        public SdOptionHeader header() { return header; }
        public void setHeader(SdOptionHeader _v) { _dirty = true; header = _v; }
        public KaitaiStruct.ReadWrite content() { return content; }
        public void setContent(KaitaiStruct.ReadWrite _v) { _dirty = true; content = _v; }
        public SomeIpSdOptions _root() { return _root; }
        public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
        public SomeIpSdOptions _parent() { return _parent; }
        public void set_parent(SomeIpSdOptions _v) { _dirty = true; _parent = _v; }
    }
    private List<SdOption> entries;
    private SomeIpSdOptions _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<SdOption> entries() { return entries; }
    public void setEntries(List<SdOption> _v) { _dirty = true; entries = _v; }
    public SomeIpSdOptions _root() { return _root; }
    public void set_root(SomeIpSdOptions _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
