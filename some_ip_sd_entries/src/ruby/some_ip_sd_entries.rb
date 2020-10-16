# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The entries are used to synchronize the state of services instances and the 
# Publish/-Subscribe handling.
# @see https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.3  Entry Format
class SomeIpSdEntries < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @entries = []
    i = 0
    while not @_io.eof?
      @entries << SdEntry.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class SdEntry < Kaitai::Struct::Struct

    ENTRY_TYPES = {
      0 => :entry_types_find,
      1 => :entry_types_offer,
      6 => :entry_types_subscribe,
      7 => :entry_types_subscribe_ack,
    }
    I__ENTRY_TYPES = ENTRY_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = SdEntryHeader.new(@_io, self, @_root)
      case header.type
      when :entry_types_find
        @content = SdServiceEntry.new(@_io, self, @_root)
      when :entry_types_offer
        @content = SdServiceEntry.new(@_io, self, @_root)
      when :entry_types_subscribe
        @content = SdEventgroupEntry.new(@_io, self, @_root)
      when :entry_types_subscribe_ack
        @content = SdEventgroupEntry.new(@_io, self, @_root)
      end
      self
    end
    class SdEntryHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @type = Kaitai::Struct::Stream::resolve_enum(SomeIpSdEntries::SdEntry::ENTRY_TYPES, @_io.read_u1)
        @index_first_options = @_io.read_u1
        @index_second_options = @_io.read_u1
        @number_first_options = @_io.read_bits_int_be(4)
        @number_second_options = @_io.read_bits_int_be(4)
        @_io.align_to_byte
        @service_id = @_io.read_u2be
        @instance_id = @_io.read_u2be
        @major_version = @_io.read_u1
        @ttl = @_io.read_bits_int_be(24)
        self
      end
      attr_reader :type
      attr_reader :index_first_options
      attr_reader :index_second_options
      attr_reader :number_first_options
      attr_reader :number_second_options
      attr_reader :service_id
      attr_reader :instance_id
      attr_reader :major_version
      attr_reader :ttl
    end
    class SdServiceEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @minor_version = @_io.read_u4be
        self
      end
      attr_reader :minor_version
    end
    class SdEventgroupEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u1
        @initial_data_requested = @_io.read_bits_int_be(1) != 0
        @reserved2 = @_io.read_bits_int_be(3)
        @counter = @_io.read_bits_int_be(4)
        @_io.align_to_byte
        @event_group_id = @_io.read_u2be
        self
      end
      attr_reader :reserved
      attr_reader :initial_data_requested
      attr_reader :reserved2
      attr_reader :counter
      attr_reader :event_group_id
    end
    attr_reader :header
    attr_reader :content
  end
  attr_reader :entries
end
