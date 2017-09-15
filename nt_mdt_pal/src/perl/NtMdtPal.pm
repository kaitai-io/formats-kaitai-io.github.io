# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
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

    $self->{signature} = $self->{_io}->ensure_fixed_contents(pack('C*', (78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33)));
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

    $self->{unkn0} = $self->{_io}->read_bytes(7);
    $self->{colors_count} = $self->{_io}->read_u2le();
    $self->{unkn1} = $self->{_io}->read_bytes(5);
    $self->{name_size} = $self->{_io}->read_u2be();
}

sub unkn0 {
    my ($self) = @_;
    return $self->{unkn0};
}

sub colors_count {
    my ($self) = @_;
    return $self->{colors_count};
}

sub unkn1 {
    my ($self) = @_;
    return $self->{unkn1};
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

    $self->{data} = $self->{_io}->read_bytes(4);
}

sub data {
    my ($self) = @_;
    return $self->{data};
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
