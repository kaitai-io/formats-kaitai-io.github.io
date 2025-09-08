# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GENMIDI.OP2 is a sound bank file used by players based on DMX sound
# library to play MIDI files with General MIDI instruments using OPL2
# sound chip (which was commonly installed on popular AdLib and Sound
# Blaster sound cards).
# 
# Major users of DMX sound library include:
# 
# * Original Doom game engine (and games based on it: Heretic, Hexen, Strife, Chex Quest)
# * Raptor: Call of the Shadows
# @see http://www.fit.vutbr.cz/~arnost/muslib/op2_form.zip Source
# @see https://doom.fandom.com/wiki/GENMIDI Source
# @see https://moddingwiki.shikadi.net/wiki/OP2_Bank_Format Source
class GenmidiOp2 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(8)
    raise Kaitai::Struct::ValidationNotEqualError.new([35, 79, 80, 76, 95, 73, 73, 35].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [35, 79, 80, 76, 95, 73, 73, 35].pack('C*')
    @instruments = []
    (175).times { |i|
      @instruments << InstrumentEntry.new(@_io, self, @_root)
    }
    @instrument_names = []
    (175).times { |i|
      @instrument_names << (Kaitai::Struct::Stream::bytes_terminate(Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(32), 0), 0, false)).force_encoding("ASCII").encode('UTF-8')
    }
    self
  end
  class Instrument < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @op1 = OpSettings.new(@_io, self, @_root)
      @feedback = @_io.read_u1
      @op2 = OpSettings.new(@_io, self, @_root)
      @unused = @_io.read_u1
      @base_note = @_io.read_s2le
      self
    end
    attr_reader :op1

    ##
    # Feedback/AM-FM (both operators)
    attr_reader :feedback
    attr_reader :op2
    attr_reader :unused

    ##
    # Base note offset
    attr_reader :base_note
  end
  class InstrumentEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = @_io.read_u2le
      @finetune = @_io.read_u1
      @note = @_io.read_u1
      @instruments = []
      (2).times { |i|
        @instruments << Instrument.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :flags
    attr_reader :finetune

    ##
    # MIDI note for fixed instruments, 0 otherwise
    attr_reader :note
    attr_reader :instruments
  end

  ##
  # OPL2 settings for one operator (carrier or modulator)
  class OpSettings < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @trem_vibr = @_io.read_u1
      @att_dec = @_io.read_u1
      @sust_rel = @_io.read_u1
      @wave = @_io.read_u1
      @scale = @_io.read_u1
      @level = @_io.read_u1
      self
    end

    ##
    # Tremolo/vibrato/sustain/KSR/multi
    attr_reader :trem_vibr

    ##
    # Attack rate/decay rate
    attr_reader :att_dec

    ##
    # Sustain level/release rate
    attr_reader :sust_rel

    ##
    # Waveform select
    attr_reader :wave

    ##
    # Key scale level
    attr_reader :scale

    ##
    # Output level
    attr_reader :level
  end
  attr_reader :magic
  attr_reader :instruments
  attr_reader :instrument_names
end
