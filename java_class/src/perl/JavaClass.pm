# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package JavaClass;

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
    $self->{version_minor} = $self->{_io}->read_u2be();
    $self->{version_major} = $self->{_io}->read_u2be();
    $self->{constant_pool_count} = $self->{_io}->read_u2be();
    $self->{constant_pool} = ();
    my $n_constant_pool = ($self->constant_pool_count() - 1);
    for (my $i = 0; $i < $n_constant_pool; $i++) {
        push @{$self->{constant_pool}}, JavaClass::ConstantPoolEntry->new($self->{_io}, $self, $self->{_root});
    }
    $self->{access_flags} = $self->{_io}->read_u2be();
    $self->{this_class} = $self->{_io}->read_u2be();
    $self->{super_class} = $self->{_io}->read_u2be();
    $self->{interfaces_count} = $self->{_io}->read_u2be();
    $self->{interfaces} = ();
    my $n_interfaces = $self->interfaces_count();
    for (my $i = 0; $i < $n_interfaces; $i++) {
        push @{$self->{interfaces}}, $self->{_io}->read_u2be();
    }
    $self->{fields_count} = $self->{_io}->read_u2be();
    $self->{fields} = ();
    my $n_fields = $self->fields_count();
    for (my $i = 0; $i < $n_fields; $i++) {
        push @{$self->{fields}}, JavaClass::FieldInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{methods_count} = $self->{_io}->read_u2be();
    $self->{methods} = ();
    my $n_methods = $self->methods_count();
    for (my $i = 0; $i < $n_methods; $i++) {
        push @{$self->{methods}}, JavaClass::MethodInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{attributes_count} = $self->{_io}->read_u2be();
    $self->{attributes} = ();
    my $n_attributes = $self->attributes_count();
    for (my $i = 0; $i < $n_attributes; $i++) {
        push @{$self->{attributes}}, JavaClass::AttributeInfo->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version_minor {
    my ($self) = @_;
    return $self->{version_minor};
}

sub version_major {
    my ($self) = @_;
    return $self->{version_major};
}

sub constant_pool_count {
    my ($self) = @_;
    return $self->{constant_pool_count};
}

sub constant_pool {
    my ($self) = @_;
    return $self->{constant_pool};
}

sub access_flags {
    my ($self) = @_;
    return $self->{access_flags};
}

sub this_class {
    my ($self) = @_;
    return $self->{this_class};
}

sub super_class {
    my ($self) = @_;
    return $self->{super_class};
}

sub interfaces_count {
    my ($self) = @_;
    return $self->{interfaces_count};
}

sub interfaces {
    my ($self) = @_;
    return $self->{interfaces};
}

sub fields_count {
    my ($self) = @_;
    return $self->{fields_count};
}

sub fields {
    my ($self) = @_;
    return $self->{fields};
}

sub methods_count {
    my ($self) = @_;
    return $self->{methods_count};
}

sub methods {
    my ($self) = @_;
    return $self->{methods};
}

sub attributes_count {
    my ($self) = @_;
    return $self->{attributes_count};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

########################################################################
package JavaClass::FloatCpInfo;

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

    $self->{value} = $self->{_io}->read_f4be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package JavaClass::AttributeInfo;

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

    $self->{name_index} = $self->{_io}->read_u2be();
    $self->{attribute_length} = $self->{_io}->read_u4be();
    my $_on = $self->name_as_str();
    if ($_on eq "SourceFile") {
        $self->{_raw_info} = $self->{_io}->read_bytes($self->attribute_length());
        my $io__raw_info = IO::KaitaiStruct::Stream->new($self->{_raw_info});
        $self->{info} = JavaClass::AttributeInfo::AttrBodySourceFile->new($io__raw_info, $self, $self->{_root});
    }
    elsif ($_on eq "LineNumberTable") {
        $self->{_raw_info} = $self->{_io}->read_bytes($self->attribute_length());
        my $io__raw_info = IO::KaitaiStruct::Stream->new($self->{_raw_info});
        $self->{info} = JavaClass::AttributeInfo::AttrBodyLineNumberTable->new($io__raw_info, $self, $self->{_root});
    }
    elsif ($_on eq "Exceptions") {
        $self->{_raw_info} = $self->{_io}->read_bytes($self->attribute_length());
        my $io__raw_info = IO::KaitaiStruct::Stream->new($self->{_raw_info});
        $self->{info} = JavaClass::AttributeInfo::AttrBodyExceptions->new($io__raw_info, $self, $self->{_root});
    }
    elsif ($_on eq "Code") {
        $self->{_raw_info} = $self->{_io}->read_bytes($self->attribute_length());
        my $io__raw_info = IO::KaitaiStruct::Stream->new($self->{_raw_info});
        $self->{info} = JavaClass::AttributeInfo::AttrBodyCode->new($io__raw_info, $self, $self->{_root});
    }
    else {
        $self->{info} = $self->{_io}->read_bytes($self->attribute_length());
    }
}

sub name_as_str {
    my ($self) = @_;
    return $self->{name_as_str} if ($self->{name_as_str});
    $self->{name_as_str} = @{$self->_root()->constant_pool()}[($self->name_index() - 1)]->cp_info()->value();
    return $self->{name_as_str};
}

sub name_index {
    my ($self) = @_;
    return $self->{name_index};
}

sub attribute_length {
    my ($self) = @_;
    return $self->{attribute_length};
}

sub info {
    my ($self) = @_;
    return $self->{info};
}

sub _raw_info {
    my ($self) = @_;
    return $self->{_raw_info};
}

########################################################################
package JavaClass::AttributeInfo::AttrBodyCode;

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

    $self->{max_stack} = $self->{_io}->read_u2be();
    $self->{max_locals} = $self->{_io}->read_u2be();
    $self->{code_length} = $self->{_io}->read_u4be();
    $self->{code} = $self->{_io}->read_bytes($self->code_length());
    $self->{exception_table_length} = $self->{_io}->read_u2be();
    $self->{exception_table} = ();
    my $n_exception_table = $self->exception_table_length();
    for (my $i = 0; $i < $n_exception_table; $i++) {
        push @{$self->{exception_table}}, JavaClass::AttributeInfo::AttrBodyCode::ExceptionEntry->new($self->{_io}, $self, $self->{_root});
    }
    $self->{attributes_count} = $self->{_io}->read_u2be();
    $self->{attributes} = ();
    my $n_attributes = $self->attributes_count();
    for (my $i = 0; $i < $n_attributes; $i++) {
        push @{$self->{attributes}}, JavaClass::AttributeInfo->new($self->{_io}, $self, $self->{_root});
    }
}

sub max_stack {
    my ($self) = @_;
    return $self->{max_stack};
}

sub max_locals {
    my ($self) = @_;
    return $self->{max_locals};
}

sub code_length {
    my ($self) = @_;
    return $self->{code_length};
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub exception_table_length {
    my ($self) = @_;
    return $self->{exception_table_length};
}

sub exception_table {
    my ($self) = @_;
    return $self->{exception_table};
}

sub attributes_count {
    my ($self) = @_;
    return $self->{attributes_count};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

########################################################################
package JavaClass::AttributeInfo::AttrBodyCode::ExceptionEntry;

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

    $self->{start_pc} = $self->{_io}->read_u2be();
    $self->{end_pc} = $self->{_io}->read_u2be();
    $self->{handler_pc} = $self->{_io}->read_u2be();
    $self->{catch_type} = $self->{_io}->read_u2be();
}

sub catch_exception {
    my ($self) = @_;
    return $self->{catch_exception} if ($self->{catch_exception});
    if ($self->catch_type() != 0) {
        $self->{catch_exception} = @{$self->_root()->constant_pool()}[($self->catch_type() - 1)];
    }
    return $self->{catch_exception};
}

sub start_pc {
    my ($self) = @_;
    return $self->{start_pc};
}

sub end_pc {
    my ($self) = @_;
    return $self->{end_pc};
}

sub handler_pc {
    my ($self) = @_;
    return $self->{handler_pc};
}

sub catch_type {
    my ($self) = @_;
    return $self->{catch_type};
}

########################################################################
package JavaClass::AttributeInfo::AttrBodyExceptions;

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

    $self->{number_of_exceptions} = $self->{_io}->read_u2be();
    $self->{exceptions} = ();
    my $n_exceptions = $self->number_of_exceptions();
    for (my $i = 0; $i < $n_exceptions; $i++) {
        push @{$self->{exceptions}}, JavaClass::AttributeInfo::AttrBodyExceptions::ExceptionTableEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub number_of_exceptions {
    my ($self) = @_;
    return $self->{number_of_exceptions};
}

sub exceptions {
    my ($self) = @_;
    return $self->{exceptions};
}

########################################################################
package JavaClass::AttributeInfo::AttrBodyExceptions::ExceptionTableEntry;

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

    $self->{index} = $self->{_io}->read_u2be();
}

sub as_info {
    my ($self) = @_;
    return $self->{as_info} if ($self->{as_info});
    $self->{as_info} = @{$self->_root()->constant_pool()}[($self->index() - 1)]->cp_info();
    return $self->{as_info};
}

sub name_as_str {
    my ($self) = @_;
    return $self->{name_as_str} if ($self->{name_as_str});
    $self->{name_as_str} = $self->as_info()->name_as_str();
    return $self->{name_as_str};
}

sub index {
    my ($self) = @_;
    return $self->{index};
}

########################################################################
package JavaClass::AttributeInfo::AttrBodySourceFile;

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

    $self->{sourcefile_index} = $self->{_io}->read_u2be();
}

sub sourcefile_as_str {
    my ($self) = @_;
    return $self->{sourcefile_as_str} if ($self->{sourcefile_as_str});
    $self->{sourcefile_as_str} = @{$self->_root()->constant_pool()}[($self->sourcefile_index() - 1)]->cp_info()->value();
    return $self->{sourcefile_as_str};
}

sub sourcefile_index {
    my ($self) = @_;
    return $self->{sourcefile_index};
}

########################################################################
package JavaClass::AttributeInfo::AttrBodyLineNumberTable;

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

    $self->{line_number_table_length} = $self->{_io}->read_u2be();
    $self->{line_number_table} = ();
    my $n_line_number_table = $self->line_number_table_length();
    for (my $i = 0; $i < $n_line_number_table; $i++) {
        push @{$self->{line_number_table}}, JavaClass::AttributeInfo::AttrBodyLineNumberTable::LineNumberTableEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub line_number_table_length {
    my ($self) = @_;
    return $self->{line_number_table_length};
}

sub line_number_table {
    my ($self) = @_;
    return $self->{line_number_table};
}

########################################################################
package JavaClass::AttributeInfo::AttrBodyLineNumberTable::LineNumberTableEntry;

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

    $self->{start_pc} = $self->{_io}->read_u2be();
    $self->{line_number} = $self->{_io}->read_u2be();
}

sub start_pc {
    my ($self) = @_;
    return $self->{start_pc};
}

sub line_number {
    my ($self) = @_;
    return $self->{line_number};
}

########################################################################
package JavaClass::MethodRefCpInfo;

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

    $self->{class_index} = $self->{_io}->read_u2be();
    $self->{name_and_type_index} = $self->{_io}->read_u2be();
}

sub class_as_info {
    my ($self) = @_;
    return $self->{class_as_info} if ($self->{class_as_info});
    $self->{class_as_info} = @{$self->_root()->constant_pool()}[($self->class_index() - 1)]->cp_info();
    return $self->{class_as_info};
}

sub name_and_type_as_info {
    my ($self) = @_;
    return $self->{name_and_type_as_info} if ($self->{name_and_type_as_info});
    $self->{name_and_type_as_info} = @{$self->_root()->constant_pool()}[($self->name_and_type_index() - 1)]->cp_info();
    return $self->{name_and_type_as_info};
}

sub class_index {
    my ($self) = @_;
    return $self->{class_index};
}

sub name_and_type_index {
    my ($self) = @_;
    return $self->{name_and_type_index};
}

########################################################################
package JavaClass::FieldInfo;

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

    $self->{access_flags} = $self->{_io}->read_u2be();
    $self->{name_index} = $self->{_io}->read_u2be();
    $self->{descriptor_index} = $self->{_io}->read_u2be();
    $self->{attributes_count} = $self->{_io}->read_u2be();
    $self->{attributes} = ();
    my $n_attributes = $self->attributes_count();
    for (my $i = 0; $i < $n_attributes; $i++) {
        push @{$self->{attributes}}, JavaClass::AttributeInfo->new($self->{_io}, $self, $self->{_root});
    }
}

