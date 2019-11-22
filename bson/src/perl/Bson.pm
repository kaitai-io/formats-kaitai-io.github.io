# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Bson;

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

    $self->{len} = $self->{_io}->read_s4le();
    $self->{_raw_fields} = $self->{_io}->read_bytes(($self->len() - 5));
    my $io__raw_fields = IO::KaitaiStruct::Stream->new($self->{_raw_fields});
    $self->{fields} = Bson::ElementsList->new($io__raw_fields, $self, $self->{_root});
    $self->{terminator} = $self->{_io}->ensure_fixed_contents(pack('C*', (0)));
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub fields {
    my ($self) = @_;
    return $self->{fields};
}

sub terminator {
    my ($self) = @_;
    return $self->{terminator};
}

sub _raw_fields {
    my ($self) = @_;
    return $self->{_raw_fields};
}

########################################################################
package Bson::Timestamp;

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

    $self->{increment} = $self->{_io}->read_u4le();
    $self->{timestamp} = $self->{_io}->read_u4le();
}

sub increment {
    my ($self) = @_;
    return $self->{increment};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

########################################################################
package Bson::BinData;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SUBTYPE_GENERIC = 0;
our $SUBTYPE_FUNCTION = 1;
our $SUBTYPE_BYTE_ARRAY_DEPRECATED = 2;
our $SUBTYPE_UUID_DEPRECATED = 3;
our $SUBTYPE_UUID = 4;
our $SUBTYPE_MD5 = 5;
our $SUBTYPE_CUSTOM = 128;

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

    $self->{len} = $self->{_io}->read_s4le();
    $self->{subtype} = $self->{_io}->read_u1();
    my $_on = $self->subtype();
    if ($_on == $SUBTYPE_BYTE_ARRAY_DEPRECATED) {
        $self->{_raw_content} = $self->{_io}->read_bytes($self->len());
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = Bson::BinData::ByteArrayDeprecated->new($io__raw_content, $self, $self->{_root});
    }
    else {
        $self->{content} = $self->{_io}->read_bytes($self->len());
    }
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub subtype {
    my ($self) = @_;
    return $self->{subtype};
}

sub content {
    my ($self) = @_;
    return $self->{content};
}

sub _raw_content {
    my ($self) = @_;
    return $self->{_raw_content};
}

########################################################################
package Bson::BinData::ByteArrayDeprecated;

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

    $self->{len} = $self->{_io}->read_s4le();
    $self->{content} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub content {
    my ($self) = @_;
    return $self->{content};
}

########################################################################
package Bson::ElementsList;

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

    $self->{elements} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{elements}}, Bson::Element->new($self->{_io}, $self, $self->{_root});
    }
}

sub elements {
    my ($self) = @_;
    return $self->{elements};
}

########################################################################
package Bson::Cstring;

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

    $self->{str} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

########################################################################
package Bson::String;

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

    $self->{len} = $self->{_io}->read_s4le();
    $self->{str} = Encode::decode("UTF-8", $self->{_io}->read_bytes(($self->len() - 1)));
    $self->{terminator} = $self->{_io}->ensure_fixed_contents(pack('C*', (0)));
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

sub terminator {
    my ($self) = @_;
    return $self->{terminator};
}

