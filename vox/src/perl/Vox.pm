# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Vox;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CHUNK_TYPE_MAIN = 1296124238;
our $CHUNK_TYPE_MATT = 1296127060;
our $CHUNK_TYPE_PACK = 1346454347;
our $CHUNK_TYPE_RGBA = 1380401729;
our $CHUNK_TYPE_SIZE = 1397316165;
our $CHUNK_TYPE_XYZI = 1482250825;

our $MATERIAL_TYPE_DIFFUSE = 0;
our $MATERIAL_TYPE_METAL = 1;
our $MATERIAL_TYPE_GLASS = 2;
our $MATERIAL_TYPE_EMISSIVE = 3;

our $PROPERTY_BITS_TYPE_PLASTIC = 1;
our $PROPERTY_BITS_TYPE_ROUGHNESS = 2;
our $PROPERTY_BITS_TYPE_SPECULAR = 4;
our $PROPERTY_BITS_TYPE_IOR = 8;
our $PROPERTY_BITS_TYPE_ATTENUATION = 16;
our $PROPERTY_BITS_TYPE_POWER = 32;
our $PROPERTY_BITS_TYPE_GLOW = 64;
our $PROPERTY_BITS_TYPE_IS_TOTAL_POWER = 128;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (86, 79, 88, 32)));
    $self->{version} = $self->{_io}->read_u4le();
    $self->{main} = Vox::Chunk->new($self->{_io}, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub main {
    my ($self) = @_;
    return $self->{main};
}

########################################################################
package Vox::Chunk;

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

    $self->{chunk_id} = $self->{_io}->read_u4be();
    $self->{num_bytes_of_chunk_content} = $self->{_io}->read_u4le();
    $self->{num_bytes_of_children_chunks} = $self->{_io}->read_u4le();
    if ($self->num_bytes_of_chunk_content() != 0) {
        my $_on = $self->chunk_id();
        if ($_on == $CHUNK_TYPE_SIZE) {
            $self->{_raw_chunk_content} = $self->{_io}->read_bytes($self->num_bytes_of_chunk_content());
            my $io__raw_chunk_content = IO::KaitaiStruct::Stream->new($self->{_raw_chunk_content});
            $self->{chunk_content} = Vox::Size->new($io__raw_chunk_content, $self, $self->{_root});
        }
        elsif ($_on == $CHUNK_TYPE_MATT) {
            $self->{_raw_chunk_content} = $self->{_io}->read_bytes($self->num_bytes_of_chunk_content());
            my $io__raw_chunk_content = IO::KaitaiStruct::Stream->new($self->{_raw_chunk_content});
            $self->{chunk_content} = Vox::Matt->new($io__raw_chunk_content, $self, $self->{_root});
        }
        elsif ($_on == $CHUNK_TYPE_XYZI) {
            $self->{_raw_chunk_content} = $self->{_io}->read_bytes($self->num_bytes_of_chunk_content());
            my $io__raw_chunk_content = IO::KaitaiStruct::Stream->new($self->{_raw_chunk_content});
            $self->{chunk_content} = Vox::Xyzi->new($io__raw_chunk_content, $self, $self->{_root});
        }
        elsif ($_on == $CHUNK_TYPE_PACK) {
            $self->{_raw_chunk_content} = $self->{_io}->read_bytes($self->num_bytes_of_chunk_content());
            my $io__raw_chunk_content = IO::KaitaiStruct::Stream->new($self->{_raw_chunk_content});
            $self->{chunk_content} = Vox::Pack->new($io__raw_chunk_content, $self, $self->{_root});
        }
        elsif ($_on == $CHUNK_TYPE_RGBA) {
            $self->{_raw_chunk_content} = $self->{_io}->read_bytes($self->num_bytes_of_chunk_content());
            my $io__raw_chunk_content = IO::KaitaiStruct::Stream->new($self->{_raw_chunk_content});
            $self->{chunk_content} = Vox::Rgba->new($io__raw_chunk_content, $self, $self->{_root});
        }
        else {
            $self->{chunk_content} = $self->{_io}->read_bytes($self->num_bytes_of_chunk_content());
        }
    }
    if ($self->num_bytes_of_children_chunks() != 0) {
        $self->{children_chunks} = ();
        while (!$self->{_io}->is_eof()) {
            push @{$self->{children_chunks}}, Vox::Chunk->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub chunk_id {
    my ($self) = @_;
    return $self->{chunk_id};
}

sub num_bytes_of_chunk_content {
    my ($self) = @_;
    return $self->{num_bytes_of_chunk_content};
}

sub num_bytes_of_children_chunks {
    my ($self) = @_;
    return $self->{num_bytes_of_children_chunks};
}

sub chunk_content {
    my ($self) = @_;
    return $self->{chunk_content};
}

sub children_chunks {
    my ($self) = @_;
    return $self->{children_chunks};
}

sub _raw_chunk_content {
    my ($self) = @_;
    return $self->{_raw_chunk_content};
}

########################################################################
package Vox::Size;

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

    $self->{size_x} = $self->{_io}->read_u4le();
    $self->{size_y} = $self->{_io}->read_u4le();
    $self->{size_z} = $self->{_io}->read_u4le();
}

sub size_x {
    my ($self) = @_;
    return $self->{size_x};
}

sub size_y {
    my ($self) = @_;
    return $self->{size_y};
}

sub size_z {
    my ($self) = @_;
    return $self->{size_z};
}

########################################################################
package Vox::Rgba;

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

    $self->{colors} = ();
    my $n_colors = 256;
    for (my $i = 0; $i < $n_colors; $i++) {
        $self->{colors}[$i] = Vox::Color->new($self->{_io}, $self, $self->{_root});
    }
}

sub colors {
    my ($self) = @_;
    return $self->{colors};
}

########################################################################
package Vox::Pack;

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

    $self->{num_models} = $self->{_io}->read_u4le();
}

