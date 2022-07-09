# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Regf;

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

    $self->{header} = Regf::FileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_hive_bins} = ();
    $self->{hive_bins} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{_raw_hive_bins}}, $self->{_io}->read_bytes(4096);
        my $io__raw_hive_bins = IO::KaitaiStruct::Stream->new($self->{_raw_hive_bins}[-1]);
        push @{$self->{hive_bins}}, Regf::HiveBin->new($io__raw_hive_bins, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub hive_bins {
    my ($self) = @_;
    return $self->{hive_bins};
}

sub _raw_hive_bins {
    my ($self) = @_;
    return $self->{_raw_hive_bins};
}

########################################################################
package Regf::Filetime;

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

    $self->{value} = $self->{_io}->read_u8le();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Regf::HiveBin;

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

    $self->{header} = Regf::HiveBinHeader->new($self->{_io}, $self, $self->{_root});
    $self->{cells} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{cells}}, Regf::HiveBinCell->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub cells {
    my ($self) = @_;
    return $self->{cells};
}

########################################################################
package Regf::HiveBinHeader;

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

    $self->{signature} = $self->{_io}->read_bytes(4);
    $self->{offset} = $self->{_io}->read_u4le();
    $self->{size} = $self->{_io}->read_u4le();
    $self->{unknown1} = $self->{_io}->read_u4le();
    $self->{unknown2} = $self->{_io}->read_u4le();
    $self->{timestamp} = Regf::Filetime->new($self->{_io}, $self, $self->{_root});
    $self->{unknown4} = $self->{_io}->read_u4le();
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub unknown2 {
    my ($self) = @_;
    return $self->{unknown2};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub unknown4 {
    my ($self) = @_;
    return $self->{unknown4};
}

########################################################################
package Regf::HiveBinCell;

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

    $self->{cell_size_raw} = $self->{_io}->read_s4le();
    $self->{identifier} = Encode::decode("ascii", $self->{_io}->read_bytes(2));
    my $_on = $self->identifier();
    if ($_on eq "li") {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->cell_size() - 2) - 4));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Regf::HiveBinCell::SubKeyListLi->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "vk") {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->cell_size() - 2) - 4));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Regf::HiveBinCell::SubKeyListVk->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "lf") {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->cell_size() - 2) - 4));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Regf::HiveBinCell::SubKeyListLhLf->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "ri") {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->cell_size() - 2) - 4));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Regf::HiveBinCell::SubKeyListRi->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "lh") {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->cell_size() - 2) - 4));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Regf::HiveBinCell::SubKeyListLhLf->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "nk") {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->cell_size() - 2) - 4));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Regf::HiveBinCell::NamedKey->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on eq "sk") {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->cell_size() - 2) - 4));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Regf::HiveBinCell::SubKeyListSk->new($io__raw_data, $self, $self->{_root});
    }
    else {
        $self->{data} = $self->{_io}->read_bytes((($self->cell_size() - 2) - 4));
    }
}

sub cell_size {
    my ($self) = @_;
    return $self->{cell_size} if ($self->{cell_size});
    $self->{cell_size} = (($self->cell_size_raw() < 0 ? -1 : 1) * $self->cell_size_raw());
    return $self->{cell_size};
}

sub is_allocated {
    my ($self) = @_;
    return $self->{is_allocated} if ($self->{is_allocated});
    $self->{is_allocated} = $self->cell_size_raw() < 0;
    return $self->{is_allocated};
}

sub cell_size_raw {
    my ($self) = @_;
    return $self->{cell_size_raw};
}

sub identifier {
    my ($self) = @_;
    return $self->{identifier};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Regf::HiveBinCell::SubKeyListVk;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DATA_TYPE_ENUM_REG_NONE = 0;
our $DATA_TYPE_ENUM_REG_SZ = 1;
our $DATA_TYPE_ENUM_REG_EXPAND_SZ = 2;
our $DATA_TYPE_ENUM_REG_BINARY = 3;
our $DATA_TYPE_ENUM_REG_DWORD = 4;
our $DATA_TYPE_ENUM_REG_DWORD_BIG_ENDIAN = 5;
our $DATA_TYPE_ENUM_REG_LINK = 6;
our $DATA_TYPE_ENUM_REG_MULTI_SZ = 7;
our $DATA_TYPE_ENUM_REG_RESOURCE_LIST = 8;
our $DATA_TYPE_ENUM_REG_FULL_RESOURCE_DESCRIPTOR = 9;
our $DATA_TYPE_ENUM_REG_RESOURCE_REQUIREMENTS_LIST = 10;
our $DATA_TYPE_ENUM_REG_QWORD = 11;

our $VK_FLAGS_VALUE_COMP_NAME = 1;

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

    $self->{value_name_size} = $self->{_io}->read_u2le();
    $self->{data_size} = $self->{_io}->read_u4le();
    $self->{data_offset} = $self->{_io}->read_u4le();
    $self->{data_type} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{padding} = $self->{_io}->read_u2le();
    if ($self->flags() == $Regf::HiveBinCell::SubKeyListVk::VK_FLAGS_VALUE_COMP_NAME) {
        $self->{value_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->value_name_size()));
    }
}