########################################################################
package Bson::Element;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $BSON_TYPE_MIN_KEY = -1;
our $BSON_TYPE_END_OF_OBJECT = 0;
our $BSON_TYPE_NUMBER_DOUBLE = 1;
our $BSON_TYPE_STRING = 2;
our $BSON_TYPE_DOCUMENT = 3;
our $BSON_TYPE_ARRAY = 4;
our $BSON_TYPE_BIN_DATA = 5;
our $BSON_TYPE_UNDEFINED = 6;
our $BSON_TYPE_OBJECT_ID = 7;
our $BSON_TYPE_BOOLEAN = 8;
our $BSON_TYPE_UTC_DATETIME = 9;
our $BSON_TYPE_JST_NULL = 10;
our $BSON_TYPE_REG_EX = 11;
our $BSON_TYPE_DB_POINTER = 12;
our $BSON_TYPE_JAVASCRIPT = 13;
our $BSON_TYPE_SYMBOL = 14;
our $BSON_TYPE_CODE_WITH_SCOPE = 15;
our $BSON_TYPE_NUMBER_INT = 16;
our $BSON_TYPE_TIMESTAMP = 17;
our $BSON_TYPE_NUMBER_LONG = 18;
our $BSON_TYPE_NUMBER_DECIMAL = 19;
our $BSON_TYPE_MAX_KEY = 127;

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

    $self->{type_byte} = $self->{_io}->read_u1();
    $self->{name} = Bson::Cstring->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->type_byte();
    if ($_on == $BSON_TYPE_NUMBER_DOUBLE) {
        $self->{content} = $self->{_io}->read_f8le();
    }
    elsif ($_on == $BSON_TYPE_CODE_WITH_SCOPE) {
        $self->{content} = Bson::CodeWithScope->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_OBJECT_ID) {
        $self->{content} = Bson::ObjectId->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_STRING) {
        $self->{content} = Bson::String->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_REG_EX) {
        $self->{content} = Bson::RegEx->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_NUMBER_DECIMAL) {
        $self->{content} = Bson::F16->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_UTC_DATETIME) {
        $self->{content} = $self->{_io}->read_s8le();
    }
    elsif ($_on == $BSON_TYPE_NUMBER_LONG) {
        $self->{content} = $self->{_io}->read_s8le();
    }
    elsif ($_on == $BSON_TYPE_TIMESTAMP) {
        $self->{content} = Bson::Timestamp->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_DB_POINTER) {
        $self->{content} = Bson::DbPointer->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_ARRAY) {
        $self->{content} = Bson->new($self->{_io});
    }
    elsif ($_on == $BSON_TYPE_JAVASCRIPT) {
        $self->{content} = Bson::String->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_BOOLEAN) {
        $self->{content} = $self->{_io}->read_u1();
    }
    elsif ($_on == $BSON_TYPE_DOCUMENT) {
        $self->{content} = Bson->new($self->{_io});
    }
    elsif ($_on == $BSON_TYPE_SYMBOL) {
        $self->{content} = Bson::String->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $BSON_TYPE_NUMBER_INT) {
        $self->{content} = $self->{_io}->read_s4le();
    }
    elsif ($_on == $BSON_TYPE_BIN_DATA) {
        $self->{content} = Bson::BinData->new($self->{_io}, $self, $self->{_root});
    }
}

sub type_byte {
    my ($self) = @_;
    return $self->{type_byte};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub content {
    my ($self) = @_;
    return $self->{content};
}

########################################################################
package Bson::DbPointer;

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

    $self->{namespace} = Bson::String->new($self->{_io}, $self, $self->{_root});
    $self->{id} = Bson::ObjectId->new($self->{_io}, $self, $self->{_root});
}

sub namespace {
    my ($self) = @_;
    return $self->{namespace};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

########################################################################
package Bson::U3;

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

    $self->{b1} = $self->{_io}->read_u1();
    $self->{b2} = $self->{_io}->read_u1();
    $self->{b3} = $self->{_io}->read_u1();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (($self->b1() | ($self->b2() << 8)) | ($self->b3() << 16));
    return $self->{value};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub b2 {
    my ($self) = @_;
    return $self->{b2};
}

sub b3 {
    my ($self) = @_;
    return $self->{b3};
}

########################################################################
package Bson::CodeWithScope;

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

    $self->{id} = $self->{_io}->read_s4le();
    $self->{source} = Bson::String->new($self->{_io}, $self, $self->{_root});
    $self->{scope} = Bson->new($self->{_io});
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub source {
    my ($self) = @_;
    return $self->{source};
}

sub scope {
    my ($self) = @_;
    return $self->{scope};
}

########################################################################
package Bson::F16;

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

    $self->{str} = $self->{_io}->read_bits_int(1);
    $self->{exponent} = $self->{_io}->read_bits_int(15);
    $self->{significand_hi} = $self->{_io}->read_bits_int(49);
    $self->{_io}->align_to_byte();
    $self->{significand_lo} = $self->{_io}->read_u8le();
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

sub exponent {
    my ($self) = @_;
    return $self->{exponent};
}

sub significand_hi {
    my ($self) = @_;
    return $self->{significand_hi};
}

sub significand_lo {
    my ($self) = @_;
    return $self->{significand_lo};
}

########################################################################
package Bson::ObjectId;

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

    $self->{epoch_time} = $self->{_io}->read_u4le();
    $self->{machine_id} = Bson::U3->new($self->{_io}, $self, $self->{_root});
    $self->{process_id} = $self->{_io}->read_u2le();
    $self->{counter} = Bson::U3->new($self->{_io}, $self, $self->{_root});
}

sub epoch_time {
    my ($self) = @_;
    return $self->{epoch_time};
}

sub machine_id {
    my ($self) = @_;
    return $self->{machine_id};
}

sub process_id {
    my ($self) = @_;
    return $self->{process_id};
}

sub counter {
    my ($self) = @_;
    return $self->{counter};
}

########################################################################
package Bson::RegEx;

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

    $self->{pattern} = Bson::Cstring->new($self->{_io}, $self, $self->{_root});
    $self->{options} = Bson::Cstring->new($self->{_io}, $self, $self->{_root});
}

sub pattern {
    my ($self) = @_;
    return $self->{pattern};
}

sub options {
    my ($self) = @_;
    return $self->{options};
}

1;
