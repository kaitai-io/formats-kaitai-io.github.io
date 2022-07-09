// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './Ipv4Packet', './Ipv6Packet'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./Ipv4Packet'), require('./Ipv6Packet'));
  } else {
    root.EthernetFrame = factory(root.KaitaiStream, root.Ipv4Packet, root.Ipv6Packet);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, Ipv4Packet, Ipv6Packet) {
/**
 * Ethernet frame is a OSI data link layer (layer 2) protocol data unit
 * for Ethernet networks. In practice, many other networks and/or
 * in-file dumps adopted the same format for encapsulation purposes.
 * @see {@link https://ieeexplore.ieee.org/document/7428776|Source}
 */

var EthernetFrame = (function() {
  EthernetFrame.EtherTypeEnum = Object.freeze({
    IPV4: 2048,
    X_75_INTERNET: 2049,
    NBS_INTERNET: 2050,
    ECMA_INTERNET: 2051,
    CHAOSNET: 2052,
    X_25_LEVEL_3: 2053,
    ARP: 2054,
    IEEE_802_1Q_TPID: 33024,
    IPV6: 34525,

    2048: "IPV4",
    2049: "X_75_INTERNET",
    2050: "NBS_INTERNET",
    2051: "ECMA_INTERNET",
    2052: "CHAOSNET",
    2053: "X_25_LEVEL_3",
    2054: "ARP",
    33024: "IEEE_802_1Q_TPID",
    34525: "IPV6",
  });

  function EthernetFrame(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  EthernetFrame.prototype._read = function() {
    this.dstMac = this._io.readBytes(6);
    this.srcMac = this._io.readBytes(6);
    this.etherType1 = this._io.readU2be();
    if (this.etherType1 == EthernetFrame.EtherTypeEnum.IEEE_802_1Q_TPID) {
      this.tci = new TagControlInfo(this._io, this, this._root);
    }
    if (this.etherType1 == EthernetFrame.EtherTypeEnum.IEEE_802_1Q_TPID) {
      this.etherType2 = this._io.readU2be();
    }
    switch (this.etherType) {
    case EthernetFrame.EtherTypeEnum.IPV4:
      this._raw_body = this._io.readBytesFull();
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new Ipv4Packet(_io__raw_body, this, null);
      break;
    case EthernetFrame.EtherTypeEnum.IPV6:
      this._raw_body = this._io.readBytesFull();
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new Ipv6Packet(_io__raw_body, this, null);
      break;
    default:
      this.body = this._io.readBytesFull();
      break;
    }
  }

  /**
   * Tag Control Information (TCI) is an extension of IEEE 802.1Q to
   * support VLANs on normal IEEE 802.3 Ethernet network.
   */

  var TagControlInfo = EthernetFrame.TagControlInfo = (function() {
    function TagControlInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TagControlInfo.prototype._read = function() {
      this.priority = this._io.readBitsIntBe(3);
      this.dropEligible = this._io.readBitsIntBe(1) != 0;
      this.vlanId = this._io.readBitsIntBe(12);
    }

    /**
     * Priority Code Point (PCP) is used to specify priority for
     * different kinds of traffic.
     */

    /**
     * Drop Eligible Indicator (DEI) specifies if frame is eligible
     * to dropping while congestion is detected for certain classes
     * of traffic.
     */

    /**
     * VLAN Identifier (VID) specifies which VLAN this frame
     * belongs to.
     */

    return TagControlInfo;
  })();

  /**
   * Ether type can be specied in several places in the frame. If
   * first location bears special marker (0x8100), then it is not the
   * real ether frame yet, an additional payload (`tci`) is expected
   * and real ether type is upcoming next.
   */
  Object.defineProperty(EthernetFrame.prototype, 'etherType', {
    get: function() {
      if (this._m_etherType !== undefined)
        return this._m_etherType;
      this._m_etherType = (this.etherType1 == EthernetFrame.EtherTypeEnum.IEEE_802_1Q_TPID ? this.etherType2 : this.etherType1);
      return this._m_etherType;
    }
  });

  /**
   * Destination MAC address
   */

  /**
   * Source MAC address
   */

  /**
   * Either ether type or TPID if it is a IEEE 802.1Q frame
   */

  return EthernetFrame;
})();
return EthernetFrame;
}));