sub name_as_str {
    my ($self) = @_;
    return $self->{name_as_str} if ($self->{name_as_str});
    $self->{name_as_str} = @{$self->_root()->constant_pool()}[($self->name_index() - 1)]->cp_info()->value();
    return $self->{name_as_str};
}

sub access_flags {
    my ($self) = @_;
    return $self->{access_flags};
}

sub name_index {
    my ($self) = @_;
    return $self->{name_index};
}

sub descriptor_index {
    my ($self) = @_;
    return $self->{descriptor_index};
}

sub attributes_count {
    my ($self) = @_;
    return $self->{attributes_count};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

########################################################################
package JavaClass::DoubleCpInfo;

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

    $self->{value} = $self->{_io}->read_f8be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package JavaClass::LongCpInfo;

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

    $self->{value} = $self->{_io}->read_u8be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package JavaClass::InvokeDynamicCpInfo;

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

    $self->{bootstrap_method_attr_index} = $self->{_io}->read_u2be();
    $self->{name_and_type_index} = $self->{_io}->read_u2be();
}

sub bootstrap_method_attr_index {
    my ($self) = @_;
    return $self->{bootstrap_method_attr_index};
}

sub name_and_type_index {
    my ($self) = @_;
    return $self->{name_and_type_index};
}

########################################################################
package JavaClass::MethodHandleCpInfo;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $REFERENCE_KIND_ENUM_GET_FIELD = 1;
our $REFERENCE_KIND_ENUM_GET_STATIC = 2;
our $REFERENCE_KIND_ENUM_PUT_FIELD = 3;
our $REFERENCE_KIND_ENUM_PUT_STATIC = 4;
our $REFERENCE_KIND_ENUM_INVOKE_VIRTUAL = 5;
our $REFERENCE_KIND_ENUM_INVOKE_STATIC = 6;
our $REFERENCE_KIND_ENUM_INVOKE_SPECIAL = 7;
our $REFERENCE_KIND_ENUM_NEW_INVOKE_SPECIAL = 8;
our $REFERENCE_KIND_ENUM_INVOKE_INTERFACE = 9;

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

    $self->{reference_kind} = $self->{_io}->read_u1();
    $self->{reference_index} = $self->{_io}->read_u2be();
}

