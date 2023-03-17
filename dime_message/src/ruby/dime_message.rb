# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Direct Internet Message Encapsulation (DIME)
# is an old Microsoft specification for sending and receiving
# SOAP messages along with additional attachments,
# like binary files, XML fragments, and even other
# SOAP messages, using standard transport protocols like HTTP.
# 
# Sample file: `curl -LO
# https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
# && gunzip scanner_withoptions.dump.gz`
# @see https://datatracker.ietf.org/doc/html/draft-nielsen-dime-02 Source
# @see https://learn.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime Source
# @see http://imrannazar.com/Parsing-the-DIME-Message-Format Source
class DimeMessage < Kaitai::Struct::Struct

  TYPE_FORMATS = {
    0 => :type_formats_unchanged,
    1 => :type_formats_media_type,
    2 => :type_formats_absolute_uri,
    3 => :type_formats_unknown,
    4 => :type_formats_none,
  }
  I__TYPE_FORMATS = TYPE_FORMATS.invert
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

  ##
  # padding to the next 4-byte boundary
  class Padding < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @boundary_padding = @_io.read_bytes((-(_io.pos) % 4))
      self
    end
    attr_reader :boundary_padding
  end

  ##
  # the option field of the record
  class OptionField < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @option_elements = []
      i = 0
      while not @_io.eof?
        @option_elements << OptionElement.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :option_elements
  end

  ##
  # one element of the option field
  class OptionElement < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @element_format = @_io.read_u2be
      @len_element = @_io.read_u2be
      @element_data = @_io.read_bytes(len_element)
      self
    end
    attr_reader :element_format
    attr_reader :len_element
    attr_reader :element_data
  end

  ##
  # each individual fragment of the message
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_bits_int_be(5)
      @is_first_record = @_io.read_bits_int_be(1) != 0
      @is_last_record = @_io.read_bits_int_be(1) != 0
      @is_chunk_record = @_io.read_bits_int_be(1) != 0
      @type_format = Kaitai::Struct::Stream::resolve_enum(DimeMessage::TYPE_FORMATS, @_io.read_bits_int_be(4))
      @reserved = @_io.read_bits_int_be(4)
      @_io.align_to_byte
      @len_options = @_io.read_u2be
      @len_id = @_io.read_u2be
      @len_type = @_io.read_u2be
      @len_data = @_io.read_u4be
      @_raw_options = @_io.read_bytes(len_options)
      _io__raw_options = Kaitai::Struct::Stream.new(@_raw_options)
      @options = OptionField.new(_io__raw_options, self, @_root)
      @options_padding = Padding.new(@_io, self, @_root)
      @id = (@_io.read_bytes(len_id)).force_encoding("ASCII")
      @id_padding = Padding.new(@_io, self, @_root)
      @type = (@_io.read_bytes(len_type)).force_encoding("ASCII")
      @type_padding = Padding.new(@_io, self, @_root)
      @data = @_io.read_bytes(len_data)
      @data_padding = Padding.new(@_io, self, @_root)
      self
    end

    ##
    # DIME format version (always 1)
    attr_reader :version

    ##
    # Set if this is the first record in the message
    attr_reader :is_first_record

    ##
    # Set if this is the last record in the message
    attr_reader :is_last_record

    ##
    # Set if the file contained in this record is chunked into multiple records
    attr_reader :is_chunk_record

    ##
    # Indicates the structure and format of the value of the TYPE field
    attr_reader :type_format

    ##
    # Reserved for future use
    attr_reader :reserved

    ##
    # Length of the Options field
    attr_reader :len_options

    ##
    # Length of the ID field
    attr_reader :len_id

    ##
    # Length of the Type field
    attr_reader :len_type

    ##
    # Length of the Data field
    attr_reader :len_data
    attr_reader :options
    attr_reader :options_padding

    ##
    # Unique identifier of the file (set in the first record of file)
    attr_reader :id
    attr_reader :id_padding

    ##
    # Specified type in the format set with type_format
    attr_reader :type
    attr_reader :type_padding

    ##
    # The file data
    attr_reader :data
    attr_reader :data_padding
    attr_reader :_raw_options
  end
  attr_reader :records
end
