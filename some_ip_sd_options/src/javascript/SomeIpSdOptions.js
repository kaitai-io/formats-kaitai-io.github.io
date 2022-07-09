// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.SomeIpSdOptions = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * FormatOptions are used to transport additional information to the entries.
 * This includes forinstance the information how a service instance is
 * reachable (IP-Address, TransportProtocol, Port Number).
 * @see {@link https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * -|section 4.1.2.4 Options Format}
 */

var SomeIpSdOptions = (function() {
  function SomeIpSdOptions(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SomeIpSdOptions.prototype._read = function() {
    this.entries = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.entries.push(new SdOption(this._io, this, this._root));
      i++;
    }
  }

  var SdOption = SomeIpSdOptions.SdOption = (function() {
    SdOption.OptionTypes = Object.freeze({
      CONFIGURATION_OPTION: 1,
      LOAD_BALANCING_OPTION: 2,
      IPV4_ENDPOINT_OPTION: 4,
      IPV6_ENDPOINT_OPTION: 6,
      IPV4_MULTICAST_OPTION: 20,
      IPV6_MULTICAST_OPTION: 22,
      IPV4_SD_ENDPOINT_OPTION: 36,
      IPV6_SD_ENDPOINT_OPTION: 38,

      1: "CONFIGURATION_OPTION",
      2: "LOAD_BALANCING_OPTION",
      4: "IPV4_ENDPOINT_OPTION",
      6: "IPV6_ENDPOINT_OPTION",
      20: "IPV4_MULTICAST_OPTION",
      22: "IPV6_MULTICAST_OPTION",
      36: "IPV4_SD_ENDPOINT_OPTION",
      38: "IPV6_SD_ENDPOINT_OPTION",
    });

    function SdOption(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SdOption.prototype._read = function() {
      this.header = new SdOptionHeader(this._io, this, this._root);
      switch (this.header.type) {
      case SomeIpSdOptions.SdOption.OptionTypes.LOAD_BALANCING_OPTION:
        this.content = new SdLoadBalancingOption(this._io, this, this._root);
        break;
      case SomeIpSdOptions.SdOption.OptionTypes.CONFIGURATION_OPTION:
        this.content = new SdConfigurationOption(this._io, this, this._root);
        break;
      case SomeIpSdOptions.SdOption.OptionTypes.IPV4_SD_ENDPOINT_OPTION:
        this.content = new SdIpv4SdEndpointOption(this._io, this, this._root);
        break;
      case SomeIpSdOptions.SdOption.OptionTypes.IPV4_ENDPOINT_OPTION:
        this.content = new SdIpv4EndpointOption(this._io, this, this._root);
        break;
      case SomeIpSdOptions.SdOption.OptionTypes.IPV6_SD_ENDPOINT_OPTION:
        this.content = new SdIpv6SdEndpointOption(this._io, this, this._root);
        break;
      case SomeIpSdOptions.SdOption.OptionTypes.IPV4_MULTICAST_OPTION:
        this.content = new SdIpv4MulticastOption(this._io, this, this._root);
        break;
      case SomeIpSdOptions.SdOption.OptionTypes.IPV6_ENDPOINT_OPTION:
        this.content = new SdIpv6EndpointOption(this._io, this, this._root);
        break;
      case SomeIpSdOptions.SdOption.OptionTypes.IPV6_MULTICAST_OPTION:
        this.content = new SdIpv6MulticastOption(this._io, this, this._root);
        break;
      }
    }

    var SdOptionHeader = SdOption.SdOptionHeader = (function() {
      function SdOptionHeader(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdOptionHeader.prototype._read = function() {
        this.length = this._io.readU2be();
        this.type = this._io.readU1();
      }

      return SdOptionHeader;
    })();

    var SdConfigString = SdOption.SdConfigString = (function() {
      function SdConfigString(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdConfigString.prototype._read = function() {
        this.length = this._io.readU1();
        if (this.length != 0) {
          this._raw_config = this._io.readBytes(this.length);
          var _io__raw_config = new KaitaiStream(this._raw_config);
          this.config = new SdConfigKvPair(_io__raw_config, this, this._root);
        }
      }

      return SdConfigString;
    })();

    var SdConfigStringsContainer = SdOption.SdConfigStringsContainer = (function() {
      function SdConfigStringsContainer(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdConfigStringsContainer.prototype._read = function() {
        this.configStrings = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.configStrings.push(new SdConfigString(this._io, this, this._root));
          i++;
        }
      }

      return SdConfigStringsContainer;
    })();

    var SdConfigurationOption = SdOption.SdConfigurationOption = (function() {
      function SdConfigurationOption(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdConfigurationOption.prototype._read = function() {
        this.reserved = this._io.readU1();
        this._raw_configurations = this._io.readBytes((this._parent.header.length - 1));
        var _io__raw_configurations = new KaitaiStream(this._raw_configurations);
        this.configurations = new SdConfigStringsContainer(_io__raw_configurations, this, this._root);
      }

      return SdConfigurationOption;
    })();

    var SdIpv4MulticastOption = SdOption.SdIpv4MulticastOption = (function() {
      function SdIpv4MulticastOption(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdIpv4MulticastOption.prototype._read = function() {
        this.reserved = this._io.readU1();
        this.address = this._io.readBytes(4);
        this.reserved2 = this._io.readU1();
        this.l4Protocol = this._io.readU1();
        this.port = this._io.readU2be();
      }

      return SdIpv4MulticastOption;
    })();

    var SdIpv4SdEndpointOption = SdOption.SdIpv4SdEndpointOption = (function() {
      function SdIpv4SdEndpointOption(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdIpv4SdEndpointOption.prototype._read = function() {
        this.reserved = this._io.readU1();
        this.address = this._io.readBytes(4);
        this.reserved2 = this._io.readU1();
        this.l4Protocol = this._io.readU1();
        this.port = this._io.readU2be();
      }

      return SdIpv4SdEndpointOption;
    })();

    var SdIpv6MulticastOption = SdOption.SdIpv6MulticastOption = (function() {
      function SdIpv6MulticastOption(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdIpv6MulticastOption.prototype._read = function() {
        this.reserved = this._io.readU1();
        this.address = this._io.readBytes(16);
        this.reserved2 = this._io.readU1();
        this.l4Protocol = this._io.readU1();
        this.port = this._io.readU2be();
      }

      return SdIpv6MulticastOption;
    })();

    var SdConfigKvPair = SdOption.SdConfigKvPair = (function() {
      function SdConfigKvPair(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdConfigKvPair.prototype._read = function() {
        this.key = KaitaiStream.bytesToStr(this._io.readBytesTerm(61, false, true, true), "ASCII");
        this.value = KaitaiStream.bytesToStr(this._io.readBytesFull(), "ASCII");
      }

      return SdConfigKvPair;
    })();

    var SdIpv6SdEndpointOption = SdOption.SdIpv6SdEndpointOption = (function() {
      function SdIpv6SdEndpointOption(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdIpv6SdEndpointOption.prototype._read = function() {
        this.reserved = this._io.readU1();
        this.address = this._io.readBytes(16);
        this.reserved2 = this._io.readU1();
        this.l4Protocol = this._io.readU1();
        this.port = this._io.readU2be();
      }

      return SdIpv6SdEndpointOption;
    })();

    var SdIpv4EndpointOption = SdOption.SdIpv4EndpointOption = (function() {
      function SdIpv4EndpointOption(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdIpv4EndpointOption.prototype._read = function() {
        this.reserved = this._io.readU1();
        this.address = this._io.readBytes(4);
        this.reserved2 = this._io.readU1();
        this.l4Protocol = this._io.readU1();
        this.port = this._io.readU2be();
      }

      return SdIpv4EndpointOption;
    })();

    var SdIpv6EndpointOption = SdOption.SdIpv6EndpointOption = (function() {
      function SdIpv6EndpointOption(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdIpv6EndpointOption.prototype._read = function() {
        this.reserved = this._io.readU1();
        this.address = this._io.readBytes(16);
        this.reserved2 = this._io.readU1();
        this.l4Protocol = this._io.readU1();
        this.port = this._io.readU2be();
      }

      return SdIpv6EndpointOption;
    })();

    var SdLoadBalancingOption = SdOption.SdLoadBalancingOption = (function() {
      function SdLoadBalancingOption(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdLoadBalancingOption.prototype._read = function() {
        this.reserved = this._io.readU1();
        this.priority = this._io.readU2be();
        this.weight = this._io.readU2be();
      }

      return SdLoadBalancingOption;
    })();

    return SdOption;
  })();

  return SomeIpSdOptions;
})();
return SomeIpSdOptions;
}));
