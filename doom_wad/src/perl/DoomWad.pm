# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package DoomWad;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{num_index_entries} = $self->{_io}->read_s4le();
    $self->{index_offset} = $self->{_io}->read_s4le();
}

sub index {
    my ($self) = @_;
    return $self->{index} if ($self->{index});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->index_offset());
    $self->{index} = ();
    my $n_index = $self->num_index_entries();
    for (my $i = 0; $i < $n_index; $i++) {
        $self->{index}[$i] = DoomWad::IndexEntry->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{index};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub num_index_entries {
    my ($self) = @_;
    return $self->{num_index_entries};
}

sub index_offset {
    my ($self) = @_;
    return $self->{index_offset};
}

########################################################################
package DoomWad::Sectors;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, DoomWad::Sector->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package DoomWad::Vertex;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_s2le();
    $self->{y} = $self->{_io}->read_s2le();
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
package DoomWad::Texture12;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_textures} = $self->{_io}->read_s4le();
    $self->{textures} = ();
    my $n_textures = $self->num_textures();
    for (my $i = 0; $i < $n_textures; $i++) {
        $self->{textures}[$i] = DoomWad::Texture12::TextureIndex->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_textures {
    my ($self) = @_;
    return $self->{num_textures};
}

sub textures {
    my ($self) = @_;
    return $self->{textures};
}

########################################################################
package DoomWad::Texture12::TextureIndex;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{offset} = $self->{_io}->read_s4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->offset());
    $self->{body} = DoomWad::Texture12::TextureBody->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

########################################################################
package DoomWad::Texture12::TextureBody;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(8), 0));
    $self->{masked} = $self->{_io}->read_u4le();
    $self->{width} = $self->{_io}->read_u2le();
    $self->{height} = $self->{_io}->read_u2le();
    $self->{column_directory} = $self->{_io}->read_u4le();
    $self->{num_patches} = $self->{_io}->read_u2le();
    $self->{patches} = ();
    my $n_patches = $self->num_patches();
    for (my $i = 0; $i < $n_patches; $i++) {
        $self->{patches}[$i] = DoomWad::Texture12::Patch->new($self->{_io}, $self, $self->{_root});
    }
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub masked {
    my ($self) = @_;
    return $self->{masked};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub column_directory {
    my ($self) = @_;
    return $self->{column_directory};
}

sub num_patches {
    my ($self) = @_;
    return $self->{num_patches};
}

sub patches {
    my ($self) = @_;
    return $self->{patches};
}

########################################################################
package DoomWad::Texture12::Patch;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{origin_x} = $self->{_io}->read_s2le();
    $self->{origin_y} = $self->{_io}->read_s2le();
    $self->{patch_id} = $self->{_io}->read_u2le();
    $self->{step_dir} = $self->{_io}->read_u2le();
    $self->{colormap} = $self->{_io}->read_u2le();
}

sub origin_x {
    my ($self) = @_;
    return $self->{origin_x};
}

sub origin_y {
    my ($self) = @_;
    return $self->{origin_y};
}

sub patch_id {
    my ($self) = @_;
    return $self->{patch_id};
}

sub step_dir {
    my ($self) = @_;
    return $self->{step_dir};
}

sub colormap {
    my ($self) = @_;
    return $self->{colormap};
}

########################################################################
package DoomWad::Linedef;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{vertex_start_idx} = $self->{_io}->read_u2le();
    $self->{vertex_end_idx} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{line_type} = $self->{_io}->read_u2le();
    $self->{sector_tag} = $self->{_io}->read_u2le();
    $self->{sidedef_right_idx} = $self->{_io}->read_u2le();
    $self->{sidedef_left_idx} = $self->{_io}->read_u2le();
}

sub vertex_start_idx {
    my ($self) = @_;
    return $self->{vertex_start_idx};
}

sub vertex_end_idx {
    my ($self) = @_;
    return $self->{vertex_end_idx};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub line_type {
    my ($self) = @_;
    return $self->{line_type};
}

sub sector_tag {
    my ($self) = @_;
    return $self->{sector_tag};
}

sub sidedef_right_idx {
    my ($self) = @_;
    return $self->{sidedef_right_idx};
}

sub sidedef_left_idx {
    my ($self) = @_;
    return $self->{sidedef_left_idx};
}

########################################################################
package DoomWad::Pnames;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_patches} = $self->{_io}->read_u4le();
    $self->{names} = ();
    my $n_names = $self->num_patches();
    for (my $i = 0; $i < $n_names; $i++) {
        $self->{names}[$i] = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(8), 0));
    }
}

