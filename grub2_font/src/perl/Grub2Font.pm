# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Grub2Font;

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

    $self->{magic} = $self->{_io}->read_bytes(12);
    $self->{sections} = ();
    do {
        $_ = Grub2Font::Section->new($self->{_io}, $self, $self->{_root});
        push @{$self->{sections}}, $_;
    } until ($_->section_type() eq "DATA");
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub sections {
    my ($self) = @_;
    return $self->{sections};
}

########################################################################
package Grub2Font::PtszSection;

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

    $self->{font_point_size} = $self->{_io}->read_u2be();
}

sub font_point_size {
    my ($self) = @_;
    return $self->{font_point_size};
}

########################################################################
package Grub2Font::FamiSection;

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

    $self->{font_family_name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub font_family_name {
    my ($self) = @_;
    return $self->{font_family_name};
}

########################################################################
package Grub2Font::WeigSection;

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

    $self->{font_weight} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub font_weight {
    my ($self) = @_;
    return $self->{font_weight};
}

########################################################################
package Grub2Font::MaxwSection;

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

    $self->{maximum_character_width} = $self->{_io}->read_u2be();
}

sub maximum_character_width {
    my ($self) = @_;
    return $self->{maximum_character_width};
}

########################################################################
package Grub2Font::DescSection;

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

    $self->{descent_in_pixels} = $self->{_io}->read_u2be();
}

sub descent_in_pixels {
    my ($self) = @_;
    return $self->{descent_in_pixels};
}

########################################################################
package Grub2Font::Section;

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

    $self->{section_type} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{len_body} = $self->{_io}->read_u4be();
    if ($self->section_type() ne "DATA") {
        my $_on = $self->section_type();
        if ($_on eq "MAXH") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::MaxhSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "FAMI") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::FamiSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "PTSZ") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::PtszSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "MAXW") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::MaxwSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "SLAN") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::SlanSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "WEIG") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::WeigSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "CHIX") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::ChixSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "DESC") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::DescSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "NAME") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::NameSection->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on eq "ASCE") {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = Grub2Font::AsceSection->new($io__raw_body, $self, $self->{_root});
        }
        else {
            $self->{body} = $self->{_io}->read_bytes($self->len_body());
        }
    }
}

sub section_type {
    my ($self) = @_;
    return $self->{section_type};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
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
package Grub2Font::AsceSection;

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

    $self->{ascent_in_pixels} = $self->{_io}->read_u2be();
}

sub ascent_in_pixels {
    my ($self) = @_;
    return $self->{ascent_in_pixels};
}

########################################################################
package Grub2Font::ChixSection;

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

    $self->{characters} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{characters}}, Grub2Font::ChixSection::Character->new($self->{_io}, $self, $self->{_root});
    }
}

sub characters {
    my ($self) = @_;
    return $self->{characters};
}

########################################################################
package Grub2Font::ChixSection::Character;

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

    $self->{code_point} = $self->{_io}->read_u4be();
    $self->{flags} = $self->{_io}->read_u1();
    $self->{ofs_definition} = $self->{_io}->read_u4be();
}

sub definition {
    my ($self) = @_;
    return $self->{definition} if ($self->{definition});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_definition());
    $self->{definition} = Grub2Font::ChixSection::CharacterDefinition->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{definition};
}

sub code_point {
    my ($self) = @_;
    return $self->{code_point};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub ofs_definition {
    my ($self) = @_;
    return $self->{ofs_definition};
}

########################################################################
package Grub2Font::ChixSection::CharacterDefinition;

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

    $self->{width} = $self->{_io}->read_u2be();
    $self->{height} = $self->{_io}->read_u2be();
    $self->{x_offset} = $self->{_io}->read_s2be();
    $self->{y_offset} = $self->{_io}->read_s2be();
    $self->{device_width} = $self->{_io}->read_s2be();
    $self->{bitmap_data} = $self->{_io}->read_bytes(int((($self->width() * $self->height()) + 7) / 8));
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub x_offset {
    my ($self) = @_;
    return $self->{x_offset};
}

sub y_offset {
    my ($self) = @_;
    return $self->{y_offset};
}

sub device_width {
    my ($self) = @_;
    return $self->{device_width};
}

sub bitmap_data {
    my ($self) = @_;
    return $self->{bitmap_data};
}

########################################################################
package Grub2Font::MaxhSection;

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

    $self->{maximum_character_height} = $self->{_io}->read_u2be();
}

sub maximum_character_height {
    my ($self) = @_;
    return $self->{maximum_character_height};
}

########################################################################
package Grub2Font::NameSection;

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

    $self->{font_name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub font_name {
    my ($self) = @_;
    return $self->{font_name};
}

########################################################################
package Grub2Font::SlanSection;

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

    $self->{font_slant} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub font_slant {
    my ($self) = @_;
    return $self->{font_slant};
}

1;
