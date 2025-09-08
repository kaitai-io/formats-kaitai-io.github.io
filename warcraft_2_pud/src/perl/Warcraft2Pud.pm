# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Warcraft2Pud;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CONTROLLER_COMPUTER1 = 1;
our $CONTROLLER_PASSIVE_COMPUTER = 2;
our $CONTROLLER_NOBODY = 3;
our $CONTROLLER_COMPUTER4 = 4;
our $CONTROLLER_HUMAN = 5;
our $CONTROLLER_RESCUE_PASSIVE = 6;
our $CONTROLLER_RESCUE_ACTIVE = 7;

our $TERRAIN_TYPE_FOREST = 0;
our $TERRAIN_TYPE_WINTER = 1;
our $TERRAIN_TYPE_WASTELAND = 2;
our $TERRAIN_TYPE_SWAMP = 3;

our $UNIT_TYPE_INFANTRY = 0;
our $UNIT_TYPE_GRUNT = 1;
our $UNIT_TYPE_PEASANT = 2;
our $UNIT_TYPE_PEON = 3;
our $UNIT_TYPE_BALLISTA = 4;
our $UNIT_TYPE_CATAPULT = 5;
our $UNIT_TYPE_KNIGHT = 6;
our $UNIT_TYPE_OGRE = 7;
our $UNIT_TYPE_ARCHER = 8;
our $UNIT_TYPE_AXETHROWER = 9;
our $UNIT_TYPE_MAGE = 10;
our $UNIT_TYPE_DEATH_KNIGHT = 11;
our $UNIT_TYPE_PALADIN = 12;
our $UNIT_TYPE_OGRE_MAGE = 13;
our $UNIT_TYPE_DWARVES = 14;
our $UNIT_TYPE_GOBLIN_SAPPER = 15;
our $UNIT_TYPE_ATTACK_PEASANT = 16;
our $UNIT_TYPE_ATTACK_PEON = 17;
our $UNIT_TYPE_RANGER = 18;
our $UNIT_TYPE_BERSERKER = 19;
our $UNIT_TYPE_ALLERIA = 20;
our $UNIT_TYPE_TERON_GOREFIEND = 21;
our $UNIT_TYPE_KURDAN_AND_SKY_REE = 22;
our $UNIT_TYPE_DENTARG = 23;
our $UNIT_TYPE_KHADGAR = 24;
our $UNIT_TYPE_GROM_HELLSCREAM = 25;
our $UNIT_TYPE_HUMAN_TANKER = 26;
our $UNIT_TYPE_ORC_TANKER = 27;
our $UNIT_TYPE_HUMAN_TRANSPORT = 28;
our $UNIT_TYPE_ORC_TRANSPORT = 29;
our $UNIT_TYPE_ELVEN_DESTROYER = 30;
our $UNIT_TYPE_TROLL_DESTROYER = 31;
our $UNIT_TYPE_BATTLESHIP = 32;
our $UNIT_TYPE_JUGGERNAUGHT = 33;
our $UNIT_TYPE_DEATHWING = 35;
our $UNIT_TYPE_GNOMISH_SUBMARINE = 38;
our $UNIT_TYPE_GIANT_TURTLE = 39;
our $UNIT_TYPE_GNOMISH_FLYING_MACHINE = 40;
our $UNIT_TYPE_GOBLIN_ZEPPLIN = 41;
our $UNIT_TYPE_GRYPHON_RIDER = 42;
our $UNIT_TYPE_DRAGON = 43;
our $UNIT_TYPE_TURALYON = 44;
our $UNIT_TYPE_EYE_OF_KILROGG = 45;
our $UNIT_TYPE_DANATH = 46;
our $UNIT_TYPE_KHORGATH_BLADEFIST = 47;
our $UNIT_TYPE_CHO_GALL = 49;
our $UNIT_TYPE_LOTHAR = 50;
our $UNIT_TYPE_GUL_DAN = 51;
our $UNIT_TYPE_UTHER_LIGHTBRINGER = 52;
our $UNIT_TYPE_ZULJIN = 53;
our $UNIT_TYPE_SKELETON = 55;
our $UNIT_TYPE_DAEMON = 56;
our $UNIT_TYPE_CRITTER = 57;
our $UNIT_TYPE_FARM = 58;
our $UNIT_TYPE_PIG_FARM = 59;
our $UNIT_TYPE_HUMAN_BARRACKS = 60;
our $UNIT_TYPE_ORC_BARRACKS = 61;
our $UNIT_TYPE_CHURCH = 62;
our $UNIT_TYPE_ALTAR_OF_STORMS = 63;
our $UNIT_TYPE_HUMAN_SCOUT_TOWER = 64;
our $UNIT_TYPE_ORC_SCOUT_TOWER = 65;
our $UNIT_TYPE_STABLES = 66;
our $UNIT_TYPE_OGRE_MOUND = 67;
our $UNIT_TYPE_GNOMISH_INVENTOR = 68;
our $UNIT_TYPE_GOBLIN_ALCHEMIST = 69;
our $UNIT_TYPE_GRYPHON_AVIARY = 70;
our $UNIT_TYPE_DRAGON_ROOST = 71;
our $UNIT_TYPE_HUMAN_SHIPYARD = 72;
our $UNIT_TYPE_ORC_SHIPYARD = 73;
our $UNIT_TYPE_TOWN_HALL = 74;
our $UNIT_TYPE_GREAT_HALL = 75;
our $UNIT_TYPE_ELVEN_LUMBER_MILL = 76;
our $UNIT_TYPE_TROLL_LUMBER_MILL = 77;
our $UNIT_TYPE_HUMAN_FOUNDRY = 78;
our $UNIT_TYPE_ORC_FOUNDRY = 79;
our $UNIT_TYPE_MAGE_TOWER = 80;
our $UNIT_TYPE_TEMPLE_OF_THE_DAMNED = 81;
our $UNIT_TYPE_HUMAN_BLACKSMITH = 82;
our $UNIT_TYPE_ORC_BLACKSMITH = 83;
our $UNIT_TYPE_HUMAN_REFINERY = 84;
our $UNIT_TYPE_ORC_REFINERY = 85;
our $UNIT_TYPE_HUMAN_OIL_WELL = 86;
our $UNIT_TYPE_ORC_OIL_WELL = 87;
our $UNIT_TYPE_KEEP = 88;
our $UNIT_TYPE_STRONGHOLD = 89;
our $UNIT_TYPE_CASTLE = 90;
our $UNIT_TYPE_FORTRESS = 91;
our $UNIT_TYPE_GOLD_MINE = 92;
our $UNIT_TYPE_OIL_PATCH = 93;
our $UNIT_TYPE_HUMAN_START = 94;
our $UNIT_TYPE_ORC_START = 95;
our $UNIT_TYPE_HUMAN_GUARD_TOWER = 96;
our $UNIT_TYPE_ORC_GUARD_TOWER = 97;
our $UNIT_TYPE_HUMAN_CANNON_TOWER = 98;
our $UNIT_TYPE_ORC_CANNON_TOWER = 99;
our $UNIT_TYPE_CIRCLE_OF_POWER = 100;
our $UNIT_TYPE_DARK_PORTAL = 101;
our $UNIT_TYPE_RUNESTONE = 102;
our $UNIT_TYPE_HUMAN_WALL = 103;
our $UNIT_TYPE_ORC_WALL = 104;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{sections} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{sections}}, Warcraft2Pud::Section->new($self->{_io}, $self, $self->{_root});
    }
}

