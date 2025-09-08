# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package Zisofs;

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

    $self->{_raw_header} = $self->{_io}->read_bytes(16);
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = Zisofs::Header->new($io__raw_header, $self, $self->{_root});
    $self->{block_pointers} = [];
    my $n_block_pointers = $self->header()->num_blocks() + 1;
    for (my $i = 0; $i < $n_block_pointers; $i++) {
        push @{$self->{block_pointers}}, $self->{_io}->read_u4le();
    }
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks} if ($self->{blocks});
    $self->{blocks} = [];
    my $n_blocks = $self->header()->num_blocks();
    for (my $i = 0; $i < $n_blocks; $i++) {
        push @{$self->{blocks}}, Zisofs::Block->new($self->{_io}, $self, $self->{_root});
    }
    return $self->{blocks};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub block_pointers {
    my ($self) = @_;
    return $self->{block_pointers};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package Zisofs::Block;

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

}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_start());
    $self->{data} = $io->read_bytes($self->len_data());
    $io->seek($_pos);
    return $self->{data};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data} if ($self->{len_data});
    $self->{len_data} = $self->ofs_end() - $self->ofs_start();
    return $self->{len_data};
}

sub ofs_start {
    my ($self) = @_;
    return $self->{ofs_start};
}

sub ofs_end {
    my ($self) = @_;
    return $self->{ofs_end};
}

########################################################################
package Zisofs::Header;

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

    $self->{magic} = $self->{_io}->read_bytes(8);
    $self->{uncompressed_size} = $self->{_io}->read_u4le();
    $self->{len_header} = $self->{_io}->read_u1();
    $self->{block_size_log2} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_bytes(2);
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size} if ($self->{block_size});
    $self->{block_size} = 1 << $self->block_size_log2();
    return $self->{block_size};
}

sub num_blocks {
    my ($self) = @_;
    return $self->{num_blocks} if ($self->{num_blocks});
    $self->{num_blocks} = int($self->uncompressed_size() / $self->block_size()) + ($self->uncompressed_size() % $self->block_size() != 0 ? 1 : 0);
    return $self->{num_blocks};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub uncompressed_size {
    my ($self) = @_;
    return $self->{uncompressed_size};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub block_size_log2 {
    my ($self) = @_;
    return $self->{block_size_log2};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

1;
