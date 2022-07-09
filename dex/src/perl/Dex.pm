# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;
use VlqBase128Le;

########################################################################
package Dex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CLASS_ACCESS_FLAGS_PUBLIC = 1;
our $CLASS_ACCESS_FLAGS_PRIVATE = 2;
our $CLASS_ACCESS_FLAGS_PROTECTED = 4;
our $CLASS_ACCESS_FLAGS_STATIC = 8;
our $CLASS_ACCESS_FLAGS_FINAL = 16;
our $CLASS_ACCESS_FLAGS_INTERFACE = 512;
our $CLASS_ACCESS_FLAGS_ABSTRACT = 1024;
our $CLASS_ACCESS_FLAGS_SYNTHETIC = 4096;
our $CLASS_ACCESS_FLAGS_ANNOTATION = 8192;
our $CLASS_ACCESS_FLAGS_ENUM = 16384;

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

    $self->{header} = Dex::HeaderItem->new($self->{_io}, $self, $self->{_root});
}

sub string_ids {
    my ($self) = @_;
    return $self->{string_ids} if ($self->{string_ids});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->string_ids_off());
    $self->{string_ids} = ();
    my $n_string_ids = $self->header()->string_ids_size();
    for (my $i = 0; $i < $n_string_ids; $i++) {
        push @{$self->{string_ids}}, Dex::StringIdItem->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{string_ids};
}

sub method_ids {
    my ($self) = @_;
    return $self->{method_ids} if ($self->{method_ids});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->method_ids_off());
    $self->{method_ids} = ();
    my $n_method_ids = $self->header()->method_ids_size();
    for (my $i = 0; $i < $n_method_ids; $i++) {
        push @{$self->{method_ids}}, Dex::MethodIdItem->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{method_ids};
}

sub link_data {
    my ($self) = @_;
    return $self->{link_data} if ($self->{link_data});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->link_off());
    $self->{link_data} = $self->{_io}->read_bytes($self->header()->link_size());
    $self->{_io}->seek($_pos);
    return $self->{link_data};
}

sub map {
    my ($self) = @_;
    return $self->{map} if ($self->{map});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->map_off());
    $self->{map} = Dex::MapList->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{map};
}

sub class_defs {
    my ($self) = @_;
    return $self->{class_defs} if ($self->{class_defs});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->class_defs_off());
    $self->{class_defs} = ();
    my $n_class_defs = $self->header()->class_defs_size();
    for (my $i = 0; $i < $n_class_defs; $i++) {
        push @{$self->{class_defs}}, Dex::ClassDefItem->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{class_defs};
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->data_off());
    $self->{data} = $self->{_io}->read_bytes($self->header()->data_size());
    $self->{_io}->seek($_pos);
    return $self->{data};
}

sub type_ids {
    my ($self) = @_;
    return $self->{type_ids} if ($self->{type_ids});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->type_ids_off());
    $self->{type_ids} = ();
    my $n_type_ids = $self->header()->type_ids_size();
    for (my $i = 0; $i < $n_type_ids; $i++) {
        push @{$self->{type_ids}}, Dex::TypeIdItem->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{type_ids};
}

sub proto_ids {
    my ($self) = @_;
    return $self->{proto_ids} if ($self->{proto_ids});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->proto_ids_off());
    $self->{proto_ids} = ();
    my $n_proto_ids = $self->header()->proto_ids_size();
    for (my $i = 0; $i < $n_proto_ids; $i++) {
        push @{$self->{proto_ids}}, Dex::ProtoIdItem->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{proto_ids};
}