sub num_models {
    my ($self) = @_;
    return $self->{num_models};
}

########################################################################
package Vox::Matt;

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

    $self->{id} = $self->{_io}->read_u4le();
    $self->{material_type} = $self->{_io}->read_u4le();
    $self->{material_weight} = $self->{_io}->read_f4le();
    $self->{property_bits} = $self->{_io}->read_u4le();
    if ($self->has_plastic()) {
        $self->{plastic} = $self->{_io}->read_f4le();
    }
    if ($self->has_roughness()) {
        $self->{roughness} = $self->{_io}->read_f4le();
    }
    if ($self->has_specular()) {
        $self->{specular} = $self->{_io}->read_f4le();
    }
    if ($self->has_ior()) {
        $self->{ior} = $self->{_io}->read_f4le();
    }
    if ($self->has_attenuation()) {
        $self->{attenuation} = $self->{_io}->read_f4le();
    }
    if ($self->has_power()) {
        $self->{power} = $self->{_io}->read_f4le();
    }
    if ($self->has_glow()) {
        $self->{glow} = $self->{_io}->read_f4le();
    }
    if ($self->has_is_total_power()) {
        $self->{is_total_power} = $self->{_io}->read_f4le();
    }
}

sub has_is_total_power {
    my ($self) = @_;
    return $self->{has_is_total_power} if ($self->{has_is_total_power});
    $self->{has_is_total_power} = ($self->property_bits() & 128) != 0;
    return $self->{has_is_total_power};
}

sub has_plastic {
    my ($self) = @_;
    return $self->{has_plastic} if ($self->{has_plastic});
    $self->{has_plastic} = ($self->property_bits() & 1) != 0;
    return $self->{has_plastic};
}

sub has_attenuation {
    my ($self) = @_;
    return $self->{has_attenuation} if ($self->{has_attenuation});
    $self->{has_attenuation} = ($self->property_bits() & 16) != 0;
    return $self->{has_attenuation};
}

sub has_power {
    my ($self) = @_;
    return $self->{has_power} if ($self->{has_power});
    $self->{has_power} = ($self->property_bits() & 32) != 0;
    return $self->{has_power};
}

sub has_roughness {
    my ($self) = @_;
    return $self->{has_roughness} if ($self->{has_roughness});
    $self->{has_roughness} = ($self->property_bits() & 2) != 0;
    return $self->{has_roughness};
}

sub has_specular {
    my ($self) = @_;
    return $self->{has_specular} if ($self->{has_specular});
    $self->{has_specular} = ($self->property_bits() & 4) != 0;
    return $self->{has_specular};
}

sub has_ior {
    my ($self) = @_;
    return $self->{has_ior} if ($self->{has_ior});
    $self->{has_ior} = ($self->property_bits() & 8) != 0;
    return $self->{has_ior};
}

sub has_glow {
    my ($self) = @_;
    return $self->{has_glow} if ($self->{has_glow});
    $self->{has_glow} = ($self->property_bits() & 64) != 0;
    return $self->{has_glow};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub material_type {
    my ($self) = @_;
    return $self->{material_type};
}

sub material_weight {
    my ($self) = @_;
    return $self->{material_weight};
}

sub property_bits {
    my ($self) = @_;
    return $self->{property_bits};
}

sub plastic {
    my ($self) = @_;
    return $self->{plastic};
}

sub roughness {
    my ($self) = @_;
    return $self->{roughness};
}

sub specular {
    my ($self) = @_;
    return $self->{specular};
}

sub ior {
    my ($self) = @_;
    return $self->{ior};
}

sub attenuation {
    my ($self) = @_;
    return $self->{attenuation};
}

sub power {
    my ($self) = @_;
    return $self->{power};
}

sub glow {
    my ($self) = @_;
    return $self->{glow};
}

sub is_total_power {
    my ($self) = @_;
    return $self->{is_total_power};
}

########################################################################
package Vox::Xyzi;

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

    $self->{num_voxels} = $self->{_io}->read_u4le();
    $self->{voxels} = ();
    my $n_voxels = $self->num_voxels();
    for (my $i = 0; $i < $n_voxels; $i++) {
        $self->{voxels}[$i] = Vox::Voxel->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_voxels {
    my ($self) = @_;
    return $self->{num_voxels};
}

sub voxels {
    my ($self) = @_;
    return $self->{voxels};
}

########################################################################
package Vox::Color;

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

    $self->{r} = $self->{_io}->read_u1();
    $self->{g} = $self->{_io}->read_u1();
    $self->{b} = $self->{_io}->read_u1();
    $self->{a} = $self->{_io}->read_u1();
}

sub r {
    my ($self) = @_;
    return $self->{r};
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

sub a {
    my ($self) = @_;
    return $self->{a};
}

########################################################################
package Vox::Voxel;

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

    $self->{x} = $self->{_io}->read_u1();
    $self->{y} = $self->{_io}->read_u1();
    $self->{z} = $self->{_io}->read_u1();
    $self->{color_index} = $self->{_io}->read_u1();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

sub color_index {
    my ($self) = @_;
    return $self->{color_index};
}

1;