sub reference_kind {
    my ($self) = @_;
    return $self->{reference_kind};
}

sub reference_index {
    my ($self) = @_;
    return $self->{reference_index};
}

########################################################################
package JavaClass::NameAndTypeCpInfo;

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

    $self->{name_index} = $self->{_io}->read_u2be();
    $self->{descriptor_index} = $self->{_io}->read_u2be();
}

sub name_as_info {
    my ($self) = @_;
    return $self->{name_as_info} if ($self->{name_as_info});
    $self->{name_as_info} = @{$self->_root()->constant_pool()}[($self->name_index() - 1)]->cp_info();
    return $self->{name_as_info};
}

sub name_as_str {
    my ($self) = @_;
    return $self->{name_as_str} if ($self->{name_as_str});
    $self->{name_as_str} = $self->name_as_info()->value();
    return $self->{name_as_str};
}

sub descriptor_as_info {
    my ($self) = @_;
    return $self->{descriptor_as_info} if ($self->{descriptor_as_info});
    $self->{descriptor_as_info} = @{$self->_root()->constant_pool()}[($self->descriptor_index() - 1)]->cp_info();
    return $self->{descriptor_as_info};
}

sub descriptor_as_str {
    my ($self) = @_;
    return $self->{descriptor_as_str} if ($self->{descriptor_as_str});
    $self->{descriptor_as_str} = $self->descriptor_as_info()->value();
    return $self->{descriptor_as_str};
}

