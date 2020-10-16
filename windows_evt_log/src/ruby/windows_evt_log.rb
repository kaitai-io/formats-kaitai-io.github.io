# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# EVT files are Windows Event Log files written by older Windows
# operating systems (2000, XP, 2003). They are used as binary log
# files by several major Windows subsystems and
# applications. Typically, several of them can be found in
# `%WINDIR%\system32\config` directory:
# 
# * Application = `AppEvent.evt`
# * System = `SysEvent.evt`
# * Security = `SecEvent.evt`
# 
# Alternatively, one can export any system event log as distinct .evt
# file using relevant option in Event Viewer application.
# 
# A Windows application can submit an entry into these logs using
# [ReportEvent](https://msdn.microsoft.com/en-us/library/aa363679(v=vs.85).aspx)
# function of Windows API.
# 
# Internally, EVT files consist of a fixed-size header and event
# records. There are several usage scenarios (non-wrapping vs wrapping
# log files) which result in slightly different organization of
# records.
# @see https://msdn.microsoft.com/en-us/library/bb309026(v=vs.85).aspx Source
class WindowsEvtLog < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    @records = []
    i = 0
    while not @_io.eof?
      @records << Record.new(@_io, self, @_root)
      i += 1
    end
    self
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/bb309024(v=vs.85).aspx Source
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_header = @_io.read_u4le
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([76, 102, 76, 101].pack('C*'), magic, _io, "/types/header/seq/1") if not magic == [76, 102, 76, 101].pack('C*')
      @version_major = @_io.read_u4le
      @version_minor = @_io.read_u4le
      @ofs_start = @_io.read_u4le
      @ofs_end = @_io.read_u4le
      @cur_rec_idx = @_io.read_u4le
      @oldest_rec_idx = @_io.read_u4le
      @len_file_max = @_io.read_u4le
      @flags = Flags.new(@_io, self, @_root)
      @retention = @_io.read_u4le
      @len_header_2 = @_io.read_u4le
      self
    end
    class Flags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_bits_int_be(28)
        @archive = @_io.read_bits_int_be(1) != 0
        @log_full = @_io.read_bits_int_be(1) != 0
        @wrap = @_io.read_bits_int_be(1) != 0
        @dirty = @_io.read_bits_int_be(1) != 0
        self
      end
      attr_reader :reserved

      ##
      # True if archive attribute has been set for this log file.
      attr_reader :archive

      ##
      # True if last write operation failed due to log being full.
      attr_reader :log_full

      ##
      # True if wrapping of record has occured.
      attr_reader :wrap

      ##
      # True if write operation was in progress, but log file
      # wasn't properly closed.
      attr_reader :dirty
    end

    ##
    # Size of the header structure, must be 0x30.
    attr_reader :len_header
    attr_reader :magic
    attr_reader :version_major
    attr_reader :version_minor

    ##
    # Offset of oldest record kept in this log file.
    attr_reader :ofs_start

    ##
    # Offset of EOF log record, which is a placeholder for new record.
    attr_reader :ofs_end

    ##
    # Index of current record, where a new submission would be
    # written to (normally there should to EOF log record there).
    attr_reader :cur_rec_idx

    ##
    # Index of oldest record in the log file
    attr_reader :oldest_rec_idx

    ##
    # Total maximum size of the log file
    attr_reader :len_file_max
    attr_reader :flags
    attr_reader :retention

    ##
    # Size of the header structure repeated again, and again it must be 0x30.
    attr_reader :len_header_2
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/windows/desktop/aa363646(v=vs.85).aspx Source
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_record = @_io.read_u4le
      @type = @_io.read_u4le
      case type
      when 1699505740
        @_raw_body = @_io.read_bytes((len_record - 12))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = RecordBody.new(_io__raw_body, self, @_root)
      when 286331153
        @_raw_body = @_io.read_bytes((len_record - 12))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = CursorRecordBody.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes((len_record - 12))
      end
      @len_record2 = @_io.read_u4le
      self
    end

    ##
    # Size of whole record, including all headers, footers and data
    attr_reader :len_record

    ##
    # Type of record. Normal log records specify "LfLe"
    # (0x654c664c) in this field, cursor records use 0x11111111.
    attr_reader :type

    ##
    # Record body interpretation depends on type of record. Body
    # size is specified in a way that it won't include a 8-byte
    # "header" (`len_record` + `type`) and a "footer"
    # (`len_record2`).
    attr_reader :body

    ##
    # Size of whole record again.
    attr_reader :len_record2
    attr_reader :_raw_body
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/windows/desktop/aa363646(v=vs.85).aspx Source
  class RecordBody < Kaitai::Struct::Struct

    EVENT_TYPES = {
      1 => :event_types_error,
      2 => :event_types_audit_failure,
      3 => :event_types_audit_success,
      4 => :event_types_info,
      5 => :event_types_warning,
    }
    I__EVENT_TYPES = EVENT_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @idx = @_io.read_u4le
      @time_generated = @_io.read_u4le
      @time_written = @_io.read_u4le
      @event_id = @_io.read_u4le
      @event_type = Kaitai::Struct::Stream::resolve_enum(EVENT_TYPES, @_io.read_u2le)
      @num_strings = @_io.read_u2le
      @event_category = @_io.read_u2le
      @reserved = @_io.read_bytes(6)
      @ofs_strings = @_io.read_u4le
      @len_user_sid = @_io.read_u4le
      @ofs_user_sid = @_io.read_u4le
      @len_data = @_io.read_u4le
      @ofs_data = @_io.read_u4le
      self
    end
    def user_sid
      return @user_sid unless @user_sid.nil?
      _pos = @_io.pos
      @_io.seek((ofs_user_sid - 8))
      @user_sid = @_io.read_bytes(len_user_sid)
      @_io.seek(_pos)
      @user_sid
    end
    def data
      return @data unless @data.nil?
      _pos = @_io.pos
      @_io.seek((ofs_data - 8))
      @data = @_io.read_bytes(len_data)
      @_io.seek(_pos)
      @data
    end

    ##
    # Index of record in the file.
    attr_reader :idx

    ##
    # Time when this record was generated, POSIX timestamp format.
    attr_reader :time_generated

    ##
    # Time when thsi record was written into the log file, POSIX timestamp format.
    attr_reader :time_written

    ##
    # Identifier of an event, meaning is specific to particular
    # source of events / event type.
    attr_reader :event_id

    ##
    # Type of event.
    # @see https://msdn.microsoft.com/en-us/library/windows/desktop/aa363662(v=vs.85).aspx Source
    attr_reader :event_type

    ##
    # Number of strings present in the log.
    attr_reader :num_strings

    ##
    # @see https://msdn.microsoft.com/en-us/library/windows/desktop/aa363649(v=vs.85).aspx Source
    attr_reader :event_category
    attr_reader :reserved

    ##
    # Offset of strings present in the log
    attr_reader :ofs_strings
    attr_reader :len_user_sid
    attr_reader :ofs_user_sid
    attr_reader :len_data
    attr_reader :ofs_data
  end

  ##
  # @see http://www.forensicswiki.xyz/page/Windows_Event_Log_(EVT)#Cursor_Record Source
  class CursorRecordBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(12)
      raise Kaitai::Struct::ValidationNotEqualError.new([34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68].pack('C*'), magic, _io, "/types/cursor_record_body/seq/0") if not magic == [34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68].pack('C*')
      @ofs_first_record = @_io.read_u4le
      @ofs_next_record = @_io.read_u4le
      @idx_next_record = @_io.read_u4le
      @idx_first_record = @_io.read_u4le
      self
    end
    attr_reader :magic
    attr_reader :ofs_first_record
    attr_reader :ofs_next_record
    attr_reader :idx_next_record
    attr_reader :idx_first_record
  end
  attr_reader :header
  attr_reader :records
end
