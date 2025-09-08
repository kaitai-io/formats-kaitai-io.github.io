# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
# 
# * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
#   [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
# 
# [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
# [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
# 
# All image versions can be found in factory images at
# <https://developers.google.com/android/images> for the specific device. To
# avoid having to download an entire ZIP archive when you only need one file
# from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
# use its [command line
# tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
# members in the archive and then to download only the file you want.
# @see https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py Source
# @see https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_format.h?h=LA.UM.6.1.1&id=a68d284aee85 Source
# @see https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85 Source
class AndroidBootldrHuawei < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @meta_header = MetaHdr.new(@_io, self, @_root)
    @header_ext = @_io.read_bytes(meta_header.len_meta_header - 76)
    _io_image_header = @_io.substream(meta_header.len_image_header)
    @image_header = ImageHdr.new(_io_image_header, self, @_root)
    self
  end
  class ImageHdr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << ImageHdrEntry.new(@_io, self, @_root)
        i += 1
      end
      self
    end

    ##
    # The C generator program defines `img_header` as a [fixed size
    # array](https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n42)
    # of `img_header_entry_t` structs with length `MAX_IMAGES` (which is
    # defined as `16`).
    # 
    # This means that technically there will always be 16 `image_hdr`
    # entries, the first *n* entries being used (filled with real values)
    # and the rest left unused with all bytes zero.
    # 
    # To check if an entry is used, use the `is_used` attribute.
    attr_reader :entries
  end
  class ImageHdrEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(72), 0, false)).force_encoding("ASCII").encode('UTF-8')
      @ofs_body = @_io.read_u4le
      @len_body = @_io.read_u4le
      self
    end
    def body
      return @body unless @body.nil?
      if is_used
        io = _root._io
        _pos = io.pos
        io.seek(ofs_body)
        @body = io.read_bytes(len_body)
        io.seek(_pos)
      end
      @body
    end

    ##
    # @see https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n119 Source
    def is_used
      return @is_used unless @is_used.nil?
      @is_used =  ((ofs_body != 0) && (len_body != 0)) 
      @is_used
    end

    ##
    # partition name
    attr_reader :name
    attr_reader :ofs_body
    attr_reader :len_body
  end
  class MetaHdr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([60, 214, 26, 206].pack('C*'), @magic, @_io, "/types/meta_hdr/seq/0") if not @magic == [60, 214, 26, 206].pack('C*')
      @version = Version.new(@_io, self, @_root)
      @image_version = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(64), 0, false)).force_encoding("ASCII").encode('UTF-8')
      @len_meta_header = @_io.read_u2le
      @len_image_header = @_io.read_u2le
      self
    end
    attr_reader :magic
    attr_reader :version
    attr_reader :image_version
    attr_reader :len_meta_header
    attr_reader :len_image_header
  end
  class Version < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major = @_io.read_u2le
      @minor = @_io.read_u2le
      self
    end
    attr_reader :major
    attr_reader :minor
  end
  attr_reader :meta_header
  attr_reader :header_ext
  attr_reader :image_header
  attr_reader :_raw_image_header
end