sub field_ids {
    my ($self) = @_;
    return $self->{field_ids} if ($self->{field_ids});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->field_ids_off());
    $self->{field_ids} = ();
    my $n_field_ids = $self->header()->field_ids_size();
    for (my $i = 0; $i < $n_field_ids; $i++) {
        push @{$self->{field_ids}}, Dex::FieldIdItem->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{field_ids};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

########################################################################
package Dex::HeaderItem;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ENDIAN_CONSTANT_ENDIAN_CONSTANT = 305419896;
our $ENDIAN_CONSTANT_REVERSE_ENDIAN_CONSTANT = 2018915346;

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
    $self->{version_str} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(4), 0, 0));
    $self->{checksum} = $self->{_io}->read_u4le();
    $self->{signature} = $self->{_io}->read_bytes(20);
    $self->{file_size} = $self->{_io}->read_u4le();
    $self->{header_size} = $self->{_io}->read_u4le();
    $self->{endian_tag} = $self->{_io}->read_u4le();
    $self->{link_size} = $self->{_io}->read_u4le();
    $self->{link_off} = $self->{_io}->read_u4le();
    $self->{map_off} = $self->{_io}->read_u4le();
    $self->{string_ids_size} = $self->{_io}->read_u4le();
    $self->{string_ids_off} = $self->{_io}->read_u4le();
    $self->{type_ids_size} = $self->{_io}->read_u4le();
    $self->{type_ids_off} = $self->{_io}->read_u4le();
    $self->{proto_ids_size} = $self->{_io}->read_u4le();
    $self->{proto_ids_off} = $self->{_io}->read_u4le();
    $self->{field_ids_size} = $self->{_io}->read_u4le();
    $self->{field_ids_off} = $self->{_io}->read_u4le();
    $self->{method_ids_size} = $self->{_io}->read_u4le();
    $self->{method_ids_off} = $self->{_io}->read_u4le();
    $self->{class_defs_size} = $self->{_io}->read_u4le();
    $self->{class_defs_off} = $self->{_io}->read_u4le();
    $self->{data_size} = $self->{_io}->read_u4le();
    $self->{data_off} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version_str {
    my ($self) = @_;
    return $self->{version_str};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub endian_tag {
    my ($self) = @_;
    return $self->{endian_tag};
}

sub link_size {
    my ($self) = @_;
    return $self->{link_size};
}

sub link_off {
    my ($self) = @_;
    return $self->{link_off};
}

sub map_off {
    my ($self) = @_;
    return $self->{map_off};
}

sub string_ids_size {
    my ($self) = @_;
    return $self->{string_ids_size};
}

sub string_ids_off {
    my ($self) = @_;
    return $self->{string_ids_off};
}

sub type_ids_size {
    my ($self) = @_;
    return $self->{type_ids_size};
}

sub type_ids_off {
    my ($self) = @_;
    return $self->{type_ids_off};
}

sub proto_ids_size {
    my ($self) = @_;
    return $self->{proto_ids_size};
}

sub proto_ids_off {
    my ($self) = @_;
    return $self->{proto_ids_off};
}

sub field_ids_size {
    my ($self) = @_;
    return $self->{field_ids_size};
}

sub field_ids_off {
    my ($self) = @_;
    return $self->{field_ids_off};
}

sub method_ids_size {
    my ($self) = @_;
    return $self->{method_ids_size};
}

sub method_ids_off {
    my ($self) = @_;
    return $self->{method_ids_off};
}

sub class_defs_size {
    my ($self) = @_;
    return $self->{class_defs_size};
}

sub class_defs_off {
    my ($self) = @_;
    return $self->{class_defs_off};
}

sub data_size {
    my ($self) = @_;
    return $self->{data_size};
}

sub data_off {
    my ($self) = @_;
    return $self->{data_off};
}

########################################################################
package Dex::MapList;

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

    $self->{size} = $self->{_io}->read_u4le();
    $self->{list} = ();
    my $n_list = $self->size();
    for (my $i = 0; $i < $n_list; $i++) {
        push @{$self->{list}}, Dex::MapItem->new($self->{_io}, $self, $self->{_root});
    }
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub list {
    my ($self) = @_;
    return $self->{list};
}

########################################################################
package Dex::EncodedValue;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $VALUE_TYPE_ENUM_BYTE = 0;
our $VALUE_TYPE_ENUM_SHORT = 2;
our $VALUE_TYPE_ENUM_CHAR = 3;
our $VALUE_TYPE_ENUM_INT = 4;
our $VALUE_TYPE_ENUM_LONG = 6;
our $VALUE_TYPE_ENUM_FLOAT = 16;
our $VALUE_TYPE_ENUM_DOUBLE = 17;
our $VALUE_TYPE_ENUM_METHOD_TYPE = 21;
our $VALUE_TYPE_ENUM_METHOD_HANDLE = 22;
our $VALUE_TYPE_ENUM_STRING = 23;
our $VALUE_TYPE_ENUM_TYPE = 24;
our $VALUE_TYPE_ENUM_FIELD = 25;
our $VALUE_TYPE_ENUM_METHOD = 26;
our $VALUE_TYPE_ENUM_ENUM = 27;
our $VALUE_TYPE_ENUM_ARRAY = 28;
our $VALUE_TYPE_ENUM_ANNOTATION = 29;
our $VALUE_TYPE_ENUM_NULL = 30;
our $VALUE_TYPE_ENUM_BOOLEAN = 31;

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

    $self->{value_arg} = $self->{_io}->read_bits_int_be(3);
    $self->{value_type} = $self->{_io}->read_bits_int_be(5);
    $self->{_io}->align_to_byte();
    my $_on = $self->value_type();
    if ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_INT) {
        $self->{value} = $self->{_io}->read_s4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_ANNOTATION) {
        $self->{value} = Dex::EncodedAnnotation->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_LONG) {
        $self->{value} = $self->{_io}->read_s8le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_METHOD_HANDLE) {
        $self->{value} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_BYTE) {
        $self->{value} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_ARRAY) {
        $self->{value} = Dex::EncodedArray->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_METHOD_TYPE) {
        $self->{value} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_SHORT) {
        $self->{value} = $self->{_io}->read_s2le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_METHOD) {
        $self->{value} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_DOUBLE) {
        $self->{value} = $self->{_io}->read_f8le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_FLOAT) {
        $self->{value} = $self->{_io}->read_f4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_TYPE) {
        $self->{value} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_ENUM) {
        $self->{value} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_FIELD) {
        $self->{value} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_STRING) {
        $self->{value} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $Dex::EncodedValue::VALUE_TYPE_ENUM_CHAR) {
        $self->{value} = $self->{_io}->read_u2le();
    }
}

