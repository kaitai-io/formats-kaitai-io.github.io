// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;


/**
 * FormatOptions are used to transport additional information to the entries.
 * This includes forinstance the information how a service instance is
 * reachable (IP-Address, TransportProtocol, Port Number).
 * @see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * -">section 4.1.2.4 Options Format</a>
 */
public class SomeIpSdOptions extends KaitaiStruct {
    public static SomeIpSdOptions fromFile(String fileName) throws IOException {
        return new SomeIpSdOptions(new ByteBufferKaitaiStream(fileName));
    }

    public SomeIpSdOptions(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIpSdOptions(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SomeIpSdOptions(KaitaiStream _io, KaitaiStruct _parent, SomeIpSdOptions _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.entries = new ArrayList<SdOption>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.entries.add(new SdOption(this._io, this, _root));
                i++;
            }
        }
    }
    public static class SdOption extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.header = new SdOptionHeader(this._io, this, _root);
            {
                OptionTypes on = header().type();
                if (on != null) {
                    switch (header().type()) {
                    case LOAD_BALANCING_OPTION: {
                        this.content = new SdLoadBalancingOption(this._io, this, _root);
                        break;
                    }
                    case CONFIGURATION_OPTION: {
                        this.content = new SdConfigurationOption(this._io, this, _root);
                        break;
                    }
                    case IPV4_SD_ENDPOINT_OPTION: {
                        this.content = new SdIpv4SdEndpointOption(this._io, this, _root);
                        break;
                    }
                    case IPV4_ENDPOINT_OPTION: {
                        this.content = new SdIpv4EndpointOption(this._io, this, _root);
                        break;
                    }
                    case IPV6_SD_ENDPOINT_OPTION: {
                        this.content = new SdIpv6SdEndpointOption(this._io, this, _root);
                        break;
                    }
                    case IPV4_MULTICAST_OPTION: {
                        this.content = new SdIpv4MulticastOption(this._io, this, _root);
                        break;
                    }
                    case IPV6_ENDPOINT_OPTION: {
                        this.content = new SdIpv6EndpointOption(this._io, this, _root);
                        break;
                    }
                    case IPV6_MULTICAST_OPTION: {
                        this.content = new SdIpv6MulticastOption(this._io, this, _root);
                        break;
                    }
                    }
                }
            }
        }
        public static class SdOptionHeader extends KaitaiStruct {
            public static SdOptionHeader fromFile(String fileName) throws IOException {
                return new SdOptionHeader(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.length = this._io.readU2be();
                this.type = SomeIpSdOptions.SdOption.OptionTypes.byId(this._io.readU1());
            }
            private int length;
            private OptionTypes type;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int length() { return length; }
            public OptionTypes type() { return type; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
        }
        public static class SdConfigString extends KaitaiStruct {
            public static SdConfigString fromFile(String fileName) throws IOException {
                return new SdConfigString(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.length = this._io.readU1();
                if (length() != 0) {
                    this._raw_config = this._io.readBytes(length());
                    KaitaiStream _io__raw_config = new ByteBufferKaitaiStream(_raw_config);
                    this.config = new SdConfigKvPair(_io__raw_config, this, _root);
                }
            }
            private int length;
            private SdConfigKvPair config;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption.SdConfigStringsContainer _parent;
            private byte[] _raw_config;
            public int length() { return length; }
            public SdConfigKvPair config() { return config; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption.SdConfigStringsContainer _parent() { return _parent; }
            public byte[] _raw_config() { return _raw_config; }
        }
        public static class SdConfigStringsContainer extends KaitaiStruct {
            public static SdConfigStringsContainer fromFile(String fileName) throws IOException {
                return new SdConfigStringsContainer(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.configStrings = new ArrayList<SdConfigString>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.configStrings.add(new SdConfigString(this._io, this, _root));
                        i++;
                    }
                }
            }
            private ArrayList<SdConfigString> configStrings;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption.SdConfigurationOption _parent;
            public ArrayList<SdConfigString> configStrings() { return configStrings; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption.SdConfigurationOption _parent() { return _parent; }
        }
        public static class SdConfigurationOption extends KaitaiStruct {
            public static SdConfigurationOption fromFile(String fileName) throws IOException {
                return new SdConfigurationOption(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this._raw_configurations = this._io.readBytes((_parent().header().length() - 1));
                KaitaiStream _io__raw_configurations = new ByteBufferKaitaiStream(_raw_configurations);
                this.configurations = new SdConfigStringsContainer(_io__raw_configurations, this, _root);
            }
            private int reserved;
            private SdConfigStringsContainer configurations;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            private byte[] _raw_configurations;
            public int reserved() { return reserved; }
            public SdConfigStringsContainer configurations() { return configurations; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
            public byte[] _raw_configurations() { return _raw_configurations; }
        }
        public static class SdIpv4MulticastOption extends KaitaiStruct {
            public static SdIpv4MulticastOption fromFile(String fileName) throws IOException {
                return new SdIpv4MulticastOption(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(4);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public byte[] address() { return address; }
            public int reserved2() { return reserved2; }
            public int l4Protocol() { return l4Protocol; }
            public int port() { return port; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
        }
        public static class SdIpv4SdEndpointOption extends KaitaiStruct {
            public static SdIpv4SdEndpointOption fromFile(String fileName) throws IOException {
                return new SdIpv4SdEndpointOption(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(4);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public byte[] address() { return address; }
            public int reserved2() { return reserved2; }
            public int l4Protocol() { return l4Protocol; }
            public int port() { return port; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
        }
        public static class SdIpv6MulticastOption extends KaitaiStruct {
            public static SdIpv6MulticastOption fromFile(String fileName) throws IOException {
                return new SdIpv6MulticastOption(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(16);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public byte[] address() { return address; }
            public int reserved2() { return reserved2; }
            public int l4Protocol() { return l4Protocol; }
            public int port() { return port; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
        }
        public static class SdConfigKvPair extends KaitaiStruct {
            public static SdConfigKvPair fromFile(String fileName) throws IOException {
                return new SdConfigKvPair(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.key = new String(this._io.readBytesTerm(61, false, true, true), Charset.forName("ASCII"));
                this.value = new String(this._io.readBytesFull(), Charset.forName("ASCII"));
            }
            private String key;
            private String value;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption.SdConfigString _parent;
            public String key() { return key; }
            public String value() { return value; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption.SdConfigString _parent() { return _parent; }
        }
        public static class SdIpv6SdEndpointOption extends KaitaiStruct {
            public static SdIpv6SdEndpointOption fromFile(String fileName) throws IOException {
                return new SdIpv6SdEndpointOption(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(16);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public byte[] address() { return address; }
            public int reserved2() { return reserved2; }
            public int l4Protocol() { return l4Protocol; }
            public int port() { return port; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
        }
        public static class SdIpv4EndpointOption extends KaitaiStruct {
            public static SdIpv4EndpointOption fromFile(String fileName) throws IOException {
                return new SdIpv4EndpointOption(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(4);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public byte[] address() { return address; }
            public int reserved2() { return reserved2; }
            public int l4Protocol() { return l4Protocol; }
            public int port() { return port; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
        }
        public static class SdIpv6EndpointOption extends KaitaiStruct {
            public static SdIpv6EndpointOption fromFile(String fileName) throws IOException {
                return new SdIpv6EndpointOption(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this.address = this._io.readBytes(16);
                this.reserved2 = this._io.readU1();
                this.l4Protocol = this._io.readU1();
                this.port = this._io.readU2be();
            }
            private int reserved;
            private byte[] address;
            private int reserved2;
            private int l4Protocol;
            private int port;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public byte[] address() { return address; }
            public int reserved2() { return reserved2; }
            public int l4Protocol() { return l4Protocol; }
            public int port() { return port; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
        }
        public static class SdLoadBalancingOption extends KaitaiStruct {
            public static SdLoadBalancingOption fromFile(String fileName) throws IOException {
                return new SdLoadBalancingOption(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU1();
                this.priority = this._io.readU2be();
                this.weight = this._io.readU2be();
            }
            private int reserved;
            private int priority;
            private int weight;
            private SomeIpSdOptions _root;
            private SomeIpSdOptions.SdOption _parent;
            public int reserved() { return reserved; }
            public int priority() { return priority; }
            public int weight() { return weight; }
            public SomeIpSdOptions _root() { return _root; }
            public SomeIpSdOptions.SdOption _parent() { return _parent; }
        }
        private SdOptionHeader header;
        private KaitaiStruct content;
        private SomeIpSdOptions _root;
        private SomeIpSdOptions _parent;
        public SdOptionHeader header() { return header; }
        public KaitaiStruct content() { return content; }
        public SomeIpSdOptions _root() { return _root; }
        public SomeIpSdOptions _parent() { return _parent; }
    }
    private ArrayList<SdOption> entries;
    private SomeIpSdOptions _root;
    private KaitaiStruct _parent;
    public ArrayList<SdOption> entries() { return entries; }
    public SomeIpSdOptions _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