sub name_index {
    my ($self) = @_;
    return $self->{name_index};
}

sub descriptor_index {
    my ($self) = @_;
    return $self->{descriptor_index};
}

########################################################################
package JavaClass::Utf8CpInfo;

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

    $self->{str_len} = $self->{_io}->read_u2be();
    $self->{value} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->str_len()));
}

sub str_len {
    my ($self) = @_;
    return $self->{str_len};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package JavaClass::StringCpInfo;

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

    $self->{string_index} = $self->{_io}->read_u2be();
}

sub string_index {
    my ($self) = @_;
    return $self->{string_index};
}

########################################################################
package JavaClass::MethodTypeCpInfo;

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

    $self->{descriptor_index} = $self->{_io}->read_u2be();
}

sub descriptor_index {
    my ($self) = @_;
    return $self->{descriptor_index};
}

########################################################################
package JavaClass::InterfaceMethodRefCpInfo;

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

    $self->{class_index} = $self->{_io}->read_u2be();
    $self->{name_and_type_index} = $self->{_io}->read_u2be();
}

sub class_as_info {
    my ($self) = @_;
    return $self->{class_as_info} if ($self->{class_as_info});
    $self->{class_as_info} = @{$self->_root()->constant_pool()}[($self->class_index() - 1)]->cp_info();
    return $self->{class_as_info};
}