sub value_arg {
    my ($self) = @_;
    return $self->{value_arg};
}

sub value_type {
    my ($self) = @_;
    return $self->{value_type};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Dex::CallSiteIdItem;

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

    $self->{call_site_off} = $self->{_io}->read_u4le();
}

sub call_site_off {
    my ($self) = @_;
    return $self->{call_site_off};
}

########################################################################
package Dex::MethodIdItem;

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

    $self->{class_idx} = $self->{_io}->read_u2le();
    $self->{proto_idx} = $self->{_io}->read_u2le();
    $self->{name_idx} = $self->{_io}->read_u4le();
}

sub class_name {
    my ($self) = @_;
    return $self->{class_name} if ($self->{class_name});
    $self->{class_name} = @{$self->_root()->type_ids()}[$self->class_idx()]->type_name();
    return $self->{class_name};
}

sub proto_desc {
    my ($self) = @_;
    return $self->{proto_desc} if ($self->{proto_desc});
    $self->{proto_desc} = @{$self->_root()->proto_ids()}[$self->proto_idx()]->shorty_desc();
    return $self->{proto_desc};
}

sub method_name {
    my ($self) = @_;
    return $self->{method_name} if ($self->{method_name});
    $self->{method_name} = @{$self->_root()->string_ids()}[$self->name_idx()]->value()->data();
    return $self->{method_name};
}

sub class_idx {
    my ($self) = @_;
    return $self->{class_idx};
}

sub proto_idx {
    my ($self) = @_;
    return $self->{proto_idx};
}

sub name_idx {
    my ($self) = @_;
    return $self->{name_idx};
}

########################################################################
package Dex::TypeItem;

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

    $self->{type_idx} = $self->{_io}->read_u2le();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = @{$self->_root()->type_ids()}[$self->type_idx()]->type_name();
    return $self->{value};
}

sub type_idx {
    my ($self) = @_;
    return $self->{type_idx};
}

########################################################################
package Dex::TypeIdItem;

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

    $self->{descriptor_idx} = $self->{_io}->read_u4le();
}

