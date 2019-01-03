# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Gzip;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_METHODS_DEFLATE = 8;

our $OSES_FAT = 0;
our $OSES_AMIGA = 1;
our $OSES_VMS = 2;
our $OSES_UNIX = 3;
our $OSES_VM_CMS = 4;
our $OSES_ATARI_TOS = 5;
our $OSES_HPFS = 6;
our $OSES_MACINTOSH = 7;
our $OSES_Z_SYSTEM = 8;
our $OSES_CP_M = 9;
our $OSES_TOPS_20 = 10;
our $OSES_NTFS = 11;
our $OSES_QDOS = 12;
our $OSES_ACORN_RISCOS = 13;
our $OSES_UNKNOWN = 255;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (31, 139)));
    $self->{compression_method} = $self->{_io}->read_u1();
    $self->{flags} = Gzip::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{mod_time} = $self->{_io}->read_u4le();
    my $_on = $self->compression_method();
    if ($_on == $COMPRESSION_METHODS_DEFLATE) {
        $self->{extra_flags} = Gzip::ExtraFlagsDeflate->new($self->{_io}, $self, $self->{_root});
    }
    $self->{os} = $self->{_io}->read_u1();
    if ($self->flags()->has_extra()) {
        $self->{extras} = Gzip::Extras->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->flags()->has_name()) {
        $self->{name} = $self->{_io}->read_bytes_term(0, 0, 1, 1);
    }
    if ($self->flags()->has_comment()) {
        $self->{comment} = $self->{_io}->read_bytes_term(0, 0, 1, 1);
    }
    if ($self->flags()->has_header_crc()) {
        $self->{header_crc16} = $self->{_io}->read_u2le();
    }
    $self->{body} = $self->{_io}->read_bytes((($self->_io()->size() - $self->_io()->pos()) - 8));
    $self->{body_crc32} = $self->{_io}->read_u4le();
    $self->{len_uncompressed} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub compression_method {
    my ($self) = @_;
    return $self->{compression_method};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub mod_time {
    my ($self) = @_;
    return $self->{mod_time};
}

sub extra_flags {
    my ($self) = @_;
    return $self->{extra_flags};
}

sub os {
    my ($self) = @_;
    return $self->{os};
}

sub extras {
    my ($self) = @_;
    return $self->{extras};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub comment {
    my ($self) = @_;
    return $self->{comment};
}

sub header_crc16 {
    my ($self) = @_;
    return $self->{header_crc16};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub body_crc32 {
    my ($self) = @_;
    return $self->{body_crc32};
}

sub len_uncompressed {
    my ($self) = @_;
    return $self->{len_uncompressed};
}

########################################################################
package Gzip::Flags;

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

    $self->{reserved1} = $self->{_io}->read_bits_int(3);
    $self->{has_comment} = $self->{_io}->read_bits_int(1);
    $self->{has_name} = $self->{_io}->read_bits_int(1);
    $self->{has_extra} = $self->{_io}->read_bits_int(1);
    $self->{has_header_crc} = $self->{_io}->read_bits_int(1);
    $self->{is_text} = $self->{_io}->read_bits_int(1);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub has_comment {
    my ($self) = @_;
    return $self->{has_comment};
}

sub has_name {
    my ($self) = @_;
    return $self->{has_name};
}

sub has_extra {
    my ($self) = @_;
    return $self->{has_extra};
}

sub has_header_crc {
    my ($self) = @_;
    return $self->{has_header_crc};
}

sub is_text {
    my ($self) = @_;
    return $self->{is_text};
}

########################################################################
package Gzip::ExtraFlagsDeflate;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_STRENGTHS_BEST = 2;
our $COMPRESSION_STRENGTHS_FAST = 4;

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

    $self->{compression_strength} = $self->{_io}->read_u1();
}

sub compression_strength {
    my ($self) = @_;
    return $self->{compression_strength};
}

########################################################################
package Gzip::Subfields;

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
        push @{$self->{entries}}, Gzip::Subfield->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Gzip::Subfield;

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

    $self->{id} = $self->{_io}->read_u2le();
    $self->{len_data} = $self->{_io}->read_u2le();
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Gzip::Extras;

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

    $self->{len_subfields} = $self->{_io}->read_u2le();
    $self->{_raw_subfields} = $self->{_io}->read_bytes($self->len_subfields());
    my $io__raw_subfields = IO::KaitaiStruct::Stream->new($self->{_raw_subfields});
    $self->{subfields} = Gzip::Subfields->new($io__raw_subfields, $self, $self->{_root});
}

sub len_subfields {
    my ($self) = @_;
    return $self->{len_subfields};
}

sub subfields {
    my ($self) = @_;
    return $self->{subfields};
}

sub _raw_subfields {
    my ($self) = @_;
    return $self->{_raw_subfields};
}

1;
