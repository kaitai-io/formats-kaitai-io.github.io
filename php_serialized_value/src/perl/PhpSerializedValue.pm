# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package PhpSerializedValue;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $VALUE_TYPE_CUSTOM_SERIALIZED_OBJECT = 67;
our $VALUE_TYPE_NULL = 78;
our $VALUE_TYPE_OBJECT = 79;
our $VALUE_TYPE_VARIABLE_REFERENCE = 82;
our $VALUE_TYPE_PHP_6_STRING = 83;
our $VALUE_TYPE_ARRAY = 97;
our $VALUE_TYPE_BOOL = 98;
our $VALUE_TYPE_FLOAT = 100;
our $VALUE_TYPE_INT = 105;
our $VALUE_TYPE_PHP_3_OBJECT = 111;
our $VALUE_TYPE_OBJECT_REFERENCE = 114;
our $VALUE_TYPE_STRING = 115;

our $BOOL_VALUE_FALSE = 48;
our $BOOL_VALUE_TRUE = 49;

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

    $self->{type} = $self->{_io}->read_u1();
    my $_on = $self->type();
    if ($_on == $PhpSerializedValue::VALUE_TYPE_CUSTOM_SERIALIZED_OBJECT) {
        $self->{contents} = PhpSerializedValue::CustomSerializedObjectContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_PHP_3_OBJECT) {
        $self->{contents} = PhpSerializedValue::Php3ObjectContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_OBJECT) {
        $self->{contents} = PhpSerializedValue::ObjectContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_VARIABLE_REFERENCE) {
        $self->{contents} = PhpSerializedValue::IntContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_PHP_6_STRING) {
        $self->{contents} = PhpSerializedValue::StringContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_FLOAT) {
        $self->{contents} = PhpSerializedValue::FloatContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_OBJECT_REFERENCE) {
        $self->{contents} = PhpSerializedValue::IntContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_NULL) {
        $self->{contents} = PhpSerializedValue::NullContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_BOOL) {
        $self->{contents} = PhpSerializedValue::BoolContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_INT) {
        $self->{contents} = PhpSerializedValue::IntContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_ARRAY) {
        $self->{contents} = PhpSerializedValue::ArrayContents->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PhpSerializedValue::VALUE_TYPE_STRING) {
        $self->{contents} = PhpSerializedValue::StringContents->new($self->{_io}, $self, $self->{_root});
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub contents {
    my ($self) = @_;
    return $self->{contents};
}

########################################################################
package PhpSerializedValue::CountPrefixedMapping;

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

    $self->{num_entries_dec} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(58, 0, 1, 1));
    $self->{opening_brace} = $self->{_io}->ensure_fixed_contents(pack('C*', (123)));
    $self->{entries} = ();
    my $n_entries = $self->num_entries();
    for (my $i = 0; $i < $n_entries; $i++) {
        $self->{entries}[$i] = PhpSerializedValue::MappingEntry->new($self->{_io}, $self, $self->{_root});
    }
    $self->{closing_brace} = $self->{_io}->ensure_fixed_contents(pack('C*', (125)));
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries} if ($self->{num_entries});
    $self->{num_entries} = $self->num_entries_dec();
    return $self->{num_entries};
}

sub num_entries_dec {
    my ($self) = @_;
    return $self->{num_entries_dec};
}

sub opening_brace {
    my ($self) = @_;
    return $self->{opening_brace};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

sub closing_brace {
    my ($self) = @_;
    return $self->{closing_brace};
}

########################################################################
package PhpSerializedValue::FloatContents;

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

    $self->{colon} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{value_dec} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(59, 0, 1, 1));
}

sub colon {
    my ($self) = @_;
    return $self->{colon};
}

sub value_dec {
    my ($self) = @_;
    return $self->{value_dec};
}

########################################################################
package PhpSerializedValue::LengthPrefixedQuotedString;

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

    $self->{len_data_dec} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(58, 0, 1, 1));
    $self->{opening_quote} = $self->{_io}->ensure_fixed_contents(pack('C*', (34)));
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
    $self->{closing_quote} = $self->{_io}->ensure_fixed_contents(pack('C*', (34)));
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data} if ($self->{len_data});
    $self->{len_data} = $self->len_data_dec();
    return $self->{len_data};
}

sub len_data_dec {
    my ($self) = @_;
    return $self->{len_data_dec};
}