sub value_name_size {
    my ($self) = @_;
    return $self->{value_name_size};
}

sub data_size {
    my ($self) = @_;
    return $self->{data_size};
}

sub data_offset {
    my ($self) = @_;
    return $self->{data_offset};
}

sub data_type {
    my ($self) = @_;
    return $self->{data_type};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub value_name {
    my ($self) = @_;
    return $self->{value_name};
}

########################################################################
package Regf::HiveBinCell::SubKeyListLhLf;

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

    $self->{count} = $self->{_io}->read_u2le();
    $self->{items} = ();
    my $n_items = $self->count();
    for (my $i = 0; $i < $n_items; $i++) {
        push @{$self->{items}}, Regf::HiveBinCell::SubKeyListLhLf::Item->new($self->{_io}, $self, $self->{_root});
    }
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package Regf::HiveBinCell::SubKeyListLhLf::Item;

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

    $self->{named_key_offset} = $self->{_io}->read_u4le();
    $self->{hash_value} = $self->{_io}->read_u4le();
}

sub named_key_offset {
    my ($self) = @_;
    return $self->{named_key_offset};
}

sub hash_value {
    my ($self) = @_;
    return $self->{hash_value};
}

########################################################################
package Regf::HiveBinCell::SubKeyListSk;

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

    $self->{unknown1} = $self->{_io}->read_u2le();
    $self->{previous_security_key_offset} = $self->{_io}->read_u4le();
    $self->{next_security_key_offset} = $self->{_io}->read_u4le();
    $self->{reference_count} = $self->{_io}->read_u4le();
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub previous_security_key_offset {
    my ($self) = @_;
    return $self->{previous_security_key_offset};
}

sub next_security_key_offset {
    my ($self) = @_;
    return $self->{next_security_key_offset};
}

sub reference_count {
    my ($self) = @_;
    return $self->{reference_count};
}

########################################################################
package Regf::HiveBinCell::SubKeyListLi;

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

    $self->{count} = $self->{_io}->read_u2le();
    $self->{items} = ();
    my $n_items = $self->count();
    for (my $i = 0; $i < $n_items; $i++) {
        push @{$self->{items}}, Regf::HiveBinCell::SubKeyListLi::Item->new($self->{_io}, $self, $self->{_root});
    }
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package Regf::HiveBinCell::SubKeyListLi::Item;

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

    $self->{named_key_offset} = $self->{_io}->read_u4le();
}

sub named_key_offset {
    my ($self) = @_;
    return $self->{named_key_offset};
}

