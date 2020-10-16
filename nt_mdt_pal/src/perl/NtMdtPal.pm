# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package NtMdtPal;

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

    $self->{signature} = $self->{_io}->read_bytes(26);
    $self->{count} = $self->{_io}->read_u4be();
    $self->{meta} = ();
    my $n_meta = $self->count();
    for (my $i = 0; $i < $n_meta; $i++) {
        $self->{meta}[$i] = NtMdtPal::Meta->new($self->{_io}, $self, $self->{_root});
    }
    $self->{something2} = $self->{_io}->read_bytes(1);
    $self->{tables} = ();
    my $n_tables = $self->count();
    for (my $i = 0; $i < $n_tables; $i++) {
        $self->{tables}[$i] = NtMdtPal::ColTable->new($self->{_io}, $self, $self->{_root});
    }
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub meta {
    my ($self) = @_;
    return $self->{meta};
}

sub something2 {
    my ($self) = @_;
    return $self->{something2};
}

sub tables {
    my ($self) = @_;
    return $self->{tables};
}

########################################################################
package NtMdtPal::Meta;

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

    $self->{unkn00} = $self->{_io}->read_bytes(3);
    $self->{unkn01} = $self->{_io}->read_bytes(2);
    $self->{unkn02} = $self->{_io}->read_bytes(1);
    $self->{unkn03} = $self->{_io}->read_bytes(1);
    $self->{colors_count} = $self->{_io}->read_u2le();
    $self->{unkn10} = $self->{_io}->read_bytes(2);
    $self->{unkn11} = $self->{_io}->read_bytes(1);
    $self->{unkn12} = $self->{_io}->read_bytes(2);
    $self->{name_size} = $self->{_io}->read_u2be();
}

sub unkn00 {
    my ($self) = @_;
    return $self->{unkn00};
}

sub unkn01 {
    my ($self) = @_;
    return $self->{unkn01};
}

sub unkn02 {
    my ($self) = @_;
    return $self->{unkn02};
}

sub unkn03 {
    my ($self) = @_;
    return $self->{unkn03};
}

sub colors_count {
    my ($self) = @_;
    return $self->{colors_count};
}

sub unkn10 {
    my ($self) = @_;
    return $self->{unkn10};
}

sub unkn11 {
    my ($self) = @_;
    return $self->{unkn11};
}

sub unkn12 {
    my ($self) = @_;
    return $self->{unkn12};
}

sub name_size {
    my ($self) = @_;
    return $self->{name_size};
}

########################################################################
package NtMdtPal::Color;

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

    $self->{red} = $self->{_io}->read_u1();
    $self->{unkn} = $self->{_io}->read_u1();
    $self->{blue} = $self->{_io}->read_u1();
    $self->{green} = $self->{_io}->read_u1();
}

sub red {
    my ($self) = @_;
    return $self->{red};
}

sub unkn {
    my ($self) = @_;
    return $self->{unkn};
}

sub blue {
    my ($self) = @_;
    return $self->{blue};
}

sub green {
    my ($self) = @_;
    return $self->{green};
}

########################################################################
package NtMdtPal::ColTable;

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

    $self->{size1} = $self->{_io}->read_u1();
    $self->{unkn} = $self->{_io}->read_u1();
    $self->{title} = Encode::decode("UTF-16", $self->{_io}->read_bytes(@{$self->_root()->meta()}[$self->index()]->name_size()));
    $self->{unkn1} = $self->{_io}->read_u2be();
    $self->{colors} = ();
    my $n_colors = (@{$self->_root()->meta()}[$self->index()]->colors_count() - 1);
    for (my $i = 0; $i < $n_colors; $i++) {
        $self->{colors}[$i] = NtMdtPal::Color->new($self->{_io}, $self, $self->{_root});
    }
}

sub size1 {
    my ($self) = @_;
    return $self->{size1};
}

sub unkn {
    my ($self) = @_;
    return $self->{unkn};
}

sub title {
    my ($self) = @_;
    return $self->{title};
}

sub unkn1 {
    my ($self) = @_;
    return $self->{unkn1};
}

sub colors {
    my ($self) = @_;
    return $self->{colors};
}

sub index {
    my ($self) = @_;
    return $self->{index};
}

1;
