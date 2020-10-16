# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package AllegroDat;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PACK_ENUM_UNPACKED = 1936484398;

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

    $self->{pack_magic} = $self->{_io}->read_u4be();
    $self->{dat_magic} = $self->{_io}->read_bytes(4);
    $self->{num_objects} = $self->{_io}->read_u4be();
    $self->{objects} = ();
    my $n_objects = $self->num_objects();
    for (my $i = 0; $i < $n_objects; $i++) {
        $self->{objects}[$i] = AllegroDat::DatObject->new($self->{_io}, $self, $self->{_root});
    }
}

sub pack_magic {
    my ($self) = @_;
    return $self->{pack_magic};
}

sub dat_magic {
    my ($self) = @_;
    return $self->{dat_magic};
}

sub num_objects {
    my ($self) = @_;
    return $self->{num_objects};
}

sub objects {
    my ($self) = @_;
    return $self->{objects};
}

########################################################################
package AllegroDat::DatFont16;

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

    $self->{chars} = ();
    my $n_chars = 95;
    for (my $i = 0; $i < $n_chars; $i++) {
        $self->{chars}[$i] = $self->{_io}->read_bytes(16);
    }
}

sub chars {
    my ($self) = @_;
    return $self->{chars};
}

########################################################################
package AllegroDat::DatBitmap;

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

    $self->{bits_per_pixel} = $self->{_io}->read_s2be();
    $self->{width} = $self->{_io}->read_u2be();
    $self->{height} = $self->{_io}->read_u2be();
    $self->{image} = $self->{_io}->read_bytes_full();
}

sub bits_per_pixel {
    my ($self) = @_;
    return $self->{bits_per_pixel};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub image {
    my ($self) = @_;
    return $self->{image};
}

########################################################################
package AllegroDat::DatFont;

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

    $self->{font_size} = $self->{_io}->read_s2be();
    my $_on = $self->font_size();
    if ($_on == 8) {
        $self->{body} = AllegroDat::DatFont8->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 16) {
        $self->{body} = AllegroDat::DatFont16->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 0) {
        $self->{body} = AllegroDat::DatFont39->new($self->{_io}, $self, $self->{_root});
    }
}

sub font_size {
    my ($self) = @_;
    return $self->{font_size};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package AllegroDat::DatFont8;

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

    $self->{chars} = ();
    my $n_chars = 95;
    for (my $i = 0; $i < $n_chars; $i++) {
        $self->{chars}[$i] = $self->{_io}->read_bytes(8);
    }
}

sub chars {
    my ($self) = @_;
    return $self->{chars};
}

########################################################################
package AllegroDat::DatObject;

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

    $self->{properties} = ();
    do {
        $_ = AllegroDat::Property->new($self->{_io}, $self, $self->{_root});
        push @{$self->{properties}}, $_;
    } until (!($_->is_valid()));
    $self->{len_compressed} = $self->{_io}->read_s4be();
    $self->{len_uncompressed} = $self->{_io}->read_s4be();
    my $_on = $self->type();
    if ($_on eq "BMP ") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_compressed());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = AllegroDat::DatBitmap->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "RLE ") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_compressed());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = AllegroDat::DatRleSprite->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "FONT") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_compressed());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = AllegroDat::DatFont->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len_compressed());
    }
}

sub type {
    my ($self) = @_;
    return $self->{type} if ($self->{type});
    $self->{type} = @{$self->properties()}[-1]->magic();
    return $self->{type};
}

sub properties {
    my ($self) = @_;
    return $self->{properties};
}

sub len_compressed {
    my ($self) = @_;
    return $self->{len_compressed};
}

sub len_uncompressed {
    my ($self) = @_;
    return $self->{len_uncompressed};
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
package AllegroDat::DatFont39;

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

    $self->{num_ranges} = $self->{_io}->read_s2be();
    $self->{ranges} = ();
    my $n_ranges = $self->num_ranges();
    for (my $i = 0; $i < $n_ranges; $i++) {
        $self->{ranges}[$i] = AllegroDat::DatFont39::Range->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_ranges {
    my ($self) = @_;
    return $self->{num_ranges};
}

sub ranges {
    my ($self) = @_;
    return $self->{ranges};
}

########################################################################
package AllegroDat::DatFont39::Range;

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

    $self->{mono} = $self->{_io}->read_u1();
    $self->{start_char} = $self->{_io}->read_u4be();
    $self->{end_char} = $self->{_io}->read_u4be();
    $self->{chars} = ();
    my $n_chars = (($self->end_char() - $self->start_char()) + 1);
    for (my $i = 0; $i < $n_chars; $i++) {
        $self->{chars}[$i] = AllegroDat::DatFont39::FontChar->new($self->{_io}, $self, $self->{_root});
    }
}

sub mono {
    my ($self) = @_;
    return $self->{mono};
}

sub start_char {
    my ($self) = @_;
    return $self->{start_char};
}

sub end_char {
    my ($self) = @_;
    return $self->{end_char};
}

sub chars {
    my ($self) = @_;
    return $self->{chars};
}

########################################################################
package AllegroDat::DatFont39::FontChar;

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
    $self->{body} = $self->{_io}->read_bytes(($self->width() * $self->height()));
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package AllegroDat::Property;

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

    $self->{magic} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    if ($self->is_valid()) {
        $self->{type} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    }
    if ($self->is_valid()) {
        $self->{len_body} = $self->{_io}->read_u4be();
    }
    if ($self->is_valid()) {
        $self->{body} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_body()));
    }
}

sub is_valid {
    my ($self) = @_;
    return $self->{is_valid} if ($self->{is_valid});
    $self->{is_valid} = $self->magic() eq "prop";
    return $self->{is_valid};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package AllegroDat::DatRleSprite;

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

    $self->{bits_per_pixel} = $self->{_io}->read_s2be();
    $self->{width} = $self->{_io}->read_u2be();
    $self->{height} = $self->{_io}->read_u2be();
    $self->{len_image} = $self->{_io}->read_u4be();
    $self->{image} = $self->{_io}->read_bytes_full();
}

sub bits_per_pixel {
    my ($self) = @_;
    return $self->{bits_per_pixel};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub len_image {
    my ($self) = @_;
    return $self->{len_image};
}

sub image {
    my ($self) = @_;
    return $self->{image};
}

1;
