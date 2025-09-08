# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'vlq_base128_be'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Standard MIDI file, typically known just as "MID", is a standard way
# to serialize series of MIDI events, which is a protocol used in many
# music synthesizers to transfer music data: notes being played,
# effects being applied, etc.
# 
# Internally, file consists of a header and series of tracks, every
# track listing MIDI events with certain header designating time these
# events are happening.
# 
# NOTE: Rarely, MIDI files employ certain stateful compression scheme
# to avoid storing certain elements of further elements, instead
# reusing them from events which happened earlier in the
# stream. Kaitai Struct (as of v0.9) is currently unable to parse
# these, but files employing this mechanism are relatively rare.
class StandardMidiFile < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @hdr = Header.new(@_io, self, @_root)
    @tracks = []
    (hdr.num_tracks).times { |i|
      @tracks << Track.new(@_io, self, @_root)
    }
    self
  end
  class ChannelPressureEvent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @pressure = @_io.read_u1
      self
    end
    attr_reader :pressure
  end
  class ControllerEvent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @controller = @_io.read_u1
      @value = @_io.read_u1
      self
    end
    attr_reader :controller
    attr_reader :value
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([77, 84, 104, 100].pack('C*'), @magic, @_io, "/types/header/seq/0") if not @magic == [77, 84, 104, 100].pack('C*')
      @len_header = @_io.read_u4be
      @format = @_io.read_u2be
      @num_tracks = @_io.read_u2be
      @division = @_io.read_s2be
      self
    end
    attr_reader :magic
    attr_reader :len_header
    attr_reader :format
    attr_reader :num_tracks
    attr_reader :division
  end
  class MetaEventBody < Kaitai::Struct::Struct

    META_TYPE_ENUM = {
      0 => :meta_type_enum_sequence_number,
      1 => :meta_type_enum_text_event,
      2 => :meta_type_enum_copyright,
      3 => :meta_type_enum_sequence_track_name,
      4 => :meta_type_enum_instrument_name,
      5 => :meta_type_enum_lyric_text,
      6 => :meta_type_enum_marker_text,
      7 => :meta_type_enum_cue_point,
      32 => :meta_type_enum_midi_channel_prefix_assignment,
      47 => :meta_type_enum_end_of_track,
      81 => :meta_type_enum_tempo,
      84 => :meta_type_enum_smpte_offset,
      88 => :meta_type_enum_time_signature,
      89 => :meta_type_enum_key_signature,
      127 => :meta_type_enum_sequencer_specific_event,
    }
    I__META_TYPE_ENUM = META_TYPE_ENUM.invert
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @meta_type = Kaitai::Struct::Stream::resolve_enum(META_TYPE_ENUM, @_io.read_u1)
      @len = VlqBase128Be.new(@_io)
      @body = @_io.read_bytes(len.value)
      self
    end
    attr_reader :meta_type
    attr_reader :len
    attr_reader :body
  end
  class NoteOffEvent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @note = @_io.read_u1
      @velocity = @_io.read_u1
      self
    end
    attr_reader :note
    attr_reader :velocity
  end
  class NoteOnEvent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @note = @_io.read_u1
      @velocity = @_io.read_u1
      self
    end
    attr_reader :note
    attr_reader :velocity
  end
  class PitchBendEvent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @b1 = @_io.read_u1
      @b2 = @_io.read_u1
      self
    end
    def adj_bend_value
      return @adj_bend_value unless @adj_bend_value.nil?
      @adj_bend_value = bend_value - 16384
      @adj_bend_value
    end
    def bend_value
      return @bend_value unless @bend_value.nil?
      @bend_value = ((b2 << 7) + b1) - 16384
      @bend_value
    end
    attr_reader :b1
    attr_reader :b2
  end
  class PolyphonicPressureEvent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @note = @_io.read_u1
      @pressure = @_io.read_u1
      self
    end
    attr_reader :note
    attr_reader :pressure
  end
  class ProgramChangeEvent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @program = @_io.read_u1
      self
    end
    attr_reader :program
  end
  class SysexEventBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = VlqBase128Be.new(@_io)
      @data = @_io.read_bytes(len.value)
      self
    end
    attr_reader :len
    attr_reader :data
  end
  class Track < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([77, 84, 114, 107].pack('C*'), @magic, @_io, "/types/track/seq/0") if not @magic == [77, 84, 114, 107].pack('C*')
      @len_events = @_io.read_u4be
      _io_events = @_io.substream(len_events)
      @events = TrackEvents.new(_io_events, self, @_root)
      self
    end
    attr_reader :magic
    attr_reader :len_events
    attr_reader :events
    attr_reader :_raw_events
  end
  class TrackEvent < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @v_time = VlqBase128Be.new(@_io)
      @event_header = @_io.read_u1
      if event_header == 255
        @meta_event_body = MetaEventBody.new(@_io, self, @_root)
      end
      if event_header == 240
        @sysex_body = SysexEventBody.new(@_io, self, @_root)
      end
      case event_type
      when 128
        @event_body = NoteOffEvent.new(@_io, self, @_root)
      when 144
        @event_body = NoteOnEvent.new(@_io, self, @_root)
      when 160
        @event_body = PolyphonicPressureEvent.new(@_io, self, @_root)
      when 176
        @event_body = ControllerEvent.new(@_io, self, @_root)
      when 192
        @event_body = ProgramChangeEvent.new(@_io, self, @_root)
      when 208
        @event_body = ChannelPressureEvent.new(@_io, self, @_root)
      when 224
        @event_body = PitchBendEvent.new(@_io, self, @_root)
      end
      self
    end
    def channel
      return @channel unless @channel.nil?
      if event_type != 240
        @channel = event_header & 15
      end
      @channel
    end
    def event_type
      return @event_type unless @event_type.nil?
      @event_type = event_header & 240
      @event_type
    end
    attr_reader :v_time
    attr_reader :event_header
    attr_reader :meta_event_body
    attr_reader :sysex_body
    attr_reader :event_body
  end
  class TrackEvents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @event = []
      i = 0
      while not @_io.eof?
        @event << TrackEvent.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :event
  end
  attr_reader :hdr
  attr_reader :tracks
end
