# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package DosMz;

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

    $self->{hdr} = DosMz::MzHeader->new($self->{_io}, $self, $self->{_root});
    $self->{mz_header2} = $self->{_io}->read_bytes(($self->hdr()->relocations_ofs() - 28));
    $self->{relocations} = ();
    my $n_relocations = $self->hdr()->qty_relocations();
    for (my $i = 0; $i < $n_relocations; $i++) {
        $self->{relocations}[$i] = DosMz::Relocation->new($self->{_io}, $self, $self->{_root});
    }
    $self->{body} = $self->{_io}->read_bytes_full();
}

sub hdr {
    my ($self) = @_;
    return $self->{hdr};
}

sub mz_header2 {
    my ($self) = @_;
    return $self->{mz_header2};
}

sub relocations {
    my ($self) = @_;
    return $self->{relocations};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package DosMz::MzHeader;

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

    $self->{magic} = $self->{_io}->read_bytes(2);
    $self->{last_page_extra_bytes} = $self->{_io}->read_u2le();
    $self->{qty_pages} = $self->{_io}->read_u2le();
    $self->{qty_relocations} = $self->{_io}->read_u2le();
    $self->{header_size} = $self->{_io}->read_u2le();
    $self->{min_allocation} = $self->{_io}->read_u2le();
    $self->{max_allocation} = $self->{_io}->read_u2le();
    $self->{initial_ss} = $self->{_io}->read_u2le();
    $self->{initial_sp} = $self->{_io}->read_u2le();
    $self->{checksum} = $self->{_io}->read_u2le();
    $self->{initial_ip} = $self->{_io}->read_u2le();
    $self->{initial_cs} = $self->{_io}->read_u2le();
    $self->{relocations_ofs} = $self->{_io}->read_u2le();
    $self->{overlay_id} = $self->{_io}->read_u2le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub last_page_extra_bytes {
    my ($self) = @_;
    return $self->{last_page_extra_bytes};
}

sub qty_pages {
    my ($self) = @_;
    return $self->{qty_pages};
}

sub qty_relocations {
    my ($self) = @_;
    return $self->{qty_relocations};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub min_allocation {
    my ($self) = @_;
    return $self->{min_allocation};
}

sub max_allocation {
    my ($self) = @_;
    return $self->{max_allocation};
}

sub initial_ss {
    my ($self) = @_;
    return $self->{initial_ss};
}

sub initial_sp {
    my ($self) = @_;
    return $self->{initial_sp};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub initial_ip {
    my ($self) = @_;
    return $self->{initial_ip};
}

sub initial_cs {
    my ($self) = @_;
    return $self->{initial_cs};
}

sub relocations_ofs {
    my ($self) = @_;
    return $self->{relocations_ofs};
}

sub overlay_id {
    my ($self) = @_;
    return $self->{overlay_id};
}

########################################################################
package DosMz::Relocation;

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

    $self->{ofs} = $self->{_io}->read_u2le();
    $self->{seg} = $self->{_io}->read_u2le();
}

sub ofs {
    my ($self) = @_;
    return $self->{ofs};
}

sub seg {
    my ($self) = @_;
    return $self->{seg};
}

1;
