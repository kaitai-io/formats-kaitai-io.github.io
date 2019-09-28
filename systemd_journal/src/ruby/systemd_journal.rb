# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# systemd, a popular user-space system/service management suite on Linux,
# offers logging functionality, storing incoming logs in a binary journal
# format.
# 
# On live Linux system running systemd, these journals are typically located at:
# 
# * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
# * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
# @see https://www.freedesktop.org/wiki/Software/systemd/journal-files/ Source
class SystemdJournal < Kaitai::Struct::Struct

  STATE = {
    0 => :state_offline,
    1 => :state_online,
    2 => :state_archived,
  }
  I__STATE = STATE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_header = @_io.read_bytes(len_header)
    _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
    @header = Header.new(_io__raw_header, self, @_root)
    @objects = Array.new(header.num_objects)
    (header.num_objects).times { |i|
      @objects[i] = JournalObject.new(@_io, self, @_root)
    }
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature = @_io.ensure_fixed_contents([76, 80, 75, 83, 72, 72, 82, 72].pack('C*'))
      @compatible_flags = @_io.read_u4le
      @incompatible_flags = @_io.read_u4le
      @state = Kaitai::Struct::Stream::resolve_enum(SystemdJournal::STATE, @_io.read_u1)
      @reserved = @_io.read_bytes(7)
      @file_id = @_io.read_bytes(16)
      @machine_id = @_io.read_bytes(16)
      @boot_id = @_io.read_bytes(16)
      @seqnum_id = @_io.read_bytes(16)
      @len_header = @_io.read_u8le
      @len_arena = @_io.read_u8le
      @ofs_data_hash_table = @_io.read_u8le
      @len_data_hash_table = @_io.read_u8le
      @ofs_field_hash_table = @_io.read_u8le
      @len_field_hash_table = @_io.read_u8le
      @ofs_tail_object = @_io.read_u8le
      @num_objects = @_io.read_u8le
      @num_entries = @_io.read_u8le
      @tail_entry_seqnum = @_io.read_u8le
      @head_entry_seqnum = @_io.read_u8le
      @ofs_entry_array = @_io.read_u8le
      @head_entry_realtime = @_io.read_u8le
      @tail_entry_realtime = @_io.read_u8le
      @tail_entry_monotonic = @_io.read_u8le
      if !(_io.eof?)
        @num_data = @_io.read_u8le
      end
      if !(_io.eof?)
        @num_fields = @_io.read_u8le
      end
      if !(_io.eof?)
        @num_tags = @_io.read_u8le
      end
      if !(_io.eof?)
        @num_entry_arrays = @_io.read_u8le
      end
      self
    end
    attr_reader :signature
    attr_reader :compatible_flags
    attr_reader :incompatible_flags
    attr_reader :state
    attr_reader :reserved
    attr_reader :file_id
    attr_reader :machine_id
    attr_reader :boot_id
    attr_reader :seqnum_id
    attr_reader :len_header
    attr_reader :len_arena
    attr_reader :ofs_data_hash_table
    attr_reader :len_data_hash_table
    attr_reader :ofs_field_hash_table
    attr_reader :len_field_hash_table
    attr_reader :ofs_tail_object
    attr_reader :num_objects
    attr_reader :num_entries
    attr_reader :tail_entry_seqnum
    attr_reader :head_entry_seqnum
    attr_reader :ofs_entry_array
    attr_reader :head_entry_realtime
    attr_reader :tail_entry_realtime
    attr_reader :tail_entry_monotonic
    attr_reader :num_data
    attr_reader :num_fields
    attr_reader :num_tags
    attr_reader :num_entry_arrays
  end

  ##
  # @see https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects Source
  class JournalObject < Kaitai::Struct::Struct

    OBJECT_TYPES = {
      0 => :object_types_unused,
      1 => :object_types_data,
      2 => :object_types_field,
      3 => :object_types_entry,
      4 => :object_types_data_hash_table,
      5 => :object_types_field_hash_table,
      6 => :object_types_entry_array,
      7 => :object_types_tag,
    }
    I__OBJECT_TYPES = OBJECT_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @padding = @_io.read_bytes(((8 - _io.pos) % 8))
      @object_type = Kaitai::Struct::Stream::resolve_enum(OBJECT_TYPES, @_io.read_u1)
      @flags = @_io.read_u1
      @reserved = @_io.read_bytes(6)
      @len_object = @_io.read_u8le
      case object_type
      when :object_types_data
        @_raw_payload = @_io.read_bytes((len_object - 16))
        _io__raw_payload = Kaitai::Struct::Stream.new(@_raw_payload)
        @payload = DataObject.new(_io__raw_payload, self, @_root)
      else
        @payload = @_io.read_bytes((len_object - 16))
      end
      self
    end
    attr_reader :padding
    attr_reader :object_type
    attr_reader :flags
    attr_reader :reserved
    attr_reader :len_object
    attr_reader :payload
    attr_reader :_raw_payload
  end

  ##
  # Data objects are designed to carry log payload, typically in
  # form of a "key=value" string in `payload` attribute.
  # @see https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects Source
  class DataObject < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @hash = @_io.read_u8le
      @ofs_next_hash = @_io.read_u8le
      @ofs_head_field = @_io.read_u8le
      @ofs_entry = @_io.read_u8le
      @ofs_entry_array = @_io.read_u8le
      @num_entries = @_io.read_u8le
      @payload = @_io.read_bytes_full
      self
    end
    def next_hash
      return @next_hash unless @next_hash.nil?
      if ofs_next_hash != 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs_next_hash)
        @next_hash = JournalObject.new(io, self, @_root)
        io.seek(_pos)
      end
      @next_hash
    end
    def head_field
      return @head_field unless @head_field.nil?
      if ofs_head_field != 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs_head_field)
        @head_field = JournalObject.new(io, self, @_root)
        io.seek(_pos)
      end
      @head_field
    end
    def entry
      return @entry unless @entry.nil?
      if ofs_entry != 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs_entry)
        @entry = JournalObject.new(io, self, @_root)
        io.seek(_pos)
      end
      @entry
    end
    def entry_array
      return @entry_array unless @entry_array.nil?
      if ofs_entry_array != 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs_entry_array)
        @entry_array = JournalObject.new(io, self, @_root)
        io.seek(_pos)
      end
      @entry_array
    end
    attr_reader :hash
    attr_reader :ofs_next_hash
    attr_reader :ofs_head_field
    attr_reader :ofs_entry
    attr_reader :ofs_entry_array
    attr_reader :num_entries
    attr_reader :payload
  end

  ##
  # Header length is used to set substream size, as it thus required
  # prior to declaration of header.
  def len_header
    return @len_header unless @len_header.nil?
    _pos = @_io.pos
    @_io.seek(88)
    @len_header = @_io.read_u8le
    @_io.seek(_pos)
    @len_header
  end
  def data_hash_table
    return @data_hash_table unless @data_hash_table.nil?
    _pos = @_io.pos
    @_io.seek(header.ofs_data_hash_table)
    @data_hash_table = @_io.read_bytes(header.len_data_hash_table)
    @_io.seek(_pos)
    @data_hash_table
  end
  def field_hash_table
    return @field_hash_table unless @field_hash_table.nil?
    _pos = @_io.pos
    @_io.seek(header.ofs_field_hash_table)
    @field_hash_table = @_io.read_bytes(header.len_field_hash_table)
    @_io.seek(_pos)
    @field_hash_table
  end
  attr_reader :header
  attr_reader :objects
  attr_reader :_raw_header
end
