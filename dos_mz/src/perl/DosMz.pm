# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = DosMz::ExeHeader->new($self->{_io}, $self, $self->{_root});
    $self->{body} = $self->{_io}->read_bytes($self->header()->len_body());
}

sub relocations {
    my ($self) = @_;
    return $self->{relocations} if ($self->{relocations});
    if ($self->header()->mz()->ofs_relocations() != 0) {
        my $io = $self->header()->_io();
        my $_pos = $io->pos();
        $io->seek($self->header()->mz()->ofs_relocations());
        $self->{relocations} = [];
        my $n_relocations = $self->header()->mz()->num_relocations();
        for (my $i = 0; $i < $n_relocations; $i++) {
            push @{$self->{relocations}}, DosMz::Relocation->new($io, $self, $self->{_root});
        }
        $io->seek($_pos);
    }
    return $self->{relocations};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package DosMz::ExeHeader;

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

    $self->{mz} = DosMz::MzHeader->new($self->{_io}, $self, $self->{_root});
    $self->{rest_of_header} = $self->{_io}->read_bytes($self->mz()->len_header() - 28);
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body} if ($self->{len_body});
    $self->{len_body} = ($self->mz()->last_page_extra_bytes() == 0 ? $self->mz()->num_pages() * 512 : ($self->mz()->num_pages() - 1) * 512 + $self->mz()->last_page_extra_bytes()) - $self->mz()->len_header();
    return $self->{len_body};
}

sub mz {
    my ($self) = @_;
    return $self->{mz};
}

sub rest_of_header {
    my ($self) = @_;
    return $self->{rest_of_header};
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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = Encode::decode("ASCII", $self->{_io}->read_bytes(2));
    $self->{last_page_extra_bytes} = $self->{_io}->read_u2le();
    $self->{num_pages} = $self->{_io}->read_u2le();
    $self->{num_relocations} = $self->{_io}->read_u2le();
    $self->{header_size} = $self->{_io}->read_u2le();
    $self->{min_allocation} = $self->{_io}->read_u2le();
    $self->{max_allocation} = $self->{_io}->read_u2le();
    $self->{initial_ss} = $self->{_io}->read_u2le();
    $self->{initial_sp} = $self->{_io}->read_u2le();
    $self->{checksum} = $self->{_io}->read_u2le();
    $self->{initial_ip} = $self->{_io}->read_u2le();
    $self->{initial_cs} = $self->{_io}->read_u2le();
    $self->{ofs_relocations} = $self->{_io}->read_u2le();
    $self->{overlay_id} = $self->{_io}->read_u2le();
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header} if ($self->{len_header});
    $self->{len_header} = $self->header_size() * 16;
    return $self->{len_header};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub last_page_extra_bytes {
    my ($self) = @_;
    return $self->{last_page_extra_bytes};
}

sub num_pages {
    my ($self) = @_;
    return $self->{num_pages};
}

sub num_relocations {
    my ($self) = @_;
    return $self->{num_relocations};
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

sub ofs_relocations {
    my ($self) = @_;
    return $self->{ofs_relocations};
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
    $self->{_root} = $_root;

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
