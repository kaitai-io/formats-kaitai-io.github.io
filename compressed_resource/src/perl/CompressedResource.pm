# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use BytesWithIo;

########################################################################
package CompressedResource;

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

    $self->{header} = CompressedResource::Header->new($self->{_io}, $self, $self->{_root});
    $self->{compressed_data} = $self->{_io}->read_bytes_full();
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub compressed_data {
    my ($self) = @_;
    return $self->{compressed_data};
}

########################################################################
package CompressedResource::Header;

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

    $self->{common_part} = CompressedResource::Header::CommonPart->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_type_specific_part_raw_with_io} = $self->{_io}->read_bytes(($self->common_part()->len_header() - 12));
    my $io__raw_type_specific_part_raw_with_io = IO::KaitaiStruct::Stream->new($self->{_raw_type_specific_part_raw_with_io});
    $self->{type_specific_part_raw_with_io} = BytesWithIo->new($io__raw_type_specific_part_raw_with_io);
}

sub type_specific_part_raw {
    my ($self) = @_;
    return $self->{type_specific_part_raw} if ($self->{type_specific_part_raw});
    $self->{type_specific_part_raw} = $self->type_specific_part_raw_with_io()->data();
    return $self->{type_specific_part_raw};
}

sub type_specific_part {
    my ($self) = @_;
    return $self->{type_specific_part} if ($self->{type_specific_part});
    my $io = $self->type_specific_part_raw_with_io()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    my $_on = $self->common_part()->header_type();
    if ($_on == 8) {
        $self->{type_specific_part} = CompressedResource::Header::TypeSpecificPartType8->new($io, $self, $self->{_root});
    }
    elsif ($_on == 9) {
        $self->{type_specific_part} = CompressedResource::Header::TypeSpecificPartType9->new($io, $self, $self->{_root});
    }
    $io->seek($_pos);
    return $self->{type_specific_part};
}

sub common_part {
    my ($self) = @_;
    return $self->{common_part};
}

sub type_specific_part_raw_with_io {
    my ($self) = @_;
    return $self->{type_specific_part_raw_with_io};
}

sub _raw_type_specific_part_raw_with_io {
    my ($self) = @_;
    return $self->{_raw_type_specific_part_raw_with_io};
}

########################################################################
package CompressedResource::Header::CommonPart;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{len_header} = $self->{_io}->read_u2be();
    $self->{header_type} = $self->{_io}->read_u1();
    $self->{unknown} = $self->{_io}->read_u1();
    $self->{len_decompressed} = $self->{_io}->read_u4be();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub header_type {
    my ($self) = @_;
    return $self->{header_type};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

sub len_decompressed {
    my ($self) = @_;
    return $self->{len_decompressed};
}

########################################################################
package CompressedResource::Header::TypeSpecificPartType8;

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

    $self->{working_buffer_fractional_size} = $self->{_io}->read_u1();
    $self->{expansion_buffer_size} = $self->{_io}->read_u1();
    $self->{decompressor_id} = $self->{_io}->read_s2be();
    $self->{reserved} = $self->{_io}->read_u2be();
}

sub working_buffer_fractional_size {
    my ($self) = @_;
    return $self->{working_buffer_fractional_size};
}

sub expansion_buffer_size {
    my ($self) = @_;
    return $self->{expansion_buffer_size};
}

sub decompressor_id {
    my ($self) = @_;
    return $self->{decompressor_id};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package CompressedResource::Header::TypeSpecificPartType9;

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

    $self->{decompressor_id} = $self->{_io}->read_s2be();
    $self->{_raw_decompressor_specific_parameters_with_io} = $self->{_io}->read_bytes(4);
    my $io__raw_decompressor_specific_parameters_with_io = IO::KaitaiStruct::Stream->new($self->{_raw_decompressor_specific_parameters_with_io});
    $self->{decompressor_specific_parameters_with_io} = BytesWithIo->new($io__raw_decompressor_specific_parameters_with_io);
}

sub decompressor_specific_parameters {
    my ($self) = @_;
    return $self->{decompressor_specific_parameters} if ($self->{decompressor_specific_parameters});
    $self->{decompressor_specific_parameters} = $self->decompressor_specific_parameters_with_io()->data();
    return $self->{decompressor_specific_parameters};
}

sub decompressor_id {
    my ($self) = @_;
    return $self->{decompressor_id};
}

sub decompressor_specific_parameters_with_io {
    my ($self) = @_;
    return $self->{decompressor_specific_parameters_with_io};
}

sub _raw_decompressor_specific_parameters_with_io {
    my ($self) = @_;
    return $self->{_raw_decompressor_specific_parameters_with_io};
}

1;
