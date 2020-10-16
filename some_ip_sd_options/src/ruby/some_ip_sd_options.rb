# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# FormatOptions are used to transport additional information to the entries. 
# This includes forinstance the information how a service instance is 
# reachable (IP-Address, TransportProtocol, Port Number).
# @see https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
#   - section 4.1.2.4 Options Format
class SomeIpSdOptions < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @entries = []
    i = 0
    while not @_io.eof?
      @entries << SdOption.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class SdOption < Kaitai::Struct::Struct

    OPTION_TYPES = {
      1 => :option_types_configuration_option,
      2 => :option_types_load_balancing_option,
      4 => :option_types_ipv4_endpoint_option,
      6 => :option_types_ipv6_endpoint_option,
      20 => :option_types_ipv4_multicast_option,
      22 => :option_types_ipv6_multicast_option,
      36 => :option_types_ipv4_sd_endpoint_option,
      38 => :option_types_ipv6_sd_endpoint_option,
    }
    I__OPTION_TYPES = OPTION_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = SdOptionHeader.new(@_io, self, @_root)
      case header.type
      when :option_types_load_balancing_option
        @content = SdLoadBalancingOption.new(@_io, self, @_root)
      when :option_types_configuration_option
        @content = SdConfigurationOption.new(@_io, self, @_root)
      when :option_types_ipv4_sd_endpoint_option
        @content = SdIpv4SdEndpointOption.new(@_io, self, @_root)
      when :option_types_ipv4_endpoint_option
        @content = SdIpv4EndpointOption.new(@_io, self, @_root)
      when :option_types_ipv6_sd_endpoint_option
        @content = SdIpv6SdEndpointOption.new(@_io, self, @_root)
      when :option_types_ipv4_multicast_option
        @content = SdIpv4MulticastOption.new(@_io, self, @_root)
      when :option_types_ipv6_endpoint_option
        @content = SdIpv6EndpointOption.new(@_io, self, @_root)
      when :option_types_ipv6_multicast_option
        @content = SdIpv6MulticastOption.new(@_io, self, @_root)
      end
      self
    end
    class SdOptionHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @length = @_io.read_u2be
        @type = Kaitai::Struct::Stream::resolve_enum(SomeIpSdOptions::SdOption::OPTION_TYPES, @_io.read_u1)
        self
      end
      attr_reader :length
      attr_reader :type
    end
    class SdConfigString < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @length = @_io.read_u1
        if length != 0
          @_raw_config = @_io.read_bytes(length)
          _io__raw_config = Kaitai::Struct::Stream.new(@_raw_config)
          @config = SdConfigKvPair.new(_io__raw_config, self, @_root)
        end
        self
      end
      attr_reader :length
      attr_reader :config
      attr_reader :_raw_config
    end
    class SdConfigStringsContainer < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @config_strings = []
        i = 0
        while not @_io.eof?
          @config_strings << SdConfigString.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      attr_reader :config_strings
    end
    class SdConfigurationOption < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @_raw_configurations = @_io.read_bytes((_parent.header.length - 1))
        _io__raw_configurations = Kaitai::Struct::Stream.new(@_raw_configurations)
        @configurations = SdConfigStringsContainer.new(_io__raw_configurations, self, @_root)
        self
      end
      attr_reader :reserved
      attr_reader :configurations
      attr_reader :_raw_configurations
    end
    class SdIpv4MulticastOption < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @address = @_io.read_bytes(4)
        @reserved2 = @_io.read_u1
        @l4_protocol = @_io.read_u1
        @port = @_io.read_u2be
        self
      end
      attr_reader :reserved
      attr_reader :address
      attr_reader :reserved2
      attr_reader :l4_protocol
      attr_reader :port
    end
    class SdIpv4SdEndpointOption < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @address = @_io.read_bytes(4)
        @reserved2 = @_io.read_u1
        @l4_protocol = @_io.read_u1
        @port = @_io.read_u2be
        self
      end
      attr_reader :reserved
      attr_reader :address
      attr_reader :reserved2
      attr_reader :l4_protocol
      attr_reader :port
    end
    class SdIpv6MulticastOption < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @address = @_io.read_bytes(16)
        @reserved2 = @_io.read_u1
        @l4_protocol = @_io.read_u1
        @port = @_io.read_u2be
        self
      end
      attr_reader :reserved
      attr_reader :address
      attr_reader :reserved2
      attr_reader :l4_protocol
      attr_reader :port
    end
    class SdConfigKvPair < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @key = (@_io.read_bytes_term(61, false, true, true)).force_encoding("ASCII")
        @value = (@_io.read_bytes_full).force_encoding("ASCII")
        self
      end
      attr_reader :key
      attr_reader :value
    end
    class SdIpv6SdEndpointOption < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @address = @_io.read_bytes(16)
        @reserved2 = @_io.read_u1
        @l4_protocol = @_io.read_u1
        @port = @_io.read_u2be
        self
      end
      attr_reader :reserved
      attr_reader :address
      attr_reader :reserved2
      attr_reader :l4_protocol
      attr_reader :port
    end
    class SdIpv4EndpointOption < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @address = @_io.read_bytes(4)
        @reserved2 = @_io.read_u1
        @l4_protocol = @_io.read_u1
        @port = @_io.read_u2be
        self
      end
      attr_reader :reserved
      attr_reader :address
      attr_reader :reserved2
      attr_reader :l4_protocol
      attr_reader :port
    end
    class SdIpv6EndpointOption < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @address = @_io.read_bytes(16)
        @reserved2 = @_io.read_u1
        @l4_protocol = @_io.read_u1
        @port = @_io.read_u2be
        self
      end
      attr_reader :reserved
      attr_reader :address
      attr_reader :reserved2
      attr_reader :l4_protocol
      attr_reader :port
    end
    class SdLoadBalancingOption < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @priority = @_io.read_u2be
        @weight = @_io.read_u2be
        self
      end
      attr_reader :reserved
      attr_reader :priority
      attr_reader :weight
    end
    attr_reader :header
    attr_reader :content
  end
  attr_reader :entries
end