########################################################################
package Regf::HiveBinCell::NamedKey;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $NK_FLAGS_KEY_IS_VOLATILE = 1;
our $NK_FLAGS_KEY_HIVE_EXIT = 2;
our $NK_FLAGS_KEY_HIVE_ENTRY = 4;
our $NK_FLAGS_KEY_NO_DELETE = 8;
our $NK_FLAGS_KEY_SYM_LINK = 16;
our $NK_FLAGS_KEY_COMP_NAME = 32;
our $NK_FLAGS_KEY_PREFEF_HANDLE = 64;
our $NK_FLAGS_KEY_VIRT_MIRRORED = 128;
our $NK_FLAGS_KEY_VIRT_TARGET = 256;
our $NK_FLAGS_KEY_VIRTUAL_STORE = 512;
our $NK_FLAGS_UNKNOWN1 = 4096;
our $NK_FLAGS_UNKNOWN2 = 16384;

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

    $self->{flags} = $self->{_io}->read_u2le();
    $self->{last_key_written_date_and_time} = Regf::Filetime->new($self->{_io}, $self, $self->{_root});
    $self->{unknown1} = $self->{_io}->read_u4le();
    $self->{parent_key_offset} = $self->{_io}->read_u4le();
    $self->{number_of_sub_keys} = $self->{_io}->read_u4le();
    $self->{number_of_volatile_sub_keys} = $self->{_io}->read_u4le();
    $self->{sub_keys_list_offset} = $self->{_io}->read_u4le();
    $self->{number_of_values} = $self->{_io}->read_u4le();
    $self->{values_list_offset} = $self->{_io}->read_u4le();
    $self->{security_key_offset} = $self->{_io}->read_u4le();
    $self->{class_name_offset} = $self->{_io}->read_u4le();
    $self->{largest_sub_key_name_size} = $self->{_io}->read_u4le();
    $self->{largest_sub_key_class_name_size} = $self->{_io}->read_u4le();
    $self->{largest_value_name_size} = $self->{_io}->read_u4le();
    $self->{largest_value_data_size} = $self->{_io}->read_u4le();
    $self->{unknown2} = $self->{_io}->read_u4le();
    $self->{key_name_size} = $self->{_io}->read_u2le();
    $self->{class_name_size} = $self->{_io}->read_u2le();
    $self->{unknown_string_size} = $self->{_io}->read_u4le();
    $self->{unknown_string} = Encode::decode("ascii", $self->{_io}->read_bytes($self->unknown_string_size()));
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub last_key_written_date_and_time {
    my ($self) = @_;
    return $self->{last_key_written_date_and_time};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub parent_key_offset {
    my ($self) = @_;
    return $self->{parent_key_offset};
}

sub number_of_sub_keys {
    my ($self) = @_;
    return $self->{number_of_sub_keys};
}

sub number_of_volatile_sub_keys {
    my ($self) = @_;
    return $self->{number_of_volatile_sub_keys};
}

sub sub_keys_list_offset {
    my ($self) = @_;
    return $self->{sub_keys_list_offset};
}

sub number_of_values {
    my ($self) = @_;
    return $self->{number_of_values};
}

sub values_list_offset {
    my ($self) = @_;
    return $self->{values_list_offset};
}

sub security_key_offset {
    my ($self) = @_;
    return $self->{security_key_offset};
}

sub class_name_offset {
    my ($self) = @_;
    return $self->{class_name_offset};
}

sub largest_sub_key_name_size {
    my ($self) = @_;
    return $self->{largest_sub_key_name_size};
}

sub largest_sub_key_class_name_size {
    my ($self) = @_;
    return $self->{largest_sub_key_class_name_size};
}

sub largest_value_name_size {
    my ($self) = @_;
    return $self->{largest_value_name_size};
}

sub largest_value_data_size {
    my ($self) = @_;
    return $self->{largest_value_data_size};
}

sub unknown2 {
    my ($self) = @_;
    return $self->{unknown2};
}

sub key_name_size {
    my ($self) = @_;
    return $self->{key_name_size};
}

sub class_name_size {
    my ($self) = @_;
    return $self->{class_name_size};
}

sub unknown_string_size {
    my ($self) = @_;
    return $self->{unknown_string_size};
}

sub unknown_string {
    my ($self) = @_;
    return $self->{unknown_string};
}

########################################################################
package Regf::HiveBinCell::SubKeyListRi;

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

    $self->{count} = $self->{_io}->read_u2le();
    $self->{items} = ();
    my $n_items = $self->count();
    for (my $i = 0; $i < $n_items; $i++) {
        push @{$self->{items}}, Regf::HiveBinCell::SubKeyListRi::Item->new($self->{_io}, $self, $self->{_root});
    }
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package Regf::HiveBinCell::SubKeyListRi::Item;

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

    $self->{sub_key_list_offset} = $self->{_io}->read_u4le();
}

sub sub_key_list_offset {
    my ($self) = @_;
    return $self->{sub_key_list_offset};
}

########################################################################
package Regf::FileHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FILE_TYPE_NORMAL = 0;
our $FILE_TYPE_TRANSACTION_LOG = 1;

our $FILE_FORMAT_DIRECT_MEMORY_LOAD = 1;

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

    $self->{signature} = $self->{_io}->read_bytes(4);
    $self->{primary_sequence_number} = $self->{_io}->read_u4le();
    $self->{secondary_sequence_number} = $self->{_io}->read_u4le();
    $self->{last_modification_date_and_time} = Regf::Filetime->new($self->{_io}, $self, $self->{_root});
    $self->{major_version} = $self->{_io}->read_u4le();
    $self->{minor_version} = $self->{_io}->read_u4le();
    $self->{type} = $self->{_io}->read_u4le();
    $self->{format} = $self->{_io}->read_u4le();
    $self->{root_key_offset} = $self->{_io}->read_u4le();
    $self->{hive_bins_data_size} = $self->{_io}->read_u4le();
    $self->{clustering_factor} = $self->{_io}->read_u4le();
    $self->{unknown1} = $self->{_io}->read_bytes(64);
    $self->{unknown2} = $self->{_io}->read_bytes(396);
    $self->{checksum} = $self->{_io}->read_u4le();
    $self->{reserved} = $self->{_io}->read_bytes(3576);
    $self->{boot_type} = $self->{_io}->read_u4le();
    $self->{boot_recover} = $self->{_io}->read_u4le();
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub primary_sequence_number {
    my ($self) = @_;
    return $self->{primary_sequence_number};
}

sub secondary_sequence_number {
    my ($self) = @_;
    return $self->{secondary_sequence_number};
}

sub last_modification_date_and_time {
    my ($self) = @_;
    return $self->{last_modification_date_and_time};
}

sub major_version {
    my ($self) = @_;
    return $self->{major_version};
}

sub minor_version {
    my ($self) = @_;
    return $self->{minor_version};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub root_key_offset {
    my ($self) = @_;
    return $self->{root_key_offset};
}

sub hive_bins_data_size {
    my ($self) = @_;
    return $self->{hive_bins_data_size};
}

sub clustering_factor {
    my ($self) = @_;
    return $self->{clustering_factor};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub unknown2 {
    my ($self) = @_;
    return $self->{unknown2};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub boot_type {
    my ($self) = @_;
    return $self->{boot_type};
}

sub boot_recover {
    my ($self) = @_;
    return $self->{boot_recover};
}

1;
