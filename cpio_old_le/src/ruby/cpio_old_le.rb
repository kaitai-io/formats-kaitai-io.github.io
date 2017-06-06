# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class CpioOldLe < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @files = []
    while not @_io.eof?
      @files << File.new(@_io, self, @_root)
    end
  end
  class File < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @header = FileHeader.new(@_io, self, @_root)
      @path_name = @_io.read_bytes((header.path_name_size - 1))
      @string_terminator = @_io.ensure_fixed_contents([0].pack('C*'))
      if (header.path_name_size % 2) == 1
        @path_name_padding = @_io.ensure_fixed_contents([0].pack('C*'))
      end
      @file_data = @_io.read_bytes(header.file_size.value)
      if (header.file_size.value % 2) == 1
        @file_data_padding = @_io.ensure_fixed_contents([0].pack('C*'))
      end
      if  ((path_name == [84, 82, 65, 73, 76, 69, 82, 33, 33, 33].pack('C*')) && (header.file_size.value == 0)) 
        @end_of_file_padding = @_io.read_bytes_full
      end
    end
    attr_reader :header
    attr_reader :path_name
    attr_reader :string_terminator
    attr_reader :path_name_padding
    attr_reader :file_data
    attr_reader :file_data_padding
    attr_reader :end_of_file_padding
  end
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @magic = @_io.ensure_fixed_contents([199, 113].pack('C*'))
      @device_number = @_io.read_u2le
      @inode_number = @_io.read_u2le
      @mode = @_io.read_u2le
      @user_id = @_io.read_u2le
      @group_id = @_io.read_u2le
      @number_of_links = @_io.read_u2le
      @r_device_number = @_io.read_u2le
      @modification_time = FourByteUnsignedInteger.new(@_io, self, @_root)
      @path_name_size = @_io.read_u2le
      @file_size = FourByteUnsignedInteger.new(@_io, self, @_root)
    end
    attr_reader :magic
    attr_reader :device_number
    attr_reader :inode_number
    attr_reader :mode
    attr_reader :user_id
    attr_reader :group_id
    attr_reader :number_of_links
    attr_reader :r_device_number
    attr_reader :modification_time
    attr_reader :path_name_size
    attr_reader :file_size
  end
  class FourByteUnsignedInteger < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @most_significant_bits = @_io.read_u2le
      @least_significant_bits = @_io.read_u2le
    end
    def value
      return @value unless @value.nil?
      @value = (least_significant_bits + (most_significant_bits << 16))
      @value
    end
    attr_reader :most_significant_bits
    attr_reader :least_significant_bits
  end
  attr_reader :files
end
