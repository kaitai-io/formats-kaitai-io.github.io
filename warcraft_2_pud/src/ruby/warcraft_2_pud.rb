# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Warcraft II game engine uses this format for map files. External
# maps can be edited by official Warcraft II map editor and saved in
# .pud files. Maps supplied with the game (i.e. single player
# campaign) follow the same format, but are instead embedded inside
# the game container files.
# 
# There are two major versions: 0x11 (original one) and 0x13 (roughly
# corresponds to v1.33 of the game engine, although some of the
# features got limited support in v1.3).
# 
# File consists of a sequence of typed sections.
class Warcraft2Pud < Kaitai::Struct::Struct

  CONTROLLER = {
    1 => :controller_computer,
    2 => :controller_passive_computer,
    3 => :controller_nobody,
    4 => :controller_computer,
    5 => :controller_human,
    6 => :controller_rescue_passive,
    7 => :controller_rescue_active,
  }
  I__CONTROLLER = CONTROLLER.invert

  TERRAIN_TYPE = {
    0 => :terrain_type_forest,
    1 => :terrain_type_winter,
    2 => :terrain_type_wasteland,
    3 => :terrain_type_swamp,
  }
  I__TERRAIN_TYPE = TERRAIN_TYPE.invert

  UNIT_TYPE = {
    0 => :unit_type_infantry,
    1 => :unit_type_grunt,
    2 => :unit_type_peasant,
    3 => :unit_type_peon,
    4 => :unit_type_ballista,
    5 => :unit_type_catapult,
    6 => :unit_type_knight,
    7 => :unit_type_ogre,
    8 => :unit_type_archer,
    9 => :unit_type_axethrower,
    10 => :unit_type_mage,
    11 => :unit_type_death_knight,
    12 => :unit_type_paladin,
    13 => :unit_type_ogre_mage,
    14 => :unit_type_dwarves,
    15 => :unit_type_goblin_sapper,
    16 => :unit_type_attack_peasant,
    17 => :unit_type_attack_peon,
    18 => :unit_type_ranger,
    19 => :unit_type_berserker,
    20 => :unit_type_alleria,
    21 => :unit_type_teron_gorefiend,
    22 => :unit_type_kurdan_and_sky_ree,
    23 => :unit_type_dentarg,
    24 => :unit_type_khadgar,
    25 => :unit_type_grom_hellscream,
    26 => :unit_type_human_tanker,
    27 => :unit_type_orc_tanker,
    28 => :unit_type_human_transport,
    29 => :unit_type_orc_transport,
    30 => :unit_type_elven_destroyer,
    31 => :unit_type_troll_destroyer,
    32 => :unit_type_battleship,
    33 => :unit_type_juggernaught,
    35 => :unit_type_deathwing,
    38 => :unit_type_gnomish_submarine,
    39 => :unit_type_giant_turtle,
    40 => :unit_type_gnomish_flying_machine,
    41 => :unit_type_goblin_zepplin,
    42 => :unit_type_gryphon_rider,
    43 => :unit_type_dragon,
    44 => :unit_type_turalyon,
    45 => :unit_type_eye_of_kilrogg,
    46 => :unit_type_danath,
    47 => :unit_type_khorgath_bladefist,
    49 => :unit_type_cho_gall,
    50 => :unit_type_lothar,
    51 => :unit_type_gul_dan,
    52 => :unit_type_uther_lightbringer,
    53 => :unit_type_zuljin,
    55 => :unit_type_skeleton,
    56 => :unit_type_daemon,
    57 => :unit_type_critter,
    58 => :unit_type_farm,
    59 => :unit_type_pig_farm,
    60 => :unit_type_human_barracks,
    61 => :unit_type_orc_barracks,
    62 => :unit_type_church,
    63 => :unit_type_altar_of_storms,
    64 => :unit_type_human_scout_tower,
    65 => :unit_type_orc_scout_tower,
    66 => :unit_type_stables,
    67 => :unit_type_ogre_mound,
    68 => :unit_type_gnomish_inventor,
    69 => :unit_type_goblin_alchemist,
    70 => :unit_type_gryphon_aviary,
    71 => :unit_type_dragon_roost,
    72 => :unit_type_human_shipyard,
    73 => :unit_type_orc_shipyard,
    74 => :unit_type_town_hall,
    75 => :unit_type_great_hall,
    76 => :unit_type_elven_lumber_mill,
    77 => :unit_type_troll_lumber_mill,
    78 => :unit_type_human_foundry,
    79 => :unit_type_orc_foundry,
    80 => :unit_type_mage_tower,
    81 => :unit_type_temple_of_the_damned,
    82 => :unit_type_human_blacksmith,
    83 => :unit_type_orc_blacksmith,
    84 => :unit_type_human_refinery,
    85 => :unit_type_orc_refinery,
    86 => :unit_type_human_oil_well,
    87 => :unit_type_orc_oil_well,
    88 => :unit_type_keep,
    89 => :unit_type_stronghold,
    90 => :unit_type_castle,
    91 => :unit_type_fortress,
    92 => :unit_type_gold_mine,
    93 => :unit_type_oil_patch,
    94 => :unit_type_human_start,
    95 => :unit_type_orc_start,
    96 => :unit_type_human_guard_tower,
    97 => :unit_type_orc_guard_tower,
    98 => :unit_type_human_cannon_tower,
    99 => :unit_type_orc_cannon_tower,
    100 => :unit_type_circle_of_power,
    101 => :unit_type_dark_portal,
    102 => :unit_type_runestone,
    103 => :unit_type_human_wall,
    104 => :unit_type_orc_wall,
  }
  I__UNIT_TYPE = UNIT_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @sections = []
    while not @_io.eof?
      @sections << Section.new(@_io, self, @_root)
    end
    self
  end
  class SectionStartingResource < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @resources_by_player = []
      while not @_io.eof?
        @resources_by_player << @_io.read_u2le
      end
      self
    end
    attr_reader :resources_by_player
  end

  ##
  # Section that specifies terrain type for this map.
  class SectionEra < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @terrain = Kaitai::Struct::Stream::resolve_enum(TERRAIN_TYPE, @_io.read_u2le)
      self
    end
    attr_reader :terrain
  end

  ##
  # Section that specifies format version.
  class SectionVer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u2le
      self
    end
    attr_reader :version
  end
  class SectionDim < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_u2le
      @y = @_io.read_u2le
      self
    end
    attr_reader :x
    attr_reader :y
  end

  ##
  # Section that confirms that this file is a "map file" by certain
  # magic string and supplies a tag that could be used in
  # multiplayer to check that all player use the same version of the
  # map.
  class SectionType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([87, 65, 82, 50, 32, 77, 65, 80, 0, 0].pack('C*'))
      @unused = @_io.read_bytes(2)
      @id_tag = @_io.read_u4le
      self
    end
    attr_reader :magic

    ##
    # unused (always set to $0a and $ff by editor, but can be anything for the game)
    attr_reader :unused

    ##
    # id tag (for consistence check in multiplayer)
    attr_reader :id_tag
  end
  class SectionUnit < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @units = []
      while not @_io.eof?
        @units << Unit.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :units
  end
  class Section < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (@_io.read_bytes(4)).force_encoding("ASCII")
      @size = @_io.read_u4le
      case name
      when "SLBR"
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionStartingResource.new(io, self, @_root)
      when "ERAX"
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionEra.new(io, self, @_root)
      when "OWNR"
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionOwnr.new(io, self, @_root)
      when "ERA "
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionEra.new(io, self, @_root)
      when "SGLD"
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionStartingResource.new(io, self, @_root)
      when "VER "
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionVer.new(io, self, @_root)
      when "SOIL"
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionStartingResource.new(io, self, @_root)
      when "UNIT"
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionUnit.new(io, self, @_root)
      when "DIM "
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionDim.new(io, self, @_root)
      when "TYPE"
        @_raw_body = @_io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SectionType.new(io, self, @_root)
      else
        @body = @_io.read_bytes(size)
      end
      self
    end
    attr_reader :name
    attr_reader :size
    attr_reader :body
    attr_reader :_raw_body
  end

  ##
  # Section that specifies who controls each player.
  class SectionOwnr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @controller_by_player = []
      while not @_io.eof?
        @controller_by_player << Kaitai::Struct::Stream::resolve_enum(CONTROLLER, @_io.read_u1)
      end
      self
    end
    attr_reader :controller_by_player
  end
  class Unit < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_u2le
      @y = @_io.read_u2le
      @u_type = Kaitai::Struct::Stream::resolve_enum(UNIT_TYPE, @_io.read_u1)
      @owner = @_io.read_u1
      @options = @_io.read_u2le
      self
    end
    def resource
      return @resource unless @resource.nil?
      if  ((u_type == :unit_type_gold_mine) || (u_type == :unit_type_human_oil_well) || (u_type == :unit_type_orc_oil_well) || (u_type == :unit_type_oil_patch)) 
        @resource = (options * 2500)
      end
      @resource
    end
    attr_reader :x
    attr_reader :y
    attr_reader :u_type
    attr_reader :owner

    ##
    # if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
    attr_reader :options
  end
  attr_reader :sections
end
