# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A bootloader image which only seems to have been used on a few ASUS
# devices. The encoding is ASCII, because the `releasetools.py` script
# is written using Python 2, where the default encoding is ASCII.
# 
# A test file can be found in the firmware files for the "fugu" device,
# which can be downloaded from <https://developers.google.com/android/images>
# @see https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py Source
class AndroidBootldrAsus < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(8)
    raise Kaitai::Struct::ValidationNotEqualError.new([66, 79, 79, 84, 76, 68, 82, 33].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [66, 79, 79, 84, 76, 68, 82, 33].pack('C*')
    @revision = @_io.read_u2le
    raise Kaitai::Struct::ValidationLessThanError.new(2, @revision, @_io, "/seq/1") if not @revision >= 2
    @reserved1 = @_io.read_u2le
    @reserved2 = @_io.read_u4le
    @images = []
    (3).times { |i|
      @images << Image.new(@_io, self, @_root)
    }
    self
  end
  class Image < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunk_id = (@_io.read_bytes(8)).force_encoding("ASCII").encode('UTF-8')
      raise Kaitai::Struct::ValidationNotAnyOfError.new(@chunk_id, @_io, "/types/image/seq/0") if not  ((@chunk_id == "IFWI!!!!") || (@chunk_id == "DROIDBT!") || (@chunk_id == "SPLASHS!")) 
      @len_body = @_io.read_u4le
      @flags = @_io.read_u1
      _ = @flags
      raise Kaitai::Struct::ValidationExprError.new(@flags, @_io, "/types/image/seq/2") if not _ & 1 != 0
      @reserved1 = @_io.read_u1
      @reserved2 = @_io.read_u1
      @reserved3 = @_io.read_u1
      @body = @_io.read_bytes(len_body)
      self
    end
    def file_name
      return @file_name unless @file_name.nil?
      @file_name = (chunk_id == "IFWI!!!!" ? "ifwi.bin" : (chunk_id == "DROIDBT!" ? "droidboot.img" : (chunk_id == "SPLASHS!" ? "splashscreen.img" : "")))
      @file_name
    end
    attr_reader :chunk_id
    attr_reader :len_body
    attr_reader :flags
    attr_reader :reserved1
    attr_reader :reserved2
    attr_reader :reserved3
    attr_reader :body
  end
  attr_reader :magic
  attr_reader :revision
  attr_reader :reserved1
  attr_reader :reserved2

  ##
  # Only three images are included: `ifwi.bin`, `droidboot.img`
  # and `splashscreen.img`
  attr_reader :images
end