sub num_patches {
    my ($self) = @_;
    return $self->{num_patches};
}

sub names {
    my ($self) = @_;
    return $self->{names};
}

########################################################################
package DoomWad::Thing;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_s2le();
    $self->{y} = $self->{_io}->read_s2le();
    $self->{angle} = $self->{_io}->read_u2le();
    $self->{type} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u2le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub angle {
    my ($self) = @_;
    return $self->{angle};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

########################################################################
package DoomWad::Sector;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SPECIAL_SECTOR_NORMAL = 0;
our $SPECIAL_SECTOR_D_LIGHT_FLICKER = 1;
our $SPECIAL_SECTOR_D_LIGHT_STROBE_FAST = 2;
our $SPECIAL_SECTOR_D_LIGHT_STROBE_SLOW = 3;
our $SPECIAL_SECTOR_D_LIGHT_STROBE_HURT = 4;
our $SPECIAL_SECTOR_D_DAMAGE_HELLSLIME = 5;
our $SPECIAL_SECTOR_D_DAMAGE_NUKAGE = 7;
our $SPECIAL_SECTOR_D_LIGHT_GLOW = 8;
our $SPECIAL_SECTOR_SECRET = 9;
our $SPECIAL_SECTOR_D_SECTOR_DOOR_CLOSE_IN_30 = 10;
our $SPECIAL_SECTOR_D_DAMAGE_END = 11;
our $SPECIAL_SECTOR_D_LIGHT_STROBE_SLOW_SYNC = 12;
our $SPECIAL_SECTOR_D_LIGHT_STROBE_FAST_SYNC = 13;
our $SPECIAL_SECTOR_D_SECTOR_DOOR_RAISE_IN_5_MINS = 14;
our $SPECIAL_SECTOR_D_FRICTION_LOW = 15;
our $SPECIAL_SECTOR_D_DAMAGE_SUPER_HELLSLIME = 16;
our $SPECIAL_SECTOR_D_LIGHT_FIRE_FLICKER = 17;
our $SPECIAL_SECTOR_D_DAMAGE_LAVA_WIMPY = 18;
our $SPECIAL_SECTOR_D_DAMAGE_LAVA_HEFTY = 19;
our $SPECIAL_SECTOR_D_SCROLL_EAST_LAVA_DAMAGE = 20;
our $SPECIAL_SECTOR_LIGHT_PHASED = 21;
our $SPECIAL_SECTOR_LIGHT_SEQUENCE_START = 22;
our $SPECIAL_SECTOR_LIGHT_SEQUENCE_SPECIAL1 = 23;
our $SPECIAL_SECTOR_LIGHT_SEQUENCE_SPECIAL2 = 24;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{floor_z} = $self->{_io}->read_s2le();
    $self->{ceil_z} = $self->{_io}->read_s2le();
    $self->{floor_flat} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{ceil_flat} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{light} = $self->{_io}->read_s2le();
    $self->{special_type} = $self->{_io}->read_u2le();
    $self->{tag} = $self->{_io}->read_u2le();
}

sub floor_z {
    my ($self) = @_;
    return $self->{floor_z};
}

sub ceil_z {
    my ($self) = @_;
    return $self->{ceil_z};
}

sub floor_flat {
    my ($self) = @_;
    return $self->{floor_flat};
}

sub ceil_flat {
    my ($self) = @_;
    return $self->{ceil_flat};
}

sub light {
    my ($self) = @_;
    return $self->{light};
}

sub special_type {
    my ($self) = @_;
    return $self->{special_type};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

########################################################################
package DoomWad::Vertexes;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, DoomWad::Vertex->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package DoomWad::Sidedef;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{offset_x} = $self->{_io}->read_s2le();
    $self->{offset_y} = $self->{_io}->read_s2le();
    $self->{upper_texture_name} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{lower_texture_name} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{normal_texture_name} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{sector_id} = $self->{_io}->read_s2le();
}

