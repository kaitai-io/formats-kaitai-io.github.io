# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# MCAP is a modular container format and logging library for pub/sub messages with
# arbitrary message serialization. It is primarily intended for use in robotics
# applications, and works well under various workloads, resource constraints, and
# durability requirements.
# 
# Time values (`log_time`, `publish_time`, `create_time`) are represented in
# nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
# etc.)
# @see https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme Source
class Mcap < Kaitai::Struct::Struct

  OPCODE = {
    1 => :opcode_header,
    2 => :opcode_footer,
    3 => :opcode_schema,
    4 => :opcode_channel,
    5 => :opcode_message,
    6 => :opcode_chunk,
    7 => :opcode_message_index,
    8 => :opcode_chunk_index,
    9 => :opcode_attachment,
    10 => :opcode_attachment_index,
    11 => :opcode_statistics,
    12 => :opcode_metadata,
    13 => :opcode_metadata_index,
    14 => :opcode_summary_offset,
    15 => :opcode_data_end,
  }
  I__OPCODE = OPCODE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header_magic = Magic.new(@_io, self, @_root)
    @records = []
    i = 0
    begin
      _ = Record.new(@_io, self, @_root)
      @records << _
      i += 1
    end until _.op == :opcode_footer
    @footer_magic = Magic.new(@_io, self, @_root)
    self
  end
  class PrefixedStr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_str = @_io.read_u4le
      @str = (@_io.read_bytes(len_str)).force_encoding("UTF-8")
      self
    end
    attr_reader :len_str
    attr_reader :str
  end
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @message_start_time = @_io.read_u8le
      @message_end_time = @_io.read_u8le
      @uncompressed_size = @_io.read_u8le
      @uncompressed_crc32 = @_io.read_u4le
      @compression = PrefixedStr.new(@_io, self, @_root)
      @len_records = @_io.read_u8le
      case compression.str
      when ""
        @_raw_records = @_io.read_bytes(len_records)
        _io__raw_records = Kaitai::Struct::Stream.new(@_raw_records)
        @records = Records.new(_io__raw_records, self, @_root)
      else
        @records = @_io.read_bytes(len_records)
      end
      self
    end
    attr_reader :message_start_time
    attr_reader :message_end_time
    attr_reader :uncompressed_size

    ##
    # CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
    # CRC validation should not be performed.
    attr_reader :uncompressed_crc32
    attr_reader :compression
    attr_reader :len_records
    attr_reader :records
    attr_reader :_raw_records
  end
  class DataEnd < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data_section_crc32 = @_io.read_u4le
      self
    end

    ##
    # CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
    # available.
    attr_reader :data_section_crc32
  end
  class Channel < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_u2le
      @schema_id = @_io.read_u2le
      @topic = PrefixedStr.new(@_io, self, @_root)
      @message_encoding = PrefixedStr.new(@_io, self, @_root)
      @metadata = MapStrStr.new(@_io, self, @_root)
      self
    end
    attr_reader :id
    attr_reader :schema_id
    attr_reader :topic
    attr_reader :message_encoding
    attr_reader :metadata
  end
  class MessageIndex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @channel_id = @_io.read_u2le
      @len_records = @_io.read_u4le
      @_raw_records = @_io.read_bytes(len_records)
      _io__raw_records = Kaitai::Struct::Stream.new(@_raw_records)
      @records = MessageIndexEntries.new(_io__raw_records, self, @_root)
      self
    end
    class MessageIndexEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @log_time = @_io.read_u8le
        @offset = @_io.read_u8le
        self
      end
      attr_reader :log_time
      attr_reader :offset
    end
    class MessageIndexEntries < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << MessageIndexEntry.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    attr_reader :channel_id
    attr_reader :len_records
    attr_reader :records
    attr_reader :_raw_records
  end
  class Statistics < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @message_count = @_io.read_u8le
      @schema_count = @_io.read_u2le
      @channel_count = @_io.read_u4le
      @attachment_count = @_io.read_u4le
      @metadata_count = @_io.read_u4le
      @chunk_count = @_io.read_u4le
      @message_start_time = @_io.read_u8le
      @message_end_time = @_io.read_u8le
      @len_channel_message_counts = @_io.read_u4le
      @_raw_channel_message_counts = @_io.read_bytes(len_channel_message_counts)
      _io__raw_channel_message_counts = Kaitai::Struct::Stream.new(@_raw_channel_message_counts)
      @channel_message_counts = ChannelMessageCounts.new(_io__raw_channel_message_counts, self, @_root)
      self
    end
    class ChannelMessageCounts < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << ChannelMessageCount.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    class ChannelMessageCount < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @channel_id = @_io.read_u2le
        @message_count = @_io.read_u8le
        self
      end
      attr_reader :channel_id
      attr_reader :message_count
    end
    attr_reader :message_count
    attr_reader :schema_count
    attr_reader :channel_count
    attr_reader :attachment_count
    attr_reader :metadata_count
    attr_reader :chunk_count
    attr_reader :message_start_time
    attr_reader :message_end_time
    attr_reader :len_channel_message_counts
    attr_reader :channel_message_counts
    attr_reader :_raw_channel_message_counts
  end
  class AttachmentIndex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ofs_attachment = @_io.read_u8le
      @len_attachment = @_io.read_u8le
      @log_time = @_io.read_u8le
      @create_time = @_io.read_u8le
      @data_size = @_io.read_u8le
      @name = PrefixedStr.new(@_io, self, @_root)
      @content_type = PrefixedStr.new(@_io, self, @_root)
      self
    end
    def attachment
      return @attachment unless @attachment.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_attachment)
      @_raw_attachment = io.read_bytes(len_attachment)
      _io__raw_attachment = Kaitai::Struct::Stream.new(@_raw_attachment)
      @attachment = Record.new(_io__raw_attachment, self, @_root)
      io.seek(_pos)
      @attachment
    end
    attr_reader :ofs_attachment
    attr_reader :len_attachment
    attr_reader :log_time
    attr_reader :create_time
    attr_reader :data_size
    attr_reader :name
    attr_reader :content_type
    attr_reader :_raw_attachment
  end
  class Schema < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_u2le
      @name = PrefixedStr.new(@_io, self, @_root)
      @encoding = PrefixedStr.new(@_io, self, @_root)
      @len_data = @_io.read_u4le
      @data = @_io.read_bytes(len_data)
      self
    end
    attr_reader :id
    attr_reader :name
    attr_reader :encoding
    attr_reader :len_data
    attr_reader :data
  end
  class MapStrStr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_entries = @_io.read_u4le
      @_raw_entries = @_io.read_bytes(len_entries)
      _io__raw_entries = Kaitai::Struct::Stream.new(@_raw_entries)
      @entries = Entries.new(_io__raw_entries, self, @_root)
      self
    end
    class Entries < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << TupleStrStr.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    attr_reader :len_entries
    attr_reader :entries
    attr_reader :_raw_entries
  end
  class SummaryOffset < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @group_opcode = Kaitai::Struct::Stream::resolve_enum(Mcap::OPCODE, @_io.read_u1)
      @ofs_group = @_io.read_u8le
      @len_group = @_io.read_u8le
      self
    end
    def group
      return @group unless @group.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_group)
      @_raw_group = io.read_bytes(len_group)
      _io__raw_group = Kaitai::Struct::Stream.new(@_raw_group)
      @group = Records.new(_io__raw_group, self, @_root)
      io.seek(_pos)
      @group
    end
    attr_reader :group_opcode
    attr_reader :ofs_group
    attr_reader :len_group
    attr_reader :_raw_group
  end
  class Attachment < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @log_time = @_io.read_u8le
      @create_time = @_io.read_u8le
      @name = PrefixedStr.new(@_io, self, @_root)
      @content_type = PrefixedStr.new(@_io, self, @_root)
      @len_data = @_io.read_u8le
      @data = @_io.read_bytes(len_data)
      if crc32_input_end >= 0
        @invoke_crc32_input_end = @_io.read_bytes(0)
      end
      @crc32 = @_io.read_u4le
      self
    end
    def crc32_input_end
      return @crc32_input_end unless @crc32_input_end.nil?
      @crc32_input_end = _io.pos
      @crc32_input_end
    end
    def crc32_input
      return @crc32_input unless @crc32_input.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @crc32_input = @_io.read_bytes(crc32_input_end)
      @_io.seek(_pos)
      @crc32_input
    end
    attr_reader :log_time
    attr_reader :create_time
    attr_reader :name
    attr_reader :content_type
    attr_reader :len_data
    attr_reader :data
    attr_reader :invoke_crc32_input_end

    ##
    # CRC-32 checksum of preceding fields in the record. A value of zero indicates that
    # CRC validation should not be performed.
    attr_reader :crc32
  end
  class Metadata < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = PrefixedStr.new(@_io, self, @_root)
      @metadata = MapStrStr.new(@_io, self, @_root)
      self
    end
    attr_reader :name
    attr_reader :metadata
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @profile = PrefixedStr.new(@_io, self, @_root)
      @library = PrefixedStr.new(@_io, self, @_root)
      self
    end
    attr_reader :profile
    attr_reader :library
  end
  class Message < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @channel_id = @_io.read_u2le
      @sequence = @_io.read_u4le
      @log_time = @_io.read_u8le
      @publish_time = @_io.read_u8le
      @data = @_io.read_bytes_full
      self
    end
    attr_reader :channel_id
    attr_reader :sequence
    attr_reader :log_time
    attr_reader :publish_time
    attr_reader :data
  end
  class TupleStrStr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @key = PrefixedStr.new(@_io, self, @_root)
      @value = PrefixedStr.new(@_io, self, @_root)
      self
    end
    attr_reader :key
    attr_reader :value
  end
  class MetadataIndex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ofs_metadata = @_io.read_u8le
      @len_metadata = @_io.read_u8le
      @name = PrefixedStr.new(@_io, self, @_root)
      self
    end
    def metadata
      return @metadata unless @metadata.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_metadata)
      @_raw_metadata = io.read_bytes(len_metadata)
      _io__raw_metadata = Kaitai::Struct::Stream.new(@_raw_metadata)
      @metadata = Record.new(_io__raw_metadata, self, @_root)
      io.seek(_pos)
      @metadata
    end
    attr_reader :ofs_metadata
    attr_reader :len_metadata
    attr_reader :name
    attr_reader :_raw_metadata
  end
  class Magic < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(8)
      raise Kaitai::Struct::ValidationNotEqualError.new([137, 77, 67, 65, 80, 48, 13, 10].pack('C*'), magic, _io, "/types/magic/seq/0") if not magic == [137, 77, 67, 65, 80, 48, 13, 10].pack('C*')
      self
    end
    attr_reader :magic
  end
  class Records < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @records = []
      i = 0
      while not @_io.eof?
        @records << Record.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :records
  end
  class Footer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ofs_summary_section = @_io.read_u8le
      @ofs_summary_offset_section = @_io.read_u8le
      @summary_crc32 = @_io.read_u4le
      self
    end
    def summary_section
      return @summary_section unless @summary_section.nil?
      if ofs_summary_section != 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs_summary_section)
        @_raw_summary_section = io.read_bytes(((ofs_summary_offset_section != 0 ? ofs_summary_offset_section : _root.ofs_footer) - ofs_summary_section))
        _io__raw_summary_section = Kaitai::Struct::Stream.new(@_raw_summary_section)
        @summary_section = Records.new(_io__raw_summary_section, self, @_root)
        io.seek(_pos)
      end
      @summary_section
    end
    def summary_offset_section
      return @summary_offset_section unless @summary_offset_section.nil?
      if ofs_summary_offset_section != 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs_summary_offset_section)
        @_raw_summary_offset_section = io.read_bytes((_root.ofs_footer - ofs_summary_offset_section))
        _io__raw_summary_offset_section = Kaitai::Struct::Stream.new(@_raw_summary_offset_section)
        @summary_offset_section = Records.new(_io__raw_summary_offset_section, self, @_root)
        io.seek(_pos)
      end
      @summary_offset_section
    end
    def ofs_summary_crc32_input
      return @ofs_summary_crc32_input unless @ofs_summary_crc32_input.nil?
      @ofs_summary_crc32_input = (ofs_summary_section != 0 ? ofs_summary_section : _root.ofs_footer)
      @ofs_summary_crc32_input
    end
    def summary_crc32_input
      return @summary_crc32_input unless @summary_crc32_input.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_summary_crc32_input)
      @summary_crc32_input = io.read_bytes((((_root._io.size - ofs_summary_crc32_input) - 8) - 4))
      io.seek(_pos)
      @summary_crc32_input
    end
    attr_reader :ofs_summary_section
    attr_reader :ofs_summary_offset_section

    ##
    # A CRC-32 of all bytes from the start of the Summary section up through and
    # including the end of the previous field (summary_offset_start) in the footer
    # record. A value of 0 indicates the CRC-32 is not available.
    attr_reader :summary_crc32
    attr_reader :_raw_summary_section
    attr_reader :_raw_summary_offset_section
  end
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @op = Kaitai::Struct::Stream::resolve_enum(Mcap::OPCODE, @_io.read_u1)
      @len_body = @_io.read_u8le
      case op
      when :opcode_message
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Message.new(_io__raw_body, self, @_root)
      when :opcode_metadata_index
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = MetadataIndex.new(_io__raw_body, self, @_root)
      when :opcode_chunk
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Chunk.new(_io__raw_body, self, @_root)
      when :opcode_schema
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Schema.new(_io__raw_body, self, @_root)
      when :opcode_chunk_index
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = ChunkIndex.new(_io__raw_body, self, @_root)
      when :opcode_data_end
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DataEnd.new(_io__raw_body, self, @_root)
      when :opcode_attachment_index
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AttachmentIndex.new(_io__raw_body, self, @_root)
      when :opcode_statistics
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Statistics.new(_io__raw_body, self, @_root)
      when :opcode_message_index
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = MessageIndex.new(_io__raw_body, self, @_root)
      when :opcode_channel
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Channel.new(_io__raw_body, self, @_root)
      when :opcode_metadata
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Metadata.new(_io__raw_body, self, @_root)
      when :opcode_attachment
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Attachment.new(_io__raw_body, self, @_root)
      when :opcode_header
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Header.new(_io__raw_body, self, @_root)
      when :opcode_footer
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Footer.new(_io__raw_body, self, @_root)
      when :opcode_summary_offset
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SummaryOffset.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes(len_body)
      end
      self
    end
    attr_reader :op
    attr_reader :len_body
    attr_reader :body
    attr_reader :_raw_body
  end
  class ChunkIndex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @message_start_time = @_io.read_u8le
      @message_end_time = @_io.read_u8le
      @ofs_chunk = @_io.read_u8le
      @len_chunk = @_io.read_u8le
      @len_message_index_offsets = @_io.read_u4le
      @_raw_message_index_offsets = @_io.read_bytes(len_message_index_offsets)
      _io__raw_message_index_offsets = Kaitai::Struct::Stream.new(@_raw_message_index_offsets)
      @message_index_offsets = MessageIndexOffsets.new(_io__raw_message_index_offsets, self, @_root)
      @message_index_length = @_io.read_u8le
      @compression = PrefixedStr.new(@_io, self, @_root)
      @compressed_size = @_io.read_u8le
      @uncompressed_size = @_io.read_u8le
      self
    end
    class MessageIndexOffset < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @channel_id = @_io.read_u2le
        @offset = @_io.read_u8le
        self
      end
      attr_reader :channel_id
      attr_reader :offset
    end
    class MessageIndexOffsets < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << MessageIndexOffset.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    def chunk
      return @chunk unless @chunk.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_chunk)
      @_raw_chunk = io.read_bytes(len_chunk)
      _io__raw_chunk = Kaitai::Struct::Stream.new(@_raw_chunk)
      @chunk = Record.new(_io__raw_chunk, self, @_root)
      io.seek(_pos)
      @chunk
    end
    attr_reader :message_start_time
    attr_reader :message_end_time
    attr_reader :ofs_chunk
    attr_reader :len_chunk
    attr_reader :len_message_index_offsets
    attr_reader :message_index_offsets
    attr_reader :message_index_length
    attr_reader :compression
    attr_reader :compressed_size
    attr_reader :uncompressed_size
    attr_reader :_raw_message_index_offsets
    attr_reader :_raw_chunk
  end
  def footer
    return @footer unless @footer.nil?
    _pos = @_io.pos
    @_io.seek(ofs_footer)
    @_raw_footer = @_io.read_bytes_full
    _io__raw_footer = Kaitai::Struct::Stream.new(@_raw_footer)
    @footer = Record.new(_io__raw_footer, self, @_root)
    @_io.seek(_pos)
    @footer
  end
  def ofs_footer
    return @ofs_footer unless @ofs_footer.nil?
    @ofs_footer = ((((_io.size - 1) - 8) - 20) - 8)
    @ofs_footer
  end
  attr_reader :header_magic
  attr_reader :records
  attr_reader :footer_magic
  attr_reader :_raw_footer
end
