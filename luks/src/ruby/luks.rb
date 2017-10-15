# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Linux Unified Key Setup (LUKS) is a format specification for storing disk
# encryption parameters and up to 8 user keys (which can unlock the master key).
# @see https://gitlab.com/cryptsetup/cryptsetup/wikis/LUKS-standard/on-disk-format.pdf Source
class Luks < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @partition_header = PartitionHeader.new(@_io, self, @_root)
    self
  end
  class PartitionHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([76, 85, 75, 83, 186, 190].pack('C*'))
      @version = @_io.ensure_fixed_contents([0, 1].pack('C*'))
      @cipher_name_specification = (@_io.read_bytes(32)).force_encoding("ASCII")
      @cipher_mode_specification = (@_io.read_bytes(32)).force_encoding("ASCII")
      @hash_specification = (@_io.read_bytes(32)).force_encoding("ASCII")
      @payload_offset = @_io.read_u4be
      @number_of_key_bytes = @_io.read_u4be
      @master_key_checksum = @_io.read_bytes(20)
      @master_key_salt_parameter = @_io.read_bytes(32)
      @master_key_iterations_parameter = @_io.read_u4be
      @uuid = (@_io.read_bytes(40)).force_encoding("ASCII")
      @key_slots = Array.new(8)
      (8).times { |i|
        @key_slots[i] = KeySlot.new(@_io, self, @_root)
      }
      self
    end
    class KeySlot < Kaitai::Struct::Struct

      KEY_SLOT_STATES = {
        57005 => :key_slot_states_disabled_key_slot,
        11301363 => :key_slot_states_enabled_key_slot,
      }
      I__KEY_SLOT_STATES = KEY_SLOT_STATES.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @state_of_key_slot = Kaitai::Struct::Stream::resolve_enum(KEY_SLOT_STATES, @_io.read_u4be)
        @iteration_parameter = @_io.read_u4be
        @salt_parameter = @_io.read_bytes(32)
        @start_sector_of_key_material = @_io.read_u4be
        @number_of_anti_forensic_stripes = @_io.read_u4be
        self
      end
      def key_material
        return @key_material unless @key_material.nil?
        _pos = @_io.pos
        @_io.seek((start_sector_of_key_material * 512))
        @key_material = @_io.read_bytes((_parent.number_of_key_bytes * number_of_anti_forensic_stripes))
        @_io.seek(_pos)
        @key_material
      end
      attr_reader :state_of_key_slot
      attr_reader :iteration_parameter
      attr_reader :salt_parameter
      attr_reader :start_sector_of_key_material
      attr_reader :number_of_anti_forensic_stripes
    end
    attr_reader :magic
    attr_reader :version
    attr_reader :cipher_name_specification
    attr_reader :cipher_mode_specification
    attr_reader :hash_specification
    attr_reader :payload_offset
    attr_reader :number_of_key_bytes
    attr_reader :master_key_checksum
    attr_reader :master_key_salt_parameter
    attr_reader :master_key_iterations_parameter
    attr_reader :uuid
    attr_reader :key_slots
  end
  def payload
    return @payload unless @payload.nil?
    _pos = @_io.pos
    @_io.seek((partition_header.payload_offset * 512))
    @payload = @_io.read_bytes_full
    @_io.seek(_pos)
    @payload
  end
  attr_reader :partition_header
end
