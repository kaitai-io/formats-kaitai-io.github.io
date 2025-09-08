# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'some_ip_sd_options'
require_relative 'some_ip_sd_entries'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The main tasks of the Service Discovery Protocol are communicating the
# availability of functional entities called services in the in-vehicle
# communication as well as controlling the send behavior of event messages.
# This allows sending only event messages to receivers requiring them (Publish/Subscribe).
# The solution described here is also known as SOME/IP-SD
# (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
# @see https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf Source
class SomeIpSd < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @flags = SdFlags.new(@_io, self, @_root)
    @reserved = @_io.read_bytes(3)
    @len_entries = @_io.read_u4be
    _io_entries = @_io.substream(len_entries)
    @entries = SomeIpSdEntries.new(_io_entries)
    @len_options = @_io.read_u4be
    _io_options = @_io.substream(len_options)
    @options = SomeIpSdOptions.new(_io_options)
    self
  end

  ##
  # @see '' AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
  class SdFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reboot = @_io.read_bits_int_be(1) != 0
      @unicast = @_io.read_bits_int_be(1) != 0
      @initial_data = @_io.read_bits_int_be(1) != 0
      @reserved = @_io.read_bits_int_be(5)
      self
    end
    attr_reader :reboot
    attr_reader :unicast
    attr_reader :initial_data
    attr_reader :reserved
  end

  ##
  # The SOME/IP-SD Header shall start with an 8 Bit field called flags.
  attr_reader :flags
  attr_reader :reserved
  attr_reader :len_entries
  attr_reader :entries
  attr_reader :len_options
  attr_reader :options
  attr_reader :_raw_entries
  attr_reader :_raw_options
end