sub offset_x {
    my ($self) = @_;
    return $self->{offset_x};
}

sub offset_y {
    my ($self) = @_;
    return $self->{offset_y};
}

sub upper_texture_name {
    my ($self) = @_;
    return $self->{upper_texture_name};
}

sub lower_texture_name {
    my ($self) = @_;
    return $self->{lower_texture_name};
}

sub normal_texture_name {
    my ($self) = @_;
    return $self->{normal_texture_name};
}

sub sector_id {
    my ($self) = @_;
    return $self->{sector_id};
}

########################################################################
package DoomWad::Things;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, DoomWad::Thing->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package DoomWad::Linedefs;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, DoomWad::Linedef->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package DoomWad::IndexEntry;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{offset} = $self->{_io}->read_s4le();
    $self->{size} = $self->{_io}->read_s4le();
    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(8), 0));
}

sub contents {
    my ($self) = @_;
    return $self->{contents} if ($self->{contents});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->offset());
    my $_on = $self->name();
    if ($_on eq "SECTORS") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Sectors->new($io__raw_contents, $self, $self->{_root});
    }
    elsif ($_on eq "TEXTURE1") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Texture12->new($io__raw_contents, $self, $self->{_root});
    }
    elsif ($_on eq "VERTEXES") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Vertexes->new($io__raw_contents, $self, $self->{_root});
    }
    elsif ($_on eq "BLOCKMAP") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Blockmap->new($io__raw_contents, $self, $self->{_root});
    }
    elsif ($_on eq "PNAMES") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Pnames->new($io__raw_contents, $self, $self->{_root});
    }
    elsif ($_on eq "TEXTURE2") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Texture12->new($io__raw_contents, $self, $self->{_root});
    }
    elsif ($_on eq "THINGS") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Things->new($io__raw_contents, $self, $self->{_root});
    }
    elsif ($_on eq "LINEDEFS") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Linedefs->new($io__raw_contents, $self, $self->{_root});
    }
    elsif ($_on eq "SIDEDEFS") {
        $self->{_raw_contents} = $io->read_bytes($self->size());
        my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
        $self->{contents} = DoomWad::Sidedefs->new($io__raw_contents, $self, $self->{_root});
    }
    else {
        $self->{contents} = $io->read_bytes($self->size());
    }
    $io->seek($_pos);
    return $self->{contents};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub _raw_contents {
    my ($self) = @_;
    return $self->{_raw_contents};
}

########################################################################
package DoomWad::Sidedefs;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, DoomWad::Sidedef->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package DoomWad::Blockmap;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{origin_x} = $self->{_io}->read_s2le();
    $self->{origin_y} = $self->{_io}->read_s2le();
    $self->{num_cols} = $self->{_io}->read_s2le();
    $self->{num_rows} = $self->{_io}->read_s2le();
    $self->{linedefs_in_block} = ();
    my $n_linedefs_in_block = ($self->num_cols() * $self->num_rows());
    for (my $i = 0; $i < $n_linedefs_in_block; $i++) {
        $self->{linedefs_in_block}[$i] = DoomWad::Blockmap::Blocklist->new($self->{_io}, $self, $self->{_root});
    }
}

sub origin_x {
    my ($self) = @_;
    return $self->{origin_x};
}

sub origin_y {
    my ($self) = @_;
    return $self->{origin_y};
}

sub num_cols {
    my ($self) = @_;
    return $self->{num_cols};
}

sub num_rows {
    my ($self) = @_;
    return $self->{num_rows};
}

sub linedefs_in_block {
    my ($self) = @_;
    return $self->{linedefs_in_block};
}

########################################################################
package DoomWad::Blockmap::Blocklist;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{offset} = $self->{_io}->read_u2le();
}

sub linedefs {
    my ($self) = @_;
    return $self->{linedefs} if ($self->{linedefs});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->offset() * 2));
    $self->{linedefs} = ();
    do {
        $_ = $self->{_io}->read_s2le();
        push @{$self->{linedefs}}, $_;
    } until ($_ == -1);
    $self->{_io}->seek($_pos);
    return $self->{linedefs};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

1;