sub type_name {
    my ($self) = @_;
    return $self->{type_name} if ($self->{type_name});
    $self->{type_name} = @{$self->_root()->string_ids()}[$self->descriptor_idx()]->value()->data();
    return $self->{type_name};
}

sub descriptor_idx {
    my ($self) = @_;
    return $self->{descriptor_idx};
}

########################################################################
package Dex::AnnotationElement;

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

    $self->{name_idx} = VlqBase128Le->new($self->{_io});
    $self->{value} = Dex::EncodedValue->new($self->{_io}, $self, $self->{_root});
}

sub name_idx {
    my ($self) = @_;
    return $self->{name_idx};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Dex::EncodedField;

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

    $self->{field_idx_diff} = VlqBase128Le->new($self->{_io});
    $self->{access_flags} = VlqBase128Le->new($self->{_io});
}

sub field_idx_diff {
    my ($self) = @_;
    return $self->{field_idx_diff};
}

sub access_flags {
    my ($self) = @_;
    return $self->{access_flags};
}

########################################################################
package Dex::EncodedArrayItem;

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

    $self->{value} = Dex::EncodedArray->new($self->{_io}, $self, $self->{_root});
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Dex::ClassDataItem;

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

    $self->{static_fields_size} = VlqBase128Le->new($self->{_io});
    $self->{instance_fields_size} = VlqBase128Le->new($self->{_io});
    $self->{direct_methods_size} = VlqBase128Le->new($self->{_io});
    $self->{virtual_methods_size} = VlqBase128Le->new($self->{_io});
    $self->{static_fields} = ();
    my $n_static_fields = $self->static_fields_size()->value();
    for (my $i = 0; $i < $n_static_fields; $i++) {
        push @{$self->{static_fields}}, Dex::EncodedField->new($self->{_io}, $self, $self->{_root});
    }
    $self->{instance_fields} = ();
    my $n_instance_fields = $self->instance_fields_size()->value();
    for (my $i = 0; $i < $n_instance_fields; $i++) {
        push @{$self->{instance_fields}}, Dex::EncodedField->new($self->{_io}, $self, $self->{_root});
    }
    $self->{direct_methods} = ();
    my $n_direct_methods = $self->direct_methods_size()->value();
    for (my $i = 0; $i < $n_direct_methods; $i++) {
        push @{$self->{direct_methods}}, Dex::EncodedMethod->new($self->{_io}, $self, $self->{_root});
    }
    $self->{virtual_methods} = ();
    my $n_virtual_methods = $self->virtual_methods_size()->value();
    for (my $i = 0; $i < $n_virtual_methods; $i++) {
        push @{$self->{virtual_methods}}, Dex::EncodedMethod->new($self->{_io}, $self, $self->{_root});
    }
}

sub static_fields_size {
    my ($self) = @_;
    return $self->{static_fields_size};
}

sub instance_fields_size {
    my ($self) = @_;
    return $self->{instance_fields_size};
}

sub direct_methods_size {
    my ($self) = @_;
    return $self->{direct_methods_size};
}

sub virtual_methods_size {
    my ($self) = @_;
    return $self->{virtual_methods_size};
}

sub static_fields {
    my ($self) = @_;
    return $self->{static_fields};
}

sub instance_fields {
    my ($self) = @_;
    return $self->{instance_fields};
}

sub direct_methods {
    my ($self) = @_;
    return $self->{direct_methods};
}

sub virtual_methods {
    my ($self) = @_;
    return $self->{virtual_methods};
}

########################################################################
package Dex::FieldIdItem;

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

    $self->{class_idx} = $self->{_io}->read_u2le();
    $self->{type_idx} = $self->{_io}->read_u2le();
    $self->{name_idx} = $self->{_io}->read_u4le();
}

sub class_name {
    my ($self) = @_;
    return $self->{class_name} if ($self->{class_name});
    $self->{class_name} = @{$self->_root()->type_ids()}[$self->class_idx()]->type_name();
    return $self->{class_name};
}

sub type_name {
    my ($self) = @_;
    return $self->{type_name} if ($self->{type_name});
    $self->{type_name} = @{$self->_root()->type_ids()}[$self->type_idx()]->type_name();
    return $self->{type_name};
}

