# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package DimeMessage;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TYPE_FORMATS_UNCHANGED = 0;
our $TYPE_FORMATS_MEDIA_TYPE = 1;
our $TYPE_FORMATS_ABSOLUTE_URI = 2;
our $TYPE_FORMATS_UNKNOWN = 3;
our $TYPE_FORMATS_NONE = 4;

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

    $self->{records} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{records}}, DimeMessage::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package DimeMessage::OptionElement;

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

    $self->{element_format} = $self->{_io}->read_u2be();
    $self->{len_element} = $self->{_io}->read_u2be();
    $self->{element_data} = $self->{_io}->read_bytes($self->len_element());
}

sub element_format {
    my ($self) = @_;
    return $self->{element_format};
}

sub len_element {
    my ($self) = @_;
    return $self->{len_element};
}

sub element_data {
    my ($self) = @_;
    return $self->{element_data};
}

########################################################################
package DimeMessage::OptionField;

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

    $self->{option_elements} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{option_elements}}, DimeMessage::OptionElement->new($self->{_io}, $self, $self->{_root});
    }
}

sub option_elements {
    my ($self) = @_;
    return $self->{option_elements};
}

########################################################################
package DimeMessage::Padding;

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

    $self->{boundary_padding} = $self->{_io}->read_bytes(-($self->_io()->pos()) % 4);
}

sub boundary_padding {
    my ($self) = @_;
    return $self->{boundary_padding};
}

########################################################################
package DimeMessage::Record;

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

    $self->{version} = $self->{_io}->read_bits_int_be(5);
    $self->{is_first_record} = $self->{_io}->read_bits_int_be(1);
    $self->{is_last_record} = $self->{_io}->read_bits_int_be(1);
    $self->{is_chunk_record} = $self->{_io}->read_bits_int_be(1);
    $self->{type_format} = $self->{_io}->read_bits_int_be(4);
    $self->{reserved} = $self->{_io}->read_bits_int_be(4);
    $self->{_io}->align_to_byte();
    $self->{len_options} = $self->{_io}->read_u2be();
    $self->{len_id} = $self->{_io}->read_u2be();
    $self->{len_type} = $self->{_io}->read_u2be();
    $self->{len_data} = $self->{_io}->read_u4be();
    $self->{_raw_options} = $self->{_io}->read_bytes($self->len_options());
    my $io__raw_options = IO::KaitaiStruct::Stream->new($self->{_raw_options});
    $self->{options} = DimeMessage::OptionField->new($io__raw_options, $self, $self->{_root});
    $self->{options_padding} = DimeMessage::Padding->new($self->{_io}, $self, $self->{_root});
    $self->{id} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->len_id()));
    $self->{id_padding} = DimeMessage::Padding->new($self->{_io}, $self, $self->{_root});
    $self->{type} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->len_type()));
    $self->{type_padding} = DimeMessage::Padding->new($self->{_io}, $self, $self->{_root});
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
    $self->{data_padding} = DimeMessage::Padding->new($self->{_io}, $self, $self->{_root});
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub is_first_record {
    my ($self) = @_;
    return $self->{is_first_record};
}

sub is_last_record {
    my ($self) = @_;
    return $self->{is_last_record};
}

sub is_chunk_record {
    my ($self) = @_;
    return $self->{is_chunk_record};
}

sub type_format {
    my ($self) = @_;
    return $self->{type_format};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub len_options {
    my ($self) = @_;
    return $self->{len_options};
}

sub len_id {
    my ($self) = @_;
    return $self->{len_id};
}

sub len_type {
    my ($self) = @_;
    return $self->{len_type};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub options {
    my ($self) = @_;
    return $self->{options};
}

sub options_padding {
    my ($self) = @_;
    return $self->{options_padding};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub id_padding {
    my ($self) = @_;
    return $self->{id_padding};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub type_padding {
    my ($self) = @_;
    return $self->{type_padding};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub data_padding {
    my ($self) = @_;
    return $self->{data_padding};
}

sub _raw_options {
    my ($self) = @_;
    return $self->{_raw_options};
}

1;