sub sections {
    my ($self) = @_;
    return $self->{sections};
}

########################################################################
package Warcraft2Pud::Section;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{size} = $self->{_io}->read_u4le();
    my $_on = $self->name();
    if ($_on eq "DIM ") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionDim->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "ERA ") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionEra->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "ERAX") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionEra->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "OWNR") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionOwnr->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "SGLD") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionStartingResource->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "SLBR") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionStartingResource->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "SOIL") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionStartingResource->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "TYPE") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionType->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "UNIT") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionUnit->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "VER ") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Warcraft2Pud::SectionVer->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->size());
    }
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Warcraft2Pud::SectionDim;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_u2le();
    $self->{y} = $self->{_io}->read_u2le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package Warcraft2Pud::SectionEra;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{terrain} = $self->{_io}->read_u2le();
}

sub terrain {
    my ($self) = @_;
    return $self->{terrain};
}

########################################################################
package Warcraft2Pud::SectionOwnr;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{controller_by_player} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{controller_by_player}}, $self->{_io}->read_u1();
    }
}

sub controller_by_player {
    my ($self) = @_;
    return $self->{controller_by_player};
}

########################################################################
package Warcraft2Pud::SectionStartingResource;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{resources_by_player} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{resources_by_player}}, $self->{_io}->read_u2le();
    }
}

sub resources_by_player {
    my ($self) = @_;
    return $self->{resources_by_player};
}

########################################################################
package Warcraft2Pud::SectionType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(10);
    $self->{unused} = $self->{_io}->read_bytes(2);
    $self->{id_tag} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

sub id_tag {
    my ($self) = @_;
    return $self->{id_tag};
}

########################################################################
package Warcraft2Pud::SectionUnit;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{units} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{units}}, Warcraft2Pud::Unit->new($self->{_io}, $self, $self->{_root});
    }
}

sub units {
    my ($self) = @_;
    return $self->{units};
}

########################################################################
package Warcraft2Pud::SectionVer;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_u2le();
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

########################################################################
package Warcraft2Pud::Unit;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_u2le();
    $self->{y} = $self->{_io}->read_u2le();
    $self->{u_type} = $self->{_io}->read_u1();
    $self->{owner} = $self->{_io}->read_u1();
    $self->{options} = $self->{_io}->read_u2le();
}

sub resource {
    my ($self) = @_;
    return $self->{resource} if ($self->{resource});
    if ( (($self->u_type() == $Warcraft2Pud::UNIT_TYPE_GOLD_MINE) || ($self->u_type() == $Warcraft2Pud::UNIT_TYPE_HUMAN_OIL_WELL) || ($self->u_type() == $Warcraft2Pud::UNIT_TYPE_ORC_OIL_WELL) || ($self->u_type() == $Warcraft2Pud::UNIT_TYPE_OIL_PATCH)) ) {
        $self->{resource} = $self->options() * 2500;
    }
    return $self->{resource};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub u_type {
    my ($self) = @_;
    return $self->{u_type};
}

sub owner {
    my ($self) = @_;
    return $self->{owner};
}

sub options {
    my ($self) = @_;
    return $self->{options};
}

1;