sub field_name {
    my ($self) = @_;
    return $self->{field_name} if ($self->{field_name});
    $self->{field_name} = @{$self->_root()->string_ids()}[$self->name_idx()]->value()->data();
    return $self->{field_name};
}

sub class_idx {
    my ($self) = @_;
    return $self->{class_idx};
}

sub type_idx {
    my ($self) = @_;
    return $self->{type_idx};
}

sub name_idx {
    my ($self) = @_;
    return $self->{name_idx};
}

########################################################################
package Dex::EncodedAnnotation;

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

    $self->{type_idx} = VlqBase128Le->new($self->{_io});
    $self->{size} = VlqBase128Le->new($self->{_io});
    $self->{elements} = ();
    my $n_elements = $self->size()->value();
    for (my $i = 0; $i < $n_elements; $i++) {
        push @{$self->{elements}}, Dex::AnnotationElement->new($self->{_io}, $self, $self->{_root});
    }
}

sub type_idx {
    my ($self) = @_;
    return $self->{type_idx};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub elements {
    my ($self) = @_;
    return $self->{elements};
}

########################################################################
package Dex::ClassDefItem;

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

    $self->{class_idx} = $self->{_io}->read_u4le();
    $self->{access_flags} = $self->{_io}->read_u4le();
    $self->{superclass_idx} = $self->{_io}->read_u4le();
    $self->{interfaces_off} = $self->{_io}->read_u4le();
    $self->{source_file_idx} = $self->{_io}->read_u4le();
    $self->{annotations_off} = $self->{_io}->read_u4le();
    $self->{class_data_off} = $self->{_io}->read_u4le();
    $self->{static_values_off} = $self->{_io}->read_u4le();
}

sub type_name {
    my ($self) = @_;
    return $self->{type_name} if ($self->{type_name});
    $self->{type_name} = @{$self->_root()->type_ids()}[$self->class_idx()]->type_name();
    return $self->{type_name};
}

sub class_data {
    my ($self) = @_;
    return $self->{class_data} if ($self->{class_data});
    if ($self->class_data_off() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->class_data_off());
        $self->{class_data} = Dex::ClassDataItem->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{class_data};
}

sub static_values {
    my ($self) = @_;
    return $self->{static_values} if ($self->{static_values});
    if ($self->static_values_off() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->static_values_off());
        $self->{static_values} = Dex::EncodedArrayItem->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{static_values};
}

sub class_idx {
    my ($self) = @_;
    return $self->{class_idx};
}

sub access_flags {
    my ($self) = @_;
    return $self->{access_flags};
}

sub superclass_idx {
    my ($self) = @_;
    return $self->{superclass_idx};
}

sub interfaces_off {
    my ($self) = @_;
    return $self->{interfaces_off};
}

sub source_file_idx {
    my ($self) = @_;
    return $self->{source_file_idx};
}

sub annotations_off {
    my ($self) = @_;
    return $self->{annotations_off};
}

sub class_data_off {
    my ($self) = @_;
    return $self->{class_data_off};
}

sub static_values_off {
    my ($self) = @_;
    return $self->{static_values_off};
}

########################################################################
package Dex::TypeList;

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

    $self->{size} = $self->{_io}->read_u4le();
    $self->{list} = ();
    my $n_list = $self->size();
    for (my $i = 0; $i < $n_list; $i++) {
        push @{$self->{list}}, Dex::TypeItem->new($self->{_io}, $self, $self->{_root});
    }
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub list {
    my ($self) = @_;
    return $self->{list};
}

########################################################################
package Dex::StringIdItem;

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

    $self->{string_data_off} = $self->{_io}->read_u4le();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->string_data_off());
    $self->{value} = Dex::StringIdItem::StringDataItem->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{value};
}

sub string_data_off {
    my ($self) = @_;
    return $self->{string_data_off};
}

########################################################################
package Dex::StringIdItem::StringDataItem;

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

    $self->{utf16_size} = VlqBase128Le->new($self->{_io});
    $self->{data} = Encode::decode("ascii", $self->{_io}->read_bytes($self->utf16_size()->value()));
}

