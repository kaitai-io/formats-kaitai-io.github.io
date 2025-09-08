# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package VmwareVmdk;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_METHODS_NONE = 0;
our $COMPRESSION_METHODS_DEFLATE = 1;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{version} = $self->{_io}->read_s4le();
    $self->{flags} = VmwareVmdk::HeaderFlags->new($self->{_io}, $self, $self->{_root});
    $self->{size_max} = $self->{_io}->read_s8le();
    $self->{size_grain} = $self->{_io}->read_s8le();
    $self->{start_descriptor} = $self->{_io}->read_s8le();
    $self->{size_descriptor} = $self->{_io}->read_s8le();
    $self->{num_grain_table_entries} = $self->{_io}->read_s4le();
    $self->{start_secondary_grain} = $self->{_io}->read_s8le();
    $self->{start_primary_grain} = $self->{_io}->read_s8le();
    $self->{size_metadata} = $self->{_io}->read_s8le();
    $self->{is_dirty} = $self->{_io}->read_u1();
    $self->{stuff} = $self->{_io}->read_bytes(4);
    $self->{compression_method} = $self->{_io}->read_u2le();
}

sub descriptor {
    my ($self) = @_;
    return $self->{descriptor} if ($self->{descriptor});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->start_descriptor() * $self->_root()->len_sector());
    $self->{descriptor} = $self->{_io}->read_bytes($self->size_descriptor() * $self->_root()->len_sector());
    $self->{_io}->seek($_pos);
    return $self->{descriptor};
}

sub grain_primary {
    my ($self) = @_;
    return $self->{grain_primary} if ($self->{grain_primary});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->start_primary_grain() * $self->_root()->len_sector());
    $self->{grain_primary} = $self->{_io}->read_bytes($self->size_grain() * $self->_root()->len_sector());
    $self->{_io}->seek($_pos);
    return $self->{grain_primary};
}

sub grain_secondary {
    my ($self) = @_;
    return $self->{grain_secondary} if ($self->{grain_secondary});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->start_secondary_grain() * $self->_root()->len_sector());
    $self->{grain_secondary} = $self->{_io}->read_bytes($self->size_grain() * $self->_root()->len_sector());
    $self->{_io}->seek($_pos);
    return $self->{grain_secondary};
}

sub len_sector {
    my ($self) = @_;
    return $self->{len_sector} if ($self->{len_sector});
    $self->{len_sector} = 512;
    return $self->{len_sector};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub size_max {
    my ($self) = @_;
    return $self->{size_max};
}

sub size_grain {
    my ($self) = @_;
    return $self->{size_grain};
}

sub start_descriptor {
    my ($self) = @_;
    return $self->{start_descriptor};
}

sub size_descriptor {
    my ($self) = @_;
    return $self->{size_descriptor};
}

sub num_grain_table_entries {
    my ($self) = @_;
    return $self->{num_grain_table_entries};
}

sub start_secondary_grain {
    my ($self) = @_;
    return $self->{start_secondary_grain};
}

sub start_primary_grain {
    my ($self) = @_;
    return $self->{start_primary_grain};
}

sub size_metadata {
    my ($self) = @_;
    return $self->{size_metadata};
}

sub is_dirty {
    my ($self) = @_;
    return $self->{is_dirty};
}

sub stuff {
    my ($self) = @_;
    return $self->{stuff};
}

sub compression_method {
    my ($self) = @_;
    return $self->{compression_method};
}

########################################################################
package VmwareVmdk::HeaderFlags;

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

    $self->{reserved1} = $self->{_io}->read_bits_int_be(5);
    $self->{zeroed_grain_table_entry} = $self->{_io}->read_bits_int_be(1);
    $self->{use_secondary_grain_dir} = $self->{_io}->read_bits_int_be(1);
    $self->{valid_new_line_detection_test} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    $self->{reserved2} = $self->{_io}->read_u1();
    $self->{reserved3} = $self->{_io}->read_bits_int_be(6);
    $self->{has_metadata} = $self->{_io}->read_bits_int_be(1);
    $self->{has_compressed_grain} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    $self->{reserved4} = $self->{_io}->read_u1();
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub zeroed_grain_table_entry {
    my ($self) = @_;
    return $self->{zeroed_grain_table_entry};
}

sub use_secondary_grain_dir {
    my ($self) = @_;
    return $self->{use_secondary_grain_dir};
}

sub valid_new_line_detection_test {
    my ($self) = @_;
    return $self->{valid_new_line_detection_test};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

sub has_metadata {
    my ($self) = @_;
    return $self->{has_metadata};
}

sub has_compressed_grain {
    my ($self) = @_;
    return $self->{has_compressed_grain};
}

sub reserved4 {
    my ($self) = @_;
    return $self->{reserved4};
}

1;