sub opening_quote {
    my ($self) = @_;
    return $self->{opening_quote};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub closing_quote {
    my ($self) = @_;
    return $self->{closing_quote};
}

########################################################################
package PhpSerializedValue::ObjectContents;

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

    $self->{colon1} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{class_name} = PhpSerializedValue::LengthPrefixedQuotedString->new($self->{_io}, $self, $self->{_root});
    $self->{colon2} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{properties} = PhpSerializedValue::CountPrefixedMapping->new($self->{_io}, $self, $self->{_root});
}

sub colon1 {
    my ($self) = @_;
    return $self->{colon1};
}

sub class_name {
    my ($self) = @_;
    return $self->{class_name};
}

sub colon2 {
    my ($self) = @_;
    return $self->{colon2};
}

sub properties {
    my ($self) = @_;
    return $self->{properties};
}

########################################################################
package PhpSerializedValue::ArrayContents;

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

    $self->{colon} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{elements} = PhpSerializedValue::CountPrefixedMapping->new($self->{_io}, $self, $self->{_root});
}

sub colon {
    my ($self) = @_;
    return $self->{colon};
}

sub elements {
    my ($self) = @_;
    return $self->{elements};
}

########################################################################
package PhpSerializedValue::CustomSerializedObjectContents;

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

    $self->{colon1} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{class_name} = PhpSerializedValue::LengthPrefixedQuotedString->new($self->{_io}, $self, $self->{_root});
    $self->{colon2} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{len_data_dec} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(58, 0, 1, 1));
    $self->{opening_brace} = $self->{_io}->ensure_fixed_contents(pack('C*', (123)));
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
    $self->{closing_quote} = $self->{_io}->ensure_fixed_contents(pack('C*', (125)));
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data} if ($self->{len_data});
    $self->{len_data} = $self->len_data_dec();
    return $self->{len_data};
}

sub colon1 {
    my ($self) = @_;
    return $self->{colon1};
}

sub class_name {
    my ($self) = @_;
    return $self->{class_name};
}

sub colon2 {
    my ($self) = @_;
    return $self->{colon2};
}

sub len_data_dec {
    my ($self) = @_;
    return $self->{len_data_dec};
}

sub opening_brace {
    my ($self) = @_;
    return $self->{opening_brace};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub closing_quote {
    my ($self) = @_;
    return $self->{closing_quote};
}

########################################################################
package PhpSerializedValue::NullContents;

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

    $self->{semicolon} = $self->{_io}->ensure_fixed_contents(pack('C*', (59)));
}

sub semicolon {
    my ($self) = @_;
    return $self->{semicolon};
}

########################################################################
package PhpSerializedValue::Php3ObjectContents;

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

    $self->{colon} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{properties} = PhpSerializedValue::CountPrefixedMapping->new($self->{_io}, $self, $self->{_root});
}

sub colon {
    my ($self) = @_;
    return $self->{colon};
}

sub properties {
    my ($self) = @_;
    return $self->{properties};
}

########################################################################
package PhpSerializedValue::BoolContents;

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

    $self->{colon} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{value_dec} = $self->{_io}->read_u1();
    $self->{semicolon} = $self->{_io}->ensure_fixed_contents(pack('C*', (59)));
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->value_dec() == $PhpSerializedValue::BOOL_VALUE_TRUE;
    return $self->{value};
}

sub colon {
    my ($self) = @_;
    return $self->{colon};
}

sub value_dec {
    my ($self) = @_;
    return $self->{value_dec};
}

sub semicolon {
    my ($self) = @_;
    return $self->{semicolon};
}

########################################################################
package PhpSerializedValue::StringContents;

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

    $self->{colon} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{string} = PhpSerializedValue::LengthPrefixedQuotedString->new($self->{_io}, $self, $self->{_root});
    $self->{semicolon} = $self->{_io}->ensure_fixed_contents(pack('C*', (59)));
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->string()->data();
    return $self->{value};
}

sub colon {
    my ($self) = @_;
    return $self->{colon};
}

sub string {
    my ($self) = @_;
    return $self->{string};
}

sub semicolon {
    my ($self) = @_;
    return $self->{semicolon};
}

########################################################################
package PhpSerializedValue::IntContents;

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

    $self->{colon} = $self->{_io}->ensure_fixed_contents(pack('C*', (58)));
    $self->{value_dec} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(59, 0, 1, 1));
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->value_dec();
    return $self->{value};
}

sub colon {
    my ($self) = @_;
    return $self->{colon};
}

sub value_dec {
    my ($self) = @_;
    return $self->{value_dec};
}

########################################################################
package PhpSerializedValue::MappingEntry;

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

    $self->{key} = PhpSerializedValue->new($self->{_io});
    $self->{value} = PhpSerializedValue->new($self->{_io});
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