sub utf16_size {
    my ($self) = @_;
    return $self->{utf16_size};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Dex::ProtoIdItem;

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

    $self->{shorty_idx} = $self->{_io}->read_u4le();
    $self->{return_type_idx} = $self->{_io}->read_u4le();
    $self->{parameters_off} = $self->{_io}->read_u4le();
}

sub shorty_desc {
    my ($self) = @_;
    return $self->{shorty_desc} if ($self->{shorty_desc});
    $self->{shorty_desc} = @{$self->_root()->string_ids()}[$self->shorty_idx()]->value()->data();
    return $self->{shorty_desc};
}

sub params_types {
    my ($self) = @_;
    return $self->{params_types} if ($self->{params_types});
    if ($self->parameters_off() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->parameters_off());
        $self->{params_types} = Dex::TypeList->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{params_types};
}

sub return_type {
    my ($self) = @_;
    return $self->{return_type} if ($self->{return_type});
    $self->{return_type} = @{$self->_root()->type_ids()}[$self->return_type_idx()]->type_name();
    return $self->{return_type};
}

sub shorty_idx {
    my ($self) = @_;
    return $self->{shorty_idx};
}

sub return_type_idx {
    my ($self) = @_;
    return $self->{return_type_idx};
}

sub parameters_off {
    my ($self) = @_;
    return $self->{parameters_off};
}

########################################################################
package Dex::EncodedMethod;

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

    $self->{method_idx_diff} = VlqBase128Le->new($self->{_io});
    $self->{access_flags} = VlqBase128Le->new($self->{_io});
    $self->{code_off} = VlqBase128Le->new($self->{_io});
}

sub method_idx_diff {
    my ($self) = @_;
    return $self->{method_idx_diff};
}

sub access_flags {
    my ($self) = @_;
    return $self->{access_flags};
}

sub code_off {
    my ($self) = @_;
    return $self->{code_off};
}

########################################################################
package Dex::MapItem;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $MAP_ITEM_TYPE_HEADER_ITEM = 0;
our $MAP_ITEM_TYPE_STRING_ID_ITEM = 1;
our $MAP_ITEM_TYPE_TYPE_ID_ITEM = 2;
our $MAP_ITEM_TYPE_PROTO_ID_ITEM = 3;
our $MAP_ITEM_TYPE_FIELD_ID_ITEM = 4;
our $MAP_ITEM_TYPE_METHOD_ID_ITEM = 5;
our $MAP_ITEM_TYPE_CLASS_DEF_ITEM = 6;
our $MAP_ITEM_TYPE_CALL_SITE_ID_ITEM = 7;
our $MAP_ITEM_TYPE_METHOD_HANDLE_ITEM = 8;
our $MAP_ITEM_TYPE_MAP_LIST = 4096;
our $MAP_ITEM_TYPE_TYPE_LIST = 4097;
our $MAP_ITEM_TYPE_ANNOTATION_SET_REF_LIST = 4098;
our $MAP_ITEM_TYPE_ANNOTATION_SET_ITEM = 4099;
our $MAP_ITEM_TYPE_CLASS_DATA_ITEM = 8192;
our $MAP_ITEM_TYPE_CODE_ITEM = 8193;
our $MAP_ITEM_TYPE_STRING_DATA_ITEM = 8194;
our $MAP_ITEM_TYPE_DEBUG_INFO_ITEM = 8195;
our $MAP_ITEM_TYPE_ANNOTATION_ITEM = 8196;
our $MAP_ITEM_TYPE_ENCODED_ARRAY_ITEM = 8197;
our $MAP_ITEM_TYPE_ANNOTATIONS_DIRECTORY_ITEM = 8198;

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

    $self->{type} = $self->{_io}->read_u2le();
    $self->{unused} = $self->{_io}->read_u2le();
    $self->{size} = $self->{_io}->read_u4le();
    $self->{offset} = $self->{_io}->read_u4le();
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

########################################################################
package Dex::EncodedArray;

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

    $self->{size} = VlqBase128Le->new($self->{_io});
    $self->{values} = ();
    my $n_values = $self->size()->value();
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, Dex::EncodedValue->new($self->{_io}, $self, $self->{_root});
    }
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

1;
