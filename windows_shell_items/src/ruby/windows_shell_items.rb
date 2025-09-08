# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Windows Shell Items (AKA "shellbags") is an undocumented set of
# structures used internally within Windows to identify paths in
# Windows Folder Hierarchy. It is widely used in Windows Shell (and
# most visible in File Explorer), both as in-memory and in-file
# structures. Some formats embed them, namely:
# 
# * Windows Shell link files (.lnk) Windows registry
# * Windows registry "ShellBags" keys
# 
# The format is mostly undocumented, and is known to vary between
# various Windows versions.
# @see https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc Source
class WindowsShellItems < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @items = []
    i = 0
    begin
      _ = ShellItem.new(@_io, self, @_root)
      @items << _
      i += 1
    end until _.len_data == 0
    self
  end

  ##
  # @see https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item Source
  class FileEntryBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = @_io.read_u1
      @file_size = @_io.read_u4le
      @last_mod_time = @_io.read_u4le
      @file_attrs = @_io.read_u2le
      self
    end
    def is_dir
      return @is_dir unless @is_dir.nil?
      @is_dir = _parent.code & 1 != 0
      @is_dir
    end
    def is_file
      return @is_file unless @is_file.nil?
      @is_file = _parent.code & 2 != 0
      @is_file
    end
    attr_reader :_unnamed0
    attr_reader :file_size
    attr_reader :last_mod_time
    attr_reader :file_attrs
  end

  ##
  # @see https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item Source
  class RootFolderBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sort_index = @_io.read_u1
      @shell_folder_id = @_io.read_bytes(16)
      self
    end
    attr_reader :sort_index
    attr_reader :shell_folder_id
  end

  ##
  # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.2.2
  class ShellItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_data = @_io.read_u2le
      if len_data >= 2
        _io_data = @_io.substream(len_data - 2)
        @data = ShellItemData.new(_io_data, self, @_root)
      end
      self
    end
    attr_reader :len_data
    attr_reader :data
    attr_reader :_raw_data
  end
  class ShellItemData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = @_io.read_u1
      case code
      when 31
        @body1 = RootFolderBody.new(@_io, self, @_root)
      end
      case code & 112
      when 32
        @body2 = VolumeBody.new(@_io, self, @_root)
      when 48
        @body2 = FileEntryBody.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :code
    attr_reader :body1
    attr_reader :body2
  end

  ##
  # @see https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item Source
  class VolumeBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = @_io.read_u1
      self
    end
    attr_reader :flags
  end

  ##
  # @see https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.2.1
  attr_reader :items
end
