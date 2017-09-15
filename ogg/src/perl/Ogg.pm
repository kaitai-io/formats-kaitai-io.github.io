# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Ogg;

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

    $self->{pages} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{pages}}, Ogg::Page->new($self->{_io}, $self, $self->{_root});
    }
}

sub pages {
    my ($self) = @_;
    return $self->{pages};
}

########################################################################
package Ogg::Page;

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

    $self->{sync_code} = $self->{_io}->ensure_fixed_contents(pack('C*', (79, 103, 103, 83)));
    $self->{version} = $self->{_io}->ensure_fixed_contents(pack('C*', (0)));
    $self->{reserved1} = $self->{_io}->read_bits_int(5);
    $self->{is_end_of_stream} = $self->{_io}->read_bits_int(1);
    $self->{is_beginning_of_stream} = $self->{_io}->read_bits_int(1);
    $self->{is_continuation} = $self->{_io}->read_bits_int(1);
    $self->{_io}->align_to_byte();
    $self->{granule_pos} = $self->{_io}->read_u8le();
    $self->{bitstream_serial} = $self->{_io}->read_u4le();
    $self->{page_seq_num} = $self->{_io}->read_u4le();
    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{num_segments} = $self->{_io}->read_u1();
    $self->{len_segments} = ();
    my $n_len_segments = $self->num_segments();
    for (my $i = 0; $i < $n_len_segments; $i++) {
        $self->{len_segments}[$i] = $self->{_io}->read_u1();
    }
    $self->{segments} = ();
    my $n_segments = $self->num_segments();
    for (my $i = 0; $i < $n_segments; $i++) {
        $self->{segments}[$i] = $self->{_io}->read_bytes(@{$self->len_segments()}[$i]);
    }
}

sub sync_code {
    my ($self) = @_;
    return $self->{sync_code};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub is_end_of_stream {
    my ($self) = @_;
    return $self->{is_end_of_stream};
}

sub is_beginning_of_stream {
    my ($self) = @_;
    return $self->{is_beginning_of_stream};
}

sub is_continuation {
    my ($self) = @_;
    return $self->{is_continuation};
}

sub granule_pos {
    my ($self) = @_;
    return $self->{granule_pos};
}

sub bitstream_serial {
    my ($self) = @_;
    return $self->{bitstream_serial};
}

sub page_seq_num {
    my ($self) = @_;
    return $self->{page_seq_num};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub num_segments {
    my ($self) = @_;
    return $self->{num_segments};
}

sub len_segments {
    my ($self) = @_;
    return $self->{len_segments};
}

sub segments {
    my ($self) = @_;
    return $self->{segments};
}

1;