sub name_and_type_as_info {
    my ($self) = @_;
    return $self->{name_and_type_as_info} if ($self->{name_and_type_as_info});
    $self->{name_and_type_as_info} = @{$self->_root()->constant_pool()}[($self->name_and_type_index() - 1)]->cp_info();
    return $self->{name_and_type_as_info};
}

sub class_index {
    my ($self) = @_;
    return $self->{class_index};
}

sub name_and_type_index {
    my ($self) = @_;
    return $self->{name_and_type_index};
}

########################################################################
package JavaClass::ClassCpInfo;

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

    $self->{name_index} = $self->{_io}->read_u2be();
}

sub name_as_info {
    my ($self) = @_;
    return $self->{name_as_info} if ($self->{name_as_info});
    $self->{name_as_info} = @{$self->_root()->constant_pool()}[($self->name_index() - 1)]->cp_info();
    return $self->{name_as_info};
}

sub name_as_str {
    my ($self) = @_;
    return $self->{name_as_str} if ($self->{name_as_str});
    $self->{name_as_str} = $self->name_as_info()->value();
    return $self->{name_as_str};
}

sub name_index {
    my ($self) = @_;
    return $self->{name_index};
}

########################################################################
package JavaClass::ConstantPoolEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TAG_ENUM_UTF8 = 1;
our $TAG_ENUM_INTEGER = 3;
our $TAG_ENUM_FLOAT = 4;
our $TAG_ENUM_LONG = 5;
our $TAG_ENUM_DOUBLE = 6;
our $TAG_ENUM_CLASS_TYPE = 7;
our $TAG_ENUM_STRING = 8;
our $TAG_ENUM_FIELD_REF = 9;
our $TAG_ENUM_METHOD_REF = 10;
our $TAG_ENUM_INTERFACE_METHOD_REF = 11;
our $TAG_ENUM_NAME_AND_TYPE = 12;
our $TAG_ENUM_METHOD_HANDLE = 15;
our $TAG_ENUM_METHOD_TYPE = 16;
our $TAG_ENUM_INVOKE_DYNAMIC = 18;

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

    if (!($self->is_prev_two_entries())) {
        $self->{tag} = $self->{_io}->read_u1();
    }
    if (!($self->is_prev_two_entries())) {
        my $_on = $self->tag();
        if ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_INTERFACE_METHOD_REF) {
            $self->{cp_info} = JavaClass::InterfaceMethodRefCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_CLASS_TYPE) {
            $self->{cp_info} = JavaClass::ClassCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_UTF8) {
            $self->{cp_info} = JavaClass::Utf8CpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_METHOD_TYPE) {
            $self->{cp_info} = JavaClass::MethodTypeCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_INTEGER) {
            $self->{cp_info} = JavaClass::IntegerCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_STRING) {
            $self->{cp_info} = JavaClass::StringCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_FLOAT) {
            $self->{cp_info} = JavaClass::FloatCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_LONG) {
            $self->{cp_info} = JavaClass::LongCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_METHOD_REF) {
            $self->{cp_info} = JavaClass::MethodRefCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_DOUBLE) {
            $self->{cp_info} = JavaClass::DoubleCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_INVOKE_DYNAMIC) {
            $self->{cp_info} = JavaClass::InvokeDynamicCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_FIELD_REF) {
            $self->{cp_info} = JavaClass::FieldRefCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_METHOD_HANDLE) {
            $self->{cp_info} = JavaClass::MethodHandleCpInfo->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $JavaClass::ConstantPoolEntry::TAG_ENUM_NAME_AND_TYPE) {
            $self->{cp_info} = JavaClass::NameAndTypeCpInfo->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub is_two_entries {
    my ($self) = @_;
    return $self->{is_two_entries} if ($self->{is_two_entries});
    $self->{is_two_entries} = ($self->is_prev_two_entries() ? 0 :  (($self->tag() == $JavaClass::ConstantPoolEntry::TAG_ENUM_LONG) || ($self->tag() == $JavaClass::ConstantPoolEntry::TAG_ENUM_DOUBLE)) );
    return $self->{is_two_entries};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub cp_info {
    my ($self) = @_;
    return $self->{cp_info};
}

sub is_prev_two_entries {
    my ($self) = @_;
    return $self->{is_prev_two_entries};
}

########################################################################
package JavaClass::MethodInfo;

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

    $self->{access_flags} = $self->{_io}->read_u2be();
    $self->{name_index} = $self->{_io}->read_u2be();
    $self->{descriptor_index} = $self->{_io}->read_u2be();
    $self->{attributes_count} = $self->{_io}->read_u2be();
    $self->{attributes} = ();
    my $n_attributes = $self->attributes_count();
    for (my $i = 0; $i < $n_attributes; $i++) {
        push @{$self->{attributes}}, JavaClass::AttributeInfo->new($self->{_io}, $self, $self->{_root});
    }
}

sub name_as_str {
    my ($self) = @_;
    return $self->{name_as_str} if ($self->{name_as_str});
    $self->{name_as_str} = @{$self->_root()->constant_pool()}[($self->name_index() - 1)]->cp_info()->value();
    return $self->{name_as_str};
}

sub access_flags {
    my ($self) = @_;
    return $self->{access_flags};
}

sub name_index {
    my ($self) = @_;
    return $self->{name_index};
}

sub descriptor_index {
    my ($self) = @_;
    return $self->{descriptor_index};
}

sub attributes_count {
    my ($self) = @_;
    return $self->{attributes_count};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

########################################################################
package JavaClass::IntegerCpInfo;

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

    $self->{value} = $self->{_io}->read_u4be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package JavaClass::FieldRefCpInfo;

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

    $self->{class_index} = $self->{_io}->read_u2be();
    $self->{name_and_type_index} = $self->{_io}->read_u2be();
}

sub class_as_info {
    my ($self) = @_;
    return $self->{class_as_info} if ($self->{class_as_info});
    $self->{class_as_info} = @{$self->_root()->constant_pool()}[($self->class_index() - 1)]->cp_info();
    return $self->{class_as_info};
}

sub name_and_type_as_info {
    my ($self) = @_;
    return $self->{name_and_type_as_info} if ($self->{name_and_type_as_info});
    $self->{name_and_type_as_info} = @{$self->_root()->constant_pool()}[($self->name_and_type_index() - 1)]->cp_info();
    return $self->{name_and_type_as_info};
}

sub class_index {
    my ($self) = @_;
    return $self->{class_index};
}

sub name_and_type_index {
    my ($self) = @_;
    return $self->{name_and_type_index};
}

1;
