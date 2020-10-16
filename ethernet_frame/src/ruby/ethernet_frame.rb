# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Ethernet frame is a OSI data link layer (layer 2) protocol data unit
# for Ethernet networks. In practice, many other networks and/or
# in-file dumps adopted the same format for encapsulation purposes.
# @see https://ieeexplore.ieee.org/document/7428776 Source
class EthernetFrame < Kaitai::Struct::Struct

  ETHER_TYPE_ENUM = {
    2048 => :ether_type_enum_ipv4,
    2049 => :ether_type_enum_x_75_internet,
    2050 => :ether_type_enum_nbs_internet,
    2051 => :ether_type_enum_ecma_internet,
    2052 => :ether_type_enum_chaosnet,
    2053 => :ether_type_enum_x_25_level_3,
    2054 => :ether_type_enum_arp,
    33024 => :ether_type_enum_ieee_802_1q_tpid,
    34525 => :ether_type_enum_ipv6,
  }
  I__ETHER_TYPE_ENUM = ETHER_TYPE_ENUM.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @dst_mac = @_io.read_bytes(6)
    @src_mac = @_io.read_bytes(6)
    @ether_type_1 = Kaitai::Struct::Stream::resolve_enum(ETHER_TYPE_ENUM, @_io.read_u2be)
    if ether_type_1 == :ether_type_enum_ieee_802_1q_tpid
      @tci = TagControlInfo.new(@_io, self, @_root)
    end
    if ether_type_1 == :ether_type_enum_ieee_802_1q_tpid
      @ether_type_2 = Kaitai::Struct::Stream::resolve_enum(ETHER_TYPE_ENUM, @_io.read_u2be)
    end
    case ether_type
    when :ether_type_enum_ipv4
      @_raw_body = @_io.read_bytes_full
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = Ipv4Packet.new(_io__raw_body)
    when :ether_type_enum_ipv6
      @_raw_body = @_io.read_bytes_full
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = Ipv6Packet.new(_io__raw_body)
    else
      @body = @_io.read_bytes_full
    end
    self
  end

  ##
  # Tag Control Information (TCI) is an extension of IEEE 802.1Q to
  # support VLANs on normal IEEE 802.3 Ethernet network.
  class TagControlInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @priority = @_io.read_bits_int_be(3)
      @drop_eligible = @_io.read_bits_int_be(1) != 0
      @vlan_id = @_io.read_bits_int_be(12)
      self
    end

    ##
    # Priority Code Point (PCP) is used to specify priority for
    # different kinds of traffic.
    attr_reader :priority

    ##
    # Drop Eligible Indicator (DEI) specifies if frame is eligible
    # to dropping while congestion is detected for certain classes
    # of traffic.
    attr_reader :drop_eligible

    ##
    # VLAN Identifier (VID) specifies which VLAN this frame
    # belongs to.
    attr_reader :vlan_id
  end

  ##
  # Ether type can be specied in several places in the frame. If
  # first location bears special marker (0x8100), then it is not the
  # real ether frame yet, an additional payload (`tci`) is expected
  # and real ether type is upcoming next.
  def ether_type
    return @ether_type unless @ether_type.nil?
    @ether_type = (ether_type_1 == :ether_type_enum_ieee_802_1q_tpid ? ether_type_2 : ether_type_1)
    @ether_type
  end

  ##
  # Destination MAC address
  attr_reader :dst_mac

  ##
  # Source MAC address
  attr_reader :src_mac

  ##
  # Either ether type or TPID if it is a IEEE 802.1Q frame
  attr_reader :ether_type_1
  attr_reader :tci
  attr_reader :ether_type_2
  attr_reader :body
  attr_reader :_raw_body
end
